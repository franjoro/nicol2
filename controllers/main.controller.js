const main = {};

const pool = require("../models/db");
const { firmar, getUserDataByToken } = require("../middlewares/auth");
const { encriptar, desincriptar } = require("../utils/decrypt");

main.main = function (req, res) {
  res.render("index");
};

// Login handler
main.signin = async (req, res) => {
  try {
    // verificamos si existe el usuario y traemos data en caso si
    const { usuario, password } = req.body;
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
    const { Role, Permisos } = data[0];
    let identificador;
    if (Role === 1) identificador = "admin";
    if (Role === 3) {
      const {
        [0]: { id },
      } = await pool.query("SELECT id FROM maestros WHERE Email = ?", [
        usuario,
      ]);
      identificador = id;
    }
    if (Role === 2) {
      identificador = usuario;
    }
    const payload = { identificador, Role, usuario, Permisos };
    const token = firmar(payload);
    res.cookie("token", token);
    return res.status(200).json({ status: true, role: data[0].Role });
  } catch (error) {
    console.log(error);
    return res.status(400).json({ error, status: false });
  }
};

main.password = async (req, res) => {
  try {
    if (!req.cookies.token)
      return res.json({ status: false, error: "USER_NOT_EXIST" });

    const { usuario } = getUserDataByToken(req.cookies.token).data;
    const { password, idUsuario } = req.body;

    if (usuario != idUsuario)
      return res.json({ status: false, error: "NOT_EQUAL_USER" });

    const newPassword = await encriptar(password);
    await pool.query("UPDATE usuarios SET Password = ? WHERE Username = ? ", [
      newPassword,
      idUsuario,
    ]);
    console.log(newPassword);
    return res.status(200).json({ status: true });
  } catch (error) {
    console.log(error);
    return res.status(400).json({ error });
  }
};

main.remindSender = async (req, res) => {
  const { email } = req.query;
  let { [0]: { ca } } = await pool.query("SELECT COUNT(*) AS ca FROM usuarios WHERE Username = ? ", [email]);
  console.log(ca);
  if (!ca) return res.json({ status: false, error: "USER_NOT_EXIST" });


  let Nombre, code, toSendEmail;
  if (email.includes("@")) {
     data = await pool.query(
      "SELECT CONCAT(Nombres,' ',Apellidos) AS Nombre FROM maestros WHERE Email = ? LIMIT 1 ; SELECT Password AS code FROM usuarios WHERE Username = ?",
      [email, email]
    );
    Nombre  = data[0][0].Nombre;
    code  = data[1][0].code;
    toSendEmail  = email;
  } else {
    data = await pool.query(
      "SELECT CONCAT(Nombres,' ',Apellidos) AS Nombre FROM maestros WHERE Email = ? LIMIT 1 ; SELECT Password AS code FROM usuarios WHERE Username = ?",
      [email, email]
    );
  }

  console.log(Nombre, code , toSendEmail);
  // const data = await pool.query( 
  //   "SELECT email, Nombre FROM tb_empresa WHERE tb_empresa.NIT = ? LIMIT 1 ; SELECT Password AS code FROM tb_usuarios WHERE id_usuario = ?",
  //   [nit, nit]
  // );
  // const { email } = data[0][0];
  // const { Nombre } = data[0][0];
  // const { code } = data[1][0];
  // const enlace = `https://cfp.ricaldone.edu.sv/public/password?code=${code}`;
  // const html = `<h1>Cambio de contraseña usuario empresarial</h1><br><p>Ha solicitado el cambio de contraseña correspondiente al usuario empresarial, por favor de click en el siguiente enlace : <a href="${enlace}" >${enlace}</a>, de no haber solicitado el cambio por favor omita este correo. Cualquier consulta o solicitud de información puede hacerla respondiendo este correo.  </p><p><b>Empresa: </b>${Nombre}</p>`;
  // sendEmail(email, "CAMBIO DE CONTRASEÑA USUARIO CFP RICALDONE", html);
  // res.json({ email }).status(200);
};

module.exports = main;
