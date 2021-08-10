var express = require('express');
const grados = require('../../controllers/admin/grados.controller');


var router = express.Router();


/* GET Pantalla principal de grados */
router.get('/detalle/:idGrado',  grados.detalleGrado);


/* GET Pantalla principal de grados */
router.get('/:year?',  grados.main);


/* POST Agregar nuevo modelo */
router.post('/',  grados.addNewGrado);


/* POST Agregar nueva union de grado materia */
router.post('/assingMateria',  grados.assingMateriaGrado);


/* POST Agregar nueva union de grado materia */
router.post('/assingMaestro',  grados.assingMaestroGrado);


/* POST Agregar nueva union de estudiantes en grados */
router.post('/assingEstudiantes',  grados.assingEstudiantesGrado);



module.exports = router;
