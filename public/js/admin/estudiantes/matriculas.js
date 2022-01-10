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

  
$("#updatePicture").click( async() => {
    const { value: alert } = await Swal.fire({
        title: 'Actualizar imagen',
        showCancelButton: true,
        html: `<input type="file" name="imagen" class="form-control" id="imagen">`,
      });
      
      if (alert) {
        try {
            const fd = new FormData();
            fd.append("idAlumno", $("#carnet").val().trim());
            fd.append("idMatricula", $("#idMatricula").val());
            fd.append('imagen', $(`#imagen`)[0].files[0]);
    
            const respuesta = await $.ajax({
                url: "/admin/estudiantes/img",
                type: "PUT",
                data: fd,
                processData: false,
                contentType: false,
            });
            if(respuesta.status){
                location.reload();
            }
            console.log(respuesta);
        } catch (error) {
            console.error(error);
        }
      }
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