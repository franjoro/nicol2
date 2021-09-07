// Selector de modelo de maestros
$("#selectIndicadores").select2({
    width: "100%",
    ajax: {
      url: "/admin/indicadores/getIndi/" ,
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


$("#btnSaveIndicadores").click( ()=>{
  if(!$("#selectIndicadores").val().length ) return alertas.newErrorMessage("No se permiten espacios vacíos");
  $("#formIndicadores").submit();
});


// Agregar perfil academico
$("#formIndicadores").submit(async function (e) {
  e.preventDefault();
  const data = $(this).serialize();
  try {
    console.log(data);
    alertas.loaderAlert();
      const query = await $.ajax({
          type: "POST",
          url: `/admin/indicadores/materiaIndicador`,
          data: data,
      });
      swal.close();
      console.log(query);
      if (query.status) return location.reload();
  } catch (error) {
      console.log(error);
      return alertas.newErrorMessage();
  }
});

$(".btnDelete").on("click", function () {
  const { id } = $(this).data();
  alertas.deleteAlertAjxMaestros("Eliminar indicador de logro", "¿Desea eliminar indicador de logro y todo lo relacionado a esta información? (ESTO ELIMINARA LAS NOTAS YA INGRESADAS DE ESTE INDICADOR)", "indicadores_materia", "id", id);
});