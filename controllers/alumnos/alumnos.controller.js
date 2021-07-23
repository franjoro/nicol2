const alumnos = {};

// const pool = require("../../models/db");
alumnos.main = (req , res) => {
    res.render('./alumnos/main');
};


module.exports = alumnos;
