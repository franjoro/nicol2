$(document).ready(function () {
    const roleBimestre = $("#roleBimestre").val();
    $("#selectBimestre").val(roleBimestre);
});
$("#selectBimestre").change(function () {
    const value = $(this).val();
    const idAlumno =  $("#idAlumno").val();
    window.location = "/admin/estudiantes/perfilac/"+ idAlumno +"/" + value;
});

$("#generateReporte").click( async() => {
    try {
        const roleBimestre =  $("#roleBimestre").val();
        const idAlumno =  $("#idAlumno").val();

        alertas.loaderAlert();
        const query = await $.ajax({ url: `/admin/estudiantes/perfilacreporte/${idAlumno}/${roleBimestre}` });
        if (query.status) {
            swal.close();
            window.open(`/admin/estudiantes/getReport `);
        }
        console.log(query);
    } catch (error) {
        console.log(error);
        alertas.newErrorMessage("Error al generar documento");
    }
});