const html_to_pdf = require("html-pdf-node");
const GenerarPdf = (data, header ,landscape = false, observaciones = "" ) => {
    console.log(observaciones);
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
                ${data}

                 <hr>
                 <h4 class="pt-1">Observaciones: </h4>
                 <textarea class="form-control disabled"  cols="30" rows="4">${observaciones}</textarea>
                 <hr>
                 <br>
                 <br>
                 <br>
                 <br>
                 <br>
                 <br>
                 <div class="row">
                    <div class="col-md-6 text-center">
                        <h4 class="pt-1">Firma profesor Guía </h4>
                    </div>
                    <div class="col-md-6 text-center">
                        <h4 class="pt-1">Firma Director </h4>
                    </div>
                 </div>
         </div>
     </body>
     </html>`;
    return new Promise((resolver) => {
        tmpName = "ficha.pdf";
        const options = {
            format: "Letter",
            path: `./public/files/${tmpName}`,
            margin: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
            }
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