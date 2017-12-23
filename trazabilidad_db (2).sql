-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2017 a las 01:28:46
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
(194, 20, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, NULL, 14),
(195, 20, 'batea_hasone_transportistum_relationship', 'relationship', 'transportista', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Batea\",\"table\":\"transportista\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"id\",\"label\":\"razon_social\",\"pivot_table\":\"administradors\",\"pivot\":\"0\"}', 15);

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
(20, 'bateas', 'bateas', 'Batea', 'Bateas', 'voyager-gift', 'App\\Batea', NULL, NULL, NULL, 1, 1, '2017-12-23 02:27:26', '2017-12-23 02:36:20');

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
(25, 1, 'Bateas', '/admin/bateas', '_self', NULL, NULL, NULL, 19, '2017-12-23 02:27:27', '2017-12-23 02:27:27', NULL, NULL);

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
(94, 'delete_bateas', 'bateas', '2017-12-23 02:27:26', '2017-12-23 02:27:26', NULL);

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
(94, 1);

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
(2, 'Transportes rapidos', 1, 54656322, '12121212121', 'fsdfsdfsdf', '123vev', 'Rivadavia', 231, 'diegochecarelli@hotmail.com', '221124', '4234234', '234234234', '234234234', '234234234', 'efeeferf', 1, 1, '2017-12-23 02:52:09', '2017-12-23 02:52:09', NULL);

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
-- Indices de la tabla `compost`
--
ALTER TABLE `compost`
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
-- Indices de la tabla `generadors`
--
ALTER TABLE `generadors`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT de la tabla `compost`
--
ALTER TABLE `compost`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;
--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `generadors`
--
ALTER TABLE `generadors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
