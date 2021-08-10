var express = require('express');
const materias = require('../../controllers/admin/materias.controller');


var router = express.Router();


/* GET Pantalla principal de materias */
router.get('/',  materias.main);


/* POST Agregar nuevo modelo de materia*/
router.post('/',  materias.addNewModelo);


/* POST retorna JSON de modelos de materias ingresados para SELECT */
router.post('/getModelos',  materias.getModelos);


module.exports = router;
