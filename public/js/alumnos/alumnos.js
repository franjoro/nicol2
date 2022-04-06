const conductaTag = $("#conductaTag");
const observacionTag = $("#observacionTag");
const notasTag = $("#notasTag");

conductaTag.click(() => { changeView(1); });
observacionTag.click(() => { changeView(2); });
notasTag.click(() => { changeView(3); });

const offActiveTag = () => {
    conductaTag.removeClass('active');
    observacionTag.removeClass('active');
    notasTag.removeClass('active');
};

const changeView = (role) => {
    offActiveTag();
    switch (role) {
        case 1:
            conductaTag.addClass('active');
            $("#conducta").removeClass("d-none");
            $("#observaciones").addClass("d-none");
            $("#notas").addClass("d-none");
            break;
        case 2:
            observacionTag.addClass('active');
            $("#conducta").addClass("d-none");
            $("#observaciones").removeClass("d-none");
            $("#notas").addClass("d-none");
            break;
        case 3:
            notasTag.addClass('active');
            $("#conducta").addClass("d-none");
            $("#observaciones").addClass("d-none");
            $("#notas").removeClass("d-none");
            break;
        default:
            break;
    }
};

$("#selectBimestres").on("change", function(){
    const value = $(this).val();
    window.location = "/alumnos/"+value;
} );


$(document).ready(function () {
  if ($("#isParvularia").val() === "1") {
    fillNotasByAlumnoParv();
  } else {
    fillNotasByAlumno();
  }
  const roleBimestre = $("#roleBimestre").val();
  $("#selectBimestres").val(roleBimestre);
});

const fillNotasByAlumno = async () => {
  const idBimestre = $("#idBimestre").val();
  const idAlumno = $("#carnet").val();
  const query = await $.ajax({
    url: `/admin/notas/getNotasEstudiantes/${idAlumno}/${idBimestre}`,
  });

  let html = ``;
  query.forEach((element) => {
    const arr1 = [],
      arr2 = [],
      arr3 = [];
    element.notas.forEach((nota) => {
      if (nota.RoleActivida == 1) arr1.push(nota);
      if (nota.RoleActivida == 2) arr2.push(nota);
      if (nota.RoleActivida == 3) arr3.push(nota);
    });
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
                            <th scope="col">Descripción</th>
                            <th scope="col">Porcentaje a obtener</th>
                            <th scope="col">Nota Obtenida</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                           <td rowspan="${arr1.length + 2}" class="col-md-3">
                                 Primer consolidado 30%
                            </td>   
                        </tr>`;
    let notaSuma1 = 0;
    arr1.forEach((nota1) => {
      notaSuma1 = Number(notaSuma1) + Number(nota1.nota);
      html += `
                                <tr>        
                                    <td>${nota1.tituloAcumulado}</td>
                                    <td>${nota1.acumuladoPorcentaje}</td>
                                    <td>${nota1.nota} </td>
                                </tr>        
                                `;
    });
    html += `
                        <tr class="table-primary">
                           <td>
                               <b> Nota 30% </b>
                            </td>   
                           <td>
                               <b>30</b>
                            </td>   
                           <td>
                               <b> ${notaSuma1}</b>
                            </td>   
                        </tr>
                        <tr>
                            <td rowspan="${arr2.length + 2}" class="col-md-3">
                              Segundo consolidado 30%
                            </td>   
                        </tr>`;
    let notaSuma2 = 0;
    arr2.forEach((nota1) => {
      notaSuma2 = Number(notaSuma2) + Number(nota1.nota);
      html += `
                             <tr>        
                                 <td>${nota1.tituloAcumulado}</td>
                                 <td>${nota1.acumuladoPorcentaje}</td>
                                 <td>${nota1.nota} </td>
                             </tr>        
                             `;
    });
    html += `
                        <tr class="table-primary">
                           <td>
                               <b> Nota 30% </b>
                            </td>   
                           <td>
                               <b>30</b>
                            </td>   
                           <td>
                               <b> ${notaSuma2}</b>
                            </td>   
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
        `;
  });
  $("#htmlNotas").html(html);
};

const fillNotasByAlumnoParv = async () => {
  const idBimestre = $("#idBimestre").val();
  const idAlumno = $("#carnet").val();
  const idGrado = $("#idGrado").val();

  const query = await $.ajax({
    url: `/admin/notas/getNotasPreescolarByAlumno/${idGrado}/${idBimestre}/${idAlumno}`,
  });
  let html = "";

  query.notas.forEach((element) => {
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
                            <th scope="col">Indicadores de logro</th>
                            <th scope="col">Nota obtenida</th>
                        </tr>
                    </thead>
                    <tbody>
                        `;

    element.notas.forEach((notas) => {
      html += `<tr class="table-primary"><td>${notas.indicador}</td> <td>${notas.nota}</td>  </tr>`;
    });

    html += `
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
        `;
  });

  $("#htmlNotas").html(html);
};
