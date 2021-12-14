const admin = {};

const pool = require("../../models/db");

admin.main = async (req, res) => {
    try {

        const { [0]: { [0]: { alumnos } }, [1]: { [0]: { maestros } } } = await Promise.all([
            pool.query("SELECT COUNT(*) AS alumnos FROM alumnos"),
            pool.query("SELECT COUNT(*) AS maestros FROM maestros"),
        ]);

        console.log(alumnos);

        res.render('./admin/main', { alumnos, maestros });
    } catch (error) {
        console.error(error);
        res.status(400).json({ status: false, error });
    }
};

admin.delete = async (req, res) => {
    try {
        const { id, tabla, column } = req.body;
        if (!id || !tabla || !column) return res.json({ status: false, error: "PARAMS_NOT_COMPLETE" });


        const stament = `DELETE FROM ${tabla} WHERE ${column} = ${id}`;

        await pool.query(stament);

        res.json({ status: true });
    } catch (error) {
        console.error(error);
        res.status(400).json({ status: false, error });
    }
};


admin.matriculas = async (req, res) => {
    try {
        res.json({ status: true });
    } catch (error) {
        console.error(error);
        res.status(400).json({ status: false, error });
    }
};


module.exports = admin;
