const grados = {};

const pool = require("../../models/db");

grados.main = async (req, res) => {
    try {
        let { year: yearActivo } = req.params;
        if (!yearActivo) {
            year = await pool.query("SELECT year AS yearActivo FROM year WHERE estado = 1");
            yearActivo = year[0].yearActivo;
        }
        const {
            [0]: years,
            [1]: grados,
            [2]: ciclos,
            [3]: yearToAdd,
        } = await Promise.all([
            pool.query("SELECT year, estado FROM year ORDER BY year DESC"),
            pool.query(
                "SELECT id, nombre , (SELECT Nombre FROM ciclos WHERE id = grados.idCiclo) as ciclo  FROM grados WHERE idYear = ? ",
                [yearActivo]
            ),
            pool.query("SELECT id, Nombre FROM ciclos"),
            pool.query("SELECT year FROM year WHERE year>=(SELECT year FROM year WHERE estado = 1)"),

        ]);
        res.render("./admin/grados/grados", { years, grados, ciclos , yearToAdd , yearActivo});
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.detalleGrado = async (req, res) => {
    try {
        const { idGrado } = req.params;
        const promesas = [
            pool.query(
                "SELECT nombre , (SELECT Nombre FROM ciclos WHERE id = grados.idCiclo) as ciclo , idYear FROM grados WHERE id = ? ",
                [idGrado]
            ), // Datos del grado
            pool.query("SELECT Role FROM bimestres WHERE Estado = 1"), // Bimestre activo
            pool.query(
                "SELECT id AS idMateria , (SELECT Nombre FROM modelomaterias WHERE id = materia_grado.idModeloMateria) AS NombreMateria , EstadoAct1 , EstadoAct2 , EstadoAct3 FROM materia_grado WHERE idGrado  = ?",
                [idGrado]
            ), // Trae todas las materias
            pool.query(
                "SELECT idUnionGradoMateria AS idMateria , (SELECT CONCAT(Nombres, ' ', Apellidos) FROM maestros WHERE id = maestros_materias.idMaestro) AS NombreMaestro  FROM maestros_materias WHERE idGrado  = ?",
                [idGrado]
            ), // Trae todas los maestros asignados
            pool.query(
                "SELECT Carnet , Nombre , Apellido FROM alumnos INNER JOIN grado_alumno  ON grado_alumno.idAlumno = alumnos.Carnet  WHERE idGrado = ? GROUP BY Carnet",
                [idGrado]
            ), // Trae todos los alumnos inscritos
        ];
        const {
            [0]: { [0]: datosGrado },
            [1]: {
                [0]: { Role: bimestreActivo },
            },
            [2]: Materias,
            [3]: Maestros,
            [4]: Estudiantes,
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
        });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.addNewGrado = async (req, res) => {
    try {
        const { NombreCurso, idCiclo, year } = req.body;
        const { insertId } = await pool.query(
            "INSERT INTO grados(nombre , idCiclo, idYear ) VALUES(? , ? ,? )",
            [NombreCurso, idCiclo, year]
        );
        res.json({ status: true, insertId });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.assingMateriaGrado = async (req, res) => {
    try {
        const { idGrado, idMateria } = req.body;
        const {
            [0]: { cantidad },
        } = await pool.query(
            "SELECT COUNT(*) AS cantidad FROM materia_grado WHERE idModeloMateria = ?  AND idGrado = ? ",
            [idMateria, idGrado]
        );
        if (cantidad) return res.json({ status: false, error: "ERROR_EXISTENTE" });
        const { insertId } = await pool.query(
            "INSERT INTO materia_grado(idModeloMateria , idGrado, EstadoAct1 , EstadoAct2 , EstadoAct3 ) VALUES(? , ?  , 1, 1, 1)",
            [idMateria, idGrado]
        );
        res.json({ status: true, insertId });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.assingMaestroGrado = async (req, res) => {
    try {
        const { idMateria, idMaestro, idGrado } = req.body;

        console.log(req.body);
        const {
            [0]: { cantidad },
        } = await pool.query(
            "SELECT COUNT(*) AS cantidad FROM maestros_materias WHERE idUnionGradoMateria  = ?  AND idMaestro  = ?  AND idGrado = ?",
            [idMateria, idMaestro, idGrado]
        );
        if (cantidad) return res.json({ status: false, error: "ERROR_EXISTENTE" });
        const { insertId } = await pool.query(
            "INSERT INTO maestros_materias( idUnionGradoMateria , idMaestro, idGrado) VALUES(? , ?  , ?)",
            [idMateria, idMaestro, idGrado]
        );
        res.json({ status: true, insertId });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

grados.assingEstudiantesGrado = async (req, res) => {
    try {
        const arrayEstudiantes = req.body["idEstudiantes[]"];
        const { idGrado } = req.body;
        const arrPromesas = [];
        if (Array.isArray(arrayEstudiantes)) {
            arrayEstudiantes.forEach((alumno) => {
                arrPromesas.push(
                    pool.query(
                        "INSERT INTO grado_alumno(idGrado, idAlumno , Conducta1, Conducta2, Conducta3, Conducta4) VALUES( ? , ? , 100 , 100 , 100 , 100)",
                        [idGrado, alumno]
                    )
                );
            });
        } else {
            arrPromesas.push(
                pool.query(
                    "INSERT INTO grado_alumno(idGrado, idAlumno , Conducta1, Conducta2, Conducta3, Conducta4) VALUES( ? , ? , 100 , 100 , 100 , 100)",
                    [idGrado, arrayEstudiantes]
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


grados.edicionIndividual = async (req, res) => {
    try {
        const { idunion, role , status } = req.body;
        console.log(req.body);
        await pool.query(`UPDATE materia_grado SET EstadoAct${role} = ? WHERE id = ?  `, [status, idunion]);
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

module.exports = grados;
