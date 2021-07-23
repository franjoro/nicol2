var express = require('express');
const { authCheckAlumnos  } = require('../../middlewares/auth');
const alumnos = require('../../controllers/alumnos/alumnos.controller');
var router = express.Router();
// Validar sesión
router.use(authCheckAlumnos);


router.get('/', alumnos.main);


module.exports = router;
