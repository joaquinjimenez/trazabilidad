-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-01-2018 a las 01:03:14
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
-- Estructura de tabla para la tabla `administradors`
--

CREATE TABLE `administradors` (
  `id` int(10) UNSIGNED NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuit` int(11) NOT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_usuario` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_trabajo` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_particular` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativos`
--

CREATE TABLE `administrativos` (
  `id` int(10) UNSIGNED NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuit` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_trabajo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_particular` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `basculas`
--

CREATE TABLE `basculas` (
  `id` int(10) UNSIGNED NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cuit` bigint(20) DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_usuario` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_trabajo` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_particular` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `basculas`
--

INSERT INTO `basculas` (`id`, `razon_social`, `cargo`, `cuit`, `observaciones`, `id_usuario`, `email`, `telefono_trabajo`, `telefono_particular`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Fernanda', 'Operario', 22121231230, 'que se yo , estas son las observaciones', 1, 'juanti@gmail.com', '213213213', '123123123123', '2017-12-23 02:18:07', '2017-12-23 02:18:07', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bateas`
--

CREATE TABLE `bateas` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_transportista` int(11) NOT NULL,
  `expediente_batea` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patente` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `codigo_batea` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tara_batea` double DEFAULT NULL,
  `capacidad` decimal(10,0) DEFAULT NULL,
  `seguro` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `habilitacion` tinyint(4) DEFAULT NULL,
  `obvervaciones` text COLLATE utf8_unicode_ci,
  `id_usuario` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `bateas`
--

INSERT INTO `bateas` (`id`, `id_transportista`, `expediente_batea`, `patente`, `codigo_batea`, `tara_batea`, `capacidad`, `seguro`, `habilitacion`, `obvervaciones`, `id_usuario`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, '123123', '123eede', '1231231', 332, '23', 'si', 1, 'sddfdfsdfs', 1, '2017-12-28 00:09:09', '2017-12-28 00:09:09', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chofers`
--

CREATE TABLE `chofers` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_transportista` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `observacion` text COLLATE utf8_unicode_ci,
  `telefono_fijo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domicilio` text COLLATE utf8_unicode_ci,
  `nombre_accidente` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_accidente` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expediente_chofer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `chofers`
--

INSERT INTO `chofers` (`id`, `id_transportista`, `dni`, `nombre`, `observacion`, `telefono_fijo`, `celular`, `domicilio`, `nombre_accidente`, `telefono_accidente`, `expediente_chofer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 34328945, 'DIego', 'asdasdasdasjdoiasdjioasdj', '15615616', '16515651', 'calle libertador', 'Fabri', '1561561', '16156sad', '2017-12-16 03:21:46', '2017-12-16 03:21:46', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `climas`
--

CREATE TABLE `climas` (
  `id` int(10) UNSIGNED NOT NULL,
  `valor_clima` int(11) NOT NULL,
  `temperatura` double DEFAULT NULL,
  `viento` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `humedad` double DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compost`
--

CREATE TABLE `compost` (
  `id` int(10) UNSIGNED NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuit` bigint(20) NOT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `id_usuario` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_trabajo` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_particular` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conexions`
--

CREATE TABLE `conexions` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cierre_sesion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `accept` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accept_language` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accept_encoding` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plataform` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referrer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accept_chat_set` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `command_line` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ajax` tinyint(4) DEFAULT NULL,
  `agent_m` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2),
(3, 1, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3),
(4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4),
(5, 1, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 5),
(6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6),
(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 8),
(9, 1, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, '', 9),
(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 10),
(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 12),
(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 13),
(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '', 2),
(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '', 3),
(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 4),
(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '', 5),
(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"}}', 6),
(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '', 7),
(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 8),
(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(23, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '', 10),
(24, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '', 11),
(25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '', 12),
(26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, '', 3),
(29, 3, 'password', 'password', 'password', 0, 0, 0, 1, 1, 0, '', 4),
(30, 3, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10),
(31, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, '', 5),
(32, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 6),
(33, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
(34, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, '', 8),
(35, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(36, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(37, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(38, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(39, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(40, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(41, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(42, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 4),
(43, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(44, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, '', 6),
(45, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
(46, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(47, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(48, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(49, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(50, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(51, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, '', 14),
(52, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, '', 15),
(53, 3, 'role_id', 'text', 'role_id', 1, 1, 1, 1, 1, 1, '', 9),
(66, 8, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(67, 8, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:5\",\"max:100\"]}}', 2),
(68, 8, 'dni', 'number', 'Dni', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:7\",\"max:8\"]}}', 3),
(69, 8, 'cargo', 'text', 'Cargo', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:5\",\"max:100\"]}}', 4),
(70, 8, 'departamento', 'text', 'Departamento', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:5\",\"max:100\"]}}', 5),
(71, 8, 'mail', 'text', 'Mail', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:5\",\"max:100\"]}}', 6),
(72, 8, 'estado', 'select_dropdown', 'Estado', 1, 1, 1, 1, 1, 1, NULL, 7),
(73, 8, 'id_usuario', 'text', 'Id Usuario', 1, 1, 1, 1, 1, 1, NULL, 8),
(74, 8, 'observacion', 'markdown_editor', 'Observacion', 0, 1, 1, 1, 1, 1, NULL, 9),
(75, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 1, 1, NULL, 10),
(76, 8, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 1, 1, NULL, 11),
(77, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 0, 1, 1, NULL, 12),
(78, 9, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(79, 9, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, NULL, 2),
(80, 9, 'dni', 'number', 'Dni', 1, 1, 1, 1, 1, 1, NULL, 3),
(81, 9, 'cargo', 'text', 'Cargo', 1, 1, 1, 1, 1, 1, NULL, 4),
(82, 9, 'departamento', 'text', 'Departamento', 0, 1, 1, 1, 1, 1, NULL, 5),
(83, 9, 'mail', 'text', 'Mail', 0, 1, 1, 1, 1, 1, NULL, 6),
(84, 9, 'estado', 'number', 'Estado', 1, 1, 1, 1, 1, 1, NULL, 7),
(85, 9, 'id_usuario', 'checkbox', 'Id Usuario', 1, 0, 0, 0, 0, 0, NULL, 8),
(86, 9, 'observacion', 'markdown_editor', 'Observacion', 0, 1, 1, 1, 1, 1, NULL, 9),
(87, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 10),
(88, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 11),
(89, 9, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 12),
(90, 10, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(91, 10, 'id_transportista', 'checkbox', 'Id Transportista', 1, 1, 1, 1, 1, 0, NULL, 2),
(92, 10, 'dni', 'number', 'Dni', 1, 1, 1, 1, 1, 1, NULL, 3),
(93, 10, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, NULL, 4),
(94, 10, 'observacion', 'text_area', 'Observacion', 0, 1, 1, 1, 1, 1, NULL, 5),
(95, 10, 'telefono_fijo', 'text', 'Telefono Fijo', 0, 1, 1, 1, 1, 1, NULL, 6),
(96, 10, 'celular', 'text', 'Celular', 0, 1, 1, 1, 1, 1, NULL, 7),
(97, 10, 'domicilio', 'text', 'Domicilio', 0, 1, 1, 1, 1, 1, NULL, 8),
(98, 10, 'nombre_accidente', 'text', 'Nombre en caso de Accidente', 0, 1, 1, 1, 1, 1, NULL, 9),
(99, 10, 'telefono_accidente', 'text', 'Telefono en caso de Accidente', 0, 1, 1, 1, 1, 1, NULL, 10),
(100, 10, 'expediente_chofer', 'text', 'Expediente Chofer', 0, 1, 1, 1, 1, 1, NULL, 11),
(101, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 0, NULL, 12),
(102, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(103, 10, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 0, 0, NULL, 14),
(104, 12, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(105, 12, 'razon_social', 'text', 'Razon Social', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:5\",\"max:100\"]}}', 2),
(106, 12, 'tipo_dni', 'select_dropdown', 'Tipo Persona', 0, 1, 1, 1, 1, 1, '{\"default\":\"Fisicas\",\"options\":{\"1\":\"Fisicas\",\"2\":\"Juridicas\"}}', 3),
(107, 12, 'dni', 'number', 'Dni', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"min:7\",\"max:8\"]}}', 4),
(108, 12, 'cuit', 'text', 'Cuit', 1, 1, 1, 1, 1, 1, '{\"default\":\"YY-YYYYYYYY-Y\"}', 5),
(109, 12, 'domicilio', 'text', 'Domicilio', 1, 1, 1, 1, 1, 1, '{\"default\":\"Ingresa el domicilio\"}', 6),
(110, 12, 'numero_domicilio', 'text', 'Numero Domicilio', 0, 1, 1, 1, 1, 1, '{\"default\":\"Orientacion y Numero\"}', 7),
(111, 12, 'localidad', 'select_dropdown', 'Localidad', 1, 1, 1, 1, 1, 1, '{\"default\":\"Capital\",\"options\":{\"Capital\":\"Capital\",\"Rawson\":\"Rawson\",\"Rivadavia\":\"Rivadavia\",\"Chimbas\":\"Chimbas\",\"Jachal\":\"Jachal\",\"Pocito\":\"Pocito\",\"25 de mayo\":\"25 de mayo\",\"Calingasta\":\"Calingasta\",\"Valle Fertil\":\"Valle Fertil\",\"Sarmiento\":\"Sarmiento\",\"9 de Julio\":\"9 de Julio\",\"Albardon\":\"Albardon\",\"Iglesias\":\"Iglesias\"}}', 8),
(112, 12, 'codigo_postal', 'number', 'Codigo Postal', 0, 1, 1, 1, 1, 1, NULL, 9),
(113, 12, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 10),
(114, 12, 'telefono_fijo', 'text', 'Telefono Fijo', 1, 1, 1, 1, 1, 1, NULL, 11),
(115, 12, 'telefono_celular', 'text', 'Telefono Celular', 0, 1, 1, 1, 1, 1, NULL, 12),
(116, 12, 'telefono_celular_alt', 'text', 'Telefono Celular Alt', 0, 1, 1, 1, 1, 1, NULL, 13),
(117, 12, 'latitud', 'text', 'Latitud', 0, 1, 1, 1, 1, 1, NULL, 14),
(118, 12, 'longuitud', 'text', 'Longuitud', 0, 1, 1, 1, 1, 1, NULL, 15),
(119, 12, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, NULL, 16),
(120, 12, 'habilitacion', 'checkbox', 'Habilitacion', 1, 1, 1, 1, 1, 1, NULL, 17),
(121, 12, 'id_usuario', 'checkbox', 'Id Usuario', 1, 0, 0, 0, 0, 0, NULL, 18),
(122, 12, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, NULL, 19),
(123, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 20),
(124, 12, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, NULL, 21),
(125, 15, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(126, 15, 'tipo_dni', 'checkbox', 'Tipo Dni', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:5\",\"max:100\"]}}', 2),
(127, 15, 'cuit', 'number', 'Cuit', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"min:13\",\"max:13\"]}}', 3),
(128, 15, 'razon_social', 'text', 'Razon Social', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:5\",\"max:100\"]}}', 4),
(129, 15, 'domicilio', 'text', 'Domicilio', 1, 1, 1, 1, 1, 1, '{\"default\":\"Ingresa el domicilio\"}', 5),
(130, 15, 'numero_domicilio', 'text', 'Numero y Orientación del domicilio', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"min:3\",\"max:25\"]}}', 6),
(131, 15, 'localidad', 'select_dropdown', 'Localidad', 0, 1, 1, 1, 1, 1, '{\"default\":\"Capital\",\"options\":{\"Capital\":\"Capital\",\"Rawson\":\"Rawson\",\"Rivadavia\":\"Rivadavia\",\"Chimbas\":\"Chimbas\",\"Jachal\":\"Jachal\",\"Pocito\":\"Pocito\",\"25 de mayo\":\"25 de mayo\",\"Calingasta\":\"Calingasta\",\"Valle Fertil\":\"Valle Fertil\",\"Sarmiento\":\"Sarmiento\",\"9 de Julio\":\"9 de Julio\",\"Albardon\":\"Albardon\",\"Iglesias\":\"Iglesias\"}}', 7),
(132, 15, 'codigo_postal', 'number', 'Codigo Postal', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"min:1\",\"max:5\"]}}', 8),
(133, 15, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:5\",\"max:100\"]}}', 9),
(134, 15, 'telefono_fijo', 'text', 'Telefono Fijo', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"required\",\"min:5\",\"max:100\"]}}', 10),
(135, 15, 'telefono_celular', 'text', 'Telefono Celular', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"min:5\",\"max:100\"]}}', 11),
(136, 15, 'telefono_celular_alt', 'text', 'Telefono Celular Alternativo', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rules\":[\"min:5\",\"max:100\"]}}', 12),
(137, 15, 'id_usuario', 'hidden', 'Id Usuario', 1, 1, 1, 1, 1, 1, NULL, 13),
(138, 15, 'habilitacion', 'checkbox', 'Habilitacion', 1, 1, 1, 1, 1, 1, NULL, 14),
(139, 15, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, NULL, 15),
(140, 15, 'latitud', 'text', 'Latitud', 0, 1, 1, 1, 1, 1, NULL, 16),
(141, 15, 'longuitud', 'text', 'Longuitud', 0, 1, 1, 1, 1, 1, NULL, 17),
(142, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 18),
(143, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 19),
(144, 15, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 20),
(145, 16, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(146, 16, 'razon_social', 'text', 'Razon Social', 1, 1, 1, 1, 1, 1, NULL, 2),
(147, 16, 'cargo', 'text', 'Cargo', 0, 1, 1, 1, 1, 1, NULL, 3),
(148, 16, 'cuit', 'number', 'Cuit', 1, 1, 1, 1, 1, 1, NULL, 4),
(149, 16, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, NULL, 5),
(150, 16, 'id_usuario', 'checkbox', 'Id Usuario', 1, 0, 0, 0, 0, 0, NULL, 9),
(151, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 10),
(152, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 11),
(153, 16, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, NULL, 12),
(154, 16, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 6),
(155, 16, 'telefono_trabajo', 'text', 'Telefono Trabajo', 0, 1, 1, 1, 1, 1, NULL, 7),
(156, 16, 'telefono_particular', 'text', 'Telefono Particular', 0, 1, 1, 1, 1, 1, NULL, 8),
(157, 17, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(158, 17, 'razon_social', 'text', 'Razon Social', 1, 1, 1, 1, 1, 1, NULL, 2),
(159, 17, 'cargo', 'text', 'Cargo', 0, 1, 1, 1, 1, 1, NULL, 3),
(160, 17, 'cuit', 'number', 'Cuit', 1, 1, 1, 1, 1, 1, NULL, 4),
(161, 17, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, NULL, 5),
(162, 17, 'id_usuario', 'checkbox', 'Id Usuario', 0, 0, 0, 0, 0, 0, NULL, 6),
(163, 17, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 7),
(164, 17, 'telefono_trabajo', 'text', 'Telefono Trabajo', 0, 1, 1, 1, 1, 1, NULL, 8),
(165, 17, 'telefono_particular', 'text', 'Telefono Particular', 0, 1, 1, 1, 1, 1, NULL, 9),
(166, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 10),
(167, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 11),
(168, 17, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 12),
(169, 18, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(170, 18, 'razon_social', 'text', 'Razon Social', 1, 1, 1, 1, 1, 1, NULL, 2),
(171, 18, 'cargo', 'text', 'Cargo', 1, 1, 1, 1, 1, 1, NULL, 3),
(172, 18, 'cuit', 'number', 'Cuit', 0, 1, 1, 1, 1, 1, NULL, 4),
(173, 18, 'observaciones', 'text_area', 'Observaciones', 0, 1, 1, 1, 1, 1, NULL, 5),
(174, 18, 'id_usuario', 'number', 'Id Usuario', 0, 1, 1, 1, 1, 1, NULL, 6),
(175, 18, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 7),
(176, 18, 'telefono_trabajo', 'text', 'Telefono Trabajo', 0, 1, 1, 1, 1, 1, NULL, 8),
(177, 18, 'telefono_particular', 'text', 'Telefono Particular', 0, 1, 1, 1, 1, 1, NULL, 9),
(178, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 10),
(179, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 11),
(180, 18, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 12),
(181, 20, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(182, 20, 'id_transportista', 'text', 'Id Transportista', 1, 1, 1, 1, 1, 1, NULL, 2),
(183, 20, 'expediente_batea', 'text', 'Expediente Batea', 0, 1, 1, 1, 1, 1, NULL, 3),
(184, 20, 'patente', 'text', 'Patente', 1, 1, 1, 1, 1, 1, NULL, 4),
(185, 20, 'codigo_batea', 'text', 'Codigo Batea', 1, 1, 1, 1, 1, 1, NULL, 5),
(186, 20, 'tara_batea', 'number', 'Tara Batea', 0, 1, 1, 1, 1, 1, NULL, 6),
(187, 20, 'capacidad', 'number', 'Capacidad', 0, 1, 1, 1, 1, 1, NULL, 7),
(188, 20, 'seguro', 'text', 'Seguro', 0, 1, 1, 1, 1, 1, NULL, 8),
(189, 20, 'habilitacion', 'checkbox', 'Habilitacion', 0, 1, 1, 1, 1, 1, NULL, 9),
(190, 20, 'obvervaciones', 'text_area', 'Obvervaciones', 0, 1, 1, 1, 1, 1, NULL, 10),
(191, 20, 'id_usuario', 'number', 'Id Usuario', 0, 1, 1, 1, 1, 1, NULL, 11),
(192, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 12),
(193, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(194, 20, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, NULL, 14),
(195, 20, 'batea_hasone_transportistum_relationship', 'relationship', 'transportista', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Transportistum\",\"table\":\"transportista\",\"type\":\"belongsTo\",\"column\":\"id_transportista\",\"key\":\"id\",\"label\":\"razon_social\",\"pivot_table\":\"administradors\",\"pivot\":\"0\"}', 15),
(196, 22, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(197, 22, 'valor_clima', 'number', 'Valor Clima', 1, 1, 1, 1, 1, 1, NULL, 3),
(198, 22, 'temperatura', 'number', 'Temperatura', 0, 1, 1, 1, 1, 1, NULL, 4),
(199, 22, 'viento', 'text', 'Viento', 0, 1, 1, 1, 1, 1, NULL, 5),
(200, 22, 'humedad', 'number', 'Humedad', 0, 1, 1, 1, 1, 1, NULL, 6),
(201, 22, 'id_usuari', 'text', 'Id Usuari', 1, 1, 1, 1, 1, 1, NULL, 7),
(202, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 8),
(203, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 9),
(204, 22, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 10),
(205, 22, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, NULL, 2),
(206, 23, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(207, 23, 'id_usuario', 'number', 'Id Usuario', 1, 1, 1, 1, 1, 1, NULL, 2),
(208, 23, 'ip', 'text', 'Ip', 0, 1, 1, 1, 1, 1, NULL, 3),
(209, 23, 'cierre_sesion', 'timestamp', 'Cierre Sesion', 1, 1, 1, 1, 1, 1, NULL, 4),
(210, 23, 'accept', 'text', 'Accept', 0, 1, 1, 1, 1, 1, NULL, 5),
(211, 23, 'accept_language', 'text', 'Accept Language', 0, 1, 1, 1, 1, 1, NULL, 6),
(212, 23, 'accept_encoding', 'text', 'Accept Encoding', 0, 1, 1, 1, 1, 1, NULL, 7),
(213, 23, 'user_agent', 'text', 'User Agent', 0, 1, 1, 1, 1, 1, NULL, 8),
(214, 23, 'host', 'text', 'Host', 0, 1, 1, 1, 1, 1, NULL, 9),
(215, 23, 'connection', 'text', 'Connection', 0, 1, 1, 1, 1, 1, NULL, 10),
(216, 23, 'observacion', 'text', 'Observacion', 0, 1, 1, 1, 1, 1, NULL, 11),
(217, 23, 'plataform', 'text', 'Plataform', 0, 1, 1, 1, 1, 1, NULL, 12),
(218, 23, 'referrer', 'text', 'Referrer', 0, 1, 1, 1, 1, 1, NULL, 13),
(219, 23, 'accept_chat_set', 'text', 'Accept Chat Set', 0, 1, 1, 1, 1, 1, NULL, 14),
(220, 23, 'command_line', 'text', 'Command Line', 0, 1, 1, 1, 1, 1, NULL, 15),
(221, 23, 'ajax', 'checkbox', 'Ajax', 0, 1, 1, 1, 1, 1, NULL, 16),
(222, 23, 'agent_m', 'text', 'Agent M', 0, 1, 1, 1, 1, 1, NULL, 17),
(223, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 18),
(224, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 19),
(225, 23, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, NULL, 20),
(226, 25, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(227, 25, 'IdTrans', 'checkbox', 'IdTrans', 1, 1, 1, 1, 1, 1, NULL, 2),
(228, 25, 'Nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, NULL, 3),
(229, 25, 'cuit', 'number', 'Cuit', 1, 1, 1, 1, 1, 1, NULL, 4),
(230, 25, 'celular', 'text', 'Celular', 0, 1, 1, 1, 1, 1, NULL, 5),
(231, 25, 'Email', 'text', 'Email', 0, 1, 1, 1, 1, 1, NULL, 6),
(232, 25, 'Observacion', 'text_area', 'Observacion', 0, 1, 1, 1, 1, 1, NULL, 7),
(233, 25, 'Deuda', 'number', 'Deuda', 0, 1, 1, 1, 1, 1, NULL, 8),
(234, 25, 'Infraccion', 'number', 'Infraccion', 0, 1, 1, 1, 1, 1, NULL, 9),
(235, 25, 'Id_Usuario', 'number', 'Id Usuario', 1, 0, 0, 0, 0, 0, NULL, 10),
(236, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 11),
(237, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 12),
(238, 25, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, NULL, 13),
(239, 25, 'encargadovehiculo_belongsto_transportistum_relationship', 'relationship', 'transportista', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Transportistum\",\"table\":\"transportista\",\"type\":\"belongsTo\",\"column\":\"IdTrans\",\"key\":\"id\",\"label\":\"razon_social\",\"pivot_table\":\"administradors\",\"pivot\":\"0\"}', 14),
(240, 26, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(241, 26, 'id_generador', 'checkbox', 'Id Generador', 1, 1, 1, 1, 1, 1, NULL, 2),
(242, 26, 'id_transportista', 'checkbox', 'Id Transportista', 1, 1, 1, 1, 1, 1, NULL, 3),
(243, 26, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(244, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(245, 26, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 6),
(246, 26, 'generadortransportistum_belongstomany_transportistum_relationship', 'relationship', 'transportista', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Transportistum\",\"table\":\"transportista\",\"type\":\"belongsTo\",\"column\":\"id_transportista\",\"key\":\"id\",\"label\":\"razon_social\",\"pivot_table\":\"generadortransportista\",\"pivot\":\"0\"}', 7),
(247, 26, 'generadortransportistum_belongsto_generador_relationship', 'relationship', 'generadors', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Generador\",\"table\":\"generadors\",\"type\":\"belongsTo\",\"column\":\"id_generador\",\"key\":\"id\",\"label\":\"razon_social\",\"pivot_table\":\"administradors\",\"pivot\":\"0\"}', 8),
(248, 27, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(249, 27, 'id_orden', 'checkbox', 'Id Orden', 1, 1, 1, 1, 1, 1, NULL, 2),
(250, 27, 'inicio', 'checkbox', 'Inicio', 0, 1, 1, 1, 1, 1, NULL, 3),
(251, 27, 'fin', 'checkbox', 'Fin', 0, 1, 1, 1, 1, 1, NULL, 4),
(252, 27, 'estado', 'text', 'Estado', 0, 1, 1, 1, 1, 1, NULL, 5),
(253, 27, 'lugar', 'rich_text_box', 'Lugar', 0, 1, 1, 1, 1, 1, NULL, 6),
(254, 27, 'salida', 'checkbox', 'Salida', 0, 1, 1, 1, 1, 1, NULL, 7),
(255, 27, 'llegada', 'checkbox', 'Llegada', 0, 1, 1, 1, 1, 1, NULL, 8),
(256, 27, 'recorrido', 'checkbox', 'Recorrido', 0, 1, 1, 1, 1, 1, NULL, 9),
(257, 27, 'destino', 'checkbox', 'Destino', 0, 1, 1, 1, 1, 1, NULL, 10),
(258, 27, 'icono', 'checkbox', 'Icono', 0, 1, 1, 1, 1, 1, NULL, 11),
(259, 27, 'observaciones', 'markdown_editor', 'Observaciones', 0, 1, 1, 1, 1, 1, NULL, 12),
(260, 27, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 13),
(261, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 14),
(262, 27, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, NULL, 15),
(263, 28, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(264, 28, 'id_orden', 'checkbox', 'Id Orden', 1, 1, 1, 1, 1, 1, NULL, 2),
(265, 28, 'inicio', 'checkbox', 'Inicio', 0, 1, 1, 1, 1, 1, NULL, 3),
(266, 28, 'fin', 'checkbox', 'Fin', 0, 1, 1, 1, 1, 1, NULL, 4),
(267, 28, 'estado', 'checkbox', 'Estado', 0, 1, 1, 1, 1, 1, NULL, 5),
(268, 28, 'lugar', 'checkbox', 'Lugar', 0, 1, 1, 1, 1, 1, NULL, 6),
(269, 28, 'salida', 'checkbox', 'Salida', 0, 1, 1, 1, 1, 1, NULL, 7),
(270, 28, 'llegada', 'checkbox', 'Llegada', 0, 1, 1, 1, 1, 1, NULL, 8),
(271, 28, 'recorrido', 'checkbox', 'Recorrido', 0, 1, 1, 1, 1, 1, NULL, 9),
(272, 28, 'destino', 'checkbox', 'Destino', 0, 1, 1, 1, 1, 1, NULL, 10),
(273, 28, 'icono', 'checkbox', 'Icono', 0, 1, 1, 1, 1, 1, NULL, 11),
(274, 28, 'observaciones', 'checkbox', 'Observaciones', 0, 1, 1, 1, 1, 1, NULL, 12),
(275, 28, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 13),
(276, 28, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 14),
(277, 28, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`) VALUES
(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, '2017-12-16 00:47:03', '2017-12-16 00:47:03'),
(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, '2017-12-16 00:47:03', '2017-12-16 00:47:03'),
(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, '2017-12-16 00:47:03', '2017-12-16 00:47:03'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, '2017-12-16 00:47:04', '2017-12-16 00:47:04'),
(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, '2017-12-16 00:47:04', '2017-12-16 00:47:04'),
(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, '2017-12-16 00:47:04', '2017-12-16 00:47:04'),
(8, 'persona', 'persona', 'Persona', 'Personas', 'voyager-person', 'App\\Persona', NULL, NULL, 'esta tabla tiene los datos de las personas que tienen un usuario en la tabla usuarios', 1, 0, '2017-12-16 02:26:01', '2017-12-16 02:32:58'),
(9, 'personas', 'personas', 'Persona', 'Personas', 'voyager-person', 'App\\Persona', NULL, NULL, NULL, 1, 0, '2017-12-16 02:37:02', '2017-12-16 02:37:02'),
(10, 'chofer', 'chofer', 'Chofer', 'Choferes', 'voyager-meh', 'App\\Chofer', NULL, NULL, 'la tabla de choferes', 1, 1, '2017-12-16 03:20:09', '2017-12-16 03:20:09'),
(12, 'transportista', 'transportista', 'Transportistum', 'Transportista', 'voyager-music', 'App\\Transportistum', NULL, NULL, NULL, 1, 1, '2017-12-22 03:37:01', '2017-12-22 03:37:01'),
(15, 'generador', 'generador', 'Generador', 'Generadors', 'voyager-bulb', 'App\\Generador', NULL, NULL, NULL, 1, 0, '2017-12-23 01:05:46', '2017-12-23 01:05:46'),
(16, 'administrativos', 'administrativos', 'Administrativo', 'Administrativos', 'voyager-github', 'App\\Administrativo', NULL, NULL, NULL, 1, 1, '2017-12-23 01:37:56', '2017-12-23 01:37:56'),
(17, 'administrador', 'administrador', 'Administrador', 'Administradors', 'voyager-trees', 'App\\Administrador', NULL, NULL, NULL, 1, 1, '2017-12-23 01:44:41', '2017-12-23 01:44:41'),
(18, 'bascula', 'bascula', 'Bascula', 'Basculas', 'voyager-campfire', 'App\\Bascula', NULL, NULL, NULL, 1, 1, '2017-12-23 02:03:39', '2017-12-23 02:03:39'),
(19, 'batea', 'batea', 'Batea', 'Bateas', 'voyager-credit-card', 'App\\Batea', NULL, NULL, NULL, 1, 1, '2017-12-23 02:26:25', '2017-12-23 02:26:25'),
(20, 'bateas', 'bateas', 'Batea', 'Bateas', 'voyager-gift', 'App\\Batea', NULL, NULL, NULL, 1, 1, '2017-12-23 02:27:26', '2017-12-23 02:36:20'),
(22, 'clima', 'clima', 'Clima', 'Climas', 'voyager-lighthouse', 'App\\Clima', NULL, NULL, NULL, 1, 1, '2017-12-28 01:42:05', '2017-12-28 01:42:05'),
(23, 'conexion', 'conexion', 'Conexion', 'Conexion', 'voyager-watch', 'App\\Conexion', NULL, NULL, NULL, 1, 1, '2017-12-28 01:57:54', '2017-12-28 02:00:08'),
(25, 'encargadovehiculo', 'encargadovehiculo', 'Encargadovehiculo', 'Encargadovehiculos', NULL, 'App\\Encargadovehiculo', NULL, NULL, NULL, 1, 0, '2017-12-28 02:07:49', '2017-12-28 02:07:49'),
(26, 'generadortransportista', 'generadortransportista', 'Generadortransportistum', 'Generadortransportista', 'voyager-double-up', 'App\\Generadortransportistum', NULL, NULL, NULL, 1, 1, '2017-12-28 02:18:25', '2017-12-28 02:42:54'),
(27, 'viaje', 'viaje', 'Viaje', 'Viajes', NULL, 'App\\Viaje', NULL, NULL, NULL, 1, 1, '2017-12-28 02:33:44', '2017-12-28 02:33:44'),
(28, 'viajes', 'viajes', 'Viaje', 'Viajes', 'voyager-dot-2', 'App\\Viaje', NULL, NULL, NULL, 1, 0, '2017-12-28 02:40:38', '2017-12-28 02:40:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargadovehiculos`
--

CREATE TABLE `encargadovehiculos` (
  `id` int(10) UNSIGNED NOT NULL,
  `IdTrans` int(11) NOT NULL,
  `Nombre` varbinary(100) NOT NULL,
  `cuit` bigint(20) NOT NULL,
  `celular` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Observacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Deuda` double DEFAULT NULL,
  `Infraccion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event_models`
--

CREATE TABLE `event_models` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `all_day` binary(1) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `event_models`
--

INSERT INTO `event_models` (`id`, `title`, `all_day`, `start`, `end`) VALUES
(1, 'Rascarmesasadsada', 0x01, '2018-01-02', '2018-01-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generadors`
--

CREATE TABLE `generadors` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_dni` int(11) NOT NULL,
  `cuit` int(11) NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `domicilio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `numero_domicilio` int(11) DEFAULT NULL,
  `localidad` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_fijo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_celular` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_celular_alt` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `habilitacion` tinyint(4) NOT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `latitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longuitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generadortransportista`
--

CREATE TABLE `generadortransportista` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_generador` int(11) NOT NULL,
  `id_transportista` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `address` varchar(80) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `markers`
--

INSERT INTO `markers` (`id`, `name`, `address`, `lat`, `lng`, `type`) VALUES
(1, 'Putos', '580 Darling Street, Rozelle, NSW', -31.540262, -68.538963, 'restaurant'),
(2, 'Young Henrys', '76 Wilford Street, Newtown, NSW', -31.547579, -68.536095, 'bar'),
(3, 'Diego999', 'Greenwood Plaza, 36 Blue St, North Sydney NSW', -31.544037, -68.524910, 'bar'),
(4, 'The Potting Shed', '7A, 2 Huntley Street, Alexandria, NSW', -31.538475, -68.519691, 'bar'),
(5, 'Nomad', '16 Foster Street, Surry Hills, NSW', -31.537189, -68.509529, 'bar'),
(6, 'Three Blue Ducks', '43 Macpherson Street, Bronte, NSW', -31.525545, -68.507347, 'restaurant'),
(7, 'Single Origin Roasters', '60-64 Reservoir Street, Surry Hills, NSW', -31.523022, -68.512077, 'restaurant'),
(8, 'Red Lantern', '60 Riley Street, Darlinghurst, NSW', -31.524433, -68.522232, 'restaurant');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2017-12-16 00:47:08', '2017-12-16 00:47:08'),
(2, 'admin_local_menu', '2017-12-16 01:31:05', '2017-12-16 01:31:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2017-12-16 00:47:08', '2017-12-16 00:47:08', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2017-12-16 00:47:08', '2017-12-16 02:17:21', 'voyager.media.index', NULL),
(3, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2017-12-16 00:47:08', '2017-12-16 02:17:21', 'voyager.posts.index', NULL),
(4, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2017-12-16 00:47:08', '2017-12-16 00:47:08', 'voyager.users.index', NULL),
(5, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2017-12-16 00:47:08', '2017-12-16 02:17:21', 'voyager.categories.index', NULL),
(6, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2017-12-16 00:47:08', '2017-12-16 02:17:21', 'voyager.pages.index', NULL),
(7, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2017-12-16 00:47:08', '2017-12-16 00:47:08', 'voyager.roles.index', NULL),
(8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2017-12-16 00:47:08', '2017-12-16 02:17:21', NULL, NULL),
(9, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 8, 1, '2017-12-16 00:47:08', '2017-12-16 02:17:21', 'voyager.menus.index', NULL),
(10, 1, 'Database', '', '_self', 'voyager-data', NULL, 8, 2, '2017-12-16 00:47:09', '2017-12-16 02:17:22', 'voyager.database.index', NULL),
(11, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 8, 3, '2017-12-16 00:47:09', '2017-12-16 02:17:22', 'voyager.compass.index', NULL),
(12, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 8, 4, '2017-12-16 00:47:09', '2017-12-16 02:17:22', 'voyager.hooks', NULL),
(13, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2017-12-16 00:47:09', '2017-12-16 02:17:22', 'voyager.settings.index', NULL),
(16, 1, 'Personas', '/admin/personas', '_self', 'voyager-person', NULL, NULL, 10, '2017-12-16 02:37:03', '2017-12-22 03:33:37', NULL, NULL),
(17, 1, 'Choferes', '/admin/chofer', '_self', 'voyager-meh', NULL, NULL, 11, '2017-12-16 03:20:09', '2017-12-22 03:33:37', NULL, NULL),
(18, 1, 'Transportistas', '', '_self', 'voyager-music', '#000000', NULL, 12, '2017-12-22 03:34:36', '2017-12-22 03:34:36', 'voyager.transportistas.index', 'null'),
(19, 1, 'Transportista', '/admin/transportista', '_self', 'voyager-music', NULL, NULL, 13, '2017-12-22 03:37:01', '2017-12-22 03:37:01', NULL, NULL),
(20, 1, 'Generadores', '/admin/generador', '_self', 'voyager-bulb', '#000000', NULL, 14, '2017-12-23 01:05:46', '2017-12-23 01:21:32', NULL, ''),
(21, 1, 'Administrativos', '/admin/administrativos', '_self', 'voyager-github', NULL, NULL, 15, '2017-12-23 01:37:56', '2017-12-23 01:37:56', NULL, NULL),
(22, 1, 'Administradors', '/admin/administrador', '_self', 'voyager-trees', NULL, NULL, 16, '2017-12-23 01:44:41', '2017-12-23 01:44:41', NULL, NULL),
(23, 1, 'Basculas', '/admin/bascula', '_self', 'voyager-campfire', NULL, NULL, 17, '2017-12-23 02:03:40', '2017-12-23 02:03:40', NULL, NULL),
(25, 1, 'Bateas', '/admin/bateas', '_self', NULL, NULL, NULL, 18, '2017-12-23 02:27:27', '2017-12-28 00:34:39', NULL, NULL),
(26, 1, 'Climas', '/admin/clima', '_self', 'voyager-lighthouse', NULL, NULL, 19, '2017-12-28 01:42:05', '2017-12-28 01:42:05', NULL, NULL),
(27, 1, 'Conexions', '/admin/conexion', '_self', 'voyager-watch', NULL, NULL, 20, '2017-12-28 01:57:55', '2017-12-28 01:57:55', NULL, NULL),
(28, 1, 'Encargadovehiculos', '/admin/encargadovehiculo', '_self', NULL, NULL, NULL, 21, '2017-12-28 02:07:50', '2017-12-28 02:07:50', NULL, NULL),
(29, 1, 'Generadortransportista', '/admin/generadortransportista', '_self', 'voyager-bag', NULL, NULL, 22, '2017-12-28 02:18:25', '2017-12-28 02:18:25', NULL, NULL),
(31, 1, 'Viajes', '/admin/viajes', '_self', 'voyager-dot-2', NULL, NULL, 24, '2017-12-28 02:40:38', '2017-12-28 02:40:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1),
(17, '2017_01_15_000000_create_permission_groups_table', 1),
(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(20, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(21, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(22, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(23, '2017_08_05_000000_add_group_to_settings_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'browse_admin', NULL, '2017-12-16 00:47:09', '2017-12-16 00:47:09', NULL),
(2, 'browse_database', NULL, '2017-12-16 00:47:09', '2017-12-16 00:47:09', NULL),
(3, 'browse_media', NULL, '2017-12-16 00:47:09', '2017-12-16 00:47:09', NULL),
(4, 'browse_compass', NULL, '2017-12-16 00:47:09', '2017-12-16 00:47:09', NULL),
(5, 'browse_menus', 'menus', '2017-12-16 00:47:09', '2017-12-16 00:47:09', NULL),
(6, 'read_menus', 'menus', '2017-12-16 00:47:09', '2017-12-16 00:47:09', NULL),
(7, 'edit_menus', 'menus', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(8, 'add_menus', 'menus', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(9, 'delete_menus', 'menus', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(10, 'browse_pages', 'pages', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(11, 'read_pages', 'pages', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(12, 'edit_pages', 'pages', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(13, 'add_pages', 'pages', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(14, 'delete_pages', 'pages', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(15, 'browse_roles', 'roles', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(16, 'read_roles', 'roles', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(17, 'edit_roles', 'roles', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(18, 'add_roles', 'roles', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(19, 'delete_roles', 'roles', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(20, 'browse_users', 'users', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(21, 'read_users', 'users', '2017-12-16 00:47:10', '2017-12-16 00:47:10', NULL),
(22, 'edit_users', 'users', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(23, 'add_users', 'users', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(24, 'delete_users', 'users', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(25, 'browse_posts', 'posts', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(26, 'read_posts', 'posts', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(27, 'edit_posts', 'posts', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(28, 'add_posts', 'posts', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(29, 'delete_posts', 'posts', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(30, 'browse_categories', 'categories', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(31, 'read_categories', 'categories', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(32, 'edit_categories', 'categories', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(33, 'add_categories', 'categories', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(34, 'delete_categories', 'categories', '2017-12-16 00:47:11', '2017-12-16 00:47:11', NULL),
(35, 'browse_settings', 'settings', '2017-12-16 00:47:12', '2017-12-16 00:47:12', NULL),
(36, 'read_settings', 'settings', '2017-12-16 00:47:12', '2017-12-16 00:47:12', NULL),
(37, 'edit_settings', 'settings', '2017-12-16 00:47:12', '2017-12-16 00:47:12', NULL),
(38, 'add_settings', 'settings', '2017-12-16 00:47:12', '2017-12-16 00:47:12', NULL),
(39, 'delete_settings', 'settings', '2017-12-16 00:47:12', '2017-12-16 00:47:12', NULL),
(45, 'browse_persona', 'persona', '2017-12-16 02:26:02', '2017-12-16 02:26:02', NULL),
(46, 'read_persona', 'persona', '2017-12-16 02:26:02', '2017-12-16 02:26:02', NULL),
(47, 'edit_persona', 'persona', '2017-12-16 02:26:02', '2017-12-16 02:26:02', NULL),
(48, 'add_persona', 'persona', '2017-12-16 02:26:02', '2017-12-16 02:26:02', NULL),
(49, 'delete_persona', 'persona', '2017-12-16 02:26:02', '2017-12-16 02:26:02', NULL),
(50, 'browse_personas', 'personas', '2017-12-16 02:37:03', '2017-12-16 02:37:03', NULL),
(51, 'read_personas', 'personas', '2017-12-16 02:37:03', '2017-12-16 02:37:03', NULL),
(52, 'edit_personas', 'personas', '2017-12-16 02:37:03', '2017-12-16 02:37:03', NULL),
(53, 'add_personas', 'personas', '2017-12-16 02:37:03', '2017-12-16 02:37:03', NULL),
(54, 'delete_personas', 'personas', '2017-12-16 02:37:03', '2017-12-16 02:37:03', NULL),
(55, 'browse_chofer', 'chofer', '2017-12-16 03:20:09', '2017-12-16 03:20:09', NULL),
(56, 'read_chofer', 'chofer', '2017-12-16 03:20:09', '2017-12-16 03:20:09', NULL),
(57, 'edit_chofer', 'chofer', '2017-12-16 03:20:09', '2017-12-16 03:20:09', NULL),
(58, 'add_chofer', 'chofer', '2017-12-16 03:20:09', '2017-12-16 03:20:09', NULL),
(59, 'delete_chofer', 'chofer', '2017-12-16 03:20:09', '2017-12-16 03:20:09', NULL),
(60, 'browse_transportista', 'transportista', '2017-12-22 03:37:01', '2017-12-22 03:37:01', NULL),
(61, 'read_transportista', 'transportista', '2017-12-22 03:37:01', '2017-12-22 03:37:01', NULL),
(62, 'edit_transportista', 'transportista', '2017-12-22 03:37:01', '2017-12-22 03:37:01', NULL),
(63, 'add_transportista', 'transportista', '2017-12-22 03:37:01', '2017-12-22 03:37:01', NULL),
(64, 'delete_transportista', 'transportista', '2017-12-22 03:37:01', '2017-12-22 03:37:01', NULL),
(65, 'browse_generador', 'generador', '2017-12-23 01:05:46', '2017-12-23 01:05:46', NULL),
(66, 'read_generador', 'generador', '2017-12-23 01:05:46', '2017-12-23 01:05:46', NULL),
(67, 'edit_generador', 'generador', '2017-12-23 01:05:46', '2017-12-23 01:05:46', NULL),
(68, 'add_generador', 'generador', '2017-12-23 01:05:46', '2017-12-23 01:05:46', NULL),
(69, 'delete_generador', 'generador', '2017-12-23 01:05:46', '2017-12-23 01:05:46', NULL),
(70, 'browse_administrativos', 'administrativos', '2017-12-23 01:37:56', '2017-12-23 01:37:56', NULL),
(71, 'read_administrativos', 'administrativos', '2017-12-23 01:37:56', '2017-12-23 01:37:56', NULL),
(72, 'edit_administrativos', 'administrativos', '2017-12-23 01:37:56', '2017-12-23 01:37:56', NULL),
(73, 'add_administrativos', 'administrativos', '2017-12-23 01:37:56', '2017-12-23 01:37:56', NULL),
(74, 'delete_administrativos', 'administrativos', '2017-12-23 01:37:56', '2017-12-23 01:37:56', NULL),
(75, 'browse_administrador', 'administrador', '2017-12-23 01:44:41', '2017-12-23 01:44:41', NULL),
(76, 'read_administrador', 'administrador', '2017-12-23 01:44:41', '2017-12-23 01:44:41', NULL),
(77, 'edit_administrador', 'administrador', '2017-12-23 01:44:41', '2017-12-23 01:44:41', NULL),
(78, 'add_administrador', 'administrador', '2017-12-23 01:44:41', '2017-12-23 01:44:41', NULL),
(79, 'delete_administrador', 'administrador', '2017-12-23 01:44:41', '2017-12-23 01:44:41', NULL),
(80, 'browse_bascula', 'bascula', '2017-12-23 02:03:40', '2017-12-23 02:03:40', NULL),
(81, 'read_bascula', 'bascula', '2017-12-23 02:03:40', '2017-12-23 02:03:40', NULL),
(82, 'edit_bascula', 'bascula', '2017-12-23 02:03:40', '2017-12-23 02:03:40', NULL),
(83, 'add_bascula', 'bascula', '2017-12-23 02:03:40', '2017-12-23 02:03:40', NULL),
(84, 'delete_bascula', 'bascula', '2017-12-23 02:03:40', '2017-12-23 02:03:40', NULL),
(85, 'browse_batea', 'batea', '2017-12-23 02:26:25', '2017-12-23 02:26:25', NULL),
(86, 'read_batea', 'batea', '2017-12-23 02:26:25', '2017-12-23 02:26:25', NULL),
(87, 'edit_batea', 'batea', '2017-12-23 02:26:25', '2017-12-23 02:26:25', NULL),
(88, 'add_batea', 'batea', '2017-12-23 02:26:25', '2017-12-23 02:26:25', NULL),
(89, 'delete_batea', 'batea', '2017-12-23 02:26:25', '2017-12-23 02:26:25', NULL),
(90, 'browse_bateas', 'bateas', '2017-12-23 02:27:26', '2017-12-23 02:27:26', NULL),
(91, 'read_bateas', 'bateas', '2017-12-23 02:27:26', '2017-12-23 02:27:26', NULL),
(92, 'edit_bateas', 'bateas', '2017-12-23 02:27:26', '2017-12-23 02:27:26', NULL),
(93, 'add_bateas', 'bateas', '2017-12-23 02:27:26', '2017-12-23 02:27:26', NULL),
(94, 'delete_bateas', 'bateas', '2017-12-23 02:27:26', '2017-12-23 02:27:26', NULL),
(95, 'browse_clima', 'clima', '2017-12-28 01:42:05', '2017-12-28 01:42:05', NULL),
(96, 'read_clima', 'clima', '2017-12-28 01:42:05', '2017-12-28 01:42:05', NULL),
(97, 'edit_clima', 'clima', '2017-12-28 01:42:05', '2017-12-28 01:42:05', NULL),
(98, 'add_clima', 'clima', '2017-12-28 01:42:05', '2017-12-28 01:42:05', NULL),
(99, 'delete_clima', 'clima', '2017-12-28 01:42:05', '2017-12-28 01:42:05', NULL),
(100, 'browse_conexion', 'conexion', '2017-12-28 01:57:55', '2017-12-28 01:57:55', NULL),
(101, 'read_conexion', 'conexion', '2017-12-28 01:57:55', '2017-12-28 01:57:55', NULL),
(102, 'edit_conexion', 'conexion', '2017-12-28 01:57:55', '2017-12-28 01:57:55', NULL),
(103, 'add_conexion', 'conexion', '2017-12-28 01:57:55', '2017-12-28 01:57:55', NULL),
(104, 'delete_conexion', 'conexion', '2017-12-28 01:57:55', '2017-12-28 01:57:55', NULL),
(105, 'browse_encargadovehiculo', 'encargadovehiculo', '2017-12-28 02:07:50', '2017-12-28 02:07:50', NULL),
(106, 'read_encargadovehiculo', 'encargadovehiculo', '2017-12-28 02:07:50', '2017-12-28 02:07:50', NULL),
(107, 'edit_encargadovehiculo', 'encargadovehiculo', '2017-12-28 02:07:50', '2017-12-28 02:07:50', NULL),
(108, 'add_encargadovehiculo', 'encargadovehiculo', '2017-12-28 02:07:50', '2017-12-28 02:07:50', NULL),
(109, 'delete_encargadovehiculo', 'encargadovehiculo', '2017-12-28 02:07:50', '2017-12-28 02:07:50', NULL),
(110, 'browse_generadortransportista', 'generadortransportista', '2017-12-28 02:18:25', '2017-12-28 02:18:25', NULL),
(111, 'read_generadortransportista', 'generadortransportista', '2017-12-28 02:18:25', '2017-12-28 02:18:25', NULL),
(112, 'edit_generadortransportista', 'generadortransportista', '2017-12-28 02:18:25', '2017-12-28 02:18:25', NULL),
(113, 'add_generadortransportista', 'generadortransportista', '2017-12-28 02:18:25', '2017-12-28 02:18:25', NULL),
(114, 'delete_generadortransportista', 'generadortransportista', '2017-12-28 02:18:25', '2017-12-28 02:18:25', NULL),
(115, 'browse_viaje', 'viaje', '2017-12-28 02:33:44', '2017-12-28 02:33:44', NULL),
(116, 'read_viaje', 'viaje', '2017-12-28 02:33:44', '2017-12-28 02:33:44', NULL),
(117, 'edit_viaje', 'viaje', '2017-12-28 02:33:44', '2017-12-28 02:33:44', NULL),
(118, 'add_viaje', 'viaje', '2017-12-28 02:33:44', '2017-12-28 02:33:44', NULL),
(119, 'delete_viaje', 'viaje', '2017-12-28 02:33:44', '2017-12-28 02:33:44', NULL),
(120, 'browse_viajes', 'viajes', '2017-12-28 02:40:38', '2017-12-28 02:40:38', NULL),
(121, 'read_viajes', 'viajes', '2017-12-28 02:40:38', '2017-12-28 02:40:38', NULL),
(122, 'edit_viajes', 'viajes', '2017-12-28 02:40:38', '2017-12-28 02:40:38', NULL),
(123, 'add_viajes', 'viajes', '2017-12-28 02:40:38', '2017-12-28 02:40:38', NULL),
(124, 'delete_viajes', 'viajes', '2017-12-28 02:40:38', '2017-12-28 02:40:38', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 3),
(4, 1),
(4, 3),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `cargo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `departamento` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `observacion` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `dni`, `cargo`, `departamento`, `mail`, `estado`, `id_usuario`, `observacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Diego', 34328945, 'Administrativo', 'Informatica', 'diegochecarelli@hotmail.com', 1, 0, '0', '2017-12-16 02:37:52', '2017-12-16 02:37:52', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(5, 1, 3, 'Mi super post', NULL, 'este post es fruta', '<p>En este contenido copado cuando no se que mierda escribir para eso mas a tirar fruta.</p>\r\n<p>&nbsp;</p>\r\n<p>&lt;hr&gt;</p>\r\n<p>&lt;/div&gt;</p>\r\n<p>&lt;div class=\"col-lg-8 mx-auto\"&gt;</p>\r\n<p>&lt;p class=\"text-faded mb-5\"&gt;Son todos putos better websites using the Bootstrap CSS framework! Just&lt;/p&gt;</p>\r\n<p>@foreach ($posts as $post)</p>\r\n<p>&lt;p&gt;</p>\r\n<p>{{$post-&gt;title}}</p>\r\n<p>&lt;/p&gt;</p>\r\n<p>@endforeach</p>\r\n<p>&lt;plass=\"text-faded mb-5\"&gt;&lt;/p</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&acute;p}p&acute;}</p>', 'posts/December2017/WhatsApp Image 2017-09-13 at 12.17.42 PM.jpeg', 'mi-super-post', NULL, NULL, 'PUBLISHED', 0, '2017-12-04 21:29:52', '2017-12-04 21:29:52'),
(6, 3, 3, 'ultimo post', NULL, 'mundo en blanco y negro', '<p>ue se yo estoy re loko , con una footo del mundo en blanco y negrto para poder ocupar algo de espacio</p>', 'posts/December2017/mundo.jpg', 'ultimo-post', NULL, NULL, 'DRAFT', 1, '2017-12-04 21:35:20', '2017-12-22 20:05:28'),
(7, 3, 3, 'Bajo el dolar', 'Dolar', 'Se aplicarán a padres y al club responsable y comenzarán a regir desde enero de 2018. Las más peligrosas son las motos de agua.', '<p><span style=\"color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\">Hasta diciembre de 2017 s&oacute;lo ser&aacute;n advertencias, pero a partir de enero de 2018, Seguridad N&aacute;utica, dependiente de la Secretar&iacute;a de Deportes de la Provincia, comenzar&aacute; a aplicar multas que parten desde los $15.000 cuando encuentren a menores manejando embarcaciones. La multa se aplicar&aacute; tanto a los padres del menor como al club desde donde sali&oacute;.</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px; text-align: center;\"><em>Con los diques llenos, los deportes n&aacute;uticos toman cada vez m&aacute;s relevancia en la provincia. Ullum llama con su espejo maravilloso, ubicado a 20 minutos de la Capital. Y con el crecimiento de embarcaciones de motor, tambi&eacute;n crecen los peligros. Por eso Seguridad N&aacute;utica tiene aprobada una nueva normativa que incluye grandes multas a los infractores.</em></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\"><span style=\"text-decoration: underline;\">\"El control ser&aacute; estricto con menores al frente de embarcaciones porque es el mayor problema que hoy tenemos en Ullum. Los pap&aacute;s le entregan al ni&ntilde;o chico o adolescente y los encontramos navegando solos, sin papeles\", dijo Miguel Jofr&eacute;, titular del &aacute;rea.</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\"><span style=\"color: #0000ff;\">Cont&oacute; que la semana pasada chocaron dos menores y de milagro no les pas&oacute; nada pero podr&iacute;a haber sido una tragedia. \"Nadie se hace responsable y encima los padres nos traen el problema a nosotros, cuando la responsabilidad es de ellos. Generalmente encontramos menores en motos de agua, cuya cantidad aument&oacute; much&iacute;simo en los &uacute;ltimos dos a&ntilde;os\", se&ntilde;al&oacute; el funcionario.</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\">Seguridad N&aacute;utica se encuentra armando la carpeta con la nueva normativa para compartirla con Bomberos, que trabaja tambi&eacute;n en la zona.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\">\"Ahora estamos en el proceso de informaci&oacute;n, pero a partir del primer d&iacute;a del a&ntilde;o que viene empezamos a levantar infracciones, queremos evitar males mayores\", asegur&oacute; Jofr&eacute;.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\">&nbsp;</p>', 'posts/December2017/f999x666-436984_532049_0.jpg', 'bajo-el-dolar', 'Dolar', 'Dolar', 'PUBLISHED', 1, '2017-12-22 19:53:52', '2017-12-22 20:02:22'),
(8, 1, NULL, 'Un perro asesino aterroriza a los vecinos de Villa Krause', NULL, 'el perro re mil loko de la rawson', '<p style=\"box-sizing: border-box; margin: 0px 0px 0.6em; position: relative; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\">Un fuerte vid<span style=\"text-decoration: underline;\">eo se hizo viral en las &uacute;ltimas horas gracias a un vecino de Villa Krause muy preocupado por lo que define c</span>omo un \"perro asesino\".&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\">El joven<span style=\"color: #008000;\">, identificado como Leonardo Pantano asegur&oacute; que su vecina \"no puede controlar al animal que se escap&oacute; varias veces y mat&oacute;</span> a otros animales\". Es m&aacute;s, seg&uacute;n asegura Pantano en su publicaci&oacute;n \"ella misma los usa para matar animales callejeros\".&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\"><strong>En las fuertes im&aacute;genes que public&oacute; se ve como el Pitbull sostiene del cuello a un callejerito y no lo suelta hasta mat</strong>arlo.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\">Pantano relat&oacute; que ya realiz&oacute; la denuncia en la Comisar&iacute;a 6ta y en la Polic&iacute;a Ecol&oacute;gica pero que a&uacute;n esperaban respuestas.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 0.6em; color: #414042; font-family: \'Open Sans\', sans-serif; font-size: 18px; text-align: center;\"><iframe title=\"Maluma - Felices los 4 (Official Video)\" src=\"https://www.youtube.com/embed/t_jHrUE5IOk?wmode=opaque&amp;theme=dark\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>', 'posts/January2018/dVBgptxhWpZtQnelD6cy.jpg', 'un-perro-asesino-aterroriza-a-los-vecinos-de-villa-krause', 'perro loko', 'perro loko', 'PUBLISHED', 0, '2018-01-05 02:41:18', '2018-01-05 02:41:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2017-12-16 00:47:09', '2017-12-16 00:47:09'),
(2, 'user', 'Normal User', '2017-12-16 00:47:09', '2017-12-16 00:47:09'),
(3, 'admin_local', 'admin_local', '2017-12-16 01:26:50', '2017-12-16 01:26:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 'Transportes rapidos', 1, 54656322, '12121212121', 'fsdfsdfsdf', '123vev', 'Rivadavia', 231, 'diegochecarelli@hotmail.com', '221124', '4234234', '234234234', '234234234', '234234234', 'efeeferf', 1, 1, '2017-12-23 02:52:09', '2017-12-23 02:52:09', NULL),
(3, 'Ecocon', 1, 12123321, '23121233211', 'Calle Mendoza y San Luis', '123', 'Capital', 5400, 'ecccon@hotmail.com', '23123123', '123123213', '213123312', NULL, NULL, NULL, 1, 1, '2017-12-28 00:15:07', '2017-12-28 00:15:07', NULL),
(4, 'dasdasd', 1, 22333111, '22223331111', 'asdasdasd', '12313', 'Capital', 2323, 'diegochecarelli@hotmail.com', '1231233', '123123123', '123123123', NULL, NULL, NULL, 1, 1, '2017-12-28 00:38:08', '2017-12-28 00:38:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'administrador', 'your@email.com', 'users/default.png', '$2y$10$fYluiTfAVkZilB8vjyYXSOH5i6B/Zdo4DeCr5XaSgGfIDFh/2QvEa', 'mnTyGJK734KlLgGuwwahy6PkKErjg4e41eRVizJBlpGqWaozBcD3mD7cwiwO', '2017-12-16 00:49:12', '2017-12-16 00:49:13'),
(2, 3, 'diego', 'diegochecarelli@hotmail.com', 'users/December2017/OpLIv9XYL55pPdBfP3Cs.png', '$2y$10$IE0LS03hVYzmB.C0J3jDJOrIuK.81igWSjM.h/ZfnbMPaMwj.1NqW', NULL, '2017-12-16 01:34:09', '2017-12-16 01:34:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_orden` int(11) NOT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `estado` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lugar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salida` datetime DEFAULT NULL,
  `llegada` datetime DEFAULT NULL,
  `recorrido` time DEFAULT NULL,
  `destino` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icono` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradors`
--
ALTER TABLE `administradors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `basculas`
--
ALTER TABLE `basculas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bateas`
--
ALTER TABLE `bateas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `chofers`
--
ALTER TABLE `chofers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chofer_dni_unique` (`dni`),
  ADD KEY `chofer_id_transportista_index` (`id_transportista`);

--
-- Indices de la tabla `climas`
--
ALTER TABLE `climas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compost`
--
ALTER TABLE `compost`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conexions`
--
ALTER TABLE `conexions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `encargadovehiculos`
--
ALTER TABLE `encargadovehiculos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `event_models`
--
ALTER TABLE `event_models`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generadors`
--
ALTER TABLE `generadors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generadortransportista`
--
ALTER TABLE `generadortransportista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_groups_name_unique` (`name`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persona_dni_unique` (`dni`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `transportista`
--
ALTER TABLE `transportista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradors`
--
ALTER TABLE `administradors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `administrativos`
--
ALTER TABLE `administrativos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `basculas`
--
ALTER TABLE `basculas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `bateas`
--
ALTER TABLE `bateas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `chofers`
--
ALTER TABLE `chofers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `climas`
--
ALTER TABLE `climas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `compost`
--
ALTER TABLE `compost`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `conexions`
--
ALTER TABLE `conexions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;
--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `encargadovehiculos`
--
ALTER TABLE `encargadovehiculos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `event_models`
--
ALTER TABLE `event_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `generadors`
--
ALTER TABLE `generadors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `generadortransportista`
--
ALTER TABLE `generadortransportista`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT de la tabla `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `transportista`
--
ALTER TABLE `transportista`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
