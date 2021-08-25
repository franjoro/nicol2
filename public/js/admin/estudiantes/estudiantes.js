$("#formEstudiantes").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/estudiantes",
            data: data,
        });
        if (query.status) {$('#agregarAlumno').modal('hide') ; $("#formEstudiantes")[0].reset(); swal.close(); return loadTable(); }
    } catch (error) {
        console.log(error);
        if (error.responseJSON.error == "CARNET_EXISTENTE") return alertas.newErrorMessage('Carnet dúplicado');
        return alertas.newErrorMessage();
    }
});

$("#btnGuardar").click(() => {
    if (!$("#Carnet").val() || !$("#Nombre").val() || !$("#Apellido").val() || !$("#Genero").val() || !$("#FechaNac").val() || !$("#Email").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formEstudiantes").submit();
});

const loadTable = () => {
    $("#datatable").DataTable().destroy();
    $("#datatable").DataTable({
        ajax: "/admin/estudiantes/table",
        columns: [
            { data: "Carnet" },
            { data: "Nombre" },
            { data: "Apellido" },
            { data: "Genero" },
            { data: "FechaNac" },
            { data: "Email" },
            {
                "render": function (data, type, row) {
                    const html = `<a href="/admin/estudiantes/matriculas/${row.Carnet}" class="btn btn-primary btn-sm">Ver matriculas</a>`;
                    return html;
                }
            },
        ],
    });
};
$(document).ready(function () {
    loadTable();
});

