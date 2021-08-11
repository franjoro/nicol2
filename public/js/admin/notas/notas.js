$(document).ready( function () {
    const roleBimestre = $("#roleBimestre").val();
    $("#selectBimestre").val(roleBimestre);

} );

$( "#selectBimestre" ).change(function() {
    const value = $(this).val();
    window.location = "/admin/notas/"+value;
});

$("#selectEstudiantes").select2({
    width: "100%",
    ajax: {
      url: "/admin/estudiantes/getEstudiantesAll" ,
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

$( "#selectEstudiantes" ).change( async function() {
    const value = $(this).val();
    const idBimestre = $("#idBimestre").val();
    const query = await $.ajax({url: `/admin/notas/getNotasEstudiantes/${value}/${idBimestre}`,});

    let html = ``;

    query.forEach(element => {
        html += `
        <div class="card card-header-actions my-4">
        <div class="card-header bg-primary">
            <h4 class="text-light my-0">${element.Nombre}</h4>
        </div>
        <div class="card-body px-0">
            <div class="d-flex align-items-center justify-content-between px-4">
                <table class="table table-bordered table-hover my-2">
                    <thead>
                        <tr>
                            <th scope="col">Actividad</th>
                            <th scope="col">descripción</th>
                            <th scope="col">Porcentaje</th>
                            <th scope="col">Nota Obtenida</th>
                        </tr>
                    </thead>
                    <tbody>`;
                    element.notas.forEach( nota=> {  
                        let text = "";
                        let valor = "40";
                        if(nota.RoleActivida == 1) text = 'Primer consolidado 30%';
                        if(nota.RoleActivida == 2) text = 'Segundo consolidado 30%';
                        if(nota.RoleActivida == 3) text = 'Examen 40%';
                        if(nota.RoleActivida == 1 ||  nota.RoleActivida == 2  ) valor = "30";
                html += `<tr>    
                            <td>${text}</td> 
                            <td>  ${nota.Titulo} </td>
                            <td>  ${valor} </td>
                            <td>${ nota.nota}  </td>
                        </tr>`;
                        
                        });
                        html += `
                    </tbody>
                </table>
            </div>
        </div>
    </div>
        `;
    });
    $("#notasAlumno").html(html);
});
