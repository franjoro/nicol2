$("#formCiclo").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/ciclos",
            data: data,
        });
        if (query.status) return location.reload();
    } catch  (error) {
        console.log(error);
        return  alertas.newErrorMessage();
    }
});

$("#btnGuardar").click( ()=> {
    if( !$("#isParvularia").val() ||  !$("#cicloName").val() ) return alertas.newErrorMessage("No se permiten espacios vacíos"); 
    $("#formCiclo").submit();
});
$(document).ready( function () {
    $('#datatable').DataTable();
} );