var express = require('express');
const notas = require('../../controllers/admin/notas.controller');
const { authCheckAdmin  } = require('../../middlewares/auth');


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


/* GET obtener boleta preescolar   */
router.get('/getBoletaBimestralPreescolar/:idGrado/:idBimestre/:nombreGrado',  notas.getBoletaBimestralPreescolar);


/* GET generarArchivoPorHtml  */
router.post('/generatePdfHtml',  notas.generateFichaByHtml);


/* GET Reporte generado por HTML en notas */
router.get('/getFile',  notas.openFile);


/* PUT Actualizar nota */
router.put('/', authCheckAdmin  , notas.updateNota);


/* GET obtener Boleta Final  Por grado */
router.get('/boletaFinal/:idGrado/:nombreGrado/:roleBimestre',  notas.getBoletaFinalByGrado);


/* GET Reporte generado por HTML en notas */
router.get('/getReport',  notas.openReporte);

/* GET Reporte generado por HTML en notas de preescolar */
router.get('/getReportPreescolar',  notas.openReportePreescolar);


// REPORTES EXCEL


router.get('/getNotasGradoExcel/:idGrado/:idBimestre/:nombreGrado',  notas.getConsolidadoBimestralExcel);


router.get('/download/:nameFile',  notas.download);




/* GET Obtiene el grado de un alumno por carnet */
router.get('/getGrado/:idAlumno',  notas.getNombreGradoPorIdAlumno);


/* GET Pantalla principal de notas */
router.get('/:roleBimestre?',  notas.main);


module.exports = router;
