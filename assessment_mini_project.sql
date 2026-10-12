-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2026 at 09:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assessment_mini_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `monthly_salary` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `gender`, `birthday`, `monthly_salary`, `created_at`, `updated_at`, `user_id`, `position`) VALUES
(1, 'King Myer', 'Mantolino', 'Male', '2001-01-06', 13050.00, '2026-10-12 07:31:04', '2026-10-12 08:56:56', NULL, 'Encoder'),
(7, 'encoder1', 'test', 'Female', '2009-01-16', 13050.00, '2026-10-12 09:17:44', '2026-10-12 10:14:31', 8, 'Encoder'),
(8, 'encoder2', 'test', 'Female', '1998-12-24', 13050.00, '2026-10-12 09:30:27', '2026-10-12 10:14:37', 9, 'Encoder'),
(9, 'encoder3', 'test', 'Male', '2004-08-12', 13050.00, '2026-10-12 10:15:28', '2026-10-12 10:15:28', 10, 'Encoder'),
(10, 'encoder4', 'test', 'Male', '2001-07-10', 13050.00, '2026-10-12 10:16:08', '2026-10-12 10:16:08', 11, 'Encoder'),
(11, 'encoder5', 'test', 'Male', '1999-08-07', 13050.00, '2026-10-12 10:16:40', '2026-10-12 10:16:40', 12, 'Encoder'),
(12, 'encoder6', 'test', 'Male', '2003-05-14', 13050.00, '2026-10-12 10:17:24', '2026-10-12 10:17:24', 13, 'Encoder'),
(13, 'pc1', 'test', 'Male', '2002-08-07', 19000.00, '2026-10-12 10:18:18', '2026-10-12 10:18:18', 14, 'Project Coordinator'),
(14, 'pc2', 'test', 'Female', '1998-04-21', 19000.00, '2026-10-12 10:18:50', '2026-10-12 10:18:50', 15, 'Project Coordinator'),
(15, 'pc3', 'test', 'Female', '2002-02-13', 19000.00, '2026-10-12 10:19:22', '2026-10-12 10:19:22', 16, 'Project Coordinator'),
(16, 'pc4', 'test', 'Female', '1997-04-05', 19000.00, '2026-10-12 10:20:09', '2026-10-12 10:20:09', 17, 'Project Coordinator'),
(17, 'pm1', 'test', 'Female', '1998-08-07', 28000.00, '2026-10-12 10:20:49', '2026-10-12 10:20:49', 18, 'Project Manager'),
(18, 'dev1', 'test', 'Male', '2006-02-17', 22000.00, '2026-10-12 10:21:16', '2026-10-12 10:21:16', 19, 'Programmer'),
(19, 'dev2', 'test', 'Male', '1995-04-06', 22000.00, '2026-10-12 10:21:44', '2026-10-12 10:21:44', 20, 'Programmer');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_10_12_144215_users_table', 2),
(5, '2026_10_12_144325_employees_table', 2),
(6, '2026_10_12_150149_add_username_to_users', 3),
(7, '2026_10_12_150352_make_email_nullable_in_users_table', 4),
(8, '2026_10_12_150352_null_email', 5),
(9, '2026_10_12_154828_db_fix_userID', 5),
(10, '2026_10_12_154828_db_fix_user_id', 6),
(11, '2026_10_12_162808_db_fix_jobs', 6),
(12, '2026_10_12_164433_fix_missing_position_column_in_employees_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Pom9qkUilkeNXpiCOV0q0vwcjwitKn5lFDiYwcUq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', 'eyJfdG9rZW4iOiJKYWJWMGhqYzVsckVuVTlDbXg5bmNtR2tMZGlWcjVQMnRYaWJvaURBIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2xvZ2luIiwicm91dGUiOiJsb2dpbiJ9fQ==', 1791830223),
('Z6ZTbsXkZNQYHv5XsPFbVW3mjsiXU266OksegYHs', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.140.0 Chrome/150.0.7871.250 Electron/43.7.3 Safari/537.36', 'eyJfdG9rZW4iOiJWRUs1aElWMldhQVlkbVhMb3NuOWpEMDEwUHpkd2VMc29BM3NZaVJkIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2xvZ2luIiwicm91dGUiOiJsb2dpbiJ9LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MSwicGFzc3dvcmRfaGFzaF93ZWIiOiI4NTgyOGY2YTU0Njg0ZTc5OGUzZDIxNTUyYzUwNmVhMTcxZTU4ODk3M2E0ZGIyNGIzZmVmZTgyZGUxNzY0YWZlIn0=', 1791824482);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'admin', 'Admin', NULL, NULL, '$2y$12$PxEUoGozFv.PWcRIkoG/7uEAqWp01dht5LCA9jizJl4BA8D7LHrCi', NULL, '2026-10-12 07:04:22', '2026-10-12 07:04:22', 'admin'),
(2, 'Kmyer', 'Kmyer Dela Cruz', NULL, NULL, '$2y$12$9.yvIASMEauMi6jPmugQ1uQcL4Ne4upZk/OgZ9TXN3A03eMs1NICe', NULL, '2026-10-12 07:31:04', '2026-10-12 07:31:04', 'user'),
(3, 'asd', 'asd asd', NULL, NULL, '$2y$12$Gl8gkln75i2yVhZYZRv2Nufpu6cGV2OYXplaQGdKp4oAawRZYcGFe', NULL, '2026-10-12 07:38:38', '2026-10-12 07:38:38', 'user'),
(8, 'encoder1', 'encoder1 test', NULL, NULL, '$2y$12$zy56oNP1VOaBTZhz8Qp5/OO1TbpG6zJEiatImLq1pXHoq0RvTqt4W', NULL, '2026-10-12 09:17:44', '2026-10-12 09:17:44', 'user'),
(9, 'encoder2', 'encoder2 test', NULL, NULL, '$2y$12$sqSPmvgvPiJsBoS043Bgxe4xKVNkTdj.G59mPHh9afiA8XmI.P6uu', NULL, '2026-10-12 09:30:27', '2026-10-12 09:30:27', 'user'),
(10, 'ecoder3', 'encoder3 test', NULL, NULL, '$2y$12$jwreGj8Xdig4.fQUDv0XzewvSL4KA9uovx.60hW0sNjhzklDeZ4Eu', NULL, '2026-10-12 10:15:28', '2026-10-12 10:15:28', 'user'),
(11, 'encoder4', 'encoder4 test', NULL, NULL, '$2y$12$9rvzDovB.Pw66lpfqM4aBezYzZh6xHvXxs8T.3HDbdUzkTlT6WdDK', NULL, '2026-10-12 10:16:08', '2026-10-12 10:16:08', 'user'),
(12, 'encoder5', 'encoder5 test', NULL, NULL, '$2y$12$BaFScaNhbr26cTzAzgfYjenc24TTPvww7IiEVJP.9RgUnESFyq9h.', NULL, '2026-10-12 10:16:40', '2026-10-12 10:16:40', 'user'),
(13, 'encoder6', 'encoder6 test', NULL, NULL, '$2y$12$48mdHNFr6itlIJeer6DuX.v5CCHyGP7SK2FbD3b8.FVuvj7QPMPa6', NULL, '2026-10-12 10:17:24', '2026-10-12 10:17:24', 'user'),
(14, 'pc1', 'pc1 test', NULL, NULL, '$2y$12$lsV0LayGcy04mreMHuwjn.wJFnvMnh3Jb3TqSrZm94UY2tQumgqzy', NULL, '2026-10-12 10:18:18', '2026-10-12 10:18:18', 'user'),
(15, 'pc2', 'pc2 test', NULL, NULL, '$2y$12$gWlZgXv2YRyAe.a8eCEOG.SHP1zKbhH1CG.jm8yfLjR8084vZdDMO', NULL, '2026-10-12 10:18:50', '2026-10-12 10:18:50', 'user'),
(16, 'pc3', 'pc3 test', NULL, NULL, '$2y$12$1cerq4WIdVWRm2qGB3q5ruiRXgbmiQ7mlxIo4hU.vLFQ8Wm.Q4nwC', NULL, '2026-10-12 10:19:22', '2026-10-12 10:19:22', 'user'),
(17, 'pc4', 'pc4 test', NULL, NULL, '$2y$12$3drAISPsLI8Df2WLhE1xcu0Fx.QvrVWQO.XMoXZdl6M0wlmmPnerC', NULL, '2026-10-12 10:20:09', '2026-10-12 10:20:09', 'user'),
(18, 'pm1', 'pm1 test', NULL, NULL, '$2y$12$qlwlgarC6TIzrXWYLfJ04.DGl86kJnlESTM6LvNyB.QTfBUj37ij.', NULL, '2026-10-12 10:20:49', '2026-10-12 10:20:49', 'user'),
(19, 'dev1', 'dev1 test', NULL, NULL, '$2y$12$mq0mCtV9DPCThubRQtD1IOKfapAL0j3JNttXGAsxohfh/AYedqcca', NULL, '2026-10-12 10:21:16', '2026-10-12 10:21:16', 'user'),
(20, 'dev2', 'dev2 test', NULL, NULL, '$2y$12$lSzAuGfuaIzYJzMhBM1MtOb3jUrUfERIzwYt4BgNDFMgpQrIHhQSi', NULL, '2026-10-12 10:21:44', '2026-10-12 10:21:44', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_user_id_unique` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
