const areas = {};
const pool = require("../../models/db");

areas.main = async (req , res) => {
    try {
        const areas = await pool.query("SELECT * FROM areas");
        res.render('./admin/catalogos/areas/areas', {areas});  
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }

};

areas.addNew = async (req , res) => {
    try {
        const {areaNombre} = req.body;
        const {insertId}  = await pool.query("INSERT INTO areas(Nombre) VALUES(?)", [areaNombre]);
        res.json({ status: true, insertId});
    } catch (error) {
        res.json({ status: false, error}).status(400);
    }
};

module.exports = areas;
