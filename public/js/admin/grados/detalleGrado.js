$("#navAlumnos").click( ()=> {
    $("#navMaterias").removeClass("active");
    $("#navAlumnos").addClass("active");
    $("#alumnosSection").removeClass("d-none");
    $("#materiasSection").addClass("d-none");
} );$("#navMaterias").click( ()=> {
    $("#navAlumnos").removeClass("active");
    $("#navMaterias").addClass("active");
    $("#materiasSection").removeClass("d-none");
    $("#alumnosSection").addClass("d-none");
} );

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