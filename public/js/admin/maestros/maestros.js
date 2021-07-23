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
            { data: "Email" },
            {
                "render": function () {
                    const html = `<button class="btn btn-danger">Eliminar</button>`;
                    return html;
                }
            },
        ],
    });
};
$(document).ready(function () {
    loadTable();
});

