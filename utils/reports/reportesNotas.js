//Formato de titulos
// const titulos = ["String", "String", "String"];
// const datos = [{key: 'value' } , {key: 'value' }  ]

const Excel = {};

Excel.getConsolidadoBimestralExcel = (datos, roleBimestre, nombreGrado) => {
    return new Promise(async function(Resolve) {
        try {
            const xl = require("excel4node");
            const wb = new xl.Workbook();
            const NameSheet = "Consolidado Bimestral";
            const ws = wb.addWorksheet(NameSheet);

            const allBorder = {
                // §18.8.4 border (Border)
                left: {
                    style: "medium", //§18.18.3 ST_BorderStyle (Border Line Styles) ['none', 'thin', 'medium', 'dashed', 'dotted', 'thick', 'double', 'hair', 'mediumDashed', 'dashDot', 'mediumDashDot', 'dashDotDot', 'mediumDashDotDot', 'slantDashDot']
                    color: "black", // HTML style hex value
                },
                right: {
                    style: "medium",
                    color: "black",
                },
                top: {
                    style: "medium",
                    color: "black",
                },
                bottom: {
                    style: "medium",
                    color: "black",
                },
            };

            const styleTitles = wb.createStyle({
                font: {
                    bold: true,
                    size: 13,
                    family: "swiss",
                },
                border: allBorder,
            });
            const styleTitlesNoBorder = wb.createStyle({
                font: {
                    bold: true,
                    size: 13,
                    family: "swiss",
                },
            });

            const styleText = wb.createStyle({
                font: {
                    family: "swiss",
                    size: 13,
                },
                border: allBorder,
            });

            const styleTextNotas = (color = "black") => {
                return wb.createStyle({
                    font: {
                        size: 13,
                        color,
                        family: "swiss",
                    },
                    border: allBorder,
                });
            };

            let finalTitulos;
            const arrContadorReprobados = [];
            const arrContadorAprobadoMasculino = [];
            const arrContadorAprobadoFemenino = [];
            const cantidaAlumnos = datos.length;
            let cantidadMasculino = 0,
                cantidadFemenino = 0,
                aprobadosLimpioH = [0, 0, 0],
                aprobadosLimpioM = [0, 0, 0],
                cualidadesPromedioH = [0, 0, 0, 0],
                cualidadesPromedioM = [0, 0, 0, 0];

            ws.cell(1, 1, 1, 17, true)
                .string("Colegio Salesiano San Juan Bosco")
                .style({
                    font: {
                        bold: true,
                        size: 18,
                    },
                    alignment: {
                        // §18.8.1
                        horizontal: "center",
                        vertical: "center",
                    },
                });
            ws.cell(2, 1).string("Consolidado Bimestral").style(styleTitlesNoBorder);
            ws.cell(3, 1).string(`Grado : ${nombreGrado}`).style(styleTitlesNoBorder);
            ws.cell(3, 2)
                .string(`Bimestre: ${roleBimestre}`)
                .style(styleTitlesNoBorder);

            ws.cell(5, 1).string("Código Alumno").style(styleTitles);
            ws.cell(5, 2).string("Nombre del alumno").style(styleTitles);

            // Titulos
            datos[0].notas.forEach((element, index) => {
                ws.cell(5, index + 3)
                    .string(element.Nombre)
                    .style(styleTitles);
                finalTitulos = index + 3;
                arrContadorReprobados.push(0);
                arrContadorAprobadoMasculino.push(0);
                arrContadorAprobadoFemenino.push(0);
            });
            ws.cell(5, finalTitulos + 1)
                .string("Prom.")
                .style(styleTitles);
            ws.cell(5, finalTitulos + 2)
                .string("Conducta")
                .style(styleTitles);
            ws.cell(5, finalTitulos + 3)
                .string("Aprob.")
                .style(styleTitles);
            ws.cell(5, finalTitulos + 4)
                .string("Repr.")
                .style(styleTitles);

            let filaFinal = 5;
            let columnaFinal;
            // Iterar alumnos
            datos.forEach((element, index) => {
                if (element.Genero == 0) {
                    cantidadMasculino = cantidadMasculino + 1;
                } else {
                    cantidadFemenino = cantidadFemenino + 1;
                }

                let i = 1;
                let notasAprobadas = 0;
                let notasReprobadas = 0;

                ws.cell(index + 6, i)
                    .string(element.idAlumno)
                    .style(styleText);
                ws.cell(index + 6, i + 1)
                    .string(element.nombreAlumno)
                    .style(styleText);
                i++;
                filaFinal++;

                element.notas.forEach((nota, indexj) => {
                    const color = nota.nota >= 60 ? "black" : "red";

                    if (nota.nota >= 60) {
                        notasAprobadas = notasAprobadas + 1;
                        if (element.Genero == 0)
                            arrContadorAprobadoMasculino[indexj] =
                            arrContadorAprobadoMasculino[indexj] + 1;
                        if (element.Genero == 1)
                            arrContadorAprobadoFemenino[indexj] =
                            arrContadorAprobadoFemenino[indexj] + 1;
                    } else {
                        arrContadorReprobados[indexj] = arrContadorReprobados[indexj] + 1;
                        notasReprobadas = notasReprobadas + 1;
                    }

                    ws.cell(index + 6, indexj + 3)
                        .number(nota.nota)
                        .style(styleTextNotas(color));
                    columnaFinal = indexj + 3;
                });

                if (notasReprobadas == 0) {
                    if (element.Genero == 0) {
                        aprobadosLimpioH[0] = aprobadosLimpioH[0] + 1;
                    } else {
                        aprobadosLimpioM[0] = aprobadosLimpioM[0] + 1;
                    }
                }

                if (notasReprobadas > 0 && notasReprobadas <= 2) {
                    if (element.Genero == 0) {
                        aprobadosLimpioH[1] = aprobadosLimpioH[1] + 1;
                    } else {
                        aprobadosLimpioM[1] = aprobadosLimpioM[1] + 1;
                    }
                }

                if (notasReprobadas >= 3) {
                    if (element.Genero == 0) {
                        aprobadosLimpioH[2] = aprobadosLimpioH[2] + 1;
                    } else {
                        aprobadosLimpioM[2] = aprobadosLimpioM[2] + 1;
                    }
                }
                if (element.promedio >= 90) {
                    if (element.Genero == 0) {
                        cualidadesPromedioH[0] = cualidadesPromedioH[0] + 1;
                    } else {
                        cualidadesPromedioM[0] = cualidadesPromedioM[0] + 1;
                    }
                }

                if (element.promedio >= 76 && element.promedio <= 89) {
                    if (element.Genero == 0) {
                        cualidadesPromedioH[1] = cualidadesPromedioH[1] + 1;
                    } else {
                        cualidadesPromedioM[1] = cualidadesPromedioM[1] + 1;
                    }
                }

                if (element.promedio >= 60 && element.promedio <= 75) {
                    if (element.Genero == 0) {
                        cualidadesPromedioH[2] = cualidadesPromedioH[2] + 1;
                    } else {
                        cualidadesPromedioM[2] = cualidadesPromedioM[2] + 1;
                    }
                }

                if (element.promedio <= 59) {
                    if (element.Genero == 0) {
                        cualidadesPromedioH[3] = cualidadesPromedioH[3] + 1;
                    } else {
                        cualidadesPromedioM[3] = cualidadesPromedioM[3] + 1;
                    }
                }

                ws.cell(filaFinal, columnaFinal + 1)
                    .number(Number(element.promedio))
                    .style(styleTextNotas("black"));
                ws.cell(filaFinal, columnaFinal + 2)
                    .number(element.puntaje)
                    .style(styleTextNotas("black"));
                ws.cell(filaFinal, columnaFinal + 3)
                    .number(notasAprobadas)
                    .style(styleTextNotas("black"));
                ws.cell(filaFinal, columnaFinal + 4)
                    .number(notasReprobadas)
                    .style(styleTextNotas("red"));
            });

            ws.cell(filaFinal + 4, 2)
                .string("Materias")
                .style(styleTitles);

            datos[0].notas.forEach((element, index) => {
                ws.cell(filaFinal + 4, index + 3)
                    .string(element.Nombre)
                    .style(styleTitles);
            });

            ws.cell(filaFinal + 5, 2)
                .string("Cantidad materias aprobadas")
                .style(styleTitles);
            arrContadorReprobados.forEach((element, index) => {
                // Aprobadas
                ws.cell(filaFinal + 5, index + 3)
                    .number(cantidaAlumnos - element)
                    .style(styleTitles);
                // Reprobadas
                ws.cell(filaFinal + 6, index + 3)
                    .number(element)
                    .style(styleTitles);
                // Reprobadas Femenino
                ws.cell(filaFinal + 7, index + 3)
                    .number(arrContadorAprobadoFemenino[index])
                    .style(styleTitles);
                // Reprobadas Masculino
                ws.cell(filaFinal + 8, index + 3)
                    .number(arrContadorAprobadoMasculino[index])
                    .style(styleTitles);
            });

            ws.cell(filaFinal + 6, 2)
                .string("Cantidad materias aplazadas")
                .style(styleTitles);
            ws.cell(filaFinal + 7, 2)
                .string("Femenino Aprobado")
                .style(styleTitles);
            ws.cell(filaFinal + 8, 2)
                .string("Masculino Aprobado")
                .style(styleTitles);

            // Segunda parte de estadisticas
            ws.cell(filaFinal + 12, 2)
                .string("Cantidad total de alumnos")
                .style(styleTitles);

            ws.cell(filaFinal + 12, 3)
                .number(cantidaAlumnos)
                .style(styleTitles);

            ws.cell(filaFinal + 11, 5)
                .string("H")
                .style(styleTitles);

            ws.cell(filaFinal + 11, 6)
                .string("M")
                .style(styleTitles);

            ws.cell(filaFinal + 12, 5)
                .number(cantidadMasculino)
                .style(styleTitles);

            ws.cell(filaFinal + 12, 6)
                .number(cantidadFemenino)
                .style(styleTitles);

            ws.cell(filaFinal + 13, 2)
                .string("Aprobados en limpio")
                .style(styleTitles);

            ws.cell(filaFinal + 13, 3)
                .number(aprobadosLimpioH[0] + aprobadosLimpioM[0])
                .style(styleTitles);

            ws.cell(filaFinal + 13, 5)
                .number(aprobadosLimpioH[0])
                .style(styleTitles);

            ws.cell(filaFinal + 13, 6)
                .number(aprobadosLimpioM[0])
                .style(styleTitles);

            ws.cell(filaFinal + 14, 2)
                .string("Aplazados en 1 o 2 materias")
                .style(styleTitles);

            ws.cell(filaFinal + 14, 3)
                .number(aprobadosLimpioH[1] + aprobadosLimpioM[1])
                .style(styleTitles);

            ws.cell(filaFinal + 14, 5)
                .number(aprobadosLimpioH[1])
                .style(styleTitles);

            ws.cell(filaFinal + 14, 6)
                .number(aprobadosLimpioM[1])
                .style(styleTitles);

            ws.cell(filaFinal + 15, 2)
                .string("Aplazados en + de 3 materias")
                .style(styleTitles);

            ws.cell(filaFinal + 15, 3)
                .number(aprobadosLimpioH[2] + aprobadosLimpioM[2])
                .style(styleTitles);

            ws.cell(filaFinal + 15, 5)
                .number(aprobadosLimpioH[2])
                .style(styleTitles);

            ws.cell(filaFinal + 15, 6)
                .number(aprobadosLimpioM[2])
                .style(styleTitles);

            ws.cell(filaFinal + 16, 2)
                .string("AA 90-100")
                .style(styleTitles);

            ws.cell(filaFinal + 16, 3)
                .number(cualidadesPromedioH[0] + cualidadesPromedioM[0])
                .style(styleTitles);

            ws.cell(filaFinal + 16, 5)
                .number(cualidadesPromedioH[0])
                .style(styleTitles);

            ws.cell(filaFinal + 16, 6)
                .number(cualidadesPromedioM[0])
                .style(styleTitles);

            ws.cell(filaFinal + 17, 2)
                .string("AS 76-89")
                .style(styleTitles);

            ws.cell(filaFinal + 17, 3)
                .number(cualidadesPromedioH[1] + cualidadesPromedioM[1])
                .style(styleTitles);

            ws.cell(filaFinal + 17, 5)
                .number(cualidadesPromedioH[1])
                .style(styleTitles);

            ws.cell(filaFinal + 17, 6)
                .number(cualidadesPromedioM[1])
                .style(styleTitles);

            ws.cell(filaFinal + 18, 2)
                .string("AE 60-75")
                .style(styleTitles);

            ws.cell(filaFinal + 18, 3)
                .number(cualidadesPromedioH[2] + cualidadesPromedioM[2])
                .style(styleTitles);

            ws.cell(filaFinal + 18, 5)
                .number(cualidadesPromedioH[2])
                .style(styleTitles);

            ws.cell(filaFinal + 18, 6)
                .number(cualidadesPromedioM[2])
                .style(styleTitles);

            ws.cell(filaFinal + 19, 2)
                .string("AI 59 o menos")
                .style(styleTitles);

            ws.cell(filaFinal + 19, 3)
                .number(cualidadesPromedioH[3] + cualidadesPromedioM[3])
                .style(styleTitles);

            ws.cell(filaFinal + 19, 5)
                .number(cualidadesPromedioH[3])
                .style(styleTitles);

            ws.cell(filaFinal + 19, 6)
                .number(cualidadesPromedioM[3])
                .style(styleTitles);

            const name = `consolidadoBimestral${Date.now()}.xlsx`;
            const path = "./public/files/tmp/" + name;

            wb.write(path, function(err) {
                if (err) {
                    console.error(err);
                } else {
                    // console.log(stats);
                    Resolve(name);
                }
            });
        } catch (error) {
            console.log(error);
        }
    });
};

module.exports = Excel;