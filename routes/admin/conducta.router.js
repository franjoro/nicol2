var express = require('express');
const conducta = require('../../controllers/admin/conducta.controller');


var router = express.Router();


/* GET Pantalla principal de conducta */
router.get('/:roleBimestre?',  conducta.main);


/*DELETE borrar codigo ya asignado */
router.delete('/codigo',  conducta.delete);


module.exports = router;
