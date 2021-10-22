$("#formpassword").submit(async function (e) {
    e.preventDefault();
    const password = $("#password").val();
    const idUsuario = $("#idUsuario").val();
    try {
        alertas.loaderAlert();
        const query = await $.ajax({
            type: "PUT",
            url: "/",
            data: { password, idUsuario },
        });
        if (query.status) { $('#modalMaestros').modal('hide'); $("#formpassword")[0].reset(); swal.close(); return alertas.Success(); }
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});

$("#btnPassword").click(() => {
    if (!$("#password").val() || !$("#password2").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    if ($("#password").val() != $("#password2").val()) return alertas.newErrorMessage("Las contraseñas no coinciden");
    $("#formpassword").submit();
});