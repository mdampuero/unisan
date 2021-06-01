-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-05-2021 a las 06:32:24
-- Versión del servidor: 5.7.33-cll-lve
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `unisancl_web2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
('b447da9d-b4ac-11eb-9450-0242ac120003', 'Unidades Sanitarias', NULL, '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b44873a6-b4ac-11eb-9450-0242ac120003', 'Bacterias', NULL, '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b4490cfb-b4ac-11eb-9450-0242ac120003', 'Aromatizantes', NULL, '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b4499c4a-b4ac-11eb-9450-0242ac120003', 'Productos químicos', NULL, '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotization`
--

CREATE TABLE `cotization` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `model_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `observation` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rut` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comercial_address_street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comercial_address_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comercial_address_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_address_street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_address_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_address_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cotization`
--

INSERT INTO `cotization` (`id`, `model_id`, `observation`, `created_at`, `updated_at`, `is_delete`, `name`, `company`, `rut`, `email`, `phone`, `frequency`, `comercial_address_street`, `comercial_address_number`, `comercial_address_city`, `service_address_street`, `service_address_number`, `service_address_city`) VALUES
('17209103-b758-11eb-98fd-0050568bec9c', 'b4d0dbd0-b4ac-11eb-9450-0242ac120003', 'xxxxxxxx', '2021-05-17 21:37:33', '2021-05-17 21:37:33', 0, 'francisco garces', 'FGR S.A.', '177039926', 'prueba@email.com', '+56973374151', '2 por semana', 'Prueba', '01', 'las condes', 'prueba', '01', 'las condes'),
('cbf8df30-b765-11eb-98fd-0050568bec9c', 'b4cf2b07-b4ac-11eb-9450-0242ac120003', 'aaaa', '2021-05-17 23:15:40', '2021-05-17 23:15:40', 0, 'francisco', 'FGR S.A.', '177039926', 'fgarcesr@udd.cl', '+56973374151', '2 al mes', 'abc', '78', 'las condes', 'abc', '78', 'las condes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency`
--

