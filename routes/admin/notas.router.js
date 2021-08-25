var express = require('express');
const notas = require('../../controllers/admin/notas.controller');


var router = express.Router();




/* GET Obtner notas por alumno en bimestre enviado */
router.get('/getNotasEstudiantes/:idAlumno/:idBimestre',  notas.getNotasByAlumnos);


/* GET Obtener consolidado bimestral  */
router.get('/getNotasGrado/:idGrado/:idBimestre',  notas.getConsolidadoBimestral);


/* GET Obtener consolidado anual  */
router.get('/getConsolidadoAnual/:idGrado/',  notas.getConsolidadoAnual);


/* GET obtener Boleta Final  */
router.get('/getBoletaFinal/:idAlumno/',  notas.getBoletaFinalByAlumno);


/* GET obtener Boleta bimestral  */
router.get('/getBoletaBimestral/:idAlumno/:idBimestre',  notas.getBoletaBimestral);


/* GET generarArchivoPorHtml  */
router.post('/generatePdfHtml',  notas.generateFichaByHtml);


/* GET Pantalla principal de notas */
router.get('/getFile',  notas.openFile);


/* PUT Actualizar nota */
router.put('/',  notas.updateNota);


/* GET Pantalla principal de notas */
router.get('/:roleBimestre?',  notas.main);



module.exports = router;
