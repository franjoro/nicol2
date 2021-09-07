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




$("#formSettings").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/years/settings",
            data: data,
        });
        if (query.status) return location.reload();
    } catch  (error) {
        console.log(error);
        alertas.newErrorMessage();
    }
});

$("#btnGuardarSettings").click( async()=> {
    console.log("boton");
    if( !$("#bimestre").val() || !$("#year").val() ) return alertas.newErrorMessage("No se permiten espacios vacíos"); 
    const { isConfirmed } = await alertas.ConfirmAlert("¿Deseá actualizar la configuración de año y bimestre?", "Esto tendra repercuciones en los perfiles acádemicos, ingreso de notas y permisos de edición");
    if(isConfirmed) return $("#formSettings").submit();    
});


$(".btnDelete").on("click", function () {
    Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "No se pudo realizar la operación. Para eliminar un año debe hacerse vía base de datos" ,
      });
});