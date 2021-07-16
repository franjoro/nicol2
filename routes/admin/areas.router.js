var express = require('express');
const areas = require('../../controllers/admin/areas.controller');


var router = express.Router();


/* GET Pantalla principal de grados */
router.get('/',  areas.main);

/* POST ingresar nueva area */
router.post('/',  areas.addNew);



module.exports = router;
