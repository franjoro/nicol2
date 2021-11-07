-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2021 a las 22:36:58
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nicol2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` int(11) NOT NULL,
  `Titulo` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `Role` int(11) NOT NULL,
  `Bimestre` int(11) NOT NULL,
  `idMaestro` int(11) NOT NULL,
  `unionMateriaGrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `Titulo`, `Descripcion`, `Role`, `Bimestre`, `idMaestro`, `unionMateriaGrado`) VALUES
(42, 'Religión', 'Religión', 1, 16, 36, 27),
(43, 'Religión', 'Religión', 2, 16, 36, 27),
(44, 'Religión', 'Religión', 3, 16, 36, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acumulados`
--

CREATE TABLE `acumulados` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `Porcentaje` int(11) NOT NULL,
  `idActividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `acumulados`
--

INSERT INTO `acumulados` (`id`, `Descripcion`, `Porcentaje`, `idActividad`) VALUES
(76, 'Religión', 30, 42),
(77, 'Religión', 30, 43),
(78, 'Examen', 40, 44);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `Carnet` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Genero` int(11) NOT NULL,
  `FechaNac` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`Carnet`, `Nombre`, `Apellido`, `Genero`, `FechaNac`, `Email`) VALUES
('AAAB17-140812', 'Aarón Alberto', 'Acevedo Blandón', 0, '01-01-0123', 'aaron.acevedo@cssjb.edu.ni'),
('AAAD16-100510', 'Ángel Antonio', 'Acosta Duarte', 0, '01-01-0254', 'angel.acosta@cssjb.edu.ni'),
('AAAE21-021707', 'Angelli Auxiliadora', 'Arguello Estrada', 1, '01-01-0500', 'angelli.arguello@cssjb.edu.ni'),
('AAAM14-101208', 'Aleksey Aarón', 'Alemán Martínez', 0, '01-01-0347', 'aleksey.aleman@cssjb.edu.ni'),
('AACB14-170706', 'Angie Auxiliadora', 'Castillo Baltodano', 1, '01-01-0502', 'angie.castillo@cssjb.edu.ni'),
('AACP18-210506', 'Allisson Alondra', 'Castillo Pérez', 1, '01-01-0549', 'allison.castillo@cssjb.edu.ni'),
('AACR14-180609', 'Andrea Auxiliadora', 'Cano Ríos', 1, '01-01-0284', 'andrea.cano@cssjb.edu.ni'),
('AACR17-141112', 'Álvaro Antonio', 'Cano Ríos', 0, '01-01-0126', 'alvaro.rios@cssjb.edu.ni'),
('AAFG15-170708', 'Angie Alejandra', 'Flores Gutiérrez', 1, '01-01-0358', 'angie.flores@cssjb.edu.ni'),
('AAGC14-060209', 'Adán Alexander', 'Gómez Cruz', 0, '01-01-0362', 'adan.gomez@cssjb.edu.ni'),
('AAGCS20-051013', 'Anthony Gabriel', 'Corea Silva', 0, '01-01-0098', 'anthony.corea@cssjb.edu.ni'),
('AAHC17-170612', 'Angelicke Aisha', 'Hondoy Centeno', 1, '01-01-0158', 'angelicke.hondoy@cssjb.edu.ni'),
('AAHT19-221106', 'Arellys de los Ángeles', 'Herrera Toruño', 1, '01-01-0536', 'arellys.herrera@cssjb.edu.ni'),
('AAJA14-110707', 'Allan Andrés', 'Jiménez Alonzo', 0, '01-01-0472', 'allan.jimenez@cssjb.edu.ni'),
('AALA21-101614', 'Atahualpa Amaru', 'Lazo Avilés', 1, '01-01-0077', 'atahualpa.lazo@cssjb.edu.ni'),
('AALN15-170204', 'Anderson Antonio', 'Leal Núñez', 0, '01-01-0607', 'anderson.leal@cssjb.edu.ni'),
('AAME17-030810', 'Adriana Alexandra', 'Mongalo Estrada', 1, '01-01-0268', 'adriana.mongalo@cssjb.edu.ni'),
('AAML21-130316', 'Ariel Alexander', 'Muñoz Lara', 0, '01-01-0035', 'ariel.munoz@cssjb.edu.ni'),
('AAMM20-090113', 'Adriel Antonio', 'Marenco Montes', 0, '01-01-0161', 'adriel.marenco@cssjb.edu.ni'),
('AAMM21-122314', 'Anya Auxiliadora', 'Marenco Montes', 1, '01-01-0079', 'anya.marenco@cssjb.edu.ni'),
('AAMR14-220109', 'Aileen Anahí', 'Medina Rivas', 1, '01-01-0373', 'aileen.medina@cssjb.edu.ni'),
('AAOO14-101206', 'Ariana Alejandra', 'Olivares Oviedo', 1, '01-01-0514', 'ariana.olivares@cssjb.edu.ni'),
('AARA18-221211', 'Ariel Alberto', 'Rodríguez Ayala', 0, '01-01-0220', 'ariel.rodriguez@cssjb.edu.ni'),
('AARE14-051205', 'Alexander Antonio', 'Rocha Espinoza', 0, '01-01-0566', 'alexander.rocha@cssjb.edu.ni'),
('AARM15-270210', 'Alejandro Antonio', 'Ruiz Mayorga', 0, '01-01-0306', 'alejandro.ruiz@cssjb.edu.ni'),
('AÁRM21-090615', 'Aileen de los Ángeles', 'Roblero Meneses', 1, '01-01-0037', 'aileen.roblero@cssjb.edu.ni'),
('AART14-081106', 'Amy Alexia Fernanda', 'Robleto Tellería', 1, '01-01-0518', 'alexia.telleria@cssjb.edu.ni'),
('ABTM19-041111', 'Aurora Beatriz', 'Torrez Mercado', 1, '01-01-0226', 'aurora.torrez@cssjb.edu.ni'),
('ACMD14-031209', 'Arizu del Carmen', 'Morales Díaz', 1, '01-01-0330', 'arizu.morales@cssjb.edu.ni'),
('ACMR16-080611', 'Alicia Cristina', 'Mayorga Rivas', 1, '01-01-0211', 'alicia.mayorga@cssjb.edu.ni'),
('ADHL15-290910', 'Alex D\'Leòn', 'Henríquez Luna', 0, '01-01-0264', 'alex.henriquez@cssjb.edu.ni'),
('ADNE14-020109', 'Anayensi Dayana', 'Núñez Espinoza', 1, '01-01-0410', 'anayensi.nunez@cssjb.edu.ni'),
('ADPC16-231107', 'Ashley Denisse', 'Pérez Castro', 1, '01-01-0486', 'ashley.perez@cssjb.edu.ni'),
('ADSA16-220911', 'Alexander de Jesús', 'Sánchez Alguera', 0, '01-01-0222', 'alexander.sanchez@cssjb.edu.ni'),
('AECB14-070806', 'Ariana Elena', 'Calderón Benavente', 1, '01-01-0525', 'ariana.calderon@cssjb.edu.ni'),
('AEMM14-230110', 'Ángel Enrique', 'Martínez Mora', 0, '01-01-0296', 'angel.martinez@cssjb.edu.ni'),
('AERO14-100605', 'Ameck Enrique', 'Ruíz Ocón', 0, '01-01-0493', 'ameck.ruiz@cssjb.edu.ni'),
('AEVS14-040309', 'Antony Enrique', 'Vargas Sánchez', 0, '01-01-0381', 'antony.vargas@cssjb.edu.ni'),
('AFCM16-210705', 'Andrea Fernanda', 'Castillo Morales', 1, '01-01-0619', 'andrea.castillo@cssjb.edu.ni'),
('AFCO14-070805', 'Alex Fabricio', 'Chamorro Ortiz', 0, '01-01-0550', 'alex.chamorro@cssjb.edu.ni'),
('AFGS14-201204', 'Anneth Fernanda', 'Gómez Sandoval', 1, '01-01-0603', 'anneth.gomez@cssjb.edu.ni'),
('AFOE16-110411', 'Ángelo Fabián', 'Obando Estrada', 0, '01-01-0248', 'angelo.obando@cssjb.edu.ni'),
('AGAS21-210615', 'Alessandro Gustavo', 'Arcia Solari', 0, '01-01-0026', 'alessandro.arcia@cssjb.edu.ni'),
('AGAU21-211016', 'Ariana Gabriela', 'Alemán Ubau', 1, '01-01-0003', 'ariana.aleman@cssjb.edu.ni'),
('AGGP16-151011', 'Alison Gabriel', 'Guadamuz Peralta', 0, '01-01-0187', 'alison.guadamuz@cssjb.edu.ni'),
('AGMB14-200409', 'Ana Guadalupe', 'Miranda Balmaceda', 1, '01-01-0298', 'ana.miranda@cssjb.edu.ni'),
('AGMD14-160307', 'Ángel Gabriel', 'Medina Dávila', 0, '01-01-0538', 'angel.medina@cssjb.edu.ni'),
('AGRC14-290510', 'Anthony Gabriel', 'Reyes Cantón', 0, '01-01-0338', 'anthony.reyes@cssjb.edu.ni'),
('AGRR14-311007', 'Andrea Guadalupe', 'Ruiz Ruiz', 1, '01-01-0453', 'andrea.ruiz@cssjb.edu.ni'),
('AGZH16-200508', 'Ángel Gabriel', 'Zepeda Hernández', 0, '01-01-0418', 'angel.zepeda@cssjb.edu.ni'),
('AHAR21-042105', 'Adriana Honelly', 'Aguirre Roblero', 1, '01-01-0523', 'adriana.aguirre@cssjb.edu.ni'),
('AHGI17-240711', 'Anielka Halima', 'Gutiérrez Ibrahim', 1, '01-01-0204', 'anielka.gutierrez@cssjb.edu.ni'),
('AICC21-122514', 'Amelia Isabel', 'Cisneros Chamorro', 1, '01-01-0069', 'amelia.cisneros@cssjb.edu.ni'),
('AICF16-151004', 'Alejandro Israel', 'Colomer Fonseca', 0, '01-01-0596', 'alejandro.colomer@cssjb.edu.ni'),
('AICH20-141106', 'Ariana Isamar', 'Corea Hernández', 1, '01-01-0428', 'ariana.corea@cssjb.edu.ni'),
('AICS21-270117', 'Alexandra Isabella', 'Cuadra Sandino', 1, '01-01-0001', 'alexandra.cuadra@cssjb.edu.ni'),
('AJAM20-2020', 'Andrew Jhon', 'Alemán Medina', 0, '01-01-0420', 'andrew.aleman@cssjb.edu.ni'),
('AJAR14-230309', 'Alberto José', 'Acevedo Robleto', 0, '01-01-0346', 'alberto.acevedo@cssjb.edu.ni'),
('AJBM19-180107', 'Alisson Juliette', 'Bravo Morales', 1, '01-01-0424', 'alisson.bravo@cssjb.edu.ni'),
('AJCB15-280211', 'Alexander Josué', 'Casco Barberena', 0, '01-01-0256', 'alexander.casco@cssjb.edu.ni'),
('AJCD14-120206', 'Álvaro Joel', 'Cortes Delgado', 0, '01-01-0551', 'alvaro.cortes@cssjb.edu.ni'),
('AJCM18-010606', 'Andy Josué', 'Castillo Monjarrez', 0, '01-01-0573', 'andy.castillo@cssjb.edu.ni'),
('AJCO14-070709', 'Ángel Julián', 'Chávez Obando', 0, '01-01-0317', 'angel.chavez@cssjb.edu.ni'),
('AJDF16-060611', 'Alejandro José', 'Duarte Fernández', 0, '01-01-0203', 'alejandro.duarte@cssjb.edu.ni'),
('AJGX14-260609', 'Abidal José', 'Guillen', 0, '01-01-0289', 'abidal.guillen@cssjb.edu.ni'),
('AJHR17-120907', 'Axel Javier', 'Hondoy Rivas', 0, '01-01-0438', 'axel.hondoy@cssjb.edu.ni'),
('AJLH16-020711', 'Allisson Joheysi', 'López Herrera', 1, '01-01-0192', 'allisson.lopez@cssjb.edu.ni'),
('AJMQ14-270108', 'Abraham José', 'Martínez Quiroz', 0, '01-01-0478', 'abraham.martinez@cssjb.edu.ni'),
('AJPM14-130206', 'Amberly Jusseth', 'Palacios Márquez', 1, '01-01-0563', 'amberly.palacios@cssjb.edu.ni'),
('AJPM17-060112', 'Abner José', 'Palacios Márquez', 0, '01-01-0194', 'abner.palacios@cssjb.edu.ni'),
('AJRM14-270406', 'Andy Josué', 'Robleto McRea', 0, '01-01-0565', 'andy.robleto@cssjb.edu.ni'),
('AJRM16-140212', 'Allan José', 'Robleto McRea', 0, '01-01-0195', 'allan.robleto@cssjb.edu.ni'),
('AJUA21-210616', 'Ian Alfonso José', 'Ugarte Altamirano', 0, '01-01-0013', 'ian.ugarte@cssjb.edu.ni'),
('AKCP14-071009', 'Alysha Kamaria', 'Chávez Parrales', 1, '01-01-0318', 'alysha.chavez@cssjb.edu.ni'),
('AKMM14-080707', 'Angelly Karold', 'Murillo McRea', 1, '01-01-0539', 'angelly.murillo@cssjb.edu.ni'),
('ALCC14-050208', 'Anthony Luis', 'Cornejo Cisne', 0, '01-01-0429', 'anthony.cornejo@cssjb.edu.ni'),
('ALVM14-100205', 'Ángel Lenin', 'Vivas Mena', 0, '01-01-0640', 'angel.vivas@cssjb.edu.ni'),
('ALVM14-100408', 'Andrés Lenin', 'Vivas Mena', 0, '01-01-0457', 'andres.vivas@cssjb.edu.ni'),
('AMAV21-090308', 'Angie Melissa', 'Alemán Vega', 1, '01-01-0348', 'angie.aleman@cssjb.edu.ni'),
('AMBH17-181012', 'Alejandro Martín', 'Barquero Hernández', 0, '01-01-0149', 'alejandro.barquero@cssjb.edu.ni'),
('AMCR17-280612', 'Andrea Michelle', 'Chávez Reyes', 1, '01-01-0153', 'andrea.chavez@cssjb.edu.ni'),
('AMLM14-170709', 'Andrés Miguel', 'Largaespada Morales', 0, '01-01-0292', 'andres.largaespada@cssjb.edu.ni'),
('AMRG14-051204', 'Angie Michelle', 'Ramírez Gómez', 1, '01-01-0611', 'angie.ramirez@cssjb.edu.ni'),
('ANCL21-090514', 'Ángel Nathaly', 'Cornejo Largaespada', 1, '01-01-0070', 'angel.cornejo@cssjb.edu.ni'),
('ANCO21-110608', 'Andrea Nohemi', 'Cabrera Obnado', 1, '01-01-0351', 'andrea.cabrera@cssjb.edu.ni'),
('ANDA14-180406', 'Ashley Nicole', 'Díaz Acevedo', 1, '01-01-0574', 'ashley.diaz@cssjb.edu.ni'),
('ANEC14-130906', 'Azalia Nickol', 'Estrada Chávez', 1, '01-01-0506', 'azalia.estrada@cssjb.edu.ni'),
('ANFF14-020605', 'Ashly Nicole', 'Flores Flores', 1, '01-01-0600', 'ashly.flores@cssjb.edu.ni'),
('ANPM14-070807', 'Ashley Nicole', 'Pallais Morales', 1, '01-01-0449', 'ashley.pallais@cssjb.edu.ni'),
('ANPM15-240810', 'Audrey Noemí', 'Palacios Márquez', 1, '01-01-0274', 'audrey.palacios@cssjb.edu.ni'),
('ANSG21-010815', 'Angely Nicolle', 'Sáenz García', 1, '01-01-0089', 'angely.saenz@cssjb.edu.ni'),
('AOCT14-180508', 'Ángelo Omar', 'Canda Tamariz', 0, '01-01-0382', 'angelo.canda@cssjb.edu.ni'),
('APOD16-020509', 'Angie Patricia', 'Ojeda Domínguez', 1, '01-01-0301', 'angie.ojeda@cssjb.edu.ni'),
('ARCC17-181012', 'Ariana Rosibel', 'Cisneros Chamorro', 1, '01-01-0128', 'ariana.cisneros@cssjb.edu.ni'),
('ARMM15-230411', 'Ana Regina', 'Montiel Martínez', 1, '01-01-0270', 'ana.montiel@cssjb.edu.ni'),
('ASBR17-010710', 'Ashley Sofia', 'Bendaña Rocha', 1, '01-01-0230', 'ashley.bendana@cssjb.edu.ni'),
('ASBS20-200408', 'Alicia Sofia', 'Baltodano Sandoval', 1, '01-01-0423', 'alicia.baltodano@cssjb.edu.ni'),
('ASCC20-170707', 'Aaron Saul', 'Caldera Chamorro', 0, '01-01-0426', 'aaron.caldera@cssjb.edu.ni'),
('ASGG19-080108', 'Andrés Santiago', 'González González', 0, '01-01-0434', 'andres.gonzalez@cssjb.edu.ni'),
('ASM21-030311', 'Abril Sofía', 'Mora Rodríguez', 1, '01-01-0193', 'abril.mora@cssjb.edu.ni'),
('ASR21-121811', 'Alexander', 'Soin Romero', 0, '01-01-0198', 'alexander.soin@cssjb.edu.ni'),
('ATFC14-110809', 'Alessandro Tadeo', 'Flores Calero', 0, '01-01-0320', 'alessandro.flores@cssjb.edu.ni'),
('ATGF21-120608', 'Alexandre Tadeo', 'Gutérrez Flores', 0, '01-01-0391', 'tadeo.gutierrez@cssjb.edu.ni'),
('AVGA21-090617', 'Ana Victoria', 'Guerrero Aburto', 1, '01-01-0002', 'ana.guerrero@cssjb.edu.ni'),
('AVPO19-264200', 'Angie Vanessa', 'Perla Orozco', 1, '01-01-0378', 'angie.perla@cssjb.edu.ni'),
('AVSA17-010205', 'Ana Victoria', 'Sandoval Arana', 1, '01-01-0631', 'ana.sandoval@cssjb.edu.ni'),
('AVSL14-300704', 'Amelia Valeska', 'Sánchez Lazo', 1, '01-01-0630', 'amelia.sanchez@cssjb.edu.ni'),
('AXMF14-260908', 'Angelina', 'Miranda Fortiche', 1, '01-01-0375', 'angelina.miranda@cssjb.edu.ni'),
('AXOB19-310507', 'Andrea Xiomara', 'Ortega Bonilla', 1, '01-01-0540', 'andrea.ortega@cssjb.edu.ni'),
('AXOG14-051107', 'Andy Xavier', 'Orochena García', 0, '01-01-0485', 'andy.orochena@cssjb.edu.ni'),
('AXSD19-100909', 'Abdiel', 'Sevilla Delgado', 0, '01-01-0251', 'abdiel.sevilla@cssjb.edu.ni'),
('AYEG17-130612', 'Axcell Yamil', 'Espinoza Guevara', 0, '01-01-0129', 'axcell.espinoza@cssjb.edu.ni'),
('AYNB14-171105', 'Adilya Yariza', 'Navas Borge', 1, '01-01-0581', 'adilya.navas@cssjb.edu.ni'),
('BAAG19-181109', 'Brayan Anthony', 'Altamirano González', 0, '01-01-0280', 'bryan.altamirano@cssjb.edu.ni'),
('BARU14-050205', 'Bryan Alexander', 'Ríos Urbina', 0, '01-01-0614', 'bryan.rios@cssjb.edu.ni'),
('BAVA16-311210', 'Bryan Alexander', 'Veliz Aguilar', 0, '01-01-0253', 'bryan.veliz@cssjb.edu.ni'),
('BBGP21-101014', 'Bryan Bradly', 'Guerrero Pérez', 0, '01-01-0075', 'bryan.guerrero@cssjb.edu.ni'),
('BBUS21-210716', 'Brizeyda Bersabe', 'Ulloa Solari', 1, '01-01-0004', 'brizeyda.ulloa@cssjb.edu.ni'),
('BDUB14-040608', 'Britanny Dayanne', 'Urbina Baltodano', 1, '01-01-0455', 'britanny.urbina@cssjb.edu.ni'),
('BFBD17-140812', 'Brittany Fabiana', 'Barillas Dávila', 1, '01-01-0124', 'brittany.barillas@cssjb.edu.ni'),
('BGRJ14-200504', 'Bosco Gerardo', 'Raudez Jiménez', 0, '01-01-0613', 'bosco.raudez@cssjb.edu.ni'),
('BGSÁ21-270615', 'Bethsy Guadalupe', 'Sánchez Mejía', 1, '01-01-0060', 'bethsy.sanchez@cssjb.edu.ni'),
('BGZC14-310109', 'Brittany Guadalupe', 'Zúniga Carcache', 1, '01-01-0419', 'brittany.zuniga@cssjb.edu.ni'),
('BIMP14-031205', 'Benjamín Israel', 'Martínez Porta', 0, '01-01-0578', 'benjamin.martinez@cssjb.edu.ni'),
('BJGM14-220406', 'Bruno Javier', 'Gómez Mejía', 0, '01-01-0554', 'bruno.gomez@cssjb.edu.ni'),
('BJOB14-021108', 'Bayardo José', 'Ortega Bonilla', 0, '01-01-0376', 'bayardo.ortega@cssjb.edu.ni'),
('BJSM16-290811', 'Brandon José', 'Sandino Mayorga', 0, '01-01-0224', 'brandon.sandino@cssjb.edu.ni'),
('BMCA15-241108', 'Bosco Martin', 'Castillo Alemán', 0, '01-01-0383', 'bosco.castillo@cssjb.edu.ni'),
('BMCB14-190809', 'Brandon Marcelo', 'Castillo Barberena', 0, '01-01-0285', 'brandon.castillo@cssjb.edu.ni'),
('BMRG14-020106', 'Brandon Manuel', 'Romero Gutiérrez', 0, '01-01-0587', 'brandon.romero@cssjb.edu.ni'),
('BNCM14-131206', 'Brithany Ninel', 'Chavarría Mena', 1, '01-01-0526', 'brithany.chavarria@cssjb.edu.ni'),
('BNMD15-281010', 'Benjamín Noel', 'Marenco Dávila', 0, '01-01-0242', 'benjamin.marenco@cssjb.edu.ni'),
('BSUO14-050107', 'Bianka Stefani', 'Urroz Obando', 1, '01-01-0522', 'bianka.urroz@cssjb.edu.ni'),
('BXCG15-070710', 'Bosco Xavier Azarías', 'Cruz González', 0, '01-01-0234', 'bosco.cruz@cssjb.edu.ni'),
('CAAR14-141204', 'Carlos Armando', 'Acevedo Robleto', 0, '01-01-0593', 'carlos.acevedo@cssjb.edu.ni'),
('CAHB21-291215', 'Camila Axiliadora', 'Hernández Blanco', 1, '01-01-0032', 'camila.hernandez@cssjb.edu.ni'),
('CALR18-070309', 'Cristian Alexander', 'Lemus Ramírez', 0, '01-01-0368', 'cristian.lemus@cssjb.edu.ni'),
('CAMM14-020109', 'Carlos Alberto', 'Murillo McRea', 0, '01-01-0408', 'carlos.murillo@cssjb.edu.ni'),
('CARM14-200406', 'Camila de los Ángeles', 'Rojas Mercado', 1, '01-01-0568', 'camila.rojas@cssjb.edu.ni'),
('CARR14-201007', 'Chelsea Astrid', 'Ruiz Rizo', 1, '01-01-0452', 'chelsea.ruiz@cssjb.edu.ni'),
('CASA14-050909', 'Christopher Antonio', 'Sánchez Alguera', 0, '01-01-0308', 'cristopher.sanchez@cssjb.edu.ni'),
('CAVL14-210708', 'Carlos Alberto', 'Vargas López', 0, '01-01-0380', 'carlos.vargas@cssjb.edu.ni'),
('CCRM17-180613', 'Carlos Camilo', 'Rodríguez Marcenaro', 0, '01-01-0165', 'carlos.rodriguez@cssjb.edu.ni'),
('CDMJ19-220214', 'César Francisco de Guadalupe', 'Mendoza Jarquín', 0, '01-01-0115', 'cesar.mendoza@cssjb.edu.ni'),
('CDRR14-211107', 'Clarence Daniel', 'Reyes Rojas', 0, '01-01-0490', 'clarence.reyes@cssjb.edu.ni'),
('CEAI20-280607', 'Carlos Eduardo', 'Abea Incer', 0, '01-01-0459', 'carlos.abea@cssjb.edu.ni'),
('CFCL14-271107', 'Carlos Fernando', 'Corea López', 0, '01-01-0355', 'carlos.corea@cssjb.edu.ni'),
('CFGX14-020908', 'Christiana Francella', 'Guadamuz', 1, '01-01-0364', 'christiana.guadamuz@cssjb.edu.ni'),
('CGCC21-041011', 'Caliz Guadalupe', 'Cajina Castellón', 1, '01-01-0255', 'caliz.cajina@cssjb.edu.ni'),
('CGHG17-141109', 'Celeste Guadalupe', 'Hondoy Guadamuz', 1, '01-01-0392', 'celeste.hondoy@cssjb.edu.ni'),
('CHCB15-290110', 'Carlos Horacio', 'Chang Bermúdez', 0, '01-01-0287', 'carlos.chang@cssjb.edu.ni'),
('CICP17-200213', 'Carlos Iván', 'Chalupa Pineda', 0, '01-01-0127', 'carlos.chalupa@cssjb.edu.ni'),
('CISG16-280908', 'Chelsea Isabella', 'Samayoa González', 1, '01-01-0417', 'chelsea.samayoa@cssjb.edu.ni'),
('CJFJ21-122814', 'Camila de Jesús', 'Flores Jirón', 1, '01-01-0071', 'camila.flores@cssjb.edu.ni'),
('CJRD19-161009', 'Christopher Jayco', 'Reyes Domínguez', 0, '01-01-0339', 'christopher.reyes@cssjb.edu.ni'),
('CMAM15-100109', 'Carlos Manuel', 'Ayala Medrano', 0, '01-01-0349', 'carlos.ayala@cssjb.edu.ni'),
('CMDL20-140416', 'Cristel Michell', 'Davila Lopez', 1, '01-01-0005', 'cristel.davila@cssjb.edu.ni'),
('CMEX14-170605', 'Clarisa María', 'Espinoza', 1, '01-01-0599', 'clarisa.espinoza@cssjb.edu.ni'),
('CMGP14-070606', 'Cristina Marcela A.', 'González Pacheco', 1, '01-01-0555', 'cristina.gonzalez@cssjb.edu.ni'),
('CMLC14-150208', 'Claudio Mateo', 'Lanzas Chamorro', 0, '01-01-0475', 'claudio.lanzas@cssjb.edu.ni'),
('CMRC14-131105', 'Carmen María', 'Romero Chávez', 1, '01-01-0569', 'carmen.romero@cssjb.edu.ni'),
('CPRL14-221107', 'Cristiana Paola', 'Robles López', 1, '01-01-0492', 'cristiana.robles@cssjb.edu.ni'),
('CRCM21-082214', 'Carlos Rafael', 'Carazo Mora', 0, '01-01-0064', 'carlos.carazo@cssjb.edu.ni'),
('CRLE20-270912', 'Carlos Rafael', 'López Espinoza', 0, '01-01-0136', 'carlos.lopez@cssjb.edu.ni'),
('CSOT15-080808', 'Camila Sofía', 'Ortega Talavera', 1, '01-01-0302', 'camila.ortega@cssjb.edu.ni'),
('DABG21-092814', 'Dylan Abdiel', 'Briones González', 0, '01-01-0063', 'dylan.briones@cssjb.edu.ni'),
('DABM16-220511', 'Dayanara Auxiliadora', 'Brizuela Moraga', 1, '01-01-0175', 'dayanara.brizuela@cssjb.edu.ni'),
('DACC19-210213', 'Diego Alessandro', 'Cardoza Calderón', 0, '01-01-0152', 'diego.cardoza@cssjb.edu.ni'),
('DACU18-141113', 'Daniel Alberto', 'Cornejo Umaña', 0, '01-01-0099', 'daniel.cornejo@cssjb.edu.ni'),
('DADH20-3082007', 'Daryana Auxiliadora', 'Duarte Hondoy', 1, '01-01-0465', 'daryana.duarte@cssjb.edu.ni'),
('DAGC17-080513', 'Diego Arafat', 'Galeano Cerda', 0, '01-01-0130', 'diego.galeano@cssjb.edu.ni'),
('DAGC17-271212', 'Derek Alessandro', 'Gómez Centeno', 0, '01-01-0132', 'derek.gomez@cssjb.edu.ni'),
('DAGS14-180908', 'Dennis Adriano', 'Gómez Sandoval', 0, '01-01-0389', 'denis.gomez@cssjb.edu.ni'),
('DALD16-151111', 'Daniela Auxiliadora', 'López Delgado', 1, '01-01-0206', 'daniela.lopez@cssjb.edu.ni'),
('DAMM21-092314', 'Dayanne Andrea', 'Murillo Mcrea', 1, '01-01-0085', 'dayan.murillo@cssjb.edu.ni'),
('DAMX15-010111', 'Diego Andrés', 'Cornejo Morales', 0, '01-01-0258', 'diego.morales@cssjb.edu.ni'),
('DANG16-100608', 'David Andrés', 'Noguera Godoy', 0, '01-01-0409', 'david.noguera@cssjb.edu.ni'),
('DAOM14-180108', 'Dereck Antonio', 'Ortega Mora', 0, '01-01-0447', 'dereck.ortega@cssjb.edu.ni'),
('DAOO17-010613', 'Dominic Alexander', 'Ortega Ocón', 0, '01-01-0162', 'dominic.ortega@cssjb.edu.ni'),
('DAOR21-060802', 'Dennis Abraham', 'Ortega Rodríguez', 0, '01-01-0625', 'denis.ortega@cssjb.edu.ni'),
('DARO17-201207', 'Douglas Antonio', 'Ruiz Ocón', 0, '01-01-0494', 'douglas.ruiz@cssjb.edu.ni'),
('DAUC21-270715', 'Daniel Andrés', 'Urbina Corrales', 0, '01-01-0041', 'daniel.urbina@cssjb.edu.ni'),
('DAVB17-240513', 'Demian Alexander', 'Vásquez Brizuela', 0, '01-01-0146', 'demian.vasquez@cssjb.edu.ni'),
('DFBA21-010715', 'Daniela Fernanda', 'Barahona Noguera', 1, '01-01-0046', 'daniela.barahona@cssjb.edu.ni'),
('DFCA21-101110', 'Diego Fabián', 'Centeno Alvarado', 0, '01-01-0180', 'diego.centeno@cssjb.edu.ni'),
('DFGL20-250414', 'Dereck Francisco', 'Garay Loza', 0, '01-01-0106', 'dereck.garay@cssjb.edu.ni'),
('DFRO17-041107', 'Derek Fabián', 'Ruiz Ocón', 0, '01-01-0343', 'derek.ruiz@cssjb.edu.ni'),
('DGBR21-230515', 'Dennys Gabriel', 'Braford Bermúdez', 0, '01-01-0048', 'dennys.bardford@cssjb.edu.ni'),
('DGEG15-110710', 'Daisy Gabriela', 'Estrada Gutiérrez', 1, '01-01-0259', 'daisy.estrada@cssjb.edu.ni'),
('DGPG19-060214', 'Daphne Guadalupe', 'Palacios González', 1, '01-01-0118', 'daphne.palacios@cssjb.edu.ni'),
('DGTF14-040408', 'Diana Guadalupe', 'Tamariz Fariña', 1, '01-01-0496', 'diana.tamariz@cssjb.edu.ni'),
('DHDM14-140506', 'Dierick Hassani', 'Dávila Miranda', 0, '01-01-0505', 'dierick.davila@cssjb.edu.ni'),
('DIJS14-270209', 'Denzel Isaac', 'Jiménez Sequeira', 0, '01-01-0367', 'denzel.jimenez@cssjb.edu.ni'),
('DJAS14-020707', 'Dany José', 'Alfaro Solórzano', 0, '01-01-0421', 'dany.alfaro@cssjb.edu.ni'),
('DJCA21-040117', 'Diego José', 'Chamorro Arias', 0, '01-01-0006', 'diego.chamorro@cssjb.edu.ni'),
('DJCS21-042709', 'Derek Jacobyks', 'Canda Santamaria', 0, '01-01-0352', 'derek.santamaria@cssjb.edu.ni'),
('DJHO21-120515', 'Derek Joaquín', 'Hondoy Duarte', 0, '01-01-0052', 'derek.hondoy@cssjb.edu.ni'),
('DMGM14-060807', 'Danisha Michelle', 'González Mejía', 1, '01-01-0468', 'danisha.gonzalez@cssjb.edu.ni'),
('DRUD14-180809', 'Derek Robert', 'Umaña Dávila', 0, '01-01-0310', 'derek.umana@cssjb.edu.ni'),
('DSBC17-030607', 'Diannie Sofía', 'Bendaña Chamorro', 1, '01-01-0524', 'diannie.bendana@cssjb.edu.ni'),
('DSBC18-071013', 'Deysi Sdreysis', 'Bustillo Calero', 1, '01-01-0097', 'deysi.bustillo@cssjb.edu.ni'),
('DSBM14-240805', 'Davis Samael', 'Brenes Montiel', 0, '01-01-0501', 'davis.brenes@cssjb.edu.ni'),
('DSUM14-130705', 'Dorian Steven', 'Ubau Moreno', 0, '01-01-0634', 'dorian.ubau@cssjb.edu.ni'),
('DTVM14-020510', 'Derek Tadeo', 'Vélez Mejía', 0, '01-01-0313', 'derek.velez@cssjb.edu.ni'),
('DVRB16-180711', 'Diana Valentina', 'Rodríguez Bermudez', 1, '01-01-0221', 'diana.rodriguez@cssjb.edu.ni'),
('DZGR21-022315', 'Dereck Zaid', 'González Romero', 0, '01-01-0074', 'dereck.gonzalez@cssjb.edu.ni'),
('EAAN21-210316', 'Enrique Alexander', 'Arias Najlis', 0, '01-01-0008', 'enrique.arias@cssjb.edu.ni'),
('EABA14-020306', 'Emely Auxiliadora', 'Barrios Aguilar', 1, '01-01-0571', 'emely.barrios@cssjb.edu.ni'),
('EABR16-120412', 'Ean Alexis', 'Barrios Ruiz', 0, '01-01-0174', 'ean.barrios@cssjb.edu.ni'),
('EACA21-081106', 'Ernesto Alejandro', 'Castellón Alemán', 0, '01-01-0463', 'ernesto.castellon@cssjb.edu.ni'),
('EACL18-310813', 'Erick Adolfo', 'Cuarezma Labreau', 0, '01-01-0100', 'erick.cuarezma@cssjb.edu.ni'),
('EACR14-260608', 'Emerik Alejandro', 'Chamorro Rodríguez', 0, '01-01-0384', 'emerik.chamorro@cssjb.edu.ni'),
('EADC18-200813', 'Edgard Alejandro', 'Delgado Castrillo', 0, '01-01-0101', 'edgard.delgado@cssjb.edu.ni'),
('EAEC14-220907', 'Evertz Alexander', 'Estrada Chávez', 0, '01-01-0466', 'evertz.estrada@cssjb.edu.ni'),
('EAGC17-300812', 'Eithan Antonio', 'García Castillo', 0, '01-01-0131', 'eithan.garcia@cssjb.edu.ni'),
('EAGL15-151108', 'Emelyn Auxiliadora', 'García López', 1, '01-01-0388', 'emelyn.garcia@cssjb.edu.ni'),
('EAJR14-240309', 'Enuart Adolfo', 'Jiménez Rodríguez', 0, '01-01-0366', 'enuart.jimenez@cssjb.edu.ni'),
('EAMF14-010805', 'Erick Ariel', 'Molina Fariña', 0, '01-01-0579', 'erick.molina@cssjb.edu.ni'),
('EAMM14-010307', 'Elder Antonio', 'Martínez Meneses', 0, '01-01-0537', 'elder.martinez@cssjb.edu.ni'),
('EAPR15-020605', 'Elizabeth Alejandra', 'Pérez Rosales', 1, '01-01-0610', 'elizabeth.rosales@cssjb.edu.ni'),
('EARJ17-221212', 'Elizabeth Auxiliadora', 'Raudez Jiménez', 1, '01-01-0138', 'elizabeth.raudez@cssjb.edu.ni'),
('EASS21-122612', 'Enzo Alejandro', 'Sequeira Sandino', 0, '01-01-0168', 'enzo.sequeira@cssjb.edu.ni'),
('ECGG21-051209', 'Eduardo César', 'Guevara Gómez', 0, '01-01-0390', 'eduardo.guevara@cssjb.edu.ni'),
('ECOM15-170410', 'Eliab Caleb', 'Obando Miranda', 0, '01-01-0332', 'eliab.obando@cssjb.edu.ni'),
('EDAA15-091109', 'Erick Domingo', 'Arauz Arévalo', 0, '01-01-0281', 'erick.arauz@cssjb.edu.ni'),
('EEDH21-041115', 'Eliath Esaú', 'Domínguez Herrera', 0, '01-01-0030', 'eliath.dominguez@cssjb.edu.ni'),
('EEMF17-230312', 'Ethan Ezequiel', 'Mena Flores', 0, '01-01-0212', 'ethan.mena@cssjb.edu.ni'),
('EFCV17-300912', 'Elmo Fernando', 'Canizales Vega', 0, '01-01-0125', 'elmo.canizales@cssjb.edu.ni'),
('EFLB19-240712', 'Erick Francisco', 'López Burgalin', 0, '01-01-0159', 'erick.lopez@cssjb.edu.ni'),
('EGAH17-211111', 'Eduardo Gabriel', 'Alguera Huembes', 0, '01-01-0170', 'eduardo.alguera@cssjb.edu.ni'),
('EGCF16-190307', 'Erick Gabriel', 'Colomer Fonseca', 0, '01-01-0527', 'erick.colomer@cssjb.edu.ni'),
('EGCG16-130312', 'Edgard Gabriel', 'Cantón Gutiérrez', 0, '01-01-0179', 'edgard.canton@cssjb.edu.ni'),
('EGGC21-120916', 'Emer Gabriel', 'Gómez Castillo', 0, '01-01-0007', 'emer.gomez@cssjb.edu.ni'),
('EGPF14-020308', 'Elizabeth Guadalupe', 'Pérez Fletes', 1, '01-01-0487', 'elizabeth.perez@cssjb.edu.ni'),
('EIUJ16-200909', 'Elena Isabel', 'Urbina Jaime', 1, '01-01-0345', 'elena.urbina@cssjb.edu.ni'),
('EJML14-020909', 'Engel Joshua', 'Marenco Lacayo', 0, '01-01-0294', 'engel.marenco@cssjb.edu.ni'),
('EJMU16-151111', 'Eduardo José', 'Morales Ulloa', 0, '01-01-0214', 'eduardo.morales@cssjb.edu.ni'),
('EJOR21-130607', 'Eduardo José', 'Orozco Rosales', 0, '01-01-0446', 'eduardo.orozco@cssjb.edu.ni'),
('EJPR16-261209', 'Edgar de Jesús', 'Pérez Rosales', 0, '01-01-0337', 'edgard.perez@cssjb.edu.ni'),
('EJVD14-070904', 'Erick de Jesús', 'Velázquez Duarte', 0, '01-01-0545', 'erick.velasquez@cssjb.edu.ni'),
('ELAC16-270111', 'Eddy Lenin', 'Aburto Chamorro', 0, '01-01-0229', 'eddy.aburto@cssjb.edu.ni'),
('EMBB20-060807', 'Estrellita Massiel', 'Brenes Busto', 1, '01-01-0425', 'estrellita.brenes@cssjb.edu.ni'),
('EMDZ18-130214', 'Erick Marcell', 'Duarte Zamora', 0, '01-01-0103', 'erick.duarte@cssjb.edu.ni'),
('EMRC14-270707', 'Elvin Misael', 'Reyes Córdoba', 0, '01-01-0450', 'elvin.reyes@cssjb.edu.ni'),
('EMVL14-130106', 'Edgard Manuel', 'Vargas López', 0, '01-01-0591', 'edgard.vargas@cssjb.edu.ni'),
('ESBO21-180615', 'Emilio Sebastián', 'Bodán Hunter', 0, '01-01-0047', 'emilio.bodan@cssjb.edu.ni'),
('ESCR21-071714', 'Elí Sofía', 'Castillo Rodríguez', 1, '01-01-0068', 'eli.castillo@cssjb.edu.ni'),
('ESEG18-170114', 'Enmanuel Saruen', 'Espinoza Guevara', 0, '01-01-0104', 'enmanuel.espinoza@cssjb.edu.ni'),
('ESGA21-170715', 'Emely Sofía', 'Gallo Galeano', 1, '01-01-0050', 'emily.gallo@cssjb.edu.ni'),
('EXLC17-270611', 'Ernesto Xavier', 'López Castrillo', 0, '01-01-0205', 'ernesto.lopez@cssjb.edu.ni'),
('FAFA16-271211', 'Fernando Adrián', 'Flores Abauza', 0, '01-01-0183', 'fernando.flores@cssjb.edu.ni'),
('FAGS16-231010', 'Félix Ángel', 'González Sánchez', 0, '01-01-0262', 'felix.gonzalez@cssjb.edu.ni'),
('FALM20-221007', 'Francesca Abril', 'Logo Muñoz', 1, '01-01-0370', 'francesca.logo@cssjb.edu.ni'),
('FALS14-170705', 'Fabricio Adolfo', 'Lacayo Suarez', 0, '01-01-0577', 'fabricio.lacayo@cssjb.edu.ni'),
('FAMC19-290813', 'Fátima Auxiliadora', 'Marcia González', 1, '01-01-0109', 'fatima.marcia@cssjb.edu.ni'),
('FCME21-022114', 'Frida Camila', 'Muñoz Espinoza', 1, '01-01-0083', 'frida.munoz@cssjb.edu.ni'),
('FDCC15-240111', 'Félix David', 'Cornejo Cisne', 0, '01-01-0232', 'felix.cornejo@cssjb.edu.ni'),
('FDDM21-062707', 'Francesca Daniela', 'Downs Marcia', 1, '01-01-0386', 'daniela.downs@cssjb.edu.ni'),
('FGGG14-200706', 'Fernando Gabriel', 'Gómez Gazo', 0, '01-01-0509', 'fernando.gomez@cssjb.edu.ni'),
('FHGB20-110404', 'Fernando Humberto', 'Gutiérrez Barrantes', 0, '01-01-0604', 'fernando.gutierrez@cssjb.edu.ni'),
('FJGP19-010906', 'Francisco José', 'Guadamuz Pacheco', 0, '01-01-0532', 'francisco.guadamuz@cssjb.edu.ni'),
('FJIP14-160409', 'Fermín Josué', 'Iglesias Peralta', 0, '01-01-0393', 'fermin.iglesias@cssjb.edu.ni'),
('FJL21-030608', 'Francisco Javier', 'López', 0, '01-01-0395', 'francisco.lopez@cssjb.edu.ni'),
('FJLM18-030212', 'Frank José', 'Lumbi Márquez', 0, '01-01-0207', 'frank.lumbi@cssjb.edu.ni'),
('FJTG14-120207', 'Francisco José', 'Torres Guevara', 0, '01-01-0521', 'francisco.torres@cssjb.edu.ni'),
('FMDM18-080114', 'Félix Martin', 'Díaz Miranda', 0, '01-01-0102', 'felix.diaz@cssjb.edu.ni'),
('FSMG19-170314', 'Francisco Sebastián', 'Mondragón García', 0, '01-01-0117', 'francisco.mondragon@cssjb.edu.ni'),
('FSSG14-210510', 'Fernando Samuel', 'Salinas Gross', 0, '01-01-0344', 'fernando.salinas@cssjb.edu.ni'),
('FXGG15-300409', 'Fransheska', 'García Gallo', 1, '01-01-0361', 'fransheska.garcia@cssjb.edu.ni'),
('GABH16-170809', 'Génesis Andrea', 'Bodán Hunter', 1, '01-01-0283', 'genesis.bodan@cssjb.edu.ni'),
('GABJ20-120108', 'Gustavo Adolfo', 'Barberena Jarquín', 0, '01-01-0462', 'gustavo.barberena@cssjb.edu.ni'),
('GACJ21-032315', 'Gema Auxiliadora', 'Castillo Juárez', 1, '01-01-0067', 'gema.castillo@cssjb.edu.ni'),
('GACL15-240211', 'Gustavo Alberto', 'Cornejo Largaespada', 0, '01-01-0233', 'gustavo.cornejo@cssjb.edu.ni'),
('GAGL21-081314', 'Gabriel Antonio', 'Gómez Lanuza', 0, '01-01-0073', 'gabriel.gomez@cssjb.edu.ni'),
('GAMG14-230707', 'Gabriel Alejandro', 'Martínez Gutiérrez', 0, '01-01-0440', 'gabriel.martinez@cssjb.edu.ni'),
('GAMS19-180612', 'Gabriel Alejandro', 'Marenco Sequeira', 0, '01-01-0208', 'gabriel.sequeira@cssjb.edu.ni'),
('GEBG14-020308', 'Gabriel Emilio', 'Balmaceda Gaitán', 0, '01-01-0422', 'gabriel.balmaceda@cssjb.edu.ni'),
('GEPV14-070905', 'Gabriel Eduardo', 'Peralta Velásquez', 0, '01-01-0584', 'gabriel.peralta@cssjb.edu.ni'),
('GESS20-140605', 'Germán Enrique', 'Sevilla Solorzano', 0, '01-01-0632', 'german.sevilla@cssjb.edu.ni'),
('GEUS17-090413', 'Guillermo Enrique', 'Ulloa Solari', 0, '01-01-0145', 'guillermo.ulloa@cssjb.edu.ni'),
('GGAS18-040114', 'Geovanny Guadalupe', 'Alfaro Solórzano', 0, '01-01-0092', 'geovanny.alfaro@cssjb.edu.ni'),
('GGOR21-290417', 'Gianna Guadalupe', 'Obregón Rodríguez', 1, '01-01-0009', 'gianna.obregon@cssjb.edu.ni'),
('GJJO14-281009', 'Guadalupe de Jesús', 'Jaime Obando', 1, '01-01-0291', 'guadalupe.jaime@cssjb.edu.ni'),
('GMMM16-060610', 'Gabriela Melissa', 'Medina Mena', 1, '01-01-0243', 'gabriela.medina@cssjb.edu.ni'),
('GMMM21-091306', 'Gissha Margarita', 'Mendoza Moreira', 1, '01-01-0442', 'gissha.mendoza@cssjb.edu.ni'),
('GMVR14-280508', 'Graciela Maiza', 'Vela Rodríguez', 1, '01-01-0498', 'graciela.vela@cssjb.edu.ni'),
('GNCJ20-290507', 'Gilberto Nazareth', 'Castillo Juárez', 0, '01-01-0464', 'gilberto.juarez@cssjb.edu.ni'),
('GSCG21-240517', 'Gino Santiago', 'Carranza García', 0, '01-01-0010', 'gino.carranza@cssjb.edu.ni'),
('GTMC14-170209', 'Gabriel Tadeo', 'Márquez Cajina', 0, '01-01-0400', 'gabriel.marquez@cssjb.edu.ni'),
('GVGR17-180512', 'Gabriela Valentina', 'Gutiérrez Rivas', 1, '01-01-0188', 'gabriela.gutierrez@cssjb.edu.ni'),
('HAOO21-160916', 'Hebert Antonio', 'Oviedo Obando', 0, '01-01-0012', 'hebert.oviedo@cssjb.edu.ni'),
('HEPC16-091109', 'Hamilton Eduardo', 'Pérez Castro', 0, '01-01-0303', 'hamilton.perez@cssjb.edu.ni'),
('HFNB16-080411', 'Hanny Francela', 'Navarro Barboza', 1, '01-01-0247', 'hanny.navarro@cssjb.edu.ni'),
('HGNC14-170705', 'Hanna Gabriela', 'Noguera Castillo', 1, '01-01-0582', 'hanna.noguera@cssjb.edu.ni'),
('HIPH14-180506', 'Harenton Ismael', 'Paladino Hurtado', 0, '01-01-0564', 'harenton.paladino@cssjb.edu.ni'),
('HJRR14-250909', 'Humberto José', 'Ramírez Rivas', 0, '01-01-0304', 'humberto.ramirez@cssjb.edu.ni'),
('HNNM21-020711', 'Hendrick Nacir', 'Navarro Mayorga', 0, '01-01-0272', 'hendrick.navarro@cssjb.edu.ni'),
('HRRJ14-200504', 'Harry Rodolfo', 'Raudez Jiménez', 0, '01-01-0628', 'harry.raudez@cssjb.edu.ni'),
('HSCM21-120716', 'Harold Steven', 'Castro Munguia', 0, '01-01-0011', 'harold.castro@cssjb.edu.ni'),
('IALÓ21-250516', 'Isabela Auxiliadora', 'López Herrera', 1, '01-01-0053', 'isabella.lopez@cssjb.edu.ni'),
('IALS19-150114', 'Iker Antonio', 'López Sandoval', 0, '01-01-0108', 'iker.lopez@cssjb.edu.ni'),
('IAOM16-220508', 'Ismael Alejandro', 'Ortega Mayorga', 0, '01-01-0377', 'ismael.ortega@cssjb.edu.ni'),
('IARR17-250313', 'Itzel Ashleey', 'Ruiz Rizo', 1, '01-01-0166', 'itzel.ruiz@cssjb.edu.ni'),
('IEVR15-210311', 'Isaac Enmanuel', 'Vásquez Ruiz', 0, '01-01-0279', 'isaac.vasquez@cssjb.edu.ni'),
('IGMS21-032015', 'Ian Gabriel', 'Muñoz Sobalvarro', 0, '01-01-0084', 'ian.munoz@cssjb.edu.ni'),
('IGRL19-110414', 'Irlanda Guadalupe', 'Rocha Lanzas', 1, '01-01-0120', 'irlanda.rocha@cssjb.edu.ni'),
('IILC16-231211', 'Itaty Isabella', 'López Cruz', 1, '01-01-0191', 'itaty.lopez@cssjb.edu.ni'),
('IJGL14-031008', 'Iann Jeremy', 'García Lacayo', 0, '01-01-0387', 'iann.garcia@cssjb.edu.ni'),
('IJGO15-280210', 'Ian Javier', 'Guerrero Oviedo', 0, '01-01-0239', 'ian.guerrero@cssjb.edu.ni'),
('IJRO21-091215', 'Iker José', 'Rodríguez Díaz', 0, '01-01-0058', 'iker.rodriguez@cssjb.edu.ni'),
('ILJO14-090505', 'Isis Larissa', 'Jaime Obando', 1, '01-01-0605', 'isis.jaime@cssjb.edu.ni'),
('IRUD14-080105', 'Isayana Rachel', 'Umaña Dávila', 1, '01-01-0635', 'isayana.umana@cssjb.edu.ni'),
('IXSD19-100909', 'Isaí', 'Sevilla Delgado', 1, '01-01-0252', 'isai.sevilla@cssjb.edu.ni'),
('JAAG17-120704', 'José Alexander', 'Alejo Galeano', 0, '01-01-0617', 'jose.alejo@cssjb.edu.ni'),
('JACA21-091604', 'Jayson Antonio', 'Calero Acevedo', 0, '01-01-0572', 'jayson.calero@cssjb.edu.ni'),
('JACO14-020809', 'Jareth Antonio', 'Córdoba Ocón', 1, '01-01-0288', 'jareth.cordoba@cssjb.edu.ni'),
('JACT14-010210', 'Joan Alberto', 'Camacho Tenorio', 0, '01-01-0316', 'joan.camacho@cssjb.edu.ni'),
('JACT17-260711', 'Jahir Antonio', 'Canda Tamariz', 0, '01-01-0177', 'jahir.canda@cssjb.edu.ni'),
('JAEC14-110308', 'Joseph Alexandre', 'Espinoza Cabrera', 0, '01-01-0432', 'joseph.espinoza@cssjb.edu.ni'),
('JAGA14-211008', 'Jasiel Ainhoa', 'Granera Alvarado', 0, '01-01-0363', 'jasiel.granera@cssjb.edu.ni'),
('JAGD14-190408', 'Jade Andrea', 'Gómez Domínguez', 1, '01-01-0433', 'jade.gomez@cssjb.edu.ni'),
('JAGM14-231005', 'Jenob Amaru', 'Guerrero Marenco', 0, '01-01-0556', 'jenob.guerrero@cssjb.edu.ni'),
('JAGR14-191206', 'Jaasiel Areli', 'Guadamuz Rodríguez', 0, '01-01-0533', 'jaasiel.guadamuz@cssjb.edu.ni'),
('JALC14-090507', 'Jessica Auxiliadora', 'Latino Coulson', 1, '01-01-0439', 'jessica.latino@cssjb.edu.ni'),
('JALL19-010513', 'Joshua André', 'López Leal', 0, '01-01-0160', 'joshua.lopez@cssjb.edu.ni'),
('JAMC15-140610', 'Jade Auxiliadora', 'Mendoza Chacón', 1, '01-01-0245', 'jade.mendoza@cssjb.edu.ni'),
('JAPR21-081614', 'Johary Abigail', 'Pinell Ramírez', 1, '01-01-0087', 'johary.pinell@cssjb.edu.ni'),
('JAPT21-290716', 'Javiera Auxiliadora', 'Pérez Tenorio', 1, '01-01-0014', 'javiera.perez@cssjb.edu.ni'),
('JARG21-062609', 'Jared Amaru', 'Rojas Goussen', 0, '01-01-0415', 'jared.rojas@cssjb.edu.ni'),
('JARO21-021115', 'Jordan Alexandro', 'Rocha Zúniga', 0, '01-01-0057', 'jordan.rocha@cssjb.edu.ni'),
('JASA14-010705', 'Jairo Arturo', 'Sandoval Alemán', 0, '01-01-0590', 'jairo.sandoval@cssjb.edu.ni'),
('JASR16-140511', 'Josdan Arián', 'Sequeira Robleto', 0, '01-01-0225', 'josdan.sequeira@cssjb.edu.ni'),
('JATO14-300407', 'Josabet Abigail', 'Tenorio Ocón', 1, '01-01-0543', 'josabet.tenorio@cssjb.edu.ni'),
('JAUX16-120412', 'Joaquín Alejandro', 'Ubau', 0, '01-01-0227', 'joaquin.ubau@cssjb.edu.ni'),
('JBMM14-240709', 'Jovan Bidkart', 'Mora Marenco', 0, '01-01-0329', 'jovan.mora@cssjb.edu.ni'),
('JCCT14-191105', 'José Carlos', 'Cruz Tapia', 0, '01-01-0552', 'jose.cruz@cssjb.edu.ni'),
('JCGC20-180207', 'Jimena Cristiana', 'Gallo Colomer', 1, '01-01-0507', 'jimena.gallo@cssjb.edu.ni'),
('JCRL15-050210', 'Julio César', 'Robles López', 0, '01-01-0340', 'julio.robles@cssjb.edu.ni'),
('JCRU21-290615', 'Juan Carlos', 'Ruiz Rizo', 0, '01-01-0059', 'juan.ruiz@cssjb.edu.ni'),
('JCRV18-010605', 'Julio Cesar', 'Reyes Vela', 0, '01-01-0586', 'julio.reyes@cssjb.edu.ni'),
('JCVC17-310804', 'Jazira Carolina', 'Vílchez Castillo', 1, '01-01-0638', 'jazira.vilchez@cssjb.edu.ni'),
('JDAA18-200813', 'Joshua de la Cruz', 'Arauz Arévalo', 0, '01-01-0093', 'joshua.arauz@cssjb.edu.ni'),
('JDBN18-081113', 'José Daniel', 'Barahona Noguera', 0, '01-01-0095', 'jose.barahona@cssjb.edu.ni'),
('JDGI20-020608', 'José Dolores', 'Gutiérrez Ibrahim', 0, '01-01-0365', 'jose.gutierrez@cssjb.edu.ni'),
('JDGU15-160710', 'Julio David', 'Gutiérrez Urbina', 0, '01-01-0240', 'julio.gutierrez@cssjb.edu.ni'),
('JDMM18-160114', 'José David', 'Martínez Molina', 0, '01-01-0113', 'jose.martinez@cssjb.edu.ni'),
('JDPR17-260710', 'Josmary Denisse', 'Potosme Ruiz', 1, '01-01-0276', 'josmary.potosme@cssjb.edu.ni'),
('JDQA17-220513', 'Joshua Daniel', 'Quiroz Aguilar', 0, '01-01-0163', 'joshua.quiroz@cssjb.edu.ni'),
('JDRV18-060407', 'José David', 'Reyes Vela', 0, '01-01-0491', 'jose.reyes@cssjb.edu.ni'),
('JEGP21-070411', 'Josué Enrique', 'González Pérez', 0, '01-01-0157', 'josue.gonzalez@cssjb.edu.ni'),
('JEHE14-270407', 'Jescarly Estefanía', 'Hernández Espinoza', 1, '01-01-0535', 'jescarly.hernandez@cssjb.edu.ni'),
('JEMA21-080915', 'Joaquín Enrique', 'Marenco Dávila', 0, '01-01-0054', 'joaquin.marenco@cssjb.edu.ni'),
('JEMG18-100609', 'Jorge Elí Ernesto', 'Morales González', 0, '01-01-0407', 'jorge.morales@cssjb.edu.ni'),
('JENT16-150709', 'Joshua Enrique', 'Nicaragua Tenorio', 0, '01-01-0299', 'joshua.nicaragua@cssjb.edu.ni'),
('JEOS15-271109', 'Jorge Ezequiel', 'Obando Salablanca', 0, '01-01-0333', 'jorge.obando@cssjb.edu.ni'),
('JFDB21-061108', 'Juan Francisco', 'Dávila Blanco', 0, '01-01-0356', 'juan.davila@cssjb.edu.ni'),
('JFEA17-261007', 'Janiska Fernanda', 'Espinoza Arauz', 1, '01-01-0431', 'janiska.espinoza@cssjb.edu.ni'),
('JFFS15-240308', 'Jared Francisco', 'Flores Saravia', 0, '01-01-0359', 'jared.flores@cssjb.edu.ni'),
('JFSR15-270311', 'Jessica Francela Aux.', 'Saavedra Rivas', 1, '01-01-0197', 'jessica.saavedra@cssjb.edu.ni'),
('JGRQ14-060707', 'José Gabriel', 'Reynosa Quintana', 0, '01-01-0451', 'jose.reynosa@cssjb.edu.ni'),
('JGRS19-270411', 'Jeanitza Gabriela', 'Rojas Sequeira', 1, '01-01-0250', 'jeanitza.rojas@cssjb.edu.ni'),
('JGSR14-260608', 'José Gabriel', 'Saavedra Rivas', 0, '01-01-0416', 'jose.saavedra@cssjb.edu.ni'),
('JHGR16-170411', 'Jhony Henry', 'Garay Rocha', 0, '01-01-0238', 'jhony.garay@cssjb.edu.ni'),
('JICC14-180909', 'Jelenia Ivone', 'Catín Cornejo', 1, '01-01-0286', 'jelenia.catin@cssjb.edu.ni'),
('JICV16-250510', 'Jeremías Isaac', 'Centeno Velázquez', 0, '01-01-0231', 'jeremias.centeno@cssjb.edu.ni'),
('JIGP17-220512', 'Josely Isabella Auxiliadora', 'González Pacheco', 1, '01-01-0156', 'josely.gonzalez@cssjb.edu.ni'),
('JIML17-221104', 'Joshua Ismael', 'Morales López', 0, '01-01-0624', 'joshua.morales@cssjb.edu.ni'),
('JIMM18-110107', 'Jorge Ignacio', 'Meneses Morales', 0, '01-01-0512', 'jorge.meneses@cssjb.edu.ni'),
('JISC16-180211', 'Jacob Ignacio', 'Sequeira Chavarría', 0, '01-01-0278', 'jacob.sequeira@cssjb.edu.ni'),
('JISM21-290915', 'José Ignacio', 'Sandino Mayorga', 0, '01-01-0039', 'jose.sandino@cssjb.edu.ni'),
('JJCM14-120208', 'Justin Josué', 'Chavarría Morales', 0, '01-01-0427', 'justin.chavarria@cssjb.edu.ni'),
('JJMG15-011209', 'Johan Jair', 'Mairena Guadamuz', 0, '01-01-0293', 'johan.mairena@cssjb.edu.ni'),
('JJML17-100910', 'Joan Josué', 'Muñoz Lara', 0, '01-01-0271', 'joan.munoz@cssjb.edu.ni'),
('JJSG15-010208', 'Jekzer Javier', 'Silva Guadamuz', 0, '01-01-0454', 'jekzer.silva@cssjb.edu.ni'),
('JJVM21-062114', 'Josué Javier', 'Varela Mora', 0, '01-01-0091', 'josue.varela@cssjb.edu.ni'),
('JLMP14-240109', 'Jorge Luis', 'Medrano Poveda', 0, '01-01-0374', 'jorge.medrano@cssjb.edu.ni'),
('JMER15-081010', 'Jacob Mateo', 'Espinoza Ramírez', 0, '01-01-0236', 'jacob.espinoza@cssjb.edu.ni'),
('JMJR14-291005', 'Juan Miguel', 'Jarquín Rivas', 0, '01-01-0576', 'juan.jarquin@cssjb.edu.ni'),
('JMMC15-010109', 'Joshua Manuel', 'Morales Chavarría', 0, '01-01-0406', 'joshua.chavarria@cssjb.edu.ni'),
('JMMG21-200117', 'Johao Mateo', 'Mairena Guadamuz', 0, '01-01-0015', 'johao.mairena@cssjb.edu.ni'),
('JMOU14-121209', 'Joseph Martin', 'Ocampo Urbina', 0, '01-01-0300', 'joseph.ocampo@cssjb.edu.ni'),
('JMRN14-270504', 'Jessica María', 'Ramírez Noguera', 1, '01-01-0612', 'jessica.ramirez@cssjb.edu.ni'),
('JODG21-271116', 'José Omar', 'Domínguez Gómez', 0, '01-01-0016', 'jose.dominguez@cssjb.edu.ni'),
('JPAG14-210708', 'Jair Peniel', 'Abea Guadamuz', 0, '01-01-0458', 'jair.abea@cssjb.edu.ni'),
('JSAL14-140608', 'Justin Stuart', 'Aguilera López', 0, '01-01-0460', 'justin.aguilera@cssjb.edu.ni'),
('JSFM21-071014', 'Jacob Sebastián', 'Fuertes Madrigal', 0, '01-01-0072', 'jacob.fuertes@cssjb.edu.ni'),
('JSGM15-101210', 'Jafet Said', 'Guerrero Marenco', 0, '01-01-0263', 'jafet.guerrero@cssjb.edu.ni'),
('JSMP14-101208', 'Javiera Saraí', 'Montiel Pérez', 1, '01-01-0405', 'javiera.montiel@cssjb.edu.ni'),
('JSSM17-010812', 'Job Salvador', 'Sevilla Moreira', 0, '01-01-0143', 'job.sevilla@cssjb.edu.ni'),
('JTLC14-101204', 'Javier Tadeo', 'Lanzas Chamorro', 0, '01-01-0606', 'javier.lanzas@cssjb.edu.ni'),
('JTLV15-140410', 'Julio Tadeo', 'López Vega', 0, '01-01-0265', 'julio.lopez@cssjb.edu.ni'),
('JTOR14-231009', 'Jeremy Tadeo', 'Osorno Ramírez', 0, '01-01-0335', 'jeremy.osorno@cssjb.edu.ni'),
('JTTF18-200414', 'Joshua Tadeo', 'Tamariz Fariña', 0, '01-01-0122', 'joshua.tamariz@cssjb.edu.ni'),
('JXSL14-040206', 'Janie Xiadany', 'Sánchez Luna', 1, '01-01-0589', 'janie.sanchez@cssjb.edu.ni'),
('KABA18-050912', 'Keyleth  Antonio', 'Bonilla Argeñal', 0, '01-01-0151', 'keyleth.bonilla@cssjb.edu.ni'),
('KÁCC21-080416', 'Kyara de los Ángeles', 'Cornejo Cisne', 1, '01-01-0029', 'kyara.cornejo@cssjb.edu.ni'),
('KACT16-151011', 'Kevin Alexander', 'Canizalez Tenorio', 0, '01-01-0178', 'kevin.canizalez@cssjb.edu.ni'),
('KAF21-', 'Kelchie Ariadna', 'Flores', 1, '01-01-0530', 'kelchic.flores@cssjb.edu.ni'),
('KAFL18-250112', 'Kolvin Anthony', 'Flores Lacayo', 0, '01-01-0184', 'kolvin.flores@cssjb.edu.ni'),
('KAGH21-080515', 'Kevin Alejandro', 'Gutiérrez Hurtado', 0, '01-01-0076', 'kevin.gutierrez@cssjb.edu.ni'),
('KAPH20-100511', 'Kenneth Antonio', 'Paladino Hurtado', 0, '01-01-0275', 'kenneth.paladino@cssjb.edu.ni'),
('KBSA14-300405', 'Kimberly Belén', 'Silva Abea', 1, '01-01-0633', 'kimberly.silva@cssjb.edu.ni'),
('KCLE18-201209', 'Kataleya Cristina', 'Lezama Espinoza', 1, '01-01-0369', 'kataleya.lezama@cssjb.edu.ni'),
('KDRR18-060912', 'Keren Daniela', 'Reyes Rojas', 1, '01-01-0164', 'keren.reyes@cssjb.edu.ni'),
('KEJA20-100407', 'Khristina Eloísa', 'Jaén Alfaro', 1, '01-01-0470', 'khristina.jaen@cssjb.edu.ni'),
('KFGA18-141213', 'Karol Francesco', 'Gaitán Alguera', 0, '01-01-0105', 'karol.gaitan@cssjb.edu.ni'),
('KFRV17-020812', 'Kendry Francisco', 'Reyes Vela', 0, '01-01-0139', 'kendry.reyes@cssjb.edu.ni'),
('KGMQ14-200808', 'Kasey Gabriela', 'Marín Quino', 1, '01-01-0371', 'kasey.marin@cssjb.edu.ni'),
('KGMS15-190809', 'Kevin Gabriel', 'Morales Sotelo', 0, '01-01-0331', 'kevin.morales@cssjb.edu.ni'),
('KLGH20-301007', 'Kendy Liseth', 'González Hernández', 1, '01-01-0435', 'kendy.gonzales@cssjb.edu.ni'),
('KNLD21-180206', 'Kiara Niskana', 'Linares Duarte', 1, '01-01-0476', 'kiara.linares@cssjb.edu.ni'),
('KSCH16-190111', 'Keendrick Sebastián', 'Corea Hernández', 0, '01-01-0257', 'keendrick.corea@cssjb.edu.ni'),
('KSGO21-211015', 'Keysi Shandara', 'González Sánchez', 1, '01-01-0051', 'keysi.gonzalez@cssjb.edu.ni'),
('KSHO15-171109', 'Kelly Stefany', 'Hurtado Ortega', 1, '01-01-0327', 'kelly.hurtado@cssjb.edu.ni'),
('KSVM14-200808', 'Keneth Said', 'Vásquez Mora', 0, '01-01-0497', 'keneth.vasquez@cssjb.edu.ni'),
('KTMV21-070214', 'Kanji Tairy', 'Mayorga Vega', 1, '01-01-0080', 'kanji.mayorga@cssjb.edu.ni'),
('KXMG20-210813', 'Kassandra', 'Martínez Gallo', 1, '01-01-0110', 'kassandra.martinez@cssjb.edu.ni'),
('LABV21-061708', 'Leydi Alexa', 'Bendaña Villalobos', 1, '01-01-0350', 'leydi.bendana@cssjb.edu.ni'),
('LACO16-210212', 'Lucían Alessandro', 'Chávez Obando', 0, '01-01-0201', 'lucian.chavez@cssjb.edu.ni'),
('LAMC21-110216', 'Leonel Augusto', 'Malespín Castillo', 0, '01-01-0033', 'leonel.malespin@cssjb.edu.ni'),
('LART20-301106', 'Lester Antonio', 'Rodríguez Tenorio', 0, '01-01-0519', 'lester.rodriguez@cssjb.edu.ni'),
('LBM21-022713', 'Luisamalia', 'Bolaños Mendez', 1, '01-01-0150', 'luisamalia.bolanos@cssjb.edu.ni'),
('LCBH18-281013', 'Luis Carlos', 'Box Hernández', 0, '01-01-0096', 'luis.box@cssjb.edu.ni'),
('LCVC17-080805', 'Luis Carlos', 'Valerio Cervantes', 0, '01-01-0636', 'luis.valerio@cssjb.edu.ni'),
('LDIG14-251005', 'Luisana del Socorro', 'Iglesias Gutiérrez', 1, '01-01-0560', 'luisana.iglesias@cssjb.edu.ni'),
('LECM21-151116', 'Luciana Esther', 'Campos Marcenaro', 1, '01-01-0017', 'luciana.campos@cssjb.edu.ni'),
('LEDU15-130904', 'Luis Ernesto', 'Duarte Urtecho', 0, '01-01-0598', 'luis.duarte@cssjb.edu.ni'),
('LEJV14-260906', 'Luis Enrique', 'Jiménez Vargas', 0, '01-01-0511', 'luis.jimenez@cssjb.edu.ni'),
('LEVC14-020904', 'Luis Enrique', 'Velásquez Castro', 0, '01-01-0637', 'luis.velasquez@cssjb.edu.ni'),
('LGCB21-041115', 'Lía Galilea', 'Castillo Baltodano', 1, '01-01-0066', 'lia.castillo@cssjb.edu.ni'),
('LGCG16-150811', 'Luciana Guadalupe', 'Chabrol García', 1, '01-01-0181', 'luciana.chabrol@cssjb.edu.ni'),
('LGMG16-230911', 'Lastenia Guadalupe', 'Martínez Gutiérrez', 1, '01-01-0209', 'lastenia.martinez@cssjb.edu.ni'),
('LIGA21-130516', 'Lucía Isabel', 'Gómez Aráuz', 1, '01-01-0018', 'lucia.gomez@cssjb.edu.ni'),
('LJPD17-221107', 'Luis Javier', 'Pasos de la Rocha', 0, '01-01-0541', 'luis.pasos@cssjb.edu.ni'),
('LMLC17-270611', 'Luis Manuel', 'López Castrillo', 0, '01-01-0397', 'luis.lopez@cssjb.edu.ni'),
('LMSH17-080313', 'Leslie Mariam', 'Sánchez Hernández', 1, '01-01-0142', 'leslie.sanchez@cssjb.edu.ni'),
('LR192720', 'Franklin Alejandro', 'López Ramírez', 0, '1998-08-18', 'fral_98@outlook.com'),
('LRHM17-110408', 'León Ricardo', 'Hernández Moreira', 0, '01-01-0325', 'leon.hernandez@cssjb.edu.ni'),
('LSC21-032615', 'Laureana', 'Saballos Chavarría', 1, '01-01-0088', 'laureana.saballos@cssjb.edu.ni'),
('LSGS16-151011', 'Lyan Samir', 'García Santana', 0, '01-01-0186', 'lyan.garcia@cssjb.edu.ni'),
('LSMG14-170206', 'Leonardo Sebastián', 'Mondragón García', 0, '01-01-0580', 'leonardo.mondragon@cssjb.edu.ni'),
('LSSS21-280216', 'Liam Steven', 'Sequeira Sandino', 0, '01-01-0040', 'liam.sequeira@cssjb.edu.ni'),
('LXCD14-210405', 'Lya Ximena', 'Cuadra Díaz', 1, '01-01-0597', 'lya.cuadra@cssjb.edu.ni'),
('LXGX15-170109', 'Leslyann', 'García', 1, '01-01-0360', 'leslyann.garcia@cssjb.edu.ni'),
('MABG14-150609', 'Maritza de los Ángeles', 'Bermúdez Gómez', 1, '01-01-0314', 'maritza.bermudez@cssjb.edu.ni'),
('MACF17-260112', 'María Auxiliadora', 'Castro Figueroa', 1, '01-01-0200', 'maria.castro@cssjb.edu.ni'),
('MACL14-100805', 'Marlon Abisai', 'Canales López', 0, '01-01-0547', 'marlon.canales@cssjb.edu.ni'),
('MACM21-070217', 'Maryin Alejandra', 'Claro Munguia', 1, '01-01-0020', 'maryin.claro@cssjb.edu.ni'),
('MACO21-210216', 'Matthew Alejandro', 'Chamorro Ortiz', 0, '01-01-0028', 'matthew.chamorro@cssjb.edu.ni'),
('MAEA21-020311', 'Mathews Alexander', 'Estrada Alemán', 0, '01-01-0182', 'mathews.estrada@cssjb.edu.ni'),
('MAFG17-131103', 'María Auxiliadora', 'Fonseca Gutiérrez', 1, '01-01-0620', 'maria.fonseca@cssjb.edu.ni'),
('MAGC18-040812', 'Miguel Ángel', 'Gómez Castillo', 0, '01-01-0155', 'miguel.gomez@cssjb.edu.ni'),
('MAGP21-150217', 'María Auxiliadora', 'Guerrero Peña', 1, '01-01-0021', 'maria.guerrero@cssjb.edu.ni'),
('MAJR17-070113', 'María Auxiliadora', 'Jarquín Rivas', 1, '01-01-0135', 'maria.jarquin@cssjb.edu.ni'),
('MALM20-270806', 'Marissa Auxiliadora Paublina', 'Logo Muñoz', 1, '01-01-0477', 'marissa.logo@cssjb.edu.ni'),
('MAMB16-161111', 'María Alejandra', 'Mercado Bustos', 1, '01-01-0213', 'maria.bustos@cssjb.edu.ni'),
('MAMC20-191107', 'Michelle Alexandra', 'Mora Cruz', 1, '01-01-0483', 'michelle.mora@cssjb.edu.ni'),
('MAMC20-542010', 'Manuel Antonio', 'Mora Cruz', 0, '01-01-0246', 'manuel.mora@cssjb.edu.ni'),
('MAMM14-070808', 'Manuel Antonio', 'Medina Mena', 0, '01-01-0402', 'manuel.medina@cssjb.edu.ni'),
('MAMT15-291110', 'Marvin Antonio', 'Mayorga Toruño', 0, '01-01-0266', 'marvin.mayorga@cssjb.edu.ni'),
('MAMV14-230408', 'Melody Ariel', 'Miranda Varela', 1, '01-01-0404', 'melody.miranda@cssjb.edu.ni'),
('MAOC15-270810', 'Milagro Auxiliadora', 'Obando Collado', 1, '01-01-0273', 'milagro.obando@cssjb.edu.ni'),
('MAOM15-130607', 'Mario Alonzo', 'Oviedo Montiel', 0, '01-01-0448', 'mario.oviedo@cssjb.edu.ni'),
('MAPO19-020114', 'Miguel Ángel', 'Pasquier Ocón', 0, '01-01-0119', 'miguel.pasquier@cssjb.edu.ni'),
('MAQH16-030311', 'María Alejandra', 'Quiroz Hernández', 1, '01-01-0249', 'alejandra.quiroz@cssjb.edu.ni'),
('MARA14-040909', 'María Auxiliadora', 'Ruiz Acuña', 1, '01-01-0305', 'maria.ruiz@cssjb.edu.ni'),
('MARA16-150811', 'Marco Aurelio', 'Ruiz Arias', 0, '01-01-0196', 'marco.ruiz@cssjb.edu.ni'),
('MARM14-091008', 'María Auxiliadora', 'Robleto McRea', 1, '01-01-0341', 'maria.robleto@cssjb.edu.ni'),
('MARR16-090711', 'Massiell Alejandra', 'Robleto Rocha', 1, '01-01-0219', 'massiell.robleto@cssjb.edu.ni'),
('MARR17-140213', 'Mario Antonio', 'Robleto Rocha', 0, '01-01-0140', 'mario.robleto@cssjb.edu.ni'),
('MASG19-180912', 'Miguel Ángel', 'Somoza Guadamuz', 0, '01-01-0144', 'miguel.somoza@cssjb.edu.ni'),
('MASH14-260308', 'Marcela Aux.', 'Sánchez Hernández', 1, '01-01-0495', 'marcela.sanchez@cssjb.edu.ni'),
('MASM16-050711', 'Miguel Ángel', 'Sánchez Mejía', 0, '01-01-0223', 'miguel.sanchez@cssjb.edu.ni'),
('MAVP14-260109', 'Marcelo Armando', 'Valle Pérez', 0, '01-01-0379', 'marcelo.valle@cssjb.edu.ni'),
('MCAX21-280815', 'Miriam Camila', 'Alguera', 1, '01-01-0044', 'miriam.alguera@cssjb.edu.ni'),
('MCCC14-191205', 'Mario Cesar', 'Castillo Cajina', 0, '01-01-0548', 'mario.castillo@cssjb.edu.ni'),
('MCDR15-030410', 'María Cristiana de los Ángeles', 'Domínguez Ramírez', 1, '01-01-0319', 'maria.dominguez@cssjb.edu.ni'),
('MCMC14-090410', 'Michelle Carolina María', 'Martínez Caldera', 1, '01-01-0295', 'michelle.martinez@cssjb.edu.ni'),
('MDCC14-030708', 'María Denisse', 'Castillo Cajina', 1, '01-01-0353', 'maria.cajina@cssjb.edu.ni'),
('MDPM14-090506', 'Mily Dayan', 'Piga Muñoz', 1, '01-01-0585', 'mily.piga@cssjb.edu.ni'),
('MDRM14-300110', 'Doménico Salvatore', 'Rojas Mercado Moisés', 0, '01-01-0342', 'moises.rojas@cssjb.edu.ni'),
('MEFG14-250506', 'Maynor Everto', 'Fernández Gutiérrez', 0, '01-01-0529', 'maynor.fernandez@cssjb.edu.ni'),
('MEFN15-210111', 'Mariana Elisa', 'Figueroa Navas', 1, '01-01-0237', 'mariana.figueroa@cssjb.edu.ni'),
('MEQH15-170409', 'María Esther', 'Quiroz Hernández', 1, '01-01-0412', 'maria.quiroz@cssjb.edu.ni'),
('MERD14-191006', 'Marlon Ernesto', 'Ramírez Díaz', 0, '01-01-0517', 'marlon.ramirez@cssjb.edu.ni'),
('MESZ17-060413', 'Manuel Ezequiel', 'Sáenz Zárate', 0, '01-01-0167', 'manuel.saenz@cssjb.edu.ni'),
('MFCG16-250811', 'María Fernanda de Jesús', 'Colomer García', 1, '01-01-0202', 'maria.colomer@cssjb.edu.ni'),
('MFNC14-160208', 'María Fernanda', 'Noguera Castillo', 1, '01-01-0444', 'maria.noguera@cssjb.edu.ni'),
('MFRC14-310310', 'María Fernanda', 'Reyes Cantón', 1, '01-01-0413', 'maria.reyes@cssjb.edu.ni'),
('MGAR18-130612', 'Marelyn Guadalupe', 'Álvarez Rocha', 1, '01-01-0147', 'marelyn.alvarez@cssjb.edu.ni'),
('MGGL19-270112', 'María Guadalupe', 'García Lacayo', 1, '01-01-0185', 'maria.garcia@cssjb.edu.ni'),
('MGLM21-103114', 'María Gabriela', 'López Morales', 1, '01-01-0078', 'maria.lopez@cssjb.edu.ni'),
('MGMR20-041013', 'María Guadalupe', 'Mercado Romero', 1, '01-01-0116', 'maria.mercado@cssjb.edu.ni'),
('MGOV16-221011', 'Michell Guadalupe', 'Obregón Vélez', 1, '01-01-0217', 'michell.obregon@cssjb.edu.ni'),
('MGQU21-271115', 'Marcelo Gabriel', 'Quino Cruz', 0, '01-01-0056', 'marcelo.quino@cssjb.edu.ni'),
('MGRC20-241207', 'María Gabriela', 'Ramos Carballo', 1, '01-01-0489', 'maria.ramos@cssjb.edu.ni');
INSERT INTO `alumnos` (`Carnet`, `Nombre`, `Apellido`, `Genero`, `FechaNac`, `Email`) VALUES
('MIGA14-130705', 'María Ignacia', 'Gómez Arias', 1, '01-01-0602', 'maria.gomez@cssjb.edu.ni'),
('MIHO17-161112', 'Marisol Isabel', 'Hernández Obando', 1, '01-01-0133', 'marisol.hernandez@cssjb.edu.ni'),
('MISH15-190310', 'Martha Isabel', 'Sánchez Hernández', 1, '01-01-0309', 'martha.sanchez@cssjb.edu.ni'),
('MJFM19-080906', 'María José', 'Flores Morales', 1, '01-01-0531', 'maria.morales@cssjb.edu.ni'),
('MJLH19-211011', 'Marlon Jesús', 'Logo Hernández', 0, '01-01-0190', 'marlon.logo@cssjb.edu.ni'),
('MJUO16-120609', 'María Jimena', 'Urbina Orue', 1, '01-01-0311', 'maria.urbina@cssjb.edu.ni'),
('MKMG18-221013', 'Miguel Antonio Kefrén', 'Martínez Gutiérrez', 0, '01-01-0111', 'miguel.martinez@cssjb.edu.ni'),
('MMBM21-111214', 'María Marcela', 'Bermúdez Montiel', 1, '01-01-0062', 'maria.bermudez@cssjb.edu.ni'),
('MMMC14-080307', 'Mayerling María', 'Morales Chavarría', 1, '01-01-0513', 'mayerling.morales@cssjb.edu.ni'),
('MMNG21-050814', 'Myriam Michelle', 'Najlis Garay', 1, '01-01-0086', 'myriam.najlis@cssjb.edu.ni'),
('MMNV16-200511', 'Marcela Monserrat', 'Narváez Vallejos', 1, '01-01-0215', 'marcela.narvaez@cssjb.edu.ni'),
('MMTM19-090507', 'Melissa Marcela', 'Tenorio Morales', 1, '01-01-0542', 'melissa.tenorio@cssjb.edu.ni'),
('MMUO16-230911', 'Mery Michell', 'Urroz Obando', 1, '01-01-0228', 'mery.urroz@cssjb.edu.ni'),
('MNJB14-140807', 'Madeline Natalia', 'Jiménez Bravo', 1, '01-01-0473', 'madeline.jimenez@cssjb.edu.ni'),
('MNMP14-010707', 'María Nicole', 'Martínez Porta', 1, '01-01-0441', 'maria.martinez@cssjb.edu.ni'),
('MOT21-020220', 'Marcelo Gabriel', 'Ortega Talavera', 0, '01-01-0515', 'marcelo.ortega@cssjb.edu.ni'),
('MRBG21-121216', 'Mario René', 'Blandino García', 0, '01-01-0019', 'mario.blandino@cssjb.edu.ni'),
('MRMM15-261108', 'Mario Rafael', 'Martínez  Meneses', 0, '01-01-0401', 'mario.martinez@cssjb.edu.ni'),
('MRTC21-281216', 'Mateo Rafael', 'Tapia Castellón', 0, '01-01-0022', 'mateo.tapia@cssjb.edu.ni'),
('MSGM14-160607', 'Maykel Steven', 'González Montoya', 0, '01-01-0510', 'maykel.gonzalez@cssjb.edu.ni'),
('MSMM17-170412', 'Maryury Stefanny', 'Martínez Martínez', 1, '01-01-0210', 'maryury.martinez@cssjb.edu.ni'),
('MSRT17-150313', 'Mia Selene Xinaltayana', 'Robleto Tellería', 1, '01-01-0141', 'mia.robleto@cssjb.edu.ni'),
('MVJO21-092905', 'María Victoria', 'Jaime Ortega', 1, '01-01-0471', 'maria.jaime@cssjb.edu.ni'),
('MVMD15-281010', 'María Victoria', 'Mercado Duarte', 1, '01-01-0267', 'maria.duarte@cssjb.edu.ni'),
('MYGR16-091208', 'Marcela Yorleny', 'García Robleto', 1, '01-01-0321', 'marcela.garcia@cssjb.edu.ni'),
('NAHB14-050707', 'Nerissa de los Ángeles', 'Hernández Bermúdez', 1, '01-01-0437', 'nerissa.hernandez@cssjb.edu.ni'),
('NAMM17-240511', 'Nathaly Auxiliadora', 'Mena', 1, '01-01-0244', 'nathaly.mena@cssjb.edu.ni'),
('NAMM21-150615', 'Nait Antonio', 'Mena Mejía', 0, '01-01-0034', 'nait.mena@cssjb.edu.ni'),
('NBLM14-170405', 'Nitza Belén', 'López Martínez', 1, '01-01-0623', 'nitza.lopez@cssjb.edu.ni'),
('NCMC14-270408', 'Nadyeska Carolina', 'Mendoza Cabezas', 1, '01-01-0480', 'nadyeska.mendoza@cssjb.edu.ni'),
('NDCP14-030904', 'Nathalie Dayanara', 'Cano Parodi', 1, '01-01-0595', 'nathalie.cano@cssjb.edu.ni'),
('NGAG19-270906', 'Neri Gabriela', 'Alejo Galeano', 1, '01-01-0499', 'neri.alejo@cssjb.edu.ni'),
('NGSJ21-190216', 'Nazareth Guadalupe', 'Salazar Juárez', 1, '01-01-0038', 'nazareth.salazar@cssjb.edu.ni'),
('NJCB21-092214', 'Natanael de Jesús', 'Carrero Bonilla', 0, '01-01-0065', 'natanael.carrero@cssjb.edu.ni'),
('NLGG14-271106', 'Natalie Lisbeth', 'García García', 1, '01-01-0508', 'natalie.garcia@cssjb.edu.ni'),
('NLMC14-301207', 'Nayeli Lissbeth', 'Miranda Chacón', 1, '01-01-0443', 'nayeli.miranda@cssjb.edu.ni'),
('NLMC16-301207', 'Norelys Lisseth', 'Miranda Chacón', 1, '01-01-0482', 'norelys.miranda@cssjb.edu.ni'),
('NMAC21-031206', 'Nazareth María', 'Alemán Casco', 1, '01-01-0570', 'nazareth.aleman@cssjb.edu.ni'),
('NNGG14-131205', 'Natalia Ninoska', 'Gutiérrez Gutiérrez', 1, '01-01-0558', 'natalia.gutierrez@cssjb.edu.ni'),
('NPSD17-100806', 'Nelson Planski', 'Sevilla Delgado', 0, '01-01-0520', 'nelson.sevilla@cssjb.edu.ni'),
('NSDD14-111207', 'Nick Steven', 'Delgadillo Duarte', 0, '01-01-0528', 'nick.delgadillo@cssjb.edu.ni'),
('NSLF14-160306', 'Nicolle Steffany', 'Lumbi Flores', 1, '01-01-0561', 'nicolle.lumbi@cssjb.edu.ni'),
('NSML18-260214', 'Nahima Saraí', 'Martínez López', 1, '01-01-0112', 'nahima.martinez@cssjb.edu.ni'),
('NVBA14-061004', 'Nohemí Victoria', 'Bonilla Argeñal', 1, '01-01-0594', 'nohemi.bonilla@cssjb.edu.ni'),
('OFLA15-061108', 'Oswald Francell', 'Lacayo Avalos', 0, '01-01-0394', 'oswald.lacayo@cssjb.edu.ni'),
('OJEG15-141210', 'Osmar Jared', 'Espinoza Guevara', 0, '01-01-0235', 'osmar.espinoza@cssjb.edu.ni'),
('OJHC14-040110', 'Osvaldo Josué', 'Hernández Canizalez', 0, '01-01-0324', 'osvaldo.hernandez@cssjb.edu.ni'),
('OJMA21-072408', 'Octavio José', 'Marcia Arana', 0, '01-01-0399', 'octavio.marcia@cssjb.edu.ni'),
('OJOM14-070306', 'Owen José', 'Ortega Mora', 0, '01-01-0583', 'owen.ortega@cssjb.edu.ni'),
('OMOS17-010912', 'Olga Mercedes', 'Osorno Sunsin', 1, '01-01-0137', 'olga.osorno@cssjb.edu.ni'),
('ORV21-040414', 'Owen Dariel', 'Ross  Vargas', 0, '01-01-0121', 'owen.ross@cssjb.edu.ni'),
('OYHR19-230913', 'Osher Yilberto', 'Herrera Rivera', 0, '01-01-0107', 'osher.herrera@cssjb.edu.ni'),
('PAAR14-030308', 'Paola Alexandra', 'Arias Reyes', 1, '01-01-0461', 'paola.arias@cssjb.edu.ni'),
('PEMC14-250309', 'Pedro Emanuel', 'Martínez Corea', 0, '01-01-0372', 'pedro.martinez@cssjb.edu.ni'),
('PJFR16-030708', 'Pedro Joaquín', 'Fernández Reyes', 0, '01-01-0357', 'pedro.fernandez@cssjb.edu.ni'),
('RABL15-070805', 'Rachell Angélica', 'Balmaceda López', 1, '01-01-0546', 'rachell.balmaceda@cssjb.edu.ni'),
('RAFA11-021014', 'Razhiel Alejandro', 'Fariñas Avellán', 0, '01-01-0049', 'razhiel.farinas@cssjb.edu.ni'),
('RAGD14-231006', 'Roger Abraham', 'Gutiérrez Díaz', 0, '01-01-0534', 'roger.gutierrez@cssjb.edu.ni'),
('RAHT14-171005', 'Rudy Antonio', 'Huete Tejada', 0, '01-01-0575', 'rudy.huete@cssjb.edu.ni'),
('RALL14-041007', 'Rosalinda Alejandra', 'Lacayo Lacayo', 1, '01-01-0474', 'rosalinda.lacayo@cssjb.edu.ni'),
('RAMC20-552010', 'Raúl Antonio', 'Monterrey Cruz', 0, '01-01-0269', 'raul.monterrey@cssjb.edu.ni'),
('RAMC21-040114', 'Roberto Angel', 'Molina Correa', 0, '01-01-0082', 'roberto.molina@cssjb.edu.ni'),
('RAMR14-010310', 'Rodrigo Antonio', 'Mena Ruiz', 0, '01-01-0297', 'rodrigo.mena@cssjb.edu.ni'),
('RAPZ14-140704', 'Rubén Alberto', 'Pattatuchi Zeledón', 0, '01-01-0626', 'ruben.pattatuchi@cssjb.edu.ni'),
('RFBC16-070310', 'Rene Fernando', 'Bejarano Colomer', 0, '01-01-0282', 'rene.bejarano@cssjb.edu.ni'),
('RFCA14-051006', 'Rayhan Francisco Yaman', 'Cuadra Abdalah', 0, '01-01-0504', 'rayhan.cuadra@cssjb.edu.ni'),
('RIHU17-260213', 'Rubén Isaac', 'Hernández Urbina', 0, '01-01-0134', 'ruben.hernandez@cssjb.edu.ni'),
('RJQP14-290307', 'Ronald Julián', 'Quino Pérez', 0, '01-01-0516', 'ronald.quino@cssjb.edu.ni'),
('RMAU17-220512', 'Rosa Margarita', 'Alvarado Ugarte', 1, '01-01-0172', 'rosa.alvarado@cssjb.edu.ni'),
('RMSP20-260805', 'Rosse Mary', 'Saballos Pérez', 1, '01-01-0588', 'rosse.saballos@cssjb.edu.ni'),
('RRIG16-300312', 'Rocío Rafael', 'Iglesias Gutiérrez', 1, '01-01-0189', 'rocio.iglesias@cssjb.edu.ni'),
('RRMT21-011008', 'Ricardo Roberto', 'Medrano Torres', 0, '01-01-0403', 'ricardo.medrano@cssjb.edu.ni'),
('RSCA14-251007', 'Rasha Stephany G.', 'Cuadra Abdalah', 1, '01-01-0430', 'rasha.cuadra@cssjb.edu.ni'),
('RSLM21-012808', 'Ruth Samantha', 'López Mora', 1, '01-01-0398', 'ruth.lopez@cssjb.edu.ni'),
('RSPC21-150816', 'Rhina Sofía', 'Pacheco Cáceres', 1, '01-01-0023', 'rhina.pacheco@cssjb.edu.ni'),
('RVGR14-020709', 'Regina Valeria', 'Gutiérrez de la Rocha', 1, '01-01-0322', 'regina.gutierrez@cssjb.edu.ni'),
('RYME14-080305', 'Randall Yosvanny', 'Miranda Espinoza', 0, '01-01-0608', 'randall.miranda@cssjb.edu.ni'),
('SAAB21-190515', 'Sofía Auxiliadora', 'Aburto Bermúdez', 1, '01-01-0043', 'sofia.aburto@cssjb.edu.ni'),
('SAAH17-211111', 'Sebastián Andrés', 'Alguera Huembes', 0, '01-01-0171', 'sebastian.alguera@cssjb.edu.ni'),
('SACC15-250508', 'Solansh Andrea', 'Chevez Calero', 1, '01-01-0354', 'solansh.chevez@cssjb.edu.ni'),
('SAGL15-141007', 'Sirel Anette', 'Guevara Leyba', 1, '01-01-0436', 'sirel.guevara@cssjb.edu.ni'),
('SAGM18-200605', 'Sofía Alejandra', 'GarciaSancho Martínez', 1, '01-01-0553', 'sofia.garciasancho@cssjb.edu.ni'),
('SAGO14-100805', 'Steffania Auxiliadora', 'Guerrero Oviedo', 1, '01-01-0557', 'steffania.guerrero@cssjb.edu.ni'),
('SAHL21-080416', 'Susan Alessa', 'Henríquez Luna', 1, '01-01-0031', 'susan.henriquez@cssjb.edu.ni'),
('SAMN21-081114', 'Samuel Abiud', 'Mendoza Najlis', 0, '01-01-0081', 'samuel.mendoza@cssjb.edu.ni'),
('SARL14-151004', 'Sergio Antonio', 'Ruiz Lovo', 0, '01-01-0615', 'sergio.ruiz@cssjb.edu.ni'),
('SAUT21-220816', 'Santiago Alí', 'Urtecho Tapia', 0, '01-01-0024', 'santiago.urtecho@cssjb.edu.ni'),
('SCAI20-170704', 'Sheila del Carmen', 'Abea Incer', 1, '01-01-0592', 'sheila.abea@cssjb.edu.ni'),
('SDGA21-101110', 'Sofía Dayana', 'Gómez Arauz', 1, '01-01-0261', 'sofia.gomez@cssjb.edu.ni'),
('SDGP20-1062008', 'Saralee de los Ángeles', 'Guerrero Pérez', 1, '01-01-0469', 'saralee.guerrero@cssjb.edu.ni'),
('SECM17-251204', 'Sahid Emmanuel', 'Calero Montenegro', 0, '01-01-0618', 'sahid.calero@cssjb.edu.ni'),
('SEMV20-190906', 'Stephany Esmeralda', 'Morales  Vílchez', 1, '01-01-0484', 'stephany.morales@cssjb.edu.ni'),
('SEOS14-241206', 'Sebastián E.', 'Obando Salablanca', 0, '01-01-0445', 'sebastian.obando@cssjb.edu.ni'),
('SGPF21-260416', 'Samantha Guadalupe', 'Pérez Flores', 1, '01-01-0036', 'samantha.perez@cssjb.edu.ni'),
('SGVO18-311012', 'Stephanie Guadalupe', 'Vásquez Ortiz', 1, '01-01-0169', 'stephanie.vasquez@cssjb.edu.ni'),
('SIVA17-030707', 'Saúl Ignacio', 'Valverde Arias', 0, '01-01-0456', 'saul.valverde@cssjb.edu.ni'),
('SJLA17-111104', 'Steven Javier', 'López Alguera', 0, '01-01-0621', 'steven.lopez@cssjb.edu.ni'),
('SJMG21-230516', 'Stefan Javier', 'Mercado García', 0, '01-01-0025', 'stefan.mercado@cssjb.edu.ni'),
('SJRR17-150711', 'Steven Josué', 'Rivas Rodríguez', 0, '01-01-0218', 'steven.rivas@cssjb.edu.ni'),
('SMBA16-120312', 'Sofía Marcela', 'Barrios Aguilar', 1, '01-01-0173', 'sofia.barrios@cssjb.edu.ni'),
('SMCM14-270606', 'Silvia Mercedes', 'Collado Martínez', 1, '01-01-0503', 'silvia.collado@cssjb.edu.ni'),
('SMMA14-170704', 'Shirly María', 'Moya Arguello', 1, '01-01-0609', 'shirly.moya@cssjb.edu.ni'),
('SMRB14-240405', 'Saskya Margarita', 'Ramírez Briones', 1, '01-01-0627', 'saskya.ramirez@cssjb.edu.ni'),
('SNFG16-260510', 'Silvia Nicole', 'Flores Gutiérrez', 1, '01-01-0260', 'silvia.gutierrez@cssjb.edu.ni'),
('SNGA19-040711', 'Sarah Nicole', 'García Ayerdis', 1, '01-01-0154', 'sarah.garcia@cssjb.edu.ni'),
('SNGG14-180804', 'Stephanie Nicole de los Á.', 'Garay Gutiérrez', 1, '01-01-0601', 'stephanie.garay@cssjb.edu.ni'),
('SNMM16-011010', 'Sofía Nicole', 'Marcenaro Malespín', 1, '01-01-0241', 'sofia.marcenaro@cssjb.edu.ni'),
('SNRE21-041409', 'Sofia Nicole', 'Rocha Estrada', 1, '01-01-0414', 'sofia.rocha@cssjb.edu.ni'),
('SNVO19-140105', 'Stefanny Nicole', 'Villanueva Olivas', 1, '01-01-0639', 'stefanny.villanueva@cssjb.edu.ni'),
('SSMC14-290310', 'Steven Sneijder', 'Mojica Carazo', 0, '01-01-0328', 'steven.mojica@cssjb.edu.ni'),
('SSMR14-230606', 'Stephanie Sofía', 'Mayorga Rivas', 1, '01-01-0562', 'stephanie.mayorga@cssjb.edu.ni'),
('STTS14-210107', 'Steven Tadeo', 'Torrez Sandino', 0, '01-01-0544', 'steven.torrez@cssjb.edu.ni'),
('SVMV20-140407', 'Sasha Valentina', 'Meneses Vasconcelos', 1, '01-01-0481', 'sasha.meneses@cssjb.edu.ni'),
('SYAL21-051714', 'Sofía Yaoska', 'Aburto López', 1, '01-01-0061', 'yaoska.aburto@cssjb.edu.ni'),
('SYNÚ21-061214', 'Sherline Yolieth', 'Núñez Fernández', 1, '01-01-0055', 'sherline.nunez@cssjb.edu.ni'),
('TAHL15-120210', 'Thais Alexandra', 'Henríquez Luna', 1, '01-01-0323', 'thais.henriquez@cssjb.edu.ni'),
('TGOP20-1912012', 'Tadeo Gabriel', 'Obregón Peña', 0, '01-01-0216', 'tadeo.obregon@cssjb.edu.ni'),
('TJPM21-033109', 'Tadeo de Jesús', 'Palacio Martínez', 0, '01-01-0411', 'tadeo.palacio@cssjb.edu.ni'),
('TMBM14-140209', 'Tais Mireya', 'Borge Molina', 1, '01-01-0315', 'tais.borge@cssjb.edu.ni'),
('TNMC19-020114', 'Tupac Necmi', 'Mendoza Cabeza', 0, '01-01-0114', 'tupac.mendoza@cssjb.edu.ni'),
('TSAR21-101015', 'Theo Santiago', 'Arévalo Reyes', 0, '01-01-0045', 'theo.arevalo@cssjb.edu.ni'),
('UJBG16-091111', 'Ulises José', 'Barahona Gaitán', 0, '01-01-0199', 'ulises.barahona@cssjb.edu.ni'),
('VAHS14-250406', 'Valeria Alejandra', 'Hernández Sánchez', 1, '01-01-0559', 'valeria.hernandez@cssjb.edu.ni'),
('VELC18-060703', 'Vania Esmeralda', 'López Campos', 1, '01-01-0622', 'vania.lopez@cssjb.edu.ni'),
('VFAM17-201112', 'Victoria Franceska', 'Ayala Medrano', 1, '01-01-0148', 'victoria.ayala@cssjb.edu.ni'),
('VGBL18-220813', 'Valeria Guadalupe', 'Balmaceda López', 1, '01-01-0094', 'valeria.balmaceda@cssjb.edu.ni'),
('VLRH20-150807', 'Valeria Lisbeth', 'Rodríguez Hernández', 1, '01-01-0567', 'valeria.rodriguez@cssjb.edu.ni'),
('VMMH14-040408', 'Valery Massiel', 'Mena Hernández', 1, '01-01-0479', 'valery.mena@cssjb.edu.ni'),
('VMRD17-240611', 'Virgilio Manuel', 'Rivas Domínguez', 0, '01-01-0277', 'virgilio.rivas@cssjb.edu.ni'),
('VNRR19-180504', 'Víctor Noel', 'Romero Rivas', 0, '01-01-0629', 'noel.romero@cssjb.edu.ni'),
('WCCC16-190312', 'Wendy del Carmen', 'Campos Canizalez', 1, '01-01-0176', 'wendy.campos@cssjb.edu.ni'),
('WJSJ15-281210', 'Wilber Jesús', 'Salazar Juárez', 0, '01-01-0307', 'wilber.salazar@cssjb.edu.ni'),
('YACA21-091208', 'Yasser Alexander', 'Colomer Arana', 0, '01-01-0385', 'yasser.colomer@cssjb.edu.ni'),
('YAVP14-101104', 'Yelina de los Ángeles', 'Valle Pérez', 1, '01-01-0616', 'yelina.valle@cssjb.edu.ni'),
('YEGD14-150507', 'Yamil Emilio', 'Gaitán Dávila', 0, '01-01-0467', 'yamil.gaitan@cssjb.edu.ni'),
('YEVR17-181109', 'Yathziry Elena', 'Velásquez Rodríguez', 1, '01-01-0312', 'yathziry.velasquez@cssjb.edu.ni'),
('YGL21-060308', 'Yancy Guissell', 'López', 1, '01-01-0396', 'yancy.lopez@cssjb.edu.ni'),
('YJPB15-060410', 'Yoxan de Jesús', 'Pérez Bojorge', 0, '01-01-0336', 'yoxan.perez@cssjb.edu.ni'),
('YJPF14-091007', 'Yamil Josué', 'Pérez Flores', 0, '01-01-0488', 'yamil.perez@cssjb.edu.ni'),
('YMCG21-290915', 'Yokastha Marina', 'Chabrol García', 1, '01-01-0027', 'yokastha.chabrol@cssjb.edu.ni'),
('YSHR15-071109', 'Yannesa Sophia', 'Herrera Rivera', 1, '01-01-0326', 'yannesa.herrera@cssjb.edu.ni'),
('YYOO16-260508', 'Yasser Yesaayahu', 'Olson Ortega', 0, '01-01-0334', 'yasser.olson@cssjb.edu.ni'),
('YYZC21-030915', 'Yeshua Yamil', 'Zúniga Carcache', 0, '01-01-0042', 'yeshua.zuniga@cssjb.edu.ni'),
('ZAGI18-161209', 'Zahir Antonio', 'Gutiérrez Ibrahim', 0, '01-01-0290', 'zahir.gutierrez@cssjb.edu.ni'),
('ZVUT21-102114', 'Zoé Valentina', 'Urbina Traña', 1, '01-01-0090', 'zoe.urbina@cssjb.edu.ni');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(250) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `Nombre`) VALUES
(7, 'DESARROLLO DE LAS HABILIDADES DE LA COMUNICACIÓN Y TALENTO ARTÍSTICO Y CULTURAL'),
(8, 'DESARROLLO DEL PENSAMIENTO LÓGICO Y CIENTÍFICO'),
(9, 'DESARROLLO PERSONAL, SOCIAL Y EMOCIONAL'),
(10, 'FORMACION PERSONAL Y SOCIAL'),
(11, 'Preescolar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bimestres`
--

CREATE TABLE `bimestres` (
  `id` int(11) NOT NULL,
  `Estado` int(11) NOT NULL,
  `Role` int(11) NOT NULL,
  `idYear` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `bimestres`
--

INSERT INTO `bimestres` (`id`, `Estado`, `Role`, `idYear`) VALUES
(13, 0, 1, 2021),
(14, 0, 2, 2021),
(15, 0, 3, 2021),
(16, 1, 4, 2021),
(17, 0, 1, 2022),
(18, 0, 2, 2022),
(19, 0, 3, 2022),
(20, 0, 4, 2022);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

CREATE TABLE `ciclos` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `isParvularia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`id`, `Nombre`, `isParvularia`) VALUES
(5, 'Preescolar', 1),
(6, 'Primaria', 0),
(8, 'Secundaria', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos`
--

CREATE TABLE `codigos` (
  `id` int(11) NOT NULL,
  `Codigo` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `codigos`
--

INSERT INTO `codigos` (`id`, `Codigo`, `valor`) VALUES
(5, 'No hace tareas asignadas en casa.', -2),
(6, 'No hace taras en clase.', -2),
(7, 'Entregó tarea incompleta.', -2),
(8, 'Llega tarde al Colegio.', -5),
(9, 'Llega tarde a la formación o salón de clase.', -3),
(10, 'Muestra indiferencia al aprendizaje de las distintas disciplinas.', -3),
(11, 'No pone atención ni participa en clase.', -3),
(12, 'Bajo rendimiento académico.', -5),
(13, 'Ausencia injustificada.', -3),
(14, 'Se retiró de clase por acto de indisciplina.', -5),
(15, 'Se retiró de clase sin autorización del docente.', -5),
(16, 'No sigue orientaciones de sus educadores.', -2),
(17, 'No trae agenda escolar.', -2),
(18, 'No entrega notificación al padre de familia.', -5),
(19, 'No porta el carnet estudiantil.', -2),
(20, 'Fuera de su lugar sin autorización del docente.', -2),
(21, 'Se cambia de lugar sin permiso o autorización del docente guía.', -2),
(22, 'Permanece en el aula en horario no permitido.', -3),
(23, 'POrta uniforme incompleto (Deportivo o de diario).', -5),
(24, 'No cumplió con la orientación de cortarse el cabello según normativa.', -5),
(25, 'Se presenta maquillada o con las uñas pintadas.', -3),
(26, 'Porta ropa que trasluce, aretes grandes y tinturas de color en el cabello.', -5),
(27, 'No trae útiles de acuerdo al horario.', -3),
(28, 'Habla durante la formación y hace desorden en la fila.', -2),
(29, 'Habla durante la clase, se distrae y distrae a los demás.', -3),
(30, 'Come en clase o mastica chicle.', -2),
(31, 'No cuida su aseo ni presentación personal.', -3),
(32, 'Utiliza celular en clase, Iglesia, formación y ambiente del Colegio durante la jornada.', -10),
(33, 'Muestra indiferencia durante la Eucaristía y acto culturales.', -5),
(34, 'No participa o no justifica su ausencia a las actividades extracurriculares (Religiosas, culturales, deportivas).', -5),
(35, 'Agrede a su compañero (a) verbalmente.', -15),
(36, 'Agrede a su compañero (a) físicamente (Informe preventivo).', -25),
(37, 'Uso inadecuado de las redes sociales para difamar o divulgar a cualquier miembro de la CEP (Informe preventivo).', -25),
(38, 'Influye negativamente en sus compañeros.', -5),
(39, 'Copia durante los exámenes.', -15),
(40, 'Registra y/o altera el Diario Pedagógico.', -5),
(41, 'Daña el mobiliario y las instalaciones (Informe preventivo).', -15),
(42, 'Falta el respeto al Educador Salesiano o algún miembro de la CEP (Informe preventivo).', -25),
(43, 'Cometió acto que atenta contra la moral (Informe preventivo).', -25),
(44, 'Sustrae objetos, útiles escolares, dinero que no son propios (Informe preventivo).', -25),
(46, 'Esconde objetos, últiles escolares, dinero que no son propios (Informe preventivo).', -15),
(47, 'Comete actos inapropiados fuera de las instalaciones de la institución.', -15),
(48, 'Colabora con el cuído y limpieza del aula.', 3),
(49, 'Colabora con la directiva de grado.', 2),
(50, 'Mantiene una actitud positiva hacia la propuesta educativa del Colegio.', 5),
(51, 'Plantea sus inquietudes con franqueza, respeto y honestidad.', 1),
(52, 'Presenta útiles escolares en orden y aseo.', 1),
(53, 'Mantiene una actitud de mejora y esfuerzo constante de sus esfuerzos de aprendizaje.', 3),
(54, 'Es creativo, disponible y colaborador.', 3),
(55, 'Busca soluciones y se muestra solidario a los problemas y necesidades de los demás.', 3),
(56, 'Ha mejorado su comportamiento y actitudes.', 2),
(57, 'Se identifica y vive los valores religiosos.', 2),
(58, 'Participa con entusiasmo y alegría en las actividades del Colegio.', 1),
(59, 'Ha respondido positivamente a las directrices y normas del Colegio.', 1),
(60, 'Es un líder positivo.', 5),
(61, 'Es respetuoso ante sus compañeros y autoridades del Colegio.', 5),
(62, 'Vela por el cuido y mantenimiento de los bienes del Colegio.', 1),
(63, 'Se destaca en la promoción y participación en el deporte.', 2),
(64, 'Es destacado por su puntualidad.', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_alumno`
--

CREATE TABLE `codigo_alumno` (
  `id` int(11) NOT NULL,
  `idCodigo` int(11) NOT NULL,
  `idAlumno` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `idMaestro` int(11) NOT NULL,
  `idBimestre` int(11) NOT NULL,
  `Observacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Date` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `codigo_alumno`
--

INSERT INTO `codigo_alumno` (`id`, `idCodigo`, `idAlumno`, `idMaestro`, `idBimestre`, `Observacion`, `Date`) VALUES
(24, 36, 'ADHL15-290910', 4, 16, 'Observación', '10/10/2021'),
(25, 44, 'LR192720', 31, 16, 'faddf', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `idCiclo` int(11) NOT NULL,
  `idYear` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`id`, `nombre`, `idCiclo`, `idYear`) VALUES
(9, 'II Nivel', 5, 2021),
(10, 'III Nivel A', 5, 2021),
(11, 'III Nivel B', 5, 2021),
(12, 'Séptimo grado A', 8, 2021),
(13, 'Séptimo grado B', 8, 2021),
(14, 'Octavo grado A', 8, 2021),
(15, 'Octavo grado B', 8, 2021),
(16, 'Noveno grado A', 8, 2021),
(17, 'Noveno grado B', 8, 2021),
(18, 'Décimo grado A', 8, 2021),
(19, 'Décimo grado B', 8, 2021),
(20, 'Undécimo grado A', 8, 2021),
(21, 'Undécimo grado B', 8, 2021),
(22, 'Primer grado A', 6, 2021),
(23, 'Segundo grado A', 6, 2021),
(24, 'Tercer grado A', 6, 2021),
(25, 'Tercer grado B', 6, 2021),
(26, 'Cuarto grado A', 6, 2021),
(27, 'Cuarto grado B', 6, 2021),
(28, 'Quinto grado A', 6, 2021),
(29, 'Quinto grado B', 6, 2021),
(30, 'Sexto grado A', 6, 2021),
(31, 'Sexto grado B', 6, 2021),
(33, 'Primer Grado', 6, 2022),
(34, 'Segundo Grado', 6, 2022),
(35, 'Tercer Grado', 6, 2022),
(36, 'Cuarto Grado A', 6, 2022),
(37, 'Cuarto Grado B', 6, 2022),
(38, 'Quinto Grado A', 6, 2022),
(39, 'Quinto Grado B', 6, 2022),
(40, 'Sexto Grado A', 6, 2022),
(41, 'Sexto Grado B', 6, 2022),
(42, 'Séptimo Grado A', 8, 2022),
(43, 'Séptimo Grado B', 8, 2022),
(44, 'Octavo Grado A', 8, 2022),
(45, 'Octavo Grado B', 8, 2022),
(46, 'Noveno Grado A', 8, 2022),
(47, 'Noveno Grado B', 8, 2022),
(48, 'Décimo Grado A', 8, 2022),
(49, 'Décimo Grado B', 8, 2022),
(50, 'Undécimo Grado A', 8, 2022),
(51, 'Undécimo Grado B', 8, 2022);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado_alumno`
--

CREATE TABLE `grado_alumno` (
  `id` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL,
  `idAlumno` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Conducta1` int(11) NOT NULL,
  `Conducta2` int(11) NOT NULL,
  `Conducta3` int(11) NOT NULL,
  `Conducta4` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grado_alumno`
--

INSERT INTO `grado_alumno` (`id`, `idGrado`, `idAlumno`, `Conducta1`, `Conducta2`, `Conducta3`, `Conducta4`) VALUES
(35, 9, 'AICS21-270117', 100, 100, 100, 100),
(36, 9, 'AVGA21-090617', 100, 100, 100, 100),
(37, 9, 'AGAU21-211016', 100, 100, 100, 100),
(38, 9, 'BBUS21-210716', 100, 100, 100, 100),
(39, 9, 'CMDL20-140416', 100, 100, 100, 100),
(40, 9, 'DJCA21-040117', 100, 100, 100, 100),
(41, 9, 'EGGC21-120916', 100, 100, 100, 100),
(42, 9, 'EAAN21-210316', 100, 100, 100, 100),
(43, 9, 'GGOR21-290417', 100, 100, 100, 100),
(44, 9, 'GSCG21-240517', 100, 100, 100, 100),
(45, 9, 'HSCM21-120716', 100, 100, 100, 100),
(46, 9, 'HAOO21-160916', 100, 100, 100, 100),
(47, 9, 'AJUA21-210616', 100, 100, 100, 100),
(48, 9, 'JAPT21-290716', 100, 100, 100, 100),
(49, 9, 'JMMG21-200117', 100, 100, 100, 100),
(50, 9, 'JODG21-271116', 100, 100, 100, 100),
(51, 9, 'LECM21-151116', 100, 100, 100, 100),
(52, 9, 'LIGA21-130516', 100, 100, 100, 100),
(53, 9, 'MRBG21-121216', 100, 100, 100, 100),
(54, 9, 'MACM21-070217', 100, 100, 100, 100),
(55, 9, 'MAGP21-150217', 100, 100, 100, 100),
(56, 9, 'MRTC21-281216', 100, 100, 100, 100),
(57, 9, 'RSPC21-150816', 100, 100, 100, 100),
(58, 9, 'SAUT21-220816', 100, 100, 100, 100),
(59, 9, 'SJMG21-230516', 100, 100, 100, 100),
(60, 10, 'AGAS21-210615', 100, 100, 100, 100),
(61, 10, 'YMCG21-290915', 100, 100, 100, 100),
(62, 10, 'MACO21-210216', 100, 100, 100, 100),
(63, 10, 'KÁCC21-080416', 100, 100, 100, 100),
(64, 10, 'EEDH21-041115', 100, 100, 100, 100),
(65, 10, 'SAHL21-080416', 100, 100, 100, 100),
(66, 10, 'CAHB21-291215', 100, 100, 100, 100),
(67, 10, 'LAMC21-110216', 100, 100, 100, 100),
(68, 10, 'NAMM21-150615', 100, 100, 100, 100),
(69, 10, 'AAML21-130316', 100, 100, 100, 100),
(70, 10, 'SGPF21-260416', 100, 100, 100, 100),
(71, 10, 'AÁRM21-090615', 100, 100, 100, 100),
(72, 10, 'NGSJ21-190216', 100, 100, 100, 100),
(73, 10, 'JISM21-290915', 100, 100, 100, 100),
(74, 10, 'LSSS21-280216', 100, 100, 100, 100),
(75, 10, 'DAUC21-270715', 100, 100, 100, 100),
(76, 10, 'YYZC21-030915', 100, 100, 100, 100),
(77, 11, 'SAAB21-190515', 100, 100, 100, 100),
(78, 11, 'MCAX21-280815', 100, 100, 100, 100),
(79, 11, 'TSAR21-101015', 100, 100, 100, 100),
(80, 11, 'DFBA21-010715', 100, 100, 100, 100),
(81, 11, 'ESBO21-180615', 100, 100, 100, 100),
(82, 11, 'DGBR21-230515', 100, 100, 100, 100),
(83, 11, 'RAFA11-021014', 100, 100, 100, 100),
(84, 11, 'ESGA21-170715', 100, 100, 100, 100),
(85, 11, 'KSGO21-211015', 100, 100, 100, 100),
(86, 11, 'DJHO21-120515', 100, 100, 100, 100),
(87, 11, 'IALÓ21-250516', 100, 100, 100, 100),
(88, 11, 'JEMA21-080915', 100, 100, 100, 100),
(89, 11, 'SYNÚ21-061214', 100, 100, 100, 100),
(90, 11, 'MGQU21-271115', 100, 100, 100, 100),
(91, 11, 'JARO21-021115', 100, 100, 100, 100),
(92, 11, 'IJRO21-091215', 100, 100, 100, 100),
(93, 11, 'JCRU21-290615', 100, 100, 100, 100),
(94, 11, 'BGSÁ21-270615', 100, 100, 100, 100),
(95, 22, 'SYAL21-051714', 100, 100, 100, 100),
(96, 22, 'MMBM21-111214', 100, 100, 100, 100),
(97, 22, 'DABG21-092814', 100, 100, 100, 100),
(98, 22, 'CRCM21-082214', 100, 100, 100, 100),
(99, 22, 'NJCB21-092214', 100, 100, 100, 100),
(100, 22, 'LGCB21-041115', 100, 100, 100, 100),
(101, 22, 'GACJ21-032315', 100, 100, 100, 100),
(102, 22, 'ESCR21-071714', 100, 100, 100, 100),
(103, 22, 'AICC21-122514', 100, 100, 100, 100),
(104, 22, 'ANCL21-090514', 100, 100, 100, 100),
(105, 22, 'CJFJ21-122814', 100, 100, 100, 100),
(106, 22, 'JSFM21-071014', 100, 100, 100, 100),
(107, 22, 'GAGL21-081314', 100, 100, 100, 100),
(108, 22, 'DZGR21-022315', 100, 100, 100, 100),
(109, 22, 'BBGP21-101014', 100, 100, 100, 100),
(110, 22, 'KAGH21-080515', 100, 100, 100, 100),
(111, 22, 'AALA21-101614', 100, 100, 100, 100),
(112, 22, 'MGLM21-103114', 100, 100, 100, 100),
(113, 22, 'AAMM21-122314', 100, 100, 100, 100),
(114, 22, 'KTMV21-070214', 100, 100, 100, 100),
(115, 22, 'SAMN21-081114', 100, 100, 100, 100),
(116, 22, 'RAMC21-040114', 100, 100, 100, 100),
(117, 22, 'FCME21-022114', 100, 100, 100, 100),
(118, 22, 'IGMS21-032015', 100, 100, 100, 100),
(119, 22, 'DAMM21-092314', 100, 100, 100, 100),
(120, 22, 'MMNG21-050814', 100, 100, 100, 100),
(121, 22, 'JAPR21-081614', 100, 100, 100, 100),
(122, 22, 'LSC21-032615', 100, 100, 100, 100),
(123, 22, 'ANSG21-010815', 100, 100, 100, 100),
(124, 22, 'ZVUT21-102114', 100, 100, 100, 100),
(125, 22, 'JJVM21-062114', 100, 100, 100, 100),
(126, 23, 'GGAS18-040114', 100, 100, 100, 100),
(127, 23, 'JDAA18-200813', 100, 100, 100, 100),
(128, 23, 'VGBL18-220813', 100, 100, 100, 100),
(129, 23, 'JDBN18-081113', 100, 100, 100, 100),
(130, 23, 'LCBH18-281013', 100, 100, 100, 100),
(131, 23, 'DSBC18-071013', 100, 100, 100, 100),
(132, 23, 'AAGCS20-051013', 100, 100, 100, 100),
(133, 23, 'DACU18-141113', 100, 100, 100, 100),
(134, 23, 'EACL18-310813', 100, 100, 100, 100),
(135, 23, 'EADC18-200813', 100, 100, 100, 100),
(136, 23, 'FMDM18-080114', 100, 100, 100, 100),
(137, 23, 'EMDZ18-130214', 100, 100, 100, 100),
(138, 23, 'ESEG18-170114', 100, 100, 100, 100),
(139, 23, 'KFGA18-141213', 100, 100, 100, 100),
(140, 23, 'DFGL20-250414', 100, 100, 100, 100),
(141, 23, 'OYHR19-230913', 100, 100, 100, 100),
(142, 23, 'IALS19-150114', 100, 100, 100, 100),
(143, 23, 'FAMC19-290813', 100, 100, 100, 100),
(144, 23, 'KXMG20-210813', 100, 100, 100, 100),
(145, 23, 'MKMG18-221013', 100, 100, 100, 100),
(146, 23, 'NSML18-260214', 100, 100, 100, 100),
(147, 23, 'JDMM18-160114', 100, 100, 100, 100),
(148, 23, 'TNMC19-020114', 100, 100, 100, 100),
(149, 23, 'CDMJ19-220214', 100, 100, 100, 100),
(150, 23, 'MGMR20-041013', 100, 100, 100, 100),
(151, 23, 'FSMG19-170314', 100, 100, 100, 100),
(152, 23, 'DGPG19-060214', 100, 100, 100, 100),
(153, 23, 'MAPO19-020114', 100, 100, 100, 100),
(154, 23, 'IGRL19-110414', 100, 100, 100, 100),
(155, 23, 'ORV21-040414', 100, 100, 100, 100),
(156, 23, 'JTTF18-200414', 100, 100, 100, 100),
(157, 24, 'AAAB17-140812', 100, 100, 100, 100),
(158, 24, 'BFBD17-140812', 100, 100, 100, 100),
(159, 24, 'EFCV17-300912', 100, 100, 100, 100),
(160, 24, 'AACR17-141112', 100, 100, 100, 100),
(161, 24, 'CICP17-200213', 100, 100, 100, 100),
(162, 24, 'ARCC17-181012', 100, 100, 100, 100),
(163, 24, 'AYEG17-130612', 100, 100, 100, 100),
(164, 24, 'DAGC17-080513', 100, 100, 100, 100),
(165, 24, 'EAGC17-300812', 100, 100, 100, 100),
(166, 24, 'DAGC17-271212', 100, 100, 100, 100),
(167, 24, 'MIHO17-161112', 100, 100, 100, 100),
(168, 24, 'RIHU17-260213', 100, 100, 100, 100),
(169, 24, 'MAJR17-070113', 100, 100, 100, 100),
(170, 24, 'CRLE20-270912', 100, 100, 100, 100),
(171, 24, 'OMOS17-010912', 100, 100, 100, 100),
(172, 24, 'EARJ17-221212', 100, 100, 100, 100),
(173, 24, 'KFRV17-020812', 100, 100, 100, 100),
(174, 24, 'MARR17-140213', 100, 100, 100, 100),
(175, 24, 'MSRT17-150313', 100, 100, 100, 100),
(176, 24, 'LMSH17-080313', 100, 100, 100, 100),
(177, 24, 'JSSM17-010812', 100, 100, 100, 100),
(178, 24, 'MASG19-180912', 100, 100, 100, 100),
(179, 24, 'GEUS17-090413', 100, 100, 100, 100),
(180, 24, 'DAVB17-240513', 100, 100, 100, 100),
(181, 25, 'MGAR18-130612', 100, 100, 100, 100),
(182, 25, 'VFAM17-201112', 100, 100, 100, 100),
(183, 25, 'AMBH17-181012', 100, 100, 100, 100),
(184, 25, 'LBM21-022713', 100, 100, 100, 100),
(185, 25, 'KABA18-050912', 100, 100, 100, 100),
(186, 25, 'DACC19-210213', 100, 100, 100, 100),
(187, 25, 'AMCR17-280612', 100, 100, 100, 100),
(188, 25, 'SNGA19-040711', 100, 100, 100, 100),
(189, 25, 'MAGC18-040812', 100, 100, 100, 100),
(190, 25, 'JIGP17-220512', 100, 100, 100, 100),
(191, 25, 'JEGP21-070411', 100, 100, 100, 100),
(192, 25, 'AAHC17-170612', 100, 100, 100, 100),
(193, 25, 'EFLB19-240712', 100, 100, 100, 100),
(194, 25, 'JALL19-010513', 100, 100, 100, 100),
(195, 25, 'AAMM20-090113', 100, 100, 100, 100),
(196, 25, 'DAOO17-010613', 100, 100, 100, 100),
(197, 25, 'JDQA17-220513', 100, 100, 100, 100),
(198, 25, 'KDRR18-060912', 100, 100, 100, 100),
(199, 25, 'CCRM17-180613', 100, 100, 100, 100),
(200, 25, 'IARR17-250313', 100, 100, 100, 100),
(201, 25, 'MESZ17-060413', 100, 100, 100, 100),
(202, 25, 'EASS21-122612', 100, 100, 100, 100),
(203, 25, 'SGVO18-311012', 100, 100, 100, 100),
(204, 26, 'EGAH17-211111', 100, 100, 100, 100),
(205, 26, 'SAAH17-211111', 100, 100, 100, 100),
(206, 26, 'RMAU17-220512', 100, 100, 100, 100),
(207, 26, 'SMBA16-120312', 100, 100, 100, 100),
(208, 26, 'EABR16-120412', 100, 100, 100, 100),
(209, 26, 'DABM16-220511', 100, 100, 100, 100),
(210, 26, 'WCCC16-190312', 100, 100, 100, 100),
(211, 26, 'JACT17-260711', 100, 100, 100, 100),
(212, 26, 'KACT16-151011', 100, 100, 100, 100),
(213, 26, 'EGCG16-130312', 100, 100, 100, 100),
(214, 26, 'DFCA21-101110', 100, 100, 100, 100),
(215, 26, 'LGCG16-150811', 100, 100, 100, 100),
(216, 26, 'MAEA21-020311', 100, 100, 100, 100),
(217, 26, 'FAFA16-271211', 100, 100, 100, 100),
(218, 26, 'KAFL18-250112', 100, 100, 100, 100),
(219, 26, 'MGGL19-270112', 100, 100, 100, 100),
(220, 26, 'LSGS16-151011', 100, 100, 100, 100),
(221, 26, 'AGGP16-151011', 100, 100, 100, 100),
(222, 26, 'GVGR17-180512', 100, 100, 100, 100),
(223, 26, 'RRIG16-300312', 100, 100, 100, 100),
(224, 26, 'MJLH19-211011', 100, 100, 100, 100),
(225, 26, 'IILC16-231211', 100, 100, 100, 100),
(226, 26, 'AJLH16-020711', 100, 100, 100, 100),
(227, 26, 'ASM21-030311', 100, 100, 100, 100),
(228, 26, 'AJPM17-060112', 100, 100, 100, 100),
(229, 26, 'AJRM16-140212', 100, 100, 100, 100),
(230, 26, 'MARA16-150811', 100, 100, 100, 100),
(231, 26, 'JFSR15-270311', 100, 100, 100, 100),
(232, 26, 'ASR21-121811', 100, 100, 100, 100),
(233, 27, 'UJBG16-091111', 100, 100, 100, 100),
(234, 27, 'MACF17-260112', 100, 100, 100, 100),
(235, 27, 'LACO16-210212', 100, 100, 100, 100),
(236, 27, 'MFCG16-250811', 100, 100, 100, 100),
(237, 27, 'AJDF16-060611', 100, 100, 100, 100),
(238, 27, 'AHGI17-240711', 100, 100, 100, 100),
(239, 27, 'EXLC17-270611', 100, 100, 100, 100),
(240, 27, 'DALD16-151111', 100, 100, 100, 100),
(241, 27, 'FJLM18-030212', 100, 100, 100, 100),
(242, 27, 'GAMS19-180612', 100, 100, 100, 100),
(243, 27, 'LGMG16-230911', 100, 100, 100, 100),
(244, 27, 'MSMM17-170412', 100, 100, 100, 100),
(245, 27, 'ACMR16-080611', 100, 100, 100, 100),
(246, 27, 'EEMF17-230312', 100, 100, 100, 100),
(247, 27, 'MAMB16-161111', 100, 100, 100, 100),
(248, 27, 'EJMU16-151111', 100, 100, 100, 100),
(249, 27, 'MMNV16-200511', 100, 100, 100, 100),
(250, 27, 'TGOP20-1912012', 100, 100, 100, 100),
(251, 27, 'MGOV16-221011', 100, 100, 100, 100),
(252, 27, 'SJRR17-150711', 100, 100, 100, 100),
(253, 27, 'MARR16-090711', 100, 100, 100, 100),
(254, 27, 'AARA18-221211', 100, 100, 100, 100),
(255, 27, 'DVRB16-180711', 100, 100, 100, 100),
(256, 27, 'ADSA16-220911', 100, 100, 100, 100),
(257, 27, 'MASM16-050711', 100, 100, 100, 100),
(258, 27, 'BJSM16-290811', 100, 100, 100, 100),
(259, 27, 'JASR16-140511', 100, 100, 100, 100),
(260, 27, 'ABTM19-041111', 100, 100, 100, 100),
(261, 27, 'JAUX16-120412', 100, 100, 100, 100),
(262, 27, 'MMUO16-230911', 100, 100, 100, 100),
(263, 28, 'ELAC16-270111', 100, 100, 100, 100),
(264, 28, 'ASBR17-010710', 100, 100, 100, 100),
(265, 28, 'JICV16-250510', 100, 100, 100, 100),
(266, 28, 'FDCC15-240111', 100, 100, 100, 100),
(267, 28, 'GACL15-240211', 100, 100, 100, 100),
(268, 28, 'BXCG15-070710', 100, 100, 100, 100),
(269, 28, 'OJEG15-141210', 100, 100, 100, 100),
(270, 28, 'JMER15-081010', 100, 100, 100, 100),
(271, 28, 'MEFN15-210111', 100, 100, 100, 100),
(272, 28, 'JHGR16-170411', 100, 100, 100, 100),
(273, 28, 'IJGO15-280210', 100, 100, 100, 100),
(274, 28, 'JDGU15-160710', 100, 100, 100, 100),
(275, 28, 'SNMM16-011010', 100, 100, 100, 100),
(276, 28, 'BNMD15-281010', 100, 100, 100, 100),
(277, 28, 'GMMM16-060610', 100, 100, 100, 100),
(278, 28, 'NAMM17-240511', 100, 100, 100, 100),
(279, 28, 'JAMC15-140610', 100, 100, 100, 100),
(280, 28, 'MAMC20-542010', 100, 100, 100, 100),
(281, 28, 'HFNB16-080411', 100, 100, 100, 100),
(282, 28, 'AFOE16-110411', 100, 100, 100, 100),
(283, 28, 'MAQH16-030311', 100, 100, 100, 100),
(284, 28, 'JGRS19-270411', 100, 100, 100, 100),
(285, 28, 'AXSD19-100909', 100, 100, 100, 100),
(286, 28, 'IXSD19-100909', 100, 100, 100, 100),
(287, 28, 'BAVA16-311210', 100, 100, 100, 100),
(288, 29, 'AAAD16-100510', 100, 100, 100, 100),
(289, 29, 'CGCC21-041011', 100, 100, 100, 100),
(290, 29, 'AJCB15-280211', 100, 100, 100, 100),
(291, 29, 'KSCH16-190111', 100, 100, 100, 100),
(292, 29, 'DAMX15-010111', 100, 100, 100, 100),
(293, 29, 'DGEG15-110710', 100, 100, 100, 100),
(294, 29, 'SNFG16-260510', 100, 100, 100, 100),
(295, 29, 'SDGA21-101110', 100, 100, 100, 100),
(296, 29, 'FAGS16-231010', 100, 100, 100, 100),
(297, 29, 'JSGM15-101210', 100, 100, 100, 100),
(298, 29, 'ADHL15-290910', 100, 100, 100, 100),
(299, 29, 'JTLV15-140410', 100, 100, 100, 100),
(300, 29, 'MAMT15-291110', 100, 100, 100, 100),
(301, 29, 'MVMD15-281010', 100, 100, 100, 100),
(302, 29, 'AAME17-030810', 100, 100, 100, 100),
(303, 29, 'RAMC20-552010', 100, 100, 100, 100),
(304, 29, 'ARMM15-230411', 100, 100, 100, 100),
(305, 29, 'JJML17-100910', 100, 100, 100, 100),
(306, 29, 'HNNM21-020711', 100, 100, 100, 100),
(307, 29, 'MAOC15-270810', 100, 100, 100, 100),
(308, 29, 'ANPM15-240810', 100, 100, 100, 100),
(309, 29, 'KAPH20-100511', 100, 100, 100, 100),
(310, 29, 'JDPR17-260710', 100, 100, 100, 100),
(311, 29, 'VMRD17-240611', 100, 100, 100, 100),
(312, 29, 'JISC16-180211', 100, 100, 100, 100),
(313, 29, 'IEVR15-210311', 100, 100, 100, 100),
(314, 30, 'BAAG19-181109', 100, 100, 100, 100),
(315, 30, 'EDAA15-091109', 100, 100, 100, 100),
(316, 30, 'RFBC16-070310', 100, 100, 100, 100),
(317, 30, 'GABH16-170809', 100, 100, 100, 100),
(318, 30, 'AACR14-180609', 100, 100, 100, 100),
(319, 30, 'BMCB14-190809', 100, 100, 100, 100),
(320, 30, 'JICC14-180909', 100, 100, 100, 100),
(321, 30, 'CHCB15-290110', 100, 100, 100, 100),
(322, 30, 'JACO14-020809', 100, 100, 100, 100),
(323, 30, 'AJGX14-260609', 100, 100, 100, 100),
(324, 30, 'ZAGI18-161209', 100, 100, 100, 100),
(325, 30, 'GJJO14-281009', 100, 100, 100, 100),
(326, 30, 'AMLM14-170709', 100, 100, 100, 100),
(327, 30, 'JJMG15-011209', 100, 100, 100, 100),
(328, 30, 'EJML14-020909', 100, 100, 100, 100),
(329, 30, 'MCMC14-090410', 100, 100, 100, 100),
(330, 30, 'AEMM14-230110', 100, 100, 100, 100),
(331, 30, 'RAMR14-010310', 100, 100, 100, 100),
(332, 30, 'AGMB14-200409', 100, 100, 100, 100),
(333, 30, 'JENT16-150709', 100, 100, 100, 100),
(334, 30, 'JMOU14-121209', 100, 100, 100, 100),
(335, 30, 'APOD16-020509', 100, 100, 100, 100),
(336, 30, 'CSOT15-080808', 100, 100, 100, 100),
(337, 30, 'HEPC16-091109', 100, 100, 100, 100),
(338, 30, 'HJRR14-250909', 100, 100, 100, 100),
(339, 30, 'MARA14-040909', 100, 100, 100, 100),
(340, 30, 'AARM15-270210', 100, 100, 100, 100),
(341, 30, 'WJSJ15-281210', 100, 100, 100, 100),
(342, 30, 'CASA14-050909', 100, 100, 100, 100),
(343, 30, 'MISH15-190310', 100, 100, 100, 100),
(344, 30, 'DRUD14-180809', 100, 100, 100, 100),
(345, 30, 'MJUO16-120609', 100, 100, 100, 100),
(346, 30, 'YEVR17-181109', 100, 100, 100, 100),
(347, 30, 'DTVM14-020510', 100, 100, 100, 100),
(348, 31, 'MABG14-150609', 100, 100, 100, 100),
(349, 31, 'TMBM14-140209', 100, 100, 100, 100),
(350, 31, 'JACT14-010210', 100, 100, 100, 100),
(351, 31, 'AJCO14-070709', 100, 100, 100, 100),
(352, 31, 'AKCP14-071009', 100, 100, 100, 100),
(353, 31, 'MCDR15-030410', 100, 100, 100, 100),
(354, 31, 'ATFC14-110809', 100, 100, 100, 100),
(355, 31, 'MYGR16-091208', 100, 100, 100, 100),
(356, 31, 'RVGR14-020709', 100, 100, 100, 100),
(357, 31, 'TAHL15-120210', 100, 100, 100, 100),
(358, 31, 'OJHC14-040110', 100, 100, 100, 100),
(359, 31, 'LRHM17-110408', 100, 100, 100, 100),
(360, 31, 'YSHR15-071109', 100, 100, 100, 100),
(361, 31, 'KSHO15-171109', 100, 100, 100, 100),
(362, 31, 'SSMC14-290310', 100, 100, 100, 100),
(363, 31, 'JBMM14-240709', 100, 100, 100, 100),
(364, 31, 'ACMD14-031209', 100, 100, 100, 100),
(365, 31, 'KGMS15-190809', 100, 100, 100, 100),
(366, 31, 'ECOM15-170410', 100, 100, 100, 100),
(367, 31, 'JEOS15-271109', 100, 100, 100, 100),
(368, 31, 'YYOO16-260508', 100, 100, 100, 100),
(369, 31, 'JTOR14-231009', 100, 100, 100, 100),
(370, 31, 'YJPB15-060410', 100, 100, 100, 100),
(371, 31, 'EJPR16-261209', 100, 100, 100, 100),
(372, 31, 'AGRC14-290510', 100, 100, 100, 100),
(373, 31, 'CJRD19-161009', 100, 100, 100, 100),
(374, 31, 'JCRL15-050210', 100, 100, 100, 100),
(375, 31, 'MARM14-091008', 100, 100, 100, 100),
(376, 31, 'MDRM14-300110', 100, 100, 100, 100),
(377, 31, 'DFRO17-041107', 100, 100, 100, 100),
(378, 31, 'FSSG14-210510', 100, 100, 100, 100),
(379, 31, 'EIUJ16-200909', 100, 100, 100, 100),
(380, 12, 'AJAR14-230309', 100, 100, 100, 100),
(381, 12, 'AAAM14-101208', 100, 100, 100, 100),
(382, 12, 'AMAV21-090308', 100, 100, 100, 100),
(383, 12, 'CMAM15-100109', 100, 100, 100, 100),
(384, 12, 'LABV21-061708', 100, 100, 100, 100),
(385, 12, 'ANCO21-110608', 100, 100, 100, 100),
(386, 12, 'DJCS21-042709', 100, 100, 100, 100),
(387, 12, 'MDCC14-030708', 100, 100, 100, 100),
(388, 12, 'SACC15-250508', 100, 100, 100, 100),
(389, 12, 'CFCL14-271107', 100, 100, 100, 100),
(390, 12, 'JFDB21-061108', 100, 100, 100, 100),
(391, 12, 'PJFR16-030708', 100, 100, 100, 100),
(392, 12, 'AAFG15-170708', 100, 100, 100, 100),
(393, 12, 'JFFS15-240308', 100, 100, 100, 100),
(394, 12, 'LXGX15-170109', 100, 100, 100, 100),
(395, 12, 'FXGG15-300409', 100, 100, 100, 100),
(396, 12, 'AAGC14-060209', 100, 100, 100, 100),
(397, 12, 'JAGA14-211008', 100, 100, 100, 100),
(398, 12, 'CFGX14-020908', 100, 100, 100, 100),
(399, 12, 'JDGI20-020608', 100, 100, 100, 100),
(400, 12, 'EAJR14-240309', 100, 100, 100, 100),
(401, 12, 'DIJS14-270209', 100, 100, 100, 100),
(402, 12, 'CALR18-070309', 100, 100, 100, 100),
(403, 12, 'KCLE18-201209', 100, 100, 100, 100),
(404, 12, 'FALM20-221007', 100, 100, 100, 100),
(405, 12, 'KGMQ14-200808', 100, 100, 100, 100),
(406, 12, 'PEMC14-250309', 100, 100, 100, 100),
(407, 12, 'AAMR14-220109', 100, 100, 100, 100),
(408, 12, 'JLMP14-240109', 100, 100, 100, 100),
(409, 12, 'AXMF14-260908', 100, 100, 100, 100),
(410, 12, 'BJOB14-021108', 100, 100, 100, 100),
(411, 12, 'IAOM16-220508', 100, 100, 100, 100),
(412, 12, 'AVPO19-264200', 100, 100, 100, 100),
(413, 12, 'MAVP14-260109', 100, 100, 100, 100),
(414, 12, 'CAVL14-210708', 100, 100, 100, 100),
(415, 12, 'AEVS14-040309', 100, 100, 100, 100),
(416, 13, 'AOCT14-180508', 100, 100, 100, 100),
(417, 13, 'BMCA15-241108', 100, 100, 100, 100),
(418, 13, 'EACR14-260608', 100, 100, 100, 100),
(419, 13, 'YACA21-091208', 100, 100, 100, 100),
(420, 13, 'FDDM21-062707', 100, 100, 100, 100),
(421, 13, 'IJGL14-031008', 100, 100, 100, 100),
(422, 13, 'EAGL15-151108', 100, 100, 100, 100),
(423, 13, 'DAGS14-180908', 100, 100, 100, 100),
(424, 13, 'ECGG21-051209', 100, 100, 100, 100),
(425, 13, 'ATGF21-120608', 100, 100, 100, 100),
(426, 13, 'CGHG17-141109', 100, 100, 100, 100),
(427, 13, 'FJIP14-160409', 100, 100, 100, 100),
(428, 13, 'OFLA15-061108', 100, 100, 100, 100),
(429, 13, 'FJL21-030608', 100, 100, 100, 100),
(430, 13, 'YGL21-060308', 100, 100, 100, 100),
(431, 13, 'LMLC17-270611', 100, 100, 100, 100),
(432, 13, 'RSLM21-012808', 100, 100, 100, 100),
(433, 13, 'OJMA21-072408', 100, 100, 100, 100),
(434, 13, 'GTMC14-170209', 100, 100, 100, 100),
(435, 13, 'MRMM15-261108', 100, 100, 100, 100),
(436, 13, 'MAMM14-070808', 100, 100, 100, 100),
(437, 13, 'RRMT21-011008', 100, 100, 100, 100),
(438, 13, 'MAMV14-230408', 100, 100, 100, 100),
(439, 13, 'JSMP14-101208', 100, 100, 100, 100),
(440, 13, 'JMMC15-010109', 100, 100, 100, 100),
(441, 13, 'JEMG18-100609', 100, 100, 100, 100),
(442, 13, 'CAMM14-020109', 100, 100, 100, 100),
(443, 13, 'DANG16-100608', 100, 100, 100, 100),
(444, 13, 'ADNE14-020109', 100, 100, 100, 100),
(445, 13, 'TJPM21-033109', 100, 100, 100, 100),
(446, 13, 'MEQH15-170409', 100, 100, 100, 100),
(447, 13, 'MFRC14-310310', 100, 100, 100, 100),
(448, 13, 'SNRE21-041409', 100, 100, 100, 100),
(449, 13, 'JARG21-062609', 100, 100, 100, 100),
(450, 13, 'JGSR14-260608', 100, 100, 100, 100),
(451, 13, 'CISG16-280908', 100, 100, 100, 100),
(452, 13, 'AGZH16-200508', 100, 100, 100, 100),
(453, 13, 'BGZC14-310109', 100, 100, 100, 100),
(454, 14, 'AJAM20-2020', 100, 100, 100, 100),
(455, 14, 'DJAS14-020707', 100, 100, 100, 100),
(456, 14, 'GEBG14-020308', 100, 100, 100, 100),
(457, 14, 'ASBS20-200408', 100, 100, 100, 100),
(458, 14, 'AJBM19-180107', 100, 100, 100, 100),
(459, 14, 'EMBB20-060807', 100, 100, 100, 100),
(460, 14, 'ASCC20-170707', 100, 100, 100, 100),
(461, 14, 'JJCM14-120208', 100, 100, 100, 100),
(462, 14, 'AICH20-141106', 100, 100, 100, 100),
(463, 14, 'ALCC14-050208', 100, 100, 100, 100),
(464, 14, 'RSCA14-251007', 100, 100, 100, 100),
(465, 14, 'JFEA17-261007', 100, 100, 100, 100),
(466, 14, 'JAEC14-110308', 100, 100, 100, 100),
(467, 14, 'JAGD14-190408', 100, 100, 100, 100),
(468, 14, 'ASGG19-080108', 100, 100, 100, 100),
(469, 14, 'KLGH20-301007', 100, 100, 100, 100),
(470, 14, 'SAGL15-141007', 100, 100, 100, 100),
(471, 14, 'NAHB14-050707', 100, 100, 100, 100),
(472, 14, 'AJHR17-120907', 100, 100, 100, 100),
(473, 14, 'JALC14-090507', 100, 100, 100, 100),
(474, 14, 'GAMG14-230707', 100, 100, 100, 100),
(475, 14, 'MNMP14-010707', 100, 100, 100, 100),
(476, 14, 'GMMM21-091306', 100, 100, 100, 100),
(477, 14, 'NLMC14-301207', 100, 100, 100, 100),
(478, 14, 'MFNC14-160208', 100, 100, 100, 100),
(479, 14, 'SEOS14-241206', 100, 100, 100, 100),
(480, 14, 'EJOR21-130607', 100, 100, 100, 100),
(481, 14, 'DAOM14-180108', 100, 100, 100, 100),
(482, 14, 'MAOM15-130607', 100, 100, 100, 100),
(483, 14, 'ANPM14-070807', 100, 100, 100, 100),
(484, 14, 'EMRC14-270707', 100, 100, 100, 100),
(485, 14, 'JGRQ14-060707', 100, 100, 100, 100),
(486, 14, 'CARR14-201007', 100, 100, 100, 100),
(487, 14, 'AGRR14-311007', 100, 100, 100, 100),
(488, 14, 'JJSG15-010208', 100, 100, 100, 100),
(489, 14, 'BDUB14-040608', 100, 100, 100, 100),
(490, 14, 'SIVA17-030707', 100, 100, 100, 100),
(491, 14, 'ALVM14-100408', 100, 100, 100, 100),
(492, 15, 'JPAG14-210708', 100, 100, 100, 100),
(493, 15, 'CEAI20-280607', 100, 100, 100, 100),
(494, 15, 'JSAL14-140608', 100, 100, 100, 100),
(495, 15, 'PAAR14-030308', 100, 100, 100, 100),
(496, 15, 'GABJ20-120108', 100, 100, 100, 100),
(497, 15, 'EACA21-081106', 100, 100, 100, 100),
(498, 15, 'GNCJ20-290507', 100, 100, 100, 100),
(499, 15, 'DADH20-3082007', 100, 100, 100, 100),
(500, 15, 'EAEC14-220907', 100, 100, 100, 100),
(501, 15, 'YEGD14-150507', 100, 100, 100, 100),
(502, 15, 'DMGM14-060807', 100, 100, 100, 100),
(503, 15, 'SDGP20-1062008', 100, 100, 100, 100),
(504, 15, 'KEJA20-100407', 100, 100, 100, 100),
(505, 15, 'MVJO21-092905', 100, 100, 100, 100),
(506, 15, 'AAJA14-110707', 100, 100, 100, 100),
(507, 15, 'MNJB14-140807', 100, 100, 100, 100),
(508, 15, 'RALL14-041007', 100, 100, 100, 100),
(509, 15, 'CMLC14-150208', 100, 100, 100, 100),
(510, 15, 'KNLD21-180206', 100, 100, 100, 100),
(511, 15, 'MALM20-270806', 100, 100, 100, 100),
(512, 15, 'AJMQ14-270108', 100, 100, 100, 100),
(513, 15, 'VMMH14-040408', 100, 100, 100, 100),
(514, 15, 'NCMC14-270408', 100, 100, 100, 100),
(515, 15, 'SVMV20-140407', 100, 100, 100, 100),
(516, 15, 'NLMC16-301207', 100, 100, 100, 100),
(517, 15, 'MAMC20-191107', 100, 100, 100, 100),
(518, 15, 'SEMV20-190906', 100, 100, 100, 100),
(519, 15, 'AXOG14-051107', 100, 100, 100, 100),
(520, 15, 'ADPC16-231107', 100, 100, 100, 100),
(521, 15, 'EGPF14-020308', 100, 100, 100, 100),
(522, 15, 'YJPF14-091007', 100, 100, 100, 100),
(523, 15, 'MGRC20-241207', 100, 100, 100, 100),
(524, 15, 'CDRR14-211107', 100, 100, 100, 100),
(525, 15, 'JDRV18-060407', 100, 100, 100, 100),
(526, 15, 'CPRL14-221107', 100, 100, 100, 100),
(527, 15, 'AERO14-100605', 100, 100, 100, 100),
(528, 15, 'DARO17-201207', 100, 100, 100, 100),
(529, 15, 'MASH14-260308', 100, 100, 100, 100),
(530, 15, 'DGTF14-040408', 100, 100, 100, 100),
(531, 15, 'KSVM14-200808', 100, 100, 100, 100),
(532, 15, 'GMVR14-280508', 100, 100, 100, 100),
(533, 16, 'NGAG19-270906', 100, 100, 100, 100),
(534, 16, 'AAAE21-021707', 100, 100, 100, 100),
(535, 16, 'DSBM14-240805', 100, 100, 100, 100),
(536, 16, 'AACB14-170706', 100, 100, 100, 100),
(537, 16, 'SMCM14-270606', 100, 100, 100, 100),
(538, 16, 'RFCA14-051006', 100, 100, 100, 100),
(539, 16, 'DHDM14-140506', 100, 100, 100, 100),
(540, 16, 'ANEC14-130906', 100, 100, 100, 100),
(541, 16, 'JCGC20-180207', 100, 100, 100, 100),
(542, 16, 'NLGG14-271106', 100, 100, 100, 100),
(543, 16, 'FGGG14-200706', 100, 100, 100, 100),
(544, 16, 'MSGM14-160607', 100, 100, 100, 100),
(545, 16, 'LEJV14-260906', 100, 100, 100, 100),
(546, 16, 'JIMM18-110107', 100, 100, 100, 100),
(547, 16, 'MMMC14-080307', 100, 100, 100, 100),
(548, 16, 'AAOO14-101206', 100, 100, 100, 100),
(549, 16, 'MOT21-020220', 100, 100, 100, 100),
(550, 16, 'RJQP14-290307', 100, 100, 100, 100),
(551, 16, 'MERD14-191006', 100, 100, 100, 100),
(552, 16, 'AART14-081106', 100, 100, 100, 100),
(553, 16, 'LART20-301106', 100, 100, 100, 100),
(554, 16, 'NPSD17-100806', 100, 100, 100, 100),
(555, 16, 'FJTG14-120207', 100, 100, 100, 100),
(556, 16, 'BSUO14-050107', 100, 100, 100, 100),
(557, 17, 'AHAR21-042105', 100, 100, 100, 100),
(558, 17, 'DSBC17-030607', 100, 100, 100, 100),
(559, 17, 'AECB14-070806', 100, 100, 100, 100),
(560, 17, 'BNCM14-131206', 100, 100, 100, 100),
(561, 17, 'EGCF16-190307', 100, 100, 100, 100),
(562, 17, 'NSDD14-111207', 100, 100, 100, 100),
(563, 17, 'MEFG14-250506', 100, 100, 100, 100),
(564, 17, 'KAF21-', 100, 100, 100, 100),
(565, 17, 'MJFM19-080906', 100, 100, 100, 100),
(566, 17, 'FJGP19-010906', 100, 100, 100, 100),
(567, 17, 'JAGR14-191206', 100, 100, 100, 100),
(568, 17, 'RAGD14-231006', 100, 100, 100, 100),
(569, 17, 'JEHE14-270407', 100, 100, 100, 100),
(570, 17, 'AAHT19-221106', 100, 100, 100, 100),
(571, 17, 'EAMM14-010307', 100, 100, 100, 100),
(572, 17, 'AGMD14-160307', 100, 100, 100, 100),
(573, 17, 'AKMM14-080707', 100, 100, 100, 100),
(574, 17, 'AXOB19-310507', 100, 100, 100, 100),
(575, 17, 'LJPD17-221107', 100, 100, 100, 100),
(576, 17, 'MMTM19-090507', 100, 100, 100, 100),
(577, 17, 'JATO14-300407', 100, 100, 100, 100),
(578, 17, 'STTS14-210107', 100, 100, 100, 100),
(579, 17, 'EJVD14-070904', 100, 100, 100, 100),
(580, 18, 'RABL15-070805', 100, 100, 100, 100),
(581, 18, 'MACL14-100805', 100, 100, 100, 100),
(582, 18, 'MCCC14-191205', 100, 100, 100, 100),
(583, 18, 'AACP18-210506', 100, 100, 100, 100),
(584, 18, 'AFCO14-070805', 100, 100, 100, 100),
(585, 18, 'AJCD14-120206', 100, 100, 100, 100),
(586, 18, 'JCCT14-191105', 100, 100, 100, 100),
(587, 18, 'SAGM18-200605', 100, 100, 100, 100),
(588, 18, 'BJGM14-220406', 100, 100, 100, 100),
(589, 18, 'CMGP14-070606', 100, 100, 100, 100),
(590, 18, 'JAGM14-231005', 100, 100, 100, 100),
(591, 18, 'SAGO14-100805', 100, 100, 100, 100),
(592, 18, 'NNGG14-131205', 100, 100, 100, 100),
(593, 18, 'VAHS14-250406', 100, 100, 100, 100),
(594, 18, 'LDIG14-251005', 100, 100, 100, 100),
(595, 18, 'NSLF14-160306', 100, 100, 100, 100),
(596, 18, 'SSMR14-230606', 100, 100, 100, 100),
(597, 18, 'AJPM14-130206', 100, 100, 100, 100),
(598, 18, 'HIPH14-180506', 100, 100, 100, 100),
(599, 18, 'AJRM14-270406', 100, 100, 100, 100),
(600, 18, 'AARE14-051205', 100, 100, 100, 100),
(601, 18, 'VLRH20-150807', 100, 100, 100, 100),
(602, 18, 'CARM14-200406', 100, 100, 100, 100),
(603, 18, 'CMRC14-131105', 100, 100, 100, 100),
(604, 19, 'NMAC21-031206', 100, 100, 100, 100),
(605, 19, 'EABA14-020306', 100, 100, 100, 100),
(606, 19, 'JACA21-091604', 100, 100, 100, 100),
(607, 19, 'AJCM18-010606', 100, 100, 100, 100),
(608, 19, 'ANDA14-180406', 100, 100, 100, 100),
(609, 19, 'RAHT14-171005', 100, 100, 100, 100),
(610, 19, 'JMJR14-291005', 100, 100, 100, 100),
(611, 19, 'FALS14-170705', 100, 100, 100, 100),
(612, 19, 'BIMP14-031205', 100, 100, 100, 100),
(613, 19, 'EAMF14-010805', 100, 100, 100, 100),
(614, 19, 'LSMG14-170206', 100, 100, 100, 100),
(615, 19, 'AYNB14-171105', 100, 100, 100, 100),
(616, 19, 'HGNC14-170705', 100, 100, 100, 100),
(617, 19, 'OJOM14-070306', 100, 100, 100, 100),
(618, 19, 'GEPV14-070905', 100, 100, 100, 100),
(619, 19, 'MDPM14-090506', 100, 100, 100, 100),
(620, 19, 'JCRV18-010605', 100, 100, 100, 100),
(621, 19, 'BMRG14-020106', 100, 100, 100, 100),
(622, 19, 'RMSP20-260805', 100, 100, 100, 100),
(623, 19, 'JXSL14-040206', 100, 100, 100, 100),
(624, 19, 'JASA14-010705', 100, 100, 100, 100),
(625, 19, 'EMVL14-130106', 100, 100, 100, 100),
(626, 20, 'SCAI20-170704', 100, 100, 100, 100),
(627, 20, 'CAAR14-141204', 100, 100, 100, 100),
(628, 20, 'NVBA14-061004', 100, 100, 100, 100),
(629, 20, 'NDCP14-030904', 100, 100, 100, 100),
(630, 20, 'AICF16-151004', 100, 100, 100, 100),
(631, 20, 'LXCD14-210405', 100, 100, 100, 100),
(632, 20, 'LEDU15-130904', 100, 100, 100, 100),
(633, 20, 'CMEX14-170605', 100, 100, 100, 100),
(634, 20, 'ANFF14-020605', 100, 100, 100, 100),
(635, 20, 'SNGG14-180804', 100, 100, 100, 100),
(636, 20, 'MIGA14-130705', 100, 100, 100, 100),
(637, 20, 'AFGS14-201204', 100, 100, 100, 100),
(638, 20, 'FHGB20-110404', 100, 100, 100, 100),
(639, 20, 'ILJO14-090505', 100, 100, 100, 100),
(640, 20, 'JTLC14-101204', 100, 100, 100, 100),
(641, 20, 'AALN15-170204', 100, 100, 100, 100),
(642, 20, 'RYME14-080305', 100, 100, 100, 100),
(643, 20, 'SMMA14-170704', 100, 100, 100, 100),
(644, 20, 'EAPR15-020605', 100, 100, 100, 100),
(645, 20, 'AMRG14-051204', 100, 100, 100, 100),
(646, 20, 'JMRN14-270504', 100, 100, 100, 100),
(647, 20, 'BGRJ14-200504', 100, 100, 100, 100),
(648, 20, 'BARU14-050205', 100, 100, 100, 100),
(649, 20, 'SARL14-151004', 100, 100, 100, 100),
(650, 20, 'YAVP14-101104', 100, 100, 100, 100),
(651, 21, 'JAAG17-120704', 100, 100, 100, 100),
(652, 21, 'SECM17-251204', 100, 100, 100, 100),
(653, 21, 'AFCM16-210705', 100, 100, 100, 100),
(654, 21, 'MAFG17-131103', 100, 100, 100, 100),
(655, 21, 'SJLA17-111104', 100, 100, 100, 100),
(656, 21, 'VELC18-060703', 100, 100, 100, 100),
(657, 21, 'NBLM14-170405', 100, 100, 100, 100),
(658, 21, 'JIML17-221104', 100, 100, 100, 100),
(659, 21, 'DAOR21-060802', 100, 100, 100, 100),
(660, 21, 'RAPZ14-140704', 100, 100, 100, 100),
(661, 21, 'SMRB14-240405', 100, 100, 100, 100),
(662, 21, 'HRRJ14-200504', 100, 100, 100, 100),
(663, 21, 'VNRR19-180504', 100, 100, 100, 100),
(664, 21, 'AVSL14-300704', 100, 100, 100, 100),
(665, 21, 'AVSA17-010205', 100, 100, 100, 100),
(666, 21, 'GESS20-140605', 100, 100, 100, 100),
(667, 21, 'KBSA14-300405', 100, 100, 100, 100),
(668, 21, 'DSUM14-130705', 100, 100, 100, 100),
(669, 21, 'IRUD14-080105', 100, 100, 100, 100),
(670, 21, 'LCVC17-080805', 100, 100, 100, 100),
(671, 21, 'LEVC14-020904', 100, 100, 100, 100),
(672, 21, 'JCVC17-310804', 100, 100, 100, 100),
(673, 21, 'SNVO19-140105', 100, 100, 100, 100),
(674, 21, 'ALVM14-100205', 100, 100, 100, 100),
(676, 26, 'LR192720', 100, 100, 100, 75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicadoresparvularia`
--

CREATE TABLE `indicadoresparvularia` (
  `id` int(11) NOT NULL,
  `indicador` varchar(250) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `indicadoresparvularia`
--

INSERT INTO `indicadoresparvularia` (`id`, `indicador`) VALUES
(1, 'Reconoce a los miembros que conforman su familia (mamá, papá, hermanos)'),
(2, 'Discrimina el concepto de familia.'),
(3, 'Reconoce uno de sus deberes y lo expresa a través de colorear un dibujo'),
(4, 'Retiñe correctamente líneas rectas: Vertical'),
(7, 'Identifica los elementos que conforman una comunidad urbana y una comunidad rural');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicadores_materia`
--

CREATE TABLE `indicadores_materia` (
  `id` int(11) NOT NULL,
  `idUnion` int(11) NOT NULL,
  `idIndicador` int(11) NOT NULL,
  `idBimestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros`
--

CREATE TABLE `maestros` (
  `id` int(11) NOT NULL,
  `Nombres` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Genero` int(11) NOT NULL,
  `FechaNac` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `maestros`
--

INSERT INTO `maestros` (`id`, `Nombres`, `Apellidos`, `Genero`, `FechaNac`, `Email`) VALUES
(4, 'Adriana Auxiliadora', 'Rugama Corea', 1, '1976-05-17', 'adriana.rugama@cssjb.edu.ni'),
(5, 'Alina del Carmen', 'Martínez Largaespada', 1, '1973-01-02', 'alina.martinez@cssjb.edu.ni'),
(6, 'Alvaro José ', 'Cano Rosales', 0, '1975-08-27', 'alvaro.cano@cssjb.edu.ni'),
(7, 'Ayling Sloania', 'Quant', 1, '1986-04-30', 'ayling.quant@cssjb.edu.ni'),
(8, 'Blanca Azucena ', 'Tórrez Guadamuz', 1, '1985-01-19', 'blanca.torrez@cssjb.edu.ni'),
(9, 'Brahim Alejandro ', 'Salty Ortega', 0, '1994-12-21', 'brahim.salty@cssjb.edu.ni'),
(10, 'Carolina del Carmen', 'Abea García', 1, '1982-05-30', 'carolina.abea@cssjb.edu.ni'),
(11, 'Cintya Amanda', 'Morales Tellez', 1, '1987-12-12', 'cintya.morales@cssjb.edu.ni'),
(12, 'Claudia del Carmen', ' Torrez Chavarría', 1, '1972-04-11', 'claudia.torrez@cssjb.edu.ni'),
(13, 'Juan Miguel', 'Correa Sandino', 0, '1975-06-28', 'juan.correa@cssjb.edu.ni'),
(14, 'Hossman Johanssen', 'Cuadra Diaz', 0, '1994-07-02', 'hosman.cuadra@cssjb.edu.ni'),
(15, 'María Auxiliadora', 'Duarte López', 1, '1980-07-06', 'auxiliadora.duarte@cssjb.edu.ni'),
(16, 'Gustavo Adolfo', 'Fletes Hernández', 0, '1970-11-10', 'coordinacion.secundaria@cssjb.edu.ni'),
(17, 'Jairon José', 'Gutierrez Valladares', 0, '1975-05-20', 'jairon.gutierrez@cssjb.edu.ni'),
(18, 'Wilfredo José', 'Vallejos Herrera', 0, '1975-11-12', 'wilfredo.vallejos@cssjb.edu.ni'),
(19, 'Lorena de los Ángeles', 'Rivas Gonzalez', 1, '1979-01-21', 'lorena.rivas@cssjb.edu.ni'),
(20, 'Wilder Abadd', 'Hondoy Paladino', 0, '1979-07-11', 'wilder.hondoy@cssjb.edu.ni'),
(21, 'Wendy Auxiliadora', 'Calero Estrada', 1, '1981-07-13', 'wendy.calero@cssjb.edu.ni'),
(22, 'Lissett de los Ángeles', 'Robleto Cajina', 1, '1982-08-19', 'coordinacion.primaria@cssjb.edu.ni'),
(23, 'Cristhian Auxiliadora', 'Hurtado Duarte', 1, '1982-12-26', 'cristhian.hurtado@cssjb.edu.ni'),
(24, 'Fátima del Rosario', 'Mercado Mora', 1, '1986-04-30', 'fatima.mercado@cssjb.edu.ni'),
(25, 'Franklin Antonio', 'Gómez Dávila', 0, '1986-09-13', 'franklin.gomez@cssjb.edu.ni'),
(26, 'Fátima Azucena', 'Vanegas Martínez', 1, '1988-10-14', 'fatima.vanegas@cssjb.edu.ni'),
(27, 'Tania Xochilt', 'Guadamuz Martínez', 1, '1988-12-01', 'tania.guadamuz@cssjb.edu.ni'),
(28, 'Thania Auxiliadora', 'Mendoza Sánchez', 1, '1989-04-14', 'tania.mendoza@cssjb.edu.ni'),
(29, 'Luis Carlos', 'Rocha Carcache', 0, '1989-10-16', 'luis.rocha@cssjb.edu.ni'),
(30, 'Geovanny Francisco', 'Perez Córdoba', 0, '1989-12-01', 'geovanny.perez@cssjb.edu.ni'),
(31, 'Marcela José', 'Gómez Granizo', 1, '1990-04-02', 'coordinacion.preescolar@cssjb.edu.ni'),
(32, 'Lesly Manuel', 'Morales Montiel', 0, '1992-05-18', 'teacher.secundaria@cssjb.edu.ni'),
(33, 'Tania María', 'Alvarado Perez', 1, '1994-01-21', 'tania.alvarado@cssjb.edu.ni'),
(34, 'Ligia del Carmen', 'Salazar Acevedo', 1, '1999-01-31', 'ligia.salazar@cssjb.edu.ni'),
(35, 'Alejandro', 'Lacayo', 0, '1984-12-28', 'alejandro.lacayo@cssjb.edu.ni'),
(36, 'Roberto Jesús', 'Laniado Galvez', 0, '1995-09-21', 'roberto.laniado@cssjb.edu.ni');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros_materias`
--

CREATE TABLE `maestros_materias` (
  `id` int(11) NOT NULL,
  `idUnionGradoMateria` int(11) NOT NULL,
  `idMaestro` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `maestros_materias`
--

INSERT INTO `maestros_materias` (`id`, `idUnionGradoMateria`, `idMaestro`, `idGrado`) VALUES
(25, 17, 19, 12),
(26, 18, 8, 12),
(27, 19, 14, 12),
(28, 20, 14, 12),
(29, 21, 9, 12),
(30, 22, 20, 12),
(31, 23, 16, 12),
(32, 24, 18, 12),
(33, 25, 17, 12),
(34, 26, 9, 12),
(35, 27, 36, 12),
(36, 28, 19, 13),
(37, 29, 8, 13),
(38, 30, 14, 13),
(39, 31, 14, 13),
(40, 32, 20, 13),
(41, 33, 9, 13),
(42, 34, 16, 13),
(43, 35, 18, 13),
(44, 36, 17, 13),
(45, 37, 9, 13),
(46, 38, 36, 13),
(47, 49, 36, 14),
(48, 48, 9, 14),
(49, 47, 17, 14),
(50, 46, 18, 14),
(51, 45, 5, 14),
(52, 44, 6, 14),
(53, 43, 20, 14),
(54, 42, 14, 14),
(55, 41, 14, 14),
(56, 40, 32, 14),
(57, 39, 19, 14),
(58, 50, 19, 15),
(59, 52, 32, 15),
(60, 53, 14, 15),
(61, 51, 27, 22),
(62, 55, 14, 15),
(63, 57, 20, 15),
(64, 54, 34, 22),
(65, 58, 6, 15),
(66, 60, 5, 15),
(67, 62, 18, 15),
(68, 64, 17, 15),
(69, 65, 9, 15),
(70, 67, 36, 15),
(71, 56, 27, 22),
(72, 72, 19, 16),
(73, 73, 32, 16),
(74, 74, 14, 16),
(75, 75, 14, 16),
(76, 76, 20, 16),
(77, 77, 6, 16),
(78, 78, 5, 16),
(79, 79, 18, 16),
(80, 80, 13, 16),
(81, 81, 9, 16),
(82, 82, 36, 16),
(83, 83, 19, 17),
(84, 84, 32, 17),
(85, 85, 14, 17),
(86, 86, 14, 17),
(87, 87, 20, 17),
(88, 88, 6, 17),
(89, 89, 5, 17),
(90, 90, 18, 17),
(91, 91, 13, 17),
(92, 92, 9, 17),
(93, 93, 36, 17),
(94, 94, 11, 18),
(95, 95, 32, 18),
(96, 96, 14, 18),
(97, 97, 20, 18),
(98, 98, 9, 18),
(99, 99, 5, 18),
(100, 100, 18, 18),
(101, 101, 13, 18),
(102, 102, 13, 18),
(103, 103, 9, 18),
(104, 104, 35, 18),
(105, 105, 13, 16),
(106, 106, 13, 17),
(107, 107, 11, 19),
(108, 108, 32, 19),
(109, 109, 14, 19),
(110, 110, 20, 19),
(111, 111, 9, 19),
(112, 112, 5, 19),
(113, 113, 18, 19),
(114, 114, 13, 19),
(115, 115, 13, 19),
(116, 116, 9, 19),
(117, 117, 35, 19),
(118, 118, 11, 20),
(119, 119, 8, 20),
(120, 120, 14, 20),
(121, 121, 20, 20),
(122, 122, 9, 20),
(123, 123, 5, 20),
(124, 124, 13, 20),
(125, 125, 18, 20),
(126, 126, 13, 20),
(127, 127, 9, 20),
(128, 128, 35, 20),
(129, 59, 27, 22),
(130, 61, 27, 22),
(131, 63, 22, 22),
(132, 66, 29, 22),
(133, 129, 11, 21),
(134, 130, 8, 21),
(135, 68, 27, 22),
(136, 131, 14, 21),
(137, 132, 20, 21),
(138, 133, 9, 21),
(139, 134, 5, 21),
(140, 135, 17, 21),
(141, 69, 27, 22),
(142, 136, 18, 21),
(143, 70, 6, 22),
(144, 137, 13, 21),
(145, 138, 9, 21),
(146, 139, 35, 21),
(147, 71, 25, 22),
(148, 140, 10, 23),
(149, 141, 34, 23),
(150, 142, 10, 23),
(151, 143, 10, 23),
(152, 144, 10, 23),
(153, 145, 10, 23),
(154, 146, 29, 23),
(155, 147, 10, 23),
(156, 148, 10, 23),
(157, 149, 6, 23),
(158, 150, 25, 23),
(159, 151, 7, 24),
(160, 152, 34, 24),
(161, 153, 7, 24),
(162, 154, 7, 24),
(163, 155, 7, 24),
(164, 156, 7, 24),
(165, 157, 29, 24),
(166, 158, 7, 24),
(167, 159, 7, 24),
(168, 160, 6, 24),
(169, 161, 25, 24),
(170, 162, 21, 25),
(171, 163, 34, 25),
(172, 164, 21, 25),
(173, 165, 21, 25),
(174, 166, 21, 25),
(175, 167, 21, 25),
(176, 168, 29, 25),
(177, 169, 21, 25),
(178, 170, 21, 25),
(179, 171, 6, 25),
(180, 172, 25, 25),
(181, 173, 24, 26),
(182, 174, 34, 26),
(184, 176, 24, 26),
(186, 175, 26, 26),
(187, 177, 26, 26),
(188, 178, 26, 26),
(189, 179, 29, 26),
(190, 180, 26, 26),
(191, 181, 24, 26),
(192, 182, 6, 26),
(193, 183, 30, 26),
(194, 184, 24, 27),
(195, 185, 34, 27),
(196, 186, 26, 27),
(197, 187, 24, 27),
(198, 188, 24, 27),
(199, 189, 26, 27),
(200, 190, 29, 27),
(201, 191, 26, 27),
(202, 192, 24, 27),
(203, 193, 6, 27),
(204, 194, 30, 27),
(205, 195, 23, 28),
(206, 196, 8, 28),
(207, 197, 4, 28),
(208, 198, 23, 28),
(209, 199, 23, 28),
(210, 200, 4, 28),
(211, 201, 29, 28),
(212, 202, 4, 28),
(213, 203, 23, 28),
(214, 204, 6, 28),
(215, 205, 30, 28),
(216, 206, 23, 29),
(217, 207, 8, 29),
(218, 208, 4, 29),
(219, 209, 23, 29),
(220, 210, 4, 29),
(221, 211, 4, 29),
(222, 212, 29, 29),
(223, 213, 4, 29),
(224, 214, 23, 29),
(225, 215, 6, 29),
(226, 216, 30, 29),
(227, 217, 15, 30),
(228, 218, 8, 30),
(229, 219, 15, 30),
(231, 220, 12, 30),
(232, 221, 15, 30),
(233, 222, 15, 30),
(234, 223, 20, 30),
(235, 224, 12, 30),
(236, 225, 12, 30),
(237, 226, 6, 30),
(238, 227, 30, 30),
(239, 228, 15, 31),
(240, 229, 8, 31),
(241, 230, 12, 31),
(242, 231, 12, 31),
(243, 232, 15, 31),
(244, 233, 20, 31),
(245, 234, 12, 31),
(246, 235, 12, 31),
(247, 236, 6, 31),
(248, 237, 30, 31),
(249, 238, 15, 31),
(251, 173, 31, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_grado`
--

CREATE TABLE `materia_grado` (
  `id` int(11) NOT NULL,
  `idModeloMateria` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL,
  `EstadoAct1` int(11) NOT NULL,
  `EstadoAct2` int(11) NOT NULL,
  `EstadoAct3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `materia_grado`
--

INSERT INTO `materia_grado` (`id`, `idModeloMateria`, `idGrado`, `EstadoAct1`, `EstadoAct2`, `EstadoAct3`) VALUES
(17, 9, 12, 1, 1, 1),
(18, 10, 12, 1, 1, 1),
(19, 11, 12, 1, 1, 1),
(20, 12, 12, 1, 1, 1),
(21, 14, 12, 1, 1, 1),
(22, 13, 12, 1, 1, 1),
(23, 15, 12, 1, 1, 1),
(24, 18, 12, 1, 1, 1),
(25, 22, 12, 1, 1, 1),
(26, 23, 12, 1, 1, 1),
(27, 24, 12, 1, 1, 1),
(28, 9, 13, 1, 1, 1),
(29, 10, 13, 1, 1, 1),
(30, 11, 13, 1, 1, 1),
(31, 12, 13, 1, 1, 1),
(32, 13, 13, 1, 1, 1),
(33, 14, 13, 1, 1, 1),
(34, 15, 13, 1, 1, 1),
(35, 18, 13, 1, 1, 1),
(36, 22, 13, 1, 1, 1),
(37, 23, 13, 1, 1, 1),
(38, 24, 13, 1, 1, 1),
(39, 9, 14, 1, 1, 1),
(40, 10, 14, 1, 1, 1),
(41, 11, 14, 1, 1, 1),
(42, 12, 14, 1, 1, 1),
(43, 13, 14, 1, 1, 1),
(44, 14, 14, 1, 1, 1),
(45, 15, 14, 1, 1, 1),
(46, 18, 14, 1, 1, 1),
(47, 22, 14, 1, 1, 1),
(48, 23, 14, 1, 1, 1),
(49, 24, 14, 1, 1, 1),
(50, 9, 15, 1, 1, 1),
(51, 9, 22, 1, 1, 1),
(52, 10, 15, 1, 1, 1),
(53, 11, 15, 1, 1, 1),
(54, 10, 22, 1, 1, 1),
(55, 12, 15, 1, 1, 1),
(56, 11, 22, 1, 1, 1),
(57, 13, 15, 1, 1, 1),
(58, 14, 15, 1, 1, 1),
(59, 12, 22, 1, 1, 1),
(60, 15, 15, 1, 1, 1),
(61, 14, 22, 1, 1, 1),
(62, 26, 15, 1, 1, 1),
(63, 25, 22, 1, 1, 1),
(64, 22, 15, 1, 1, 1),
(65, 23, 15, 1, 1, 1),
(66, 13, 22, 1, 1, 1),
(67, 24, 15, 1, 1, 1),
(68, 22, 22, 1, 1, 1),
(69, 26, 22, 1, 1, 1),
(70, 23, 22, 1, 1, 1),
(71, 24, 22, 1, 1, 1),
(72, 9, 16, 1, 1, 1),
(73, 10, 16, 1, 1, 1),
(74, 11, 16, 1, 1, 1),
(75, 12, 16, 1, 1, 1),
(76, 13, 16, 1, 1, 1),
(77, 14, 16, 1, 1, 1),
(78, 15, 16, 1, 1, 1),
(79, 18, 16, 1, 1, 1),
(80, 22, 16, 1, 1, 1),
(81, 23, 16, 1, 1, 1),
(82, 24, 16, 1, 1, 1),
(83, 9, 17, 1, 1, 1),
(84, 10, 17, 1, 1, 1),
(85, 11, 17, 1, 1, 1),
(86, 12, 17, 1, 1, 1),
(87, 13, 17, 1, 1, 1),
(88, 14, 17, 1, 1, 1),
(89, 15, 17, 1, 1, 1),
(90, 18, 17, 1, 1, 1),
(91, 22, 17, 1, 1, 1),
(92, 23, 17, 1, 1, 1),
(93, 24, 17, 1, 1, 1),
(94, 9, 18, 1, 1, 1),
(95, 10, 18, 1, 1, 1),
(96, 12, 18, 1, 1, 1),
(97, 13, 18, 1, 1, 1),
(98, 14, 18, 1, 1, 1),
(99, 16, 18, 1, 1, 1),
(100, 19, 18, 1, 1, 1),
(101, 20, 18, 1, 1, 1),
(102, 22, 18, 1, 1, 1),
(103, 23, 18, 1, 1, 1),
(104, 24, 18, 1, 1, 1),
(105, 20, 16, 1, 1, 1),
(106, 20, 17, 1, 1, 1),
(107, 9, 19, 1, 1, 1),
(108, 10, 19, 1, 1, 1),
(109, 12, 19, 1, 1, 1),
(110, 13, 19, 1, 1, 1),
(111, 14, 19, 1, 1, 1),
(112, 16, 19, 1, 1, 1),
(113, 19, 19, 1, 1, 1),
(114, 20, 19, 1, 1, 1),
(115, 22, 19, 1, 1, 1),
(116, 23, 19, 1, 1, 1),
(117, 24, 19, 1, 1, 1),
(118, 9, 20, 1, 1, 1),
(119, 10, 20, 1, 1, 1),
(120, 12, 20, 1, 1, 1),
(121, 13, 20, 1, 1, 1),
(122, 14, 20, 1, 1, 1),
(123, 17, 20, 1, 1, 1),
(124, 20, 20, 1, 1, 1),
(125, 21, 20, 1, 1, 1),
(126, 22, 20, 1, 1, 1),
(127, 23, 20, 1, 1, 1),
(128, 24, 20, 1, 1, 1),
(129, 9, 21, 1, 1, 1),
(130, 10, 21, 1, 1, 1),
(131, 12, 21, 1, 1, 1),
(132, 13, 21, 1, 1, 1),
(133, 14, 21, 1, 1, 1),
(134, 17, 21, 1, 1, 1),
(135, 20, 21, 1, 1, 1),
(136, 21, 21, 1, 1, 1),
(137, 22, 21, 1, 1, 1),
(138, 23, 21, 1, 1, 1),
(139, 24, 21, 1, 1, 1),
(140, 9, 23, 1, 1, 1),
(141, 10, 23, 1, 1, 1),
(142, 11, 23, 1, 1, 1),
(143, 12, 23, 1, 1, 1),
(144, 14, 23, 1, 1, 1),
(145, 25, 23, 1, 1, 1),
(146, 13, 23, 1, 1, 1),
(147, 22, 23, 1, 1, 1),
(148, 26, 23, 1, 1, 1),
(149, 23, 23, 1, 1, 1),
(150, 24, 23, 1, 1, 1),
(151, 9, 24, 1, 1, 1),
(152, 10, 24, 1, 1, 1),
(153, 11, 24, 1, 1, 1),
(154, 12, 24, 1, 1, 1),
(155, 14, 24, 1, 1, 1),
(156, 25, 24, 1, 1, 1),
(157, 13, 24, 1, 1, 1),
(158, 22, 24, 1, 1, 1),
(159, 26, 24, 1, 1, 1),
(160, 23, 24, 1, 1, 1),
(161, 24, 24, 1, 1, 1),
(162, 9, 25, 1, 1, 1),
(163, 10, 25, 1, 1, 1),
(164, 11, 25, 1, 1, 1),
(165, 12, 25, 1, 1, 1),
(166, 14, 25, 1, 1, 1),
(167, 25, 25, 1, 1, 1),
(168, 13, 25, 1, 1, 1),
(169, 22, 25, 1, 1, 1),
(170, 26, 25, 1, 1, 1),
(171, 23, 25, 1, 1, 1),
(172, 24, 25, 1, 1, 1),
(173, 9, 26, 1, 1, 1),
(174, 10, 26, 1, 1, 1),
(175, 11, 26, 1, 1, 1),
(176, 12, 26, 1, 1, 1),
(177, 14, 26, 1, 1, 1),
(178, 25, 26, 1, 1, 1),
(179, 13, 26, 1, 1, 1),
(180, 22, 26, 1, 1, 1),
(181, 26, 26, 1, 1, 1),
(182, 23, 26, 1, 1, 1),
(183, 24, 26, 1, 1, 1),
(184, 9, 27, 1, 1, 1),
(185, 10, 27, 1, 1, 1),
(186, 11, 27, 1, 1, 1),
(187, 12, 27, 1, 1, 1),
(188, 14, 27, 1, 1, 1),
(189, 25, 27, 1, 1, 1),
(190, 13, 27, 1, 1, 1),
(191, 22, 27, 1, 1, 1),
(192, 26, 27, 1, 1, 1),
(193, 23, 27, 1, 1, 1),
(194, 24, 27, 1, 1, 1),
(195, 9, 28, 1, 1, 1),
(196, 10, 28, 1, 1, 1),
(197, 11, 28, 1, 1, 1),
(198, 12, 28, 1, 1, 1),
(199, 14, 28, 1, 1, 1),
(200, 25, 28, 1, 1, 1),
(201, 13, 28, 1, 1, 1),
(202, 22, 28, 1, 1, 1),
(203, 26, 28, 1, 1, 1),
(204, 23, 28, 1, 1, 1),
(205, 24, 28, 1, 1, 1),
(206, 9, 29, 1, 1, 1),
(207, 10, 29, 1, 1, 1),
(208, 11, 29, 1, 1, 1),
(209, 12, 29, 1, 1, 1),
(210, 14, 29, 1, 1, 1),
(211, 25, 29, 1, 1, 1),
(212, 13, 29, 1, 1, 1),
(213, 22, 29, 1, 1, 1),
(214, 26, 29, 1, 1, 1),
(215, 23, 29, 1, 1, 1),
(216, 24, 29, 1, 1, 1),
(217, 9, 30, 1, 1, 1),
(218, 10, 30, 1, 1, 1),
(219, 11, 30, 1, 1, 1),
(220, 12, 30, 1, 1, 1),
(221, 14, 30, 1, 1, 1),
(222, 25, 30, 1, 1, 1),
(223, 13, 30, 1, 1, 1),
(224, 22, 30, 1, 1, 1),
(225, 26, 30, 1, 1, 1),
(226, 23, 30, 1, 1, 1),
(227, 24, 30, 1, 1, 1),
(228, 9, 31, 1, 1, 1),
(229, 10, 31, 1, 1, 1),
(230, 12, 31, 1, 1, 1),
(231, 14, 31, 1, 1, 1),
(232, 25, 31, 1, 1, 1),
(233, 13, 31, 1, 1, 1),
(234, 22, 31, 1, 1, 1),
(235, 26, 31, 1, 1, 1),
(236, 23, 31, 1, 1, 1),
(237, 24, 31, 1, 1, 1),
(238, 11, 31, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE `matriculas` (
  `id` int(11) NOT NULL,
  `idAlumno` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `idYear` int(11) NOT NULL,
  `s3Key` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`id`, `idAlumno`, `idYear`, `s3Key`, `data`) VALUES
(17, 'AAAB17-140812', 2022, 'alumnos/AAAB17-140812/1634578231855.png', '{\"idYear\":\"2022\",\"carnet\":\"AAAB17-140812\",\"Nombres\":\"Aarón Alberto\",\"Apellidos\":\"Acevedo Blandón\",\"EmailMain\":\"aaron.acevedo@cssjb.edu.ni\",\"Direccion\":\"Direccion\",\"Sexo\":\"0\",\"Tel\":\"2278-0457\",\"FechaNac\":\"1998-08-18\",\"NombreMadre\":[\"-\",\"\"],\"CedulaMadre\":[\"-\",\"-\"],\"TelMadre\":[\"-\",\"---\"],\"EmailMadre\":[\"-\",\"-\"],\"NombreTutor\":\"--\",\"CedulaTutor\":\"-\",\"TelTutor\":\"-\",\"EmailTutor\":\"-\",\"ViveCon\":\"Ambos padres\",\"SiticionPadres\":\"Padres en unión sentimental\",\"ResEcono\":\"Solo de mamá\",\"idGrado\":\"32\",\"condicionMedica\":\"Salud\",\"idEstudiantes[]\":[\"AAAB17-140812\",\"ASCC20-170707\"]}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelomaterias`
--

CREATE TABLE `modelomaterias` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Siglas` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idArea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `modelomaterias`
--

INSERT INTO `modelomaterias` (`id`, `Nombre`, `Siglas`, `idArea`) VALUES
(9, 'Lengua y Literatura', 'ABC', 7),
(10, 'Lengua Extranjera (Inglés)', 'ABC', 7),
(11, 'Talleres de Arte y Cultura', 'ABC', 7),
(12, 'Creciendo en Valores', 'ABC', 9),
(13, 'Educación Física y Práctica Deportiva', 'ABC', 9),
(14, 'Educación para Aprender, Emprender, Prosperar', 'ABC', 9),
(15, 'Ciencias Sociales (Geografía / Historia)', 'ABC', 9),
(16, 'Ciencias Sociales (Geografía / Economía)', 'ABC', 9),
(17, 'Ciencias Sociales (Sociología / Filosofía)', 'ABC', 9),
(18, 'Ciencias Naturales', 'ABC', 8),
(19, 'Química', 'ABC', 8),
(20, 'Física', 'ABC', 8),
(21, 'Biología', 'ABC', 8),
(22, 'Matemática', 'ABC', 8),
(23, 'Tecnología Educativa', 'ABC', 8),
(24, 'Educación en la Fe', 'ABC', 8),
(25, 'Estudios Sociales (Historia / Geografía)', 'ABC', 9),
(26, 'Ciencias Naturales', 'ABC', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `Nota` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idAlumno` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `idAcumulado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_parvularia`
--

CREATE TABLE `notas_parvularia` (
  `id` int(11) NOT NULL,
  `NotaRole` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `idAlumno` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `idUnionMateriaIndicador` int(11) NOT NULL,
  `idUnionMateriaGrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observaciones`
--

CREATE TABLE `observaciones` (
  `id` int(11) NOT NULL,
  `idMaestro` int(11) NOT NULL,
  `idAlumno` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `idBimestre` int(11) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `date` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `observaciones`
--

INSERT INTO `observaciones` (`id`, `idMaestro`, `idAlumno`, `idBimestre`, `descripcion`, `date`) VALUES
(3, 31, 'JFSR15-270311', 16, 'fsdfsdfsd', ''),
(4, 31, 'LR192720', 16, 'fsdfsdfsdfdsfsd', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Username` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `Role` int(11) NOT NULL,
  `Estado` int(11) NOT NULL,
  `Permisos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Username`, `Password`, `Role`, `Estado`, `Permisos`) VALUES
('20212109-21', '$2b$10$xBk1AYVKaBJ.1viLKTepyed4WtFwYbvr7CK0i6Pu0QbsxXUnGcdlW', 2, 1, '{\"allPermisos\":true}'),
('AAAB17-140812', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAAD16-100510', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAAE21-021707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAAM14-101208', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AACB14-170706', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AACP18-210506', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AACR14-180609', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AACR17-141112', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAFG15-170708', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAGC14-060209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAGCS20-051013', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAHC17-170612', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAHT19-221106', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAJA14-110707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AALA21-101614', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AALN15-170204', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAME17-030810', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAML21-130316', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAMM20-090113', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAMM21-122314', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAMR14-220109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AAOO14-101206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AARA18-221211', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AARE14-051205', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AARM15-270210', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AÁRM21-090615', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AART14-081106', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ABTM19-041111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ACMD14-031209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ACMR16-080611', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ADHL15-290910', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('admin', '$2b$10$ss5uN3WvbPHvVvOdpA8FPeY7UCrStw58aYQbaWTzCOhpxabDIcYkK', 1, 1, '{\"allPermisos\":true}'),
('ADNE14-020109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ADPC16-231107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('adriana.rugama@cssjb.edu.ni', '$2b$10$lsd/FoR/eJVbzVU11Dps9OYWVzoZQ8LsOq165siGiFc6qktKsKw86', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('ADSA16-220911', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AECB14-070806', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AEMM14-230110', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AERO14-100605', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AEVS14-040309', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AFCM16-210705', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AFCO14-070805', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AFGS14-201204', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AFOE16-110411', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AGAS21-210615', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AGAU21-211016', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AGGP16-151011', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AGMB14-200409', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AGMD14-160307', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AGRC14-290510', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AGRR14-310707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AGZH16-200508', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AHAR21-042105', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AHGI17-240711', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AICC21-122514', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AICF16-151004', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AICH20-141106', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AICS21-270117', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJAM20-2020', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJAR14-230309', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJBM19-180107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJCB15-280211', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJCD14-120206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJCM18-010606', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJCO14-070709', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJDF16-060611', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJGX14-260609', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJHR17-120907', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJLH16-020711', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJMQ14-270108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJPM14-130206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJPM17-060112', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJRM14-270406', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJRM16-140212', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AJUA21-210616', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AKCP14-071009', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AKMM14-080707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ALCC14-050208', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('alejandro.lacayo@cssjb.edu.ni', '$2b$10$ixOxOVdEyoIDaQpBeyGMleai2DgadpaSG7ybgEtqYTF6HijrQALA6', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('alina.martinez@cssjb.edu.ni', '$2b$10$xK35Ltfqps0wiIg/ozUcoeRssHTvnmf3xVt9dlj.mt8C2eTJOw6vC', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('alvaro.cano@cssjb.edu.ni', '$2b$10$koJ.4Nbm130AQuNZ7Zja2es1UGmk5UsJ2jg8DA7ViKQWGhM3g03h6', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('ALVM14-100205', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ALVM14-100408', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AMAV21-090308', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AMBH17-181012', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AMCR17-280612', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AMLM14-170709', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AMRG14-051204', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ANCL21-090514', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ANCO21-110608', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ANDA14-180406', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ANEC14-130906', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ANFF14-020605', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ANPM14-070807', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ANPM15-240810', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ANSG21-010815', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AOCT14-180508', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('APOD16-020509', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ARCC17-181012', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ARMM15-230411', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ASBR17-010710', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ASBS20-200408', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ASCC20-170707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ASGG19-080108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ASM21-030311', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ASR21-121811', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ATFC14-110809', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ATGF21-120608', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('auxiliadora.duarte@cssjb.edu.ni', '$2b$10$COEEK0R2uKtfzIGWe5t3weO.br2WFsBWz8tgF/a.2zI3UPrKLriFK', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('AVGA21-090617', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AVPO19-264200', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AVSA17-010205', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AVSL14-300704', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AXMF14-260908', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AXOB19-310507', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AXOG14-051107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AXSD19-100909', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('AYEG17-130612', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ayling.quant@cssjb.edu.ni', '$2b$10$DO7YgXKbomeFDV5wyz7KBuxN4BERwNZKoKVmeBNUBELr9UUav4LkC', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('AYNB14-171105', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BAAG19-181109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BARU14-050205', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BAVA16-311210', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BBGP21-101014', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BBUS21-210716', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BDUB14-040608', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BFBD17-140812', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BGRJ14-200504', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BGSÁ21-270615', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BGZC14-310109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BIMP14-031205', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BJGM14-220406', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BJOB14-021108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BJSM16-290811', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('blanca.torrez@cssjb.edu.ni', '$2b$10$w4KgbmQK5i6hRK58Yzy4SeJQyp/KYVfuntFnsg27aprMAI8dSiYFO', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('BMCA15-241108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BMCB14-190809', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BMRG14-020106', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BNCM14-131206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BNMD15-281010', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('brahim.salty@cssjb.edu.ni', '$2b$10$N9BQQjplZWWX37yMJzj6c.Ldhhp1HIn4yE5UZwidSSq8l4Sg4mD4q', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('BSUO14-050107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('BXCG15-070710', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CAAR14-141204', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CAHB21-291215', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CALR18-070309', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CAMM14-020109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CARM14-200406', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('carolina.abea@cssjb.edu.ni', '$2b$10$unvuKjnz/y8pH0FMsAlfv.p5IfQbQIfDJhVueAkeR5du3x.vh1m2u', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('CARR14-201007', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CASA14-050909', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CAVL14-210708', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CCRM17-180613', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CDMJ19-220214', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CDRR14-211107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CEAI20-280607', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CFCL14-271107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CFGX14-020908', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CGCC21-041011', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CGHG17-141109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CHCB15-290110', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CICP17-200213', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('cintya.morales@cssjb.edu.ni', '$2b$10$PtJ/W7ReCxb1OpR2Chc9ZusbYVW8TUtburBZ/uD2a6bW2.WigJRPK', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('CISG16-280908', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CJFJ21-122814', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CJRD19-161009', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('claudia.torrez@cssjb.edu.ni', '$2b$10$nNWQFgv/FdsFre5otTUej.yGPvErchiGIAaw2qY4fK97RPMblxDlC', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('CMAM15-100109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CMDL20-140416', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CMEX14-170605', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CMGP14-070606', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CMLC14-150208', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CMRC14-131105', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('coordinacion.preescolar@cssjb.edu.ni', '$2b$10$gkiOY622c0LOI6xnoV2hDOVHSe09aNAsJkO5PAZv7VOKzCdou6jqe', 3, 0, '{\"matricula\":true,\"indicadores\":true}'),
('coordinacion.primaria@cssjb.edu.ni', '$2b$10$WyDABcUeAvgmiDYC/OgWMOUTDRxFL9kjaZr5L1Ejvcj8IXHyR3v6a', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('coordinacion.secundaria@cssjb.edu.ni', '$2b$10$AHAPW.gQNvDu65aPkEcMteb0V6rJQ0qvipNtzsQWcqb6G6QqcRlcC', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('CPRL14-221107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CRCM21-082214', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('cristhian.hurtado@cssjb.edu.ni', '$2b$10$e.t7cn.ETggz4Yb3HvRRYu91WIOGESbD8RtIXGgaVllEqL.L5.fvq', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('CRLE20-270912', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('CSOT15-080808', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DABG21-092814', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DABM16-220511', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DACC19-210213', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DACU18-141113', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DADH20-3082007', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAGC17-080513', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAGC17-271212', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAGS14-180908', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DALD16-151111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAMM21-092314', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAMX15-010111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DANG16-100608', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAOM14-180108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAOO17-010613', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAOR21-060802', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DARO17-201207', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAUC21-270715', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DAVB17-240513', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DFBA21-010715', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DFCA21-101110', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DFGL20-250414', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DFRO17-041107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DGBR21-230515', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DGEG15-110710', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DGPG19-060214', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DGTF14-040408', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DHDM14-140506', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DIJS14-270209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DJAS14-020707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DJCA21-040117', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DJCS21-042709', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DJHO21-120515', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DMGM14-060807', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DRUD14-180809', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DSBC17-030607', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DSBC18-071013', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DSBM14-240805', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DSUM14-130705', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DTVM14-020510', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DVRB16-180711', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('DZGR21-022315', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EAAN21-210316', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EABA14-020306', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EABR16-120412', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EACA21-081106', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EACL18-310813', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EACR14-260608', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EADC18-200813', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EAEC14-220907', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EAGC17-300812', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EAGL15-151108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EAJR14-240309', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EAMF14-010805', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EAMM14-010307', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EAPR15-020605', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EARJ17-221212', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EASS21-122612', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ECGG21-051209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ECOM15-170410', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EDAA15-091109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EEDH21-041115', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EEMF17-230312', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EFCV17-300912', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EFLB19-240712', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EGAH17-211111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EGCF16-190307', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EGCG16-130312', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EGGC21-120916', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EGPF14-020308', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EIUJ16-200909', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EJML14-020909', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EJMU16-151111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EJOR21-130607', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EJPR16-261209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EJVD14-070904', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ELAC16-270111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EMBB20-060807', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EMDZ18-130214', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EMRC14-270707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EMVL14-130106', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ESBO21-180615', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ESCR21-071714', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ESEG18-170114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ESGA21-170715', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('EXLC17-270611', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FAFA16-271211', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FAGS16-231010', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FALM20-221007', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FALS14-170705', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FAMC19-290813', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('fatima.mercado@cssjb.edu.ni', '$2b$10$JlFSdOn5AWbEWAkp2XMv7eGI2/OdbBrTBcXs0lM8kCDpfirngIeIO', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('fatima.vanegas@cssjb.edu.ni', '$2b$10$XXJGp8pHBhe8uG.6CMtSeusCy7SpXAQ5qr0vQkqtT/cDhOt59R.Mm', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('FCME21-022114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FDCC15-240111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FDDM21-062707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FGGG14-200706', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FHGB20-110404', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FJGP19-010906', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FJIP14-160409', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FJL21-030608', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FJLM18-030212', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FJTG14-120207', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FMDM18-080114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('franklin.gomez@cssjb.edu.ni', '$2b$10$lRplU1KTvV.6OTjTZ.HLBuqZ07CDnjJg1n8nC8fo9DU1fnlAqsRW6', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('FSMG19-170314', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FSSG14-210510', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('FXGG15-300409', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GABH16-170809', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GABJ20-120108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GACJ21-032315', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GACL15-240211', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GAGL21-081314', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GAMG14-230707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GAMS19-180612', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GEBG14-020308', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('geovanny.perez@cssjb.edu.ni', '$2b$10$i4mr.Alju.J4PJWFh4XyqOWecQtJ9mFM4uF4QUGgtXM6uTtBSV4oO', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('GEPV14-070905', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GESS20-140605', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GEUS17-090413', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GGAS18-040114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GGOR21-290417', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GJJO14-281009', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GMMM16-060610', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GMMM21-091306', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GMVR14-280508', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GNCJ20-290507', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GSCG21-240517', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GTMC14-170209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('GVGR17-180512', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('HAOO21-160916', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('HEPC16-091109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('HFNB16-080411', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('HGNC14-170705', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('HIPH14-180506', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('HJRR14-250909', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('HNNM21-020711', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('hosman.cuadra@cssjb.edu.ni', '$2b$10$lwrUQkg9IbC2OcXxNHQ2YeqBIl.I.d8wFzybJ2.Fuw3X12Y3Uew0G', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('HRRJ14-200504', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('HSCM21-120716', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IALÓ21-250516', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IALS19-150114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IAOM16-220508', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IARR17-250313', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IEVR15-210311', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IGMS21-032015', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IGRL19-110414', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IILC16-231211', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IJGL14-031008', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IJGO15-280210', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IJRO21-091215', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ILJO14-090505', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IRUD14-080105', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('IXSD19-100909', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAAG17-120704', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JACA21-091604', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JACO14-020809', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JACT14-010210', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JACT17-260711', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAEC14-110308', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAGA14-211008', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAGD14-190408', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAGM14-231005', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAGR14-191206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('jairon.gutierrez@cssjb.edu.ni', '$2b$10$rWjIoKeqWWnwPGQw0TJf2.4F.E9eyhrvXHqx6EP0TUkCT06dqY15W', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('JALC14-090507', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JALL19-010513', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAMC15-140610', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAPR21-081614', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAPT21-290716', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JARG21-062609', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JARO21-021115', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JASA14-010705', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JASR16-140511', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JATO14-300407', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JAUX16-120412', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JBMM14-240709', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JCCT14-191105', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JCGC20-180207', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JCRL15-050210', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JCRU21-290615', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JCRV18-010605', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JCVC17-310804', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JDAA18-200813', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JDBN18-081113', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JDGI20-020608', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JDGU15-160710', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JDMM18-160114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JDPR17-260710', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JDQA17-220513', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JDRV18-060407', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JEGP21-070411', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JEHE14-270407', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JEMA21-080915', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JEMG18-100609', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JENT16-150709', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JEOS15-271109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JFDB21-061108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JFEA17-261007', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JFFS15-240308', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JFSR15-270311', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JGRQ14-060707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JGRS19-270411', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JGSR14-260608', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JHGR16-170411', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JICC14-180909', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JICV16-250510', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JIGP17-220512', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JIML17-221104', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JIMM18-110107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JISC16-180211', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JISM21-290915', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JJCM14-120208', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JJMG15-011209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JJML17-100910', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JJSG15-010208', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JJVM21-062114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JLMP14-240109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JMER15-081010', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JMJR14-291005', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JMMC15-010109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JMMG21-200117', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JMOU14-121209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JMRN14-270504', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JODG21-271116', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JPAG14-210708', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JSAL14-140608', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JSFM21-071014', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JSGM15-101210', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JSMP14-101208', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JSSM17-010812', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JTLC14-101204', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JTLV15-140410', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JTOR14-231009', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('JTTF18-200414', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('juan.correa@cssjb.edu.ni', '$2b$10$hvXe8oXwk7Pj6ugKvwSU/OLv.MXRHQmRro4t0boDwy5y8Ng.Ze1ES', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('JXSL14-040206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KABA18-050912', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KÁCC21-080416', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KACT16-151011', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KAF21-', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KAFL18-250112', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KAGH21-080515', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KAPH20-100511', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KBSA14-300405', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KCLE18-201209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KDRR18-060912', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KEJA20-100407', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KFGA18-141213', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KFRV17-020812', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KGMQ14-200808', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KGMS15-190809', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KLGH20-301007', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}');
INSERT INTO `usuarios` (`Username`, `Password`, `Role`, `Estado`, `Permisos`) VALUES
('KNLD21-180206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KSCH16-190111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KSGO21-211015', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KSHO15-171109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KSVM14-200808', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KTMV21-070214', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('KXMG20-210813', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LABV21-061708', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LACO16-210212', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LAMC21-110216', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LART20-301106', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LBM21-022713', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LCBH18-281013', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LCVC17-080805', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LDIG14-251005', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LECM21-151116', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LEDU15-130904', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LEJV14-260906', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LEVC14-020904', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LGCB21-041115', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LGCG16-150811', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LGMG16-230911', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LIGA21-130516', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ligia.salazar@cssjb.edu.ni', '$2b$10$IFjVpdPLd8NmKqVMpH3vr.DxLNbev11lbp1ntPfitbaHwTNlptuga', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('LJPD17-221107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LMLC17-270611', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LMSH17-080313', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('lorena.rivas@cssjb.edu.ni', '$2b$10$LSVzqBaDwvpWy.DJynUrNOB.6wbO7h0Tb..NJxlraMZvDQHoooJVG', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('LR192720', '$2b$10$GADtC.oC/kGkcM20CabKOuzbWGzMUz6PYHZAMQNJYpp2hL15Byn1.', 2, 1, '{\"allPermisos\":true}'),
('LRHM17-110408', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LSC21-032615', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LSGS16-151011', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LSMG14-170206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LSSS21-280216', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('luis.rocha@cssjb.edu.ni', '$2b$10$.2dbgQWpY/KlRWTiWIfhaOCrM46nsYkjMjCyKsh6k9VFF9mjCKHT6', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('LXCD14-210405', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('LXGX15-170109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MABG14-150609', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MACF17-260112', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MACL14-100805', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MACM21-070217', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MACO21-210216', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAEA21-020311', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAFG17-131103', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAGC18-040812', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAGP21-150217', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAJR17-070113', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MALM20-270806', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAMB16-161111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAMC20-191107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAMC20-542010', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAMM14-070808', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAMT15-291110', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAMV14-230408', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAOC15-270810', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAOM15-130607', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAPO19-020114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAQH16-030311', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MARA14-040909', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MARA16-150811', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MARM14-091008', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MARR16-090711', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MARR17-140213', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MASG19-180912', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MASH14-260308', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MASM16-050711', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MAVP14-260109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MCAX21-280815', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MCCC14-191205', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MCDR15-030410', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MCMC14-090410', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MDCC14-030708', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MDPM14-090506', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MDRM14-300110', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MEFG14-250506', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MEFN15-210111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MEQH15-170409', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MERD14-191006', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MESZ17-060413', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MFCG16-250811', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MFNC14-160208', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MFRC14-310310', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MGAR18-130612', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MGGL19-270112', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MGLM21-103114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MGMR20-041013', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MGOV16-221011', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MGQU21-271115', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MGRC20-241207', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MIGA14-130705', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MIHO17-161112', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MISH15-190310', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MJFM19-080906', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MJLH19-211011', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MJUO16-120609', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MKMG18-221013', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MMBM21-111214', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MMMC14-080307', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MMNG21-050814', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MMNV16-200511', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MMTM19-090507', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MMUO16-230911', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MNJB14-140807', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MNMP14-010707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MOT21-020220', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MRBG21-121216', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MRMM15-261108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MRTC21-281216', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MSGM14-160607', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MSMM17-170412', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MSRT17-150313', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MVJO21-092905', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MVMD15-281010', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('MYGR16-091208', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NAHB14-050707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NAMM17-240511', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NAMM21-150615', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NBLM14-170405', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NCMC14-270408', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NDCP14-030904', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NGAG19-270906', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NGSJ21-190216', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NJCB21-092214', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NLGG14-271106', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NLMC14-301207', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NLMC16-301207', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NMAC21-031206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NNGG14-131205', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NPSD17-100806', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NSDD14-111207', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NSLF14-160306', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NSML18-260214', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('NVBA14-061004', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('OFLA15-061108', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('OJEG15-141210', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('OJHC14-040110', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('OJMA21-072408', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('OJOM14-070306', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('OMOS17-010912', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ORV21-040414', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('OYHR19-230913', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('PAAR14-0360308', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('PEMC14-250309', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('PJFR16-030708', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RABL15-070805', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RAFA11-021014', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RAGD14-231006', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RAHT14-171005', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RALL14-041007', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RAMC20-552010', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RAMC21-040114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RAMR14-010310', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RAPZ14-140704', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RFBC16-070310', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RFCA14-051006', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RIHU17-260213', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RJQP14-290307', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RMAU17-220512', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RMSP20-260805', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('roberto.laniado@cssjb.edu.ni', '$2b$10$K03s7Gie.VZ3tsr58JH6QOpUM87amzbk.7aByZv25ILWLF0UpX4VG', 3, 1, '{\"matricula\":true,\"indicadores\":false}'),
('RRIG16-300312', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RRMT21-011008', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RSCA14-251007', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RSLM21-012808', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RSPC21-150816', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RVGR14-020709', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('RYME14-080305', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SAAB21-190515', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SAAH17-211111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SACC15-250508', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SAGL15-141007', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SAGM18-200605', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SAGO14-100805', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SAHL21-080416', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SAMN21-081114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SARL14-151004', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SAUT21-220816', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SCAI20-170704', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SDGA21-101110', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SDGP20-1062008', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SECM17-251204', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SEMV20-190906', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SEOS14-241206', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SGPF21-260416', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SGVO18-311012', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SIVA17-030707', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SJLA17-111104', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SJMG21-230516', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SJRR17-150711', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SMBA16-120312', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SMCM14-270606', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SMMA14-170704', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SMRB14-240405', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SNFG16-260510', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SNGA19-040711', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SNGG14-180804', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SNMM16-011010', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SNRE21-041409', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SNVO19-140105', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SSMC14-290310', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SSMR14-230606', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('STTS14-210107', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SVMV20-140407', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SYAL21-051714', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('SYNÚ21-061214', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('TAHL15-120210', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('tania.alvarado@cssjb.edu.ni', '$2b$10$outNMXOpiJgbQARWde6a6uk.mtW4mZYXQrugqTLayzAwSwsj6GR1e', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('tania.guadamuz@cssjb.edu.ni', '$2b$10$DN1l2tRWu2lR7oQW18Ox/eOE8H0O0l/4FZu1IVzFcFxqdYXnXVV5.', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('tania.mendoza@cssjb.edu.ni', '$2b$10$m.S7aSF5dJPmIc1IxZF8seQ6ZMJTabbyUq2fhS3s4QPdcUG.hv0XG', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('teacher.secundaria@cssjb.edu.ni', '$2b$10$laa4gw7hntUKhHB7CpMgWOLgK8Wx.hs3aMWeEMFtmvlZQO.XQo9Cm', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('TGOP20-1912012', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('TJPM21-033109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('TMBM14-140209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('TNMC19-020114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('TSAR21-101015', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('UJBG16-091111', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('VAHS14-250406', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('VELC18-060703', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('VFAM17-201112', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('VGBL18-220813', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('VLRH20-150807', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('VMMH14-040408', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('VMRD17-240611', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('VNRR19-180504', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('WCCC16-190312', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('wendy.calero@cssjb.edu.ni', '$2b$10$42MD.yYi/PRwKlrwMcUwpuDr7PCuMk6vZqphHYDsJARNzQSuRbbry', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('wilder.hondoy@cssjb.edu.ni', '$2b$10$LFRoHEgS27giDY9ku6cpAudaToqaFy8hvrCwJFmytpGXxCEI0GvAO', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('wilfredo.vallejos@cssjb.edu.ni', '$2b$10$OHSsu7o4XA/r1L10z8J9JOcu4v.hJAy7RP5simWpdHBptYpOwRH0q', 3, 1, '{\"matricula\":false,\"indicadores\":false}'),
('WJSJ15-281210', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YACA21-091208', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YAVP14-101104', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YEGD14-150507', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YEVR17-181109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YGL21-060308', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YJPB15-060410', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YJPF14-091007', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YMCG21-290915', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YSHR15-071109', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YYOO16-260508', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('YYZC21-030915', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ZAGI18-161209', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}'),
('ZVUT21-102114', '$2b$10$2hMWRejhLbA6Z8CweWfqpeCCuxdmJlLttt5/ieTRxaI8fK4ElLV.2', 2, 1, '{\"allPermisos\":true}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `year`
--

CREATE TABLE `year` (
  `year` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `year`
--

INSERT INTO `year` (`year`, `estado`) VALUES
(2021, 1),
(2022, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMaestro` (`idMaestro`),
  ADD KEY `Bimestre` (`Bimestre`),
  ADD KEY `unionMateriaGrado` (`unionMateriaGrado`);

--
-- Indices de la tabla `acumulados`
--
ALTER TABLE `acumulados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idActividad` (`idActividad`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`Carnet`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bimestres`
--
ALTER TABLE `bimestres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idYear` (`idYear`);

--
-- Indices de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigos`
--
ALTER TABLE `codigos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigo_alumno`
--
ALTER TABLE `codigo_alumno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBimestre` (`idBimestre`),
  ADD KEY `idCodigo` (`idCodigo`),
  ADD KEY `idMaestro` (`idMaestro`),
  ADD KEY `idAlumno` (`idAlumno`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grados_ibfk_2` (`idYear`),
  ADD KEY `idCiclo` (`idCiclo`);

--
-- Indices de la tabla `grado_alumno`
--
ALTER TABLE `grado_alumno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grado_alumno_ibfk_1` (`idAlumno`),
  ADD KEY `grado_alumno_ibfk_2` (`idGrado`);

--
-- Indices de la tabla `indicadoresparvularia`
--
ALTER TABLE `indicadoresparvularia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `indicadores_materia`
--
ALTER TABLE `indicadores_materia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idIndicador` (`idIndicador`),
  ADD KEY `idUnion` (`idUnion`),
  ADD KEY `idBimestre` (`idBimestre`);

--
-- Indices de la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maestros_materias`
--
ALTER TABLE `maestros_materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUnionGradoMateria` (`idUnionGradoMateria`),
  ADD KEY `idMaestro` (`idMaestro`),
  ADD KEY `idGrado` (`idGrado`);

--
-- Indices de la tabla `materia_grado`
--
ALTER TABLE `materia_grado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idGrado` (`idGrado`),
  ADD KEY `idModeloMateria` (`idModeloMateria`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idYear` (`idYear`),
  ADD KEY `idAlumno` (`idAlumno`);

--
-- Indices de la tabla `modelomaterias`
--
ALTER TABLE `modelomaterias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modelomaterias_ibfk_1` (`idArea`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAcumulado` (`idAcumulado`),
  ADD KEY `idAlumno` (`idAlumno`);

--
-- Indices de la tabla `notas_parvularia`
--
ALTER TABLE `notas_parvularia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAlumno` (`idAlumno`),
  ADD KEY `idUnionMateriaIndicador` (`idUnionMateriaIndicador`),
  ADD KEY `idUnionMateriaGrado` (`idUnionMateriaGrado`);

--
-- Indices de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAlumno` (`idAlumno`),
  ADD KEY `idBimestre` (`idBimestre`),
  ADD KEY `idMaestro` (`idMaestro`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Username`);

--
-- Indices de la tabla `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`year`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `acumulados`
--
ALTER TABLE `acumulados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `bimestres`
--
ALTER TABLE `bimestres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `codigos`
--
ALTER TABLE `codigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `codigo_alumno`
--
ALTER TABLE `codigo_alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `grado_alumno`
--
ALTER TABLE `grado_alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=677;

--
-- AUTO_INCREMENT de la tabla `indicadoresparvularia`
--
ALTER TABLE `indicadoresparvularia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `indicadores_materia`
--
ALTER TABLE `indicadores_materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `maestros`
--
ALTER TABLE `maestros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `maestros_materias`
--
ALTER TABLE `maestros_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT de la tabla `materia_grado`
--
ALTER TABLE `materia_grado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `modelomaterias`
--
ALTER TABLE `modelomaterias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `notas_parvularia`
--
ALTER TABLE `notas_parvularia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actividades_ibfk_2` FOREIGN KEY (`Bimestre`) REFERENCES `bimestres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actividades_ibfk_3` FOREIGN KEY (`unionMateriaGrado`) REFERENCES `materia_grado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `acumulados`
--
ALTER TABLE `acumulados`
  ADD CONSTRAINT `acumulados_ibfk_1` FOREIGN KEY (`idActividad`) REFERENCES `actividades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bimestres`
--
ALTER TABLE `bimestres`
  ADD CONSTRAINT `bimestres_ibfk_1` FOREIGN KEY (`idYear`) REFERENCES `year` (`year`);

--
-- Filtros para la tabla `codigo_alumno`
--
ALTER TABLE `codigo_alumno`
  ADD CONSTRAINT `codigo_alumno_ibfk_1` FOREIGN KEY (`idBimestre`) REFERENCES `bimestres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `codigo_alumno_ibfk_2` FOREIGN KEY (`idCodigo`) REFERENCES `codigos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `codigo_alumno_ibfk_3` FOREIGN KEY (`idMaestro`) REFERENCES `maestros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `codigo_alumno_ibfk_4` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`Carnet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grados`
--
ALTER TABLE `grados`
  ADD CONSTRAINT `grados_ibfk_2` FOREIGN KEY (`idYear`) REFERENCES `year` (`year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grados_ibfk_3` FOREIGN KEY (`idCiclo`) REFERENCES `ciclos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grado_alumno`
--
ALTER TABLE `grado_alumno`
  ADD CONSTRAINT `grado_alumno_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`Carnet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grado_alumno_ibfk_2` FOREIGN KEY (`idGrado`) REFERENCES `grados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `indicadores_materia`
--
ALTER TABLE `indicadores_materia`
  ADD CONSTRAINT `indicadores_materia_ibfk_1` FOREIGN KEY (`idIndicador`) REFERENCES `indicadoresparvularia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `indicadores_materia_ibfk_2` FOREIGN KEY (`idUnion`) REFERENCES `materia_grado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `indicadores_materia_ibfk_3` FOREIGN KEY (`idBimestre`) REFERENCES `bimestres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `maestros_materias`
--
ALTER TABLE `maestros_materias`
  ADD CONSTRAINT `maestros_materias_ibfk_1` FOREIGN KEY (`idUnionGradoMateria`) REFERENCES `materia_grado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maestros_materias_ibfk_2` FOREIGN KEY (`idMaestro`) REFERENCES `maestros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maestros_materias_ibfk_3` FOREIGN KEY (`idGrado`) REFERENCES `grados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materia_grado`
--
ALTER TABLE `materia_grado`
  ADD CONSTRAINT `materia_grado_ibfk_1` FOREIGN KEY (`idGrado`) REFERENCES `grados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materia_grado_ibfk_2` FOREIGN KEY (`idModeloMateria`) REFERENCES `modelomaterias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`idYear`) REFERENCES `year` (`year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`Carnet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelomaterias`
--
ALTER TABLE `modelomaterias`
  ADD CONSTRAINT `modelomaterias_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`idAcumulado`) REFERENCES `acumulados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`Carnet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notas_parvularia`
--
ALTER TABLE `notas_parvularia`
  ADD CONSTRAINT `notas_parvularia_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`Carnet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_parvularia_ibfk_2` FOREIGN KEY (`idUnionMateriaIndicador`) REFERENCES `indicadores_materia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_parvularia_ibfk_3` FOREIGN KEY (`idUnionMateriaGrado`) REFERENCES `materia_grado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD CONSTRAINT `observaciones_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`Carnet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `observaciones_ibfk_2` FOREIGN KEY (`idBimestre`) REFERENCES `bimestres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `observaciones_ibfk_3` FOREIGN KEY (`idMaestro`) REFERENCES `maestros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
