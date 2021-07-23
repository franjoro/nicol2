var express = require('express');
var router = express.Router();

const main = require('../controllers/main.controller');
const { CloseSession } = require('../middlewares/auth');


/* GET LOGIN PAGE */
router.get('/', CloseSession ,  main.main);

/* POST Funcion login */
router.post("/", main.signin);

module.exports = router;
