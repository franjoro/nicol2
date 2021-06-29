var express = require('express');
const admin = require('../../controllers/admin/admin.controller');
var router = express.Router();

//Rutas 
const rutaGrados = require('./grados.router');


/* GET Inicio del admin */
router.get('/',  admin.main);

/* GET Inicio del admin */
router.get('/areas',  admin.areas);
router.get('/codigos',  admin.codigos);
router.get('/materias',  admin.materias);
router.get('/years',  admin.years);


/* USE especificar las rutas competentes a los grados */
router.use('/grados', rutaGrados );

module.exports = router;
