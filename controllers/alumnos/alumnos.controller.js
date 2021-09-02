const { getUserDataByToken } = require("../../middlewares/auth");

const alumnos = {};

const pool = require("../../models/db");


alumnos.main = async (req, res) => {
    try {
        const { identificador } = getUserDataByToken(req.cookies.token).data;
        let roleBimestre = req.params;
        if (roleBimestre.roleBimestre == undefined || roleBimestre.roleBimestre === null) {
            roleBimestre = await pool.query("SELECT Role AS roleBimestre FROM bimestres WHERE Estado = 1 ");
            roleBimestre = roleBimestre[0].roleBimestre;
        } else {
            roleBimestre = roleBimestre.roleBimestre;
        }
        const {[0]: {idBimestre}} = await pool.query("SELECT id AS idBimestre FROM bimestres INNER JOIN year ON year.year = bimestres.idYear WHERE year.Estado = 1 AND bimestres.Role= ?", roleBimestre);


        const arrPromesas = [
            pool.query(`SELECT grado_alumno.Conducta${roleBimestre} AS puntaje , grados.id AS idGrado , nombre AS nombreGrado, (SELECT Nombre FROM alumnos WHERE Carnet = idAlumno ) AS Nombre, (SELECT Apellido FROM alumnos WHERE Carnet = idAlumno ) AS Apellido FROM grados INNER JOIN year ON year.year = grados.idYear INNER JOIN grado_alumno ON grado_alumno.idGrado = grados.id WHERE year.estado = 1 AND idAlumno = ? GROUP BY idAlumno `, [identificador]), // dataAlumno

            pool.query("SELECT Codigo, valor, Observacion FROM codigo_alumno INNER JOIN codigos ON codigo_alumno.idCodigo = codigos.id WHERE idAlumno = ? AND idBimestre = ? ORDER BY valor ASC" ,[identificador, idBimestre]), // Codigos aplicados

            pool.query("SELECT CONCAT(Nombres, ' ', Apellidos ) AS NombreMaestro, descripcion FROM observaciones INNER JOIN maestros ON observaciones.idMaestro = maestros.id WHERE idAlumno = ? AND idBimestre = ? " ,[identificador, idBimestre]) // Codigos aplicados
        ];

        const {[0]: {[0]: dataAlumno} , [1]: codigosAplicados , [2]: observaciones }  = await Promise.all(arrPromesas);

        if(!dataAlumno) res.json({ErrorStatus:"ALUMNO NO INSCRITO EN GRADO ACTIVO"});
        dataAlumno.carnet = identificador;




        res.render('./alumnos/main', {dataAlumno, codigosAplicados, observaciones , roleBimestre , idBimestre});
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};


module.exports = alumnos;
