-- Adminer 4.8.1 MySQL 8.0.31-0ubuntu0.22.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `attendances`;
CREATE TABLE `attendances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int unsigned DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `twitter_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discord_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `github_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `full_name` (`full_name`),
  KEY `phone_number` (`phone_number`),
  KEY `email` (`email`),
  KEY `facebook_id` (`facebook_id`),
  KEY `twitter_username` (`twitter_username`),
  KEY `discord_username` (`discord_username`),
  KEY `github_username` (`github_username`),
  KEY `created_at` (`created_at`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `attendances_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `province_id` tinyint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `cities_ibfk_3` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

INSERT INTO `cities` (`id`, `province_id`, `name`) VALUES
(1, 1,  'Kota Banda Aceh'),
(2, 1,  'Kota Sabang'),
(3, 1,  'Kota Lhokseumawe'),
(4, 1,  'Kota Langsa'),
(5, 1,  'Kota Subulussalam'),
(6, 1,  'Kab. Aceh Selatan'),
(7, 1,  'Kab. Aceh Tenggara'),
(8, 1,  'Kab. Aceh Timur'),
(9, 1,  'Kab. Aceh Tengah'),
(10,  1,  'Kab. Aceh Barat'),
(11,  1,  'Kab. Aceh Besar'),
(12,  1,  'Kab. Pidie'),
(13,  1,  'Kab. Aceh Utara'),
(14,  1,  'Kab. Simeulue'),
(15,  1,  'Kab. Aceh Singkil'),
(16,  1,  'Kab. Bireun'),
(17,  1,  'Kab. Aceh Barat Daya'),
(18,  1,  'Kab. Gayo Lues'),
(19,  1,  'Kab. Aceh Jaya'),
(20,  1,  'Kab. Nagan Raya'),
(21,  1,  'Kab. Aceh Tamiang'),
(22,  1,  'Kab. Bener Meriah'),
(23,  1,  'Kab. Pidie Jaya'),
(24,  2,  'Kota Medan'),
(25,  2,  'Kota Pematang Siantar'),
(26,  2,  'Kota Sibolga'),
(27,  2,  'Kota Tanjung Balai'),
(28,  2,  'Kota Binjai'),
(29,  2,  'Kota Tebing Tinggi'),
(30,  2,  'Kota Padang Sidempuan'),
(31,  2,  'Kota Gunung Sitoli'),
(32,  2,  'Kab. Serdang Bedagai'),
(33,  2,  'Kab. Samosir '),
(34,  2,  'Kab. Humbang Hasundutan'),
(35,  2,  'Kab. Pakpak Bharat'),
(36,  2,  'Kab. Nias Selatan'),
(37,  2,  'Kab. Mandailing Natal'),
(38,  2,  'Kab. Toba Samosir'),
(39,  2,  'Kab. Dairi'),
(40,  2,  'Kab. Labuhan Batu'),
(41,  2,  'Kab. Asahan'),
(42,  2,  'Kab. Simalungun'),
(43,  2,  'Kab. Deli Serdang'),
(44,  2,  'Kab. Karo'),
(45,  2,  'Kab. Langkat'),
(46,  2,  'Kab. Nias'),
(47,  2,  'Kab. Tapanuli Selatan'),
(48,  2,  'Kab. Tapanuli Utara'),
(49,  2,  'Kab. Tapanuli Tengah'),
(50,  2,  'Kab. Batu Bara'),
(51,  2,  'Kab. Padang Lawas Utara'),
(52,  2,  'Kab. Padang Lawas'),
(53,  2,  'Kab. Labuhanbatu Selatan'),
(54,  2,  'Kab. Labuhanbatu Utara'),
(55,  2,  'Kab. Nias Utara'),
(56,  2,  'Kab. Nias Barat'),
(57,  3,  'Kota Padang'),
(58,  3,  'Kota Solok'),
(59,  3,  'Kota Sawhlunto'),
(60,  3,  'Kota Padang Panjang'),
(61,  3,  'Kota Bukittinggi'),
(62,  3,  'Kota Payakumbuh'),
(63,  3,  'Kota Pariaman'),
(64,  3,  'Kab. Pasaman Barat'),
(65,  3,  'Kab. Solok Selatan'),
(66,  3,  'Kab. Dharmasraya'),
(67,  3,  'Kab. Kepulauan Mentawai'),
(68,  3,  'Kab. Pasaman'),
(69,  3,  'Kab. Lima Puluh Kota'),
(70,  3,  'Kab. Agam'),
(71,  3,  'Kab. Padang Pariaman'),
(72,  3,  'Kab. Tanah Datar'),
(73,  3,  'Kab. Sijunjung'),
(74,  3,  'Kab. Solok'),
(75,  3,  'Kab. Pesisir Selatan'),
(76,  4,  'Kota Pekan Baru'),
(77,  4,  'Kota Dumai'),
(78,  4,  'Kab. Kepulauan Meranti'),
(79,  4,  'Kab. Kuantan Singingi'),
(80,  4,  'Kab. Siak'),
(81,  4,  'Kab. Rokan Hilir'),
(82,  4,  'Kab. Rokan Hulu'),
(83,  4,  'Kab. Pelalawan'),
(84,  4,  'Kab. Indragiri Hilir'),
(85,  4,  'Kab. Bengkalis'),
(86,  4,  'Kab. Indragiri Hulu'),
(87,  4,  'Kab. Kampar'),
(88,  5,  'Kota Jambi'),
(89,  5,  'Kota Sungai Penuh'),
(90,  5,  'Kab. Tebo'),
(91,  5,  'Kab. Bungo'),
(92,  5,  'Kab. Tanjung Jabung Timur'),
(93,  5,  'Kab. Tanjung Jabung Barat'),
(94,  5,  'Kab. Muaro Jambi'),
(95,  5,  'Kab. Batanghari'),
(96,  5,  'Kab. Sarolangun'),
(97,  5,  'Kab. Merangin'),
(98,  5,  'Kab. Kerinci'),
(99,  6,  'Kota Palembang'),
(100, 6,  'Kota Pagar Alam'),
(101, 6,  'Kota Lubuk Linggau'),
(102, 6,  'Kota Prabumulih'),
(103, 6,  'Kab. Musi Rawas Utara'),
(104, 6,  'Kab. Penukal Abab Lematang Ilir'),
(105, 6,  'Kab. Empat Lawang'),
(106, 6,  'Kab. Ogan Ilir '),
(107, 6,  'Kab. Ogan Komering Ulu Selatan '),
(108, 6,  'Kab. Ogan Komering Ulu Timur '),
(109, 6,  'Kab. Banyuasin'),
(110, 6,  'Kab. Musi Banyuasin'),
(111, 6,  'Kab. Musi Rawas'),
(112, 6,  'Kab. Lahat'),
(113, 6,  'Kab. Muara Enim'),
(114, 6,  'Kab. Ogan Komering Ilir'),
(115, 6,  'Kab. Ogan Komering Ulu'),
(116, 7,  'Kota Bengkulu'),
(117, 7,  'Kab. Bengkulu Tengah'),
(118, 7,  'Kab. Kepahiang '),
(119, 7,  'Kab. Lebong'),
(120, 7,  'Kab. Muko Muko'),
(121, 7,  'Kab. Seluma'),
(122, 7,  'Kab. Kaur'),
(123, 7,  'Kab. Bengkulu Utara'),
(124, 7,  'Kab. Rejang Lebong'),
(125, 7,  'Kab. Bengkulu Selatan'),
(126, 8,  'Kota Bandar Lampung'),
(127, 8,  'Kota Metro'),
(128, 8,  'Kab. Pesisir Barat'),
(129, 8,  'Kab. Tulangbawang Barat'),
(130, 8,  'Kab. Mesuji'),
(131, 8,  'Kab. Pringsewu'),
(132, 8,  'Kab. Pesawaran'),
(133, 8,  'Kab. Way Kanan'),
(134, 8,  'Kab. Lampung Timur'),
(135, 8,  'Kab. Tanggamus'),
(136, 8,  'Kab. Tulang Bawang'),
(137, 8,  'Kab. Lampung Barat'),
(138, 8,  'Kab. Lampung Utara'),
(139, 8,  'Kab. Lampung Tengah'),
(140, 8,  'Kab. Lampung Selatan'),
(141, 9,  'Kota Pangkal Pinang'),
(142, 9,  'Kab. Belitung Timur'),
(143, 9,  'Kab. Bangka Barat'),
(144, 9,  'Kab. Bangka Tengah'),
(145, 9,  'Kab. Bangka Selatan'),
(146, 9,  'Kab. Belitung'),
(147, 9,  'Kab. Bangka'),
(148, 10, 'Kota Batam'),
(149, 10, 'Kota Tanjung Pinang'),
(150, 10, 'Kab. Kepulauan Anambas'),
(151, 10, 'Kab. Lingga '),
(152, 10, 'Kab. Natuna'),
(153, 10, 'Kab. Karimun'),
(154, 10, 'Kab. Bintan'),
(155, 11, 'Kota Jakarta Timur'),
(156, 11, 'Kota Jakarta Selatan'),
(157, 11, 'Kota Jakarta Barat'),
(158, 11, 'Kota Jakarta Utara'),
(159, 11, 'Kota Jakarta Pusat'),
(160, 11, 'Kab. Kepulauan Seribu'),
(161, 12, 'Kota Bandung'),
(162, 12, 'Kota Banjar'),
(163, 12, 'Kota Tasikmalaya'),
(164, 12, 'Kota Cimahi'),
(165, 12, 'Kota Depok'),
(166, 12, 'Kota Bekasi'),
(167, 12, 'Kota Cirebon'),
(168, 12, 'Kota Sukabumi'),
(169, 12, 'Kota Bogor'),
(170, 12, 'Kab. Pangandaran'),
(171, 12, 'Kab. Bandung Barat'),
(172, 12, 'Kab. Bekasi'),
(173, 12, 'Kab. Karawang'),
(174, 12, 'Kab. Purwakarta'),
(175, 12, 'Kab. Subang'),
(176, 12, 'Kab. Indramayu'),
(177, 12, 'Kab. Sumedang'),
(178, 12, 'Kab. Majalengka'),
(179, 12, 'Kab. Cirebon'),
(180, 12, 'Kab. Kuningan'),
(181, 12, 'Kab. Ciamis'),
(182, 12, 'Kab. Tasikmalaya'),
(183, 12, 'Kab. Garut'),
(184, 12, 'Kab. Bandung'),
(185, 12, 'Kab. Cianjur'),
(186, 12, 'Kab. Sukabumi'),
(187, 12, 'Kab. Bogor'),
(188, 13, 'Kota Semarang'),
(189, 13, 'Kota Tegal'),
(190, 13, 'Kota Pekalongan'),
(191, 13, 'Kota Salatiga'),
(192, 13, 'Kota Surakarta'),
(193, 13, 'Kota Magelang'),
(194, 13, 'Kab. Brebes'),
(195, 13, 'Kab. Tegal'),
(196, 13, 'Kab. Pemalang'),
(197, 13, 'Kab. Pekalongan'),
(198, 13, 'Kab. Batang'),
(199, 13, 'Kab. Kendal'),
(200, 13, 'Kab. Temanggung'),
(201, 13, 'Kab. Semarang'),
(202, 13, 'Kab. Demak'),
(203, 13, 'Kab. Jepara'),
(204, 13, 'Kab. Kudus'),
(205, 13, 'Kab. Pati'),
(206, 13, 'Kab. Rembang'),
(207, 13, 'Kab. Blora'),
(208, 13, 'Kab. Grobogan'),
(209, 13, 'Kab. Sragen'),
(210, 13, 'Kab. Karanganyar'),
(211, 13, 'Kab. Wonogiri'),
(212, 13, 'Kab. Sukoharjo'),
(213, 13, 'Kab. Klaten'),
(214, 13, 'Kab. Boyolali'),
(215, 13, 'Kab. Magelang'),
(216, 13, 'Kab. Wonosobo'),
(217, 13, 'Kab. Purworejo'),
(218, 13, 'Kab. Kebumen'),
(219, 13, 'Kab. Banjarnegara'),
(220, 13, 'Kab. Purbalingga'),
(221, 13, 'Kab. Banyumas'),
(222, 13, 'Kab. Cilacap'),
(223, 14, 'Kota Yogyakarta'),
(224, 14, 'Kab. Sleman'),
(225, 14, 'Kab. Gunung Kidul'),
(226, 14, 'Kab. Bantul'),
(227, 14, 'Kab. Kulon Progo'),
(228, 15, 'Kota Surabaya'),
(229, 15, 'Kota Batu'),
(230, 15, 'Kota Madiun'),
(231, 15, 'Kota Mojokerto'),
(232, 15, 'Kota Pasuruan'),
(233, 15, 'Kota Probolinggo'),
(234, 15, 'Kota Malang'),
(235, 15, 'Kota Blitar'),
(236, 15, 'Kota Kediri'),
(237, 15, 'Kab. Sumenep'),
(238, 15, 'Kab. Pamekasan'),
(239, 15, 'Kab. Sampang'),
(240, 15, 'Kab. Bangkalan'),
(241, 15, 'Kab. Gresik'),
(242, 15, 'Kab. Lamongan'),
(243, 15, 'Kab. Tuban'),
(244, 15, 'Kab. Bojonegoro'),
(245, 15, 'Kab. Ngawi'),
(246, 15, 'Kab. Magetan'),
(247, 15, 'Kab. Madiun'),
(248, 15, 'Kab. Nganjuk'),
(249, 15, 'Kab. Jombang'),
(250, 15, 'Kab. Mojokerto'),
(251, 15, 'Kab. Sidoarjo'),
(252, 15, 'Kab. Pasuruan'),
(253, 15, 'Kab. Probolinggo'),
(254, 15, 'Kab. Situbondo'),
(255, 15, 'Kab. Bondowoso'),
(256, 15, 'Kab. Banyuwangi'),
(257, 15, 'Kab. Jember'),
(258, 15, 'Kab. Lumajang'),
(259, 15, 'Kab. Malang'),
(260, 15, 'Kab. Kediri'),
(261, 15, 'Kab. Blitar'),
(262, 15, 'Kab. Tulungagung'),
(263, 15, 'Kab. Trenggalek'),
(264, 15, 'Kab. Ponorogo'),
(265, 15, 'Kab. Pacitan'),
(266, 16, 'Kota Serang'),
(267, 16, 'Kota Cilegon'),
(268, 16, 'Kota Tangerang'),
(269, 16, 'Kota Tangerang Selatan'),
(270, 16, 'Kab. Serang'),
(271, 16, 'Kab. Tangerang'),
(272, 16, 'Kab. Lebak'),
(273, 16, 'Kab. Pandeglang'),
(274, 17, 'Kota Denpasar'),
(275, 17, 'Kab. Buleleng'),
(276, 17, 'Kab. Karangasem'),
(277, 17, 'Kab. Bangli'),
(278, 17, 'Kab. Klungkung'),
(279, 17, 'Kab. Gianyar'),
(280, 17, 'Kab. Badung'),
(281, 17, 'Kab. Tabanan'),
(282, 17, 'Kab. Jembrana'),
(283, 18, 'Kota Mataram'),
(284, 18, 'Kota Bima'),
(285, 18, 'Kab. Lombok Utara'),
(286, 18, 'Kab. Sumbawa Barat'),
(287, 18, 'Kab. Bima'),
(288, 18, 'Kab. Dompu'),
(289, 18, 'Kab. Sumbawa '),
(290, 18, 'Kab. Lombok Timur'),
(291, 18, 'Kab. Lombok Tengah'),
(292, 18, 'Kab. Lombok Barat'),
(293, 19, 'Kota Kupang'),
(294, 19, 'Kab. Malaka'),
(295, 19, 'Kab. Sabu Raijua'),
(296, 19, 'Kab. Manggarai Timur'),
(297, 19, 'Kab. Sumba Barat Daya'),
(298, 19, 'Kab. Sumba Tengah'),
(299, 19, 'Kab. Nagekeo'),
(300, 19, 'Kab. Manggarai Barat'),
(301, 19, 'Kab. Rote Ndao'),
(302, 19, 'Kab. Lembata'),
(303, 19, 'Kab. Sumba Barat'),
(304, 19, 'Kab. Sumba Timur'),
(305, 19, 'Kab. Manggarai'),
(306, 19, 'Kab. Ngada'),
(307, 19, 'Kab. Ende'),
(308, 19, 'Kab. Sikka'),
(309, 19, 'Kab. Flores Timur'),
(310, 19, 'Kab. Alor'),
(311, 19, 'Kab. Belu'),
(312, 19, 'Kab. Timor Tengah Utara'),
(313, 19, 'Kab. Timor Tengah Selatan'),
(314, 19, 'Kab. Kupang'),
(315, 20, 'Kota Pontianak'),
(316, 20, 'Kota Singkawang'),
(317, 20, 'Kab. Kubu Raya'),
(318, 20, 'Kab. Kayong Utara'),
(319, 20, 'Kab. Sekadau'),
(320, 20, 'Kab. Melawi'),
(321, 20, 'Kab. Landak'),
(322, 20, 'Kab. Bengkayang'),
(323, 20, 'Kab. Kapuas Hulu'),
(324, 20, 'Kab. Sintang '),
(325, 20, 'Kab. Ketapang'),
(326, 20, 'Kab. Sanggau '),
(327, 20, 'Kab. Mempawah'),
(328, 20, 'Kab. Sambas'),
(329, 21, 'Kota Palangkaraya'),
(330, 21, 'Kab. Barito Timur'),
(331, 21, 'Kab. Murung Raya'),
(332, 21, 'Kab. Pulang Pisau'),
(333, 21, 'Kab. Gunung Mas'),
(334, 21, 'Kab. Lamandau'),
(335, 21, 'Kab. Sukamara'),
(336, 21, 'Kab. Seruyan'),
(337, 21, 'Kab. Katingan'),
(338, 21, 'Kab. Barito Utara'),
(339, 21, 'Kab. Barito Selatan'),
(340, 21, 'Kab. Kapuas'),
(341, 21, 'Kab. Kotawaringin Timur'),
(342, 21, 'Kab. Kotawaringin Barat'),
(343, 22, 'Kota Banjarmasin'),
(344, 22, 'Kota Banjarbaru'),
(345, 22, 'Kab. Balangan'),
(346, 22, 'Kab. Tanah Bambu'),
(347, 22, 'Kab. Tabalong'),
(348, 22, 'Kab. Hulu Sungai Utara'),
(349, 22, 'Kab. Hulu Sungai Tengah'),
(350, 22, 'Kab. Hulu Sungai Selatan'),
(351, 22, 'Kab. Tapin'),
(352, 22, 'Kab. Barito Kuala'),
(353, 22, 'Kab. Banjar'),
(354, 22, 'Kab. Kotabaru'),
(355, 22, 'Kab. Tanah Laut'),
(356, 23, 'Kota Samarinda'),
(357, 23, 'Kota Bontang'),
(358, 23, 'Kota Balikpapan'),
(359, 23, 'Kab. Mahakam Ulu'),
(360, 23, 'Kab. Penajam Paser Utara'),
(361, 23, 'Kab. Kutai Timur'),
(362, 23, 'Kab. Kutai Barat'),
(363, 23, 'Kab. Berau'),
(364, 23, 'Kab. Kutai Kertanegara'),
(365, 23, 'Kab. Paser'),
(366, 24, 'Kota Tarakan'),
(367, 24, 'Kab. Tana Tidung'),
(368, 24, 'Kab. Nunukan'),
(369, 24, 'Kab. Malinau'),
(370, 24, 'Kab. Bulungan'),
(371, 25, 'Kota Manado'),
(372, 25, 'Kota Tomohon'),
(373, 25, 'Kota Bitung'),
(374, 25, 'Kota Kotamobagu'),
(375, 25, 'Kab. Bolaang Mangondow Selatan'),
(376, 25, 'Kab. Bolaang Mangondow Timur'),
(377, 25, 'Kab. Kepulauan Siau Tagulandang Biaro'),
(378, 25, 'Kab. Bolaang Mangondow Utara'),
(379, 25, 'Kab. Minahasa Tenggara'),
(380, 25, 'Kab. Minahasa Utara'),
(381, 25, 'Kab. Minahasa Selatan'),
(382, 25, 'Kab. Kepulauan Talaud'),
(383, 25, 'Kab. Kepulauan Sangihe'),
(384, 25, 'Kab. Minahasa'),
(385, 25, 'Kab. Bolaang Mangondow'),
(386, 26, 'Kota Palu'),
(387, 26, 'Kab. Morowali Utara'),
(388, 26, 'Kab. Banggai Laut'),
(389, 26, 'Kab. Sigi'),
(390, 26, 'Kab. Tojo Una-Una'),
(391, 26, 'Kab. Parigi Moutong'),
(392, 26, 'Kab. Banggai Kepulauan'),
(393, 26, 'Kab. Morowali'),
(394, 26, 'Kab. Buol'),
(395, 26, 'Kab. Toli-Toli'),
(396, 26, 'Kab. Donggala'),
(397, 26, 'Kab. Poso'),
(398, 26, 'Kab. Banggai'),
(399, 27, 'Kota Makasar'),
(400, 27, 'Kota Palopo'),
(401, 27, 'Kota Pare Pare'),
(402, 27, 'Kab. Toraja Utara'),
(403, 27, 'Kab. Luwu Timur'),
(404, 27, 'Kab. Luwu Utara'),
(405, 27, 'Kab. Tana Toraja'),
(406, 27, 'Kab. Luwu'),
(407, 27, 'Kab. Enrekang'),
(408, 27, 'Kab. Pinrang'),
(409, 27, 'Kab. Sidenreng Rappang'),
(410, 27, 'Kab. Wajo'),
(411, 27, 'Kab. Soppeng'),
(412, 27, 'Kab. Barru'),
(413, 27, 'Kab. Pangkajene Kepulauan'),
(414, 27, 'Kab. Maros'),
(415, 27, 'Kab. Bone'),
(416, 27, 'Kab. Sinjai'),
(417, 27, 'Kab. Gowa'),
(418, 27, 'Kab. Takalar'),
(419, 27, 'Kab. Jeneponto'),
(420, 27, 'Kab. Bantaeng'),
(421, 27, 'Kab. Bulukumba'),
(422, 27, 'Kab. Kepulauan Selayar'),
(423, 28, 'Kota Kendari'),
(424, 28, 'Kota Bau Bau'),
(425, 28, 'Kab. Buton Selatan'),
(426, 28, 'Kab. Buton Tengah'),
(427, 28, 'Kab. Muna Barat'),
(428, 28, 'Kab. Konawe Kepulauan'),
(429, 28, 'Kab. Kolaka Timur'),
(430, 28, 'Kab. Buton Utara'),
(431, 28, 'Kab. Konawe Utara'),
(432, 28, 'Kab. Kolaka Utara'),
(433, 28, 'Kab. Wakatobi'),
(434, 28, 'Kab. Bombana'),
(435, 28, 'Kab. Konawe Selatan'),
(436, 28, 'Kab. Buton'),
(437, 28, 'Kab. Muna'),
(438, 28, 'Kab. Konawe'),
(439, 28, 'Kab. Kolaka'),
(440, 29, 'Kota Gorontalo'),
(441, 29, 'Kab. Pohuwato'),
(442, 29, 'Kab. Bone Bolango'),
(443, 29, 'Kab. Boalemo'),
(444, 29, 'Kab. Gorontalo'),
(445, 29, 'Kab. Gorontalo Utara'),
(446, 30, 'Kab. Majene'),
(447, 30, 'Kab. Polowali Mandar'),
(448, 30, 'Kab. Mamasa'),
(449, 30, 'Kab. Mamuju'),
(450, 30, 'Kab. Mamuju Utara'),
(451, 30, 'Kab. Mamuju Tengah'),
(452, 31, 'Kota Ambon'),
(453, 31, 'Kota Tual'),
(454, 31, 'Kab. Buru Selatan'),
(455, 31, 'Kab. Maluku Barat Daya'),
(456, 31, 'Kab. Kepulauan Aru'),
(457, 31, 'Kab. Seram Bagian Barat '),
(458, 31, 'Kab. Seram Bagian Timur'),
(459, 31, 'Kab. Buru'),
(460, 31, 'Kab. Maluku Tenggara Barat'),
(461, 31, 'Kab. Maluku Tenggara'),
(462, 31, 'Kab. Maluku Tengah'),
(463, 32, 'Kota Ternate'),
(464, 32, 'Kota Tidore Kepulauan'),
(465, 32, 'Kab. Pulau Taliabu'),
(466, 32, 'Kab. Pulau Morotai'),
(467, 32, 'Kab. Halmahera Timur'),
(468, 32, 'Kab. Kepulauan Sula'),
(469, 32, 'Kab. Halmahera Selatan'),
(470, 32, 'Kab. Halmahera Utara'),
(471, 32, 'Kab. Halmahera Tengah'),
(472, 32, 'Kab. Halmahera Barat'),
(473, 33, 'Kota Jayapura'),
(474, 33, 'Kab. Deiyai'),
(475, 33, 'Kab. Intan Jaya'),
(476, 33, 'Kab. Dogiyai'),
(477, 33, 'Kab. Puncak'),
(478, 33, 'Kab. Nduga'),
(479, 33, 'Kab. Lanny Jaya'),
(480, 33, 'Kab. Yalimo'),
(481, 33, 'Kab. Mamberamo Tengah'),
(482, 33, 'Kab. Mamberamo Raya'),
(483, 33, 'Kab. Supiori'),
(484, 33, 'Kab. Asmat'),
(485, 33, 'Kab. Mappi'),
(486, 33, 'Kab. Boven Digoel'),
(487, 33, 'Kab. Waropen'),
(488, 33, 'Kab. Tolikara'),
(489, 33, 'Kab. Yahukimo'),
(490, 33, 'Kab. Pegunungan Bintang'),
(491, 33, 'Kab. Keerom'),
(492, 33, 'Kab. Sarmi'),
(493, 33, 'Kab. Mimika'),
(494, 33, 'Kab. Paniai'),
(495, 33, 'Kab. Puncak Jaya'),
(496, 33, 'Kab. Biak Numfor'),
(497, 33, 'Kab. Kepulauan Yapen'),
(498, 33, 'Kab. Nabire'),
(499, 33, 'Kab. Jayapura'),
(500, 33, 'Kab. Jayawijaya'),
(501, 33, 'Kab. Merauke'),
(502, 34, 'Kota Sorong'),
(503, 34, 'Kab. Pegunungan Arfak'),
(504, 34, 'Kab. Manokwari Selatan'),
(505, 34, 'Kab. Maybrat'),
(506, 34, 'Kab. Tambrauw'),
(507, 34, 'Kab. Kaimana'),
(508, 34, 'Kab. Teluk Wondama'),
(509, 34, 'Kab. Teluk Bintuni'),
(510, 34, 'Kab. Raja Ampat'),
(511, 34, 'Kab. Sorong Selatan'),
(512, 34, 'Kab. Fak Fak'),
(513, 34, 'Kab. Manokwari'),
(514, 34, 'Kab. Sorong');

DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `provinces` (`id`, `name`) VALUES
(1, 'Aceh'),
(17,  'Bali'),
(16,  'Banten'),
(7, 'Bengkulu'),
(14,  'DI Yogyakarta'),
(11,  'DKI Jakarta'),
(29,  'Gorontalo'),
(5, 'Jambi'),
(12,  'Jawa Barat'),
(13,  'Jawa Tengah'),
(15,  'Jawa Timur'),
(20,  'Kalimantan Barat'),
(22,  'Kalimantan Selatan'),
(21,  'Kalimantan Tengah'),
(23,  'Kalimantan Timur'),
(24,  'Kalimantan Utara'),
(9, 'Kepulauan Bangka Belitung'),
(10,  'Kepulauan Riau'),
(8, 'Lampung'),
(31,  'Maluku'),
(32,  'Maluku Utara'),
(18,  'Nusa Tenggara Barat'),
(19,  'Nusa Tenggara Timur'),
(33,  'Papua'),
(34,  'Papua Barat'),
(4, 'Riau'),
(30,  'Sulawesi Barat'),
(27,  'Sulawesi Selatan'),
(26,  'Sulawesi Tengah'),
(28,  'Sulawesi Tenggara'),
(25,  'Sulawesi Utara'),
(3, 'Sumatera Barat'),
(6, 'Sumatera Selatan'),
(2, 'Sumatera Utara');

-- 2022-11-27 18:44:52
