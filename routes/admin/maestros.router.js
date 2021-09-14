var express = require('express');
const maestros = require('../../controllers/admin/maestros.controller');


var router = express.Router();


/* GET Pantalla principal de maestros */
router.get('/',  maestros.main);


/* GET maestros para rellenar tabla */
router.get('/table',  maestros.loadTable);


/* POST ingresar nuevo maestro */
router.post('/',  maestros.addNew);


/* PUT Editar info maestro */
router.put('/',  maestros.edit);


/* POST retorna JSON de maestros ingresados para SELECT */
router.post('/getMaestros',  maestros.getModelos);


module.exports = router;
