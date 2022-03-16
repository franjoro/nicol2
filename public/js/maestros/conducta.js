$(document).ready(function() {
    $('#datatableC').DataTable();
});


$('#datatableC tbody').on('click', 'tr', function() {
    const {
        [0]: codigoAlumno, [1]: Nombre, [2]: Apellidos
    } = $('#datatableC').DataTable().row(this).data();
    $("#textAlumno").text(`${Nombre} ${Apellidos}`);
    $("#textAlumnoObservacion").text(`${Nombre} ${Apellidos}`);
    $("#idAlumno").val(codigoAlumno.trim());
    $("#idAlumnoObs").val(codigoAlumno.trim());
});

// Agregar codigo de conducta
$("#formCodigo").submit(async function(e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/maestros/conducta",
            data: data,
        });
        swal.close();
        $("#modalAddCodigo").modal('hide');
        $("#formCodigo")[0].reset();
        if (query.status) return alertas.Success('Código asignado correctamente');
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});

// Boton de formulario estudiantes
$("#btnGuardarCodigo").click(() => {
    if (!$("#idCodigo").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formCodigo").submit();
});


// Agregar OBSERVACION 
$("#formObservacion").submit(async function(e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/maestros/observacion",
            data: data,
        });
        swal.close();
        $("#modalAddObservacion").modal('hide');
        $("#formObservacion")[0].reset();
        if (query.status) return alertas.Success('Observación asignada correctamente');
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});
// Boton de formulario estudiantes
$("#btnGuardarObservacion").click(() => {
    if (!$("#descripcionobservacion").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formObservacion").submit();
});