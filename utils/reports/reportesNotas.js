//Formato de titulos
// const titulos = ["String", "String", "String"];
// const datos = [{key: 'value' } , {key: 'value' }  ]

const Excel = {};

Excel.getConsolidadoBimestralExcel = (datos, roleBimestre, nombreGrado) => {
  return new Promise(async function (Resolve) {


    try {
      const xl = require("excel4node");
      const wb = new xl.Workbook();
      const NameSheet = "Consolidado Bimestral";
      const ws = wb.addWorksheet(NameSheet);

      const allBorder = {
        // §18.8.4 border (Border)
        left: {
          style: "medium", //§18.18.3 ST_BorderStyle (Border Line Styles) ['none', 'thin', 'medium', 'dashed', 'dotted', 'thick', 'double', 'hair', 'mediumDashed', 'dashDot', 'mediumDashDot', 'dashDotDot', 'mediumDashDotDot', 'slantDashDot']
          color: "black", // HTML style hex value
        },
        right: {
          style: "medium",
          color: "black",
        },
        top: {
          style: "medium",
          color: "black",
        },
        bottom: {
          style: "medium",
          color: "black",
        },
      };

      const styleTitles = wb.createStyle({
        font: {
          bold: true,
          size: 13,
          family: 'swiss'
        },
        border: allBorder
      });
      const styleTitlesNoBorder = wb.createStyle({
        font: {
          bold: true,
          size: 13,
          family: 'swiss'
        },
      });

      const styleText = wb.createStyle({
        font: {
          family: 'swiss',
          size: 13,
        },
        border: allBorder
      });

      const styleTextNotas = (color = "black") => {
        return wb.createStyle({
          font: {
            size: 13,
            color,
            family: 'swiss'
          },
          border: allBorder
        });
      };



      let finalTitulos;
      const arrContadorReprobados = [];
      const arrContadorReprobadosMasculino = [];
      const arrContadorReprobadosFemenino = [];
      const cantidaAlumnos = datos.length;

      ws.cell(1, 1, 1, 17, true).string('Colegio Salesiano San Juan Bosco').style({
        font: {
          bold: true,
          size: 18,
        },
        alignment: { // §18.8.1
          horizontal: 'center',
          vertical: 'center',
      },
      });
      ws.cell(2, 1).string("Consolidado Bimestral").style(styleTitlesNoBorder);
      ws.cell(3, 1).string(`Grado : ${nombreGrado}`).style(styleTitlesNoBorder);
      ws.cell(3, 2).string(`Bimestre: ${roleBimestre}`).style(styleTitlesNoBorder);


      ws.cell(5, 1).string("Código Alumno").style(styleTitles);
      ws.cell(5, 2).string("Nombre del alumno").style(styleTitles);

      // Titulos
      datos[0].notas.forEach((element, index) => {
        ws.cell(5, index + 3)
          .string(element.Nombre)
          .style(styleTitles);
        finalTitulos = index + 3;
        arrContadorReprobados.push(0);
        arrContadorReprobadosMasculino.push(0);
        arrContadorReprobadosFemenino.push(0);

      });
      ws.cell(5, finalTitulos + 1).string("Prom.").style(styleTitles);
      ws.cell(5, finalTitulos + 2).string("Conducta").style(styleTitles);
      ws.cell(5, finalTitulos + 3).string("Aprob.").style(styleTitles);
      ws.cell(5, finalTitulos + 4).string("Repr.").style(styleTitles);

      let filaFinal = 5;
      let columnaFinal;

      datos.forEach((element, index) => {
        let i = 1;
        let notasAprobadas = 0;
        let notasReprobadas = 0;

        ws.cell(index + 6, i).string(element.idAlumno).style(styleText);
        ws.cell(index + 6, i + 1).string(element.nombreAlumno).style(styleText);
        i++;
        filaFinal++;


        element.notas.forEach((nota, indexj) => {
          const color = nota.nota >= 60 ? "black" : "red";

          if (nota.nota >= 60) {
            notasAprobadas = notasAprobadas + 1;
          } else {
            arrContadorReprobados[indexj] = arrContadorReprobados[indexj] + 1;
            notasReprobadas = notasReprobadas + 1;
            if (element.genero == 0) arrContadorReprobadosMasculino[indexj] = arrContadorReprobadosMasculino[indexj] + 1;
            if (element.genero == 1) arrContadorReprobadosFemenino[indexj] = arrContadorReprobadosFemenino[indexj] + 1;
          }

          ws.cell(index + 6, indexj + 3).number(nota.nota).style(styleTextNotas(color));
          columnaFinal = indexj + 3;
        });

        ws.cell(filaFinal, columnaFinal + 1).number(Number(element.promedio)).style(styleTextNotas("black"));
        ws.cell(filaFinal, columnaFinal + 2).number(element.puntaje).style(styleTextNotas("black"));
        ws.cell(filaFinal, columnaFinal + 3).number(notasAprobadas).style(styleTextNotas("black"));
        ws.cell(filaFinal, columnaFinal + 4).number(notasReprobadas).style(styleTextNotas("red"));


      });





      ws.cell(filaFinal + 4, 2).string("Materias").style(styleTitles);

      datos[0].notas.forEach((element, index) => {
        ws.cell(filaFinal + 4, index + 3)
          .string(element.Nombre)
          .style(styleTitles);
      });

      ws.cell(filaFinal + 5, 2).string("Materias Aprobadas").style(styleTitles);

      arrContadorReprobados.forEach((element, index) => {
        // Aprobadas
        ws.cell(filaFinal + 5, index + 3)
          .number(element - cantidaAlumnos)
          .style(styleTitles);
        // Reprobadas
        ws.cell(filaFinal + 6, index + 3)
          .number(element)
          .style(styleTitles);
        // Reprobadas Femenino
        ws.cell(filaFinal + 7, index + 3)
          .number(arrContadorReprobadosFemenino[index])
          .style(styleTitles);
        // Reprobadas Masculino
        ws.cell(filaFinal + 8, index + 3)
          .number(arrContadorReprobadosMasculino[index])
          .style(styleTitles);
      });



      ws.cell(filaFinal + 6, 2).string("Materias Aplazadas").style(styleTitles);
      ws.cell(filaFinal + 7, 2).string("Femenino Aprobado").style(styleTitles);
      ws.cell(filaFinal + 8, 2).string("Masculino Aprobado").style(styleTitles);

      ws.cell(filaFinal + 9, 2).string("Cantidad total de alumnos").style(styleTitles);
      ws.cell(filaFinal + 9, 3).number(cantidaAlumnos).style(styleTitles);









      const name = `consolidadoBimestral${Date.now()}.xlsx`;
      const path = "./public/files/tmp/" + name;

      wb.write(path, function (err) {
        if (err) {
          console.error(err);
        } else {
          // console.log(stats);
          Resolve(name);
        }
      });
    } catch (error) {
      console.log(error);
    }
  });
};

module.exports = Excel;
