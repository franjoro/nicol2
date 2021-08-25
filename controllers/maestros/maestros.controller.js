const { getUserDataByToken } = require("../../middlewares/auth");
// const { sendEmail } = require("../../utils/mailer");
const pool = require("../../models/db");
const { upload } = require("../../utils/s3");
const { adddUsuarioFunction } = require("../admin/usuarios.controller");

const maestros = {};


maestros.main = (req, res) => {
    const { Permisos } = getUserDataByToken(req.cookies.token).data;
    const permisosSend = JSON.parse(Permisos);
    res.render('./maestros/main', { permisosSend });
};



maestros.blank = (req, res) => {
    res.render('./maestros/blank');
};



maestros.conducta = async (req, res) => {
    try {
        const { identificador, Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);

        // const asignaciones = await pool.query("SELECT modelomaterias.Nombre , (SELECT nombre FROM grados WHERE id = materia_grado.idGrado ) AS Grado , materia_grado.idGrado AS idGrado FROM maestros_materias INNER JOIN materia_grado ON idUnionGradoMateria = materia_grado.id INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE maestros_materias.idMaestro = ?", [identificador]);
        const asignaciones = await pool.query("SELECT idGrado , nombre FROM grados INNER JOIN maestros_materias ON maestros_materias.idGrado = grados.id WHERE idMaestro = ? GROUP BY nombre", [identificador]);
        res.render('./maestros/conducta', { asignaciones, permisosSend });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};



maestros.conductaAlumnos = async (req, res) => {
    try {
        const { identificador, Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);

        const { idGrado } = req.params;
        const arrayPromesas = [
            await pool.query("SELECT Nombre FROM grados WHERE id = ?", [idGrado]),// Obtiene el nombre del grado;
            await pool.query("SELECT idAlumno, Nombre, Apellido FROM alumnos INNER JOIN grado_alumno ON grado_alumno.idAlumno = alumnos.Carnet  WHERE  grado_alumno.idGrado = ? GROUP BY Carnet", [idGrado]), // Obtiene los alumnos;
            await pool.query("SELECT id, Codigo , valor , IF(valor >0 , 'success' , 'danger') AS color FROM codigos ORDER BY valor") // Obtiene todos los códigos existentes
        ];
        const { [0]: { [0]: { Nombre } }, [1]: alumnos, [2]: codigos } = await Promise.all(arrayPromesas);
        res.render('./maestros/alumnosConducta', { Nombre, alumnos, codigos, identificador, idGrado, permisosSend });

    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};



maestros.addCodigo = async (req, res) => {
    try {
        const { identificador } = getUserDataByToken(req.cookies.token).data;
        const { idCodigo, idAlumno, descripcion, idGrado } = req.body;
        const { [0]: { id, Role } } = await pool.query("SELECT id , Role FROM bimestres WHERE Estado = 1");
        const { [0]: { valor } } = await pool.query("SELECT valor FROM codigos WHERE id = ?", idCodigo);
        const columna = `Conducta${Role}`;

        const promesas = [
            pool.query("INSERT INTO codigo_alumno(idCodigo, idAlumno , idMaestro , idBimestre , Observacion) VALUES(?,?,?,?,?)", [
                idCodigo, idAlumno, identificador, id, descripcion
            ]),
            pool.query(`UPDATE grado_alumno SET ${columna} = (${columna} + ? ) WHERE idGrado = ? AND idAlumno = ? `, [
                valor, idGrado, idAlumno
            ]),
        ];

        await Promise.all(promesas);

        res.json({ status: true });


        // sendEmail('fral_98@outlook.com', 'Código de conducta aplicado' , '', '<h1>CODIGO DE CONDUCATA APLICADO</h1>');
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};


maestros.addObservacion = async (req, res) => {
    try {
        const { identificador } = getUserDataByToken(req.cookies.token).data;
        const { idAlumno, descripcion } = req.body;
        const { [0]: { id } } = await pool.query("SELECT id FROM bimestres WHERE Estado = 1");

        const promesas = [
            pool.query("INSERT INTO observaciones(  idMaestro , idAlumno , idBimestre , descripcion ) VALUES(?,?,?,?)", [
                identificador, idAlumno, id, descripcion
            ])
        ];

        await Promise.all(promesas);

        res.json({ status: true });


        // sendEmail('fral_98@outlook.com', 'Código de conducta aplicado' , '', '<h1>CODIGO DE CONDUCATA APLICADO</h1>');
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};



maestros.perfil = async (req, res) => {
    try {
        const { identificador, Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);

        const asignaciones = await pool.query("SELECT modelomaterias.Nombre , (SELECT nombre FROM grados WHERE id = materia_grado.idGrado ) AS Grado , materia_grado.idGrado AS idGrado , materia_grado.id AS idUnion  FROM maestros_materias INNER JOIN materia_grado ON idUnionGradoMateria = materia_grado.id INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE maestros_materias.idMaestro = ?", [identificador]);
        res.render('./maestros/perfilAcademico', { asignaciones, permisosSend });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};


maestros.perfilActividades = async (req, res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);

        const { idUnion } = req.params;
        const { [0]: { id, Role, idYear } } = await pool.query("SELECT id, Role, idYear FROM bimestres WHERE Estado = 1");
        const { [0]: dataGradoMateria } = await pool.query("SELECT (SELECT Nombre FROM grados WHERE id = idGrado) AS Grado , (SELECT Nombre FROM modelomaterias WHERE id = idModeloMateria) AS Materia FROM materia_grado WHERE id = ?", [idUnion]);
        const arrayPromesas = [];
        for (let index = 1; index <= 3; index++) {
            arrayPromesas.push(
                pool.query(`SELECT COUNT(*) AS cantidad , actividades.id AS idActividad   FROM actividades RIGHT JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE Role = ? AND Bimestre = ?  AND  unionMateriaGrado  = ? `, [index, id, idUnion])
            );

        }
        const actividades = await Promise.all(arrayPromesas);
        const { [0]: bloqueos } = await pool.query(`SELECT  EstadoAct1, EstadoAct2, EstadoAct3 FROM materia_grado WHERE id= ? `, [idUnion]);
        res.render('./maestros/perfilAcademicoActividades', { Role, idYear, actividades, bloqueos, idUnion, dataGradoMateria, permisosSend });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};


maestros.addPerfilView = async (req, res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);

        const { idUnion, Role } = req.params;
        let textoRole = "";
        if (Role == 1) textoRole = "Actividad 1 (30%)";
        if (Role == 2) textoRole = "Actividad 2 (30%)";
        if (Role == 3) textoRole = "Examen (40%)";
        res.render('./maestros/perfilAcademicoAdd', { idUnion, Role, textoRole, permisosSend });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};



maestros.addPerfil = async (req, res) => {
    try {

        const { identificador } = getUserDataByToken(req.cookies.token).data;
        const { idUnion, Role } = req.params;
        const { titulo, descripcion, cantidadAcumulados } = req.body;
        const { [0]: { id } } = await pool.query("SELECT id FROM bimestres WHERE Estado = 1");
        const { insertId } = await pool.query("INSERT INTO actividades(Titulo, Descripcion , Role, Bimestre, idMaestro, unionMateriaGrado ) VALUES(?,?,?,?,?,?)", [
            titulo,
            descripcion,
            Role,
            id,
            identificador,
            idUnion
        ]);
        const arrayAcumulados = req.body["acumulados[]"];
        const arraValor = req.body["valor[]"];
        const arrPromesas = [];
        console.log(req.body);
        for (let index = 0; index < cantidadAcumulados; index++) {
            arrPromesas.push(
                pool.query("INSERT INTO acumulados(Descripcion , Porcentaje, idActividad) VALUES(?,?,?) ", [arrayAcumulados[index], arraValor[index], insertId])
            );
        }
        await Promise.all(arrPromesas);
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};



maestros.notasViewMain = async (req, res) => {
    try {
        const { identificador, Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);

        const asignaciones = await pool.query("SELECT modelomaterias.Nombre , (SELECT nombre FROM grados WHERE id = materia_grado.idGrado ) AS Grado , materia_grado.idGrado AS idGrado , materia_grado.id AS idUnion  FROM maestros_materias INNER JOIN materia_grado ON idUnionGradoMateria = materia_grado.id INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE maestros_materias.idMaestro = ?", [identificador]);
        res.render('./maestros/mainNotas', { asignaciones, permisosSend });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};


maestros.notasActividades = async (req, res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);

        const { idUnion } = req.params;
        const { [0]: { id, Role, idYear } } = await pool.query("SELECT id, Role, idYear FROM bimestres WHERE Estado = 1");
        const { [0]: dataGradoMateria } = await pool.query("SELECT (SELECT Nombre FROM grados WHERE id = idGrado) AS Grado , (SELECT Nombre FROM modelomaterias WHERE id = idModeloMateria) AS Materia FROM materia_grado WHERE id = ?", [idUnion]);
        const arrayPromesas = [];
        for (let index = 1; index <= 3; index++) {
            arrayPromesas.push(
                pool.query(`SELECT COUNT(*) AS cantidad , actividades.id AS idActividad   FROM actividades RIGHT JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE Role = ? AND Bimestre = ?  AND  unionMateriaGrado  = ? `, [index, id, idUnion])
            );
        }
        const actividades = await Promise.all(arrayPromesas);
        const { [0]: bloqueos } = await pool.query(`SELECT  EstadoAct1, EstadoAct2, EstadoAct3 FROM materia_grado WHERE id= ? `, [idUnion]);
        res.render('./maestros/notasActividades', { Role, idYear, actividades, bloqueos, idUnion, dataGradoMateria, permisosSend });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};




maestros.notasAlumnos = async (req, res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);

        const { [0]: { id } } = await pool.query("SELECT id FROM bimestres WHERE Estado = 1");
        const { idUnion, Role } = req.params;
        const { [0]: dataGradoMateria } = await pool.query("SELECT idGrado, (SELECT Nombre FROM grados WHERE id = idGrado) AS Grado , (SELECT Nombre FROM modelomaterias WHERE id = idModeloMateria) AS Materia FROM materia_grado WHERE id = ?", [idUnion]);
        const arrPromesas = [
            pool.query("SELECT actividades.id AS idActividad, Titulo, COUNT(acumulados.id) AS cantidad FROM actividades INNER JOIN acumulados ON acumulados.idActividad = actividades.id  WHERE unionMateriaGrado = ? AND Role = ? AND Bimestre = ?", [idUnion, Role, id]), // Obtiene información de la actividad
            pool.query("SELECT Carnet, Nombre, Apellido FROM alumnos INNER JOIN grado_alumno ON grado_alumno.idAlumno = alumnos.Carnet WHERE idGrado = ? GROUP BY Carnet ", [dataGradoMateria.idGrado]), // Obtiene alumnos del grado
        ];
        const { [0]: { [0]: { Titulo, cantidad, idActividad } }, [1]: alumnos } = await Promise.all(arrPromesas);
        const acumulados = await pool.query("SELECT id, Porcentaje FROM acumulados WHERE idActividad = ? ", [idActividad]);
        const notasAcumulados = await pool.query("SELECT notas.id AS idNota , Nota, idAlumno, acumulados.id AS idAcumulado, Porcentaje FROM notas INNER JOIN acumulados ON acumulados.id = notas.idAcumulado WHERE acumulados.idActividad = ? ", [idActividad]);
        const dataOrdenada = [];
        alumnos.forEach(alumno => {

            const arrExist = [];
            const arrIdNota = [];
            acumulados.forEach(() => {
                arrExist.push(false);
                arrIdNota.push(false);
            });
            let notaObtenida = {};
            notaObtenida.Nota = [];
            notaObtenida.Nombre = alumno.Nombre;
            notaObtenida.Apellido = alumno.Apellido;
            notaObtenida.Carnet = alumno.Carnet;
            notaObtenida.isExist = arrExist;
            notaObtenida.idNota = arrIdNota;
            if (notasAcumulados.length) {
                const arrNota = [];
                const arrIdNota = [];
                const arrExist = [];
                const boolean = [];
                notasAcumulados.some((notaElement) => {
                    if (notaElement.idAlumno == alumno.Carnet) {
                        arrNota.push(notaElement.Nota);
                        arrIdNota.push(notaElement.idNota);
                        arrExist.push(true);
                        boolean.push(true);
                    }
                    boolean.push(false);
                });


                if (boolean.includes(true)) {
                    console.log("entra");
                    if (acumulados.length != arrNota.length) {
                        for (let index = (arrNota.length + 1); index <= acumulados.length; index++) {
                            arrNota.push(0);
                            arrIdNota.push(false);
                            arrExist.push(false);
                        }
                    }
                    notaObtenida.Nota = arrNota;
                    notaObtenida.isExist = arrExist;
                    notaObtenida.idNota = arrIdNota;
                } else {
                    const arrNota = [];

                    acumulados.forEach(() => {
                        arrNota.push(0);
                    });
                    notaObtenida.Nota = arrNota;
                }
            } else {
                const arrNota = [];
                acumulados.forEach(() => {
                    arrNota.push(0);
                });
                notaObtenida.Nota = arrNota;
            }
            dataOrdenada.push(notaObtenida);
        });
        // console.log(notasAcumulados);
        res.render('./maestros/notasAlumnos', { Role, idUnion, dataGradoMateria, Titulo, cantidad, dataOrdenada, acumulados, permisosSend });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};



maestros.notasAdd = async (req, res) => {
    try {
        const { data } = req.body;
        const arrdata = JSON.parse(data);
        const arrQueries = [];

        arrdata.forEach(valores => {
            if (valores.exist) {
                arrQueries.push(
                    pool.query("UPDATE notas SET Nota = ? WHERE id=? AND idAlumno  = ? AND idAcumulado = ?", [valores.nota, valores.idnota, valores.alumno, valores.idacumulado])
                );
            } else {
                arrQueries.push(
                    pool.query("INSERT INTO notas(Nota,idAlumno, idAcumulado) VALUES(?,?,?)", [valores.nota, valores.alumno, valores.idacumulado])
                );
            }
        });

        await Promise.all(arrQueries);


        res.json({ status: true });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};



maestros.matriculaView = async (req, res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);
        if (!permisosSend.matricula) return res.send("NOT_ALLOWED");
        const { [0]: { year } } = await pool.query("SELECT (year + 1 ) AS year FROM year WHERE estado = 1 ");
        const grados = await pool.query("SELECT id, nombre FROM grados WHERE idYear = ?", [year]);


        res.render('./maestros/matricula', { permisosSend, year, grados });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};


maestros.matriculaRegtistro = async (req, res) => {
    try {
        const { carnet, idYear, idGrado, Nombres, Apellidos, Sexo, FechaNac, EmailMain } = req.body;

        const promesas = [];
        const { [0]: { cantidad } } = await pool.query("SELECT COUNT(*) AS cantidad FROM alumnos WHERE Carnet = ? ", [carnet]);
        if (cantidad) {
            //Alumno existente
            promesas.push(
               /* Registro de matricula*/  pool.query("INSERT INTO matriculas(idAlumno, idYear, s3Key, data) VALUES (?,?,' ', ?) ", [
                carnet, idYear, JSON.stringify(req.body)
            ]),
               /* Registro de alumno en grado */  pool.query("INSERT INTO grado_alumno(idGrado, idAlumno, Conducta1, Conducta2, Conducta3, Conducta4) VALUES(?, ?, 100 , 100 ,100 , 100) ", [idGrado, carnet])
            );
        } else {
            // Alumno no existe

            await pool.query("INSERT INTO alumnos(Carnet, Nombre , Apellido, Genero , FechaNac , Email) VALUES(?,?,?,?,?,?)", [carnet, Nombres, Apellidos, Sexo, FechaNac, EmailMain]);
            adddUsuarioFunction({ user: carnet, passwordPlain: carnet, role: 2 });

            promesas.push(
                /* Registro de matricula*/  pool.query("INSERT INTO matriculas(idAlumno, idYear, s3Key, data) VALUES (?,?,' ', ?) ", [
                carnet, idYear, JSON.stringify(req.body)
            ]),
                /* Registro de alumno en grado */  pool.query("INSERT INTO grado_alumno(idGrado, idAlumno, Conducta1, Conducta2, Conducta3, Conducta4) VALUES(?, ?, 100 , 100 ,100 , 100) ", [idGrado, carnet])
            );
        }
        const { [0]: { insertId } } = await Promise.all(promesas);

        res.json({ status: true , insertId});
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};



maestros.getDataAlumno = async (req, res) => {
    try {
        const { carnet } = req.params;
        const data = await pool.query("SELECT * FROM alumnos WHERE Carnet = ?", [carnet]);
        res.json(data);
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};


maestros.uploadImg = async (req, res) => {
    try {
        const { idAlumno, idMatricula } = req.body;
        const ext = formatExtension(req.files.imagen.name.split("."));
        const fileContent = Buffer.from(req.files.imagen.data, "binary");
        const s3key = await upload(fileContent, `alumnos/${idAlumno}/${Date.now()}.${ext}`);
        await pool.query("UPDATE matriculas SET s3Key = ? WHERE id = ?" , [s3key.key, idMatricula]);
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};


const formatExtension = (ext) => {
    ext = ext[ext.length - 1].toLowerCase();
    if (ext == "jpg") ext = "jpeg";
    return ext;
};

module.exports = maestros;
