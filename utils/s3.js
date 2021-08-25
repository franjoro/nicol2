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


// s3Functions.getFiles = (Key) =>
//   new Promise(async (resolve, reject) => {
//     const uploadParams = {
//       Bucket: process.env.BUCKET,
//       Key,
//     };
//     const fs = require("fs");
//     keyarr = Key.split(".");
//     try {
//       s3.getObject(uploadParams, (err, data) => {
//         if (err) throw err;
//         const path = `./public/files/tmp/tmpfile.${keyarr[1]}`;
//         fs.writeFile(path, data.Body, "Binary", (err) => {
//           if (err) throw err;
//           resolve(keyarr[1]);
//         });
//       });
//     } catch (error) {
//       resolve(error);
//     }
//   });


module.exports = s3Functions;
