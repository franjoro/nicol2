$("#formMaestros").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/maestros",
            data: data,
        });
        if (query.status) {$('#modalMaestros').modal('hide') ; $("#formMaestros")[0].reset(); swal.close(); return loadTable(); }
    } catch (error) {
        console.log(error);
        if (error.responseJSON.error == "CORREO_EXISTENTE") return alertas.newErrorMessage('Correo electrónico duplicado');
        return alertas.newErrorMessage();
    }
});

$("#btnGuardar").click(() => {
    if (!$("#Nombre").val() || !$("#Apellido").val()  || !$("#Genero").val() || !$("#FechaNac").val() || !$("#Email").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formMaestros").submit();
});


const loadTable = () => {
    $("#datatable").DataTable().destroy();
    $("#datatable").DataTable({
        ajax: "/admin/maestros/table",
        columns: [
            { data: "Nombres" },
            { data: "Apellidos" },
            { data: "Genero" },
            { data: "FechaNac" },
            { data: "Email" }
        ],
    });
};
$(document).ready(function () {
    loadTable();
});

$("#formpassword").submit(async function (e) {
    e.preventDefault();
    const password  = $("#password").val();
    const idUsuario  = $("#idUsuario").val();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "PUT",
            url: "/",
            data: {password, idUsuario},
        });
        if (query.status) {$('#modalMaestros').modal('hide') ; $("#formpassword")[0].reset(); swal.close(); return alertas.Success() ;}
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});

$("#btnPassword").click(() => {
    if (!$("#password").val() || !$("#password2").val() ) return alertas.newErrorMessage("No se permiten espacios vacíos");
    if ($("#password").val() != $("#password2").val() ) return alertas.newErrorMessage("Las contraseñas no coinciden");
    $("#formpassword").submit();
});