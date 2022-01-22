const usuarios = {};
const { getUserDataByToken } = require("../../middlewares/auth");
const pool = require("../../models/db");
const { encriptar } = require("../../utils/decrypt");

usuarios.main = async (req, res) => {
  try {
    const { Permisos } = getUserDataByToken(req.cookies.token).data;
    const permisos = JSON.parse(Permisos);

    const usuarios = await pool.query(
      "SELECT Username,  CASE WHEN Role = 1 THEN 'Administrador' WHEN Role = 2 THEN 'Estudiante' WHEN Role = 3 THEN 'Maestro' END AS RoleText, IF(Estado = 1 , 'Activo', 'Inactivo') AS Estado, Permisos , Role, Estado AS estadoNum FROM usuarios"
    );
    res.render("./admin/usuarios/usuarios", { usuarios , permisos});
  } catch (error) {
    console.log(error);
    return res.status(400).json({ status: false, error });
  }
};

usuarios.createAdminPage = async (req, res) => {
  try {
    const { Permisos } = getUserDataByToken(req.cookies.token).data;
    const permisos = JSON.parse(Permisos);
    res.render("./admin/usuarios/administrator" , {permisos});
  } catch (error) {
    console.log(error);
    return res.status(400).json({ status: false, error });
  }
};

usuarios.editAdminPage = async (req, res) => {
  try {
    const { Permisos } = getUserDataByToken(req.cookies.token).data;
    const permisos = JSON.parse(Permisos);
    const {username} = req.params;

    const {[0]: permisosFronDB } = await pool.query(
      `SELECT 
        Permisos
       FROM usuarios 
       WHERE Username = ?`, [username]);

    const obj = JSON.parse(permisosFronDB.Permisos);
    obj.username = username;
    obj.permisos = permisos;
    res.render("./admin/usuarios/administratorEdit", obj);
  } catch (error) {
    console.log(error);
    return res.status(400).json({ status: false, error });
  }
};

usuarios.adddUsuarioFunction = async (data) => {
  try {
    const {
      user,
      passwordPlain,
      role,
      permisos = JSON.stringify({ allPermisos: true }),
    } = data;
    const password = await encriptar(passwordPlain);
    await pool.query(
      "INSERT INTO usuarios(Username, Password, Role , Estado , Permisos) VALUES(?,?,?,1,?)",
      [user.trim(), password, role, permisos]
    );
    return true;
  } catch (error) {
    return false;
  }


};

usuarios.addUsuario = async (req, res) => {
  try {
    const response = await usuarios.adddUsuarioFunction(req.body);
    if (response) res.json({ status: true });
  } catch (err) {
    if (err.sqlState)
      return res.status(400).json({ error: "SQL ERROR", data: err.sqlMessage });
    return res.json(err);
  }
};

usuarios.updatePermisos = async (req, res) => {
  try {
    const { idUsuario, permisos } = req.body;
    await pool.query("UPDATE usuarios SET Permisos = ? WHERE Username = ?", [
      permisos,
      idUsuario,
    ]);
    return res.json({ status: true });
  } catch (err) {
    if (err.sqlState)
      return res.status(400).json({ error: "SQL ERROR", data: err.sqlMessage });
    return res.json(err);
  }
};

usuarios.updateEstado = async (req, res) => {
  try {
    const { idUsuario, estado } = req.body;
    await pool.query("UPDATE usuarios SET Estado = ? WHERE Username = ?", [
      estado,
      idUsuario,
    ]);
    return res.json({ status: true });
  } catch (err) {
    if (err.sqlState)
      return res.status(400).json({ error: "SQL ERROR", data: err.sqlMessage });
    return res.json(err);
  }
};

usuarios.password = async (req, res) => {
  const { newPass, idUsuario } = req.body;
  const newPassword = await encriptar(newPass);
  try {
    await pool.query("UPDATE usuarios SET Password = ? WHERE Username = ? ", [
      newPassword,
      idUsuario,
    ]);
    return res.status(200).json({ status: true });
  } catch (error) {
    return res.status(400).json({ error });
  }
};

usuarios.loadTable = async (req, res) => {
  const data = await pool.query(
    "SELECT Username,  CASE WHEN Role = 1 THEN 'Administrador' WHEN Role = 2 THEN 'Estudiante' WHEN Role = 3 THEN 'Maestro' END AS RoleText, IF(Estado = 1 , 'Activo', 'Inactivo') AS Estado, Permisos , Role, Estado AS estadoNum FROM usuarios"
  );
  res.json({ data });
};

module.exports = usuarios;
