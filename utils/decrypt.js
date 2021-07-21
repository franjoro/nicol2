// Requiere el paquete ecriptador
const bcrypt = require("bcrypt");
// definimos largo del encriptado
const saltRounds = 10;

// variable a exportar
const encriptador = {};

// Metodo para encriptar
encriptador.encriptar = async (plainText) => {
  const data = await bcrypt.hashSync(plainText, saltRounds);
  return data;
};

// Metodo para desincriptar
encriptador.desincriptar = async (plainText, hash) => {
  const data = await bcrypt.compareSync(plainText, hash); // true
  return data;
};

module.exports = encriptador;
