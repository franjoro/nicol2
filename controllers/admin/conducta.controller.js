const conducta = {};
const { getUserDataByToken } = require("../../middlewares/auth");
const pool = require("../../models/db");

conducta.main = async (req, res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisos = JSON.parse(Permisos);

        
        let roleBimestre = req.params;
        if (roleBimestre.roleBimestre == undefined || roleBimestre.roleBimestre === null) {
            roleBimestre = await pool.query("SELECT Role AS roleBimestre FROM bimestres WHERE Estado = 1 ");
            roleBimestre = roleBimestre[0].roleBimestre;
        } else {
            roleBimestre = roleBimestre.roleBimestre;
        }
        const { [0]: { idBimestre } } = await pool.query("SELECT id AS idBimestre FROM bimestres INNER JOIN year ON year.year = bimestres.idYear WHERE year.Estado = 1 AND bimestres.Role= ?", roleBimestre);

        const codigos = await pool.query(`SELECT codigo_alumno.id AS idCodigoAlumno, idCodigo, Carnet, Codigo, valor, Observacion, DATE_FORMAT(DATE, '%d/%m/%Y') AS Date, grados.nombre AS nombreGrado , CONCAT( maestros.Nombres, ' ', maestros.Apellidos ) AS NombreMaestro, CONCAT( alumnos.Nombre, ' ', alumnos.Apellido ) AS NombreAlumno, grados.nombre FROM codigo_alumno INNER JOIN grado_alumno ON grado_alumno.idAlumno = codigo_alumno.idAlumno INNER JOIN grados ON grados.id = grado_alumno.idGrado INNER JOIN codigos ON codigo_alumno.idCodigo = codigos.id INNER JOIN maestros ON maestros.id = codigo_alumno.idMaestro INNER JOIN alumnos ON alumnos.Carnet = codigo_alumno.idAlumno WHERE idBimestre = ? ORDER BY valor ASC`, [idBimestre]);

        res.render('./admin/conducta/conducta', { codigos, roleBimestre , permisos});
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};



conducta.delete = async (req, res) => {
    try {
        const { codigo, carnet, idcodigoalumno} = req.body;
        const { [0]: { valor } } = await pool.query(`
            SELECT 
                valor
            FROM codigos WHERE 
                id = ?
        `, [codigo]);
        const numneg = valor * -1;

        const { [0]: { Role } } = await pool.query(`
        SELECT 
           Role
        FROM bimestres 
        WHERE idYear = (SELECT year FROM year WHERE estado = 1) AND Estado = 1;
    `, [codigo]);

        const columna = `Conducta${Role}`;
        await pool.query(`UPDATE grado_alumno SET ${columna} = ${columna} + ${numneg} WHERE idAlumno = ? ` , [carnet]); 
        await pool.query(`DELETE FROM codigo_alumno WHERE id = ? ` , [idcodigoalumno]); 

        res.json({ status: true });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

module.exports = conducta;