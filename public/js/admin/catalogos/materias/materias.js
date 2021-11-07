$("#formModeloMateria").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/materias",
            data: data,
        });
        if (query.status) return location.reload();
    } catch  (error) {
        console.log(error);
        return  alertas.newErrorMessage();
    }
});

$("#btnGuardar").click( ()=> {
    if( !$("#NombreMateriaInput").val()  ||  !$("#AreaMateriaSelect").val() ) return alertas.newErrorMessage("No se permiten espacios vacíos"); 
    $("#formModeloMateria").submit();
});

$(document).ready( function () {
    $('#datatable').DataTable();
} );

$(".btnDelete").on("click", function () {
    const { id } = $(this).data();
    alertas.deleteAlertAjx("Eliminar modelo de materia", "¿Desea eliminar el modelo de materia y todo lo relacionado a esta información? ALERTA, ESTA ACCIÓN NO SE PUEDE DESHACER Y ELIMINARA DATOS IMPORTANTES SI LA MATERIA YA HA SIDO ASIGNADA", "modelomaterias", "id", id);
});

$('#datatable tbody').on('click', '.btnEdit', async function () {

    const data = $('#datatable').DataTable().row(this.closest('tr')).data();
    const { id } = $(this).data();

    const { value: formValues } = await Swal.fire({
        title: 'Editar Materia',
        html:
          `<label>Nombre materia:</label><input id="swal-input1" class="form-control" value="${data[0]}">
           <label>Siglas : </label> <input id="swal-input2" class="form-control" value="${data[1]}">`,
        focusConfirm: false,
        preConfirm: () => {
          return [
            document.getElementById('swal-input1').value,
            document.getElementById('swal-input2').value
          ];
        }
      });
      
    if (formValues) {
        try {
            alertas.loaderAlert();
            const query = await $.ajax({
                type: "PUT",
                url: "/admin/materias",
                data: {Materia: formValues[0]  , Siglas: formValues[1] , id},
            });
            if (query.status) return location.reload();
        } catch (error) {
            console.log(error);
            return alertas.newErrorMessage();
        }
    }
});