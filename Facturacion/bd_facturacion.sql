-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2016 a las 17:23:43
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 7.0.3

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
-- Estructura de tabla para la tabla `administrdor`
--

CREATE TABLE `administrdor` (
  `name` varchar(100) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrdor`
--

INSERT INTO `administrdor` (`name`, `passwd`, `id`) VALUES
('sergio', '1234', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `idcategoria` int(15) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`idcategoria`, `name`) VALUES
(1, 'galleta'),
(2, 'cafe'),
(3, 'chocolate');

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
  `pro_nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `pro_precio` decimal(8,2) NOT NULL,
  `pro_stock` int(15) NOT NULL,
  `pro_categoria` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_producte`
--

INSERT INTO `tbl_producte` (`pro_id`, `pro_nombre`, `pro_precio`, `pro_stock`, `pro_categoria`) VALUES
(1, 'maria', '3.00', 1, 1),
(2, 'fontaneda', '4.00', 2, 1),
(3, 'hacendado', '23.00', 3, 1),
(4, 'principe', '45.00', 4, 1),
(5, 'saimaza', '5.00', 5, 2),
(6, 'bonka', '4.00', 6, 2),
(7, 'marcilla', '4.00', 7, 2),
(8, 'hacendado', '4.00', 8, 2),
(9, 'perritos', '1.00', 23, 3),
(10, 'medusas', '34.00', 24, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_stock`
--

CREATE TABLE `tbl_stock` (
  `idtbl_stock` int(15) NOT NULL,
  `quantitat` int(15) NOT NULL,
  `quantitatmax` int(15) NOT NULL,
  `quantitatmin` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_stock`
--

INSERT INTO `tbl_stock` (`idtbl_stock`, `quantitat`, `quantitatmax`, `quantitatmin`) VALUES
(1, 8, 20, 4),
(2, 8, 20, 4),
(3, 7, 30, 2),
(4, 5, 20, 4),
(5, 10, 40, 5),
(6, 6, 30, 2),
(7, 8, 20, 4),
(8, 8, 22, 4),
(10, 5, 10, 1),
(11, 5, 10, 1),
(12, 5, 10, 1),
(13, 5, 10, 1),
(14, 11, 12, 2),
(15, 11, 12, 2),
(17, 3, 5, 2),
(19, 4, 6, 2),
(21, 4, 7, 2),
(22, 4, 8, 2),
(23, 3, 9, 1),
(24, 8, 20, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrdor`
--
ALTER TABLE `administrdor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`idcategoria`);

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
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `fk_id_stock_idx` (`pro_stock`),
  ADD KEY `fk_id_categoria_idx` (`pro_categoria`),
  ADD KEY `fk_pro_stock_idx` (`pro_stock`);

--
-- Indices de la tabla `tbl_stock`
--
ALTER TABLE `tbl_stock`
  ADD PRIMARY KEY (`idtbl_stock`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrdor`
--
ALTER TABLE `administrdor`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `idcategoria` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `pro_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tbl_stock`
--
ALTER TABLE `tbl_stock`
  MODIFY `idtbl_stock` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_producte`
--
ALTER TABLE `tbl_producte`
  ADD CONSTRAINT `fk_id_categoria` FOREIGN KEY (`pro_categoria`) REFERENCES `tbl_categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_stock` FOREIGN KEY (`pro_stock`) REFERENCES `tbl_stock` (`idtbl_stock`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
