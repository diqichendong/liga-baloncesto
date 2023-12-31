-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2023 a las 10:38:09
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ligas_diqi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `ID` bigint(20) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`ID`, `NOMBRE`) VALUES
(1, 'Celtics'),
(2, 'Bucks'),
(3, '76ers'),
(4, 'Cavaliers'),
(5, 'Nets'),
(6, 'Knicks'),
(7, 'Heat'),
(8, 'Hawks'),
(9, 'Raptors'),
(10, 'Wizards'),
(11, 'Bulls'),
(12, 'Pacers'),
(13, 'Magic'),
(14, 'Hornets'),
(15, 'Pistons'),
(16, 'Nuggets'),
(17, 'Grizzlies'),
(18, 'Kings'),
(19, 'Suns'),
(20, 'Clippers'),
(21, 'Mavericks'),
(22, 'Warriors'),
(23, 'Timberwolves'),
(24, 'Jazz'),
(25, 'Pelicans'),
(26, 'Thunder'),
(27, 'Trail Blazers'),
(28, 'Lakers'),
(29, 'Spurs'),
(30, 'Rockets');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `ID` bigint(20) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `NUMERO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jornadas`
--

INSERT INTO `jornadas` (`ID`, `FECHA`, `NUMERO`) VALUES
(1, '2023-02-25', 1),
(2, '2023-03-04', 2),
(3, '2023-03-11', 3),
(4, '2023-03-18', 4),
(5, '2023-03-25', 5),
(6, '2023-04-01', 6),
(7, '2023-04-08', 7),
(8, '2023-04-15', 8),
(9, '2023-04-22', 9),
(10, '2023-04-29', 10),
(11, '2023-05-06', 11),
(12, '2023-05-13', 12),
(13, '2023-05-20', 13),
(14, '2023-05-27', 14),
(15, '2023-06-03', 15),
(16, '2023-06-10', 16),
(17, '2023-06-17', 17),
(18, '2023-06-24', 18),
(19, '2023-07-01', 19),
(20, '2023-07-08', 20),
(21, '2023-07-15', 21),
(22, '2023-07-22', 22),
(23, '2023-07-29', 23),
(24, '2023-08-05', 24),
(25, '2023-08-12', 25),
(26, '2023-08-19', 26),
(27, '2023-08-26', 27),
(28, '2023-09-02', 28),
(29, '2023-09-09', 29),
(30, '2023-09-16', 30),
(31, '2023-09-23', 31),
(32, '2023-09-30', 32),
(33, '2023-10-07', 33),
(34, '2023-10-14', 34),
(35, '2023-10-21', 35),
(36, '2023-10-28', 36),
(37, '2023-11-04', 37),
(38, '2023-11-11', 38),
(39, '2023-11-18', 39),
(40, '2023-11-25', 40),
(41, '2023-12-02', 41),
(42, '2023-12-09', 42),
(43, '2023-12-16', 43),
(44, '2023-12-23', 44),
(45, '2023-12-30', 45),
(46, '2024-01-06', 46),
(47, '2024-01-13', 47),
(48, '2024-01-20', 48),
(49, '2024-01-27', 49),
(50, '2024-02-03', 50),
(51, '2024-02-10', 51),
(52, '2024-02-17', 52),
(53, '2024-02-24', 53),
(54, '2024-03-02', 54),
(55, '2024-03-09', 55),
(56, '2024-03-16', 56),
(57, '2024-03-23', 57),
(58, '2024-03-30', 58);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas_partidos`
--

CREATE TABLE `jornadas_partidos` (
  `jornadas_ID` bigint(20) NOT NULL,
  `partidos_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jornadas_partidos`
--

INSERT INTO `jornadas_partidos` (`jornadas_ID`, `partidos_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 41),
(3, 42),
(3, 43),
(3, 44),
(3, 45),
(4, 46),
(4, 47),
(4, 48),
(4, 49),
(4, 50),
(4, 51),
(4, 52),
(4, 53),
(4, 54),
(4, 55),
(4, 56),
(4, 57),
(4, 58),
(4, 59),
(4, 60),
(5, 61),
(5, 62),
(5, 63),
(5, 64),
(5, 65),
(5, 66),
(5, 67),
(5, 68),
(5, 69),
(5, 70),
(5, 71),
(5, 72),
(5, 73),
(5, 74),
(5, 75),
(6, 76),
(6, 77),
(6, 78),
(6, 79),
(6, 80),
(6, 81),
(6, 82),
(6, 83),
(6, 84),
(6, 85),
(6, 86),
(6, 87),
(6, 88),
(6, 89),
(6, 90),
(7, 91),
(7, 92),
(7, 93),
(7, 94),
(7, 95),
(7, 96),
(7, 97),
(7, 98),
(7, 99),
(7, 100),
(7, 101),
(7, 102),
(7, 103),
(7, 104),
(7, 105),
(8, 106),
(8, 107),
(8, 108),
(8, 109),
(8, 110),
(8, 111),
(8, 112),
(8, 113),
(8, 114),
(8, 115),
(8, 116),
(8, 117),
(8, 118),
(8, 119),
(8, 120),
(9, 121),
(9, 122),
(9, 123),
(9, 124),
(9, 125),
(9, 126),
(9, 127),
(9, 128),
(9, 129),
(9, 130),
(9, 131),
(9, 132),
(9, 133),
(9, 134),
(9, 135),
(10, 136),
(10, 137),
(10, 138),
(10, 139),
(10, 140),
(10, 141),
(10, 142),
(10, 143),
(10, 144),
(10, 145),
(10, 146),
(10, 147),
(10, 148),
(10, 149),
(10, 150),
(11, 151),
(11, 152),
(11, 153),
(11, 154),
(11, 155),
(11, 156),
(11, 157),
(11, 158),
(11, 159),
(11, 160),
(11, 161),
(11, 162),
(11, 163),
(11, 164),
(11, 165),
(12, 166),
(12, 167),
(12, 168),
(12, 169),
(12, 170),
(12, 171),
(12, 172),
(12, 173),
(12, 174),
(12, 175),
(12, 176),
(12, 177),
(12, 178),
(12, 179),
(12, 180),
(13, 181),
(13, 182),
(13, 183),
(13, 184),
(13, 185),
(13, 186),
(13, 187),
(13, 188),
(13, 189),
(13, 190),
(13, 191),
(13, 192),
(13, 193),
(13, 194),
(13, 195),
(14, 196),
(14, 197),
(14, 198),
(14, 199),
(14, 200),
(14, 201),
(14, 202),
(14, 203),
(14, 204),
(14, 205),
(14, 206),
(14, 207),
(14, 208),
(14, 209),
(14, 210),
(15, 211),
(15, 212),
(15, 213),
(15, 214),
(15, 215),
(15, 216),
(15, 217),
(15, 218),
(15, 219),
(15, 220),
(15, 221),
(15, 222),
(15, 223),
(15, 224),
(15, 225),
(16, 226),
(16, 227),
(16, 228),
(16, 229),
(16, 230),
(16, 231),
(16, 232),
(16, 233),
(16, 234),
(16, 235),
(16, 236),
(16, 237),
(16, 238),
(16, 239),
(16, 240),
(17, 241),
(17, 242),
(17, 243),
(17, 244),
(17, 245),
(17, 246),
(17, 247),
(17, 248),
(17, 249),
(17, 250),
(17, 251),
(17, 252),
(17, 253),
(17, 254),
(17, 255),
(18, 256),
(18, 257),
(18, 258),
(18, 259),
(18, 260),
(18, 261),
(18, 262),
(18, 263),
(18, 264),
(18, 265),
(18, 266),
(18, 267),
(18, 268),
(18, 269),
(18, 270),
(19, 271),
(19, 272),
(19, 273),
(19, 274),
(19, 275),
(19, 276),
(19, 277),
(19, 278),
(19, 279),
(19, 280),
(19, 281),
(19, 282),
(19, 283),
(19, 284),
(19, 285),
(20, 286),
(20, 287),
(20, 288),
(20, 289),
(20, 290),
(20, 291),
(20, 292),
(20, 293),
(20, 294),
(20, 295),
(20, 296),
(20, 297),
(20, 298),
(20, 299),
(20, 300),
(21, 301),
(21, 302),
(21, 303),
(21, 304),
(21, 305),
(21, 306),
(21, 307),
(21, 308),
(21, 309),
(21, 310),
(21, 311),
(21, 312),
(21, 313),
(21, 314),
(21, 315),
(22, 316),
(22, 317),
(22, 318),
(22, 319),
(22, 320),
(22, 321),
(22, 322),
(22, 323),
(22, 324),
(22, 325),
(22, 326),
(22, 327),
(22, 328),
(22, 329),
(22, 330),
(23, 331),
(23, 332),
(23, 333),
(23, 334),
(23, 335),
(23, 336),
(23, 337),
(23, 338),
(23, 339),
(23, 340),
(23, 341),
(23, 342),
(23, 343),
(23, 344),
(23, 345),
(24, 346),
(24, 347),
(24, 348),
(24, 349),
(24, 350),
(24, 351),
(24, 352),
(24, 353),
(24, 354),
(24, 355),
(24, 356),
(24, 357),
(24, 358),
(24, 359),
(24, 360),
(25, 361),
(25, 362),
(25, 363),
(25, 364),
(25, 365),
(25, 366),
(25, 367),
(25, 368),
(25, 369),
(25, 370),
(25, 371),
(25, 372),
(25, 373),
(25, 374),
(25, 375),
(26, 376),
(26, 377),
(26, 378),
(26, 379),
(26, 380),
(26, 381),
(26, 382),
(26, 383),
(26, 384),
(26, 385),
(26, 386),
(26, 387),
(26, 388),
(26, 389),
(26, 390),
(27, 391),
(27, 392),
(27, 393),
(27, 394),
(27, 395),
(27, 396),
(27, 397),
(27, 398),
(27, 399),
(27, 400),
(27, 401),
(27, 402),
(27, 403),
(27, 404),
(27, 405),
(28, 406),
(28, 407),
(28, 408),
(28, 409),
(28, 410),
(28, 411),
(28, 412),
(28, 413),
(28, 414),
(28, 415),
(28, 416),
(28, 417),
(28, 418),
(28, 419),
(28, 420),
(29, 421),
(29, 422),
(29, 423),
(29, 424),
(29, 425),
(29, 426),
(29, 427),
(29, 428),
(29, 429),
(29, 430),
(29, 431),
(29, 432),
(29, 433),
(29, 434),
(29, 435),
(30, 436),
(30, 437),
(30, 438),
(30, 439),
(30, 440),
(30, 441),
(30, 442),
(30, 443),
(30, 444),
(30, 445),
(30, 446),
(30, 447),
(30, 448),
(30, 449),
(30, 450),
(31, 451),
(31, 452),
(31, 453),
(31, 454),
(31, 455),
(31, 456),
(31, 457),
(31, 458),
(31, 459),
(31, 460),
(31, 461),
(31, 462),
(31, 463),
(31, 464),
(31, 465),
(32, 466),
(32, 467),
(32, 468),
(32, 469),
(32, 470),
(32, 471),
(32, 472),
(32, 473),
(32, 474),
(32, 475),
(32, 476),
(32, 477),
(32, 478),
(32, 479),
(32, 480),
(33, 481),
(33, 482),
(33, 483),
(33, 484),
(33, 485),
(33, 486),
(33, 487),
(33, 488),
(33, 489),
(33, 490),
(33, 491),
(33, 492),
(33, 493),
(33, 494),
(33, 495),
(34, 496),
(34, 497),
(34, 498),
(34, 499),
(34, 500),
(34, 501),
(34, 502),
(34, 503),
(34, 504),
(34, 505),
(34, 506),
(34, 507),
(34, 508),
(34, 509),
(34, 510),
(35, 511),
(35, 512),
(35, 513),
(35, 514),
(35, 515),
(35, 516),
(35, 517),
(35, 518),
(35, 519),
(35, 520),
(35, 521),
(35, 522),
(35, 523),
(35, 524),
(35, 525),
(36, 526),
(36, 527),
(36, 528),
(36, 529),
(36, 530),
(36, 531),
(36, 532),
(36, 533),
(36, 534),
(36, 535),
(36, 536),
(36, 537),
(36, 538),
(36, 539),
(36, 540),
(37, 541),
(37, 542),
(37, 543),
(37, 544),
(37, 545),
(37, 546),
(37, 547),
(37, 548),
(37, 549),
(37, 550),
(37, 551),
(37, 552),
(37, 553),
(37, 554),
(37, 555),
(38, 556),
(38, 557),
(38, 558),
(38, 559),
(38, 560),
(38, 561),
(38, 562),
(38, 563),
(38, 564),
(38, 565),
(38, 566),
(38, 567),
(38, 568),
(38, 569),
(38, 570),
(39, 571),
(39, 572),
(39, 573),
(39, 574),
(39, 575),
(39, 576),
(39, 577),
(39, 578),
(39, 579),
(39, 580),
(39, 581),
(39, 582),
(39, 583),
(39, 584),
(39, 585),
(40, 586),
(40, 587),
(40, 588),
(40, 589),
(40, 590),
(40, 591),
(40, 592),
(40, 593),
(40, 594),
(40, 595),
(40, 596),
(40, 597),
(40, 598),
(40, 599),
(40, 600),
(41, 601),
(41, 602),
(41, 603),
(41, 604),
(41, 605),
(41, 606),
(41, 607),
(41, 608),
(41, 609),
(41, 610),
(41, 611),
(41, 612),
(41, 613),
(41, 614),
(41, 615),
(42, 616),
(42, 617),
(42, 618),
(42, 619),
(42, 620),
(42, 621),
(42, 622),
(42, 623),
(42, 624),
(42, 625),
(42, 626),
(42, 627),
(42, 628),
(42, 629),
(42, 630),
(43, 631),
(43, 632),
(43, 633),
(43, 634),
(43, 635),
(43, 636),
(43, 637),
(43, 638),
(43, 639),
(43, 640),
(43, 641),
(43, 642),
(43, 643),
(43, 644),
(43, 645),
(44, 646),
(44, 647),
(44, 648),
(44, 649),
(44, 650),
(44, 651),
(44, 652),
(44, 653),
(44, 654),
(44, 655),
(44, 656),
(44, 657),
(44, 658),
(44, 659),
(44, 660),
(45, 661),
(45, 662),
(45, 663),
(45, 664),
(45, 665),
(45, 666),
(45, 667),
(45, 668),
(45, 669),
(45, 670),
(45, 671),
(45, 672),
(45, 673),
(45, 674),
(45, 675),
(46, 676),
(46, 677),
(46, 678),
(46, 679),
(46, 680),
(46, 681),
(46, 682),
(46, 683),
(46, 684),
(46, 685),
(46, 686),
(46, 687),
(46, 688),
(46, 689),
(46, 690),
(47, 691),
(47, 692),
(47, 693),
(47, 694),
(47, 695),
(47, 696),
(47, 697),
(47, 698),
(47, 699),
(47, 700),
(47, 701),
(47, 702),
(47, 703),
(47, 704),
(47, 705),
(48, 706),
(48, 707),
(48, 708),
(48, 709),
(48, 710),
(48, 711),
(48, 712),
(48, 713),
(48, 714),
(48, 715),
(48, 716),
(48, 717),
(48, 718),
(48, 719),
(48, 720),
(49, 721),
(49, 722),
(49, 723),
(49, 724),
(49, 725),
(49, 726),
(49, 727),
(49, 728),
(49, 729),
(49, 730),
(49, 731),
(49, 732),
(49, 733),
(49, 734),
(49, 735),
(50, 736),
(50, 737),
(50, 738),
(50, 739),
(50, 740),
(50, 741),
(50, 742),
(50, 743),
(50, 744),
(50, 745),
(50, 746),
(50, 747),
(50, 748),
(50, 749),
(50, 750),
(51, 751),
(51, 752),
(51, 753),
(51, 754),
(51, 755),
(51, 756),
(51, 757),
(51, 758),
(51, 759),
(51, 760),
(51, 761),
(51, 762),
(51, 763),
(51, 764),
(51, 765),
(52, 766),
(52, 767),
(52, 768),
(52, 769),
(52, 770),
(52, 771),
(52, 772),
(52, 773),
(52, 774),
(52, 775),
(52, 776),
(52, 777),
(52, 778),
(52, 779),
(52, 780),
(53, 781),
(53, 782),
(53, 783),
(53, 784),
(53, 785),
(53, 786),
(53, 787),
(53, 788),
(53, 789),
(53, 790),
(53, 791),
(53, 792),
(53, 793),
(53, 794),
(53, 795),
(54, 796),
(54, 797),
(54, 798),
(54, 799),
(54, 800),
(54, 801),
(54, 802),
(54, 803),
(54, 804),
(54, 805),
(54, 806),
(54, 807),
(54, 808),
(54, 809),
(54, 810),
(55, 811),
(55, 812),
(55, 813),
(55, 814),
(55, 815),
(55, 816),
(55, 817),
(55, 818),
(55, 819),
(55, 820),
(55, 821),
(55, 822),
(55, 823),
(55, 824),
(55, 825),
(56, 826),
(56, 827),
(56, 828),
(56, 829),
(56, 830),
(56, 831),
(56, 832),
(56, 833),
(56, 834),
(56, 835),
(56, 836),
(56, 837),
(56, 838),
(56, 839),
(56, 840),
(57, 841),
(57, 842),
(57, 843),
(57, 844),
(57, 845),
(57, 846),
(57, 847),
(57, 848),
(57, 849),
(57, 850),
(57, 851),
(57, 852),
(57, 853),
(57, 854),
(57, 855),
(58, 856),
(58, 857),
(58, 858),
(58, 859),
(58, 860),
(58, 861),
(58, 862),
(58, 863),
(58, 864),
(58, 865),
(58, 866),
(58, 867),
(58, 868),
(58, 869),
(58, 870);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ligas`
--

CREATE TABLE `ligas` (
  `ID` bigint(20) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ligas`
