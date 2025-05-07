-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-04-2025 a las 12:38:25
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `donpalitojrbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `idCalificacion` int NOT NULL,
  `idUsuario` int NOT NULL,
  `idProducto` int NOT NULL,
  `calificacion` int NOT NULL,
  `comentario` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`idCalificacion`, `idUsuario`, `idProducto`, `calificacion`, `comentario`, `fecha`) VALUES
(1, 1036, 1, 5, 'Los palitos de cocteleros son deliciosos, perfectos para incluir en cualquier reunión.  ', '2025-03-19 02:26:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idCarrito` int NOT NULL,
  `idUsuario` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`idCarrito`, `idUsuario`, `idProducto`, `cantidad`) VALUES
(1, 1, 1, 2),
(2, 3, 1, 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int NOT NULL,
  `nombreCategoria` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombreCategoria`) VALUES
(1, 'Palitos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedido`
--

CREATE TABLE `detallespedido` (
  `idDetalle` int NOT NULL,
  `idPedido` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallespedido`
--

INSERT INTO `detallespedido` (`idDetalle`, `idPedido`, `idProducto`, `cantidad`, `precioUnitario`, `subtotal`) VALUES
(1, 123, 1, 2, 2500.00, 5000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidadActual` int NOT NULL,
  `fechaActualizacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idInventario`, `idProducto`, `cantidadActual`, `fechaActualizacion`) VALUES
(1, 1, 9, '2025-03-19 02:02:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int NOT NULL,
  `documento` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaPedido` datetime NOT NULL,
  `estadoPedido` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `totalPedido` decimal(10,2) NOT NULL,
  `metodoPago` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `direccionEntrega` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `documento`, `fechaPedido`, `estadoPedido`, `totalPedido`, `metodoPago`, `direccionEntrega`) VALUES
(1, '1036615535', '2025-03-19 20:41:16', 'Enviado', 10500.00, 'Transferencia', 'Calle 50 # 50 - 13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int NOT NULL,
  `nombreProducto` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcionProducto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `precioProducto` decimal(10,2) NOT NULL,
  `stockProducto` int NOT NULL,
  `imagenUrl` longblob NOT NULL,
  `estadoProducto` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `idCategoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombreProducto`, `descripcionProducto`, `precioProducto`, `stockProducto`, `imagenUrl`, `estadoProducto`, `idCategoria`) VALUES
(1, 'Palito Premium Puro Queso', 'Palito premium de queso mozzarella.', 2500.00, 10, '', 'Disponible', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `idPromocion` int NOT NULL,
  `idProducto` int NOT NULL,
  `descuento` decimal(5,2) NOT NULL,
  `codigo` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  `estadoPromocion` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL,
  `documento` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nombreCompleto` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Cliente',
  `estado` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `documento`, `nombreCompleto`, `telefono`, `correo`, `contrasena`, `rol`, `estado`) VALUES
(1, '100', 'Andrea Arcila Cano', '3207194098', 'andreaac777@gmail.com', '12345', 'Cliente', 'Activo'),
(2, '1036458791', 'Ana Gil', '3104501040', 'ana3567@gmail.com', '$2b$10$mo7oaq.CBVFzqVpSvHRg/uwY5SSb.WqlczKVdJHmgQBpIMvWLmgoK', 'Cliente', 'Activo'),
(3, '1017200166', 'David Santamaria', '3052928524', 'davidutsuka@gmail.com', '$2b$10$XfNJ4jnM3TuvPu7wRiAR0O2MV4Yn3wN.ta2bOHk5f4MmyzEXjl2qC', 'Cliente', 'Activo'),
(4, '42765844', 'Andrea Mesa', '3213459851', 'andre_mesa@hotmail.com', '$2b$10$404hjbwTNhlE3TscnujGPeT6mhY9h7vQ5SNifhkT/Yet2vIyln9dy', 'Cliente', 'Activo'),
(5, '42761644', 'Noelia Cano', '3245880311', 'noelia0810@hotmail.com', '$2b$10$barl2HJkTu/h1JLuMUmP/ey49UJpqhT/E.5xY/u3kAqqQ2i.HrH5u', 'Cliente', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`idCalificacion`),
  ADD UNIQUE KEY `idUsuario` (`idUsuario`),
  ADD UNIQUE KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idCarrito`),
  ADD KEY `idProducto` (`idProducto`) USING BTREE,
  ADD KEY `idUsuario` (`idUsuario`) USING BTREE;

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `nombreCategoria` (`nombreCategoria`);

--
-- Indices de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD PRIMARY KEY (`idDetalle`),
  ADD UNIQUE KEY `idPedido` (`idPedido`),
  ADD UNIQUE KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD UNIQUE KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `direccionEntrega` (`direccionEntrega`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD UNIQUE KEY `nombreProducto` (`nombreProducto`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`idPromocion`),
  ADD UNIQUE KEY `idProducto` (`idProducto`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `idCalificacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idCarrito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  MODIFY `idDetalle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `idPromocion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
