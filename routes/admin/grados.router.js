var express = require('express');
const grados = require('../../controllers/admin/grados.controller');


var router = express.Router();


/* GET Pantalla principal de grados */
router.get('/',  grados.main);


/* GET Pantalla de asignación de grados        !PENDIENTE PONER VARIABLE ID DE GRADO EN LA RUTA */
router.get('/detalle',  grados.detalleGrado);

module.exports = router;
