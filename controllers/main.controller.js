const main = {};

const pool = require("../models/db");
const { firmar, getUserDataByToken } = require("../middlewares/auth");
const { encriptar, desincriptar } = require("../utils/decrypt");
const { sendEmail } = require("../utils/mailer");

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
    Nombre = data[0][0].Nombre;
    code = data[1][0].code;
    toSendEmail = email;
  } else {
    data = await pool.query(
      "SELECT CONCAT(Nombre,' ',Apellido) AS Nombre, Email FROM alumnos WHERE Carnet = ? LIMIT 1 ; SELECT Password AS code FROM usuarios WHERE Username = ?",
      [email, email]
    );
    Nombre = data[0][0].Nombre;
    code = data[1][0].code;
    toSendEmail = data[0][0].Email;
  }

  // const enlace = `http://18.216.11.101/password?code=${code}`;
  const enlace = `http://localhost:3000/password?code=${code}`;
  const html = `<h1>Cambio de contraseña usuario, Colegio Salesiano San Juan Bosco </h1><br><p>Ha solicitado el cambio de contraseña correspondiente al usuario, por favor de click en el siguiente enlace : <a href="${enlace}" >${enlace}</a>, de no haber solicitado el cambio por favor omita este correo. Cualquier consulta o solicitud de información puede hacerla respondiendo este correo.  </p><p><b>Usuario : </b>${Nombre}</p>`;


  sendEmail(toSendEmail, "CAMBIO DE CONTRASEÑA USUARIO COLEGIO SAN JUAN BOSCO", " ", html);
  res.json({ email }).status(200);
};

main.remindPassword = async (req, res) => {
  const { code } = req.query;
  let check = await pool.query(
    "SELECT COUNT(*) AS ca FROM usuarios WHERE Password = ? ",
    [code]
  );
  check = check[0].ca;
  if (check) {
    let Username = await pool.query(
      "SELECT Username AS user FROM usuarios WHERE Password = ? ",
      [code]
    );
    Username = Username[0].user;
    res.render("password", { Username, code });
  } else {
    res
      .send(
        "Error: código no valido por favor comuniquese con el Centro de Formación"
      )
      .status(404);
  }
};


main.ChangePasswordwithReminder = async (req, res) => {
  const { username, code, password1 } = req.body;
  const encrip = await encriptar(password1);
  try {
    await pool.query(
      "UPDATE usuarios SET Password = ? WHERE Username = ? AND Password = ? ",
      [encrip, username, code]
    );
    let table = 'alumnos';
    let campo = 'Carnet';
    if (username.includes("@"))  {
      table = 'maestros';
      campo = 'Email';
    }

    const data = await pool.query(`SELECT email FROM ${table} WHERE ${campo} = ? LIMIT 1 `,[ username]);
    console.log(data);
    const { email } = data[0];

  // const enlace = `http://18.216.11.101/password?code=${code}`;
  const enlace = `http://localhost:3000/`;


    const html = `<h1>Cambio de contraseña usuario realizado</h1> <p>Se ha actualizado la contraseña del usuario  , puede ingresar a la plataforma en el siguiente enlace : <a href="${enlace}">${enlace}</a> </p> <br> <p>Si usted no ha hecho este cambio por favor comuniquese respondiendo este correo. O con soporte técnico </p>`;
    sendEmail(email, "CAMBIO DE CONTRASEÑA HECHO"," " , html);
    res.json({ status: true }).status(200);



  } catch (error) {
    console.log(error);
    return res.status(400).json({ error });
  }
};
module.exports = main;