CREATE TABLE `currency` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `symbol`, `is_default`, `created_at`, `updated_at`, `is_delete`) VALUES
('b44e9c54-b4ac-11eb-9450-0242ac120003', 'Peso chileno', 'CLP', '$', 1, '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_seller` tinyint(1) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observations` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiration_code` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_validate` tinyint(1) NOT NULL,
  `is_locked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`id`, `name`, `document`, `token`, `email`, `password`, `phone`, `is_seller`, `address`, `city`, `provence`, `observations`, `created_at`, `updated_at`, `is_delete`, `role`, `code_active`, `expiration_code`, `is_active`, `is_validate`, `is_locked`) VALUES
('48c0c503-b4bd-11eb-98fd-0050568bec9c', 'Mauricio Ampuero', '96691680', NULL, 'j.mendez@u-pc.cl', 'e10adc3949ba59ab', '2+5492616636938', 0, 'Barrio Alto Rodeo, Manzana B, Casa 25', 'Guaymallén', 'Mendoza', NULL, '2021-05-14 14:04:22', '2021-05-20 14:19:04', 0, 'ROLE_CUSTOMER_USER', '4760afb42edc93bc4fbabac3dbcbc57c', '2021-05-19 18:18:17', 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `demo`
--

CREATE TABLE `demo` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `demo`
--

INSERT INTO `demo` (`id`, `name`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
('b43b1b51-b4ac-11eb-9450-0242ac120003', 'Mock - 1', 'Description mock - 1', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b43ba8a0-b4ac-11eb-9450-0242ac120003', 'Mock - 2', 'Description mock - 2', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b43c288e-b4ac-11eb-9450-0242ac120003', 'Mock - 3', 'Description mock - 3', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b43cb690-b4ac-11eb-9450-0242ac120003', 'Mock - 4', 'Description mock - 4', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b43d3a69-b4ac-11eb-9450-0242ac120003', 'Mock - 5', 'Description mock - 5', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b43e0985-b4ac-11eb-9450-0242ac120003', 'Mock - 6', 'Description mock - 6', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b43ea969-b4ac-11eb-9450-0242ac120003', 'Mock - 7', 'Description mock - 7', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b43f4369-b4ac-11eb-9450-0242ac120003', 'Mock - 8', 'Description mock - 8', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b43fcbb3-b4ac-11eb-9450-0242ac120003', 'Mock - 9', 'Description mock - 9', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b4408d3b-b4ac-11eb-9450-0242ac120003', 'Mock - 10', 'Description mock - 10', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filter`
--

CREATE TABLE `filter` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `for_section` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `json_models` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `json_services` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `filter`
--

INSERT INTO `filter` (`id`, `name`, `for_section`, `json_models`, `created_at`, `updated_at`, `is_delete`, `json_services`) VALUES
('4db2d0e5-b4c4-11eb-98fd-0050568bec9c', 'Públicos', 'forEvent', '[\"b4b45ffa-b4ac-11eb-9450-0242ac120003\",\"b4b52fa7-b4ac-11eb-9450-0242ac120003\",\"b4b7c040-b4ac-11eb-9450-0242ac120003\",\"b4d5fbfc-b4ac-11eb-9450-0242ac120003\",\"b4c30128-b4ac-11eb-9450-0242ac120003\",\"b4c3e0b8-b4ac-11eb-9450-0242ac120003\",\"b4b19d3e-b4ac-11eb-9450-0242ac120003\"]', '2021-05-14 14:54:37', '2021-05-14 14:54:37', 0, '[\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b496f08a-b4ac-11eb-9450-0242ac120003\",\"b48e1818-b4ac-11eb-9450-0242ac120003\",\"b48e1818-b4ac-11eb-9450-0242ac120003\",\"b4885f8e-b4ac-11eb-9450-0242ac120003\"]'),
('88d2567a-b4c4-11eb-98fd-0050568bec9c', 'Privados', 'forEvent', '[\"b4b45ffa-b4ac-11eb-9450-0242ac120003\",\"b4b6dfbe-b4ac-11eb-9450-0242ac120003\",\"b4b7c040-b4ac-11eb-9450-0242ac120003\",\"b4d5fbfc-b4ac-11eb-9450-0242ac120003\",\"b4c30128-b4ac-11eb-9450-0242ac120003\",\"b4c3e0b8-b4ac-11eb-9450-0242ac120003\"]', '2021-05-14 14:56:16', '2021-05-14 14:56:16', 0, '[\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b496f08a-b4ac-11eb-9450-0242ac120003\",\"b48e1818-b4ac-11eb-9450-0242ac120003\",\"b48e1818-b4ac-11eb-9450-0242ac120003\"]'),
('9311bf77-b4c4-11eb-98fd-0050568bec9c', 'Minería', 'forIndustry', '[\"b4b45ffa-b4ac-11eb-9450-0242ac120003\",\"b4b6dfbe-b4ac-11eb-9450-0242ac120003\",\"b4cf2b07-b4ac-11eb-9450-0242ac120003\",\"b4bc12c9-b4ac-11eb-9450-0242ac120003\",\"b4bdc2ae-b4ac-11eb-9450-0242ac120003\",\"b4bec9c3-b4ac-11eb-9450-0242ac120003\",\"b4dd03bb-b4ac-11eb-9450-0242ac120003\",\"b4a7e601-b4ac-11eb-9450-0242ac120003\",\"b4aae4a4-b4ac-11eb-9450-0242ac120003\"]', '2021-05-14 14:56:33', '2021-05-14 14:56:33', 0, '[\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b4948b28-b4ac-11eb-9450-0242ac120003\",\"b48c7452-b4ac-11eb-9450-0242ac120003\",\"b48c7452-b4ac-11eb-9450-0242ac120003\",\"b48c7452-b4ac-11eb-9450-0242ac120003\",\"b4981f1c-b4ac-11eb-9450-0242ac120003\",\"b4885f8e-b4ac-11eb-9450-0242ac120003\",\"b4885f8e-b4ac-11eb-9450-0242ac120003\"]'),
('9f11c134-b4c4-11eb-98fd-0050568bec9c', 'Gastronómica', 'forIndustry', '[\"b4b45ffa-b4ac-11eb-9450-0242ac120003\",\"b4b6dfbe-b4ac-11eb-9450-0242ac120003\",\"b4cf2b07-b4ac-11eb-9450-0242ac120003\",\"b4d25aec-b4ac-11eb-9450-0242ac120003\",\"b4c574b5-b4ac-11eb-9450-0242ac120003\",\"b4c65188-b4ac-11eb-9450-0242ac120003\",\"b4c8da6e-b4ac-11eb-9450-0242ac120003\",\"b4b0e5b3-b4ac-11eb-9450-0242ac120003\"]', '2021-05-14 14:56:54', '2021-05-14 14:56:54', 0, '[\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b4948b28-b4ac-11eb-9450-0242ac120003\",\"b4948b28-b4ac-11eb-9450-0242ac120003\",\"b48e1818-b4ac-11eb-9450-0242ac120003\",\"b48e1818-b4ac-11eb-9450-0242ac120003\",\"b48e1818-b4ac-11eb-9450-0242ac120003\",\"b4885f8e-b4ac-11eb-9450-0242ac120003\"]'),
('af37126f-b4c4-11eb-98fd-0050568bec9c', 'Vial', 'forIndustry', '[\"b4b45ffa-b4ac-11eb-9450-0242ac120003\",\"b4b6dfbe-b4ac-11eb-9450-0242ac120003\",\"b4b7c040-b4ac-11eb-9450-0242ac120003\",\"b4cf2b07-b4ac-11eb-9450-0242ac120003\",\"b4d00a5d-b4ac-11eb-9450-0242ac120003\"]', '2021-05-14 14:57:21', '2021-05-18 14:28:13', 0, '[\"b48b5607-b4ac-11eb-9450-0242ac120003\",\"b4948b28-b4ac-11eb-9450-0242ac120003\"]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `user_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `resource` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`id`, `user_id`, `resource`, `icon`, `status`, `title`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
('8d5f4af0-b4bd-11eb-98fd-0050568bec9c', NULL, 'order_number_1', 'mdi mdi-login-variant', 'info', 'Nuevo pedido', 'Ingreso de pedido desde \'WEB\'', '2021-05-14 14:06:17', '2021-05-14 14:06:17', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model`
--

CREATE TABLE `model` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `spec` longtext COLLATE utf8_unicode_ci,
  `conditions` longtext COLLATE utf8_unicode_ci,
  `service_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `for_home` tinyint(1) NOT NULL,
  `for_industry` tinyint(1) NOT NULL,
  `for_event` tinyint(1) NOT NULL,
  `model3d` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `model`
--

INSERT INTO `model` (`id`, `name`, `picture`, `description`, `created_at`, `updated_at`, `is_delete`, `spec`, `conditions`, `service_id`, `for_home`, `for_industry`, `for_event`, `model3d`) VALUES
('b4a58b0d-b4ac-11eb-9450-0242ac120003', 'Baño Químico Vip', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 0, 1, NULL),
('b4a655d1-b4ac-11eb-9450-0242ac120003', 'Baño Químico Minusválido', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 0, 1, NULL),
('b4a71a06-b4ac-11eb-9450-0242ac120003', 'Baño Químico con conexión', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4a7e601-b4ac-11eb-9450-0242ac120003', 'Carro Urbano simple', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4a8ed44-b4ac-11eb-9450-0242ac120003', 'Carro Agrícola Doble', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4aa14fd-b4ac-11eb-9450-0242ac120003', 'Baño Químico', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 1, 1, 0, NULL),
('b4aae4a4-b4ac-11eb-9450-0242ac120003', 'Ducha Portátil', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4abb73b-b4ac-11eb-9450-0242ac120003', 'Arnés Alzador', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4ac84b5-b4ac-11eb-9450-0242ac120003', 'Punto de Agua', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4ad5761-b4ac-11eb-9450-0242ac120003', 'Caseta de Vigilancia simple', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4ae104c-b4ac-11eb-9450-0242ac120003', 'Caseta de Vigilancia con baño', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4af4634-b4ac-11eb-9450-0242ac120003', 'Caseta de Vigilancia doble', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4b01ad8-b4ac-11eb-9450-0242ac120003', 'Caseta Mudador', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 0, 1, NULL),
('b4b0e5b3-b4ac-11eb-9450-0242ac120003', 'Urinario Urijet', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4b19d3e-b4ac-11eb-9450-0242ac120003', 'Urinario pasillo', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4885f8e-b4ac-11eb-9450-0242ac120003', 0, 1, 1, NULL),
('b4b45ffa-b4ac-11eb-9450-0242ac120003', 'Trailer Vip', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48b5607-b4ac-11eb-9450-0242ac120003', 1, 1, 1, NULL),
('b4b52fa7-b4ac-11eb-9450-0242ac120003', 'Trailer Presidencial', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48b5607-b4ac-11eb-9450-0242ac120003', 1, 1, 1, NULL),
('b4b62247-b4ac-11eb-9450-0242ac120003', 'Trailer Minusvalido', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48b5607-b4ac-11eb-9450-0242ac120003', 1, 1, 1, NULL),
('b4b6dfbe-b4ac-11eb-9450-0242ac120003', 'Trailer Gold', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48b5607-b4ac-11eb-9450-0242ac120003', 1, 1, 1, NULL),
('b4b7c040-b4ac-11eb-9450-0242ac120003', 'Trailer Silver', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48b5607-b4ac-11eb-9450-0242ac120003', 1, 1, 1, NULL),
('b4b896ad-b4ac-11eb-9450-0242ac120003', 'Torres de Iluminación', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48b5607-b4ac-11eb-9450-0242ac120003', 1, 1, 1, NULL),
('b4bb4751-b4ac-11eb-9450-0242ac120003', 'Retiro de Riles', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48c7452-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4bc12c9-b4ac-11eb-9450-0242ac120003', 'Retiro de Grasas', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48c7452-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4bced06-b4ac-11eb-9450-0242ac120003', 'Retiro de Aguas Servidas', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48c7452-b4ac-11eb-9450-0242ac120003', 1, 1, 0, NULL),
('b4bdc2ae-b4ac-11eb-9450-0242ac120003', 'Limpieza Hydrojet', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48c7452-b4ac-11eb-9450-0242ac120003', 1, 1, 0, NULL),
('b4bec9c3-b4ac-11eb-9450-0242ac120003', 'Destape de ductos', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48c7452-b4ac-11eb-9450-0242ac120003', 1, 1, 0, NULL),
('b4bf9709-b4ac-11eb-9450-0242ac120003', 'Mantención de Camaras', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48c7452-b4ac-11eb-9450-0242ac120003', 1, 1, 0, NULL),
('b4c30128-b4ac-11eb-9450-0242ac120003', 'Tolva abierta 12 m3', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48e1818-b4ac-11eb-9450-0242ac120003', 0, 1, 1, NULL),
('b4c3e0b8-b4ac-11eb-9450-0242ac120003', 'Tolva abierta 20 m3', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48e1818-b4ac-11eb-9450-0242ac120003', 0, 1, 1, NULL),
('b4c4c186-b4ac-11eb-9450-0242ac120003', 'Tolva abierta 30 m3', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48e1818-b4ac-11eb-9450-0242ac120003', 0, 1, 1, NULL),
('b4c574b5-b4ac-11eb-9450-0242ac120003', 'Autocompactador 20 m3', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48e1818-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4c65188-b4ac-11eb-9450-0242ac120003', 'Tolva cerrada 15 m3', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48e1818-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4c73af0-b4ac-11eb-9450-0242ac120003', 'Tolva estanco 15 m3', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48e1818-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4c803fe-b4ac-11eb-9450-0242ac120003', 'Alza contenedor', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48e1818-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4c8da6e-b4ac-11eb-9450-0242ac120003', 'Contenedores plásticos', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b48e1818-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4cbb5b3-b4ac-11eb-9450-0242ac120003', 'Retiro de Respel', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b490dadc-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4cc78df-b4ac-11eb-9450-0242ac120003', 'Bodegas Respel', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b490dadc-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4cf2b07-b4ac-11eb-9450-0242ac120003', 'Multibucket 5 m3', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4948b28-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL);
INSERT INTO `model` (`id`, `name`, `picture`, `description`, `created_at`, `updated_at`, `is_delete`, `spec`, `conditions`, `service_id`, `for_home`, `for_industry`, `for_event`, `model3d`) VALUES
('b4d00a5d-b4ac-11eb-9450-0242ac120003', 'Multibucket 9 m3', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4948b28-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4d0dbd0-b4ac-11eb-9450-0242ac120003', 'Tolva abierta 12 m3', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4948b28-b4ac-11eb-9450-0242ac120003', 1, 0, 0, NULL),
('b4d19380-b4ac-11eb-9450-0242ac120003', 'Bagster', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4948b28-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4d25aec-b4ac-11eb-9450-0242ac120003', 'Jaula Segregación', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4948b28-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4d5277b-b4ac-11eb-9450-0242ac120003', 'Jaula de Reciclaje', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b496f08a-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4d5fbfc-b4ac-11eb-9450-0242ac120003', 'Puntos Limpios', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b496f08a-b4ac-11eb-9450-0242ac120003', 0, 1, 1, NULL),
('b4d6f5ac-b4ac-11eb-9450-0242ac120003', 'Enfardadora en origen', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b496f08a-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4d7c604-b4ac-11eb-9450-0242ac120003', 'Tolvas de Segregación', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b496f08a-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4d915bc-b4ac-11eb-9450-0242ac120003', 'Retiro de reciclables', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b496f08a-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4dc4d9c-b4ac-11eb-9450-0242ac120003', 'Oficinas', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4981f1c-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4dd03bb-b4ac-11eb-9450-0242ac120003', 'Espacios abiertos', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4981f1c-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL),
('b4ddccd2-b4ac-11eb-9450-0242ac120003', 'Sanitarios', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.', 'b4981f1c-b4ac-11eb-9450-0242ac120003', 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `note`
--

CREATE TABLE `note` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `popup_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `picture` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `orders_status_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observations` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `orders_status_id`, `channel`, `customer_name`, `observations`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, '48c0c503-b4bd-11eb-98fd-0050568bec9c', 'ENTERED', 'WEB', NULL, NULL, '2021-05-14 14:06:17', '2021-05-14 14:06:17', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_item`
--

CREATE TABLE `orders_item` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `order_id` int(11) DEFAULT NULL,
  `product_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `price` double NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orders_item`
--

INSERT INTO `orders_item` (`id`, `order_id`, `product_id`, `price`, `description`, `code`, `quantity`, `subtotal`, `created_at`, `updated_at`, `is_delete`) VALUES
('8d2f7de2-b4bd-11eb-98fd-0050568bec9c', 1, 'b469307f-b4ac-11eb-9450-0242ac120003', 100000, 'Ducha plástico', NULL, 2, '200000', '2021-05-14 14:06:17', '2021-05-14 14:06:17', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_status`
--

CREATE TABLE `orders_status` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orders_status`
--

INSERT INTO `orders_status` (`id`, `name`, `color`, `position`, `is_default`, `created_at`, `updated_at`, `is_delete`) VALUES
('CANCELLED', 'Cancelado', 'danger', 900, 0, '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0),
('DELIVERED', 'Entregado', 'info', 300, 0, '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0),
('ENTERED', 'Ingresado', 'warning', 100, 1, '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0),
('IN_PROCCESS', 'En proceso', 'primary', 200, 0, '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0),
('INVOICED', 'Facturado', 'success', 400, 0, '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0),
('ON_DELIVERY', 'En entrega', 'warning', 250, 0, '2021-05-14 12:05:42', '2021-05-14 12:05:42', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_total`
--

CREATE TABLE `orders_total` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `order_id` int(11) DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `gross` double NOT NULL,
  `total` double NOT NULL,
  `vat` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `orders_total`
--

INSERT INTO `orders_total` (`id`, `order_id`, `currency_id`, `gross`, `total`, `vat`, `created_at`, `updated_at`, `is_delete`) VALUES
('8d606ccd-b4bd-11eb-98fd-0050568bec9c', 1, 'b44e9c54-b4ac-11eb-9450-0242ac120003', 200000, 200000, 0, '2021-05-14 14:06:17', '2021-05-14 14:06:17', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `popup`
--

CREATE TABLE `popup` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `section_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `category_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `currency_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `picture` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_salient` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `category_id`, `currency_id`, `name`, `code`, `price`, `picture`, `is_salient`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
('b4656b89-b4ac-11eb-9450-0242ac120003', 'b447da9d-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Baño químico', NULL, 100000, NULL, 1, 'Unidades fabricadas en EEUU con polietileno de alta densidad y protección UV, todas cuentan con ventanillas de ventilación, tubo extracción de olores y cierre con pestillos. Urinario, lavamanos y otros adicionales son acorde al requerimiento del cliente. Las medidas son: 2,3 x 1,1 x 1,2 m Peso vacío: 75 Kgs Capacidad del estanque: 227 lts.', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b46755c9-b4ac-11eb-9450-0242ac120003', 'b447da9d-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Carro Urbano con baño', NULL, 100000, NULL, 0, 'Unidades fabricadas en acero galvanizado, posee  eje con suspención que permite desplazamiento hasta de 90 km/Hora y soporta peso de 250 kg. Posee pata estabilizadora y rueda repuesto. Carro cuenta  con escala para acceder al baño químico montado sobre él. Las características del baño pueden ser ajustadas a la necesidad del cliente. Las medidas son: 2,2 x 1,55 x 1,55 m Peso vacío: 131 Kgs. El carro cuenta con luces reglamentarias y documentación que permiten el desplazamiento en ruta.', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b469307f-b4ac-11eb-9450-0242ac120003', 'b447da9d-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Ducha plástico', NULL, 100000, NULL, 1, 'Unidades fabricadas en EEUU con polietileno de alta densidad y protección UV, todas cuentan manillas, aspersor de agua y conexión a la red de agua para  fría y caliente. Las medidas son: 2,3 x 1,1 x 1,2 m Peso vacío: 75 Kgs.', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b46ad2d0-b4ac-11eb-9450-0242ac120003', 'b447da9d-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Caseta de vigilancia', NULL, 100000, NULL, 0, '', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b46dc4e8-b4ac-11eb-9450-0242ac120003', 'b44873a6-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Bactería para grasas', NULL, 100000, NULL, 0, NULL, '2021-05-14 12:05:41', '2021-05-14 14:03:22', 0),
('b46f7b34-b4ac-11eb-9450-0242ac120003', 'b44873a6-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Bactería para residuos domiciliarios', NULL, 100000, '64828e94650a51aa3e5b879bc81248dc.jpeg', 1, NULL, '2021-05-14 12:05:41', '2021-05-14 14:08:02', 0),
('b472488b-b4ac-11eb-9450-0242ac120003', 'b4490cfb-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Spray aromatizante', NULL, 100000, NULL, 0, NULL, '2021-05-14 12:05:41', '2021-05-14 14:03:30', 0),
('b4742302-b4ac-11eb-9450-0242ac120003', 'b4490cfb-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Disco aromáticos', NULL, 100000, NULL, 0, '', '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0),
('b4772bb1-b4ac-11eb-9450-0242ac120003', 'b4499c4a-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Amonio Cuaternario', NULL, 100000, NULL, 0, NULL, '2021-05-14 12:05:41', '2021-05-14 14:03:09', 0),
('b478dc15-b4ac-11eb-9450-0242ac120003', 'b4499c4a-b4ac-11eb-9450-0242ac120003', 'b44e9c54-b4ac-11eb-9450-0242ac120003', 'Kit para urinarios', NULL, 100000, NULL, 0, NULL, '2021-05-14 12:05:42', '2021-05-14 14:03:16', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `section`
--

CREATE TABLE `section` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `section`
--

INSERT INTO `section` (`id`, `name`, `position`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
('ACCOUNT', 'Mi cuenta', 200, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('ACCOUNT-CONVENIOS', 'Listado de convenios', 300, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('ACCOUNT-CONVENIOS-DETAIL', 'Detalle de convenio', 400, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('ACCOUNT-ORDERS', 'Listado de órdenes', 500, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('ACCOUNT-ORDERS-DETAIL', 'Detalle de órden', 600, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('ACCOUNT-USERS', 'Listado de usuarios', 600, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('CART', 'Carrito de compras', 600, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('COTIZATION', 'Formulario de cotización', 600, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('FORGOT-PASSWORD', 'Olvidé mi constraseña', 1200, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('HOME', 'Inicio', 100, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('LOGIN', 'Inicio de sesión', 600, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('PRODUCT', 'Listado de productos', 1000, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('PRODUCT-DETAIL', 'Detalle de producto', 1100, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('PSALIENT', 'Productos Destacados', 1150, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('RESET-PASSWORD', 'Blanqueo de contraseña', 1300, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('SERVICES', 'Detalle de Servicio', 1500, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('SERVICES-DETAIL', 'Detalle de Model', 1500, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0),
('VALIDATE-ACCOUNT', 'Activación de cuenta', 1500, NULL, '2021-05-14 12:05:43', '2021-05-14 12:05:43', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service`
--

CREATE TABLE `service` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `service`
--

INSERT INTO `service` (`id`, `name`, `picture`, `description`, `created_at`, `updated_at`, `is_delete`, `title`) VALUES
('b4885f8e-b4ac-11eb-9450-0242ac120003', 'Unidades Sanitarias', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet'),
('b48b5607-b4ac-11eb-9450-0242ac120003', 'Baños de Lujo', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet'),
('b48c7452-b4ac-11eb-9450-0242ac120003', 'Limpieza de Fosas y Grasas', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet'),
('b48e1818-b4ac-11eb-9450-0242ac120003', 'Residuos Industriales', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet'),
('b490dadc-b4ac-11eb-9450-0242ac120003', 'Residuos Peligrosos', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet'),
('b4948b28-b4ac-11eb-9450-0242ac120003', 'Escombros', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet'),
('b496f08a-b4ac-11eb-9450-0242ac120003', 'Reciclaje y Valorización', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet'),
('b4981f1c-b4ac-11eb-9450-0242ac120003', 'Sanitización', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.', '2021-05-14 12:05:42', '2021-05-14 12:05:42', 0, 'Lorem ipsum dolor sit amet');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_category`
--

CREATE TABLE `service_category` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_subcategory`
--

CREATE TABLE `service_subcategory` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `category_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setting`
--

CREATE TABLE `setting` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `email_orders` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_cotizations` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `setting`
--

INSERT INTO `setting` (`id`, `title`, `copyright`, `created_at`, `updated_at`, `is_delete`, `email_orders`, `email_cotizations`) VALUES
('setting', 'Unisan', '© 2021 - smartraining.cl', '2021-05-14 12:05:41', '2021-05-17 21:29:30', 0, 'fgarces@unisan.cl', 'fgarces@unisan.cl');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `menu_display` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `code_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiration_code` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `picture` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `menu_display`, `password`, `facebook_id`, `phone`, `role`, `description`, `code_active`, `expiration_code`, `is_active`, `picture`, `created_at`, `updated_at`, `is_delete`) VALUES
('490d657c-b4b7-11eb-98fd-0050568bec9c', 'Mauricio Ampuero', NULL, 'mdampuero@gmail.com', 'large', '$2y$13$LHoYdIZ2QIpq2zOLudCH9upiNQTJmjZ.3s/p/5Zrz8aCiPUKm36fe', NULL, NULL, 'ROLE_SUPER', NULL, 'f8cf9ae402b701d67fd94cdd546ea200', '2021-05-19 17:14:01', 1, NULL, '2021-05-14 13:21:26', '2021-05-18 17:14:01', 0),
('b434e029-b4ac-11eb-9450-0242ac120003', 'Superusuario', NULL, 'admin@email.com', 'large', '$2y$13$LEs4yEqUr9yCQgPBYGtfiO28rppFXkUBK9NYi35e7gUupHWDS15Ga', NULL, NULL, 'ROLE_SUPER', 'Super usuario creado automaticamente, se recomienda crear otro usuario con el rol SUPER y elimine este.', NULL, NULL, 1, NULL, '2021-05-14 12:05:41', '2021-05-14 12:05:41', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visit`
--

CREATE TABLE `visit` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `visit`
--

INSERT INTO `visit` (`id`, `ip`, `created_at`, `updated_at`, `is_delete`) VALUES
('010815cc-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:01:11', '2021-05-23 21:01:11', 0),
('02873206-b4bd-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 14:02:24', '2021-05-14 14:02:24', 0),
('032b8b2b-b4c5-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 14:59:41', '2021-05-14 14:59:41', 0),
('0658b697-bc0d-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:22:49', '2021-05-23 21:22:49', 0),
('09826f83-bc0d-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:22:54', '2021-05-23 21:22:54', 0),
('0e18b121-b4bf-11eb-98fd-0050568bec9c', '66.249.84.105', '2021-05-14 14:17:03', '2021-05-14 14:17:03', 0),
('10cdddf2-b4bf-11eb-98fd-0050568bec9c', '66.249.84.109', '2021-05-14 14:17:07', '2021-05-14 14:17:07', 0),
('11f3ebb2-b832-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:37:55', '2021-05-18 23:37:55', 0),
('130f061c-b975-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-20 14:10:04', '2021-05-20 14:10:04', 0),
('17fe2156-ba85-11eb-a7bd-0050568bec9c', '205.169.39.12', '2021-05-21 22:37:16', '2021-05-21 22:37:16', 0),
('1b311b58-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:47:36', '2021-05-23 20:47:36', 0),
('1fbe5e2d-b7ea-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 15:02:54', '2021-05-18 15:02:54', 0),
('20913d35-bc09-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:54:55', '2021-05-23 20:54:55', 0),
('27d5fa35-bc09-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:55:07', '2021-05-23 20:55:07', 0),
('29b48a59-be78-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-26 23:14:46', '2021-05-26 23:14:46', 0),
('2ab1d2c1-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:48:02', '2021-05-23 20:48:02', 0),
('2bc6d7cf-b4bd-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 14:03:34', '2021-05-14 14:03:34', 0),
('2e568746-b805-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 18:16:35', '2021-05-18 18:16:35', 0),
('2e96d568-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:02:28', '2021-05-23 21:02:28', 0),
('2fb4f889-b832-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:38:45', '2021-05-18 23:38:45', 0),
('31d2e248-b7ed-11eb-a7bd-0050568bec9c', '186.106.175.43', '2021-05-18 15:24:53', '2021-05-18 15:24:53', 0),
('3283d6e2-b835-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-19 00:00:18', '2021-05-19 00:00:18', 0),
('32bbbeaf-b97f-11eb-a7bd-0050568bec9c', '186.11.60.233', '2021-05-20 15:22:32', '2021-05-20 15:22:32', 0),
('33cee53e-b4f5-11eb-98fd-0050568bec9c', '201.189.88.90', '2021-05-14 20:44:39', '2021-05-14 20:44:39', 0),
('36cc231e-b835-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-19 00:00:25', '2021-05-19 00:00:25', 0),
('36e24586-b832-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:38:57', '2021-05-18 23:38:57', 0),
('38eedc80-bcbd-11eb-b117-0050568bec9c', '186.11.7.75', '2021-05-24 18:24:05', '2021-05-24 18:24:05', 0),
('3a2ef453-bcb1-11eb-b117-0050568bec9c', '186.11.7.75', '2021-05-24 16:58:13', '2021-05-24 16:58:13', 0),
('3ae878cc-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:02:48', '2021-05-23 21:02:48', 0),
('3ec0b5b9-b835-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-19 00:00:39', '2021-05-19 00:00:39', 0),
('3ede7a10-b7f6-11eb-a7bd-0050568bec9c', '186.106.175.43', '2021-05-18 16:29:40', '2021-05-18 16:29:40', 0),
('408fcc3d-b4c4-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 14:54:15', '2021-05-14 14:54:15', 0),
('40bdf1bc-be79-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-26 23:22:35', '2021-05-26 23:22:35', 0),
('41306077-be3e-11eb-b117-0050568bec9c', '186.11.96.91', '2021-05-26 16:20:15', '2021-05-26 16:20:15', 0),
('416ececf-bc0c-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:17:18', '2021-05-23 21:17:18', 0),
('41fb10c0-b4b6-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 13:14:04', '2021-05-14 13:14:04', 0),
('425bffb4-bc0c-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:17:20', '2021-05-23 21:17:20', 0),
('49e525b2-b8da-11eb-a7bd-0050568bec9c', '201.189.98.102', '2021-05-19 19:42:04', '2021-05-19 19:42:04', 0),
('4a3a38ea-b4b6-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 13:14:18', '2021-05-14 13:14:18', 0),
('4c0a3f72-b834-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:53:51', '2021-05-18 23:53:51', 0),
('4d753dbb-b7e5-11eb-8608-0050568bec9c', '170.79.180.202', '2021-05-18 14:28:23', '2021-05-18 14:28:23', 0),
('4ea09a3d-b832-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:39:37', '2021-05-18 23:39:37', 0),
('51a06477-b832-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:39:42', '2021-05-18 23:39:42', 0),
('53534b39-b742-11eb-98fd-0050568bec9c', '186.106.175.43', '2021-05-17 19:01:45', '2021-05-17 19:01:45', 0),
('55c10f31-b4c4-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 14:54:51', '2021-05-14 14:54:51', 0),
('55d2995a-bcb1-11eb-b117-0050568bec9c', '181.42.20.138', '2021-05-24 16:58:59', '2021-05-24 16:58:59', 0),
('5677da92-b834-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:54:09', '2021-05-18 23:54:09', 0),
('567caa3b-b722-11eb-98fd-0050568bec9c', '186.106.175.43', '2021-05-17 15:12:47', '2021-05-17 15:12:47', 0),
('5841c4fd-bc07-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:42:09', '2021-05-23 20:42:09', 0),
('59a22750-b834-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:54:14', '2021-05-18 23:54:14', 0),
('5ba37ef7-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:49:24', '2021-05-23 20:49:24', 0),
('5bd5590a-b830-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:25:40', '2021-05-18 23:25:40', 0),
('5ed099ba-bc09-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:56:39', '2021-05-23 20:56:39', 0),
('6029546c-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:49:32', '2021-05-23 20:49:32', 0),
('626c430a-bc0d-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:25:23', '2021-05-23 21:25:23', 0),
('6303a6cc-b831-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:33:01', '2021-05-18 23:33:01', 0),
('642aab23-b755-11eb-98fd-0050568bec9c', '186.106.175.43', '2021-05-17 21:18:14', '2021-05-17 21:18:14', 0),
('6501e718-b820-11eb-a7bd-0050568bec9c', '186.106.175.43', '2021-05-18 21:31:23', '2021-05-18 21:31:23', 0),
('650713d6-bc0d-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:25:28', '2021-05-23 21:25:28', 0),
('6621c008-be3e-11eb-b117-0050568bec9c', '186.11.96.91', '2021-05-26 16:21:17', '2021-05-26 16:21:17', 0),
('68467cb2-b7f8-11eb-a7bd-0050568bec9c', '201.219.236.203', '2021-05-18 16:45:09', '2021-05-18 16:45:09', 0),
('688844bc-b7e6-11eb-8608-0050568bec9c', '170.79.180.202', '2021-05-18 14:36:18', '2021-05-18 14:36:18', 0),
('68a8b263-b805-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 18:18:13', '2021-05-18 18:18:13', 0),
('691f24f7-bc0d-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:25:34', '2021-05-23 21:25:34', 0),
('69e2d860-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:04:07', '2021-05-23 21:04:07', 0),
('6c23edc7-be41-11eb-b117-0050568bec9c', '186.11.96.91', '2021-05-26 16:42:56', '2021-05-26 16:42:56', 0),
('6caf1eaa-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:04:12', '2021-05-23 21:04:12', 0),
('7079840e-b4b6-11eb-98fd-0050568bec9c', '205.169.39.49', '2021-05-14 13:15:22', '2021-05-14 13:15:22', 0),
('70e9290d-b4c7-11eb-98fd-0050568bec9c', '201.189.88.90', '2021-05-14 15:17:05', '2021-05-14 15:17:05', 0),
('71280997-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:04:19', '2021-05-23 21:04:19', 0),
('739a428d-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:50:05', '2021-05-23 20:50:05', 0),
('78e65f94-b914-11eb-a7bd-0050568bec9c', '201.189.98.102', '2021-05-20 02:38:34', '2021-05-20 02:38:34', 0),
('7ae62699-b834-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:55:10', '2021-05-18 23:55:10', 0),
('7d5a6110-b831-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:33:46', '2021-05-18 23:33:46', 0),
('81a70b00-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:04:47', '2021-05-23 21:04:47', 0),
('81c74c53-bc07-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:43:19', '2021-05-23 20:43:19', 0),
('82117ebe-bcb7-11eb-b117-0050568bec9c', '181.43.225.18', '2021-05-24 17:43:11', '2021-05-24 17:43:11', 0),
('82d3172a-bc09-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:57:40', '2021-05-23 20:57:40', 0),
('84752da1-bc09-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:57:42', '2021-05-23 20:57:42', 0),
('84ba0d91-bc07-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:43:24', '2021-05-23 20:43:24', 0),
('88ac8c1e-b743-11eb-98fd-0050568bec9c', '201.189.98.102', '2021-05-17 19:10:24', '2021-05-17 19:10:24', 0),
('8a51cd1a-bc0c-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:19:21', '2021-05-23 21:19:21', 0),
('8b1955d2-bc0c-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:19:22', '2021-05-23 21:19:22', 0),
('8dc76e12-bed4-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-27 10:16:08', '2021-05-27 10:16:08', 0),
('8f50bf59-bc0d-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:26:38', '2021-05-23 21:26:38', 0),
('907cff00-b4b5-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 13:09:07', '2021-05-14 13:09:07', 0),
('92f20441-bed4-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-27 10:16:17', '2021-05-27 10:16:17', 0),
('942378f5-bc0d-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:26:47', '2021-05-23 21:26:47', 0),
('9647ab46-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:05:22', '2021-05-23 21:05:22', 0),
('9a315ad6-b830-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:27:24', '2021-05-18 23:27:24', 0),
('9a5ab23e-b833-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:48:53', '2021-05-18 23:48:53', 0),
('9d0f977b-b4c5-11eb-98fd-0050568bec9c', '201.189.88.90', '2021-05-14 15:04:00', '2021-05-14 15:04:00', 0),
('9e25dd92-b8eb-11eb-a7bd-0050568bec9c', '201.189.98.102', '2021-05-19 21:46:07', '2021-05-19 21:46:07', 0),
('9f672185-b976-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-20 14:21:09', '2021-05-20 14:21:09', 0),
('a1936afa-b97a-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-20 14:49:51', '2021-05-20 14:49:51', 0),
('a2c0aa1d-bc07-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:44:14', '2021-05-23 20:44:14', 0),
('a37dd7cf-b97f-11eb-a7bd-0050568bec9c', '186.11.60.233', '2021-05-20 15:25:41', '2021-05-20 15:25:41', 0),
('a4915411-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:51:27', '2021-05-23 20:51:27', 0),
('a6ff1f69-b7e5-11eb-8608-0050568bec9c', '170.79.180.202', '2021-05-18 14:30:54', '2021-05-18 14:30:54', 0),
('a7a118c2-bc07-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:44:22', '2021-05-23 20:44:22', 0),
('ada08fc3-b97d-11eb-a7bd-0050568bec9c', '186.11.60.233', '2021-05-20 15:11:39', '2021-05-20 15:11:39', 0),
('b1c0a2d6-b4c4-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 14:57:25', '2021-05-14 14:57:25', 0),
('b21e7100-b833-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:49:33', '2021-05-18 23:49:33', 0),
('b3121328-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:51:51', '2021-05-23 20:51:51', 0),
('b629c865-b833-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:49:40', '2021-05-18 23:49:40', 0),
('b6823c19-b4c4-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 14:57:33', '2021-05-14 14:57:33', 0),
('baf35acf-b833-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:49:48', '2021-05-18 23:49:48', 0),
('bc436f08-bc09-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:59:16', '2021-05-23 20:59:16', 0),
('bc6b1256-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:52:07', '2021-05-23 20:52:07', 0),
('c2ae23e8-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:06:36', '2021-05-23 21:06:36', 0),
('c48c3bdb-b834-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:57:14', '2021-05-18 23:57:14', 0),
('c8035ece-b4be-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 14:15:05', '2021-05-14 14:15:05', 0),
('c8044138-b4c5-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 15:05:12', '2021-05-14 15:05:12', 0),
('c8948d3a-bc0c-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:21:05', '2021-05-23 21:21:05', 0),
('c9623331-b7e4-11eb-8608-0050568bec9c', '170.79.180.202', '2021-05-18 14:24:42', '2021-05-18 14:24:42', 0),
('cac50439-b7f7-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 16:40:45', '2021-05-18 16:40:45', 0),
('cca0e297-b827-11eb-a7bd-0050568bec9c', '186.106.175.43', '2021-05-18 22:24:24', '2021-05-18 22:24:24', 0),
('cf34b8a1-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:52:38', '2021-05-23 20:52:38', 0),
('d072115d-b831-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:36:05', '2021-05-18 23:36:05', 0),
('d160cefe-b775-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-18 01:10:21', '2021-05-18 01:10:21', 0),
('d52d7680-b7e4-11eb-8608-0050568bec9c', '170.79.180.202', '2021-05-18 14:25:02', '2021-05-18 14:25:02', 0),
('d8d3c938-b805-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 18:21:21', '2021-05-18 18:21:21', 0),
('da6bb846-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:52:57', '2021-05-23 20:52:57', 0),
('de304dea-b7f8-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 16:48:27', '2021-05-18 16:48:27', 0),
('de365cbd-b978-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-20 14:37:14', '2021-05-20 14:37:14', 0),
('dec927a6-b4be-11eb-98fd-0050568bec9c', '66.249.84.109', '2021-05-14 14:15:43', '2021-05-14 14:15:43', 0),
('e0bf80aa-b4bc-11eb-98fd-0050568bec9c', '170.79.180.202', '2021-05-14 14:01:28', '2021-05-14 14:01:28', 0),
('e148a4d9-b75a-11eb-98fd-0050568bec9c', '201.189.98.102', '2021-05-17 21:57:31', '2021-05-17 21:57:31', 0),
('e40d55b7-b75a-11eb-98fd-0050568bec9c', '201.189.98.102', '2021-05-17 21:57:36', '2021-05-17 21:57:36', 0),
('e773196f-b75a-11eb-98fd-0050568bec9c', '201.189.98.102', '2021-05-17 21:57:42', '2021-05-17 21:57:42', 0),
('e803515b-b833-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:51:04', '2021-05-18 23:51:04', 0),
('eb651463-b830-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:29:41', '2021-05-18 23:29:41', 0),
('eb75fa01-b833-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:51:09', '2021-05-18 23:51:09', 0),
('edb79a4a-bc07-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:46:20', '2021-05-23 20:46:20', 0),
('ef48cbfb-bc0d-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:29:19', '2021-05-23 21:29:19', 0),
('ef85327b-b833-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:51:16', '2021-05-18 23:51:16', 0),
('eff005e1-b4de-11eb-98fd-0050568bec9c', '201.189.88.90', '2021-05-14 18:05:16', '2021-05-14 18:05:16', 0),
('f03dcb8a-b750-11eb-98fd-0050568bec9c', '201.189.98.102', '2021-05-17 20:46:22', '2021-05-17 20:46:22', 0),
('f1d155d9-b958-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-20 10:48:43', '2021-05-20 10:48:43', 0),
('f3932257-bc08-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:53:39', '2021-05-23 20:53:39', 0),
('f3cc42f7-b97e-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-20 15:20:47', '2021-05-20 15:20:47', 0),
('f4247d9e-bc07-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:46:31', '2021-05-23 20:46:31', 0),
('f696bb1b-bc07-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 20:46:35', '2021-05-23 20:46:35', 0),
('f6c43a6c-b833-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:51:28', '2021-05-18 23:51:28', 0),
('fc864472-bc0c-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:22:32', '2021-05-23 21:22:32', 0),
('fe291e7d-bcdd-11eb-b117-0050568bec9c', '186.11.7.75', '2021-05-24 22:18:40', '2021-05-24 22:18:40', 0),
('ff2c7017-bc0d-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:29:46', '2021-05-23 21:29:46', 0),
('ff5e49f6-b831-11eb-a7bd-0050568bec9c', '170.79.180.202', '2021-05-18 23:37:24', '2021-05-18 23:37:24', 0),
('ff602ee2-bc0a-11eb-b117-0050568bec9c', '170.79.180.202', '2021-05-23 21:08:18', '2021-05-23 21:08:18', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cotization`
--
ALTER TABLE `cotization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_896B83257975B7E7` (`model_id`);

--
-- Indices de la tabla `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `filter`
--
ALTER TABLE `filter`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8F3F68C5A76ED395` (`user_id`);

--
-- Indices de la tabla `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D79572D9ED5CA9E6` (`service_id`);

--
-- Indices de la tabla `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFBDFA147CA3AC35` (`popup_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEE9395C3F3` (`customer_id`),
  ADD KEY `IDX_E52FFDEE193741E5` (`orders_status_id`);

--
-- Indices de la tabla `orders_item`
--
ALTER TABLE `orders_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B1CEE4B58D9F6D38` (`order_id`),
  ADD KEY `IDX_B1CEE4B54584665A` (`product_id`);

--
-- Indices de la tabla `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders_total`
--
ALTER TABLE `orders_total`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_83854EFF8D9F6D38` (`order_id`),
  ADD KEY `IDX_83854EFF38248176` (`currency_id`);

--
-- Indices de la tabla `popup`
--
ALTER TABLE `popup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A096458D823E37A` (`section_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`),
  ADD KEY `IDX_D34A04AD38248176` (`currency_id`);

--
-- Indices de la tabla `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service_category`
--
ALTER TABLE `service_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service_subcategory`
--
ALTER TABLE `service_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C14682E412469DE2` (`category_id`);

--
-- Indices de la tabla `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cotization`
--
ALTER TABLE `cotization`
  ADD CONSTRAINT `FK_896B83257975B7E7` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`);

--
-- Filtros para la tabla `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `FK_8F3F68C5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `FK_D79572D9ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);

--
-- Filtros para la tabla `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FK_CFBDFA147CA3AC35` FOREIGN KEY (`popup_id`) REFERENCES `popup` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEE193741E5` FOREIGN KEY (`orders_status_id`) REFERENCES `orders_status` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Filtros para la tabla `orders_item`
--
ALTER TABLE `orders_item`
  ADD CONSTRAINT `FK_B1CEE4B54584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_B1CEE4B58D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Filtros para la tabla `orders_total`
--
ALTER TABLE `orders_total`
  ADD CONSTRAINT `FK_83854EFF38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_83854EFF8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Filtros para la tabla `popup`
--
ALTER TABLE `popup`
  ADD CONSTRAINT `FK_A096458D823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_D34A04AD38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`);

--
-- Filtros para la tabla `service_subcategory`
--
ALTER TABLE `service_subcategory`
  ADD CONSTRAINT `FK_C14682E412469DE2` FOREIGN KEY (`category_id`) REFERENCES `service_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
