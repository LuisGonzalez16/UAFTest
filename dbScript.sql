-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-01-2021 a las 19:55:27
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ots`
--
CREATE DATABASE IF NOT EXISTS `ots` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ots`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contractors`
--

CREATE TABLE `contractors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `direcction` varchar(500) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contractors`
--

INSERT INTO `contractors` (`id`, `name`, `direcction`, `telephone`, `email`, `state`) VALUES
(1, 'LUIS GONZALEZ', NULL, '1111-1111', 'aaaa@gmail.com', 1),
(2, 'alarmas', NULL, NULL, 'alarmas@gmail.com', 1),
(3, 'electricidad', NULL, NULL, 'elec@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cost_center`
--

CREATE TABLE `cost_center` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `cod` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `state` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cost_center`
--

INSERT INTO `cost_center` (`id`, `name`, `cod`, `description`, `state`) VALUES
(1, 'CENTRO DE COSGTO 1', 'COST001', NULL, '1'),
(2, 'CENTRO DE COSGTO 2', 'COST002', NULL, '1'),
(3, 'CENTRO DE COSGTO 3', 'COST003', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `state` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `state`) VALUES
(1, 'TECNOLOGIA', NULL, '1'),
(2, 'ADMINISTRACION', NULL, '1'),
(3, 'RECEPCION', NULL, '1'),
(4, 'CAFETERIA', NULL, '1'),
(5, 'CONTABILIDAD', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ots`
--

CREATE TABLE `ots` (
  `id` int(10) NOT NULL,
  `startdate` datetime DEFAULT '0000-00-00 00:00:00',
  `enddate` datetime DEFAULT '0000-00-00 00:00:00',
  `reference` varchar(20) DEFAULT '0',
  `invoice` varchar(20) DEFAULT '0',
  `department` int(10) DEFAULT '0',
  `costcenter` int(10) DEFAULT '0',
  `account` varchar(20) DEFAULT '0',
  `project_code` varchar(20) DEFAULT '0',
  `description` varchar(500) DEFAULT '0',
  `contractor` varchar(20) DEFAULT '0',
  `labor_price` decimal(20,2) DEFAULT '0.00',
  `material_price` decimal(20,2) DEFAULT '0.00',
  `state_Project` varchar(20) DEFAULT '0',
  `userid` varchar(20) DEFAULT '0',
  `comment` varchar(1500) DEFAULT '0',
  `state` tinyint(1) DEFAULT '0',
  `create_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `update_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `idteam` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ots`
--

INSERT INTO `ots` (`id`, `startdate`, `enddate`, `reference`, `invoice`, `department`, `costcenter`, `account`, `project_code`, `description`, `contractor`, `labor_price`, `material_price`, `state_Project`, `userid`, `comment`, `state`, `create_at`, `update_at`, `idteam`) VALUES
(9, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:47', '2021-01-19 15:49:47', 0),
(10, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:49', '2021-01-19 15:49:49', 0),
(11, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:50', '2021-01-19 15:49:50', 0),
(12, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:52', '2021-01-19 15:49:52', 0),
(13, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:53', '2021-01-19 15:49:53', 0),
(14, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:54', '2021-01-19 15:49:54', 0),
(15, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:56', '2021-01-19 15:49:56', 0),
(16, '2021-01-19 10:00:00', '2021-01-28 19:00:00', '0', '0', 1, 0, '0', '546777', 'dessssssssss', '1', '10000000.00', '2000.00', '0', '1', 'commmmmmmmmmmmmmm', 0, '2021-01-19 15:26:35', '2021-01-19 15:26:35', 0),
(17, '2021-01-19 08:00:00', '2021-01-19 22:00:00', '0', '0', 1, 0, '0', '2322', 'DEEEE', '2', '12222.00', '12.00', '0', '1', 'CCCCCCCCCCCCCCCC', 0, '2021-01-19 15:39:18', '2021-01-19 15:39:18', 0),
(18, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:39', '2021-01-19 15:49:39', 0),
(19, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:41', '2021-01-19 15:49:41', 0),
(20, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:42', '2021-01-19 15:49:42', 0),
(21, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:43', '2021-01-19 15:49:43', 0),
(22, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:45', '2021-01-19 15:49:45', 0),
(23, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:46', '2021-01-19 15:49:46', 0),
(24, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:47', '2021-01-19 15:49:47', 0),
(25, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:49', '2021-01-19 15:49:49', 0),
(26, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:50', '2021-01-19 15:49:50', 0),
(27, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:52', '2021-01-19 15:49:52', 0),
(28, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:53', '2021-01-19 15:49:53', 0),
(29, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:54', '2021-01-19 15:49:54', 0),
(30, '2021-01-19 00:00:00', '2021-01-19 00:00:00', '0', '0', 1, 0, '0', '23332', 'AAAAA', '1', '111.00', '1.00', '0', '1', 'CCSCSCSC', 0, '2021-01-19 15:49:56', '2021-01-19 15:49:56', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state_project`
--

CREATE TABLE `state_project` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `state` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pass` varchar(500) DEFAULT NULL,
  `state` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `pass`, `state`) VALUES
(1, 'admin', '123', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contractors`
--
ALTER TABLE `contractors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cost_center`
--
ALTER TABLE `cost_center`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ots`
--
ALTER TABLE `ots`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `state_project`
--
ALTER TABLE `state_project`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contractors`
--
ALTER TABLE `contractors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cost_center`
--
ALTER TABLE `cost_center`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `ots`
--
ALTER TABLE `ots`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `state_project`
--
ALTER TABLE `state_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
