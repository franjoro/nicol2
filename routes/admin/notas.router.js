var express = require('express');
const notas = require('../../controllers/admin/notas.controller');


var router = express.Router();

/* GET Pantalla principal de notas */
router.get('/getNotasEstudiantes/:idAlumno/:idBimestre',  notas.getNotasByAlumnos);

/* GET Pantalla principal de notas */
router.get('/:roleBimestre?',  notas.main);




module.exports = router;
