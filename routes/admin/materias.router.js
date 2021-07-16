var express = require('express');
const materias = require('../../controllers/admin/materias.controller');


var router = express.Router();


/* GET Pantalla principal de materias */
router.get('/',  materias.main);


/* POST Agregar nuevo modelo de materia*/
router.post('/',  materias.addNewModelo);



module.exports = router;
