const grados = {};


grados.main = (req , res) => {
    res.render('./admin/grados/grados');
};

grados.detalleGrado = (req , res) => {
    res.render('./admin/grados/detalle');
};


module.exports = grados;
