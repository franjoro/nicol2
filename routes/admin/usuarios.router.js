var express = require('express');
const usuarios = require('../../controllers/admin/usuarios.controller');


var router = express.Router();


/* GET Pantalla principal de usuarios */
router.get('/',  usuarios.main);

/* POST ingresar nuevo usuario*/
router.post('/',  usuarios.addUsuario);

/* PUT Actualizar permisos de usuarios*/
router.put('/',  usuarios.updatePermisos);



module.exports = router;
