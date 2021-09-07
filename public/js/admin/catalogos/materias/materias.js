$("#formModeloMateria").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/materias",
            data: data,
        });
        if (query.status) return location.reload();
    } catch  (error) {
        console.log(error);
        return  alertas.newErrorMessage();
    }
});

$("#btnGuardar").click( ()=> {
    if( !$("#NombreMateriaInput").val()  ||  !$("#AreaMateriaSelect").val() ) return alertas.newErrorMessage("No se permiten espacios vacíos"); 
    $("#formModeloMateria").submit();
});

$(document).ready( function () {
    $('#datatable').DataTable();
} );

$(".btnDelete").on("click", function () {
    const { id } = $(this).data();
    console.log(id);
    alertas.deleteAlertAjx("Eliminar modelo de materia", "¿Desea eliminar el modelo de materia y todo lo relacionado a esta información? ALERTA, ESTA ACCIÓN NO SE PUEDE DESHACER Y ELIMINARA DATOS IMPORTANTES SI LA MATERIA YA HA SIDO ASIGNADA", "modelomaterias", "id", id);
});