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
                     <h3 class="pt-3">Colegio Salesiano San Juan Bosco</h3>
                    ${header}
                 </div>
             </div>
                ${data}

                 <h4 class="pt-1">Observaciones: </h4>
                 <textarea class="form-control disabled"  cols="30" rows="2">${observaciones}</textarea>
                 <hr>
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




const GenerarBoletaFinal = (data, nombreGrado, roleBimestre , year) => { 
    let html = `<!DOCTYPE html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    </head>
    <body style="font-family: Arial;">`;
    data.forEach(estudiante => {
    html += `
        <div class="container-fluid pt-5" style="height:1590px;">
            <div class="row">
                <div class="col-md-3">
                 <img src="https://drive.google.com/uc?export=view&id=1XeCSMVhFpRZypwV8xY4eKo2OpSFV7MOa" style="width: 100%;"> 
                </div>
                <div class="col-md-8">
                    <h2>Colegio Salesiano San Juan Bosco</h2>
                    <h4>Boleta de calificaciones - ${year.idYear}</h4>
                   <table class="table">
                        <tr>
                            <td>Carnet: ${estudiante.idAlumno}</td>
                            <td>Nombre: ${estudiante.nombreAlumno}</td>
                            <td>Grado:  ${nombreGrado}</td>
                            <td>Bimensual #${roleBimestre}</td>
                        </tr>
                   </table>
                </div>
            </div>
            <table class="table table-bordered table-striped">
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
                    html += `<tr style="font-size: 20px;"><td>${notasOne.Nombre}</td> `;
                    notasOne.notas.forEach((nota, index) => {
                        if(index +1  <= roleBimestre){
                            html += `<td>${nota.nota}</td><td>${nota.prom}</td>`;
                        }else{
                            html += `<td></td><td></td>`;
                        }
                    });
                    if(roleBimestre == 4 ){
                        html += `<td>${notasOne.notaGlobal}</td></tr>`;
                    }
                });
                html += `<tr style="font-size: 20px;">
                        <td>Conducta</td>
                        <td>${estudiante.Conducta1.puntaje}</td>
                        <td>${estudiante.Conducta1.prom}</td>`;

                        if(roleBimestre  >= 2){
                            html += `  
                            <td>${estudiante.Conducta2.puntaje}</td>
                            <td>${estudiante.Conducta2.prom}</td>`;
                        }else{
                            html += `<td></td><td></td>`;
                        }

                        if(roleBimestre  >= 3){
                            html += `
                            <td>${estudiante.Conducta3.puntaje}</td>
                            <td>${estudiante.Conducta3.prom}</td>`;
                        }else{
                            html += `<td></td><td></td>`;
                        }
                        if(roleBimestre  >= 4){
                            html += `
                            <td>${estudiante.Conducta4.puntaje}</td>
                            <td>${estudiante.Conducta4.prom}</td>`;
                        }else{
                            html += `<td></td><td></td>`;
                        }
                        html += ` </tr>`;
        html += `</tbody></table>
                <hr>
                <h4>Observaciones: </h4>
                <div class="pb-5">
                <textarea class="form-control disabled"  cols="30" rows="3"></textarea>
                </div>
                <div class="d-flex justify-content-between">
                   <div class="col-md-6 text-center">
                       <h4 >_____________</h4>                        
                        <h4>Profesor Guía</h4>
                   </div>
                   <div class="col-md-6 text-center">
                       <h4>_____________</h4>                        
                       <h4>Director</h4>
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



const GenerarMatricula = (datos, img , arrFamiliares, existFamiliares) => {
     let html = `
     <!DOCTYPE html>
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
             <h4>Información de matricula</h4>
            <table class="table">
                 <tr>
                     <td>Carnet: ${ datos.carnet } </td>
                     <td>Nombre: ${datos.Nombres + ' ' + datos.Apellidos} </td>
                     <td>Año: ${datos.idYear} </td>
                 </tr>
            </table>
         </div>
       </div>
       <div class="container-xl px-4 mt-n10">
       <div class="card mb-4">
           <div class="card-body ">
               <img src="/static/${ img }" class="mx-auto d-block imgMatricula" >
               <hr>
                   <div class="row">
                       <div class="form-group col-md-3">
                           <label>Carnet o código identificador</label>
                           <input type="text" class="form-control" id="carnet" name="carnet"
                               autocomplete="off" disabled value="${ datos.carnet }">
                       </div>
                       <div class="form-group col-md-3">
                           <label>Nombres</label>
                           <input type="text" class="form-control" id="Nombres" name="Nombres"
                               autocomplete="off"  value="${ datos.Nombres }">
                       </div>
                       <div class="form-group col-md-3">
                           <label>Apellidos</label>
                           <input type="text" class="form-control" id="Apellidos" name="Apellidos"
                               autocomplete="off"  value="${ datos.Apellidos }">
                       </div>
                       <div class="form-group col-md-3">
                           <label>Correo electrónico</label>
                           <input type="email" class="form-control" id="EmailMain" name="EmailMain"
                               autocomplete="off"  value="${ datos.EmailMain }">
                       </div>
                   </div>
                   <div class="row">
                       <div class="form-group col-md-5">
                           <label>Dirección</label>
                           <input type="text" class="form-control" id="Direccion" name="Direccion"
                               autocomplete="off"  value="${ datos.Direccion }">
                       </div>
                       <div class="form-group col-md-2">
                           <label>Télefono</label>
                           <input type="text" class="form-control" id="Tel" name="Tel"
                               autocomplete="off"  value="${ datos.Tel }">
                       </div>
                       <div class="form-group col-md-3">
                           <label>Fecha de nacimiento</label>
                           <input type="date" class="form-control" id="FechaNac" name="FechaNac"
                               autocomplete="off"  value="${ datos.FechaNac }">
                       </div>
                       <div class="form-group col-md-2">
                           <label>Código contable</label>
                           <input type="text" class="form-control" id="codigoContable" name="codigoContable"
                               autocomplete="off"  value="${ datos.codigoContable }">
                       </div>
                   </div>
                   <hr>
                   <div class="row">
                       <div class="col-md-4">
                           <div class="card">
                               <div class="card-header">
                                   Datos personales madre
                               </div>
                               <div class="card-body">
                                   <div class="row">
                                       <div class="col-md-12">
                                           <label>Nombre</label>
                                           <input type="text" class="form-control" id="NombreMadre" name="NombreMadre"
                                               autocomplete="off"  value="${ datos.NombreMadre }">
                                       </div>
                                       <div class="col-md-6">
                                           <label>Cédula</label>
                                           <input type="text" class="form-control" id="CedulaMadre" name="CedulaMadre"
                                               autocomplete="off"  value="${ datos.CedulaMadre }">
                                       </div>
                                       <div class="col-md-6">
                                           <label>Teléfono</label>
                                           <input type="tel" class="form-control" id="TelMadre" name="TelMadre"
                                               autocomplete="off"  value="${ datos.TelMadre }">
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="col-md-4">
                           <div class="card">
                               <div class="card-header">
                                   Datos personales padre
                               </div>
                               <div class="card-body">
                                   <div class="row">
                                       <div class="col-md-12">
                                           <label>Nombre</label>
                                           <input type="text" class="form-control" id="NombrePadre" name="NombrePadre"
                                               autocomplete="off"  value="${ datos.NombrePadre }">
                                       </div>
                                       <div class="col-md-6">
                                           <label>Cédula</label>
                                           <input type="text" class="form-control" id="CedulaPadre" name="CedulaPadre"
                                               autocomplete="off"  value="${ datos.CedulaPadre }">
                                       </div>
                                       <div class="col-md-6">
                                           <label>Teléfono</label>
                                           <input type="tel" class="form-control" id="TelPadre" name="TelPadre"
                                               autocomplete="off"  value="${ datos.TelPadre }">
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="col-md-4">
                           <div class="card">
                               <div class="card-header">
                                   Datos personales tutor
                               </div>
                               <div class="card-body">
                                   <div class="row">
                                       <div class="col-md-12">
                                           <label>Nombre</label>
                                           <input type="text" class="form-control" id="NombreTutor" name="NombreTutor"
                                               autocomplete="off"  value="${ datos.NombreTutor }">
                                       </div>
                                       <div class="col-md-6">
                                           <label>Cédula</label>
                                           <input type="text" class="form-control" id="CedulaTutor" name="CedulaTutor"
                                               autocomplete="off"  value="${ datos.CedulaTutor }">
                                       </div>
                                       <div class="col-md-6">
                                           <label>Teléfono</label>
                                           <input type="tel" class="form-control" id="TelTutor" name="TelTutor"
                                               autocomplete="off"  value="${ datos.TelTutor }">
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
                   <hr>
                   <div class="card">
                       <div class="card-header">
                           Detalles familiares
                       </div>
                       <div class="card-body">
                           <div class="row">
                               <div class="col-md-3">
                                   <label>El alumno vive con : </label>
                                   <select name="ViveCon" id="ViveCon"  class="form-control">
                                       <option selected  value="${ datos.ViveCon }">${ datos.ViveCon }</option>
                                       <option value="Ambos padres">Ambos padres</option>
                                       <option value="Solo con papá">Solo con papá</option>
                                       <option value="Solo con mamá">Solo con mamá</option>
                                       <option value="Con otro tipo de familiar">Con otro tipo de familiar</option>
                                   </select>
                               </div>
                               <div class="col-md-3">
                                   <label>Situación de los padres </label>
                                   <select name="SiticionPadres"  id="SiticionPadres" class="form-control">
                                       <option selected value="${ datos.SiticionPadres }">${ datos.SiticionPadres }</option>
                                       <option value="Padres Divorciados">Padres Divorciados</option>
                                       <option value="Padres en unión sentimental">Padres en unión sentimental</option>
                                       <option value="Padres en unión civil">Padres en unión civil</option>
                                       <option value="Padres en unión religiosa">Padres en unión religiosa</option>
                                       <option value="Madre fallecida">Madre fallecida</option>
                                       <option value="Padre fallecido">Padre fallecido</option>
                                   </select>
                               </div>
                               <div class="col-md-3">
                                   <label>Resposabilidad económica</label>
                                   <select name="ResEcono"  id="ResEcono" class="form-control">
                                       <option selected value="${ datos.ResEcono }">${ datos.ResEcono }</option>
                                       <option value="Ambos padres">Ambos padres</option>
                                       <option value="Solo de papá">Solo de papá</option>
                                       <option value="Solo de mamá">Solo de mamá</option>
                                       <option value="Con otro tipo de familiar">Con otro tipo de familiar</option>
                                   </select>
                               </div>
                               <div class="col-md-3">
                                   <label>Condición de salud diagnosticada</label>
                                   <input type="text" class="form-control"  id="condicionMedica" name="condicionMedica"
                                   autocomplete="off" value="${ datos.condicionMedica }">
                               </div>
                               <hr> `;

                                if(existFamiliares) { 

                                html += `   <div class="col-md-12">
                                   <label>Alumnos familiares inscritos</label>
                                   <ol> `;
                                       arrFamiliares.forEach( familiar =>{                                
                                        html += `   <li>${familiar[0].Nombre +' '+ familiar[0].Apellido  }</li> `;
                                    });
                                 html += `    </ol>
                               </div>`;

                               }
                            html += `       
                           </div>
                       </div>
                   </div>
                   <hr>
           </div>
       </div>
   </div>
 </body>
</html>`;
    return new Promise((resolver) => {
        tmpName = "reporte_matricula.pdf";
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
    GenerarPdf , GenerarBoletaFinal , GenerarReporteDeConducta, GenerarMatricula
};