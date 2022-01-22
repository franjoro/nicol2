const loadTable = () => {
    $("#datatable").DataTable().destroy();
    $("#datatable").DataTable({
        ajax: "/admin/usuarios/table",
        columns: [
            { data: "Permisos", "visible": false },
            { data: "Role", "visible": false },
            { data: "Username" },
            { data: "RoleText" },
            { data: "Estado" },
            {
                "render": function (data, type, row) {
                    let html = `
                    <div class="btn-group" role="group">`;


                    if ($("#permisosUpdate").val() == 'true') {
                        html += `<button class="btn btn-primary btn-sm btnPermisos">Ver permisos</button>`;
                    }

                    if ($("#permisosStatus").val() == 'true') {
                        if (row.estadoNum) {
                            html += `  <button class="btn btn-red btn-sm changeEstado" data-estado="0" data-idusuario="${row.Username}">Deshabilitar
                        </button>`;
                        } else {
                            html += `<button class="btn btn-success btn-sm changeEstado" data-estado="1" data-idusuario="${row.Username}">Habilitar
                            </button>`;
                        }
                    }


                    if ($("#permisosUpdate").val() == 'true') {
                        html += `<button class="btn btn-warning btn-sm btnPassword"
                        data-id="${row.Username}">
                        <i class="me-2" data-feather="key"></i>Cambiar
                        contraseña
                        </button>`;
                    }



                    html += `</div>`;
                    return html;
                }
            },
        ]
    });
};



let global_permisos = {};

const savePermisos = async (idUsuario) => {
    const permisos = JSON.stringify(global_permisos);
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "PUT",
            url: "/admin/usuarios/",
            data: { idUsuario, permisos },
        });
        if (query.status) { $('#modalMaestros').modal('hide'); swal.close(); return alertas.Success("Permisos actualizados correctamente"); }
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
};

$("#btnGuardarMaestros").click(() => {
    const matriculaValue = $("#selectMatricula").val();
    const indicadoresValue = $("#selectIndicadores").val();
    if (!matriculaValue || !indicadoresValue) return alertas.newErrorMessage("No se permiten espacios vacíos");
    const getBoolMatricula = String(matriculaValue) == "true";
    const getBoolIndicador = String(indicadoresValue) == "true";
    global_permisos.matricula = getBoolMatricula;
    global_permisos.indicadores = getBoolIndicador;
    savePermisos($("#textMaestros").text());
});


$(document).ready(function () {
    loadTable();
});

$('#datatable tbody').on('click', '.btnPermisos', function () {
    const data = $('#datatable').DataTable().row(this.closest('tr')).data();
    const role = data.Role;
    const permisos = JSON.parse(data.Permisos);
    global_permisos = permisos;

    if (role == 3) {
        $("#selectMatricula").val(`${permisos.matricula}`);
        $("#selectIndicadores").val(`${permisos.indicadores}`);
        $("#textMaestros").text(data.Username);
        $("#modalMaestros").modal();
    }
    if (role == 1) {
        location.replace('/admin/usuarios/administrator/' + data.Username);
    }
});


$('#datatable tbody').on('click', '.changeEstado', async function () {
    try {
        const { estado, idusuario } = $(this).data();
        const { isConfirmed } = await alertas.ConfirmAlert("¿Desea cambiar el estado de acceso de este usuario?");
        if (isConfirmed) {
            await $.ajax({
                type: "PUT",
                url: "/admin/usuarios/estado",
                data: { estado, idUsuario: idusuario },
            });
            location.reload();
        }
    } catch (error) {
        console.log(error);
        alertas.newErrorMessage(error);
    }

});
$('#datatable tbody').on('click', '.btnPassword', async function () {
    const { id } = $(this).data();
    const { value: password } = await Swal.fire({
        title: 'Cambiar contraseña a usuario seleccionado',
        input: 'password',
        showCancelButton: true,
        inputPlaceholder: 'Ingrese nueva contraseña',
        inputAttributes: {
            maxlength: 10,
            autocapitalize: 'off',
            autocorrect: 'off'
        }
    });
    if (password) {
        try {
            const query = await $.ajax({
                type: "PUT",
                url: "/admin/usuarios/password",
                data: { idUsuario: id, newPass: password },
            });
            if (query.status) return alertas.Success();
        } catch (error) {
            console.log(error);
            alertas.newErrorMessage(error);
        }
    }
});