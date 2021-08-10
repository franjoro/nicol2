var express = require('express');
const { authCheckMaestros  } = require('../../middlewares/auth');
const maestros = require('../../controllers/maestros/maestros.controller');
var router = express.Router();


// Validar sesión
router.use(authCheckMaestros);

// GET Home de maestros 
router.get('/', maestros.main);



// =============================================== DIARIO PEDAGOGICO
// GET Diario pedagogico  
router.get('/conducta', maestros.conducta);

// GET Regresa los alumnos de ese grado para registrar un código o observación  
router.get('/conducta/:idGrado', maestros.conductaAlumnos);

// POST Asignar código a alumno  
router.post('/conducta', maestros.addCodigo);

// POST Asignar código a alumno  
router.post('/observacion', maestros.addObservacion);
// =============================================== FIN DIARIO PEDAGOGICO





// =============================================== PERFIL ACADEMICO
// GET Perfil academico ************************************************************************************************************* PENDIENTE A HACER CARDS MIENTRAS TABLA
router.get('/perfil', maestros.perfil);

// GET Perfil academico muestra las 3 actividades disponibles
router.get('/perfil/:idUnion', maestros.perfilActividades);

// GET Panel para agregar actividad
router.get('/addPerfil/:idUnion/:Role', maestros.addPerfilView);

// POST Funcion agregar actividad
router.post('/addPerfil/:idUnion/:Role', maestros.addPerfil);
// =============================================== FIN PERFIL ACADEMICO






// =============================================== INGRESO DE NOTAS
// GET Ingreso de notas************************************************************************************************************* PENDIENTE A HACER CARDS MIENTRAS TABLA
router.get('/notas', maestros.notasViewMain);

// GET Ingreso de notas actividades muestra las 3 actividades disponibles
router.get('/notas/:idUnion', maestros.notasActividades);

// GET Muestra a los alumnos pertenecientes al grado
router.get('/notasAdd/:idUnion/:Role', maestros.notasAlumnos);


// =============================================== FIN INGRESO DE NOTAS






module.exports = router;
