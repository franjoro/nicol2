const jwt = require("jsonwebtoken");
require("dotenv").config();

const auth = {};

auth.firmar = (data) => {
  const token = jwt.sign({ data, expiresIn: "7 days" }, process.env.JWTPASS);
  return token;
};

auth.authcheck = (req, res, next) => {
  let token = req.cookies.token;
  try {
    const data = jwt.verify(token, process.env.JWTPASS);
    if (data.data.Role === 3 || data.data.Role === 4)
      throw new Error("ROLE_INVALID");
    next();
  } catch (error) {
    res.redirect("/");
    return error;
  }
};

auth.CloseSession = (req, res,next) =>{
  res.clearCookie("token");
  next();
};

auth.getUserDataByToken = (token) => {
  try {
    return jwt.verify(token, process.env.JWTPASS);
  } catch (error) {
    return error;
  }
};

module.exports = auth;
