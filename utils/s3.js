require("dotenv").config();
const AWS = require("aws-sdk");

AWS.config.update({ region: "us-west-2" });
const s3 = new AWS.S3({
  accessKeyId: process.env.AWSID,
  secretAccessKey: process.env.AWSKEY,
  apiVersion: "2006-03-01",
});

s3Functions = {};

s3Functions.upload = (file, key) =>
  new Promise((resolve, reject) => {
    const uploadParams = { Bucket: process.env.BUCKET, Key: key, Body: file };
    let status = s3.upload(uploadParams, (err, data) => {
      if (err) {
        reject(err);
      }
      if (data) {
        resolve({ key: uploadParams.Key });
      }
    });
    return status;
  });

// s3Functions.deleteObject = (Key) =>
//   new Promise((resolve, reject) => {
//     const uploadParams = { Bucket: process.env.BUCKET, Key };
//     s3.deleteObject(uploadParams, function (err, data) {
//       if (err) {
//         console.log(err);
//         reject(err);
//       }
//       console.log(data);
//       resolve(data);
//     });
//   });

s3Functions.getImgMatricula = (Key, idAlumno = null) =>
  new Promise(async (resolve) => {
    const uploadParams = {
      Bucket: process.env.BUCKET,
      Key,
    };
    const fs = require("fs");
    keyarr = Key.split(".");
    const idFile = Date.now();
    try {
      s3.getObject(uploadParams, (err, data) => {
        if (err) throw err;
        const path = `files/tmp/MatriculaView${idFile}.${keyarr[1]}`;
        fs.writeFile(`./public/${path}`, data.Body, "Binary", (err) => {
          if (err) throw err;
          resolve({ path, idFile, idAlumno });
        });
      });
    } catch (error) {
      console.log("Error handling");
      resolve(error);
    }
  });

module.exports = s3Functions;
