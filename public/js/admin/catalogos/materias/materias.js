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
    const { value: codigoInput } = await Swal.fire({
        title: 'Editar nombre de materia',
        input: 'text',
        inputValue: data[0],
        showCancelButton: true,
        inputValidator: (value) => {
            if (!value) {
                return 'You need to write something!';
            }
        }
    });
    if (codigoInput) {
        try {
            alertas.loaderAlert();
            const query = await $.ajax({
                type: "PUT",
                url: "/admin/materias",
                data: {codigoInput , id},
            });
            if (query.status) return location.reload();
        } catch (error) {
            console.log(error);
            return alertas.newErrorMessage();
        }
    }
});