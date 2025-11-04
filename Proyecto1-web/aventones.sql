-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2025 a las 06:56:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aventones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `chofer` varchar(80) DEFAULT NULL,
  `id_ride` int(11) DEFAULT NULL,
  `recorrido` varchar(80) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(80) DEFAULT NULL,
  `id_pasajero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `chofer`, `id_ride`, `recorrido`, `fecha`, `estado`, `id_pasajero`) VALUES
(1, 'Carlos', 3, 'Fortuna-Managua', '2025-11-03', 'Cancelada', 2),
(2, 'Carlos', 2, 'Aguas Zarcas-San Jose', '2025-11-03', 'Aceptada', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rides`
--

CREATE TABLE `rides` (
  `id` int(11) NOT NULL,
  `salida` varchar(80) DEFAULT NULL,
  `llegada` varchar(80) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `dia` varchar(80) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo` decimal(8,2) DEFAULT NULL,
  `id_veh` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rides`
--

INSERT INTO `rides` (`id`, `salida`, `llegada`, `nombre`, `dia`, `cantidad`, `costo`, `id_veh`, `id_user`, `fecha`) VALUES
(2, 'Aguas Zarcas', 'San Jose', 'Expreso AZ-SJ', 'Jueves', 2, 15000.00, 4, 12, '2025-11-20 00:00:00'),
(3, 'Fortuna', 'Managua', 'Internacional Nicaragua-CR', 'Miercoles', 4, 89000.00, 4, 12, '2025-11-05 09:20:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fotografia` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `cedula`, `fecha_nacimiento`, `correo`, `telefono`, `fotografia`, `contrasena`, `estado`, `tipo`, `token`) VALUES
(1, 'Enoc', NULL, NULL, NULL, 'esquivelenoc20@gmail.com', NULL, NULL, '1234', 'Activo', 'Administrador', NULL),
(2, 'Karen', 'Chavarria', '113380930', '1988-01-10', 'chavarriakaren05@gmail.com', '85261351', '../imagenes/semana 6 Enoc.jpg', '1234', 'Activo', 'Pasajero', NULL),
(7, 'Felipe ', 'Esquivel', '111350215', '1982-04-12', 'felipaoesquivel@gmail.com', '89628830', '../imagenes/semana 6 Enoc.jpg', '1234', 'Pendiente', 'Chofer', 'b355bd488e9b0bcf8f83f3ab50e08f8a'),
(12, 'Carlos', 'Perez', '111345098', '1982-04-12', 'cursosprograudemy@gmail.com', '88889087', '../imagenes/cedula1.jpg', '1234', 'Activo', 'Chofer', NULL),
(13, 'math', NULL, NULL, NULL, 'math@gmail.com', NULL, NULL, '1234', 'Activo', 'Administrador', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(15) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `espacios` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `placa`, `color`, `marca`, `modelo`, `anio`, `espacios`, `foto`, `id_user`) VALUES
(4, 'BCA-098', 'Azul', 'Hyundai', 'grand i10', 2010, 5, '../imagenes/grand i10.png', 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rides`
--
ALTER TABLE `rides`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rides`
--
ALTER TABLE `rides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
