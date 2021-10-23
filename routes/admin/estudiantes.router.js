var express = require('express');
const estudiantes = require('../../controllers/admin/estudiantes.controller');


var router = express.Router();


/* GET Pantalla principal de estudiantes */
router.get('/',  estudiantes.main);


/* POST ingresar nuevo estudiante */
router.post('/',  estudiantes.addNew);


/* PUT Actualizar estudiante */
router.put('/',  estudiantes.edit);


/* GET estudiantes para rellenar tabla */
router.get('/table',  estudiantes.loadTable);


/* POST retorna JSON para select de alumnos que no pertenecen a grado */
router.post('/getEstudiantes/:idGrado',  estudiantes.getEstudiantes);


/* POST retorna JSON para select de alumnos  */
router.post('/getEstudiantesAll',  estudiantes.getEstudiantesAll);


/* GET Pantalla de matriculas  */
router.get('/matriculas/:idAlumno',  estudiantes.getMatriculas);


/* GET Pantalla de matriculas  */
router.get('/vermatricula/:idMatricula',  estudiantes.viewMatricula);


/* GET Perfil Académico  */
router.get('/perfilac/:idAlumno',  estudiantes.perfilAcademico);



module.exports = router;
