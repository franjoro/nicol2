var express = require('express');
const codigos = require('../../controllers/admin/codigos.controller');


var router = express.Router();


/* GET Pantalla principal de codigos  */
router.get('/',  codigos.main);

/* POST ingresar nuevo ciclo */
router.post('/',   codigos.addNew);

/* PUT editar código de conducta */
router.put('/',   codigos.edit);



module.exports = router;
