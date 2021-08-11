const conducta = {};
const pool = require("../../models/db");

conducta.main = async (req , res) => {
    try {
        let roleBimestre = req.params;
        if (roleBimestre.roleBimestre == undefined || roleBimestre.roleBimestre === null) {
            roleBimestre = await pool.query("SELECT Role AS roleBimestre FROM bimestres WHERE Estado = 1 ");
            roleBimestre = roleBimestre[0].roleBimestre;
        } else {
            roleBimestre = roleBimestre.roleBimestre;
        }
        const {[0]: {idBimestre}} = await pool.query("SELECT id AS idBimestre FROM bimestres INNER JOIN year ON year.year = bimestres.idYear WHERE year.Estado = 1 AND bimestres.Role= ?", roleBimestre);

        res.render('./admin/notas/notas' , { roleBimestre, idBimestre });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};


conducta.getNotasByAlumnos = async (req , res) => {
    try {
        const {idAlumno , idBimestre } = req.params; 

        const { [0] : {idGrado}} = await pool.query("SELECT grados.id AS idGrado FROM grados INNER JOIN YEAR ON YEAR.year = grados.idYear INNER JOIN grado_alumno ON grado_alumno.idGrado = grados.id WHERE YEAR.estado = 1 AND idAlumno = ? GROUP BY idAlumno",[idAlumno]);


        const queryPromesas = [
            pool.query("SELECT actividades.Titulo AS Titulo  ,actividades.Role AS RoleActivida, actividades.id AS idActividad, acumulados.id AS idAcumulado, materia_grado.id AS idUnion, SUM(notas.Nota) AS nota FROM actividades INNER JOIN acumulados ON actividades.id = acumulados.idActividad INNER JOIN notas ON notas.idAcumulado = acumulados.id INNER JOIN materia_grado ON materia_grado.id = actividades.unionMateriaGrado WHERE notas.idAlumno = ? AND materia_grado.idGrado = ? AND Bimestre= ? GROUP BY actividades.id ORDER BY actividades.Role", [idAlumno, idGrado, idBimestre]),
            pool.query("SELECT materia_grado.id AS idUnion , Nombre FROM materia_grado INNER JOIN modelomaterias ON modelomaterias.id = materia_grado.idModeloMateria WHERE idGrado = ? ", [idGrado])
        ];

        const {[0]: notas , [1]: materias } = await Promise.all(queryPromesas);

        const dataOrdenada = [];
        materias.forEach(materia => {
            let obj = {
                idUnion : materia.idUnion,
                Nombre: materia.Nombre
            };
            const arrNota = [];
            notas.forEach(nota=>{
                if(nota.idUnion == materia.idUnion){
                    arrNota.push(nota);
                }
            });
            obj.notas = arrNota;
            dataOrdenada.push(obj);
        });
        console.log(idAlumno);
        res.json(dataOrdenada);
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error }); 
    }
};

module.exports = conducta;