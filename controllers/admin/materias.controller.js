const materias = {};
const pool = require("../../models/db");


materias.main = async (req , res) => {
    try {
        const { [0] : materias  , [1] : areas  }  = await Promise.all(  [pool.query("SELECT id, Nombre, (SELECT Nombre FROM areas WHERE id =  modelomaterias.idArea) AS areaNombre , idArea FROM modelomaterias") , pool.query("SELECT * FROM areas") ] );
        res.render('./admin/catalogos/materias/materia' , {materias , areas});
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};


materias.addNewModelo = async (req , res) => {
    try {
        const {Nombre , idArea} = req.body;
        const {insertId}  = await pool.query("INSERT INTO modelomaterias(Nombre, idArea) VALUES(? , ?)", [Nombre , idArea]);
        res.json({ status: true, insertId});
    } catch (error) {
        res.json({ status: false, error}).status(400);
    }
};

module.exports = materias;