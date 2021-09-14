$("#formCiclo").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/ciclos",
            data: data,
        });
        if (query.status) return location.reload();
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});

$("#btnGuardar").click(() => {
    if (!$("#isParvularia").val() || !$("#cicloName").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formCiclo").submit();
});
$(document).ready(function () {
    $('#datatable').DataTable();
});

$(".btnDelete").on("click", function () {
    const { id } = $(this).data();
    console.log(id);
    alertas.deleteAlertAjx("Eliminar ciiclo educativo", "¿Desea eliminar el ciclo y todo lo relacionado a esta información? ALERTA, ESTA ACCIÓN NO SE PUEDE DESHACER Y ELIMINARA DATOS IMPORTANTES Y GRADOS ASIGNADOS", "ciclos", "id", id);
});



$('#datatable tbody').on('click', '.btnEdit', async function () {
    const data = $('#datatable').DataTable().row(this.closest('tr')).data();
    const { id } = $(this).data();
    const { value: cicloName } = await Swal.fire({
        title: 'Editar texto ciclo educativo',
        input: 'text',
        inputValue: data[0],
        showCancelButton: true,
        inputValidator: (value) => {
            if (!value) {
                return 'You need to write something!';
            }
        }
    });
    if (cicloName) {
        try {
            alertas.loaderAlert();
            const query = await $.ajax({
                type: "PUT",
                url: "/admin/ciclos",
                data: {cicloName , id},
            });
            if (query.status) return location.reload();
        } catch (error) {
            console.log(error);
            return alertas.newErrorMessage();
        }
    }
});