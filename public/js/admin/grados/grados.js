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


$(".changeStatus").on("click", async function () {
    try {
      let { role, statoch } = $(this).data();
      const yearActivo = $("#yearActivo").val();
      const { isConfirmed } = await alertas.ConfirmAlert(
        "¿Actualizar permisos de edición?",
        "Este cambio afectara el permiso en todas las materias de edición para profesores"
      );
      if (isConfirmed) {
        alertas.loaderAlert();
        const query = await $.ajax({
          type: "PUT",
          url: "/admin/grados/edicionglobal",
          data: { role, statoch, yearActivo },
        });
        swal.close();
        if(query.status) alertas.Success("Permisos de edición editados");
      }
    } catch (error) {
      console.log(error);
      return alertas.newErrorMessage();
    }
  });