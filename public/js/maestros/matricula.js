// matricula
$("#formMatricula").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serializeArray();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/maestros/matricula",
            data: data,
        });
        swal.close();
        if (query.status) alertas.Success('Matricula registrada correctamente');
        sendFile(query.insertId);
        return $("#formMatricula")[0].reset();
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});
// Boton de formulario estudiantes
$("#btnGuardar").click(() => {
    if (!$("#carnet").val() || !$("#Nombres").val() || !$("#Apellidos").val() || !$("#EmailMain").val() || !$("#Sexo").val() || !$("#FechaNac").val() || !$("#idGrado").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formMatricula").submit();
});




$("#carnet").on("blur", async function () {
    const carnet = $(this).val();
    const data = await $.ajax({ url: "/maestros/matricula/" + carnet });
    if (data.length) {
      const dataSet = data[0];
      console.log(dataSet);
      $("#Nombres").val(dataSet.Nombres);
      $("#Apellidos").val(dataSet.Apellidos);
      $("#EmailMain").val(dataSet.EmailMain);
      $("#Direccion").val(dataSet.Direccion);
      $("#Sexo").val(dataSet.Sexo);
      $("#FechaNac").val(dataSet.FechaNac);
      $("#Tel").val(dataSet.Tel);
      $("#codigoContable").val(dataSet.codigoContable);
      $("#NombreMadre").val(dataSet.NombreMadre);
      $("#CedulaMadre").val(dataSet.CedulaMadre);
      $("#TelMadre").val(dataSet.TelMadre);
      $("#NombrePadre").val(dataSet.NombrePadre);
      $("#CedulaPadre").val(dataSet.CedulaPadre);
      $("#TelPadre").val(dataSet.TelPadre);
      $("#NombreTutor").val(dataSet.NombreTutor);
      $("#CedulaTutor").val(dataSet.CedulaTutor);
      $("#TelTutor").val(dataSet.TelTutor);
      $("#ViveCon").val(dataSet.ViveCon);
      $("#SiticionPadres").val(dataSet.SiticionPadres);
      $("#ResEcono").val(dataSet.ResEcono);
      $("#condicionMedica").val(dataSet.condicionMedica);
    }
});


const sendFile = async (idMatricula) => {
    try {
        const fd = new FormData();
        fd.append("idAlumno", $("#carnet").val());
        fd.append("idMatricula", idMatricula);
        fd.append('imagen', $(`#imagen`)[0].files[0]);

        const respuesta = await $.ajax({
            url: "/maestros/img",
            type: "POST",
            data: fd,
            processData: false,
            contentType: false,
        });
        console.log(respuesta);
    } catch (error) {
        console.error(error);
    }
};


$("#selectEstudiantes").select2({
    width: "100%",
    ajax: {
      url: "/maestros/getEstudiantesAll",
      type: "post",
      dataType: "json",
      delay: 250,
      data(params) {
        return {
          searchTerm: params.term, // search term
        };
      },
      results(response) {
        console.log(response);
        $.map(response, (item) => ({
          id: item.id,
          text: item.text,
        }));
      },
      cache: true,
    },
  });
  