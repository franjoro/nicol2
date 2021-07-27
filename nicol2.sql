-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2021 a las 16:01:12
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
  `Year` int(11) NOT NULL,
  `Bimestre` int(11) NOT NULL,
  `idMaestro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acumulados`
--

CREATE TABLE `acumulados` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `Porcentaje` int(11) NOT NULL,
  `idActividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
('LR192720', 'Jhon ', 'Doe', 0, '1998-08-18', 'email@email.com');

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
(2, 'DESARROLLO DEL PENSAMIENTO LÓGICO Y CUENTÍFICO'),
(3, 'DESARROLLO PESONAL, SOCIAL Y EMOCIONAL'),
(4, 'DESARROLLO DE LAS HABILIDADES DE LA COMUNICACIÓN Y EL TALENTO ARTISTICO Y CULTURAL');

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
(1, 1, 1, 2021),
(2, 0, 2, 2021),
(3, 0, 3, 2021),
(4, 0, 4, 2021),
(5, 0, 1, 2020),
(6, 0, 2, 2020),
(7, 0, 3, 2020),
(8, 0, 4, 2020);

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
(3, 'Bachilerato', 0),
(4, 'Parvularia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos`
--

CREATE TABLE `codigos` (
  `id` int(11) NOT NULL,
  `Codigo` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_alumno`
--

CREATE TABLE `codigo_alumno` (
  `id` int(11) NOT NULL,
  `idCodigo` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idMaestro` int(11) NOT NULL,
  `idBimestre` int(11) NOT NULL,
  `Observacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Date` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(2, 'Decimo A', 3, 2021),
(3, 'Decimo B', 3, 2021),
(4, 'Decimo C', 3, 2021);

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
(1, 'Anielka', 'Ruiz', 1, '0001-01-01', 'anielka.ruiz@cssjb.edu.ni');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros_materias`
--

CREATE TABLE `maestros_materias` (
  `id` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idMaestro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelomaterias`
--

CREATE TABLE `modelomaterias` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idArea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `modelomaterias`
--

INSERT INTO `modelomaterias` (`id`, `Nombre`, `idArea`) VALUES
(2, 'Matematicas', 2),
(3, 'Ciencias Naturales', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `Nota` decimal(5,2) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idAcumulado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Username` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `Role` int(11) NOT NULL,
  `Estado` int(11) NOT NULL,
  `Permisos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`Permisos`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Username`, `Password`, `Role`, `Estado`, `Permisos`) VALUES
('admin', '$2b$10$1WHMLPqRsOx.9jLMCiGYsu/NSeMAif8g6Ga7SLDxhIlC9TLQYm2ea', 1, 1, '{\"allPermisos\":true}'),
('anielka.ruiz@cssjb.edu.ni', '$2b$10$nVqjBTcpH.Sk/pBlmYYa7eJ6vg1Cq/disHgRbJiiZptQTAfZp3gfq', 3, 1, '{\"allPermisos\":false,\"matricula\":false}'),
('LR192720', '$2b$10$1ky5eRkVi4TduH0g1fG2g.T8DvuqYseTMGWTGSS6sAz543IoXK1gm', 2, 1, '{\"allPermisos\":true}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `year`
--

CREATE TABLE `year` (
  `year` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `bimestreActivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `year`
--

INSERT INTO `year` (`year`, `estado`, `bimestreActivo`) VALUES
(2020, 0, 4),
(2021, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `acumulados`
--
ALTER TABLE `acumulados`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `idAlumno` (`idAlumno`),
  ADD KEY `idGrado` (`idGrado`);

--
-- Indices de la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maestros_materias`
--
ALTER TABLE `maestros_materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materia_grado`
--
ALTER TABLE `materia_grado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idGrado` (`idGrado`),
  ADD KEY `idModeloMateria` (`idModeloMateria`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acumulados`
--
ALTER TABLE `acumulados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `bimestres`
--
ALTER TABLE `bimestres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `codigos`
--
ALTER TABLE `codigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `codigo_alumno`
--
ALTER TABLE `codigo_alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `grado_alumno`
--
ALTER TABLE `grado_alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `maestros`
--
ALTER TABLE `maestros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `maestros_materias`
--
ALTER TABLE `maestros_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materia_grado`
--
ALTER TABLE `materia_grado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `modelomaterias`
--
ALTER TABLE `modelomaterias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bimestres`
--
ALTER TABLE `bimestres`
  ADD CONSTRAINT `bimestres_ibfk_1` FOREIGN KEY (`idYear`) REFERENCES `year` (`year`);

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
  ADD CONSTRAINT `grado_alumno_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `alumnos` (`Carnet`),
  ADD CONSTRAINT `grado_alumno_ibfk_2` FOREIGN KEY (`idGrado`) REFERENCES `grados` (`id`);

--
-- Filtros para la tabla `materia_grado`
--
ALTER TABLE `materia_grado`
  ADD CONSTRAINT `materia_grado_ibfk_1` FOREIGN KEY (`idGrado`) REFERENCES `grados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materia_grado_ibfk_2` FOREIGN KEY (`idModeloMateria`) REFERENCES `modelomaterias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelomaterias`
--
ALTER TABLE `modelomaterias`
  ADD CONSTRAINT `modelomaterias_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
