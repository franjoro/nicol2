const years = {};
const pool = require("../../models/db");

years.main = (req, res) => {
  res.render("./admin/catalogos/years/years");
};

years.createNewYear = async (req, res) => {
  // res.json({ status: true });
  try {
    const cantidadDeBimestres = 4;
    const { yearName } = req.body;
    const { insertId } = await pool.query("INSERT INTO year(year, estado, bimestreActivo)  VALUES( ?,  0 , 1 )", [yearName]);
    const arrPromesasBimestres = [];
    for (let index = 0; index < cantidadDeBimestres; index++) {
      arrPromesasBimestres.push(pool.query("INSERT INTO bimestres(Estado, Role, idYear) VALUES(0, ? , ?) ", [index, insertId]));
    }
    Promise.all(arrPromesasBimestres);
    return res.json({ status: true });
  } catch (error) {
    console.log(error);
    return res.status(400).json({ status: false, error });
  }
};

module.exports = years;
