const estudiantes = {};
const pool = require("../../models/db");
const { getImgMatricula } = require("../../utils/s3");
const { adddUsuarioFunction } = require("./usuarios.controller");

estudiantes.main = async (req, res) => {
    try {
        res.render("./admin/estudiantes/estudiantes");
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

estudiantes.getMatriculas = async (req, res) => {
    try {
        const { idAlumno } = req.params;

        const {
            [0]: { Nombre, Apellido },
        } = await pool.query(
            "SELECT Nombre, Apellido FROM alumnos WHERE Carnet = ? ",
            [idAlumno]
        );
        const matriculas = await pool.query(
            "SELECT id, idYear FROM matriculas WHERE idAlumno = ? ",
            [idAlumno]
        );

        console.log(matriculas);

        res.render("./admin/estudiantes/matriculas", {
            Nombre,
            Apellido,
            matriculas,
        });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

estudiantes.loadTable = async (req, res) => {
    const data = await pool.query(
        "SELECT Carnet, Nombre, Apellido, FechaNac, Email , IF(Genero=0 , 'Hombre', 'Mujer') AS Genero FROM alumnos "
    );
    res.json({ data });
};

estudiantes.addNew = async (req, res) => {
    try {
        const { Carnet, Nombre, Apellido, Genero, FechaNac, Email } = req.body;
        // Validar campos
        if (!Carnet || !Nombre || !Apellido || !Genero || !FechaNac || !Email)
            return res
                .json({ status: false, error: "VALUES_NOT_COMPLETED" })
                .status(400);
        // Validar existencia de carnet
        const {
            [0]: { cantidad },
        } = await pool.query(
            "SELECT COUNT(*) AS cantidad FROM alumnos WHERE Carnet = ? ",
            [Carnet]
        );
        if (cantidad)
            return res.status(400).json({ status: false, error: "CARNET_EXISTENTE" });
        // Validar existencia de usuario
        const {
            [0]: { cantidadU },
        } = await pool.query(
            "SELECT COUNT(*) AS cantidadU FROM usuarios WHERE Username = ? ",
            [Carnet]
        );
        if (cantidadU)
            return res.status(400).json({ status: false, error: "CARNET_EXISTENTE" });
        // Enviar consulta
        const { insertId } = await pool.query(
            "INSERT INTO alumnos(Carnet, Nombre , Apellido, Genero , FechaNac , Email) VALUES(?,?,?,?,?,?)",
            [Carnet, Nombre, Apellido, Genero, FechaNac, Email]
        );
        adddUsuarioFunction({ user: Carnet, passwordPlain: Carnet, role: 2 });
        res.json({ status: true, insertId });
    } catch (error) {
        console.log(error);
        res.json({ status: false, error }).status(400);
    }
};

estudiantes.edit = async (req, res) => {
    try {
        const { Carnet, Nombre, Apellido, Genero, FechaNac, Email } = req.body;
        // Validar campos
        if (!Carnet || !Nombre || !Apellido || !Genero || !FechaNac || !Email)
            return res
                .json({ status: false, error: "VALUES_NOT_COMPLETED" })
                .status(400);
        // Validar existencia de carnet
        const {
            [0]: { cantidad },
        } = await pool.query(
            "SELECT COUNT(*) AS cantidad FROM alumnos WHERE Carnet = ? ",
            [Carnet]
        );
        if (!cantidad)
            return res
                .status(400)
                .json({ status: false, error: "CARNET_NO_EXISTENTE" });
        // Validar existencia de usuario
        const {
            [0]: { cantidadU },
        } = await pool.query(
            "SELECT COUNT(*) AS cantidadU FROM usuarios WHERE Username = ? ",
            [Carnet]
        );
        if (!cantidadU)
            return res
                .status(400)
                .json({ status: false, error: "CARNET_NO_EXISTENTE" });
        // Enviar consulta
        await pool.query(
            "UPDATE alumnos SET Nombre = ? , Apellido = ? , Genero = ? , FechaNac = ? , Email = ? WHERE Carnet = ?",
            [Nombre, Apellido, Genero, FechaNac, Email, Carnet]
        );
        res.json({ status: true });
    } catch (error) {
        console.log(error);
        res.json({ status: false, error }).status(400);
    }
};

estudiantes.getEstudiantes = async (req, res) => {
    const { searchTerm } = req.body;
    const { idGrado } = req.params;
    let query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos WHERE Nombre like '%${searchTerm}%' GROUP BY Carnet  ORDER By Nombre LIMIT 5`;
    if (!searchTerm)
        query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos GROUP BY Carnet ORDER BY Nombre LIMIT 5`;
    try {
        const data = await pool.query(query, [idGrado]);
        return res.json({ results: data });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ error });
    }
};

estudiantes.getEstudiantesAll = async (req, res) => {
    const { searchTerm } = req.body;
    let query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos WHERE Nombre like '%${searchTerm}%' GROUP BY Carnet  ORDER By Nombre LIMIT 5`;
    if (!searchTerm)
        query = `SELECT Carnet AS id , CONCAT(Carnet , " - ", Nombre , " " , Apellido ) AS text FROM alumnos GROUP BY Carnet ORDER BY Nombre LIMIT 5`;
    try {
        const data = await pool.query(query);
        return res.json({ results: data });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ error });
    }
};

estudiantes.viewMatricula = async (req, res) => {
    try {
        const { idMatricula } = req.params;
        const { [0]: matriculas } = await pool.query(
            "SELECT * FROM matriculas WHERE id = ? ",
            [idMatricula]
        );
        const datos = JSON.parse(matriculas.data);
        const img = await getImgMatricula(matriculas.s3Key);

        const arrFamiliaresPromesas = [];

        datos["idEstudiantes[]"].forEach(async (carnet) => {
            arrFamiliaresPromesas.push(
                pool.query("SELECT Nombre, Apellido FROM alumnos WHERE Carnet = ?", [
                    carnet,
                ])
            );
        });
        const arrFamiliares  = await Promise.all(arrFamiliaresPromesas);
        const existFamiliares = datos["idEstudiantes[]"].length ? true : false;
        res.render("./admin/estudiantes/vermatricula", {
            datos,
            img: img.path,
            arrFamiliares,
            existFamiliares
        });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};


estudiantes.perfilAcademico = async (req, res) =>{
    const { idAlumno } = req.params;
    try {
    const {  [0]: { [0]:  datosGrado  }  , [1]: { [0]:  datosBimestre  }   } =  await Promise.all([
        // TRAER ID GRADO DEL ALUMNO
        pool.query("SELECT grados.id AS idGrado, grados.nombre FROM grados INNER JOIN year ON year.year = grados.idYear INNER JOIN grado_alumno ON grado_alumno.idGrado = grados.id WHERE year.estado = 1 AND idAlumno = ? GROUP BY idAlumno", [idAlumno]),
        // TRAER ROLE DEL BIMESTRE
        pool.query("SELECT id, Role AS roleBimestre FROM bimestres INNER JOIN year ON year.year = bimestres.idYear WHERE year.Estado = 1 AND bimestres.Estado= 1")
     ]);
     const columna = `Conducta${datosBimestre.roleBimestre}`;
     const { [0]:  datosAlumno  } = await pool.query(`SELECT Nombre, Apellido, ${columna} As puntaje FROM alumnos INNER JOIN grado_alumno ON grado_alumno.idAlumno  = alumnos.Carnet WHERE alumnos.Carnet = ? ` , idAlumno);


     const codigos = await pool.query("SELECT Codigo, valor, Observacion, CONCAT(maestros.Nombres , ' ', maestros.Apellidos) AS NombreMaestro  FROM codigo_alumno INNER JOIN codigos ON codigo_alumno.idCodigo = codigos.id INNER JOIN maestros ON maestros.id = codigo_alumno.idMaestro WHERE idBimestre = ? AND codigo_alumno.idAlumno = ? ORDER BY valor ASC" ,[ datosBimestre.id , idAlumno ]);



        console.log(codigos);
        res.render('./admin/estudiantes/perfilconducta.ejs' , {idAlumno , datosGrado, datosAlumno , codigos});
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });  
    }
};


module.exports = estudiantes;
