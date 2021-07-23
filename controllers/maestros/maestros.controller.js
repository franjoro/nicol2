const maestros = {};

// const pool = require("../../models/db");
maestros.main = (req , res) => {
    res.render('./maestros/main');
};


module.exports = maestros;
