const nodemailer = require("nodemailer");
// email sender function
mailer = {};
// Definimos el transporter
const transporter = nodemailer.createTransport({
  service: "Gmail",
  auth: {
    user: "franklin.alejandro51@gmail.com",
    pass: "fral0123456789",
  },
});
mailer.sendEmail = (to, sub, text , html = "") => {
  // Definimos el email
  const mailOptions = {
    from: "franklin.alejandro51@gmail.com",
    to: to || "franklin_lopez@ricaldone.edu.sv",
    subject: sub || "",
    text: text || "",
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
