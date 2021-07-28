const codigos = {};
const pool = require("../../models/db");

codigos.main = async (req , res) => {
    try {
        const codigos = await pool.query("SELECT * FROM codigos");
        res.render('./admin/catalogos/codigos/codigos' , {codigos});
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};

codigos.addNew = async (req , res) => {
    try {
        const {codigoInput , accionCodigo , valor } = req.body;
        const newValue = accionCodigo + valor;
        const {insertId}  = await pool.query("INSERT INTO codigos(Codigo, valor) VALUES(? , ?)", [codigoInput , newValue]);
        res.json({ status: true, insertId});
    } catch (error) {
        res.json({ status: false, error}).status(400);
    }
};

module.exports = codigos;