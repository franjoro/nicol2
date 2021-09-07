// Mostrar o ocultar partes 
$("#navAlumnos").click(() => {
  $("#navMaterias").removeClass("active");
  $("#navAlumnos").addClass("active");
  $("#alumnosSection").removeClass("d-none");
  $("#materiasSection").addClass("d-none");
}); $("#navMaterias").click(() => {
  $("#navAlumnos").removeClass("active");
  $("#navMaterias").addClass("active");
  $("#materiasSection").removeClass("d-none");
  $("#alumnosSection").addClass("d-none");
});

// ================================ MATERIAS EN GRADOS
// Selector de modelo de materias
$("#selectMateria").select2({
  width: "100%",
  ajax: {
    url: "/admin/materias/getModelos",
    type: "post",
    dataType: "json",
    delay: 250,
    data(params) {
      return {
        searchTerm: params.term, // search term
      };
    },
    results(response) {
      console.log(response);
      $.map(response, (item) => ({
        id: item.id,
        text: item.text,
      }));
    },
    cache: true,
  },
});

// Agregar materia
$("#formAddMateria").submit(async function (e) {
  e.preventDefault();
  const data = $(this).serialize();
  try {
    alertas.loaderAlert();
    const query = await $.ajax({
      type: "POST",
      url: "/admin/grados/assingMateria",
      data: data,
    });
    swal.close();
    if (query.error === "ERROR_EXISTENTE") return alertas.newErrorMessage("La materia seleccionada ya esta asignada");
    if (query.status) return location.reload();
  } catch (error) {
    console.log(error);
    return alertas.newErrorMessage();
  }
});
// Boton de agregar materia
$("#btnGuardarMaterias").click(() => {
  if (!$("#selectMateria").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
  $("#formAddMateria").submit();
});

// ================================ MAESTROS EN MATERIAS
// Selector de modelo de maestros
$("#selectMaestro").select2({
  width: "100%",
  ajax: {
    url: "/admin/maestros/getMaestros",
    type: "post",
    dataType: "json",
    delay: 250,
    data(params) {
      return {
        searchTerm: params.term, // search term
      };
    },
    results(response) {
      console.log(response);
      $.map(response, (item) => ({
        id: item.id,
        text: item.text,
      }));
    },
    cache: true,
  },
});

// Agregar maestro
$("#formMaestro").submit(async function (e) {
  e.preventDefault();
  const data = $(this).serialize();
  try {
    alertas.loaderAlert();
    const query = await $.ajax({
      type: "POST",
      url: "/admin/grados/assingMaestro",
      data: data,
    });
    swal.close();
    if (query.error === "ERROR_EXISTENTE") return alertas.newErrorMessage("El maestro seleccionado ya esta asignado");
    if (query.status) return location.reload();
  } catch (error) {
    console.log(error);
    return alertas.newErrorMessage();
  }
});
// Boton de formulario maestro
$("#btnGuardarMaestros").click(() => {
  if (!$("#selectMaestro").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
  $("#formMaestro").submit();
});

// Boton de asignar maestro
$(".btnAsignarMaestro").on('click', function () {
  const { materia, union } = $(this).data();

  $("#textoNombreMateria").text(materia);
  $("#idMateriaInMaestro").val(union);
  $("#modalAddMaestro").modal();
});


const idGrado = $("#idGrado").val();

// ================================ ALUMNOS EN GRADOS
// Selector de modelo de maestros
$("#selectEstudiantes").select2({
  width: "100%",
  ajax: {
    url: "/admin/estudiantes/getEstudiantes/" + idGrado,
    type: "post",
    dataType: "json",
    delay: 250,
    data(params) {
      return {
        searchTerm: params.term, // search term
      };
    },
    results(response) {
      console.log(response);
      $.map(response, (item) => ({
        id: item.id,
        text: item.text,
      }));
    },
    cache: true,
  },
});


// Agregar maestro
$("#formEstudiantes").submit(async function (e) {
  e.preventDefault();
  const data = $(this).serialize();
  try {
    alertas.loaderAlert();
    const query = await $.ajax({
      type: "POST",
      url: "/admin/grados/assingEstudiantes",
      data: data,
    });
    swal.close();
    if (query.status) return location.reload();
  } catch (error) {
    console.log(error);
    return alertas.newErrorMessage();
  }
});

// Boton de formulario estudiantes
$("#btnGuardarEstudiantes").click(() => {
  if (!$("#selectEstudiantes").val()) return alertas.newErrorMessage("No se permiten espacios vacíos");
  $("#formEstudiantes").submit();
});


$(".edicionBtn").on("click", async function () {
  try {
    let { role, status, idunion } = $(this).data();
    if (status) status = 0;
    else status = 1;
    const { isConfirmed } = await alertas.ConfirmAlert("¿Actualizar permisos de edición?", "Este cambio afectara el permiso de edición");
    if (isConfirmed) {
      alertas.loaderAlert();
      const query = await $.ajax({
        type: "PUT",
        url: "/admin/grados/edicion",
        data: { role, status, idunion },
      });
      swal.close();
      if (query.status) return location.reload();
    }
  } catch (error) {
    console.log(error);
    return alertas.newErrorMessage();
  }
});


// const createGradosTable = (year ) => {
//     // DataTable Usuarios
//     $("#tableUsuario").DataTable({
//       ajax: "/admin/usuarios/table",
//       columns: [
//         { data: "id_usuario" },
//         { data: "Nombre" },
//         { data: "Email" },
//         {
//           render (data, type, row) {
//             if (row.Role == 1) {
//               return "Administrador";
//             } 
//             if (row.Role == 5) {
//               return "Empresa Centro";
//             } 
//             if (row.Role == 2) {
//               return "Instructor Empresa Centro";
//             } 
//               return "Coordinador";

//           },
//         },
//         {
//           render (data, type, row) {
//             if (row.Estado == 1) {
//               return '<p class="text-primary">Activo</p>';
//             } 
//               return '<p class="text-danger">Inactivo</p>';

//           },
//         },
//         {
//           "render": function (data, type, JsonResultRow, meta) {
//             const html =`<div class="btn-group" role = "group" aria - label="Basic example"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#editModal"><i class="fas fa-edit"></i></button></div >`;
//             return html;
//           }
//         },
//       ],
//     });
//   };