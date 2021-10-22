const NotFoundM = () => {
  Swal.fire({
    icon: "error",
    title: "Oops...",
    text: "No hemos encontrado un usuario con ese correo electrónico ó carnet , por favor intenta de nuevo verificando o contacta con soporte Técnico",
  });
};
const FoundedEmailM = (email) => {
  Swal.fire({
    icon: "success",
    title: "Correo enviado",
    text: `Hemos enviado un correo electrónico a : ${email} con las instrucciones, por favor verifica la carpeta SPAM`,
  });
};

$("#loginForm").submit(async function (e) {
    console.log("Request");
    e.preventDefault();
    const t = $(this).serialize();
    alertas.loaderAlert();
    try {
      const data = await $.ajax({ url: "/", type: "POST", data: t });
      console.log(data);
      if(data.status){
          // CAMBIAR RUTAS
          if(data.role  === 1) window.location.replace('/admin');
          if(data.role  === 2) window.location.replace('/alumnos');
          if(data.role  === 3) window.location.replace('/maestros');
          swal.close();
      }
    } catch (error) {
      swal.close();
      if(error == "ERROR_ESTADO") return alertas.newErrorMessage("Usuario bloqueado, por favor comunicate con registro acádemico o la administración más cercana.");
      alertas.errorLogin();
    }
  });

  $("#btnGuardar").click(()=> { $("#loginForm").submit();  } );



  $("#restaurar").submit(async e => {
    e.preventDefault();
    const email = $("#email").val();
    alertas.loaderAlert();
    const data = await $.ajax({ url: `/recover?email=${email}`, type: "GET" });
    if (data.error == "USER_NOT_EXIST") return NotFoundM();
    FoundedEmailM(data.email);
    $("#exampleModal").modal('hide');
  });