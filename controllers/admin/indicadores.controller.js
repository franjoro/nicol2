const indicadores = {};
const pool = require("../../models/db");

indicadores.main = async (req, res) => {
    try {
        const indicadores = await pool.query("SELECT id, indicador FROM indicadoresparvularia");

        res.render("./admin/catalogos/indicadores/indicadores", { indicadores });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

indicadores.addNewModelo = async (req, res) => {
    try {
        const { indicador } = req.body;
        const { insertId } = await pool.query("INSERT INTO indicadoresparvularia(indicador) VALUES(?)", [indicador]);
        res.json({ status: true, insertId });
    } catch (error) {
        res.json({ status: false, error }).status(400);
    }
};

// materias.getModelos = async (req, res) => {
//     const { searchTerm } = req.body;
//     let query = `SELECT id , Nombre AS text FROM modelomaterias WHERE Nombre like '%${searchTerm}%' order By Nombre LIMIT 5`;
//     if (!searchTerm) query = `SELECT id, Nombre AS text FROM modelomaterias order By Nombre LIMIT 5`;
//     try {
//         const data = await pool.query(query);
//         return res.json({ results: data });
//     } catch (error) {
//         return res.status(400).json({ error });
//     }
// };

module.exports = indicadores;
