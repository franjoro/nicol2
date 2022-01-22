const areas = {};
const { getUserDataByToken } = require("../../middlewares/auth");
const pool = require("../../models/db");

areas.main = async (req , res) => {
    try {
        const { Permisos } = getUserDataByToken(req.cookies.token).data;
        const permisos = JSON.parse(Permisos);
        
        const areas = await pool.query("SELECT * FROM areas");
        res.render('./admin/catalogos/areas/areas', {areas , permisos});  
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


areas.edit = async (req , res) => {
    try {
        const {codigoInput , id } = req.body;
        await pool.query("UPDATE areas SET Nombre = ? WHERE id = ? ", [codigoInput , id]);
        res.json({ status: true});
    } catch (error) {
        res.status(400).json({ status: false, error});
    }
};
module.exports = areas;
