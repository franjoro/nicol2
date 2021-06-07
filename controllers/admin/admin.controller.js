const admin = {}


admin.main = (req , res) => {
    res.render('./admin/main');
}
admin.grados = (req , res) => {
    res.render('./admin/grados');
}

module.exports = admin;
