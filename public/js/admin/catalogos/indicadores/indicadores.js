$("#formModeloMateria").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/indicadores",
            data: data,
        });
        if (query.status) return location.reload();
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});

$("#btnGuardar").click(() => {
    if (!$("#NombreMateriaInput").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formModeloMateria").submit();
});

$(document).ready(function () {
    $('#datatable').DataTable();
});

$(".btnDelete").on("click", function () {
    const { id } = $(this).data();
    console.log(id);
    alertas.deleteAlertAjx("Eliminar indicador", "¿Desea eliminar el indicador y todo lo relacionado a esta información?", "indicadoresparvularia", "id", id);
});


$('#datatable tbody').on('click', '.btnEdit', async function () {
    const data = $('#datatable').DataTable().row(this.closest('tr')).data();
    const { id } = $(this).data();
    const { value: indicador } = await Swal.fire({
        title: 'Editar indicador de logro preescolar',
        input: 'text',
        inputValue: data[0],
        showCancelButton: true,
        inputValidator: (value) => {
            if (!value) {
                return 'You need to write something!';
            }
        }
    });
    if (indicador) {
        try {
            alertas.loaderAlert();
            const query = await $.ajax({
                type: "PUT",
                url: "/admin/indicadores",
                data: {indicador , id},
            });
            if (query.status) return location.reload();
        } catch (error) {
            console.log(error);
            return alertas.newErrorMessage();
        }
    }
});