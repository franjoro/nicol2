var express = require('express');
const grados = require('../../controllers/admin/grados.controller');


var router = express.Router();



/* GET Pantalla principal de grados */
router.get('/detalle/:idGrado',  grados.detalleGrado);

/* POST Agregar nuevo modelo */
router.post('/',  grados.addNewGrado);

/* GET Pantalla principal de grados */
router.get('/:year?',  grados.main);

module.exports = router;
