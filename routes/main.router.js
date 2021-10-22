var express = require('express');
var router = express.Router();

const main = require('../controllers/main.controller');
const { CloseSession } = require('../middlewares/auth');


/* GET LOGIN PAGE */
router.get('/', CloseSession ,  main.main);

/* POST Funcion login */
router.post("/", main.signin);

/* POST Funcion Cambiar contraseña */
router.put("/", main.password);


/* GET Funcion Envio de correo para cambio de contraseña */
router.get("/recover", main.remindSender);

/* GET Vista de cambio de contraseña */
router.get("/password",  main.remindPassword);

/* POST Funcion cambiar contraseña */
router.post("/passwordChange",  main.ChangePasswordwithReminder);


module.exports = router;
