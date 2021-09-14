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
        if (query.status) { $('#modalMaestros').modal('hide'); $("#formMaestros")[0].reset(); swal.close(); return loadTable(); }
    } catch (error) {
        console.log(error);
        if (error.responseJSON.error == "CORREO_EXISTENTE") return alertas.newErrorMessage('Correo electrónico duplicado');
        return alertas.newErrorMessage();
    }
});

$("#btnGuardar").click(() => {
    if (!$("#Nombre").val() || !$("#Apellido").val() || !$("#Genero").val() || !$("#FechaNac").val() || !$("#Email").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
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
            { data: "Email" },
            {
                "render": function (data, type, row) {
                    const html = `
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button" data-id="${row.id}" class="btn btn-danger btnDelete">Eliminar</button>
                        <button type="button" class="btn btn-info btnEdit">Editar</button>
                    </div>
                    `;
                    return html;
                }
            },
        ],
    });
};
$(document).ready(function () {
    loadTable();
});

$("#formpassword").submit(async function (e) {
    e.preventDefault();
    const password = $("#password").val();
    const idUsuario = $("#idUsuario").val();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "PUT",
            url: "/",
            data: { password, idUsuario },
        });
        if (query.status) { $('#modalMaestros').modal('hide'); $("#formpassword")[0].reset(); swal.close(); return alertas.Success(); }
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});

$("#btnPassword").click(() => {
    if (!$("#password").val() || !$("#password2").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    if ($("#password").val() != $("#password2").val()) return alertas.newErrorMessage("Las contraseñas no coinciden");
    $("#formpassword").submit();
});

$('#datatable tbody').on('click', '.btnDelete', function () {
    const { id } = $(this).data();
    alertas.deleteAlertAjx("Eliminar maestro", "¿Desea eliminar el maestro seleccionado y todo lo relacionado a esta información? ALERTA, ESTA ACCIÓN NO SE PUEDE DESHACER Y ELIMINARA DATOS IMPORTANTES", "maestros", "id", `${id}`);
});

$('#datatable tbody').on('click', '.btnEdit', function () {
    const data = $('#datatable').DataTable().row(this.closest('tr')).data();
    $("#idMaestro").val(data.id);
    $("#NombreEdit").val(data.Nombres);
    $("#ApellidoEdit").val(data.Apellidos);
    $("#FechaNacEdit").val(data.FechaNac);
    $("#EmailEdit").val(data.Email);
    data.Genero == "Hombre" ? $("#GeneroEdit").val(0) : $("#GeneroEdit").val(1);
    $("#editMaestro").modal();
});

$("#formMaestrosEdit").submit(async function (e) {
    console.log("entra form");
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "PUT",
            url: "/admin/maestros",
            data: data,
        });
        if (query.status) { $('#editMaestro').modal('hide'); $("#formMaestrosEdit")[0].reset(); swal.close(); return loadTable(); }
    } catch (error) {
        console.log(error);
        if (error.responseJSON.error == "CARNET_NO_EXISTENTE") return alertas.newErrorMessage('Carnet no encontrado');
        return alertas.newErrorMessage();
    }
});

$("#btnGuardarEdit").click(() => {
    if (!$("#idMaestro").val() || !$("#NombreEdit").val() || !$("#ApellidoEdit").val() || !$("#GeneroEdit").val() || !$("#FechaNacEdit").val() || !$("#EmailEdit").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formMaestrosEdit").submit();
});


