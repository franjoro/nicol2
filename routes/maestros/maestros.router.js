const express = require('express');
const { authCheckMaestros } = require('../../middlewares/auth');
const maestros = require('../../controllers/maestros/maestros.controller');
const fileUpload = require("express-fileupload");
const router = express.Router();

// Validar sesión
router.use(authCheckMaestros);

// GET Home de maestros 
router.get('/', maestros.main);


// DELETE 
router.delete('/', maestros.delete);


// =============================================== DIARIO PEDAGOGICO
// GET Diario pedagogico  
router.get('/conducta', maestros.conducta);

// GET Regresa los alumnos de ese grado para registrar un código o observación  
router.get('/conducta/:idGrado', maestros.conductaAlumnos);

// POST Asignar código a alumno  
router.post('/conducta', maestros.addCodigo);

// POST Asignar observación a alumno  
router.post('/observacion', maestros.addObservacion);
// =============================================== FIN DIARIO PEDAGOGICO





// =============================================== PERFIL ACADEMICO
// GET Perfil academico 
router.get('/perfil', maestros.perfil);

// GET Perfil academico muestra las 3 actividades disponibles o los indicadores de logro de parvularia
router.get('/perfil/:idUnion', maestros.perfilActividades);

// GET Panel para agregar actividad
router.get('/addPerfil/:idUnion/:Role', maestros.addPerfilView);

// POST Funcion agregar actividad
router.post('/addPerfil/:idUnion/:Role', maestros.addPerfil);

// GET Panel para editar actividad
router.get('/editPerfil/:idUnion/:idActividad/:Role', maestros.editPerfilView);

// POST Funcion agregar actividad
router.post('/editPerfil/:idActividad', maestros.editPerfil);

// DELETE Funcion agregar actividad
router.delete('/deletePerfil', maestros.deletePerfil);

// =============================================== FIN PERFIL ACADEMICO






// =============================================== INGRESO DE NOTAS
// GET Ingreso de notas
router.get('/notas', maestros.notasViewMain);

// GET Ingreso de notas actividades muestra las 3 actividades disponibles  O Ingreso de notas de parvularia
router.get('/notas/:idUnion', maestros.notasActividades);

// GET Muestra a los alumnos pertenecientes al grado
router.get('/notasAdd/:idUnion/:Role', maestros.notasAlumnos);

// POST Ingreso de notas;
router.post('/notasAdd/', maestros.notasAdd);

// POST Ingreso de notas Parvularia;
router.post('/notasAddParvularia/', maestros.notasAddParv);



// =============================================== FIN INGRESO DE NOTAS



// =============================================== MATRICULAS

// GET Ingreso de matriculas
router.get('/matricula', maestros.matriculaView);

// POST Registro de matriculas;
router.post('/matricula', maestros.matriculaRegtistro);

// POST Registro de imagen matricula;
router.post('/img', fileUpload(), maestros.uploadImg);

// GET datos del alumno en json para rellenar
router.get('/matricula/:carnet', maestros.getDataAlumno);


// =============================================== FIN MATRICULAS



// =============================================== INDICADORES
router.get('/indicadores', maestros.indicadores);

/* POST Agregar nuevo indicador */
router.post('/indicadores', maestros.newIndicadores);

/* PUT actualizar indicador */
router.put('/indicadores',  maestros.editIndicadores);

/* POST retorna JSON para select de alumnos  */
router.post('/getEstudiantesAll',  maestros.getEstudiantesAll);

// =============================================== FIN INDICADORES



// =============================================== Visualizar notas

// GET Selector de grados para ver notas
router.get('/reportes', maestros.viewNotasGrados);

// GET Visor de notas
router.get('/viewer/:idUnion', maestros.viewNotasViewer);



// =============================================== FIN Visualizar notas


module.exports = router;
