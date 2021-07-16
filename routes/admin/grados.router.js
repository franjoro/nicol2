var express = require('express');
const grados = require('../../controllers/admin/grados.controller');


var router = express.Router();


/* GET Pantalla principal de grados */
router.get('/',  grados.main);

/* GET Pantalla principal de grados */
router.get('/detalle',  grados.detalleGrado);

/* POST Agregar nuevo modelo */
// router.post('/',  grados.addNewModelo);


module.exports = router;
