const { getUserDataByToken } = require("../../middlewares/auth");
const { sendEmail } = require("../../utils/mailer");
const pool = require("../../models/db");
const { upload } = require("../../utils/s3");
const { adddUsuarioFunction } = require("../admin/usuarios.controller");

const maestros = {};


maestros.main = (req, res) => {
    const { Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
    const permisosSend = JSON.parse(Permisos);
    res.render('./maestros/main', { permisosSend, usuario });
};



maestros.blank = (req, res) => {
    res.render('./maestros/blank');
};



maestros.conducta = async(req, res) => {
    try {
        const { identificador, Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);

        const asignaciones = await pool.query(`
        SELECT 
        idGrado ,
        nombre
             FROM grados 
        INNER JOIN maestros_materias ON maestros_materias.idGrado = grados.id
             WHERE maestros_materias.idMaestro = ? AND grados.idYear = (SELECT year FROM year WHERE year.estado = 1 ) 
             GROUP BY nombre`, [identificador]);

        res.render('./maestros/conducta', { asignaciones, permisosSend, usuario });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};



maestros.conductaAlumnos = async (req, res) => {
  try {
    const { identificador, Permisos, usuario } = getUserDataByToken(
      req.cookies.token
    ).data;
    const permisosSend = JSON.parse(Permisos);

    const { idGrado } = req.params;
    const arrayPromesas = [
      await pool.query("SELECT Nombre FROM grados WHERE id = ?", [idGrado]), // Obtiene el nombre del grado;
      await pool.query(
        "SELECT idAlumno, Nombre, Apellido FROM alumnos INNER JOIN grado_alumno ON grado_alumno.idAlumno = alumnos.Carnet  WHERE  grado_alumno.idGrado = ?;",
        [idGrado]
      ), // Obtiene los alumnos;
      await pool.query(
        "SELECT id, Codigo , valor , IF(valor >0 , 'success' , 'danger') AS color FROM codigos ORDER BY valor"
      ), // Obtiene todos los códigos existentes
    ];
    const {
      [0]: {
        [0]: { Nombre },
      },
      [1]: alumnos,
      [2]: codigos,
    } = await Promise.all(arrayPromesas);
    res.render("./maestros/alumnosConducta", {
      Nombre,
      alumnos,
      codigos,
      identificador,
      idGrado,
      permisosSend,
      usuario,
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.addCodigo = async (req, res) => {
  try {
    const { identificador } = getUserDataByToken(req.cookies.token).data;
    const { idCodigo, idAlumno, descripcion, idGrado } = req.body;
    const {
      [0]: {
        [0]: { id, Role },
      },
      [1]: {
        [0]: { valor, Codigo },
      },
      [2]: {
        [0]: { Email },
      },
    } = await Promise.all([
      pool.query("SELECT id , Role FROM bimestres WHERE Estado = 1"),
      pool.query("SELECT valor, Codigo FROM codigos WHERE id = ?", idCodigo),
      pool.query("SELECT Email FROM alumnos WHERE Carnet = ?", idAlumno),
    ]);

    const columna = `Conducta${Role}`;
    let {
      [0]: { puntaje },
    } = await pool.query(
      `SELECT ${columna} AS puntaje FROM grado_alumno WHERE idGrado = ? AND idAlumno = ? `,
      [idGrado, idAlumno]
    );
    let newPuntaje = parseInt(puntaje, 10) + parseInt(valor, 10);
    if (newPuntaje >= 100) newPuntaje = 100;
    const promesas = [
      pool.query(
        "INSERT INTO codigo_alumno(idCodigo, idAlumno , idMaestro , idBimestre , Observacion) VALUES(?,?,?,?,?)",
        [idCodigo, idAlumno, identificador, id, descripcion]
      ),
      pool.query(
        `UPDATE grado_alumno SET  ${columna} = ? WHERE idGrado = ? AND idAlumno = ? `,
        [newPuntaje, idGrado, idAlumno]
      ),
    ];
    await Promise.all(promesas);
    res.json({ status: true });
    // sendEmail(Email, `Código de conducta aplicado #${Date.now()}`, '', `<h3>Colegio Salesiano San Juan Bosco</h3> <br> <h5>Notificación automática de código asignado</h5><p>Código aplicado : ${Codigo}  - Valor: ${valor}  - Nuevo puntaje : ${puntaje} </p> <p>Carnet Alumno : ${idAlumno}</p><br><h6><b>ESTE MENSAJE SE GENERA AUTOMATICAMENTE. FAVOR NO RESPONDER</b></h6>`);

    const {
      [0]: { sumaCodigos },
    } = await pool.query(
      "SELECT SUM(valor) AS sumaCodigos FROM `codigo_alumno` INNER JOIN codigos ON codigos.id = codigo_alumno.idCodigo WHERE idAlumno = ? AND idBimestre=? ",
      [idAlumno, id]
    );

    const shouldBe = parseInt(100 + Number(sumaCodigos));
    if (newPuntaje != shouldBe) {
      console.log("Error de sumatorio de codigos");
      await pool.query(
        `UPDATE grado_alumno SET  ${columna} = ? WHERE idGrado = ? AND idAlumno = ? `,
        [shouldBe, idGrado, idAlumno]
      );
    }
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.addObservacion = async (req, res) => {
  try {
    const { identificador } = getUserDataByToken(req.cookies.token).data;
    const { idAlumno, descripcion } = req.body;
    const {
      [0]: { id },
    } = await pool.query("SELECT id FROM bimestres WHERE Estado = 1");

    const promesas = [
      pool.query(
        "INSERT INTO observaciones(  idMaestro , idAlumno , idBimestre , descripcion ) VALUES(?,?,?,?)",
        [identificador, idAlumno, id, descripcion]
      ),
    ];

    await Promise.all(promesas);

    res.json({ status: true });

    const {
      [0]: { Email },
    } = await pool.query(
      "SELECT Email FROM alumnos WHERE Carnet = ?",
      idAlumno
    );
    sendEmail(
      Email,
      `Observación del maestro aplicada  #${Date.now()}`,
      "",
      `<h3>Colegio Salesiano San Juan Bosco</h3> <br> <h5>Notificación automática de observación aplicada</h5><p>Por favor acceda a su usuario en la plataforma de registro acádemico para visualizar la observación <p>Carnet Alumno : ${idAlumno}</p>`
    );
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.perfil = async (req, res) => {
  try {
    const { identificador, Permisos, usuario } = getUserDataByToken(
      req.cookies.token
    ).data;
    const permisosSend = JSON.parse(Permisos);

    const asignaciones = await pool.query(
      `
        SELECT
    modelomaterias.Nombre,
    grados.nombre AS Grado,
    materia_grado.idGrado AS idGrado,
    materia_grado.id AS idUnion
    FROM
        maestros_materias
    INNER JOIN materia_grado ON idUnionGradoMateria = materia_grado.id
    INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria
    INNER JOIN grados ON grados.id = materia_grado.idGrado
    WHERE
    maestros_materias.idMaestro = ? AND grados.idYear = (SELECT year FROM year WHERE year.estado = 1 ) `,
      [identificador]
    );
    res.render("./maestros/perfilAcademico", {
      asignaciones,
      permisosSend,
      usuario,
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.perfilActividades = async (req, res) => {
  try {
    const { Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
    const permisosSend = JSON.parse(Permisos);
    const { idUnion } = req.params;
    const {
      [0]: {
        [0]: { id, Role, idYear },
      },
      [1]: { [0]: dataGradoMateria },
    } = await Promise.all([
      /* BIMESTRE */
      pool.query("SELECT id, Role, idYear FROM bimestres WHERE Estado = 1"),
      /* Datos del grado y la materia */
      pool.query(
        "SELECT (SELECT Nombre FROM grados WHERE id = idGrado) AS Grado , idGrado, (SELECT Nombre FROM modelomaterias WHERE id = idModeloMateria) AS Materia FROM materia_grado WHERE id = ?",
        [idUnion]
      ),
    ]);

    const {
      [0]: { isParvularia },
    } = await pool.query(
      "SELECT isParvularia FROM grados INNER JOIN ciclos ON ciclos.id = grados.idCiclo WHERE grados.id = ?",
      [dataGradoMateria.idGrado]
    );

    if (!isParvularia) {
      const arrayPromesas = [];
      for (let index = 1; index <= 3; index++) {
        arrayPromesas.push(
          pool.query(
            `SELECT COUNT(*) AS cantidad , actividades.id AS idActividad   FROM actividades RIGHT JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE Role = ? AND Bimestre = ?  AND  unionMateriaGrado  = ? `,
            [index, id, idUnion]
          )
        );
      }
      const actividades = await Promise.all(arrayPromesas);
      const { [0]: bloqueos } = await pool.query(
        `SELECT  EstadoAct1, EstadoAct2, EstadoAct3 FROM materia_grado WHERE id= ? `,
        [idUnion]
      );
      res.render("./maestros/perfilAcademicoActividades", {
        Role,
        idYear,
        actividades,
        bloqueos,
        idUnion,
        dataGradoMateria,
        permisosSend,
        usuario,
      });
    } else {
      const indicadoresInMateria = await pool.query(
        "SELECT indicador , indicadores_materia.id AS idMateriaIndicador  FROM indicadores_materia INNER JOIN indicadoresparvularia ON indicadoresparvularia.id = indicadores_materia.idIndicador WHERE idBimestre = ? AND idUnion = ? GROUP BY  indicadores_materia.idIndicador",
        [id, idUnion]
      );
      res.render("./maestros/perfilAcademicoParvularia", {
        permisosSend,
        usuario,
        dataGradoMateria,
        Role,
        idYear,
        indicadoresInMateria,
        idUnion,
        idBimestre: id,
      });
    }
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.addPerfilView = async (req, res) => {
  try {
    const { Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
    const permisosSend = JSON.parse(Permisos);

    const { idUnion, Role } = req.params;
    let textoRole = "";
    if (Role == 1) textoRole = "Actividad 1 (30%)";
    if (Role == 2) textoRole = "Actividad 2 (30%)";
    if (Role == 3) textoRole = "Examen (40%)";
    res.render("./maestros/perfilAcademicoAdd", {
      idUnion,
      Role,
      textoRole,
      permisosSend,
      usuario,
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.editPerfilView = async (req, res) => {
  try {
    const { Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
    const permisosSend = JSON.parse(Permisos);

    const { idUnion, Role, idActividad } = req.params;
    let textoRole = "";
    if (Role == 1) textoRole = "Actividad 1 (30%)";
    if (Role == 2) textoRole = "Actividad 2 (30%)";
    if (Role == 3) textoRole = "Examen (40%)";

    const arrPro = [
      pool.query("SELECT Titulo, Descripcion FROM actividades WHERE id = ?", [
        idActividad,
      ]),
      pool.query(
        "SELECT id, Descripcion, Porcentaje FROM acumulados WHERE idActividad = ?",
        [idActividad]
      ),
    ];

    const {
      [0]: { [0]: headerInfo },
      [1]: acumuladosInfo,
    } = await Promise.all(arrPro);
    res.render("./maestros/perfilAcademicoEdit", {
      idUnion,
      Role,
      textoRole,
      permisosSend,
      usuario,
      headerInfo,
      acumuladosInfo,
      idActividad,
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.addPerfil = async (req, res) => {
  try {
    const { identificador } = getUserDataByToken(req.cookies.token).data;
    const { idUnion, Role } = req.params;
    const { titulo, descripcion, cantidadAcumulados } = req.body;
    const {
      [0]: { id },
    } = await pool.query("SELECT id FROM bimestres WHERE Estado = 1");
    const { insertId } = await pool.query(
      "INSERT INTO actividades(Titulo, Descripcion , Role, Bimestre, idMaestro, unionMateriaGrado ) VALUES(?,?,?,?,?,?)",
      [titulo, descripcion, Role, id, identificador, idUnion]
    );
    const arrayAcumulados = req.body["acumulados[]"];
    const arraValor = req.body["valor[]"];
    const arrPromesas = [];
    for (let index = 0; index < cantidadAcumulados; index++) {
      arrPromesas.push(
        pool.query(
          "INSERT INTO acumulados(Descripcion , Porcentaje, idActividad) VALUES(?,?,?) ",
          [arrayAcumulados[index], arraValor[index], insertId]
        )
      );
    }
    await Promise.all(arrPromesas);
    res.json({ status: true });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.editPerfil = async (req, res) => {
  try {
    const { idActividad } = req.params;
    const { titulo, descripcion, acumulados } = req.body;
    const acumuladosJson = JSON.parse(acumulados);
    const arrPromesas = [];
    arrPromesas.push(
      pool.query(
        "UPDATE actividades SET Titulo = ? ,  Descripcion = ? WHERE id = ? ",
        [titulo, descripcion, idActividad]
      )
    );
    acumuladosJson.forEach((element) => {
      arrPromesas.push(
        pool.query("UPDATE acumulados SET Descripcion = ? WHERE id = ? ", [
          element.value,
          element.id,
        ])
      );
    });

    await Promise.all(arrPromesas);
    res.json({ status: true });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.deletePerfil = async (req, res) => {
  try {
    const { idActividad } = req.body;
    console.log(req.body);
    await pool.query("DELETE FROM actividades WHERE id = ?", [idActividad]);
    res.json({ status: true });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.notasViewMain = async (req, res) => {
  try {
    const { identificador, Permisos, usuario } = getUserDataByToken(
      req.cookies.token
    ).data;
    const permisosSend = JSON.parse(Permisos);

    const asignaciones = await pool.query(
      `
        SELECT
        grados.nombre AS Grado,
        modelomaterias.Nombre,
        materia_grado.idGrado AS idGrado,
        materia_grado.id AS idUnion
        FROM
        maestros_materias
        INNER JOIN materia_grado ON idUnionGradoMateria = materia_grado.id
        INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria
        INNER JOIN grados ON grados.id = materia_grado.idGrado
            WHERE
        maestros_materias.idMaestro = ? AND grados.idYear = (SELECT year FROM year WHERE year.estado = 1 ) ;`,
      [identificador]
    );
    res.render("./maestros/mainNotas", { asignaciones, permisosSend, usuario });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.notasActividades = async (req, res) => {
  try {
    const { Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
    const permisosSend = JSON.parse(Permisos);

    const { idUnion } = req.params;
    const {
      [0]: { id, Role, idYear },
    } = await pool.query(
      "SELECT id, Role, idYear FROM bimestres WHERE Estado = 1"
    );
    const { [0]: dataGradoMateria } = await pool.query(
      "SELECT (SELECT Nombre FROM grados WHERE id = idGrado) AS Grado , (SELECT Nombre FROM modelomaterias WHERE id = idModeloMateria) AS Materia , idGrado FROM materia_grado WHERE id = ?",
      [idUnion]
    );

    const {
      [0]: { isParvularia },
    } = await pool.query(
      "SELECT isParvularia FROM grados INNER JOIN ciclos ON ciclos.id = grados.idCiclo WHERE grados.id = ?",
      [dataGradoMateria.idGrado]
    );

    if (!isParvularia) {
      const arrayPromesas = [];
      for (let index = 1; index <= 3; index++) {
        arrayPromesas.push(
          pool.query(
            `SELECT COUNT(*) AS cantidad , actividades.id AS idActividad   FROM actividades RIGHT JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE Role = ? AND Bimestre = ?  AND  unionMateriaGrado  = ? `,
            [index, id, idUnion]
          )
        );
      }
      const actividades = await Promise.all(arrayPromesas);
      const { [0]: bloqueos } = await pool.query(
        `SELECT  EstadoAct1, EstadoAct2, EstadoAct3 FROM materia_grado WHERE id= ? `,
        [idUnion]
      );
      res.render("./maestros/notasActividades", {
        Role,
        idYear,
        actividades,
        bloqueos,
        idUnion,
        dataGradoMateria,
        permisosSend,
        usuario,
      });
    } else {
      const arrPromesas = [
        pool.query(
          "SELECT indicadores_materia.id AS idUnionMateriaIndicador, indicadoresparvularia.indicador AS textIndicador FROM `indicadores_materia` INNER JOIN indicadoresparvularia ON indicadores_materia.idIndicador = indicadoresparvularia.id WHERE indicadores_materia.idUnion = ? AND idBimestre = ? GROUP BY indicadores_materia.idIndicador",
          [idUnion, id]
        ), // Obtiene información del indicador de logros
        pool.query(
          "SELECT Carnet, Nombre, Apellido FROM alumnos INNER JOIN grado_alumno ON grado_alumno.idAlumno = alumnos.Carnet WHERE idGrado = ?  ",
          [dataGradoMateria.idGrado]
        ), // Obtiene alumnos del grado
        pool.query(
          "SELECT * FROM notas_parvularia WHERE idUnionMateriaGrado  = ? ",
          [idUnion]
        ), // Obtiene las notas de los alumnos de parvularia
      ];
      const dataOrdenada = [];

      const {
        [0]: indicadores,
        [1]: alumnos,
        [2]: notas,
      } = await Promise.all(arrPromesas);
      alumnos.forEach((alumno) => {
        const arrExist = [];
        const arrIdNota = [];
        indicadores.forEach(() => {
          arrExist.push(false);
          arrIdNota.push(false);
        });
        let notaObtenida = {};
        notaObtenida.Nota = [];
        notaObtenida.Nombre = alumno.Nombre;
        notaObtenida.Apellido = alumno.Apellido;
        notaObtenida.Carnet = alumno.Carnet;
        notaObtenida.isExist = arrExist;
        notaObtenida.idNota = arrIdNota;
        if (notas.length) {
          const arrNota = [];
          const arrIdNota = [];
          const arrExist = [];
          const boolean = [];
          indicadores.forEach(() => {
            arrNota.push(0);
            arrIdNota.push(0);
            arrExist.push(false);
            boolean.push(false);
          });
          notas.some((notaElement) => {
            if (notaElement.idAlumno == alumno.Carnet) {
              const posicion = indicadores.findIndex(
                (x) =>
                  x.idUnionMateriaIndicador ==
                  notaElement.idUnionMateriaIndicador
              );
              arrNota[posicion] = notaElement.NotaRole;
              arrIdNota[posicion] = notaElement.id;
              arrExist[posicion] = true;
              boolean[posicion] = true;
            }
            boolean.push(false);
          });
          if (boolean.includes(true)) {
            if (indicadores.length != arrNota.length) {
              for (
                let index = arrNota.length + 1;
                index <= indicadores.length;
                index++
              ) {
                arrNota.push(0);
                arrIdNota.push(false);
                arrExist.push(false);
              }
            }
            notaObtenida.Nota = arrNota;
            notaObtenida.isExist = arrExist;
            notaObtenida.idNota = arrIdNota;
          } else {
            const arrNota = [];
            indicadores.forEach(() => {
              arrNota.push(0);
            });
            notaObtenida.Nota = arrNota;
          }
        } else {
          const arrNota = [];
          indicadores.forEach(() => {
            arrNota.push(0);
          });
          notaObtenida.Nota = arrNota;
        }
        dataOrdenada.push(notaObtenida);
      });
      res.render("./maestros/notasAlumnosParvularia", {
        Role,
        idUnion,
        dataGradoMateria,
        dataOrdenada,
        indicadores,
        permisosSend,
        usuario,
      });
    }
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.notasAlumnos = async (req, res) => {
  try {
    const { Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
    const permisosSend = JSON.parse(Permisos);
    const { idUnion, Role } = req.params;

    const {
      [0]: { id },
    } = await pool.query("SELECT id FROM bimestres WHERE Estado = 1");

    const { [0]: dataGradoMateria } = await pool.query(
      "SELECT idGrado, (SELECT Nombre FROM grados WHERE id = idGrado) AS Grado , (SELECT Nombre FROM modelomaterias WHERE id = idModeloMateria) AS Materia FROM materia_grado WHERE id = ?",
      [idUnion]
    );

    const arrPromesas = [
      pool.query(
        "SELECT actividades.id AS idActividad, Titulo, COUNT(acumulados.id) AS cantidad FROM actividades INNER JOIN acumulados ON acumulados.idActividad = actividades.id  WHERE unionMateriaGrado = ? AND Role = ? AND Bimestre = ?",
        [idUnion, Role, id]
      ), // Obtiene información de la actividad
      pool.query(
        "SELECT Carnet, Nombre, Apellido FROM alumnos INNER JOIN grado_alumno ON grado_alumno.idAlumno = alumnos.Carnet WHERE idGrado = ?  ORDER BY Apellido",
        [dataGradoMateria.idGrado]
      ), // Obtiene alumnos del grado
    ];

    const {
      [0]: {
        [0]: { Titulo, cantidad, idActividad },
      },
      [1]: alumnos,
    } = await Promise.all(arrPromesas);

    const acumulados = await pool.query(
      "SELECT id, Porcentaje FROM acumulados WHERE idActividad = ? ",
      [idActividad]
    );

    const notasAcumulados = await pool.query(
      "SELECT notas.id AS idNota , Nota, idAlumno, acumulados.id AS idAcumulado, Porcentaje FROM notas INNER JOIN acumulados ON acumulados.id = notas.idAcumulado WHERE acumulados.idActividad = ? ",
      [idActividad]
    );
    const dataOrdenada = [];

    alumnos.forEach((alumno) => {
      const arrExist = [];
      const arrIdNota = [];
      acumulados.forEach(() => {
        arrExist.push(false);
        arrIdNota.push(false);
      });
      let notaObtenida = {};
      notaObtenida.Nota = [];
      notaObtenida.Nombre = alumno.Nombre;
      notaObtenida.Apellido = alumno.Apellido;
      notaObtenida.Carnet = alumno.Carnet;
      notaObtenida.isExist = arrExist;
      notaObtenida.idNota = arrIdNota;
      if (notasAcumulados.length) {
        const arrNota = [];
        const arrIdNota = [];
        const arrExist = [];
        const boolean = [];
        notasAcumulados.some((notaElement) => {
          if (notaElement.idAlumno == alumno.Carnet) {
            arrNota.push(notaElement.Nota);
            arrIdNota.push(notaElement.idNota);
            arrExist.push(true);
            boolean.push(true);
          }
          boolean.push(false);
        });
        if (boolean.includes(true)) {
          if (acumulados.length != arrNota.length) {
            for (
              let index = arrNota.length + 1;
              index <= acumulados.length;
              index++
            ) {
              arrNota.push(0);
              arrIdNota.push(false);
              arrExist.push(false);
            }
          }
          notaObtenida.Nota = arrNota;
          notaObtenida.isExist = arrExist;
          notaObtenida.idNota = arrIdNota;
        } else {
          const arrNota = [];
          acumulados.forEach(() => {
            arrNota.push(0);
          });
          notaObtenida.Nota = arrNota;
        }
      } else {
        const arrNota = [];
        acumulados.forEach(() => {
          arrNota.push(0);
        });
        notaObtenida.Nota = arrNota;
      }
      dataOrdenada.push(notaObtenida);
    });
    res.render("./maestros/notasAlumnos", {
      Role,
      idUnion,
      dataGradoMateria,
      Titulo,
      cantidad,
      dataOrdenada,
      acumulados,
      permisosSend,
      usuario,
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.notasAdd = async (req, res) => {
  try {
    const { data } = req.body;
    const arrdata = JSON.parse(data);
    const arrQueries = [];

    arrdata.forEach((valores) => {
      if (valores.exist) {
        arrQueries.push(
          pool.query(
            "UPDATE notas SET Nota = ? WHERE id=? AND idAlumno  = ? AND idAcumulado = ?",
            [valores.nota, valores.idnota, valores.alumno, valores.idacumulado]
          )
        );
      } else {
        arrQueries.push(
          pool.query(
            "INSERT INTO notas(Nota,idAlumno, idAcumulado) VALUES(?,?,?)",
            [valores.nota, valores.alumno, valores.idacumulado]
          )
        );
      }
    });

    await Promise.all(arrQueries);
    res.json({ status: true });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.notasAddParv = async (req, res) => {
  try {
    const { data, idGradoMateria } = req.body;
    const arrdata = JSON.parse(data);
    const arrQueries = [];

    arrdata.forEach((valores) => {
      if (valores.exist) {
        arrQueries.push(
          pool.query(
            "UPDATE notas_parvularia SET NotaRole = ? WHERE id=  ? AND idAlumno  = ?",
            [valores.nota, valores.idnota, valores.alumno]
          )
        );
      } else {
        if (valores.nota) {
          arrQueries.push(
            pool.query(
              "INSERT INTO notas_parvularia(NotaRole,idAlumno, idUnionMateriaIndicador ,idUnionMateriaGrado ) VALUES(?,?,?,?)",
              [valores.nota, valores.alumno, valores.idunion, idGradoMateria]
            )
          );
        }
      }
    });

    await Promise.all(arrQueries);
    res.json({ status: true });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.matriculaView = async (req, res) => {
  try {
    const { Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
    const permisosSend = JSON.parse(Permisos);
    if (!permisosSend.matricula) return res.send("NOT_ALLOWED");
    const {
      [0]: { year },
    } = await pool.query(
      "SELECT (year + 1 ) AS year FROM year WHERE estado = 1 "
    );
    const grados = await pool.query(
      "SELECT id, nombre FROM grados WHERE idYear = ?",
      [year]
    );

    res.render("./maestros/matricula", { permisosSend, year, grados, usuario });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.matriculaRegtistro = async (req, res) => {
  try {
    const {
      carnet,
      idYear,
      idGrado,
      Nombres,
      Apellidos,
      Sexo,
      FechaNac,
      EmailMain,
    } = req.body;

    const promesas = [];
    const {
      [0]: { cantidad },
    } = await pool.query(
      "SELECT COUNT(*) AS cantidad FROM alumnos WHERE Carnet = ? ",
      [carnet]
    );
    if (cantidad) {
      //Alumno existente
      promesas.push(
        /* Registro de matricula*/
        pool.query(
          "INSERT INTO matriculas(idAlumno, idYear, s3Key, data) VALUES (?,?,' ', ?) ",
          [carnet, idYear, JSON.stringify(req.body)]
        ),
        /* Registro de alumno en grado */
        pool.query(
          "INSERT INTO grado_alumno(idGrado, idAlumno, Conducta1, Conducta2, Conducta3, Conducta4) VALUES(?, ?, 100 , 100 ,100 , 100) ",
          [idGrado, carnet]
        )
      );
    } else {
      // Alumno no existe
      const carnetT = carnet.trim();
      await pool.query(
        "INSERT INTO alumnos(Carnet, Nombre , Apellido, Genero , FechaNac , Email) VALUES(?,?,?,?,?,?)",
        [carnetT, Nombres, Apellidos, Sexo, FechaNac, EmailMain]
      );
      adddUsuarioFunction({ user: carnetT, passwordPlain: carnetT, role: 2 });

      promesas.push(
        /* Registro de matricula*/
        pool.query(
          "INSERT INTO matriculas(idAlumno, idYear, s3Key, data) VALUES (?,?,' ', ?) ",
          [carnetT, idYear, JSON.stringify(req.body)]
        ),
        /* Registro de alumno en grado */
        pool.query(
          "INSERT INTO grado_alumno(idGrado, idAlumno, Conducta1, Conducta2, Conducta3, Conducta4) VALUES(?, ?, 100 , 100 ,100 , 100) ",
          [idGrado, carnetT]
        )
      );
    }
    const {
      [0]: { insertId },
    } = await Promise.all(promesas);

    res.json({ status: true, insertId });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.getDataAlumno = async (req, res) => {
  try {
    const { carnet } = req.params;
    const data = await pool.query("SELECT * FROM alumnos WHERE Carnet = ?", [
      carnet,
    ]);
    res.json(data);
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.uploadImg = async (req, res) => {
  try {
    const { idAlumno, idMatricula } = req.body;
    const ext = formatExtension(req.files.imagen.name.split("."));
    const fileContent = Buffer.from(req.files.imagen.data, "binary");
    const s3key = await upload(
      fileContent,
      `alumnos/${idAlumno}/${Date.now()}.${ext}`
    );
    await pool.query("UPDATE matriculas SET s3Key = ? WHERE id = ?", [
      s3key.key,
      idMatricula,
    ]);
    res.json({ status: true });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.delete = async (req, res) => {
  try {
    const { id, tabla, column } = req.body;

    if (!id || !tabla || !column)
      return res.json({ status: false, error: "PARAMS_NOT_COMPLETE" });

    const stament = `DELETE FROM ${tabla} WHERE ${column} = ${id}`;

    await pool.query(stament);

    res.json({ status: true });
  } catch (error) {
    console.error(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.indicadores = async (req, res) => {
  try {
    const indicadores = await pool.query(
      "SELECT id, indicador FROM indicadoresparvularia"
    );
    const { Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
    const permisosSend = JSON.parse(Permisos);

    res.render("./maestros/indicadores.ejs", {
      indicadores,
      permisosSend,
      usuario,
    });
  } catch (error) {
    console.log(error);
    return res.status(400).json({ status: false, error });
  }
};

maestros.newIndicadores = async (req, res) => {
  try {
    const { indicador } = req.body;
    const { insertId } = await pool.query(
      "INSERT INTO indicadoresparvularia(indicador) VALUES(?)",
      [indicador]
    );
    res.json({ status: true, insertId });
  } catch (error) {
    res.json({ status: false, error }).status(400);
  }
};

const formatExtension = (ext) => {
  ext = ext[ext.length - 1].toLowerCase();
  if (ext == "jpg") ext = "jpeg";
  return ext;
};

maestros.editIndicadores = async (req, res) => {
  try {
    const { indicador, id } = req.body;
    await pool.query(
      "UPDATE indicadoresparvularia SET indicador = ? WHERE id = ? ",
      [indicador, id]
    );
    res.json({ status: true });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.getEstudiantesAll = async (req, res) => {
  const { searchTerm } = req.body;
  let query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos WHERE Nombre like '%${searchTerm}%'   ORDER By Nombre LIMIT 5`;
  if (!searchTerm)
    query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos ORDER BY Nombre LIMIT 5`;
  try {
    const data = await pool.query(query);
    return res.json({ results: data });
  } catch (error) {
    console.log(error);
    return res.status(400).json({ error });
  }
};

maestros.viewNotasGrados = async (req, res) => {
  try {
    const { identificador, Permisos, usuario } = getUserDataByToken(
      req.cookies.token
    ).data;
    const permisosSend = JSON.parse(Permisos);

    const asignaciones = await pool.query(
      `
        SELECT
    modelomaterias.Nombre,
    grados.nombre AS Grado,
    materia_grado.idGrado AS idGrado,
    materia_grado.id AS idUnion
    FROM
        maestros_materias
    INNER JOIN materia_grado ON idUnionGradoMateria = materia_grado.id
    INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria
    INNER JOIN grados ON grados.id = materia_grado.idGrado
    WHERE
    maestros_materias.idMaestro =? AND grados.idYear = (SELECT year FROM year WHERE year.estado = 1 ) `,
      [identificador]
    );
    res.render("./maestros/viewgrades", {
      asignaciones,
      permisosSend,
      usuario,
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};

maestros.guia = async (req, res) => {
  try {
    const { identificador, Permisos, usuario } = getUserDataByToken(
      req.cookies.token
    ).data;
    const permisosSend = JSON.parse(Permisos);
    const dataOrdenada = [];

    const {
      [0]: { idGrado, cantidad },
    } = await pool.query(
      `SELECT id AS idGrado , COUNT(*) AS cantidad FROM grados WHERE idMaestro = ?  `,
      [identificador]
    );

    if (cantidad) {
      const {
        [0]: { idBimestre },
      } = await pool.query(
        "SELECT id AS idBimestre FROM bimestres WHERE estado = 1"
      );
      // RoleBimestre
      const {
        [0]: { roleBimestre },
      } = await pool.query(
        "SELECT Role AS roleBimestre FROM bimestres WHERE id = ?",
        [idBimestre]
      );

      const columna = `Conducta${roleBimestre}`;

      const queryPromesas = [
        /* NOTAS */
        pool.query(
          "SELECT actividades.Role AS RoleActivida, materia_grado.id AS idUnion, notas.Nota AS nota, notas.idAlumno AS idAlumno FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE materia_grado.idGrado = ? AND Bimestre = ? ORDER BY actividades.Role",
          [idGrado, idBimestre]
        ),
        /* MATERIAS */
        pool.query(
          "SELECT materia_grado.id AS idUnion , Siglas FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE idGrado = ? ",
          [idGrado]
        ),

        /* ESTUDIANTES */
        pool.query(
          `SELECT idAlumno, 
              ( SELECT CONCAT(Apellido, ' ', Nombre) FROM alumnos WHERE Carnet = grado_alumno.idAlumno ) AS Nombre,
               ${columna} AS puntaje
                FROM grado_alumno WHERE idGrado = ?  ORDER BY Nombre;`,
          [idGrado]
        ),
      ];

      const {
        [0]: notas,
        [1]: materias,
        [2]: estudiantes /* Select todas las materias de ese grado */,
      } = await Promise.all(queryPromesas);

      estudiantes.forEach((estudiante) => {
        const materiasArr = [];
        let notaPromedio = 0;

        let obj = {
          idAlumno: estudiante.idAlumno,
          nombreAlumno: estudiante.Nombre,
          puntaje: estudiante.puntaje,
        };

        materias.forEach((materia) => {
          /* MUESTRA LAS NOTA SUMADA POR MATERIA */
          let objInsede = {};
          objInsede.idUnion = materia.idUnion;
          objInsede.Nombre = materia.Siglas;
          let sumaNota = 0;
          notas.forEach((nota) => {
            if (
              nota.idUnion == materia.idUnion &&
              nota.idAlumno == estudiante.idAlumno
            ) {
              sumaNota = Number(nota.nota) + Number(sumaNota);
            }
          });

          objInsede.nota = sumaNota;
          notaPromedio = notaPromedio + sumaNota;
          materiasArr.push(objInsede);
        });
        obj.notas = materiasArr;
        obj.promedio = (notaPromedio / materias.length).toFixed(2);
        dataOrdenada.push(obj);
      });
    }
    res.render("./maestros/guia", {
      data: dataOrdenada,
      permisosSend,
      usuario,
      cantidad,
    });
  } catch (error) {
    console.log(error);
    res.status(400).json({ status: false, error });
  }
};


maestros.viewNotasViewer = async(req, res) => {
    try {
        const { Permisos, usuario } = getUserDataByToken(req.cookies.token).data;
        const permisosSend = JSON.parse(Permisos);
        const { idUnion } = req.params;


        const {
            [0]: { idGrado }
        } = await pool.query("SELECT idGrado FROM materia_grado WHERE id = ?", [idUnion]);
        const {
            [0]: { idBimestre }
        } = await pool.query("SELECT id AS idBimestre FROM bimestres WHERE estado = 1");

        const queryPromesas = [
            /* NOTAS */
            pool.query(
                "SELECT actividades.Role AS RoleActivida, actividades.Role AS Role ,materia_grado.id AS idUnion, notas.Nota AS nota, notas.idAlumno AS idAlumno FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE materia_grado.idGrado = ? AND actividades.Bimestre = ?  ORDER BY actividades.Role", [idGrado, idBimestre]
            ),
            /* MATERIAS */
            pool.query(
                "SELECT materia_grado.id AS idUnion , Nombre FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE materia_grado.id = ? ", [idUnion]
            ),

            /* ESTUDIANTES */
            pool.query(
                `SELECT idAlumno , (SELECT CONCAT(Apellido,' ',Nombre) FROM alumnos WHERE Carnet = grado_alumno.idAlumno ) AS Nombre  FROM grado_alumno WHERE idGrado = ? ORDER BY Nombre`, [idGrado]
            ),
        ];
        const {
            [0]: notas, [1]: materias, [2]: estudiantes /* Select todas las materias de ese grado */ ,
        } = await Promise.all(queryPromesas);
        const dataOrdenada = [];
        estudiantes.forEach((estudiante) => {
            const materiasArr = [];
            let obj = {
                idAlumno: estudiante.idAlumno,
                nombreAlumno: estudiante.Nombre,
            };
            materias.forEach((materia) => {
                /* MUESTRA LAS NOTAS SUMADAS POR ROLE */
                let roleOneNota = 0,
                    roleTwo = 0,
                    RoleTree = 0;
                let objInsede = {};
                objInsede.idUnion = materia.idUnion;
                objInsede.Nombre = materia.Nombre;
                const arrNota = [];
                notas.forEach((nota) => {
                    if (
                        nota.idUnion == materia.idUnion &&
                        nota.idAlumno == estudiante.idAlumno
                    ) {
                        if (nota.Role === 1)
                            roleOneNota = Number(nota.nota) + Number(roleOneNota);
                        if (nota.Role === 2) roleTwo = Number(nota.nota) + Number(roleTwo);
                        if (nota.Role === 3)
                            RoleTree = Number(nota.nota) + Number(RoleTree);
                    }
                });
                arrNota.push({ Bimestre: 1, nota: roleOneNota });
                arrNota.push({ Bimestre: 2, nota: roleTwo });
                arrNota.push({ Bimestre: 3, nota: RoleTree });
                objInsede.notas = arrNota;
                objInsede.notaTotal = roleOneNota + roleTwo + RoleTree;
                materiasArr.push(objInsede);
            });
            obj.notas = materiasArr;
            dataOrdenada.push(obj);
        });
        // const util = require('util');
        // console.log(util.inspect(dataOrdenada, false, null, true));
        res.render('./maestros/gradesviewer', { permisosSend, usuario, dataOrdenada });
    } catch (error) {
        console.log(error);
        res.status(400).json({ status: false, error });
    }
};




module.exports = maestros;