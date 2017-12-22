-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-12-2017 a las 03:56:18
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trazabilidad_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportista`
--

CREATE TABLE `transportista` (
  `id` int(10) UNSIGNED NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_dni` int(11) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `cuit` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `domicilio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `numero_domicilio` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `localidad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_fijo` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_celular` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_celular_alt` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitud` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longuitud` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `habilitacion` tinyint(4) NOT NULL DEFAULT '1',
  `id_usuario` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `transportista`
--

INSERT INTO `transportista` (`id`, `razon_social`, `tipo_dni`, `dni`, `cuit`, `domicilio`, `numero_domicilio`, `localidad`, `codigo_postal`, `email`, `telefono_fijo`, `telefono_celular`, `telefono_celular_alt`, `latitud`, `longuitud`, `observaciones`, `habilitacion`, `id_usuario`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'rfreferferfre', 1, 12123123, 'YY-YYYYYYYY-Y', 'Ingresa el domicilio', 'N 437', 'option1', 3213, 'diegochecarelli@hotmail.com', '23123123123', '123123123', '123123123', '1231231231', '123123123', NULL, 1, 1, '2017-12-22 05:06:30', '2017-12-22 05:06:30', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `transportista`
--
ALTER TABLE `transportista`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `transportista`
--
ALTER TABLE `transportista`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
