const grados = {};

const { getUserDataByToken } = require("../../middlewares/auth");
const pool = require("../../models/db");
const { GenerarMatriculaPorGrado } = require("../../utils/generatePdfHtml");
const { getImgMatricula } = require("../../utils/s3");
const fs = require("fs");
grados.main = async(req, res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisos = JSON.parse(Permisos);
        let { year: yearActivo } = req.params;
        if (!yearActivo) {
            year = await pool.query(
                "SELECT year AS yearActivo FROM year WHERE estado = 1"
            );
            yearActivo = year[0].yearActivo;
        }
        const {
            [0]: years, [1]: grados, [2]: ciclos, [3]: yearToAdd,
        } = await Promise.all([
            pool.query("SELECT year, estado FROM year ORDER BY year DESC"),
            pool.query(
                "SELECT id, nombre , (SELECT Nombre FROM ciclos WHERE id = grados.idCiclo) as ciclo  FROM grados WHERE idYear = ? ", [yearActivo]
            ),
            pool.query("SELECT id, Nombre FROM ciclos"),
            pool.query(
                "SELECT year FROM year WHERE year>=(SELECT year FROM year WHERE estado = 1)"
            ),
        ]);
        res.render("./admin/grados/grados", {
            years,
            grados,
            ciclos,
            yearToAdd,
            yearActivo,
            permisos,
        });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.detalleGrado = async(req, res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisos = JSON.parse(Permisos);

        const { idGrado } = req.params;
        const promesas = [
            pool.query(
                "SELECT nombre , (SELECT Nombre FROM ciclos WHERE id = grados.idCiclo) as ciclo , idYear , (SELECT CONCAT(Nombres, ' ', Apellidos) FROM maestros WHERE id = grados.idMaestro) AS NombreMaestro FROM grados WHERE id = ? ", [idGrado]
            ), // Datos del grado
            pool.query("SELECT Role FROM bimestres WHERE Estado = 1"), // Bimestre activo
            pool.query(
                "SELECT id AS idMateria , (SELECT Nombre FROM modelomaterias WHERE id = materia_grado.idModeloMateria) AS NombreMateria , EstadoAct1 , EstadoAct2 , EstadoAct3 FROM materia_grado WHERE idGrado  = ?", [idGrado]
            ), // Trae todas las materias
            pool.query(
                "SELECT id AS idMaestroMateria , idUnionGradoMateria AS idMateria , (SELECT CONCAT(Nombres, ' ', Apellidos) FROM maestros WHERE id = maestros_materias.idMaestro) AS NombreMaestro  FROM maestros_materias WHERE idGrado  = ?", [idGrado]
            ), // Trae todas los maestros asignados
            pool.query(
                "SELECT Carnet , Nombre , Apellido, grado_alumno.id AS idGradoAlumno FROM alumnos INNER JOIN grado_alumno  ON grado_alumno.idAlumno = alumnos.Carnet  WHERE idGrado = ? GROUP BY Carnet ORDER BY Apellido ASC ", [idGrado]
            ), // Trae todos los alumnos inscritos
        ];
        const {
            [0]: {
                [0]: datosGrado }, [1]: {
                [0]: { Role: bimestreActivo },
            }, [2]: Materias, [3]: Maestros, [4]: Estudiantes,
        } = await Promise.all(promesas);

        const dataFiltrada = [];
        Materias.forEach((materia) => {
            const maestrosArr = [];
            Maestros.forEach((maestro) => {
                if (maestro.idMateria === materia.idMateria) maestrosArr.push(maestro);
            });

            dataFiltrada.push({
                ...materia,
                maestros: maestrosArr,
            });
        });

        res.render("./admin/grados/detalle", {
            datosGrado,
            bimestreActivo,
            dataFiltrada,
            idGrado,
            Estudiantes,
            permisos,
        });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.addNewGrado = async(req, res) => {
    try {
        const { NombreCurso, idCiclo, year } = req.body;
        const { insertId } = await pool.query(
            "INSERT INTO grados(nombre , idCiclo, idYear ) VALUES(? , ? ,? )", [NombreCurso, idCiclo, year]
        );
        res.json({ status: true, insertId });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.assingMateriaGrado = async(req, res) => {
    try {
        const { idGrado, idMateria } = req.body;
        const {
            [0]: { cantidad },
        } = await pool.query(
            "SELECT COUNT(*) AS cantidad FROM materia_grado WHERE idModeloMateria = ?  AND idGrado = ? ", [idMateria, idGrado]
        );
        if (cantidad) return res.json({ status: false, error: "ERROR_EXISTENTE" });
        const { insertId } = await pool.query(
            "INSERT INTO materia_grado(idModeloMateria , idGrado, EstadoAct1 , EstadoAct2 , EstadoAct3 ) VALUES(? , ?  , 1, 1, 1)", [idMateria, idGrado]
        );
        res.json({ status: true, insertId });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.assingMaestroGrado = async(req, res) => {
    try {
        const { idMateria, idMaestro, idGrado } = req.body;

        console.log(req.body);
        const {
            [0]: { cantidad },
        } = await pool.query(
            "SELECT COUNT(*) AS cantidad FROM maestros_materias WHERE idUnionGradoMateria  = ?  AND idMaestro  = ?  AND idGrado = ?", [idMateria, idMaestro, idGrado]
        );
        if (cantidad) return res.json({ status: false, error: "ERROR_EXISTENTE" });
        const { insertId } = await pool.query(
            "INSERT INTO maestros_materias( idUnionGradoMateria , idMaestro, idGrado) VALUES(? , ?  , ?)", [idMateria, idMaestro, idGrado]
        );
        res.json({ status: true, insertId });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.assingEstudiantesGrado = async(req, res) => {
    try {
        const arrayEstudiantes = req.body["idEstudiantes[]"];
        const { idGrado } = req.body;
        const arrPromesas = [];
        if (Array.isArray(arrayEstudiantes)) {
            arrayEstudiantes.forEach((alumno) => {
                arrPromesas.push(
                    pool.query(
                        "INSERT INTO grado_alumno(idGrado, idAlumno , Conducta1, Conducta2, Conducta3, Conducta4) VALUES( ? , ? , 100 , 100 , 100 , 100)", [idGrado, alumno]
                    )
                );
            });
        } else {
            arrPromesas.push(
                pool.query(
                    "INSERT INTO grado_alumno(idGrado, idAlumno , Conducta1, Conducta2, Conducta3, Conducta4) VALUES( ? , ? , 100 , 100 , 100 , 100)", [idGrado, arrayEstudiantes]
                )
            );
        }
        await Promise.all(arrPromesas);
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.edicionIndividual = async(req, res) => {
    try {
        const { idunion, role, status } = req.body;
        console.log(req.body);
        await pool.query(
            `UPDATE materia_grado SET EstadoAct${role} = ? WHERE id = ?  `, [status, idunion]
        );
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.edicionGlobalGrado = async(req, res) => {
    try {
        const { idGrado, role, statoch } = req.body;
        await pool.query(
            `UPDATE materia_grado SET EstadoAct${role} = ? WHERE idGrado = ?  `, [statoch, idGrado]
        );
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.edicionGlobal = async(req, res) => {
    try {
        const { yearActivo, role, statoch } = req.body;
        const grados = await pool.query(" SELECT id FROM grados WHERE idYear = ?", [
            yearActivo,
        ]);
        const promises = [];

        grados.forEach((element) => {
            promises.push(
                pool.query(
                    `UPDATE materia_grado SET EstadoAct${role} = ? WHERE idGrado = ?  `, [statoch, element.id]
                )
            );
        });

        await Promise.all(promises);
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.edit = async(req, res) => {
    try {
        const { codigoInput, id } = req.body;
        await pool.query("UPDATE grados SET nombre = ? WHERE id = ? ", [
            codigoInput,
            id,
        ]);
        res.json({ status: true });
    } catch (error) {
        res.status(400).json({ status: false, error });
    }
};

grados.editGuia = async(req, res) => {
    try {
        const { idGrado, idMaestro } = req.body;
        await pool.query("UPDATE grados SET idMaestro = ? WHERE id = ? ", [
            idMaestro,
            idGrado,
        ]);
        res.json({ status: true });
    } catch (error) {
        res.status(400).json({ status: false, error });
    }
};

grados.generarReporteMatriculaPorGrado = async(req, res) => {
    try {
        const { idGrado } = req.params;

        const info = await pool.query(
            "SELECT grado_alumno.idAlumno, s3Key, data FROM `grado_alumno` INNER JOIN matriculas ON grado_alumno.idAlumno = matriculas.idAlumno WHERE grado_alumno.idGrado = ?", [idGrado]
        );
        const arrImagenPromesas = [];

        info.forEach((element) => {
            arrImagenPromesas.push(getImgMatricula(element.s3Key, element.idAlumno));
        });
        const imagenes = await Promise.all(arrImagenPromesas);

        let dataOrdenada = [];

        info.forEach((element) => {
            const obj = {};
            obj.idAlumno = element.idAlumno;
            obj.data = element.data;
            imagenes.forEach((img) => {
                if (img.idAlumno === element.idAlumno) {
                    obj.path = img.path;
                }
            });
            dataOrdenada.push(obj);
        });

        await GenerarMatriculaPorGrado(dataOrdenada);

        res.json({ status: true });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

grados.openReporteMatricula = (req, res) => {
    const file = fs.readFileSync("./public/files/reporte_matricula_grado.pdf");
    res.contentType("application/pdf");
    res.send(file);
};

module.exports = grados;