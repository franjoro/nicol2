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

indicadores.getModelos = async (req, res) => {
    const { searchTerm } = req.body;
    let query = `SELECT id , indicador AS text FROM indicadoresparvularia WHERE indicador like '%${searchTerm}%' order By indicador LIMIT 5`;
    if (!searchTerm) query = `SELECT id, indicador AS text FROM indicadoresparvularia order By indicador LIMIT 5`;
    try {
        const data = await pool.query(query);
        return res.json({ results: data });
    } catch (error) {
        return res.status(400).json({ error });
    }
};


indicadores.attachMateriaIndicador = async (req, res) => {
    try {
        const arrayIndicadores = req.body["selectIndicadores[]"];
        const {idUnion , idBimestre} = req.body;
        const arrPromesas = [];
        if (Array.isArray(arrayIndicadores)) {
            arrayIndicadores.forEach((indicador) => {
                arrPromesas.push(
                    pool.query(
                        "INSERT INTO indicadores_materia(idUnion, idIndicador , idBimestre ) VALUES( ? , ? , ?)",
                        [idUnion, indicador , idBimestre]
                    )
                );
            });
        } else {
            arrPromesas.push(
                pool.query(
                    "INSERT INTO indicadores_materia(idUnion, idIndicador , idBimestre ) VALUES( ? , ? , ?)",
                    [idUnion, arrayIndicadores , idBimestre]
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


module.exports = indicadores;
