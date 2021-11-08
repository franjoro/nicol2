//Formato de titulos
// const titulos = ["String", "String", "String"];
// const datos = [{key: 'value' } , {key: 'value' }  ]

const Excel = {};

Excel.getConsolidadoBimestralExcel = (datos) => {
  return new Promise(async function (Resolve) {
    const xl = require("excel4node");
    const wb = new xl.Workbook();
    const NameSheet = "Consolidado bimestral";
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
      },
      border: allBorder
    });

    const styleText = wb.createStyle({
      font: {
        size: 13,
      },
      border: allBorder
    });

    const styleTextNotas = (color = "black") => {
      return wb.createStyle({
        font: {
          size: 13,
          color
        },
        border: allBorder
      });
    };

    ws.cell(1, 1).string("Código Alumno").style(styleTitles);
    ws.cell(1, 2).string("Nombre del alumno").style(styleTitles);
    let finalTitulos;
    // Titulos
    datos[0].notas.forEach((element, index) => {
      ws.cell(1, index + 3)
        .string(element.Nombre)
        .style(styleTitles);
      finalTitulos = index + 3;
    });
    ws.cell(1, finalTitulos + 1).string("Prom.").style(styleTitles);
    ws.cell(1, finalTitulos + 2).string("Aprob.").style(styleTitles);
    ws.cell(1, finalTitulos + 3).string("Repr.").style(styleTitles);

    let filaFinal = 1;
    let columnaFinal;

    datos.forEach((element, index) => {
      let i = 1;
      let notasAprobadas = 0;
      let notasReprobadas = 0;
      let notaGlobal = 0;

      ws.cell(index + 2, i).string(element.idAlumno).style(styleText);
      ws.cell(index + 2, i + 1).string(element.nombreAlumno).style(styleText);
      i++;
      filaFinal++;


      element.notas.forEach((nota, indexj) => {
        const color = nota.nota >= 60 ? "black" : "red";

        if (nota.nota >= 60) {
          notasAprobadas = notasAprobadas + 1;
        } else {
          notasReprobadas = notasReprobadas + 1;
        }

        ws.cell(index + 2, indexj + 3).number(nota.nota).style(styleTextNotas(color));
        columnaFinal = indexj + 3;
        notaGlobal = notaGlobal + nota.nota;
      });

      notaGlobal = notaGlobal / element.notas.length;
      ws.cell(filaFinal, columnaFinal + 1).number(notaGlobal).style(styleTextNotas("black"));
      ws.cell(filaFinal, columnaFinal + 2).number(notasAprobadas).style(styleTextNotas("black"));
      ws.cell(filaFinal, columnaFinal + 3).number(notasReprobadas).style(styleTextNotas("red"));


    });


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
  });
};

module.exports = Excel;
