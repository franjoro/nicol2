$("#loginForm").submit(async function (e) {
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
      alertas.errorLogin();
    }
  });

  $("#btnGuardar").click(()=> { $("#loginForm").submit();  } );