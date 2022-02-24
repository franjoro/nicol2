$(document).ready(function() {
    const roleBimestre = $("#roleBimestre").val();
    $("#selectBimestre").val(roleBimestre);

});
let global_json_boletaFinal = null,
    global_json_bimestral = null,
    global_json_conAnual = null,
    global_json_conBimestral = null,
    global_idGrado = null,
    global_boletaBimestral_conducta = null;


$("#selectBimestre").change(function() {
    const value = $(this).val();
    window.location = "/admin/notas/" + value;
});

$(".selectEstudiantes").select2({
    width: "100%",
    ajax: {
        url: "/admin/estudiantes/getEstudiantesAll",
        type: "post",
        dataType: "json",
        delay: 250,
        data(params) {
            return {
                searchTerm: params.term, // search term
            };
        },
        results(response) {
            $.map(response, (item) => ({
                id: item.id,
                text: item.text,
            }));
        },
        cache: true,
    },
});




const fillNotasByAlumno = async(idAlumno) => {
    const idBimestre = $("#idBimestre").val();
    const query = await $.ajax({ url: `/admin/notas/getNotasEstudiantes/${idAlumno}/${idBimestre}`, });

    let html = ``;
    query.forEach(element => {
        const arr1 = [],
            arr2 = [],
            arr3 = [];
        element.notas.forEach(nota => {
            if (nota.RoleActivida == 1) arr1.push(nota);
            if (nota.RoleActivida == 2) arr2.push(nota);
            if (nota.RoleActivida == 3) arr3.push(nota);
        });
        html += `
        <div class="card card-header-actions my-4">
        <div class="card-header bg-primary">
            <h4 class="text-light my-0">${element.Nombre}</h4>
        </div>
        <div class="card-body px-0">
            <div class="d-flex align-items-center justify-content-between px-4">
                <table class="table table-bordered table-hover my-2">
                    <thead>
                        <tr>
                            <th scope="col">Actividad</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Porcentaje a obtener</th>
                            <th scope="col">Nota Obtenida</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                           <td rowspan="${arr1.length + 2}" class="col-md-3">
                                 Primer consolidado 30%
                            </td>   
                        </tr>`;
        let notaSuma1 = 0;
        arr1.forEach((nota1) => {
            notaSuma1 = Number(notaSuma1) + Number(nota1.nota);
            html += `
                                <tr>        
                                    <td>${nota1.tituloAcumulado}</td>
                                    <td>${nota1.acumuladoPorcentaje}</td>
                                    <td>${nota1.nota} <button class="btn btn-primary float-end btn-sm btnEdit" data-nota="${nota1.nota} " data-id="${nota1.idNota}">Editar</button> </td>
                                </tr>        
                                `;
        });
        html += `
                        <tr class="table-primary">
                           <td>
                               <b> Nota 30% </b>
                            </td>   
                           <td>
                               <b>30</b>
                            </td>   
                           <td>
                               <b> ${notaSuma1}</b>
                            </td>   
                        </tr>
                        <tr>
                            <td rowspan="${arr2.length + 2}" class="col-md-3">
                              Segundo consolidado 30%
                            </td>   
                        </tr>`;
        let notaSuma2 = 0;
        arr2.forEach((nota1) => {
            notaSuma2 = Number(notaSuma2) + Number(nota1.nota);
            html += `
                             <tr>        
                                 <td>${nota1.tituloAcumulado}</td>
                                 <td>${nota1.acumuladoPorcentaje}</td>
                                 <td>${nota1.nota} <button class="btn btn-primary float-end btn-sm btnEdit" data-nota="${nota1.nota} " data-id="${nota1.idNota}">Editar</button></td>
                             </tr>        
                             `;
        });
        html += `
                        <tr class="table-primary">
                           <td>
                               <b> Nota 30% </b>
                            </td>   
                           <td>
                               <b>30</b>
                            </td>   
                           <td>
                               <b> ${notaSuma2}</b>
                            </td>   
                        </tr>
                        <tr>
                            <td rowspan="${arr3.length + 2}" class="col-md-3">
                              Examen 40%
                            </td>   
                        </tr>`;
        let notaSuma3 = 0;
        arr3.forEach((nota1) => {
            notaSuma3 = Number(notaSuma3) + Number(nota1.nota);
            html += `
                             <tr>        
                                 <td>${nota1.tituloAcumulado}</td>
                                 <td>${nota1.acumuladoPorcentaje}</td>
                             `;
            if ($("#permisoUpdate").val() == 'true') {
                html += `<td>${nota1.nota} <button class="btn btn-primary float-end btn-sm btnEdit" data-nota="${nota1.nota} " data-id="${nota1.idNota}">Editar</button></td>`;
            }
            html += `</tr>`;

        });
        html += `
                        <tr class="table-primary">
                           <td>
                               <b> Nota 40% </b>
                            </td>   
                           <td>
                               <b>40</b>
                            </td>   
                           <td>
                               <b> ${notaSuma3}</b>
                            </td>   
                        </tr>    
                        <tr class="table-success">
                           <td colspan="2">
                               <b> Nota 100% </b>
                            </td>   
                           <td>
                               <b>100</b>
                            </td>   
                           <td>
                               <b> ${notaSuma1 + notaSuma2 + notaSuma3}</b>
                            </td>   
                        </tr>   
                    </tbody>
                </table>
            </div>
        </div>
    </div>
        `;
    });
    $("#notasAlumno").html(html);

    $(".btnEdit").on("click", function() {
        const { id, nota } = $(this).data();
        alertaChangeNota(id, nota);
    });

};

