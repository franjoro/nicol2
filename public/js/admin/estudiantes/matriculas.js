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

