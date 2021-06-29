const admin = {};


admin.main = (req , res) => {
    res.render('./admin/main');
};



//  CATALOGOS 
admin.areas = (req , res) => {
    res.render('./admin/catalogos/areas/areas');
};
admin.codigos = (req , res) => {
    res.render('./admin/catalogos/codigos/codigos');
};
admin.materias = (req , res) => {
    res.render('./admin/catalogos/materias/materia');
};
admin.years = (req , res) => {
    res.render('./admin/catalogos/years/years');
};
 /////////////////
admin.grados = (req , res) => {
    res.render('./admin/grados');
};

module.exports = admin;
