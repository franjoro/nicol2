//Formato de titulos
// const titulos = ["String", "String", "String"];
// const datos = [{key: 'value' } , {key: 'value' }  ]

const Excel = {};

Excel.getConsolidadoBimestralExcel = (datos) => {
  return new Promise(async function (Resolve, Reject) {
    const xl = require("excel4node");
    const wb = new xl.Workbook();
    const NameSheet = "Consolidado bimestral";
    const ws = wb.addWorksheet(NameSheet);
    const TitleStyle = wb.createStyle({
      font: {
        bold: true,
        size: 13,
      },
    });

    ws.cell(1, 1).string("Código Alumno").style(TitleStyle);
    ws.cell(1, 2).string("Nombre del alumno").style(TitleStyle);

    // Titulos
    datos[0].notas.forEach((element, index) => {
      ws.cell(1, index + 3)
        .string(element.Nombre)
        .style(TitleStyle);
    });

    datos.forEach((element, index) => {
      let i = 1;

      ws.cell(index + 2, i).string(element.idAlumno);
      ws.cell(index + 2, i + 1).string(element.nombreAlumno);
      i++;
      let j = 2;

      element.notas.forEach((nota, indexj) => {
        ws.cell(index + 2, indexj + 3).number(nota.nota);
        j++;
      });

    });
    const name = `consolidadoBimestral${Date.now()}.xlsx`;
    const path = "./public/files/tmp/"+name;

    wb.write(path, function(err, stats) {
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
