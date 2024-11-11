-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2024 a las 04:11:44
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
-- Base de datos: `mariscos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `mesa` int(11) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `mesa`, `telefono`, `id_pedido`) VALUES
(1, 'Juan Pérez', 1, '555-1234', 1),
(2, 'María López', 2, '555-2345', 2),
(3, 'Carlos Gómez', 3, '555-3456', 3),
(4, 'Ana Rodríguez', 4, '555-4567', 4),
(5, 'Luis Martínez', 5, '555-5678', 5),
(6, 'Laura Sánchez', 6, '555-6789', 6),
(7, 'Jorge Hernández', 7, '555-7890', 7),
(8, 'Marta Fernández', 8, '555-8901', 8),
(9, 'Andrés Morales', 9, '555-9012', 9),
(10, 'Carmen Ortiz', 10, '555-0123', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_producto` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_producto`, `id_proveedor`, `descripcion`, `costo`, `stock`) VALUES
(1, 1, 'Camarones frescos del proveedor 1', 200.00, 50),
(2, 2, 'Pulpo fresco del proveedor 2', 150.00, 40),
(3, 3, 'Ceviche mixto del proveedor 3', 100.00, 30),
(4, 4, 'Pescado entero del proveedor 4', 250.00, 20),
(5, 5, 'Langosta fresca del proveedor 5', 300.00, 10),
(6, 6, 'Almejas frescas del proveedor 6', 80.00, 60),
(7, 7, 'Ostiones frescos del proveedor 7', 120.00, 25),
(8, 8, 'Caracol de mar del proveedor 8', 90.00, 15),
(9, 9, 'Cangrejo fresco del proveedor 9', 130.00, 35),
(10, 10, 'Atún fresco del proveedor 10', 180.00, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_platillo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `descripcion`, `id_cliente`, `subtotal`, `iva`, `total`, `id_platillo`) VALUES
(1, 'Pedido de camarones', 1, 200.00, 32.00, 232.00, 1),
(2, 'Pedido de pulpo', 2, 150.00, 24.00, 174.00, 2),
(3, 'Pedido de ceviche', 3, 100.00, 16.00, 116.00, 3),
(4, 'Pedido de pescado', 4, 250.00, 40.00, 290.00, 4),
(5, 'Pedido de langosta', 5, 300.00, 48.00, 348.00, 5),
(6, 'Pedido de almejas', 6, 80.00, 12.80, 92.80, 6),
(7, 'Pedido de ostiones', 7, 120.00, 19.20, 139.20, 7),
(8, 'Pedido de caracol', 8, 90.00, 14.40, 104.40, 8),
(9, 'Pedido de cangrejo', 9, 130.00, 20.80, 150.80, 9),
(10, 'Pedido de atún', 10, 180.00, 28.80, 208.80, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_platillo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_platillo`, `nombre`, `descripcion`, `costo`) VALUES
(1, 'Camarones', 'Camarones frescos', 200.00),
(2, 'Pulpo', 'Pulpo fresco', 150.00),
(3, 'Ceviche', 'Ceviche mixto', 100.00),
(4, 'Pescado', 'Pescado entero', 250.00),
(5, 'Langosta', 'Langosta fresca', 300.00),
(6, 'Almejas', 'Almejas frescas', 80.00),
(7, 'Ostiones', 'Ostiones frescos', 120.00),
(8, 'Caracol', 'Caracol de mar', 90.00),
(9, 'Cangrejo', 'Cangrejo fresco', 130.00),
(10, 'Atún', 'Atún fresco', 180.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `telefono`, `correo`, `direccion`, `id_producto`, `fecha_entrega`) VALUES
(1, 'Proveeduría del Mar', '555-0001', 'proveedor1@correo.com', 'Calle Mar 123', 1, '2024-11-10'),
(2, 'Pescados del Pacífico', '555-0002', 'proveedor2@correo.com', 'Calle Oceano 456', 2, '2024-11-11'),
(3, 'Mariscos del Norte', '555-0003', 'proveedor3@correo.com', 'Calle Arena 789', 3, '2024-11-12'),
(4, 'Productos del Mar', '555-0004', 'proveedor4@correo.com', 'Calle Playa 101', 4, '2024-11-13'),
(5, 'Delicias del Mar', '555-0005', 'proveedor5@correo.com', 'Calle Sal 202', 5, '2024-11-14'),
(6, 'Frutos de Mar', '555-0006', 'proveedor6@correo.com', 'Calle Coral 303', 6, '2024-11-15'),
(7, 'Oceanos', '555-0007', 'proveedor7@correo.com', 'Calle Peces 404', 7, '2024-11-16'),
(8, 'Riquezas del Mar', '555-0008', 'proveedor8@correo.com', 'Calle Conchas 505', 8, '2024-11-17'),
(9, 'Sabores del Mar', '555-0009', 'proveedor9@correo.com', 'Calle Brisa 606', 9, '2024-11-18'),
(10, 'Tesoro Marino', '555-0010', 'proveedor10@correo.com', 'Calle Mareas 707', 10, '2024-11-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_producto`,`id_proveedor`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_platillo`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_platillo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_platillo`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_platillo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
