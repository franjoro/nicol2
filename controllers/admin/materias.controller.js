const materias = {};


materias.main = (req , res) => {
    res.render('./admin/catalogos/materias/materia');

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
