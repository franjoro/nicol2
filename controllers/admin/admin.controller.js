const admin = {}


admin.main = (req , res) => {
    res.render('index', { title: 'Express' });
}


module.exports = admin;
