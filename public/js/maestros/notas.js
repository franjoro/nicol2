$(".inputNota").focusin(function () {
    let value = $(this).val();
    if (value == 0) $(this).val("");
}).focusout(function () {
    let value = $(this).val();
    const { limite } = $(this).data();

    if (value == "") $(this).val(0);
    if (value > limite) $(this).val(limite);
    if (value < 0) $(this).val(0);
});


$("#btnGuardar").click(async () => {


    try {



        let dataarr = [];
        $("input[name='notas[]']").map(function () {
            const { exist, idnota, idacumulado, alumno } = $(this).data();
            const nota = $(this).val();
            const data = { exist, idnota, idacumulado, alumno, nota };
            dataarr.push(data);
            console.log(data);
        });
        const { isConfirmed } = await alertas.ConfirmAlert("¿Actualizar notas?", "Las notas ingresadas podran ser vistas por el administrador y los alumnos");
        if (isConfirmed) {
            dataarr = JSON.stringify(dataarr);
            const query = await $.ajax({
                type: "POST",
                url: "/maestros/notasAdd/",
                data: { data: dataarr },
            });

        }
        alertas.Success("Notas actualizadas correctamente");
    } catch (error) {
        console.log(error);
        alertas.newErrorMessage();
    }
});