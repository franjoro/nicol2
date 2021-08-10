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
    title: "Por favor, Espere",
    html: "Cargando Data",
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