--

INSERT INTO `ligas` (`ID`, `NOMBRE`) VALUES
(1, 'NBA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ligas_equipos`
--

CREATE TABLE `ligas_equipos` (
  `ligas_ID` bigint(20) NOT NULL,
  `equipos_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ligas_equipos`
--

INSERT INTO `ligas_equipos` (`ligas_ID`, `equipos_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ligas_jornadas`
--

CREATE TABLE `ligas_jornadas` (
  `ligas_ID` bigint(20) NOT NULL,
  `jornadas_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ligas_jornadas`
--

INSERT INTO `ligas_jornadas` (`ligas_ID`, `jornadas_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `ID` bigint(20) NOT NULL,
  `PUNTOSLOCAL` int(11) DEFAULT NULL,
  `PUNTOSVISITANTE` int(11) DEFAULT NULL,
  `LOCAL_ID` bigint(20) DEFAULT NULL,
  `VISITANTE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`ID`, `PUNTOSLOCAL`, `PUNTOSVISITANTE`, `LOCAL_ID`, `VISITANTE_ID`) VALUES
(1, 130, 123, 1, 16),
(2, 101, 100, 2, 17),
(3, 139, 44, 3, 18),
(4, 0, 0, 4, 19),
(5, 0, 0, 5, 20),
(6, 0, 0, 6, 21),
(7, 0, 0, 7, 22),
(8, 0, 0, 8, 23),
(9, 0, 0, 9, 24),
(10, 0, 0, 10, 25),
(11, 0, 0, 11, 26),
(12, 0, 0, 12, 27),
(13, 0, 0, 13, 28),
(14, 0, 0, 14, 29),
(15, 0, 0, 15, 30),
(16, 30, 2, 1, 17),
(17, 0, 0, 16, 18),
(18, 0, 0, 2, 19),
(19, 0, 0, 3, 20),
(20, 0, 0, 4, 21),
(21, 0, 0, 5, 22),
(22, 0, 0, 6, 23),
(23, 0, 0, 7, 24),
(24, 0, 0, 8, 25),
(25, 0, 0, 9, 26),
(26, 0, 0, 10, 27),
(27, 0, 0, 11, 28),
(28, 0, 0, 12, 29),
(29, 0, 0, 13, 30),
(30, 0, 0, 14, 15),
(31, 40, 60, 1, 18),
(32, 0, 0, 17, 19),
(33, 0, 0, 16, 20),
(34, 0, 0, 2, 21),
(35, 0, 0, 3, 22),
(36, 0, 0, 4, 23),
(37, 0, 0, 5, 24),
(38, 0, 0, 6, 25),
(39, 0, 0, 7, 26),
(40, 0, 0, 8, 27),
(41, 0, 0, 9, 28),
(42, 0, 0, 10, 29),
(43, 0, 0, 11, 30),
(44, 0, 0, 12, 15),
(45, 0, 0, 13, 14),
(46, 0, 0, 1, 19),
(47, 0, 0, 18, 20),
(48, 0, 0, 17, 21),
(49, 0, 0, 16, 22),
(50, 0, 0, 2, 23),
(51, 0, 0, 3, 24),
(52, 0, 0, 4, 25),
(53, 0, 0, 5, 26),
(54, 0, 0, 6, 27),
(55, 0, 0, 7, 28),
(56, 0, 0, 8, 29),
(57, 0, 0, 9, 30),
(58, 0, 0, 10, 15),
(59, 0, 0, 11, 14),
(60, 0, 0, 12, 13),
(61, 0, 0, 1, 20),
(62, 0, 0, 19, 21),
(63, 0, 0, 18, 22),
(64, 0, 0, 17, 23),
(65, 0, 0, 16, 24),
(66, 0, 0, 2, 25),
(67, 0, 0, 3, 26),
(68, 0, 0, 4, 27),
(69, 0, 0, 5, 28),
(70, 0, 0, 6, 29),
(71, 0, 0, 7, 30),
(72, 0, 0, 8, 15),
(73, 0, 0, 9, 14),
(74, 0, 0, 10, 13),
(75, 0, 0, 11, 12),
(76, 0, 0, 1, 21),
(77, 0, 0, 20, 22),
(78, 0, 0, 19, 23),
(79, 0, 0, 18, 24),
(80, 0, 0, 17, 25),
(81, 0, 0, 16, 26),
(82, 0, 0, 2, 27),
(83, 0, 0, 3, 28),
(84, 0, 0, 4, 29),
(85, 0, 0, 5, 30),
(86, 0, 0, 6, 15),
(87, 0, 0, 7, 14),
(88, 0, 0, 8, 13),
(89, 0, 0, 9, 12),
(90, 0, 0, 10, 11),
(91, 0, 0, 1, 22),
(92, 0, 0, 21, 23),
(93, 0, 0, 20, 24),
(94, 0, 0, 19, 25),
(95, 0, 0, 18, 26),
(96, 0, 0, 17, 27),
(97, 0, 0, 16, 28),
(98, 0, 0, 2, 29),
(99, 0, 0, 3, 30),
(100, 0, 0, 4, 15),
(101, 0, 0, 5, 14),
(102, 0, 0, 6, 13),
(103, 0, 0, 7, 12),
(104, 0, 0, 8, 11),
(105, 0, 0, 9, 10),
(106, 0, 0, 1, 23),
(107, 0, 0, 22, 24),
(108, 0, 0, 21, 25),
(109, 0, 0, 20, 26),
(110, 0, 0, 19, 27),
(111, 0, 0, 18, 28),
(112, 0, 0, 17, 29),
(113, 0, 0, 16, 30),
(114, 0, 0, 2, 15),
(115, 0, 0, 3, 14),
(116, 0, 0, 4, 13),
(117, 0, 0, 5, 12),
(118, 0, 0, 6, 11),
(119, 0, 0, 7, 10),
(120, 0, 0, 8, 9),
(121, 0, 0, 1, 24),
(122, 0, 0, 23, 25),
(123, 0, 0, 22, 26),
(124, 0, 0, 21, 27),
(125, 0, 0, 20, 28),
(126, 0, 0, 19, 29),
(127, 0, 0, 18, 30),
(128, 0, 0, 17, 15),
(129, 0, 0, 16, 14),
(130, 0, 0, 2, 13),
(131, 0, 0, 3, 12),
(132, 0, 0, 4, 11),
(133, 0, 0, 5, 10),
(134, 0, 0, 6, 9),
(135, 0, 0, 7, 8),
(136, 0, 0, 1, 25),
(137, 0, 0, 24, 26),
(138, 0, 0, 23, 27),
(139, 0, 0, 22, 28),
(140, 0, 0, 21, 29),
(141, 0, 0, 20, 30),
(142, 0, 0, 19, 15),
(143, 0, 0, 18, 14),
(144, 0, 0, 17, 13),
(145, 0, 0, 16, 12),
(146, 0, 0, 2, 11),
(147, 0, 0, 3, 10),
(148, 0, 0, 4, 9),
(149, 0, 0, 5, 8),
(150, 0, 0, 6, 7),
(151, 0, 0, 1, 26),
(152, 0, 0, 25, 27),
(153, 0, 0, 24, 28),
(154, 0, 0, 23, 29),
(155, 0, 0, 22, 30),
(156, 0, 0, 21, 15),
(157, 0, 0, 20, 14),
(158, 0, 0, 19, 13),
(159, 0, 0, 18, 12),
(160, 0, 0, 17, 11),
(161, 0, 0, 16, 10),
(162, 0, 0, 2, 9),
(163, 0, 0, 3, 8),
(164, 0, 0, 4, 7),
(165, 0, 0, 5, 6),
(166, 0, 0, 1, 27),
(167, 0, 0, 26, 28),
(168, 0, 0, 25, 29),
(169, 0, 0, 24, 30),
(170, 0, 0, 23, 15),
(171, 0, 0, 22, 14),
(172, 0, 0, 21, 13),
(173, 0, 0, 20, 12),
(174, 0, 0, 19, 11),
(175, 0, 0, 18, 10),
(176, 0, 0, 17, 9),
(177, 0, 0, 16, 8),
(178, 0, 0, 2, 7),
(179, 0, 0, 3, 6),
(180, 0, 0, 4, 5),
(181, 0, 0, 1, 28),
(182, 0, 0, 27, 29),
(183, 0, 0, 26, 30),
(184, 0, 0, 25, 15),
(185, 0, 0, 24, 14),
(186, 0, 0, 23, 13),
(187, 0, 0, 22, 12),
(188, 0, 0, 21, 11),
(189, 0, 0, 20, 10),
(190, 0, 0, 19, 9),
(191, 0, 0, 18, 8),
(192, 0, 0, 17, 7),
(193, 0, 0, 16, 6),
(194, 0, 0, 2, 5),
(195, 0, 0, 3, 4),
(196, 0, 0, 1, 29),
(197, 0, 0, 28, 30),
(198, 0, 0, 27, 15),
(199, 0, 0, 26, 14),
(200, 0, 0, 25, 13),
(201, 0, 0, 24, 12),
(202, 0, 0, 23, 11),
(203, 0, 0, 22, 10),
(204, 0, 0, 21, 9),
(205, 0, 0, 20, 8),
(206, 0, 0, 19, 7),
(207, 0, 0, 18, 6),
(208, 0, 0, 17, 5),
(209, 0, 0, 16, 4),
(210, 0, 0, 2, 3),
(211, 0, 0, 1, 30),
(212, 0, 0, 29, 15),
(213, 0, 0, 28, 14),
(214, 0, 0, 27, 13),
(215, 0, 0, 26, 12),
(216, 0, 0, 25, 11),
(217, 0, 0, 24, 10),
(218, 0, 0, 23, 9),
(219, 0, 0, 22, 8),
(220, 0, 0, 21, 7),
(221, 0, 0, 20, 6),
(222, 0, 0, 19, 5),
(223, 0, 0, 18, 4),
(224, 0, 0, 17, 3),
(225, 0, 0, 16, 2),
(226, 0, 0, 1, 15),
(227, 0, 0, 30, 14),
(228, 0, 0, 29, 13),
(229, 0, 0, 28, 12),
(230, 0, 0, 27, 11),
(231, 0, 0, 26, 10),
(232, 0, 0, 25, 9),
(233, 0, 0, 24, 8),
(234, 0, 0, 23, 7),
(235, 0, 0, 22, 6),
(236, 0, 0, 21, 5),
(237, 0, 0, 20, 4),
(238, 0, 0, 19, 3),
(239, 0, 0, 18, 2),
(240, 0, 0, 17, 16),
(241, 0, 0, 1, 14),
(242, 0, 0, 15, 13),
(243, 0, 0, 30, 12),
(244, 0, 0, 29, 11),
(245, 0, 0, 28, 10),
(246, 0, 0, 27, 9),
(247, 0, 0, 26, 8),
(248, 0, 0, 25, 7),
(249, 0, 0, 24, 6),
(250, 0, 0, 23, 5),
(251, 0, 0, 22, 4),
(252, 0, 0, 21, 3),
(253, 0, 0, 20, 2),
(254, 0, 0, 19, 16),
(255, 0, 0, 18, 17),
(256, 0, 0, 1, 13),
(257, 0, 0, 14, 12),
(258, 0, 0, 15, 11),
(259, 0, 0, 30, 10),
(260, 0, 0, 29, 9),
(261, 0, 0, 28, 8),
(262, 0, 0, 27, 7),
(263, 0, 0, 26, 6),
(264, 0, 0, 25, 5),
(265, 0, 0, 24, 4),
(266, 0, 0, 23, 3),
(267, 0, 0, 22, 2),
(268, 0, 0, 21, 16),
(269, 0, 0, 20, 17),
(270, 0, 0, 19, 18),
(271, 0, 0, 1, 12),
(272, 0, 0, 13, 11),
(273, 0, 0, 14, 10),
(274, 0, 0, 15, 9),
(275, 0, 0, 30, 8),
(276, 0, 0, 29, 7),
(277, 0, 0, 28, 6),
(278, 0, 0, 27, 5),
(279, 0, 0, 26, 4),
(280, 0, 0, 25, 3),
(281, 0, 0, 24, 2),
(282, 0, 0, 23, 16),
(283, 0, 0, 22, 17),
(284, 0, 0, 21, 18),
(285, 0, 0, 20, 19),
(286, 0, 0, 1, 11),
(287, 0, 0, 12, 10),
(288, 0, 0, 13, 9),
(289, 0, 0, 14, 8),
(290, 0, 0, 15, 7),
(291, 0, 0, 30, 6),
(292, 0, 0, 29, 5),
(293, 0, 0, 28, 4),
(294, 0, 0, 27, 3),
(295, 0, 0, 26, 2),
(296, 0, 0, 25, 16),
(297, 0, 0, 24, 17),
(298, 0, 0, 23, 18),
(299, 0, 0, 22, 19),
(300, 0, 0, 21, 20),
(301, 0, 0, 1, 10),
(302, 0, 0, 11, 9),
(303, 0, 0, 12, 8),
(304, 0, 0, 13, 7),
(305, 0, 0, 14, 6),
(306, 0, 0, 15, 5),
(307, 0, 0, 30, 4),
(308, 0, 0, 29, 3),
(309, 0, 0, 28, 2),
(310, 0, 0, 27, 16),
(311, 0, 0, 26, 17),
(312, 0, 0, 25, 18),
(313, 0, 0, 24, 19),
(314, 0, 0, 23, 20),
(315, 0, 0, 22, 21),
(316, 0, 0, 1, 9),
(317, 0, 0, 10, 8),
(318, 0, 0, 11, 7),
(319, 0, 0, 12, 6),
(320, 0, 0, 13, 5),
(321, 0, 0, 14, 4),
(322, 0, 0, 15, 3),
(323, 0, 0, 30, 2),
(324, 0, 0, 29, 16),
(325, 0, 0, 28, 17),
(326, 0, 0, 27, 18),
(327, 0, 0, 26, 19),
(328, 0, 0, 25, 20),
(329, 0, 0, 24, 21),
(330, 0, 0, 23, 22),
(331, 0, 0, 1, 8),
(332, 0, 0, 9, 7),
(333, 0, 0, 10, 6),
(334, 0, 0, 11, 5),
(335, 0, 0, 12, 4),
(336, 0, 0, 13, 3),
(337, 0, 0, 14, 2),
(338, 0, 0, 15, 16),
(339, 0, 0, 30, 17),
(340, 0, 0, 29, 18),
(341, 0, 0, 28, 19),
(342, 0, 0, 27, 20),
(343, 0, 0, 26, 21),
(344, 0, 0, 25, 22),
(345, 0, 0, 24, 23),
(346, 0, 0, 1, 7),
(347, 0, 0, 8, 6),
(348, 0, 0, 9, 5),
(349, 0, 0, 10, 4),
(350, 0, 0, 11, 3),
(351, 0, 0, 12, 2),
(352, 0, 0, 13, 16),
(353, 0, 0, 14, 17),
(354, 0, 0, 15, 18),
(355, 0, 0, 30, 19),
(356, 0, 0, 29, 20),
(357, 0, 0, 28, 21),
(358, 0, 0, 27, 22),
(359, 0, 0, 26, 23),
(360, 0, 0, 25, 24),
(361, 0, 0, 1, 6),
(362, 0, 0, 7, 5),
(363, 0, 0, 8, 4),
(364, 0, 0, 9, 3),
(365, 0, 0, 10, 2),
(366, 0, 0, 11, 16),
(367, 0, 0, 12, 17),
(368, 0, 0, 13, 18),
(369, 0, 0, 14, 19),
(370, 0, 0, 15, 20),
(371, 0, 0, 30, 21),
(372, 0, 0, 29, 22),
(373, 0, 0, 28, 23),
(374, 0, 0, 27, 24),
(375, 0, 0, 26, 25),
(376, 0, 0, 1, 5),
(377, 0, 0, 6, 4),
(378, 0, 0, 7, 3),
(379, 0, 0, 8, 2),
(380, 0, 0, 9, 16),
(381, 0, 0, 10, 17),
(382, 0, 0, 11, 18),
(383, 0, 0, 12, 19),
(384, 0, 0, 13, 20),
(385, 0, 0, 14, 21),
(386, 0, 0, 15, 22),
(387, 0, 0, 30, 23),
(388, 0, 0, 29, 24),
(389, 0, 0, 28, 25),
(390, 0, 0, 27, 26),
(391, 0, 0, 1, 4),
(392, 0, 0, 5, 3),
(393, 0, 0, 6, 2),
(394, 0, 0, 7, 16),
(395, 0, 0, 8, 17),
(396, 0, 0, 9, 18),
(397, 0, 0, 10, 19),
(398, 0, 0, 11, 20),
(399, 0, 0, 12, 21),
(400, 0, 0, 13, 22),
(401, 0, 0, 14, 23),
(402, 0, 0, 15, 24),
(403, 0, 0, 30, 25),
(404, 0, 0, 29, 26),
(405, 0, 0, 28, 27),
(406, 0, 0, 1, 3),
(407, 0, 0, 4, 2),
(408, 0, 0, 5, 16),
(409, 0, 0, 6, 17),
(410, 0, 0, 7, 18),
(411, 0, 0, 8, 19),
(412, 0, 0, 9, 20),
(413, 0, 0, 10, 21),
(414, 0, 0, 11, 22),
(415, 0, 0, 12, 23),
(416, 0, 0, 13, 24),
(417, 0, 0, 14, 25),
(418, 0, 0, 15, 26),
(419, 0, 0, 30, 27),
(420, 0, 0, 29, 28),
(421, 0, 0, 1, 2),
(422, 0, 0, 3, 16),
(423, 0, 0, 4, 17),
(424, 0, 0, 5, 18),
(425, 0, 0, 6, 19),
(426, 0, 0, 7, 20),
(427, 0, 0, 8, 21),
(428, 0, 0, 9, 22),
(429, 0, 0, 10, 23),
(430, 0, 0, 11, 24),
(431, 0, 0, 12, 25),
(432, 0, 0, 13, 26),
(433, 0, 0, 14, 27),
(434, 0, 0, 15, 28),
(435, 0, 0, 30, 29),
(436, 0, 0, 16, 1),
(437, 0, 0, 17, 2),
(438, 0, 0, 18, 3),
(439, 0, 0, 19, 4),
(440, 0, 0, 20, 5),
(441, 0, 0, 21, 6),
(442, 0, 0, 22, 7),
(443, 0, 0, 23, 8),
(444, 0, 0, 24, 9),
(445, 0, 0, 25, 10),
(446, 0, 0, 26, 11),
(447, 0, 0, 27, 12),
(448, 0, 0, 28, 13),
(449, 0, 0, 29, 14),
(450, 0, 0, 30, 15),
(451, 0, 0, 17, 1),
(452, 0, 0, 18, 16),
(453, 0, 0, 19, 2),
(454, 0, 0, 20, 3),
(455, 0, 0, 21, 4),
(456, 0, 0, 22, 5),
(457, 0, 0, 23, 6),
(458, 0, 0, 24, 7),
(459, 0, 0, 25, 8),
(460, 0, 0, 26, 9),
(461, 0, 0, 27, 10),
(462, 0, 0, 28, 11),
(463, 0, 0, 29, 12),
(464, 0, 0, 30, 13),
(465, 0, 0, 15, 14),
(466, 0, 0, 18, 1),
(467, 0, 0, 19, 17),
(468, 0, 0, 20, 16),
(469, 0, 0, 21, 2),
(470, 0, 0, 22, 3),
(471, 0, 0, 23, 4),
(472, 0, 0, 24, 5),
(473, 0, 0, 25, 6),
(474, 0, 0, 26, 7),
(475, 0, 0, 27, 8),
(476, 0, 0, 28, 9),
(477, 0, 0, 29, 10),
(478, 0, 0, 30, 11),
(479, 0, 0, 15, 12),
(480, 0, 0, 14, 13),
(481, 0, 0, 19, 1),
(482, 0, 0, 20, 18),
(483, 0, 0, 21, 17),
(484, 0, 0, 22, 16),
(485, 0, 0, 23, 2),
(486, 0, 0, 24, 3),
(487, 0, 0, 25, 4),
(488, 0, 0, 26, 5),
(489, 0, 0, 27, 6),
(490, 0, 0, 28, 7),
(491, 0, 0, 29, 8),
(492, 0, 0, 30, 9),
(493, 0, 0, 15, 10),
(494, 0, 0, 14, 11),
(495, 0, 0, 13, 12),
(496, 0, 0, 20, 1),
(497, 0, 0, 21, 19),
(498, 0, 0, 22, 18),
(499, 0, 0, 23, 17),
(500, 0, 0, 24, 16),
(501, 0, 0, 25, 2),
(502, 0, 0, 26, 3),
(503, 0, 0, 27, 4),
(504, 0, 0, 28, 5),
(505, 0, 0, 29, 6),
(506, 0, 0, 30, 7),
(507, 0, 0, 15, 8),
(508, 0, 0, 14, 9),
(509, 0, 0, 13, 10),
(510, 0, 0, 12, 11),
(511, 0, 0, 21, 1),
(512, 0, 0, 22, 20),
(513, 0, 0, 23, 19),
(514, 0, 0, 24, 18),
(515, 0, 0, 25, 17),
(516, 0, 0, 26, 16),
(517, 0, 0, 27, 2),
(518, 0, 0, 28, 3),
(519, 0, 0, 29, 4),
(520, 0, 0, 30, 5),
(521, 0, 0, 15, 6),
(522, 0, 0, 14, 7),
(523, 0, 0, 13, 8),
(524, 0, 0, 12, 9),
(525, 0, 0, 11, 10),
(526, 0, 0, 22, 1),
(527, 0, 0, 23, 21),
(528, 0, 0, 24, 20),
(529, 0, 0, 25, 19),
(530, 0, 0, 26, 18),
(531, 0, 0, 27, 17),
(532, 0, 0, 28, 16),
(533, 0, 0, 29, 2),
(534, 0, 0, 30, 3),
(535, 0, 0, 15, 4),
(536, 0, 0, 14, 5),
(537, 0, 0, 13, 6),
(538, 0, 0, 12, 7),
(539, 0, 0, 11, 8),
(540, 0, 0, 10, 9),
(541, 0, 0, 23, 1),
(542, 0, 0, 24, 22),
(543, 0, 0, 25, 21),
(544, 0, 0, 26, 20),
(545, 0, 0, 27, 19),
(546, 0, 0, 28, 18),
(547, 0, 0, 29, 17),
(548, 0, 0, 30, 16),
(549, 0, 0, 15, 2),
(550, 0, 0, 14, 3),
(551, 0, 0, 13, 4),
(552, 0, 0, 12, 5),
(553, 0, 0, 11, 6),
(554, 0, 0, 10, 7),
(555, 0, 0, 9, 8),
(556, 0, 0, 24, 1),
(557, 0, 0, 25, 23),
(558, 0, 0, 26, 22),
(559, 0, 0, 27, 21),
(560, 0, 0, 28, 20),
(561, 0, 0, 29, 19),
(562, 0, 0, 30, 18),
(563, 0, 0, 15, 17),
(564, 0, 0, 14, 16),
(565, 0, 0, 13, 2),
(566, 0, 0, 12, 3),
(567, 0, 0, 11, 4),
(568, 0, 0, 10, 5),
(569, 0, 0, 9, 6),
(570, 0, 0, 8, 7),
(571, 0, 0, 25, 1),
(572, 0, 0, 26, 24),
(573, 0, 0, 27, 23),
(574, 0, 0, 28, 22),
(575, 0, 0, 29, 21),
(576, 0, 0, 30, 20),
(577, 0, 0, 15, 19),
(578, 0, 0, 14, 18),
(579, 0, 0, 13, 17),
(580, 0, 0, 12, 16),
(581, 0, 0, 11, 2),
(582, 0, 0, 10, 3),
(583, 0, 0, 9, 4),
(584, 0, 0, 8, 5),
(585, 0, 0, 7, 6),
(586, 0, 0, 26, 1),
(587, 0, 0, 27, 25),
(588, 0, 0, 28, 24),
(589, 0, 0, 29, 23),
(590, 0, 0, 30, 22),
(591, 0, 0, 15, 21),
(592, 0, 0, 14, 20),
(593, 0, 0, 13, 19),
(594, 0, 0, 12, 18),
(595, 0, 0, 11, 17),
(596, 0, 0, 10, 16),
(597, 0, 0, 9, 2),
(598, 0, 0, 8, 3),
(599, 0, 0, 7, 4),
(600, 0, 0, 6, 5),
(601, 0, 0, 27, 1),
(602, 0, 0, 28, 26),
(603, 0, 0, 29, 25),
(604, 0, 0, 30, 24),
(605, 0, 0, 15, 23),
(606, 0, 0, 14, 22),
(607, 0, 0, 13, 21),
(608, 0, 0, 12, 20),
(609, 0, 0, 11, 19),
(610, 0, 0, 10, 18),
(611, 0, 0, 9, 17),
(612, 0, 0, 8, 16),
(613, 0, 0, 7, 2),
(614, 0, 0, 6, 3),
(615, 0, 0, 5, 4),
(616, 0, 0, 28, 1),
(617, 0, 0, 29, 27),
(618, 0, 0, 30, 26),
(619, 0, 0, 15, 25),
(620, 0, 0, 14, 24),
(621, 0, 0, 13, 23),
(622, 0, 0, 12, 22),
(623, 0, 0, 11, 21),
(624, 0, 0, 10, 20),
(625, 0, 0, 9, 19),
(626, 0, 0, 8, 18),
(627, 0, 0, 7, 17),
(628, 0, 0, 6, 16),
(629, 0, 0, 5, 2),
(630, 0, 0, 4, 3),
(631, 0, 0, 29, 1),
(632, 0, 0, 30, 28),
(633, 0, 0, 15, 27),
(634, 0, 0, 14, 26),
(635, 0, 0, 13, 25),
(636, 0, 0, 12, 24),
(637, 0, 0, 11, 23),
(638, 0, 0, 10, 22),
(639, 0, 0, 9, 21),
(640, 0, 0, 8, 20),
(641, 0, 0, 7, 19),
(642, 0, 0, 6, 18),
(643, 0, 0, 5, 17),
(644, 0, 0, 4, 16),
(645, 0, 0, 3, 2),
(646, 0, 0, 30, 1),
(647, 0, 0, 15, 29),
(648, 0, 0, 14, 28),
(649, 0, 0, 13, 27),
(650, 0, 0, 12, 26),
(651, 0, 0, 11, 25),
(652, 0, 0, 10, 24),
(653, 0, 0, 9, 23),
(654, 0, 0, 8, 22),
(655, 0, 0, 7, 21),
(656, 0, 0, 6, 20),
(657, 0, 0, 5, 19),
(658, 0, 0, 4, 18),
(659, 0, 0, 3, 17),
(660, 0, 0, 2, 16),
(661, 0, 0, 15, 1),
(662, 0, 0, 14, 30),
(663, 0, 0, 13, 29),
(664, 0, 0, 12, 28),
(665, 0, 0, 11, 27),
(666, 0, 0, 10, 26),
(667, 0, 0, 9, 25),
(668, 0, 0, 8, 24),
(669, 0, 0, 7, 23),
(670, 0, 0, 6, 22),
(671, 0, 0, 5, 21),
(672, 0, 0, 4, 20),
(673, 0, 0, 3, 19),
(674, 0, 0, 2, 18),
(675, 0, 0, 16, 17),
(676, 0, 0, 14, 1),
(677, 0, 0, 13, 15),
(678, 0, 0, 12, 30),
(679, 0, 0, 11, 29),
(680, 0, 0, 10, 28),
(681, 0, 0, 9, 27),
(682, 0, 0, 8, 26),
(683, 0, 0, 7, 25),
(684, 0, 0, 6, 24),
(685, 0, 0, 5, 23),
(686, 0, 0, 4, 22),
(687, 0, 0, 3, 21),
(688, 0, 0, 2, 20),
(689, 0, 0, 16, 19),
(690, 0, 0, 17, 18),
(691, 0, 0, 13, 1),
(692, 0, 0, 12, 14),
(693, 0, 0, 11, 15),
(694, 0, 0, 10, 30),
(695, 0, 0, 9, 29),
(696, 0, 0, 8, 28),
(697, 0, 0, 7, 27),
(698, 0, 0, 6, 26),
(699, 0, 0, 5, 25),
(700, 0, 0, 4, 24),
(701, 0, 0, 3, 23),
(702, 0, 0, 2, 22),
(703, 0, 0, 16, 21),
(704, 0, 0, 17, 20),
(705, 0, 0, 18, 19),
(706, 0, 0, 12, 1),
(707, 0, 0, 11, 13),
(708, 0, 0, 10, 14),
(709, 0, 0, 9, 15),
(710, 0, 0, 8, 30),
(711, 0, 0, 7, 29),
(712, 0, 0, 6, 28),
(713, 0, 0, 5, 27),
(714, 0, 0, 4, 26),
(715, 0, 0, 3, 25),
(716, 0, 0, 2, 24),
(717, 0, 0, 16, 23),
(718, 0, 0, 17, 22),
(719, 0, 0, 18, 21),
(720, 0, 0, 19, 20),
(721, 0, 0, 11, 1),
(722, 0, 0, 10, 12),
(723, 0, 0, 9, 13),
(724, 0, 0, 8, 14),
(725, 0, 0, 7, 15),
(726, 0, 0, 6, 30),
(727, 0, 0, 5, 29),
(728, 0, 0, 4, 28),
(729, 0, 0, 3, 27),
(730, 0, 0, 2, 26),
(731, 0, 0, 16, 25),
(732, 0, 0, 17, 24),
(733, 0, 0, 18, 23),
(734, 0, 0, 19, 22),
(735, 0, 0, 20, 21),
(736, 0, 0, 10, 1),
(737, 0, 0, 9, 11),
(738, 0, 0, 8, 12),
(739, 0, 0, 7, 13),
(740, 0, 0, 6, 14),
(741, 0, 0, 5, 15),
(742, 0, 0, 4, 30),
(743, 0, 0, 3, 29),
(744, 0, 0, 2, 28),
(745, 0, 0, 16, 27),
(746, 0, 0, 17, 26),
(747, 0, 0, 18, 25),
(748, 0, 0, 19, 24),
(749, 0, 0, 20, 23),
(750, 0, 0, 21, 22),
(751, 0, 0, 9, 1),
(752, 0, 0, 8, 10),
(753, 0, 0, 7, 11),
(754, 0, 0, 6, 12),
(755, 0, 0, 5, 13),
(756, 0, 0, 4, 14),
(757, 0, 0, 3, 15),
(758, 0, 0, 2, 30),
(759, 0, 0, 16, 29),
(760, 0, 0, 17, 28),
(761, 0, 0, 18, 27),
(762, 0, 0, 19, 26),
(763, 0, 0, 20, 25),
(764, 0, 0, 21, 24),
(765, 0, 0, 22, 23),
(766, 0, 0, 8, 1),
(767, 0, 0, 7, 9),
(768, 0, 0, 6, 10),
(769, 0, 0, 5, 11),
(770, 0, 0, 4, 12),
(771, 0, 0, 3, 13),
(772, 0, 0, 2, 14),
(773, 0, 0, 16, 15),
(774, 0, 0, 17, 30),
(775, 0, 0, 18, 29),
(776, 0, 0, 19, 28),
(777, 0, 0, 20, 27),
(778, 0, 0, 21, 26),
(779, 0, 0, 22, 25),
(780, 0, 0, 23, 24),
(781, 0, 0, 7, 1),
(782, 0, 0, 6, 8),
(783, 0, 0, 5, 9),
(784, 0, 0, 4, 10),
(785, 0, 0, 3, 11),
(786, 0, 0, 2, 12),
(787, 0, 0, 16, 13),
(788, 0, 0, 17, 14),
(789, 0, 0, 18, 15),
(790, 0, 0, 19, 30),
(791, 0, 0, 20, 29),
(792, 0, 0, 21, 28),
(793, 0, 0, 22, 27),
(794, 0, 0, 23, 26),
(795, 0, 0, 24, 25),
(796, 0, 0, 6, 1),
(797, 0, 0, 5, 7),
(798, 0, 0, 4, 8),
(799, 0, 0, 3, 9),
(800, 0, 0, 2, 10),
(801, 0, 0, 16, 11),
(802, 0, 0, 17, 12),
(803, 0, 0, 18, 13),
(804, 0, 0, 19, 14),
(805, 0, 0, 20, 15),
(806, 0, 0, 21, 30),
(807, 0, 0, 22, 29),
(808, 0, 0, 23, 28),
(809, 0, 0, 24, 27),
(810, 0, 0, 25, 26),
(811, 0, 0, 5, 1),
(812, 0, 0, 4, 6),
(813, 0, 0, 3, 7),
(814, 0, 0, 2, 8),
(815, 0, 0, 16, 9),
(816, 0, 0, 17, 10),
(817, 0, 0, 18, 11),
(818, 0, 0, 19, 12),
(819, 0, 0, 20, 13),
(820, 0, 0, 21, 14),
(821, 0, 0, 22, 15),
(822, 0, 0, 23, 30),
(823, 0, 0, 24, 29),
(824, 0, 0, 25, 28),
(825, 0, 0, 26, 27),
(826, 0, 0, 4, 1),
(827, 0, 0, 3, 5),
(828, 0, 0, 2, 6),
(829, 0, 0, 16, 7),
(830, 0, 0, 17, 8),
(831, 0, 0, 18, 9),
(832, 0, 0, 19, 10),
(833, 0, 0, 20, 11),
(834, 0, 0, 21, 12),
(835, 0, 0, 22, 13),
(836, 0, 0, 23, 14),
(837, 0, 0, 24, 15),
(838, 0, 0, 25, 30),
(839, 0, 0, 26, 29),
(840, 0, 0, 27, 28),
(841, 0, 0, 3, 1),
(842, 0, 0, 2, 4),
(843, 0, 0, 16, 5),
(844, 0, 0, 17, 6),
(845, 0, 0, 18, 7),
(846, 0, 0, 19, 8),
(847, 0, 0, 20, 9),
(848, 0, 0, 21, 10),
(849, 0, 0, 22, 11),
(850, 0, 0, 23, 12),
(851, 0, 0, 24, 13),
(852, 0, 0, 25, 14),
(853, 0, 0, 26, 15),
(854, 0, 0, 27, 30),
(855, 0, 0, 28, 29),
(856, 0, 0, 2, 1),
(857, 0, 0, 16, 3),
(858, 0, 0, 17, 4),
(859, 0, 0, 18, 5),
(860, 0, 0, 19, 6),
(861, 0, 0, 20, 7),
(862, 0, 0, 21, 8),
(863, 0, 0, 22, 9),
(864, 0, 0, 23, 10),
(865, 0, 0, 24, 11),
(866, 0, 0, 25, 12),
(867, 0, 0, 26, 13),
(868, 0, 0, 27, 14),
(869, 0, 0, 28, 15),
(870, 0, 0, 29, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` bigint(20) NOT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `TIPO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `LOGIN`, `NOMBRE`, `PASSWORD`, `TIPO`) VALUES
(1, 'diqi', 'Di Qi Chen Dong', 'diqi', 'Administrador'),
(2, 'diqi1', 'Di Qi Chen Dong', 'diqi1', 'Arbitro');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `jornadas_partidos`
--
ALTER TABLE `jornadas_partidos`
  ADD PRIMARY KEY (`jornadas_ID`,`partidos_ID`),
  ADD KEY `FK_JORNADAS_PARTIDOS_partidos_ID` (`partidos_ID`);

--
-- Indices de la tabla `ligas`
--
ALTER TABLE `ligas`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NOMBRE` (`NOMBRE`);

--
-- Indices de la tabla `ligas_equipos`
--
ALTER TABLE `ligas_equipos`
  ADD PRIMARY KEY (`ligas_ID`,`equipos_ID`),
  ADD KEY `FK_LIGAS_EQUIPOS_equipos_ID` (`equipos_ID`);

--
-- Indices de la tabla `ligas_jornadas`
--
ALTER TABLE `ligas_jornadas`
  ADD PRIMARY KEY (`ligas_ID`,`jornadas_ID`),
  ADD KEY `FK_LIGAS_JORNADAS_jornadas_ID` (`jornadas_ID`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PARTIDOS_LOCAL_ID` (`LOCAL_ID`),
  ADD KEY `FK_PARTIDOS_VISITANTE_ID` (`VISITANTE_ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `LOGIN` (`LOGIN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `ligas`
--
ALTER TABLE `ligas`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=871;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jornadas_partidos`
--
ALTER TABLE `jornadas_partidos`
  ADD CONSTRAINT `FK_JORNADAS_PARTIDOS_jornadas_ID` FOREIGN KEY (`jornadas_ID`) REFERENCES `jornadas` (`ID`),
  ADD CONSTRAINT `FK_JORNADAS_PARTIDOS_partidos_ID` FOREIGN KEY (`partidos_ID`) REFERENCES `partidos` (`ID`);

--
-- Filtros para la tabla `ligas_equipos`
--
ALTER TABLE `ligas_equipos`
  ADD CONSTRAINT `FK_LIGAS_EQUIPOS_equipos_ID` FOREIGN KEY (`equipos_ID`) REFERENCES `equipos` (`ID`),
  ADD CONSTRAINT `FK_LIGAS_EQUIPOS_ligas_ID` FOREIGN KEY (`ligas_ID`) REFERENCES `ligas` (`ID`);

--
-- Filtros para la tabla `ligas_jornadas`
--
ALTER TABLE `ligas_jornadas`
  ADD CONSTRAINT `FK_LIGAS_JORNADAS_jornadas_ID` FOREIGN KEY (`jornadas_ID`) REFERENCES `jornadas` (`ID`),
  ADD CONSTRAINT `FK_LIGAS_JORNADAS_ligas_ID` FOREIGN KEY (`ligas_ID`) REFERENCES `ligas` (`ID`);

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `FK_PARTIDOS_LOCAL_ID` FOREIGN KEY (`LOCAL_ID`) REFERENCES `equipos` (`ID`),
  ADD CONSTRAINT `FK_PARTIDOS_VISITANTE_ID` FOREIGN KEY (`VISITANTE_ID`) REFERENCES `equipos` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
