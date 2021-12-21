// matricula
$("#formMatricula").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serializeArray();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "PUT",
            url: "/admin/estudiantes/editMatricula/"+$("#idMatricula").val(),
            data: data
        });
        swal.close();
        if (query.status) alertas.Success('Matricula actualizada correctamente');
        location.reload();
   } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});
// Boton de formulario estudiantes
$("#btnGuardar").click(() => {
    if (!$("#carnet").val() || !$("#Nombres").val() || !$("#Apellidos").val() || !$("#EmailMain").val() || !$("#FechaNac").val() || !$("#idMatricula").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formMatricula").submit();
});



$(".btnDeleteMatricula").on("click", function () {
    const { id } = $(this).data();
    console.log(id);
    alertas.deleteAlertAjx(
      "Eliminar matricula",
      "Se borrara la información registrada, nota: si desea eliminar al estudiante del grado debera hacerlo manualmente.",
      "matriculas",
      "id",
      id
    );
  });

  
$("#generateReporte").click( async() => {
    try {
        const {id} =  $("#generateReporte").data();
        alertas.loaderAlert();
        const query = await $.ajax({ url: `/admin/estudiantes/createMatriculaReport/${id}` });
        if (query.status) {
            swal.close();
            window.open(`/admin/estudiantes/getReportMatricula `);
        }
        console.log(query);
    } catch (error) {
        console.log(error);
        alertas.newErrorMessage("Error al generar documento");
    }
});