$("#selectEstudiantes").change(async function() {
    const value = $(this).val();
    fillNotasByAlumno(value);
});


$("#selectEstudiantesBoleta").change(async function() {
    const value = $(this).val();
    fillBoletaFinal(value);
});

$("#selectBoletaAcumulados").change(async function() {
    const value = $(this).val();
    fillBoletaBimestral(value);
});

$("#selectNotaGrado").change(async function() {
    const value = $(this).val();
    global_idGrado = value;
    fillNotasByGrado(value);
});


$("#selectConsolidado").change(async function() {
    const value = $(this).val();
    fillConsolidadoAnual(value);
});


const fillNotasByGrado = async(idGrado) => {
    try {
        const idBimestre = $("#idBimestre").val();
        const query = await $.ajax({ url: `/admin/notas/getNotasGrado/${idGrado}/${idBimestre}` });
        let html = `<div class="alert alert-danger" role="alert">Ningun alumno asignado al grado seleccionado</div>`;
        if (query.length) {
            html = `<table class="table table-bordered table-striped table-sm"> <thead> <tr class="bg-blue text-black">  <th>Estudiante</th>`;
            query[0].notas.forEach(not => {
                html += `<th>${not.Nombre}</th>`;
            });
            html += `<td>Conducta</td> <td>Prom.</td> </tr></thead><tbody>`;

            query.forEach(estudiante => {
                html += `<tr><td>${estudiante.nombreAlumno}</td> `;
                estudiante.notas.forEach(nota => {
                    let color = "black";
                    if (nota.nota < 60) color = "red";
                    if (nota.nota >= 60 && nota.nota <= 69) color = "blue";
                    html += `<td style="color:${color}">${nota.nota}</td>`;
                });
                html += `<td>${estudiante.puntaje}</td><td>${estudiante.promedio}</td></tr>`;

            });
            html += `</tbody></table>`;
        }
        global_json_conBimestral = html;
        $("#htmlByGrado").html(html);
    } catch (error) {
        $("#htmlByGrado").html("");
    }
};


const fillBoletaFinal = async(idAlumno) => {
    try {
        const query = await $.ajax({ url: `/admin/notas/getBoletaFinal/${idAlumno}` });
        let html = `<div class="alert alert-danger" role="alert">Ningun alumno asignado al grado seleccionado</div>`;
        if (query.length) {
            html = `<table class="table table-bordered table-sm table-striped">
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
         <tbody>`;
            query.forEach(estudiante => {
                estudiante.notas.forEach(notasOne => {
                    html += `<tr><td>${notasOne.Nombre}</td> `;
                    notasOne.notas.forEach(nota => {
                        html += `<td>${nota.nota}</td><td>${nota.prom}</td>`;
                    });
                    html += `<td>${notasOne.notaGlobal}</td></tr>`;
                });
            });
            html += `</tbody></table>`;
        }
        global_json_boletaFinal = html;
        $("#HtmlBoletaFinal").html(html);
    } catch (error) {
        $("#HtmlBoletaFinal").html("");
    }
};


