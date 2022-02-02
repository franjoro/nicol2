const express = require('express');
const admin = require('../../controllers/admin/admin.controller');
const router = express.Router();

// DIRECCIONES DE RUTEO
const rutaGrados = require('./grados.router');
const rutaYears = require('./years.router');
const rutaMaterias = require('./materias.router');
const rutaAreas = require('./areas.router');
const rutaEstudiantes = require('./estudiantes.router');
const rutaUsuarios = require('./usuarios.router');
const rutaMaestros = require('./maestros.router');
const rutaciclos = require('./ciclos.router');
const rutaCodigos= require('./codigos.router');
const rutaConducta= require('./conducta.router');
const rutaNotas= require('./notas.router');
const rutaIndicadores= require('./indicadores.router');
const { authCheckAdmin  } = require('../../middlewares/auth');


router.use('/notas', rutaNotas); 
router.use('/indicadores', rutaIndicadores); 

router.get('/correccion' , admin.matriculas);

/* USE especificar las rutas competentes a los grados */
router.use(authCheckAdmin);
router.get('/', admin.main);
router.delete('/', admin.delete);
router.use('/years', rutaYears); 
router.use('/grados', rutaGrados); 
router.use('/materias', rutaMaterias); 
router.use('/areas', rutaAreas); 
router.use('/estudiantes', rutaEstudiantes); 
router.use('/usuarios', rutaUsuarios); 
router.use('/maestros', rutaMaestros); //  check
router.use('/ciclos', rutaciclos); 
router.use('/codigos', rutaCodigos); 
router.use('/conducta', rutaConducta); 

module.exports = router;
