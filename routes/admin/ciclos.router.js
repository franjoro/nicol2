var express = require('express');
const ciclos = require('../../controllers/admin/ciclos.controller');


var router = express.Router();


/* GET Pantalla principal de ciclos */
router.get('/',  ciclos.main);

/* POST ingresar nuevo ciclo */
router.post('/',  ciclos.addNew);



module.exports = router;
