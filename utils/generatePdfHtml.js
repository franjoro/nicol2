const html_to_pdf = require("html-pdf-node");
const GenerarPdf = (data, header ,landscape = false ) => {
    if(landscape) landscape = true;
     const html = `<!DOCTYPE html>
     <html lang="en">
     <head>
         <meta charset="UTF-8">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
         <title>Document</title>
     </head>
     
     <body>
         <div class="container-fluid">
             <div class="row">
                 <div class="col-md-3">
                     <img src="https://drive.google.com/uc?export=view&id=1XeCSMVhFpRZypwV8xY4eKo2OpSFV7MOa" style="width: 100%;" alt="">
                 </div>
                 <div class="col-md-8">
                     <h1 class="pt-3">Colegio Salesiano San Juan Bosco</h1>
                    ${header}
                 </div>
             </div>
             <div class="row">
                 <div class="col-md-12">
                     <div class="card border">
                         <div class="card-body ">${data}</div>
                     </div>
                 </div>
             </div>
                 <hr>
                 <h4 class="pt-1">Observaciones: </h4>
         </div>
     </body>
     </html>`;
    return new Promise((resolver) => {
        tmpName = "ficha.pdf";
        const options = {
            format: "Letter",
            path: `./public/files/${tmpName}`,
        };
        const file = {content: html};
        html_to_pdf.generatePdf(file, options).then((output) => {
            resolver(output);
        });
    });
};

module.exports = {
    GenerarPdf
};