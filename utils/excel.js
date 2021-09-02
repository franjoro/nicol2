//Formato de titulos
// const titulos = ["String", "String", "String"];
// const datos = [{key: 'value' } , {key: 'value' }  ]

const Excel = {};

Excel.CreateNewExcel = (titulos, datos) => {
  return new Promise(async function (Resolve, Reject) {
    const xl = require("excel4node");
    const wb = new xl.Workbook();
    const NameSheet = "Hoja de trabajo";
    const ws = wb.addWorksheet(NameSheet);
    const TitleStyle = wb.createStyle({
      font: {
        bold: true,
        size: 13,
      },
    });

    titulos.forEach((element, index) => {
      ws.cell(1, index + 1)
        .string(element)
        .style(TitleStyle);
    });

    datos.forEach((element, index) => {
      let i = 1;
      for (const property in element) {
        ws.cell(index + 2, i).string(element[property]);
        i++;
      }
    });
    const path = "./public/files/tmp/excel.xlsx";
    Promise.resolve(wb.write(path)).then(Resolve());
  });
};

module.exports = Excel;
