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