var express = require('express');
const usuarios = require('../../controllers/admin/usuarios.controller');


var router = express.Router();


/* GET Pantalla principal de usuarios */
router.get('/',  usuarios.main);

/* POST ingresar nuevo usuario*/
router.post('/',  usuarios.addUsuario);

/* PUT Actualizar permisos de usuarios*/
router.put('/',  usuarios.updatePermisos);

/* PUT Actualizar contraseña*/
router.put('/password',  usuarios.password);

/* PUT Actualizar estado de acceso*/
router.put('/estado',  usuarios.updateEstado);

/* GET alumnos para rellenar tabla */
router.get('/table',  usuarios.loadTable);

/* GET Pantalla de creación de usuarios */
router.get('/administrator',  usuarios.createAdminPage);

/* GET Pantalla de edición de permisos de administrador */
router.get('/administrator/:username',  usuarios.editAdminPage);


module.exports = router;
