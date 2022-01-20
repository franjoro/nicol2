$(document).ready(function () {
    $('#datatable').DataTable();
    const roleBimestre = $("#roleBimestre").val();
    $("#selectBimestre").val(roleBimestre);

});

$("#selectBimestre").change(function () {
    const value = $(this).val();
    window.location = "/admin/conducta/" + value;
});

    $(".btnDeleteCodigo").on("click", async function () {

    const { isConfirmed } = await alertas.deleteConfirmAlert("¿Deseá eliminar el código aplicado?", "Esto devolvera el puntaje al previo al ingreso del código de conducta");
    const data = $(this).data();
    if (isConfirmed) return deleteCodigo(data);

});


const deleteCodigo = async (data) => {
    const {codigo, carnet , idcodigoalumno}= data;
    try {
        const query = await $.ajax({
            type: "DELETE",
            url: "/admin/conducta/codigo",
            data: { codigo, carnet, idcodigoalumno },
        });
        if (query.status) return location.reload();
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
};


