var express = require('express');
const estudiantes = require('../../controllers/admin/estudiantes.controller');


var router = express.Router();


/* GET Pantalla principal de estudiantes */
router.get('/',  estudiantes.main);


/* POST ingresar nuevo estudiante */
router.post('/',  estudiantes.addNew);


/* GET estudiantes para rellenar tabla */
router.get('/table',  estudiantes.loadTable);


/* POST retorna JSON para select de alumnos que no pertenecen a grado */
router.post('/getEstudiantes/:idGrado',  estudiantes.getEstudiantes);


module.exports = router;
