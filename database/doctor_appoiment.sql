-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2023 at 06:39 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctor_appoiment`
--

-- --------------------------------------------------------

--
-- Table structure for table `appoiments`
--

CREATE TABLE `appoiments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT NULL,
  `status` enum('pending','approve','reject') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appoiments`
--

INSERT INTO `appoiments` (`id`, `patient_id`, `doctor_id`, `date_time`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2023-11-10 07:25:00', 'pending', '2023-11-02 12:55:29', '2023-11-02 12:57:23', NULL),
(2, 1, 2, '2023-11-09 18:26:00', 'pending', '2023-11-02 12:57:01', '2023-11-02 12:57:01', NULL),
(3, 1, 1, '2023-11-10 04:30:00', 'pending', '2023-11-02 23:00:36', '2023-11-02 23:00:36', NULL),
(4, 2, 3, '2023-11-08 06:30:00', 'approve', '2023-11-02 23:00:55', '2023-11-02 23:04:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MBBS', '2023-11-02 12:47:47', '2023-11-02 12:47:47', NULL),
(2, 'MD', '2023-11-02 12:47:56', '2023-11-02 12:47:56', NULL),
(3, 'MS', '2023-11-02 12:48:08', '2023-11-02 12:48:08', NULL),
(4, 'MBBS', '2023-11-02 22:28:40', '2023-11-02 22:28:40', NULL),
(5, 'Mbbs', '2023-11-06 01:53:26', '2023-11-06 01:54:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `category_id` varchar(255) NOT NULL DEFAULT '[]',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, '[\"1\",\"2\"]', '2023-11-02 12:51:45', '2023-11-02 12:51:45', NULL),
(2, 3, '[\"1\",\"2\"]', '2023-11-02 12:54:16', '2023-11-02 12:54:16', NULL),
(3, 5, '[\"1\",\"3\"]', '2023-11-02 22:39:53', '2023-11-02 22:39:53', NULL),
(4, 9, '[\"2\"]', '2023-11-06 01:55:28', '2023-11-06 01:55:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(28, '2014_10_12_000000_create_users_table', 1),
(29, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(30, '2019_08_19_000000_create_failed_jobs_table', 1),
(31, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(32, '2023_09_24_064733_create_categories_table', 1),
(33, '2023_09_24_064837_create_doctors_table', 1),
(34, '2023_09_24_070554_create_patients_table', 1),
(35, '2023_09_24_070652_create_appoiments_table', 1),
(36, '2023_09_24_071651_create_prescriptions_table', 1);

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
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `doctor_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 1, '2023-11-02 12:54:56', '2023-11-02 12:54:56', NULL),
(2, 6, 3, '2023-11-02 22:42:37', '2023-11-02 22:42:37', NULL),
(3, 7, 2, '2023-11-02 22:43:33', '2023-11-02 22:43:33', NULL),
(4, 8, 3, '2023-11-06 01:32:01', '2023-11-06 01:32:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appoiment_id` bigint(20) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `appoiment_id`, `text`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '1\r\n2\r\n3', '2023-11-02 12:55:55', '2023-11-02 12:56:31', NULL),
(2, 4, '1\r\n2', '2023-11-06 01:29:13', '2023-11-06 01:29:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `text_password` varchar(255) DEFAULT NULL,
  `role` enum('admin','doctor','patient') DEFAULT 'patient',
  `image` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `email_verified_at`, `password`, `text_password`, `role`, `image`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'dixita', 'dixitagondaliya98@gmail.com', '1234567890', NULL, '$2y$10$imF.eSse3bJ47llVxFn8Ou1RJkbmdmsNWyqyHfxGEQlz.L7ACMi4.', '12345678', 'admin', 'profile/Book-your-dine-1698949927-6543eb278dc21.jpg', NULL, '2023-11-02 12:46:30', '2023-11-02 13:02:07', NULL),
(2, 'Akash', 'akashvora11@gmail.com', '1234567890', NULL, '$2y$10$IBr.XO1Og38ft5NY737ZzuTrKYSgGeUmvnridrdvMUzZ9pZ4yiuZC', '54289087', 'doctor', NULL, NULL, '2023-11-02 12:51:45', '2023-11-02 12:51:45', NULL),
(3, 'Yagnik', 'yagnik.technocomet@gmail.com', '7779058869', NULL, '$2y$10$zWnTWgsIcqXIbEY5KAuxz.zxNsZu0pWuuU5ZarEzofYsOaXSNCksy', '32231333', 'doctor', NULL, NULL, '2023-11-02 12:54:16', '2023-11-02 12:54:16', NULL),
(4, 'Dixita', 'dixitagondaliya98@gmail.com', '1234567890', NULL, '$2y$10$rHO0iD9rOHC3ht2TSuJ/wuCn906vmLvhlwcjt4uypUxh1hBm0hQIi', '49207950', 'patient', NULL, NULL, '2023-11-02 12:54:56', '2023-11-02 12:54:56', NULL),
(5, 'parag talaviya', 'parag@gmail.com', '1234567890', NULL, '$2y$10$3.vmy7sOeh2iqPTZLReIPeWmSSVcpvYN6rD.OHlUt0dqY49QKpzWW', '07843186', 'doctor', NULL, NULL, '2023-11-02 22:39:53', '2023-11-02 22:39:53', NULL),
(6, 'priya', 'priya@gmail.com', '1234567890', NULL, '$2y$10$eggmDvhOLW84MGKCuO49reH8i9DyNgYHXMVZqk6iIX0Iqc2ggtqHy', '09196036', 'patient', NULL, NULL, '2023-11-02 22:42:37', '2023-11-02 22:42:37', NULL),
(7, 'chitrangada', 'chitra@gmail.com', '1234567890', NULL, '$2y$10$LZgQYqKv34B9pdEaKHjt0.dn98TGMODaAkr61DM2L/cIws8sh7O0W', '15791214', 'patient', NULL, NULL, '2023-11-02 22:43:33', '2023-11-02 22:43:33', NULL),
(8, 'chetu', 'patelchetu611@gmail.com', '6355658656', NULL, '$2y$10$ZGDqfEXNdhwbs/pESVivLe5QOmGgOG2VJTUCF0AkXt0atJPTEGD9m', '03983981', 'patient', NULL, '2XYJHJAq281C2DEYnmdQFs8m5NY2JiKAB8ceayiQgN05E6sMRQP2yMhdzkxG', '2023-11-06 01:32:01', '2023-11-06 01:33:30', NULL),
(9, 'aaa', 'aaa@gmail.com', '1234567890', NULL, '$2y$10$v4KdnIfre2cL.NUOW0hCJ.WcEqdEtPVjZ.RvhXMz35wF5p1RmXeTy', '83326175', 'doctor', NULL, NULL, '2023-11-06 01:55:28', '2023-11-06 01:55:28', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appoiments`
--
ALTER TABLE `appoiments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appoiments`
--
ALTER TABLE `appoiments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
