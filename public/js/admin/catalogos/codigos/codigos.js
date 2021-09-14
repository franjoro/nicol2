$("#formCodigos").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/codigos",
            data: data,
        });
        if (query.status) return location.reload();
    } catch  (error) {
        console.log(error);
        return  alertas.newErrorMessage();
    }
});

$("#btnGuardar").click( ()=> {
    if( !$("#codigoInput").val()   || !$("#selectCodigo").val()   ||  !$("#value").val() ) return alertas.newErrorMessage("No se permiten espacios vacíos"); 
    $("#formCodigos").submit();
});

$(document).ready( function () {
    $('#datatable').DataTable();
} );


$(".btnDelete").on("click", function () {
    const { id } = $(this).data();
    console.log(id);
    alertas.deleteAlertAjx("Eliminar código de conducta", "¿Desea eliminar código y todo lo relacionado a esta información?", "codigos", "id", id);
});

$('#datatable tbody').on('click', '.btnEdit', async function () {
    const data = $('#datatable').DataTable().row(this.closest('tr')).data();
    const { id } = $(this).data();
    const { value: codigoInput } = await Swal.fire({
        title: 'Editar código de conducta',
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
                url: "/admin/codigos",
                data: {codigoInput , id},
            });
            if (query.status) return location.reload();
        } catch (error) {
            console.log(error);
            return alertas.newErrorMessage();
        }
    }
});