const fillBoletaBimestral = async(idAlumno) => {
    try {
        const idBimestre = $("#idBimestre").val();
        const query = await $.ajax({ url: `/admin/notas/getBoletaBimestral/${idAlumno}/${idBimestre}` });
        let html = `<div class="alert alert-danger" role="alert">Ningun alumno asignado al grado seleccionado</div>`;

        if (query.length) {
            html = `<table class="table table-bordered table-sm table-striped" >
         <thead>
           <tr class="bg-blue text-black">
             <th>Materia</th>
             <th>I 30%</th>
             <th>II 30%</th>
             <th>Examen</th>
             <th>Final</th>
           </tr>
         </thead>
         <tbody>`;
            query.forEach(estudiante => {
                global_boletaBimestral_conducta = estudiante.conducta;
                estudiante.notas.forEach(notasOne => {
                    html += `<tr><td>${notasOne.Nombre}</td> `;
                    notasOne.notas.forEach(nota => {
                        html += `<td>${nota.nota}</td></td>`;
                    });
                    html += `<td>${notasOne.notaTotal}</td></tr>`;
                });
            });
            html += `
            <tr>
                <td>Conducta</td>
                <td colspan="4">${query[0].conducta}</td>
            </tr>
            </tbody></table>`;
        }
        global_json_bimestral = html;
        $("#HtmlBoletaAcumulados").html(html);
    } catch (error) {
        $("#HtmlBoletaAcumulados").html("");
    }
};

const fillConsolidadoAnual = async(idGrado) => {
    try {
        const query = await $.ajax({ url: `/admin/notas/getConsolidadoAnual/${idGrado}` });
        let html = `<div class="alert alert-danger" role="alert">Ningun alumno asignado al grado seleccionado</div>`;
        if (query.length) {
            html = `<table class="table table-bordered table-striped table-sm"> <thead> <tr class="bg-blue text-black">  <th>Estudiante</th>`;
            query[0].notas.forEach(not => {
                html += `<th>${not.Nombre}</th>`;
            });
            html += `<td>Promedio</td><td>Conducta</td></tr>
            </thead><tbody>`;
            query.forEach(estudiante => {
                html += `<tr><td>${estudiante.nombreAlumno}</td> `;
                estudiante.notas.forEach(nota => {
                    let color = "black";
                    if (nota.notaGlobal < 60) color = "red";
                    if (nota.notaGlobal >= 60 && nota.notaGlobal <= 69) color = "blue";
                    html += `<td style="color:${color}">${nota.notaGlobal}</td>`;

                });
                html += `<td>${estudiante.notaPromedio}</td><td>${estudiante.conducta}</td></tr>`;
            });
            html += `</tbody></table>`;
        }
        global_json_conAnual = html;
        $("#htmlByConsolidado").html(html);
    } catch (error) {
        $("#htmlByConsolidado").html("");
    }
};


const alertaChangeNota = async(id, nota) => {
    const { value: notaResult } = await Swal.fire({
        title: 'Editar nota seleccionada',
        input: 'text',
        inputLabel: 'Nota: ',
        inputValue: nota.trim(),
        showCancelButton: true,
        inputValidator: (value) => {
            if (!value) {
                return 'No puede ingresar espacios vacíos';
            }
            if (!Number(value)) {
                return 'Debe ingresar un número';
            }
        }
    });
    if (notaResult) {
        const query = await $.ajax({ url: `/admin/notas/`, method: "PUT", data: { nota: notaResult, id } });
        if (query.status) {
            const value = $("#selectEstudiantes").val();
            fillNotasByAlumno(value);
            return alertas.Success("Nota actualizada correctamente");
        }
    }
};




