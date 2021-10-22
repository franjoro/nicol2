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


/* POST Funcion restaurar password */
router.get("/recover", main.remindSender);

module.exports = router;
