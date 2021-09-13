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
        if (query.status) { $('#agregarAlumno').modal('hide'); $("#formEstudiantes")[0].reset(); swal.close(); return loadTable(); }
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
                    const html = `
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <a href="/admin/estudiantes/matriculas/${row.Carnet}" class="btn btn-primary btn-sm">Matriculas</a> 
                        <button type="button" data-id="${row.Carnet}" class="btn btn-danger btnDelete">Eliminar</button>
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

$('#datatable tbody').on('click', '.btnEdit', function () {
    const data = $('#datatable').DataTable().row(this.closest('tr')).data();
    $("#CarnetEdit").val(data.Carnet);
    $("#NombreEdit").val(data.Nombre);
    $("#ApellidoEdit").val(data.Apellido);
    $("#FechaNacEdit").val(data.FechaNac);
    $("#EmailEdit").val(data.Email);
    data.Genero =="Hombre" ?  $("#GeneroEdit").val(0) :  $("#GeneroEdit").val(1) ;
    $("#editAlumno").modal();

});
$('#datatable tbody').on('click', '.btnDelete', function () {
        const { id } = $(this).data();
        alertas.deleteAlertAjx("Eliminar estudiante", "¿Desea eliminar el estudiante seleccionado y todo lo relacionado a esta información? ALERTA, ESTA ACCIÓN NO SE PUEDE DESHACER Y ELIMINARA DATOS IMPORTANTES", "alumnos", "Carnet", `'${id}'`);
});

$("#btnGuardarEdit").click(() => {
    if (!$("#CarnetEdit").val() || !$("#NombreEdit").val() || !$("#ApellidoEdit").val() || !$("#GeneroEdit").val() || !$("#FechaNacEdit").val() || !$("#EmailEdit").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formEstudiantesEdit").submit();
});
$("#formEstudiantesEdit").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "PUT",
            url: "/admin/estudiantes",
            data: data,
        });
        if (query.status) { $('#editAlumno').modal('hide'); $("#formEstudiantesEdit")[0].reset(); swal.close(); return loadTable(); }
    } catch (error) {
        console.log(error);
        if (error.responseJSON.error == "CARNET_NO_EXISTENTE") return alertas.newErrorMessage('Carnet no encontrado');
        return alertas.newErrorMessage();
    }
});