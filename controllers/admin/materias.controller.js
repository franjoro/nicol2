const materias = {};
const { getUserDataByToken } = require("../../middlewares/auth");
const pool = require("../../models/db");

materias.main = async (req, res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisos = JSON.parse(Permisos);
        
        const { [0]: materias, [1]: areas } = await Promise.all([
            pool.query(
                "SELECT id, Nombre, Siglas, (SELECT Nombre FROM areas WHERE id =  modelomaterias.idArea) AS areaNombre , idArea FROM modelomaterias"
            ),
            pool.query("SELECT * FROM areas"),
        ]);
        res.render("./admin/catalogos/materias/materia", { materias, areas, permisos });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

materias.addNewModelo = async (req, res) => {
    try {
        const { Nombre, idArea , Siglas} = req.body;
        const { insertId } = await pool.query(
            "INSERT INTO modelomaterias(Nombre, Siglas, idArea) VALUES(? , ?, ?)",
            [Nombre, Siglas, idArea]
        );
        res.json({ status: true, insertId });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};

materias.getModelos = async (req, res) => {
    const { searchTerm } = req.body;
    let query = `SELECT id , Nombre AS text FROM modelomaterias WHERE Nombre like '%${searchTerm}%' order By Nombre LIMIT 5`;
    if (!searchTerm) query = `SELECT id, Nombre AS text FROM modelomaterias order By Nombre LIMIT 5`;
    try {
        const data = await pool.query(query);
        return res.json({ results: data });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ error });
    }
};



materias.edit = async (req , res) => {
    try {
        console.log(req.body);
        const {Materia, Siglas , id } = req.body;
        await pool.query("UPDATE modelomaterias SET Nombre = ? , Siglas = ? WHERE id = ? ", [Materia, Siglas , id]);
        res.json({ status: true});
    } catch (error) {
        console.log(error);
        return res.status(400).json({ error });
    }
};



module.exports = materias;
