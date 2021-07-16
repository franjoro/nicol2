const grados = {};


grados.main = (req , res) => {
    res.render('./admin/grados/grados');
};

grados.detalleGrado = (req , res) => {
    res.render('./admin/grados/detalle');
};


// grados.addNewModelo = async (req , res) => {
//     try {
//         const {areaNombre} = req.body;
//         console.log(req.body);
//         const {insertId}  = await pool.query("INSERT INTO areas(Nombre) VALUES(?)", [areaNombre]);
//         res.json({ status: true, insertId});
//     } catch (error) {
//         res.json({ status: false, error}).status(400);
//     }
// };



module.exports = grados;
