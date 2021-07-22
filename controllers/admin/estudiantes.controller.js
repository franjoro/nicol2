const estudiantes = {};
const pool = require("../../models/db");

estudiantes.main = async (req , res) => {
    try {
        const alumnos = await pool.query("SELECT * FROM alumnos");
        res.render('./admin/estudiantes/estudiantes' , {alumnos});
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};

estudiantes.addNew = async (req , res) => {
    try {
        const {Carnet, Nombre, Apellido, Genero, FechaNac, Email} = req.body;
        // Validar campos
        if(!Carnet || !Nombre  || !Apellido  || !Genero  || !FechaNac  || !Email  )  return res.json({ status: false, error: "VALUES_NOT_COMPLETED"}).status(400);
        // Validar existencia de carnet
        const cantidadDeCarnets = await pool.query("SELECT COUNT(*) AS cantidad FROM alumnos WHERE Carnet = ? " , [Carnet]); 
        if(cantidadDeCarnets[0].cantidad) return res.json({ status: false, error: "CARNET_EXISTENTE"}).status(400);
        // Enviar consulta
        const {insertId}  = await pool.query("INSERT INTO areas(Nombre) VALUES(?)", [areaNombre]);
        res.json({ status: true, insertId});
    } catch (error) {
        res.json({ status: false, error}).status(400);
    }
};

module.exports = estudiantes;
