const years = {};
const pool = require("../../models/db");

years.main =async (req, res) => {
  try {
    const years = await pool.query("SELECT year, IF(estado = 1 , 'Activo','Inactivo') AS estadoText , estado AS estadoID ,  IF(estado = 1 , 'green','red') AS color  FROM year ORDER BY year DESC");
    const {[0]:dataActual} = await pool.query("SELECT year , Role FROM year INNER JOIN bimestres ON bimestres.idYear = year.year WHERE bimestres.Estado = 1 AND year.estado = 1");
    res.render("./admin/catalogos/years/years" , {years, dataActual});
  } catch (error) {
    console.log(error);
    return res.status(400).json({ status: false, error }); 
  }
};

years.createNewYear = async (req, res) => {
  try {
    const cantidadDeBimestres = 4;
    const { yearName } = req.body;
    const { [0] : {isRepeat} }  = await pool.query("SELECT COUNT(*) as isRepeat FROM year WHERE year = ?", [yearName]);
    if(isRepeat) return res.status(400).json({ status: false, error:"YEAR_EXIST" });
    await pool.query("INSERT INTO year(year, estado)  VALUES( ?,  0  )", [yearName]);
    const arrPromesasBimestres = [];
    for (let index = 0; index < cantidadDeBimestres; index++) {
      arrPromesasBimestres.push(pool.query("INSERT INTO bimestres(Estado, Role, idYear) VALUES(0, ? , ?) ", [index +1, yearName]));
    }
    await Promise.all(arrPromesasBimestres);
    return res.json({ status: true });
  } catch (error) {
    console.log(error);
    return res.status(400).json({ status: false, error });
  }
};


years.settings = async (req, res) => {
  try {
    const {year, bimestre} = req.body;
    await pool.query("UPDATE bimestres SET Estado = 0; UPDATE year SET estado = 0;");

    await Promise.all([
      pool.query("UPDATE bimestres SET Estado = 1 WHERE idYear = ? AND Role = ?", [year, bimestre]),
      pool.query("UPDATE year SET estado = 1 WHERE year = ?", [year]),
      pool.query("UPDATE materia_grado SET EstadoAct1 = 1, EstadoAct2 = 1, EstadoAct3 = 1 "),
    ]);
    return res.json({ status: true });
  } catch (error) {
    console.log(error);
    return res.status(400).json({ status: false, error });
  }
};

module.exports = years;
