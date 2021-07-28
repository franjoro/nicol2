$("#formCodigos").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/codigos",
            data: data,
        });
        if (query.status) return location.reload();
    } catch  (error) {
        console.log(error);
        return  alertas.newErrorMessage();
    }
});

$("#btnGuardar").click( ()=> {
    if( !$("#codigoInput").val()   || !$("#selectCodigo").val()   ||  !$("#value").val() ) return alertas.newErrorMessage("No se permiten espacios vacíos"); 
    $("#formCodigos").submit();
});
$(document).ready( function () {
    $('#datatable').DataTable();
} );