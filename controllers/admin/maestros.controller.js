const maestros = {};
const pool = require("../../models/db");
const {adddUsuarioFunction} = require('./usuarios.controller');

maestros.main = async (req , res) => {
    try {
        res.render('./admin/maestros/maestros');
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};

maestros.loadTable = async (req, res) => {
    const data = await pool.query("SELECT  Nombres, Apellidos, FechaNac, Email , IF(Genero=0 , 'Hombre', 'Mujer') AS Genero FROM maestros ");
    res.json({ data });
};


maestros.addNew = async (req , res) => {
    try {
        const {Nombre, Apellido, Genero, FechaNac, Email} = req.body;
        // Validar campos
        if(!Nombre  || !Apellido  || !Genero  || !FechaNac  || !Email  )  return res.json({ status: false, error: "VALUES_NOT_COMPLETED"}).status(400);
        // Validar existencia de Email
        const {[0] : {cantidad}} = await pool.query("SELECT COUNT(*) AS cantidad FROM maestros WHERE Email = ? " , [Email]); 
        if(cantidad) return res.status(400).json({ status: false, error: "CORREO_EXISTENTE"});
        // Validar existencia de usuario 
        const {[0] : {cantidadU}} = await pool.query("SELECT COUNT(*) AS cantidadU FROM usuarios WHERE Username = ? " , [Email]); 
        if(cantidadU) return res.status(400).json({ status: false, error: "CORREO_EXISTENTE"});
        // Enviar consulta
        const {insertId}  = await pool.query("INSERT INTO maestros(Nombres , Apellidos, Genero , FechaNac , Email) VALUES(?,?,?,?,?)", [Nombre, Apellido, Genero, FechaNac , Email]);
        adddUsuarioFunction({user: Email, passwordPlain: Email , role: 3, permisos: JSON.stringify({allPermisos : false, matricula: false}) });
        res.json({ status: true, insertId});
    } catch (error) {
        res.json({ status: false, error}).status(400);
    }
};

module.exports = maestros;