$("#btnReporteFinal").click(() => {
    const html = `
            <h3>Boleta de calificaciones </h3>
            <table class="table">
            <tbody>
                <tr>
                    <td>Carnet: <span class="font-weight-bold">${$("#selectEstudiantesBoleta").val()}</span></td>
                    <td>Nombre: <span class="font-weight-bold">${$("#selectEstudiantesBoleta").text().split("-")[2].trim()}</span></td>
                </tr>
            </tbody>
        </table>`;
    if (global_json_boletaFinal !== null) sendDataToPdf(global_json_boletaFinal, html, false, $("#textAreaBoletaFinal").val());
});

$("#btnReporteBimestral").click(async() => {
    const selector = $("#selectBoletaAcumulados option:selected").text().split("-");
    const { nombreGrado } = await $.ajax({ url: `/admin/notas/getGrado/${selector[0]}-${selector[1]}` });
    const html = `
            <h3>Boleta bimestral de notas </h3>
            <table class="table">
            <tbody>
                <tr>
                    <td>Carnet: <span class="font-weight-bold">${$("#selectBoletaAcumulados").val()}</span></td>
                    <td>Nombre: <span class="font-weight-bold">${selector[2].trim()}</span></td>
                    <td>Grado: <span class="font-weight-bold">${nombreGrado}</span></td>
                    <td>Bimestre: <span class="font-weight-bold">${$("#roleBimestre").val()}</span></td>
                    <td>Conducta: <span class="font-weight-bold">${global_boletaBimestral_conducta}</span></td>
                </tr>
            </tbody>
        </table>`;
    if (global_json_bimestral !== null) sendDataToPdf(global_json_bimestral, html, false, $("#textAreaBoletaBimestral").val());
});

$("#btnReporteConsolidadoAnual").click(() => {
    const html = `
            <h3>Consolidado Anual </h3>
            <table class="table">
            <tbody>
                <tr>
                    <td>Grado: <span class="font-weight-bold">${$("#selectConsolidado option:selected").text().trim()}</span></td>
                </tr>
            </tbody>
        </table>`;
    if (global_json_conAnual !== null) sendDataToPdf(global_json_conAnual, html, false, $("#textAreaConsolidadoAnual").val());
});

$("#btnReporteConsolidadoBimestral").click(() => {
    const html = `
            <h3>Consolidado Bimestral - ${new Date().getFullYear()}</h3>
            <table class="table">
            <tbody>
                <tr>
                    <td>Grado: <span class="font-weight-bold">${$("#selectNotaGrado option:selected").text().trim()}</span></td>
                    <td>Bimestre: <span class="font-weight-bold">${$("#roleBimestre").val()}</span></td>
                </tr>
            </tbody>
        </table>`;
    if (global_json_conBimestral !== null) sendDataToPdf(global_json_conBimestral, html, true, $("#textAreaConsolidadoBimestral").val());
});


const sendDataToPdf = async(data, header, landscape = false, observaciones = "") => {
    const plainText = data.trim();
    const plainHeader = header.trim();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({ url: `/admin/notas/generatePdfHtml`, type: "POST", data: { html: plainText, header: plainHeader, landscape, observaciones } });
        if (query.status) {
            swal.close();
            window.open(`/admin/notas/getFile `);
        }
    } catch (error) {
        console.log(error);
        alertas.newErrorMessage("Error al generar documento");
    }
};

$("#btnReporteConsolidadoBimestralExcel").click(async() => {
    const idBimestre = $("#idBimestre").val();
    const nombreGrado = $("#selectNotaGrado option:selected").text().trim();
    const query = await $.ajax({ url: `/admin/notas/getNotasGradoExcel/${global_idGrado}/${idBimestre}/${nombreGrado}` });
    if (query.status) {
        swal.close();
        window.open(`/admin/notas/download/${query.path} `);
    }
});

$("#btnReporteGenerado").click(async() => {
    try {
        const idGrado = $("#selectGradoReporte").val();
        const nombreGrado = $("#selectGradoReporte option:selected").text().trim();
        const roleBimestre = $("#roleBimestre").val();
        alertas.loaderAlert();
        const query = await $.ajax({ url: `/admin/notas/boletaFinal/${idGrado}/${nombreGrado}/${roleBimestre}` });
        if (query.status) {
            swal.close();
            window.open(`/admin/notas/getReport `);
        }
    } catch (error) {
        console.log(error);
        alertas.newErrorMessage("Error al generar documento");
    }
});