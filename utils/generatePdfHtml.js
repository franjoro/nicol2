const html_to_pdf = require("html-pdf-node");
const GenerarPdf = (data, header ,landscape = false, observaciones = "" ) => {
    if(landscape) landscape = true;
     const html = `<!DOCTYPE html>
     <html lang="en">
     <head>
         <meta charset="UTF-8">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
         <title>Document</title>
     </head>
     
     <body>
         <div class="container-fluid">
             <div class="row">
                 <div class="col-md-3">
                     <img src="https://drive.google.com/uc?export=view&id=1XeCSMVhFpRZypwV8xY4eKo2OpSFV7MOa" style="width: 100%;" alt="">
                 </div>
                 <div class="col-md-8">
                     <h1 class="pt-3">Colegio Salesiano San Juan Bosco</h1>
                    ${header}
                 </div>
             </div>
                ${data}

                 <hr>
                 <h4 class="pt-1">Observaciones: </h4>
                 <textarea class="form-control disabled"  cols="30" rows="4">${observaciones}</textarea>
                 <hr>
                 <br>
                 <br>
                 <br>
                 <br>
                 <br>
                 <br>
                 <div class="row">
                    <div class="col-md-6 text-center">
                        <h4 class="pt-1">Firma profesor Guía </h4>
                    </div>
                    <div class="col-md-6 text-center">
                        <h4 class="pt-1">Firma Director </h4>
                    </div>
                 </div>
         </div>
     </body>
     </html>`;
    return new Promise((resolver) => {
        tmpName = "ficha.pdf";
        const options = {
            format: "Letter",
            path: `./public/files/${tmpName}`,
            margin: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
            }
        };
        const file = {content: html};
        html_to_pdf.generatePdf(file, options).then((output) => {
            resolver(output);
        });
    });
};




const GenerarBoletaFinal = (data) => { 
    let html = `<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
        <title>Document</title>
    </head>
    
    <body>`;
    data.forEach(estudiante => {
    html += `
        <div class="container-fluid" style="padding-bottom: 600px;">
            <div class="row">
                <div class="col-md-3">
                    <img src="https://drive.google.com/uc?export=view&id=1XeCSMVhFpRZypwV8xY4eKo2OpSFV7MOa" style="width: 100%;" alt="">
                </div>
                <div class="col-md-8">
                    <h1 class="pt-3">Colegio Salesiano San Juan Bosco</h1>
                    <h4>Boleta final de notas</h4>
                   <table class="table">
                        <tr>
                            <td>Carnet: ${estudiante.idAlumno}</td>
                            <td>Nombre: ${estudiante.nombreAlumno}</td>
                            <td>Grado:  Septimo A</td>
                        </tr>
                   </table>
                </div>
            </div>
    
    
            <table class="table table-bordered table-sm table-striped">
                <thead>
                  <tr class="bg-blue text-black">
                    <th>Materia</th>
                    <th>I</th>
                    <th>20%</th>
                    <th>II</th>
                    <th>30%</th>
                    <th>III</th>
                    <th>20%</th>
                    <th>IV</th>
                    <th>30%</th>
                    <th>Nota Final</th>
                  </tr>
                </thead>
                <tbody> `;
    
    
  
            estudiante.notas.forEach(notasOne => {
                html += `<tr><td>${notasOne.Nombre}</td> `;
                notasOne.notas.forEach(nota => {
                    html += `<td>${nota.nota}</td><td>${nota.prom}</td>`;
                });
                html += `<td>${notasOne.notaGlobal}</td></tr>`;
            });
     
        html += `</tbody></table>
       
                </tbody>
            </table>
    
                <hr>
                <h4 class="pt-1">Observaciones: </h4>
                <textarea class="form-control disabled"  cols="30" rows="4"></textarea>
                <hr>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <div class="row">
                   <div class="col-md-6 text-center">
                       <h4 class="pt-1">Firma profesor Guía </h4>
                   </div>
                   <div class="col-md-6 text-center">
                       <h4 class="pt-1">Firma Director </h4>
                   </div>
                </div>
        </div>
`;
});
html += `</body></html> `;

    return new Promise((resolver) => {
        tmpName = "boletaFinal.pdf";
        const options = {
            format: "Letter",
            path: `./public/files/${tmpName}`,
            margin: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
            }
        };
        const file = {content: html};
        html_to_pdf.generatePdf(file, options).then((output) => {
            resolver(output);
        });
    });
};


module.exports = {
    GenerarPdf , GenerarBoletaFinal
};