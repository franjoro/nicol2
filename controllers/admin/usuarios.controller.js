const usuarios = {};
const pool = require("../../models/db");
const { encriptar } = require("../../utils/decrypt");

usuarios.main = async (req, res) => {
    try {
        const usuarios = await pool.query(
            "SELECT Username,  CASE WHEN Role = 1 THEN 'Administrador' WHEN Role = 2 THEN 'Estudiante' WHEN Role = 3 THEN 'Maestro' END AS RoleText, IF(Estado = 1 , 'Activo', 'Inactivo') AS Estado, Permisos , Role, Estado AS estadoNum FROM usuarios"
        );
        res.render("./admin/usuarios/usuarios", { usuarios });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};

usuarios.adddUsuarioFunction =  ( async data =>{
    const { user, passwordPlain, role, permisos = JSON.stringify({allPermisos : true}) } = data;
    const password = await encriptar(passwordPlain);
    await pool.query(
        "INSERT INTO usuarios(Username, Password, Role , Estado , Permisos) VALUES(?,?,?,1,?)",[user, password , role , permisos ]
        );
});


usuarios.addUsuario = async (req, res) => {
    try {
        usuarios.adddUsuarioFunction(req.body);
        return res.json({status : true});
    } catch (err) {
        if (err.sqlState)return res.status(400).json({ error: "SQL ERROR", data: err.sqlMessage });
        return res.json(err);
    }
};


usuarios.updatePermisos = async (req, res) => {
    try {
        const {idUsuario, permisos} = req.body;
        await pool.query("UPDATE usuarios SET Permisos = ? WHERE Username = ?", [permisos , idUsuario]);
        return res.json({status : true});
    } catch (err) {
        if (err.sqlState)return res.status(400).json({ error: "SQL ERROR", data: err.sqlMessage });
        return res.json(err);
    }
};


usuarios.updateEstado = async (req, res) => {
    try {
        const {idUsuario, estado} = req.body;
        await pool.query("UPDATE usuarios SET Estado = ? WHERE Username = ?", [estado , idUsuario]);
        return res.json({status : true});
    } catch (err) {
        if (err.sqlState)return res.status(400).json({ error: "SQL ERROR", data: err.sqlMessage });
        return res.json(err);
    }
};


usuarios.password = async (req, res) => {
    const { newPass, idUsuario } = req.body; 
    const newPassword = await encriptar(newPass);
    try {
      await pool.query("UPDATE usuarios SET Password = ? WHERE Username = ? ", [newPassword, idUsuario]);
      return res.status(200).json({ status: true });
    } catch (error) {
      return res.status(400).json({ error });
    }
  };

module.exports = usuarios;
