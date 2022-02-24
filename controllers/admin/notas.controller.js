const notas = {};
const pool = require("../../models/db");
const { GenerarPdf, GenerarBoletaFinal } = require("../../utils/generatePdfHtml");
const fs = require("fs");
const {
    getConsolidadoBimestralExcel,
} = require("../../utils/reports/reportesNotas");
const { getUserDataByToken } = require("../../middlewares/auth");

notas.main = async(req, res) => {

    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisos = JSON.parse(Permisos);

        let roleBimestre = req.params;
        if (
            roleBimestre.roleBimestre == undefined ||
            roleBimestre.roleBimestre === null
        ) {
            roleBimestre = await pool.query(
                "SELECT Role AS roleBimestre FROM bimestres WHERE Estado = 1 "
            );
            roleBimestre = roleBimestre[0].roleBimestre;
        } else {
            roleBimestre = roleBimestre.roleBimestre;
        }
        const queryPromesas = [
            pool.query(
                "SELECT id AS idBimestre FROM bimestres INNER JOIN year ON year.year = bimestres.idYear WHERE year.Estado = 1 AND bimestres.Role= ?",
                roleBimestre
            ),
            pool.query(
                "SELECT grados.id AS idGrado , grados.nombre AS nombreGrado FROM `grados` INNER JOIN year ON year.year = grados.idYear WHERE year.estado = 1 "
            ),
        ];
        const {
            [0]: {
                [0]: { idBimestre },
            }, [1]: grados,
        } = await Promise.all(queryPromesas);

        res.render("./admin/notas/notas", { roleBimestre, idBimestre, grados, permisos });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

notas.getNotasByAlumnos = async(req, res) => {
    try {
        const { idAlumno, idBimestre } = req.params;

        const {
            [0]: { idGrado },
        } = await pool.query(
            "SELECT grados.id AS idGrado FROM grados INNER JOIN year ON year.year = grados.idYear INNER JOIN grado_alumno ON grado_alumno.idGrado = grados.id WHERE year.estado = 1 AND idAlumno = ? GROUP BY idAlumno", [idAlumno]
        );

        const queryPromesas = [
            pool.query(
                "SELECT actividades.Role AS RoleActivida, acumulados.id AS idAcumulado, acumulados.Descripcion AS tituloAcumulado, acumulados.Porcentaje AS acumuladoPorcentaje, materia_grado.id AS idUnion, notas.Nota AS nota, notas.id AS idNota FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE notas.idAlumno = ? AND materia_grado.idGrado = ? AND Bimestre = ? ORDER BY actividades.Role", [idAlumno, idGrado, idBimestre]
            ),

            pool.query(
                "SELECT materia_grado.id AS idUnion , Nombre FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE idGrado = ? ", [idGrado]
            ),
        ];

        const {
            [0]: notas, [1]: materias /* Select todas las materias de ese grado */ ,
        } = await Promise.all(queryPromesas);
        const dataOrdenada = [];
        materias.forEach((materia) => {
            let obj = {
                idUnion: materia.idUnion,
                Nombre: materia.Nombre,
            };
            const arrNota = [];
            notas.forEach((nota) => {
                if (nota.idUnion == materia.idUnion) {
                    arrNota.push(nota);
                }
            });
            obj.notas = arrNota;
            dataOrdenada.push(obj);
        });
        res.json(dataOrdenada);
        // const util = require('util');
        // console.log(util.inspect(dataOrdenada, false, null, true));
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

// notas.getNotasByAlumnosParvularia = async (req, res) => {
//     try {
//         const { idAlumno, idBimestre } = req.params;
//         const { [0]: { idGrado } } = await pool.query("SELECT grados.id AS idGrado FROM grados INNER JOIN year ON year.year = grados.idYear INNER JOIN grado_alumno ON grado_alumno.idGrado = grados.id WHERE year.estado = 1 AND idAlumno = ? GROUP BY idAlumno", [idAlumno]);

//     } catch (error) {
//         console.log(error);
//         return res.status(400).json({ status: false, error });
//     }
// };

notas.getConsolidadoAnual = async(req, res) => {
    try {
        const { idGrado } = req.params;

        const queryPromesas = [
            /* NOTAS */
            pool.query(
                "SELECT actividades.Role AS RoleActivida, bimestres.Role AS Bimestre, materia_grado.id AS idUnion, notas.Nota AS nota, notas.idAlumno AS idAlumno FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado INNER JOIN bimestres ON bimestres.id = actividades.Bimestre WHERE materia_grado.idGrado = ? ORDER BY actividades.Role;", [idGrado]
            ),
            /* MATERIAS */
            pool.query(
                "SELECT materia_grado.id AS idUnion , Siglas FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE idGrado = ? ", [idGrado]
            ),

            /* ESTUDIANTES */
            pool.query(
                "SELECT idAlumno , (SELECT CONCAT(Apellido,' ',Nombre) AS Nombre FROM alumnos WHERE Carnet = grado_alumno.idAlumno ) AS Nombre, Conducta1, Conducta2, Conducta3, Conducta4 FROM grado_alumno WHERE idGrado = ? ORDER BY Nombre", [idGrado]
            ),
        ];

        const {
            [0]: notas, [1]: materias, [2]: estudiantes /* Select todas las materias de ese grado */ ,
        } = await Promise.all(queryPromesas);
        const dataOrdenada = [];
        estudiantes.forEach((estudiante) => {
            const materiasArr = [];
            let notaPromedio = 0;
            // Marca
            let obj = {
                idAlumno: estudiante.idAlumno,
                nombreAlumno: estudiante.Nombre,
                conducta: (
                    estudiante.Conducta1 * 0.20 +
                    estudiante.Conducta2 * 0.30 +
                    estudiante.Conducta3 * 0.20 +
                    estudiante.Conducta4 * 0.30).toFixed(2)
            };

            materias.forEach((materia) => {
                /* MUESTRA LAS NOTAS SUMADAS POR ROLE */
                let roleOneNota = 0,
                    roleTwo = 0,
                    RoleTree = 0,
                    RoleFour = 0;
                let objInsede = {};
                objInsede.idUnion = materia.idUnion;
                objInsede.Nombre = materia.Siglas;
                // const arrNota = [];
                notas.forEach((nota) => {
                    if (
                        nota.idUnion == materia.idUnion &&
                        nota.idAlumno == estudiante.idAlumno
                    ) {
                        if (nota.Bimestre === 1)
                            roleOneNota = Number(nota.nota) + Number(roleOneNota);
                        if (nota.Bimestre === 2)
                            roleTwo = Number(nota.nota) + Number(roleTwo);
                        if (nota.Bimestre === 3)
                            RoleTree = Number(nota.nota) + Number(RoleTree);
                        if (nota.Bimestre === 4)
                            RoleFour = Number(nota.nota) + Number(RoleFour);
                    }
                });
                const notaGlobal =
                    roleOneNota * 0.2 + roleTwo * 0.3 + RoleTree * 0.2 + RoleFour * 0.3;
                objInsede.notaGlobal = notaGlobal.toFixed(2);
                notaPromedio = notaPromedio + notaGlobal;
                materiasArr.push(objInsede);
            });
            obj.notas = materiasArr;
            obj.notaPromedio = (notaPromedio / materias.length).toFixed(2);
            dataOrdenada.push(obj);
        });


        res.json(dataOrdenada);
        // const util = require('util');
        // console.log(util.inspect(dataOrdenada, false, null, true));
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

notas.getBoletaFinalByAlumno = async(req, res) => {
    try {
        const { idAlumno } = req.params;
        const {
            [0]: { idGrado },
        } = await pool.query(
            "SELECT grados.id AS idGrado FROM grados INNER JOIN year ON year.year = grados.idYear INNER JOIN grado_alumno ON grado_alumno.idGrado = grados.id WHERE year.estado = 1 AND idAlumno = ? GROUP BY idAlumno", [idAlumno]
        );
        const queryPromesas = [
            /* NOTAS */
            pool.query(
                "SELECT actividades.Role AS RoleActivida, actividades.Bimestre AS Bimestre ,materia_grado.id AS idUnion, notas.Nota AS nota, notas.idAlumno AS idAlumno FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE materia_grado.idGrado = ?  ORDER BY actividades.Role", [idGrado]
            ),
            /* MATERIAS */
            pool.query(
                "SELECT materia_grado.id AS idUnion , Nombre FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE idGrado = ? ", [idGrado]
            ),

            /* ESTUDIANTES */
            pool.query(
                "SELECT idAlumno , (SELECT CONCAT(Nombre,' ',Apellido) FROM alumnos WHERE Carnet = grado_alumno.idAlumno ) AS Nombre FROM grado_alumno WHERE idGrado = ? AND  idAlumno  = ? ", [idGrado, idAlumno]
            ),
        ];

        const {
            [0]: notas, [1]: materias, [2]: estudiantes /* Select todas las materias de ese grado */ ,
        } = await Promise.all(queryPromesas);
        const dataOrdenada = [];

        estudiantes.forEach((estudiante) => {
            const materiasArr = [];
            let notaPromedio = 0;
            let obj = {
                idAlumno: estudiante.idAlumno,
                nombreAlumno: estudiante.Nombre,
            };

            materias.forEach((materia) => {
                /* MUESTRA LAS NOTAS SUMADAS POR ROLE */
                let roleOneNota = 0,
                    roleTwo = 0,
                    RoleTree = 0,
                    RoleFour = 0;
                let objInsede = {};
                objInsede.idUnion = materia.idUnion;
                objInsede.Nombre = materia.Nombre;
                const arrNota = [];
                notas.forEach((nota) => {
                    if (
                        nota.idUnion == materia.idUnion &&
                        nota.idAlumno == estudiante.idAlumno
                    ) {
                        if (nota.Bimestre === 1)
                            roleOneNota = Number(nota.nota) + Number(roleOneNota);
                        if (nota.Bimestre === 2)
                            roleTwo = Number(nota.nota) + Number(roleTwo);
                        if (nota.Bimestre === 3)
                            RoleTree = Number(nota.nota) + Number(RoleTree);
                        if (nota.Bimestre === 4)
                            RoleFour = Number(nota.nota) + Number(RoleFour);
                    }
                });
                const notaGlobal =
                    roleOneNota * 0.2 + roleTwo * 0.3 + RoleTree * 0.2 + RoleFour * 0.3;
                arrNota.push({
                    Bimestre: 1,
                    nota: roleOneNota,
                    prom: roleOneNota * 0.2,
                });
                arrNota.push({ Bimestre: 2, nota: roleTwo, prom: roleTwo * 0.3 });
                arrNota.push({ Bimestre: 3, nota: RoleTree, prom: RoleTree * 0.2 });
                arrNota.push({ Bimestre: 4, nota: RoleFour, prom: RoleFour * 0.3 });
                objInsede.notaGlobal = notaGlobal;
                objInsede.notas = arrNota;
                notaPromedio = notaPromedio + notaGlobal;
                materiasArr.push(objInsede);
            });
            obj.notas = materiasArr;
            obj.notaPromedio = notaPromedio / materias.length;
            dataOrdenada.push(obj);
        });
        res.json(dataOrdenada);
        // const util = require('util');
        // console.log(util.inspect(dataOrdenada, false, null, true));
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

notas.getBoletaFinalByGrado = async(req, res) => {
    try {
        const { idGrado, nombreGrado, roleBimestre } = req.params;

        const queryPromesas = [
            /* NOTAS */
            pool.query(
                "SELECT actividades.Role AS RoleActivida, bimestres.Role AS Bimestre, materia_grado.id AS idUnion, notas.Nota AS nota, notas.idAlumno AS idAlumno FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado INNER JOIN bimestres ON bimestres.id = actividades.Bimestre WHERE materia_grado.idGrado = ? ORDER BY actividades.Role;", [idGrado]
            ),
            /* MATERIAS */
            pool.query(
                "SELECT materia_grado.id AS idUnion , Nombre FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE idGrado = ? ", [idGrado]
            ),

            /* ESTUDIANTES */
            pool.query(
                "SELECT idAlumno, ( SELECT CONCAT(Nombre, ' ', Apellido) FROM alumnos WHERE Carnet = grado_alumno.idAlumno ) AS Nombre, Conducta1, Conducta2, Conducta3, Conducta4 FROM grado_alumno WHERE idGrado = ?", [idGrado]
            ),

            /* AÑO */
            pool.query(
                "SELECT idYear FROM grados WHERE id = ?", [idGrado]
            ),
        ];
        const {
            [0]: notas, [1]: materias, [2]: estudiantes, [3]: year,
        } = await Promise.all(queryPromesas);
        const dataOrdenada = [];

        estudiantes.forEach((estudiante) => {
            const materiasArr = [];
            let notaPromedio = 0;
            let obj = {
                idAlumno: estudiante.idAlumno,
                nombreAlumno: estudiante.Nombre,
                Conducta1: { puntaje: estudiante.Conducta1, prom: (estudiante.Conducta1 * 0.20).toFixed(2) },
                Conducta2: { puntaje: estudiante.Conducta2, prom: (estudiante.Conducta2 * 0.30).toFixed(2) },
                Conducta3: { puntaje: estudiante.Conducta3, prom: (estudiante.Conducta3 * 0.20).toFixed(2) },
                Conducta4: { puntaje: estudiante.Conducta4, prom: (estudiante.Conducta4 * 0.30).toFixed(2) },
            };
            materias.forEach((materia) => {
                /* MUESTRA LAS NOTAS SUMADAS POR ROLE */
                let roleOneNota = 0,
                    roleTwo = 0,
                    RoleTree = 0,
                    RoleFour = 0;
                let objInsede = {};
                objInsede.idUnion = materia.idUnion;
                objInsede.Nombre = materia.Nombre;
                const arrNota = [];
                notas.forEach((nota) => {
                    if (
                        nota.idUnion == materia.idUnion &&
                        nota.idAlumno == estudiante.idAlumno
                    ) {

                        if (nota.Bimestre === 1)
                            roleOneNota = parseInt(roleOneNota) + parseInt(nota.nota);
                        if (nota.Bimestre === 2)
                            roleTwo = parseInt(roleTwo) + parseInt(nota.nota);
                        if (nota.Bimestre === 3)
                            RoleTree = parseInt(RoleTree) + parseInt(nota.nota);
                        if (nota.Bimestre === 4)
                            RoleFour = parseInt(RoleFour) + parseInt(nota.nota);
                    }
                });
                const notaGlobal =
                    (roleOneNota * 0.2 + roleTwo * 0.3 + RoleTree * 0.2 + RoleFour * 0.3).toFixed(2);
                arrNota.push({
                    Bimestre: 1,
                    nota: roleOneNota,
                    prom: (roleOneNota * 0.2).toFixed(2),
                });
                arrNota.push({ Bimestre: 2, nota: roleTwo, prom: (roleTwo * 0.3).toFixed(2) });
                arrNota.push({ Bimestre: 3, nota: RoleTree, prom: (RoleTree * 0.2).toFixed(2) });
                arrNota.push({ Bimestre: 4, nota: RoleFour, prom: (RoleFour * 0.3).toFixed(2) });
                objInsede.notaGlobal = notaGlobal;
                objInsede.notas = arrNota;
                notaPromedio = notaPromedio + notaGlobal;
                materiasArr.push(objInsede);
            });
            obj.notas = materiasArr;
            obj.notaPromedio = (notaPromedio / materias.length).toFixed(2);
            dataOrdenada.push(obj);
        });
        await GenerarBoletaFinal(dataOrdenada, nombreGrado, roleBimestre, year[0]);
        res.json({ status: true });
        // const util = require('util');
        // console.log(util.inspect(dataOrdenada, false, null, true));
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

notas.getBoletaBimestral = async(req, res) => {
    try {
        const { idAlumno, idBimestre } = req.params;

        const {
            [0]: { idGrado }
        } = await pool.query("SELECT grados.id AS idGrado FROM grados INNER JOIN year ON year.year = grados.idYear INNER JOIN grado_alumno ON grado_alumno.idGrado = grados.id WHERE year.estado = 1 AND idAlumno = ? GROUP BY idAlumno", [idAlumno]);

        const {
            [0]: { roleBimestre }
        } = await pool.query("SELECT Role AS roleBimestre FROM bimestres WHERE id = ?", [idBimestre]);

        const columm = `Conducta${roleBimestre}`;

        const queryPromesas = [
            /* NOTAS */
            pool.query(
                "SELECT actividades.Role AS RoleActivida, actividades.Role AS Role ,materia_grado.id AS idUnion, notas.Nota AS nota, notas.idAlumno AS idAlumno FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE materia_grado.idGrado = ? AND actividades.Bimestre = ?  ORDER BY actividades.Role", [idGrado, idBimestre]
            ),
            /* MATERIAS */
            pool.query(
                "SELECT materia_grado.id AS idUnion , Nombre FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE idGrado = ? ", [idGrado]
            ),

            /* ESTUDIANTES */
            pool.query(
                `SELECT idAlumno , (SELECT CONCAT(Apellido,' ',Nombre) FROM alumnos WHERE Carnet = grado_alumno.idAlumno ) AS Nombre, ${columm} AS conducta FROM grado_alumno WHERE idGrado = ? AND idAlumno  = ?  ORDER BY Nombre`, [idGrado, idAlumno]
            ),
        ];
        const {
            [0]: notas, [1]: materias, [2]: estudiantes /* Select todas las materias de ese grado */ ,
        } = await Promise.all(queryPromesas);
        const dataOrdenada = [];
        estudiantes.forEach((estudiante) => {
            const materiasArr = [];
            let obj = {
                idAlumno: estudiante.idAlumno,
                nombreAlumno: estudiante.Nombre,
                conducta: estudiante.conducta,
                // MARCA
            };
            materias.forEach((materia) => {
                /* MUESTRA LAS NOTAS SUMADAS POR ROLE */
                let roleOneNota = 0,
                    roleTwo = 0,
                    RoleTree = 0;
                let objInsede = {};
                objInsede.idUnion = materia.idUnion;
                objInsede.Nombre = materia.Nombre;
                const arrNota = [];
                notas.forEach((nota) => {
                    if (
                        nota.idUnion == materia.idUnion &&
                        nota.idAlumno == estudiante.idAlumno
                    ) {
                        if (nota.Role === 1)
                            roleOneNota = Number(nota.nota) + Number(roleOneNota);
                        if (nota.Role === 2) roleTwo = Number(nota.nota) + Number(roleTwo);
                        if (nota.Role === 3)
                            RoleTree = Number(nota.nota) + Number(RoleTree);
                    }
                });
                arrNota.push({ Bimestre: 1, nota: roleOneNota });
                arrNota.push({ Bimestre: 2, nota: roleTwo });
                arrNota.push({ Bimestre: 3, nota: RoleTree });
                objInsede.notas = arrNota;
                objInsede.notaTotal = roleOneNota + roleTwo + RoleTree;
                materiasArr.push(objInsede);
            });
            obj.notas = materiasArr;
            dataOrdenada.push(obj);
        });
        res.json(dataOrdenada);
        // const util = require('util');
        // console.log(util.inspect(dataOrdenada, false, null, true));
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

notas.getConsolidadoBimestral = async(req, res) => {
    try {
        const { idGrado, idBimestre } = req.params;

        // RoleBimestre 
        const {
            [0]: { roleBimestre }
        } = await pool.query("SELECT Role AS roleBimestre FROM bimestres WHERE id = ?", [idBimestre]);


        const columna = `Conducta${roleBimestre}`;

        const queryPromesas = [
            /* NOTAS */
            pool.query(
                "SELECT actividades.Role AS RoleActivida, materia_grado.id AS idUnion, notas.Nota AS nota, notas.idAlumno AS idAlumno FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE materia_grado.idGrado = ? AND Bimestre = ? ORDER BY actividades.Role", [idGrado, idBimestre]
            ),
            /* MATERIAS */
            pool.query(
                "SELECT materia_grado.id AS idUnion , Siglas FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE idGrado = ? ", [idGrado]
            ),

            /* ESTUDIANTES */
            pool.query(
                `SELECT idAlumno, 
      ( SELECT CONCAT(Apellido, ' ', Nombre) FROM alumnos WHERE Carnet = grado_alumno.idAlumno ) AS Nombre,
       ${columna} AS puntaje
        FROM grado_alumno WHERE idGrado = ? GROUP BY idAlumno ORDER BY Nombre;`, [idGrado]
            )
        ];




        const {
            [0]: notas, [1]: materias, [2]: estudiantes, /* Select todas las materias de ese grado */
        } = await Promise.all(queryPromesas);
        const dataOrdenada = [];



        estudiantes.forEach((estudiante, index) => {
            const materiasArr = [];
            let notaPromedio = 0;

            let obj = {
                idAlumno: estudiante.idAlumno,
                nombreAlumno: estudiante.Nombre,
                puntaje: estudiante.puntaje
            };

            materias.forEach((materia) => {
                /* MUESTRA LAS NOTA SUMADA POR MATERIA */
                let objInsede = {};
                objInsede.idUnion = materia.idUnion;
                objInsede.Nombre = materia.Siglas;
                let sumaNota = 0;
                notas.forEach((nota) => {
                    if (
                        nota.idUnion == materia.idUnion &&
                        nota.idAlumno == estudiante.idAlumno
                    ) {
                        sumaNota = Number(nota.nota) + Number(sumaNota);
                    }
                });

                objInsede.nota = sumaNota;
                notaPromedio = notaPromedio + sumaNota;
                materiasArr.push(objInsede);
            });
            obj.notas = materiasArr;
            obj.promedio = (notaPromedio / materias.length).toFixed(2);
            dataOrdenada.push(obj);
        });
        res.json(dataOrdenada);
        // const util = require('util');
        // console.log(util.inspect(dataOrdenada, false, null, true));
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

notas.getConsolidadoBimestralExcel = async(req, res) => {
    try {
        const { idGrado, idBimestre, nombreGrado } = req.params;

        // RoleBimestre 
        const {
            [0]: { roleBimestre }
        } = await pool.query("SELECT Role AS roleBimestre FROM bimestres WHERE id = ?", [idBimestre]);


        const columna = `Conducta${roleBimestre}`;

        const queryPromesas = [
            /* NOTAS */
            pool.query(
                "SELECT actividades.Role AS RoleActivida, materia_grado.id AS idUnion, notas.Nota AS nota, notas.idAlumno AS idAlumno FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE materia_grado.idGrado = ? AND Bimestre = ? ORDER BY actividades.Role", [idGrado, idBimestre]
            ),
            /* MATERIAS */
            pool.query(
                "SELECT materia_grado.id AS idUnion , Siglas FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE idGrado = ? ", [idGrado]
            ),

            /* ESTUDIANTES */
            pool.query(
                `SELECT idAlumno , (SELECT CONCAT(Apellido,' ',Nombre) FROM alumnos WHERE Carnet = grado_alumno.idAlumno ) AS Nombre, ${columna} AS conducta FROM grado_alumno WHERE idGrado = ? GROUP BY idAlumno  ORDER BY Nombre `, [idGrado]
            )
        ];
        const {
            [0]: notas, [1]: materias, [2]: estudiantes /* Select todas las materias de ese grado */
        } = await Promise.all(queryPromesas);
        const dataOrdenada = [];


        estudiantes.forEach((estudiante, index) => {
            const materiasArr = [];
            let notaPromedio = 0;

            let obj = {
                idAlumno: estudiante.idAlumno,
                nombreAlumno: estudiante.Nombre,
                puntaje: estudiante.conducta
            };

            materias.forEach((materia) => {
                /* MUESTRA LAS NOTA SUMADA POR MATERIA */
                let objInsede = {};
                objInsede.idUnion = materia.idUnion;
                objInsede.Nombre = materia.Siglas;
                let sumaNota = 0;
                notas.forEach((nota) => {
                    if (
                        nota.idUnion == materia.idUnion &&
                        nota.idAlumno == estudiante.idAlumno
                    ) {
                        sumaNota = Number(nota.nota) + Number(sumaNota);
                    }
                });

                objInsede.nota = sumaNota;
                notaPromedio = notaPromedio + sumaNota;
                materiasArr.push(objInsede);
            });
            obj.notas = materiasArr;
            obj.promedio = (notaPromedio / materias.length).toFixed(2);
            dataOrdenada.push(obj);
        });


        const excelStatus = await getConsolidadoBimestralExcel(dataOrdenada, roleBimestre, nombreGrado);
        res.json({ status: true, path: excelStatus });
        // const util = require('util');
        // console.log(util.inspect(dataOrdenada, false, null, true));
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

notas.generateFichaByHtml = async(req, res) => {
    try {
        const { html, header, landscape, observaciones } = req.body;
        const pdf = await GenerarPdf(html, header, landscape, observaciones);
        console.log(pdf);
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

notas.updateNota = async(req, res) => {
    try {
        const { id, nota } = req.body;
        await pool.query("UPDATE notas SET Nota = ? WHERE id = ? ", [nota, id]);
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};


notas.getNombreGradoPorIdAlumno = async(req, res) => {
    try {
        const { idAlumno } = req.params;
        const {
            [0]: { nombreGrado }
        } = await pool.query("SELECT grados.nombre AS nombreGrado FROM grado_alumno INNER JOIN grados ON grado_alumno.idGrado = grados.id WHERE grado_alumno.idAlumno = ? AND grados.idYear = (SELECT year FROM year WHERE year.estado = 1); ", [idAlumno]);
        console.log(nombreGrado);
        res.json({ nombreGrado });


    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

notas.openFile = (req, res) => {
    const file = fs.readFileSync("./public/files/ficha.pdf");
    res.contentType("application/pdf");
    res.send(file);
};

notas.openReporte = (req, res) => {
    const file = fs.readFileSync("./public/files/boletaFinal.pdf");
    res.contentType("application/pdf");
    res.send(file);
};

notas.download = (req, res) => {
    try {
        const { nameFile } = req.params;
        console.log(nameFile);
        const file = "./public/files/tmp/" + nameFile;
        res.download(file); // Set disposition and send it.
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

module.exports = notas;