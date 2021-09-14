const ciclos = {};
const pool = require("../../models/db");

ciclos.main = async (req , res) => {
    try {
        const ciclos = await pool.query("SELECT id, Nombre , IF(isParvularia = 1 , 'Cualitativas' , 'Cuantitativas') AS evaluacion FROM ciclos");
        res.render('./admin/catalogos/ciclos/ciclos', {ciclos});  
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }

};

ciclos.addNew = async (req , res) => {
    try {
        const {cicloName, isParvularia} = req.body;
        const {insertId}  = await pool.query("INSERT INTO ciclos(Nombre ,isParvularia) VALUES(? ,? )", [cicloName, isParvularia]);
        res.json({ status: true, insertId});
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error});
    }
};

ciclos.edit = async (req , res) => {
    try {
        const {cicloName, id} = req.body;
        console.log(req.body);
        await pool.query("UPDATE ciclos SET Nombre = ?  WHERE id= ?", [cicloName, id]);
        res.json({ status: true});
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error});
    }
};

module.exports = ciclos;
