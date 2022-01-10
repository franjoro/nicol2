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
        const { Nombre, Apellido, Email, FechaNac, Genero } = data[0];
        $("#Nombres").val(Nombre);
        $("#Apellidos").val(Apellido);
        $("#EmailMain").val(Email);
        $("#FechaNac").val(FechaNac);
        $("#Sexo").val(Genero);
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
  