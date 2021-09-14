$("#formGrados").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/grados",
            data: data,
        });
        if (query.status) return location.reload();
    } catch  (error) {
        console.log(error);
        return  alertas.newErrorMessage();
    }
});

$("#btnGuardar").click( ()=> {
    if( !$("#NombreCurso").val() ||  !$("#idCiclo").val() ) return alertas.newErrorMessage("No se permiten espacios vacíos"); 
    $("#formGrados").submit();
});



$(document).ready( function () {
    $('#datatable').DataTable();
    const yearActivo = $("#yearActivo").val();
    $("#selectorYear").val(yearActivo);
} );

$("#selectorYear").on("change", function(){
    const value = $(this).val();
    window.location = "/admin/grados/"+value;

});


$(".btnDelete").on("click", function () {
    const { id } = $(this).data();
    alertas.deleteAlertAjx("Eliminar grado", "¿Desea eliminar el grado y todo lo relacionado a esta información? ALERTA, ESTA ACCIÓN NO SE PUEDE DESHACER Y ELIMINARA DATOS IMPORTANTES", "grados", "id", id);
});