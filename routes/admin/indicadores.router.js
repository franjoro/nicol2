var express = require('express');
const indicadores = require('../../controllers/admin/indicadores.controller');
const { authCheckAdmin  } = require('../../middlewares/auth');


var router = express.Router();





/* POST retorna JSON de modelos de indicadores ingresados para SELECT */
router.post('/getIndi',  indicadores.getModelos);

/* POST Vincula el indicador con la materia */
router.post('/materiaIndicador',  indicadores.attachMateriaIndicador);


router.use(authCheckAdmin);
/* GET Pantalla principal de indicadores */
router.get('/',  indicadores.main);

/* POST Agregar nuevo indicador */
router.post('/',  indicadores.addNewModelo);

/* PUT actualizar indicador */
router.put('/',  indicadores.edit);



module.exports = router;
