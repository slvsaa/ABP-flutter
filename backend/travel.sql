-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2022 at 11:36 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `infoapps`
--

CREATE TABLE `infoapps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namaapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `infoapps`
--

INSERT INTO `infoapps` (`id`, `namaapp`, `foto`, `deskripsi`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Liburan Kita', 'uplouds/app/1649766605fotoapp-launch-strategy.jpg', '<p>simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'https://www.lipsum.com/', NULL, '2022-04-12 05:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namakategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

INSERT INTO `kategoris` (`id`, `namakategori`, `created_at`, `updated_at`) VALUES
(5, 'Sejarah Nusantara', '2022-04-18 01:44:24', '2022-04-18 01:44:24'),
(6, 'Sejarah Nasional', '2022-04-18 01:49:36', '2022-04-18 01:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_04_11_121243_create_kategoris_table', 2),
(5, '2022_04_11_121614_create_wisatas_table', 2),
(6, '2022_04_11_121908_create_reviews_table', 2),
(7, '2022_04_12_080509_create_infoapps_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wisata_id` bigint(20) UNSIGNED NOT NULL,
  `namauser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `wisata_id`, `namauser`, `review`, `created_at`, `updated_at`) VALUES
(1, 1, 'toni', 'Tempatnya Bagus Banget aku nginep 5 hari', '2022-04-12 07:11:04', '2022-04-12 10:36:29'),
(3, 3, 'Dinda', 'Pernah Kesini Waktu SMA Bagus', '2022-04-12 10:09:05', '2022-04-12 10:09:05'),
(4, 1, 'Dadang', 'Top', '2022-04-12 10:51:55', '2022-04-12 10:51:55'),
(5, 2, 'Nana', 'Tempatnya bagus', '2022-04-18 02:17:21', '2022-04-18 02:17:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'cCJ3qcMNlk', 'admin@mail.com', NULL, '$2y$10$Y2Ik1GqWcfi1BO4Qtg.64OHpX1jE7bjU.Tlrx7beHeBeE7RlzkIFG', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wisatas`
--

CREATE TABLE `wisatas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `namatempat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biaya` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jamoperasional` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wisatas`
--

INSERT INTO `wisatas` (`id`, `kategori_id`, `namatempat`, `lokasi`, `biaya`, `jamoperasional`, `foto`, `video`, `deskripsi`, `created_at`, `updated_at`, `latitude`, `longitude`) VALUES
(2, 6, 'Monumen Nasional', 'Jakarta', '15000', '08.00 - 22.00', 'assets/images/monas.jpg', NULL, 'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '2022-04-12 11:54:39', '2022-04-18 01:53:50', -6.1753924, 106.8271528),
(6, 5, 'Candi Borobudur', 'Magelang', '50000', '07:30 - 16.00', 'assets/images/burbud.jpg', NULL, 'Candi Borobudur adalah salah satu candi Budha di Indonesia yang terletak di Magelang, Jawa Tengah', '2022-04-18 01:47:51', '2022-04-18 01:47:51', -7.6078685, 110.2015626),
(8, 5, 'Candi Prambanan', 'Kabupaten Sleman', '60000', '08:00-17:00', 'assets/images/prambanan.jpeg', '', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Recusandae, nemo cumque, enim in perspiciatis tenetur unde accusantium beatae distinctio iste aliquid? Dignissimos dolores accusamus perferendis! Aspernatur doloremque distinctio beatae odio enim architecto nihil molestias nam, saepe atque maiores voluptatem esse ea nulla exercitationem et cum commodi quis. Dicta ducimus tempore id at et, assumenda pariatur neque, veritatis eum accusantium earum eius minus veniam recusandae amet architecto. Aut voluptas earum dicta debitis quas voluptatibus eum temporibus non omnis molestias commodi iure doloribus consequatur, minus facere neque? Magni ad debitis nisi voluptate. Corporis, veniam temporibus? Vero sint itaque deserunt explicabo consequuntur perferendis?', '2022-04-18 02:10:58', '2022-04-18 06:09:53', -7.7520153, 110.4872402),
(9, 6, 'Monumen Jogja Kembali', 'Kabupaten Sleman', '15000', '09:00-12:00', 'assets/images/monjali.jpg', '', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Fugit totam necessitatibus reiciendis, atque aut cum qui eius perspiciatis labore maxime! Est eligendi dolore rerum perspiciatis doloremque ex sed perferendis beatae dolores earum nisi obcaecati voluptatem, nam impedit id, harum recusandae, ipsam modi quas sapiente incidunt. Recusandae fugit voluptas minus provident, reiciendis nulla nihil aut possimus praesentium, explicabo sunt ea illo repellendus! Sunt at id neque nostrum nesciunt eaque dolore deleniti tempora commodi obcaecati quod sint, tempore et aliquam, illo sed itaque illum possimus expedita facere, minus dolor nihil molestiae placeat?', '2022-04-18 02:16:38', '2022-04-18 06:00:27', -7.7495851, 110.3674181);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `infoapps`
--
ALTER TABLE `infoapps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wisatas`
--
ALTER TABLE `wisatas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `infoapps`
--
ALTER TABLE `infoapps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wisatas`
--
ALTER TABLE `wisatas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
