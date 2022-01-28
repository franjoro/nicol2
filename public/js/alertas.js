const alertas = {};

alertas.newErrorMessage = (data = "user_error") => {
  Swal.fire({
    icon: "error",
    title: "Oops...",
    text: "No se pudo realizar la operación. Motivo: " + data,
  });
};

alertas.errorLogin = () => {
  Swal.fire({
    icon: "error",
    title: "Oops...",
    text: "Usuario o contraseña incorrectos, por favor verifica la información "
  });
};

alertas.loaderAlert = () => {
  Swal.fire({
    title: "Por favor, espere",
    html: "Cargando información necesaria...",
    allowOutsideClick: !1,
    showConfirmButton: false,
    willOpen: () => {
      Swal.showLoading();
    },
  });
};

alertas.deleteConfirmAlert = (title, text) => {
  return Swal.fire({
    title, text,
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, borrar",
  });
};

alertas.ConfirmAlert = (title, text) => {
  return Swal.fire({
    title, text,
    icon: "info",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, aceptar",
  });
};

alertas.Success = (text = "Operación completada correctamente") => {
  Swal.fire(
    'Perfecto',
    text,
    'success'
  );
};


alertas.deleteAlertAjx = async (title, text, tabla, column, id) => {
  try {
    const alert = await Swal.fire({
      title, text,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, borrar",
    });
    if (alert.isConfirmed) {
      const query = await $.ajax({
        type: "DELETE",
        url: "/admin",
        data: { id, tabla, column },
      });
      if (query.status) return location.reload();
    }
  } catch (error) {
    console.log(error);
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: "No se pudo realizar la operación." ,
    });
  }
};

alertas.deleteAlertAjxMaestros = async (title, text, tabla, column, id) => {
  try {
    const alert = await Swal.fire({
      title, text,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, borrar",
    });
    if (alert.isConfirmed) {
      const query = await $.ajax({
        type: "DELETE",
        url: "/maestros",
        data: { id, tabla, column },
      });
      if (query.status) return location.reload();
    }
  } catch (error) {
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: "No se pudo realizar la operación." ,
    });
  }
};

alertas.deleteAlertAjxAlumnnos = async (title, text, tabla, column, id) => {
  try {
    const alert = await Swal.fire({
      title, text,
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, borrar",
    });
    if (alert.isConfirmed) {
      const query = await $.ajax({
        type: "DELETE",
        url: "/admin/estudiantes",
        data: { id, tabla, column },
      });
      if (query.status) return location.reload();
    }
  } catch (error) {
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: "No se pudo realizar la operación." ,
    });
  }
};