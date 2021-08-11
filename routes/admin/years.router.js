var express = require('express');
const years = require('../../controllers/admin/years.controller');


var router = express.Router();


/* GET Pantalla principal de years */
router.get('/',  years.main);


/* POST Agregar nuevo año */
router.post('/',  years.createNewYear);


/* POST Configuración de año y bimestre */
router.post('/settings',  years.settings);



module.exports = router;
