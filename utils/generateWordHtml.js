/* eslint-disable no-console */
const fs = require("fs");
const HTMLtoDOCX = require("html-to-docx");
// FIXME: Incase you have the npm package
// const HTMLtoDOCX = require('html-to-docx');

const filePath = "./example.docx";

const htmlString = `<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <title>Document</title>
</head>

<body style="font-size:15px">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <!-- <img src="https://public-nicol2.s3.us-east-2.amazonaws.com/logo_blue.svg" style="width: 100%;" alt=""> -->
            </div>
            <div class="col-md-8">
                <h1 class="pt-3">Colegio Salesiano San Juan Bosco</h1>
                <h4>Boleta bimestral preescolar  - </h4>
            </div>
          </div>
          <div class="row">
              <div class="col-md-12">
                  <table class="table table-sm table-striped table-bordered">
                    <tbody>
                        <tr>
                            <th colspan="2" class="text-center"> Alumno : Franklin Alejandro López Ramírez </th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center"> Área: Matematica</th>
                        </tr>
                        <tr>
                            <th> Indicador  </th>
                              <th>Nota</th>
                          </tr>
                        <tr>
                            <td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laborum quaerat nulla ut, distinctio maxime praesentium aliquam eligendi. Expedita distinctio eveniet ratione, quaerat harum provident? Harum natus perferendis in possimus molestiae?</td>
                            <td>MB</td>
                        </tr>
                        <tr>
                            <td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laborum quaerat nulla ut, distinctio maxime praesentium aliquam eligendi. Expedita distinctio eveniet ratione, quaerat harum provident? Harum natus perferendis in possimus molestiae?</td>
                            <td>MB</td>
                        </tr>
                        <tr>
                            <td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laborum quaerat nulla ut, distinctio maxime praesentium aliquam eligendi. Expedita distinctio eveniet ratione, quaerat harum provident? Harum natus perferendis in possimus molestiae?</td>
                            <td>MB</td>
                        </tr>
                    </tbody>
                  </table>
              </div>
          </div>
    </div>
</body>
</html>`;

(async() => {
    const fileBuffer = await HTMLtoDOCX(htmlString, null, {
        table: { row: { cantSplit: true } },
        footer: true,
        pageNumber: true,
    });

    fs.writeFile(filePath, fileBuffer, (error) => {
        if (error) {
            console.log("Docx file creation failed");
            return;
        }
        console.log("Docx file created successfully");
    });
})();