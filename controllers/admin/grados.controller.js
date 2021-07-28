const grados = {};

const pool = require("../../models/db");

grados.main = async (req, res) => {
    try {
        let { year: yearActivo } = req.params;
        if (!yearActivo) {
            year = await pool.query(
                "SELECT year AS yearActivo FROM year WHERE estado = 1"
            );
            yearActivo = year[0].yearActivo;
        }
        const { [0]: years, [1]: grados, [2]: ciclos } = await Promise.all([
            pool.query("SELECT year, estado FROM year ORDER BY year DESC"),
            pool.query("SELECT id, nombre , (SELECT Nombre FROM ciclos WHERE id = grados.idCiclo) as ciclo  FROM grados WHERE idYear = ? ", [
                yearActivo,
            ]),
            pool.query("SELECT id, Nombre FROM ciclos"),
        ]);
        res.render("./admin/grados/grados", { years, grados, ciclos });
    } catch (error) {
        console.log(error);
        return res.json({ status: false, error }).status(400);
    }
};

grados.detalleGrado = async (req, res) => {
    try {
        const { idGrado } = req.params;
        const datosGradoPromesa =  pool.query("SELECT  nombre , (SELECT Nombre FROM ciclos WHERE id = grados.idCiclo) as ciclo , idYear FROM grados WHERE id = ? ", [idGrado]);
        const bimestreActivoPromesa =  pool.query("SELECT Role FROM bimestres WHERE Estado = 1");
        const { [0]: {[0]:datosGrado} ,  [1]: {[0]: {Role :bimestreActivo}} } = await Promise.all([datosGradoPromesa , bimestreActivoPromesa]);
        res.render("./admin/grados/detalle", { datosGrado, bimestreActivo });
    } catch (error) {
        console.log(error);
        return res.json({ status: false, error }).status(400);
    }

};

grados.addNewGrado = async (req , res) => {
    try {
        const {NombreCurso, idCiclo} = req.body;
        const { [0] : {year}} = await pool.query("SELECT year FROM year WHERE estado  = 1");
        const {insertId}  = await pool.query("INSERT INTO grados(nombre , idCiclo, idYear ) VALUES(? , ? ,? )", [NombreCurso , idCiclo , year]);
        res.json({ status: true, insertId});
    } catch (error) {
        res.json({ status: false, error}).status(400);
    }
};

module.exports = grados;
