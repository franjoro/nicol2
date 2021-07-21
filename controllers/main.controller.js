const main = {};

const pool = require("../models/db");
const { firmar } = require("../middlewares/auth");
const { desincriptar } = require("../utils/decrypt");

main.main = function(req, res) {
    res.render('index');
};

// Login handler
main.signin = async (req, res) => {
    try {
      // verificamos si existe el usuario y traemos data en caso si
      const {usuario}  = req.body ;
      const data = await pool.query(
        "SELECT Username,Password,Estado,Role FROM usuarios WHERE Username = ? ",
       [usuario]
      );
      // Error si no existe
      if (!Array.isArray(data) || !data.length)
        return res.status(400).json({ error: "ERROR_NOT_EXIST", status: false });
      // Error si esta invalido
      if (!data[0].Estado)
        return res.status(400).json({ error: "ERROR_ESTADO", status: false });
      // Verificamos contraseña
      if (!(await desincriptar(req.body.password, data[0].Password)))
        return res.status(400).json({ error: "ERROR_PASSWORD", status: false });
      // Creamos JWT
      const { Nombre, Role } = data[0];
      const payload = { Nombre, Role, usuario: req.body.username };
      const token = firmar(payload);
      res.cookie("token", token);
      return res.status(200).json({ status: true, role: data[0].Role });
    } catch (error) {
      return res.status(400).json({ error, status: false });
    }
  };


module.exports = main;
