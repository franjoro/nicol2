$("#formArea").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/areas",
            data: data,
        });
        if (query.status) return location.reload();
    } catch  (error) {
        console.log(error);
        return  alertas.newErrorMessage();
    }
});

$("#btnGuardar").click( ()=> {
    if( !$("#areaInputId").val()) return alertas.newErrorMessage("No se permiten espacios vacíos"); 
    $("#formArea").submit();
});

$(document).ready( function () {
    $('#datatable').DataTable();
} );

$(".btnDelete").on("click", function () {
    const { id } = $(this).data();
    console.log(id);
    alertas.deleteAlertAjx("Eliminar área", "¿Desea eliminar área y todo lo relacionado a esta información?", "areas", "id", id);
});