-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2016 a las 15:30:19
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_facturacion`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spcrearCliente` (`pnombre` VARCHAR(25), `pnif` VARCHAR(25))  INSERT
INTO
  `tbl_client`(`cli_nom`,
  `cli_nif`)
VALUES(pnombre, pnif)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_client`
--

CREATE TABLE `tbl_client` (
  `cli_nif` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cli_nom` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cli_tlf` int(25) DEFAULT NULL,
  `cli_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_client`
--

INSERT INTO `tbl_client` (`cli_nif`, `cli_nom`, `cli_tlf`, `cli_id`) VALUES
('485411546', 'pepe', 0, 1),
('dfffsfgg', ' fgf', NULL, 2),
('sffnffdvldf', 'eric', NULL, 3),
('fgdhfjgkhl', 'asd', NULL, 4),
('fgsdhfjgh', 'pepe ', NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_factura`
--

CREATE TABLE `tbl_factura` (
  `fac_id` int(11) NOT NULL,
  `fac_import` int(11) NOT NULL,
  `cli_id` int(11) NOT NULL,
  `fac_data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_lineafactura`
--

CREATE TABLE `tbl_lineafactura` (
  `lin_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `fac_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producte`
--

CREATE TABLE `tbl_producte` (
  `pro_id` int(15) NOT NULL,
  `pro_nombre` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `pro_precio` int(10) NOT NULL,
  `pro_stock` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_producte`
--

INSERT INTO `tbl_producte` (`pro_id`, `pro_nombre`, `pro_precio`, `pro_stock`) VALUES
(1, ' sergio', 3, 10),
(2, ' sergio', 4, 10),
(3, 'eric', 23, 425),
(4, 'asd', 45, 45),
(5, ' eric', 5, 6),
(6, 'gre ', 4, 4),
(7, 'gre ', 4, 4),
(8, 'ttt ', 4, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_client`
--
ALTER TABLE `tbl_client`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indices de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD PRIMARY KEY (`fac_id`);

--
-- Indices de la tabla `tbl_lineafactura`
--
ALTER TABLE `tbl_lineafactura`
  ADD PRIMARY KEY (`lin_id`);

--
-- Indices de la tabla `tbl_producte`
--
ALTER TABLE `tbl_producte`
  ADD PRIMARY KEY (`pro_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_client`
--
ALTER TABLE `tbl_client`
  MODIFY `cli_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  MODIFY `fac_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_lineafactura`
--
ALTER TABLE `tbl_lineafactura`
  MODIFY `lin_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_producte`
--
ALTER TABLE `tbl_producte`
  MODIFY `pro_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
