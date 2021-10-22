const nodemailer = require("nodemailer");
require("dotenv").config();

// email sender function
mailer = {};
// Definimos el transporter
const transporter = nodemailer.createTransport({
  service: "Gmail",
  auth: {
    user: process.env.EMAIL,
    pass: process.env.EMAILPASSWORD,
  },
});
mailer.sendEmail = (to, sub, text , html = "") => {
  // Definimos el email
  const mailOptions = {
    to: to || "no-reply@cssjb.edu.ni",
    subject: sub || "Error",
    text: text || "Message not sent",
    html
  };
  // Enviamos el email
  transporter.sendMail(mailOptions, (error) => {
    if (error) {
      console.log(error);
      return false;
    } else {
      console.log("Email sent");
      return true;
    }
  });
};

module.exports = mailer;
