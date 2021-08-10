$('#cantidadAcumulados').change(() => {
    const selectedOption = $('#cantidadAcumulados option:selected').val();
    showElements(selectedOption);
});

const showElements = ((cantidadAcumulados) => {
    // Ocultar elementos
    for (let index = Number(cantidadAcumulados) + 1; index <= 5; index++) {
        $(`.showControl${index}`).addClass('d-none').val("");
    }

    // Mostrar elementos
    for (let index = Number(cantidadAcumulados) ; index > 0; index--) {
        $(`.showControl${index}`).removeClass('d-none');
    }
    // return makeCalculo();
});


const makeCalculo = (()=> {
    let total = 0;
    for (let index = 1 ; index <= 5; index++) {
        const valor = $(`#val${index}`).val();
        total = total + Number(valor);
    }
    if(total == 30) {
        $("#alertaRoja").addClass("d-none");
        $("#alertaVerde").removeClass("d-none");
    }else{
        $("#alertaVerde").addClass("d-none");
        $("#alertaRoja").removeClass("d-none");
    }
    $("#total").text(total);
    return total;
});

$("#btnGuardar").click( ()=>{
    const total = makeCalculo();
    if(total !== 30 ) return alertas.newErrorMessage("La sumatoria total no concuerda con el valor de la actividad");
    if(!$("#titulo").val() || !$("#descripcion").val() || !$("#texto1").val() ||  !$("#val1").val() ) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formPerfil").submit();
});

$("#btnGuardarExamen").click( ()=>{
    if(!$("#titulo").val() || !$("#descripcion").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
    $("#formPerfil").submit();
});

$(document).on("blur","input", function(){
    makeCalculo();
});

// Agregar codigo de conducta
$("#formPerfil").submit(async function (e) {
    e.preventDefault();
    const data = $(this).serialize();
    try {
        alertas.loaderAlert();
        const idUnion = $("#idUnion").val();
        const Role = $("#Role").val();
        const query = await $.ajax({
            type: "POST",
            url: `/maestros/addPerfil/${idUnion}/${Role}`,
            data: data,
        });
        swal.close();
        if (query.status) return window.location.replace(`/maestros/perfil/${idUnion}`);
    } catch (error) {
        console.log(error);
        return alertas.newErrorMessage();
    }
});