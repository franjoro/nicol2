var express = require('express');
const { authCheckMaestros  } = require('../../middlewares/auth');
const maestros = require('../../controllers/maestros/maestros.controller');
var router = express.Router();
// Validar sesión
router.use(authCheckMaestros);


router.get('/', maestros.main);


module.exports = router;
