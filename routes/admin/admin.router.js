var express = require('express');
const admin = require('../../controllers/admin/admin.controller');
var router = express.Router();


/* GET home page. */
router.get('/',  admin.main);

module.exports = router;
