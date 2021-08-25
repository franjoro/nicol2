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
      const {usuario , password}  = req.body ;
      const data = await pool.query(
        "SELECT Username,Password,Estado,Role, Permisos FROM usuarios WHERE Username = ? ",
       [usuario]
      );
      // Error si no existe
      if (!Array.isArray(data) || !data.length)
        return res.status(400).json({ error: "ERROR_NOT_EXIST", status: false });
      // Error si esta invalido
      if (!data[0].Estado)
        return res.status(400).json({ error: "ERROR_ESTADO", status: false });
      // Verificamos contraseña
      if (!(await desincriptar(password, data[0].Password)))
        return res.status(400).json({ error: "ERROR_PASSWORD", status: false });
      // Creamos JWT
      const { Role , Permisos} = data[0];
      let identificador;
      if(Role === 1 ) identificador = "admin";
      if(Role === 3 ){
        const { [0]: {id} } = await pool.query("SELECT id FROM maestros WHERE Email = ?" ,[usuario]);
        identificador = id;
      }
      if(Role === 2 ){
        identificador = usuario;
      }
      const payload = { identificador, Role, usuario , Permisos };
      console.log(payload);
      const token = firmar(payload);
      res.cookie("token", token);
      return res.status(200).json({ status: true, role: data[0].Role });
    } catch (error) {
      return res.status(400).json({ error, status: false });
    }
  };


module.exports = main;
