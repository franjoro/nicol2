var express = require('express');
var router = express.Router();

const main = require('../controllers/main.controller');


/* GET LOGIN PAGE */
router.get('/', main.main);

/* POST Funcion login */
router.post("/signin", main.signin);

module.exports = router;
