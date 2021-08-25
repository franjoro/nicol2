// $("#formEstudiantes").submit(async function (e) {
//     e.preventDefault();
//     const data = $(this).serialize();
//     try {
//         alertas.loaderAlert();
//         const query = await $.ajax({
//             type: "POST",
//             url: "/admin/estudiantes",
//             data: data,
//         });
//         if (query.status) {$('#agregarAlumno').modal('hide') ; $("#formEstudiantes")[0].reset(); swal.close(); return loadTable(); }
//     } catch (error) {
//         console.log(error);
//         if (error.responseJSON.error == "CARNET_EXISTENTE") return alertas.newErrorMessage('Carnet dúplicado');
//         return alertas.newErrorMessage();
//     }
// });

let global_permisos = {};

const savePermisos = async (idUsuario) => {
    const permisos = JSON.stringify(global_permisos);
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "PUT",
            url: "/admin/usuarios/",
            data: {idUsuario, permisos},
        });
        if (query.status) { $('#modalMaestros').modal('hide');  swal.close(); return alertas.Success("Permisos actualizados correctamente"); }
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
};

$("#btnGuardarMaestros").click(() => {
    const valueSelect = $("#selectMatricula").val(); 
    if (!valueSelect) return alertas.newErrorMessage("No se permiten espacios vacíos");
    const getBool = String(valueSelect) == "true";
    global_permisos.matricula  = getBool;
    global_permisos.allPermisos  = getBool;
    savePermisos($("#textMaestros").text());
});


$(document).ready(function () {
    $('#datatable').DataTable();
});

$('#datatable tbody').on('click', '#btnPermisos', function () {
    const data = $('#datatable').DataTable().row(this.closest('tr')).data();
    const role = data[1];
    const permisos = JSON.parse(data[0]);
    global_permisos = permisos;


    if (role == 3) {
        $("#selectMatricula").val(`${permisos.matricula}`);
        $("#textMaestros").text(data[2]);
        $("#modalMaestros").modal();
    }
});