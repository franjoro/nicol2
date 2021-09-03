var express = require('express');
const indicadores = require('../../controllers/admin/indicadores.controller');


var router = express.Router();


/* GET Pantalla principal de indicadores */
router.get('/',  indicadores.main);


/* POST Agregar nuevo indicador */
router.post('/',  indicadores.addNewModelo);


/* POST retorna JSON de modelos de indicadores ingresados para SELECT */
// router.post('/getModelos',  indicadores.getModelos);


module.exports = router;
