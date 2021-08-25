const html_to_pdf = require("html-pdf-node");
const GenerarPdf = (data, landscape = false ) => {
    let html = `<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">`;
    html += data;
    console.log(html);

    return new Promise((resolver) => {
        tmpName = "ficha.pdf";
        const options = {
            format: "Letter",
            path: `./public/files/${tmpName}`,
            landscape 
        };
        const file = {
            content: html
        };
        html_to_pdf.generatePdf(file, options).then(() => {
            resolver(options.path);
        });
    });
};

module.exports = {
    GenerarPdf
};