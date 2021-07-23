const usuarios = {};
const pool = require("../../models/db");
const { encriptar } = require("../../utils/decrypt");

usuarios.main = async (req, res) => {
    try {
        const usuarios = await pool.query(
            "SELECT Username,  CASE WHEN Role = 1 THEN 'Administrador' WHEN Role = 2 THEN 'Estudiante' WHEN Role = 3 THEN 'Maestro' END AS RoleText, IF(Estado = 1 , 'Activo', 'Inactivo') AS Estado FROM usuarios"
        );
        res.render("./admin/usuarios/usuarios", { usuarios });
    } catch (error) {
        console.log(error);
        return res.status(400).json({ status: false, error });
    }
};


// const addUserFunction = ({ user, passwordPlain, role, permisos = "" } )


usuarios.addUsuario = async (req, res) => {
    try {
        const { user, passwordPlain, role, permisos } = req.body;
        const { [0]: {cantidad} } = await pool.query("SELECT COUNT(*) AS cantidad FROM usuarios WHERE Username = ? " , [user]);
        if(cantidad) return res.status(400).json({ status: false, error:"USER_EXIST" });
        const password = await encriptar(passwordPlain);
        await pool.query(
            "INSERT INTO usuarios(Username, Password, Role , Estado , Permisos) VALUES(?,?,?,1,?)",[user, password , role , permisos ]
            );
        return res.json({status : true});
    } catch (err) {
        if (err.sqlState)return res.status(400).json({ error: "SQL ERROR", data: err.sqlMessage });
        return res.json(err);
    }
};


module.exports = usuarios;
