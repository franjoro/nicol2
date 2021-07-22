$("#formYear").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/years",
            data: data,
        });
        if (query.status) return location.reload();
    } catch  (error) {
        console.log(error);
        if(error.responseJSON.error == "YEAR_EXIST") return  alertas.newErrorMessage('Año ya existente');
    }
});

$("#btnGuardarForm").click( ()=> {
    if( !$("#yearInputId").val()) return alertas.newErrorMessage("No se permiten espacios vacíos"); 
    $("#formYear").submit();
});