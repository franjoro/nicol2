const admin = {};

// const pool = require("../../models/db");

admin.main = (req , res) => {
    res.render('./admin/main');
};



//  CATALOGOS 
admin.codigos = (req , res) => {
    res.render('./admin/catalogos/codigos/codigos');
};




/////////////////
admin.grados = (req , res) => {
    res.render('./admin/grados');
};

module.exports = admin;
