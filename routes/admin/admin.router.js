var express = require('express');
const admin = require('../../controllers/admin/admin.controller');
var router = express.Router();

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
const { authCheckAdmin  } = require('../../middlewares/auth');


/* USE especificar las rutas competentes a los grados */

router.use(authCheckAdmin);
router.get('/', admin.main);
router.use('/years', rutaYears);
router.use('/grados', rutaGrados);
router.use('/materias', rutaMaterias);
router.use('/areas', rutaAreas);
router.use('/estudiantes', rutaEstudiantes);
router.use('/usuarios', rutaUsuarios);
router.use('/maestros', rutaMaestros);
router.use('/ciclos', rutaciclos);
router.use('/codigos', rutaCodigos);
router.use('/conducta', rutaConducta);
router.use('/notas', rutaNotas);

module.exports = router;
