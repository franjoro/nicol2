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
                        <h4 class="pt-1">Profesor Guía </h4>
                    </div>
                    <div class="col-md-6 text-center">
                        <h4 class="pt-1">Director </h4>
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
                       <h4 class="pt-1">Profesor Guía </h4>
                   </div>
                   <div class="col-md-6 text-center">
                       <h4 class="pt-1">Director </h4>
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

const GenerarReporteDeConducta = (codigos, observaciones , datosAlumno, roleBimestre) => { 

    let html = `<!DOCTYPE html>
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
            <h4>Boleta de conducta bimestral</h4>
           <table class="table">
                <tr>
                    <td>Carnet: ${datosAlumno.Carnet} </td>
                    <td>Nombre: ${datosAlumno.Nombre + ' ' + datosAlumno.Apellido} </td>
                    <td>Puntaje: ${datosAlumno.puntaje} </td>
                    <td>Bimestre: ${roleBimestre} </td>
                </tr>
           </table>
        </div>
    </div>

    <div class="row">
    <div class="col-md-12">
        <div class="px-4">
            <div class="card card-header-actions mb-4">
                <div class="card-header">
                    Códigos aplicados
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Código Aplicado</th>
                                <th>Valor</th>
                                <th>Maestro</th>
                                <th>Descripción</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>`;
                             codigos.forEach( codigo=> { 
                                 html += `
                                <tr>
                                    <td>
                                        ${ codigo.Codigo }
                                    </td>
                                    <td>
                                        ${ codigo.valor }
                                    </td>
                                    <td>
                                        ${ codigo.NombreMaestro }
                                    </td>
                                    <td>
                                       ${ codigo.Observacion }
                                    </td>
                                    <td>
                                       ${ codigo.Date }
                                    </td>
                                </tr>`;
                            });
                     html +=  `</tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="px-4">
            <div class="card card-header-actions mb-4">
                <div class="card-header">
                    Observaciones aplicadas
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Observación</th>
                                <th>Maestro</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>`;
                           observaciones.forEach( observacion=> {
                            html += `
                                <tr>
                                    <td>
                                        ${ observacion.descripcion }
                                    </td>
                                    <td>
                                        ${ observacion.NombreMaestro }
                                    </td>
                                    <td>
                                        ${ observacion.Date }
                                    </td>
                                </tr>`;
                            });
                       html +=` </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>     `;

    return new Promise((resolver) => {
        tmpName = "boletaDeConducta.pdf";
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
    GenerarPdf , GenerarBoletaFinal , GenerarReporteDeConducta
};