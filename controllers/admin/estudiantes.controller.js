const estudiantes = {};
const pool = require("../../models/db");
const { getImgMatricula } = require("../../utils/s3");
const {adddUsuarioFunction} = require('./usuarios.controller');

estudiantes.main = async (req , res) => {
    try {
        res.render('./admin/estudiantes/estudiantes');
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};


estudiantes.getMatriculas = async (req , res) => {
    try {
        const {idAlumno} = req.params;

        const {[0]: {Nombre, Apellido}} = await pool.query("SELECT Nombre, Apellido FROM alumnos WHERE Carnet = ? ", [idAlumno]);
        const matriculas = await pool.query("SELECT id, idYear FROM matriculas WHERE idAlumno = ? ", [idAlumno]);


        console.log(matriculas);

        res.render('./admin/estudiantes/matriculas', {Nombre, Apellido , matriculas});
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};


estudiantes.loadTable = async (req, res) => {
    const data = await pool.query("SELECT Carnet, Nombre, Apellido, FechaNac, Email , IF(Genero=0 , 'Hombre', 'Mujer') AS Genero FROM alumnos ");
    res.json({ data });
};


estudiantes.addNew = async (req , res) => {
    try {
        const {Carnet, Nombre, Apellido, Genero, FechaNac, Email} = req.body;
        // Validar campos
        if(!Carnet || !Nombre  || !Apellido  || !Genero  || !FechaNac  || !Email  )  return res.json({ status: false, error: "VALUES_NOT_COMPLETED"}).status(400);
        // Validar existencia de carnet
        const {[0] : {cantidad}} = await pool.query("SELECT COUNT(*) AS cantidad FROM alumnos WHERE Carnet = ? " , [Carnet]); 
        if(cantidad) return res.status(400).json({ status: false, error: "CARNET_EXISTENTE"});
        // Validar existencia de usuario 
        const {[0] : {cantidadU}} = await pool.query("SELECT COUNT(*) AS cantidadU FROM usuarios WHERE Username = ? " , [Carnet]); 
        if(cantidadU) return res.status(400).json({ status: false, error: "CARNET_EXISTENTE"});
        // Enviar consulta
        const {insertId}  = await pool.query("INSERT INTO alumnos(Carnet, Nombre , Apellido, Genero , FechaNac , Email) VALUES(?,?,?,?,?,?)", [Carnet, Nombre, Apellido, Genero, FechaNac , Email]);
        adddUsuarioFunction({user: Carnet , passwordPlain: Carnet , role: 2 });
        res.json({ status: true, insertId});
    } catch (error) {
        console.log(error);
        res.json({ status: false, error}).status(400);
    }
};

estudiantes.edit = async (req , res) => {
    try {
        const {Carnet, Nombre, Apellido, Genero, FechaNac, Email} = req.body;
        // Validar campos
        if(!Carnet || !Nombre  || !Apellido  || !Genero  || !FechaNac  || !Email  )  return res.json({ status: false, error: "VALUES_NOT_COMPLETED"}).status(400);
        // Validar existencia de carnet
        const {[0] : {cantidad}} = await pool.query("SELECT COUNT(*) AS cantidad FROM alumnos WHERE Carnet = ? " , [Carnet]); 
        if(!cantidad) return res.status(400).json({ status: false, error: "CARNET_NO_EXISTENTE"});
        // Validar existencia de usuario 
        const {[0] : {cantidadU}} = await pool.query("SELECT COUNT(*) AS cantidadU FROM usuarios WHERE Username = ? " , [Carnet]); 
        if(!cantidadU) return res.status(400).json({ status: false, error: "CARNET_NO_EXISTENTE"});
        // Enviar consulta
        await pool.query("UPDATE alumnos SET Nombre = ? , Apellido = ? , Genero = ? , FechaNac = ? , Email = ? WHERE Carnet = ?" ,[ Nombre, Apellido, Genero, FechaNac , Email , Carnet]);
        res.json({ status: true});
    } catch (error) {
        console.log(error);
        res.json({ status: false, error}).status(400);
    }
};


estudiantes.getEstudiantes = async (req, res) => {
    const { searchTerm } = req.body;
    const { idGrado } = req.params;
    let query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos Nombre like '%${searchTerm}%' GROUP BY Carnet  ORDER By Nombre LIMIT 5`;
    if (!searchTerm) query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos GROUP BY Carnet ORDER BY Nombre LIMIT 5`;
    try {
        const data = await pool.query(query, [idGrado]);
        return res.json({ results: data });
    } catch (error) {
        return res.status(400).json({ error });
    }
};

estudiantes.getEstudiantesAll = async (req, res) => {
    const { searchTerm } = req.body;
    let query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos WHERE Nombre like '%${searchTerm}%' GROUP BY Carnet  ORDER By Nombre LIMIT 5`;
    if (!searchTerm) query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos GROUP BY Carnet ORDER BY Nombre LIMIT 5`;
    try {
        const data = await pool.query(query);
        return res.json({ results: data });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ error });
    }
};



estudiantes.viewMatricula = async (req , res) => {
    try {
        const {idMatricula} = req.params;
        const {[0]: matriculas} = await pool.query("SELECT * FROM matriculas WHERE id = ? ", [idMatricula]);
        const datos = JSON.parse(matriculas.data);
        const img = await getImgMatricula(matriculas.s3Key);
        res.render('./admin/estudiantes/vermatricula', {datos, img : img.path});
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};


module.exports = estudiantes;
