var express = require('express');
const estudiantes = require('../../controllers/admin/estudiantes.controller');


var router = express.Router();


/* GET Pantalla principal de estudiantes */
router.get('/',  estudiantes.main);


/* GET estudiantes para rellenar tabla */
router.get('/table',  estudiantes.loadTable);

/* POST ingresar nuevo estudiante */
router.post('/',  estudiantes.addNew);



module.exports = router;
