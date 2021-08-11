const conducta = {};
const pool = require("../../models/db");

conducta.main = async (req , res) => {
    try {
        let roleBimestre = req.params;
        if (roleBimestre.roleBimestre == undefined || roleBimestre.roleBimestre === null) {
            roleBimestre = await pool.query("SELECT Role AS roleBimestre FROM bimestres WHERE Estado = 1 ");
            roleBimestre = roleBimestre[0].roleBimestre;
        } else {
            roleBimestre = roleBimestre.roleBimestre;
        }
        const {[0]: {idBimestre}} = await pool.query("SELECT id AS idBimestre FROM bimestres INNER JOIN year ON year.year = bimestres.idYear WHERE year.Estado = 1 AND bimestres.Role= ?", roleBimestre);

        const codigos = await pool.query("SELECT Codigo, valor, Observacion, CONCAT(maestros.Nombres , ' ', maestros.Apellidos) AS NombreMaestro , CONCAT(alumnos.Nombre , ' ', alumnos.Apellido) AS NombreAlumno  FROM codigo_alumno INNER JOIN codigos ON codigo_alumno.idCodigo = codigos.id INNER JOIN maestros ON maestros.id = codigo_alumno.idMaestro INNER JOIN alumnos ON alumnos.Carnet = codigo_alumno.idAlumno WHERE idBimestre = ? ORDER BY valor ASC" ,[ idBimestre]);

        res.render('./admin/conducta/conducta' , {codigos , roleBimestre});
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};

module.exports = conducta;