$("#formAdministrator").submit(async function (e) {
    e.preventDefault();
    const data = $(this)
        .serializeArray()
        .reduce(function (json, { name, value }) {
            json[name] = value;
            return json;
        }, {});

        for (let prop in data) {
            if (data.hasOwnProperty(prop)) {
                data[prop] = (data[prop] == 'true' || data[prop] == 'false')? data[prop] === 'true': data[prop] ;
            }
        }


    let permisos = {
        "estudiantes": {
            "create": data.estudiantes_create,
            "read":  data.estudiantes_read,
            "update":  data.estudiantes_update,
            "delete":  data.estudiantes_delete,
        },
        "maestros": {
            "create": data.maestros_create,
            "read": data.maestros_read,
            "update": data.maestros_update,
            "delete": data.maestros_delete
        },
        "grados": {
            "create": data.grados_create,
            "read": data.grados_read,
            "update": data.grados_update,
            "delete": data.grados_delete
        },
        "notas": {
            "read": data.notas_read,
            "update": data.notas_update,
        },
        "conducta": {
            "read": data.conducta_read,
            "delete": data.conducta_delete
        },
        "usuarios": {
            "create": data.usuarios_create,
            "read":  data.usuarios_read,
            "update":  data.usuarios_update,
            "delete":  data.usuarios_delete,
            "status": data.usuarios_status,
        },
        "catalogos": {
            "create": data.catalogos_create,
            "read":  data.catalogos_read,
            "update":  data.catalogos_update,
            "delete":  data.catalogos_delete,
        }
    };
    try {
        permisos = JSON.stringify(permisos);
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "POST",
            url: "/admin/usuarios",
            data: {user : data.Username , passwordPlain : data.password , role : 1, permisos},
        });
        if (query.status) return alertas.Success();
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});

$("#btnGuardar").click(() => {
    if (!$("#Username").val() || !$("#password").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formAdministrator").submit();
});



$("#btnEditar").click(() => {
    $("#formAdministratorEdit").submit();
});

$("#formAdministratorEdit").submit(async function (e) {
    e.preventDefault();
    const data = $(this)
        .serializeArray()
        .reduce(function (json, { name, value }) {
            json[name] = value;
            return json;
        }, {});

        for (let prop in data) {
            if (data.hasOwnProperty(prop)) {
                data[prop] = (data[prop] == 'true' || data[prop] == 'false')? data[prop] === 'true': data[prop] ;
            }
        }


    let permisos = {
        "estudiantes": {
            "create": data.estudiantes_create,
            "read":  data.estudiantes_read,
            "update":  data.estudiantes_update,
            "delete":  data.estudiantes_delete,
        },
        "maestros": {
            "create": data.maestros_create,
            "read": data.maestros_read,
            "update": data.maestros_update,
            "delete": data.maestros_delete
        },
        "grados": {
            "create": data.grados_create,
            "read": data.grados_read,
            "update": data.grados_update,
            "delete": data.grados_delete
        },
        "notas": {
            "read": data.notas_read,
            "update": data.notas_update,
        },
        "conducta": {
            "read": data.conducta_read,
            "delete": data.conducta_delete
        },
        "usuarios": {
            "create": data.usuarios_create,
            "read":  data.usuarios_read,
            "update":  data.usuarios_update,
            "delete":  data.usuarios_delete,
            "status": data.usuarios_status,
        },
        "catalogos": {
            "create": data.catalogos_create,
            "read":  data.catalogos_read,
            "update":  data.catalogos_update,
            "delete":  data.catalogos_delete,
        }
    };
    try {
        console.log(permisos);
        permisos = JSON.stringify(permisos);
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "PUT",
            url: "/admin/usuarios",
            data: {idUsuario : data.Username , permisos},
        });
        if (query.status) return alertas.Success();
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});