-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2024 at 12:17 PM
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
-- Database: `mromar`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer_text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer_text`, `is_correct`, `created_at`, `updated_at`) VALUES
(3, 2, 'ans1', 0, NULL, '2024-10-13 05:11:17'),
(5, 6, 'hnhdgnggh', 0, NULL, NULL),
(6, 6, 'ghhhhhhhhh', 1, NULL, NULL),
(7, 2, 'wahtwe wejew', 1, '2024-10-13 04:59:11', '2024-10-13 04:59:11'),
(8, 2, 'wahtwe wejew', 0, '2024-10-13 04:59:24', '2024-10-13 04:59:24');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` date NOT NULL,
  `present` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `attendance_date`, `present`, `created_at`, `updated_at`) VALUES
(2, 35, '2024-10-10', 1, '2024-10-07 08:35:04', '2024-10-07 08:35:04'),
(3, 35, '2025-10-10', 0, NULL, '2024-10-07 08:58:31'),
(4, 23, '2024-10-10', 1, '2024-10-07 08:56:57', '2024-10-07 08:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('22222@gmail.com|127.0.0.1', 'i:1;', 1728386636),
('22222@gmail.com|127.0.0.1:timer', 'i:1728386636;', 1728386636),
('f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59', 'i:1;', 1728399614),
('f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59:timer', 'i:1728399614;', 1728399614);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`id`, `code`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 'NlshOWNo8qjr', 23, '2024-10-08 03:44:30', '2024-10-08 03:44:30'),
(6, 'KvgEODVVYe9d', 24, '2024-10-09 03:24:13', '2024-10-09 03:24:13');

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
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
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `video_url` varchar(255) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `study_year` year(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `description`, `video_url`, `video_id`, `duration`, `status`, `study_year`, `created_at`, `updated_at`) VALUES
(1, 'vfdvvdfd', 'dvdfvdfvdfvvdf', 'https://www.youtube.com/', 'v=uAc5XYc-7hI', 33, 'active', '2001', NULL, NULL),
(2, 'dfvdfsvsdfv', 'fcfdv', 'http://localhost/phpmyadmin/index.php?route=/table/change&db=mromar&table=lessons', 'v=uAc5XYc-7hI', 22, 'active', '2002', NULL, NULL),
(3, 'dfdsfvfv', 'dvfvdfdfv', 'dfvdffv', 'dfvdsfvdfv', 4, 'active', '2003', NULL, NULL),
(4, 'dfvvddfv', 'dfvdfvdfv', 'dfvdffvd', 'dfvdfvdfvfvd', 22, 'active', '2001', NULL, NULL);

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
(7, '0001_01_01_000000_create_users_table', 1),
(8, '0001_01_01_000001_create_cache_table', 1),
(9, '0001_01_01_000002_create_jobs_table', 1),
(10, '2024_10_03_085805_add_two_factor_columns_to_users_table', 2),
(11, '2024_10_03_090247_create_personal_access_tokens_table', 3),
(12, '2024_10_03_124728_add_new_column_to_users_table', 4),
(13, '2024_10_06_062335_add_subscribe_at_column_to_users_table', 5),
(14, '2024_10_06_085856_add_studyyear_column_to_users_table', 6),
(15, '2024_10_06_120506_create_codes_table', 7),
(16, '2024_10_06_131646_create_quizzes_table', 8),
(17, '2024_10_06_131719_create_answers_table', 9),
(18, '2024_10_06_131759_create_responses_table', 9),
(19, '2024_10_06_131718_create_questions_table', 10),
(20, '2024_10_07_131646_create_quizzes_table', 11),
(21, '2024_10_07_131718_create_questions_table', 11),
(22, '2024_10_07_131719_create_answers_table', 11),
(23, '2024_10_07_131759_create_responses_table', 11),
(24, '2024_10_07_063320_create_rates_table', 12),
(25, '2024_10_07_104732_create_attendances_table', 13),
(26, '2024_10_07_055914_add_is_acive_to_users_table', 14),
(27, '2024_10_07_045231_create_payments_table', 15),
(28, '2024_10_07_071018_create_results_table', 16),
(29, '2024_10_07_013328_create_lessons_table', 17);

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(4, 23, 22.30, '2024-10-08 06:40:28', '2024-10-08 06:40:28'),
(5, 23, 22.30, '2024-10-08 06:44:41', '2024-10-08 06:44:41');

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(140, 'App\\Models\\User', 21, 'YourAppName', '4bdafb2c3f9b1a39711ea04c4615ed5ac6ef22f98d83d3dcff3ed37e5a3e67f6', '[\"*\"]', NULL, NULL, '2024-10-08 08:37:16', '2024-10-08 08:37:16'),
(141, 'App\\Models\\User', 21, 'YourAppName', '3928b859df78dee80d3b7640b8011bd5c34b98a6618a24e71380ab71533ff50f', '[\"*\"]', NULL, NULL, '2024-10-08 08:42:22', '2024-10-08 08:42:22'),
(142, 'App\\Models\\User', 21, 'YourAppName', '9cadfcc3fabd350addc8d32a5bad2e06e199347989e9c1955fbf0b4b76298d28', '[\"*\"]', '2024-10-09 05:06:21', NULL, '2024-10-08 08:54:38', '2024-10-09 05:06:21'),
(148, 'App\\Models\\User', 27, 'YourAppName', '2c68aac7262b249cc8421f1738cac1403edd2748347664c8a3032d10ae80306b', '[\"*\"]', NULL, NULL, '2024-10-08 11:30:09', '2024-10-08 11:30:09'),
(149, 'App\\Models\\User', 27, 'YourAppName', 'e461af97582fabe102a1b6c1c6a5063ab8e454a4c846ed1cfd47ac48181c6451', '[\"*\"]', NULL, NULL, '2024-10-08 12:08:12', '2024-10-08 12:08:12'),
(153, 'App\\Models\\User', 24, 'YourAppName', '4c15f7ce62b3634b8bff9216cc4c27c6201e25cb6d6eae68069b980c9e548b05', '[\"*\"]', '2024-10-09 03:24:13', NULL, '2024-10-09 03:23:54', '2024-10-09 03:24:13'),
(154, 'App\\Models\\User', 24, 'YourAppName', '8b9e5ee8fb2f734de11c32a65b528646811c666c19d797bdcac715cdeffb5709', '[\"*\"]', '2024-10-09 05:00:46', NULL, '2024-10-09 05:00:32', '2024-10-09 05:00:46'),
(155, 'App\\Models\\User', 24, 'YourAppName', '4dbdc5cff85f6bcfe91d9cf79f292ecbaf178da7f45840b7297c8e5918afef95', '[\"*\"]', NULL, NULL, '2024-10-09 05:02:11', '2024-10-09 05:02:11'),
(156, 'App\\Models\\User', 24, 'YourAppName', 'cb5dd8aaebf057ef5ea35d3d4fb551f5647d42e2ce96eba36a39cba17762adea', '[\"*\"]', '2024-10-09 05:19:24', NULL, '2024-10-09 05:06:47', '2024-10-09 05:19:24'),
(159, 'App\\Models\\User', 36, 'YourAppName', 'db3be4e542e00ef5ea9ba0a25259f1f344df9e18013855368632af090a4a6edf', '[\"*\"]', '2024-10-09 09:52:38', NULL, '2024-10-09 07:03:07', '2024-10-09 09:52:38'),
(168, 'App\\Models\\User', 35, 'YourAppName', '0ee24f77aea4205c87ca5793273b96c30886eb2645a679794c20011cf53fc2b6', '[\"*\"]', '2024-10-13 03:32:06', NULL, '2024-10-13 03:31:50', '2024-10-13 03:32:06'),
(169, 'App\\Models\\User', 36, 'YourAppName', '00b824db8f60c011a5399d0a62a7994d75b9d0659136a9903bfa416affd1fdba', '[\"*\"]', '2024-10-13 07:06:53', NULL, '2024-10-13 03:32:18', '2024-10-13 07:06:53'),
(170, 'App\\Models\\User', 35, 'YourAppName', '40ba8584b35a453e5bf407a70d32e993295ffa870de6066b268d354d32121e8e', '[\"*\"]', '2024-10-13 04:11:13', NULL, '2024-10-13 03:53:26', '2024-10-13 04:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `question_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `question_text`, `created_at`, `updated_at`) VALUES
(2, 2, 'erreff', NULL, NULL),
(5, 2, 'wahtwe wejew', '2024-10-13 04:02:30', '2024-10-13 04:02:30'),
(6, 3, 'freefeer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `title`, `description`, `admin_id`, `created_at`, `updated_at`) VALUES
(2, 'effrfr', 'errfe', NULL, NULL, NULL),
(3, 'new title 3', 'new desc 2', NULL, '2024-10-13 04:29:09', '2024-10-13 04:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rate` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `user_id`, `rate`, `created_at`, `updated_at`) VALUES
(2, 35, '13', '2024-10-07 05:02:41', '2024-10-07 05:02:41'),
(3, 17, '21', NULL, NULL),
(6, 33, '23', '2024-10-07 05:08:28', '2024-10-07 05:08:28'),
(7, 23, '43', '2024-10-07 05:09:58', '2024-10-07 05:09:58'),
(8, 23, '43', '2024-10-07 05:47:43', '2024-10-07 05:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE `responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `selected_answer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `responses`
--

INSERT INTO `responses` (`id`, `quiz_id`, `student_id`, `question_id`, `selected_answer_id`, `created_at`, `updated_at`) VALUES
(2, 2, 33, 2, 3, NULL, '2024-10-13 06:05:10'),
(3, 2, 33, 3, 2, NULL, NULL),
(4, 2, 33, 2, 3, '2024-10-13 05:54:58', '2024-10-13 05:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `user_id`, `quiz_id`, `score`, `created_at`, `updated_at`) VALUES
(4, 23, 3, 33, NULL, NULL),
(5, 30, 2, 33, NULL, NULL),
(6, 23, 2, 33, NULL, NULL),
(7, 29, 2, 100, NULL, NULL),
(9, 33, 2, 50, '2024-10-13 06:56:17', '2024-10-13 06:56:17');

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
('Ai9U8uRT6BAZyQ6AE8DCHa1y4zoRi5iwny3Jabuw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHJBZFFPb0dUR1dvblB4d1JKNXRGTzhwYm9CV3l3aHc4emVTVXQzTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728807423),
('C1jJ942QdojyHtnp0x6uaMplXJR0TRfUk17WnVDF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlRlZDNmc3h6eEJqNFMwRU1CRDh2ZmIwc2oyQk1Gd1R4aUVKTVVWOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728800153),
('t3Y4tO2yARk7xjpiNv82TaV6BpONdudr9Wbkbfcc', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicVNINExrdnlHWHJsMGk4bzFYUnJqZlNLWDVMQUNpZnJTZm5pdzFDdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728802406);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `subscribe_at` timestamp NULL DEFAULT NULL,
  `studyyear` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `is_parent`, `is_admin`, `is_super_admin`, `remember_token`, `created_at`, `updated_at`, `child_id`, `subscribe_at`, `studyyear`, `is_active`) VALUES
(1, 'superadmin', 'superamin@super.com', NULL, '$2y$12$7I4fPCwJzxf5z9qxhc.SUOfLjwwayfiq9FWccxH9DD0w1NBbQhm0q', NULL, NULL, NULL, 0, 0, 1, NULL, '2024-10-03 06:18:58', '2024-10-03 06:18:58', NULL, NULL, '1', 1),
(2, 'admin', 'addmin@super.com', NULL, '$2y$12$pkkV1EdMCWOGRmVbL3svA.oqk80/hpBoesHxAMaaGh7Jcowqi1ScG', NULL, NULL, NULL, 0, 1, 0, NULL, '2024-10-03 06:26:17', '2024-10-08 05:36:14', NULL, NULL, '1', 0),
(11, 'terst', 'parrent2@test.com', NULL, '$2y$12$mZjKM/AxUXGJsyDboKxd.Om1M8yxkZ3l32/QmqWUXsq.GFIqN6pDG', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-03 09:43:12', '2024-10-03 09:43:12', NULL, NULL, '1', 1),
(16, 'terrerst', 'parrenetee2@test.com', NULL, '$2y$12$YAkG.LLXihEBpx8LQ1J.L.OncacLjv0E3GWzzCyK0E2OwZ8hzerU.', NULL, NULL, NULL, 1, 0, 0, NULL, '2024-10-03 10:18:05', '2024-10-03 10:18:05', 11, NULL, '1', 1),
(17, 'terr11erst', 'parrene11tee2@test.com', NULL, '$2y$12$US6FOQJbppNdVdrgZfFlA.OaIUMNK1ihURXl2c20tmSfAG.coizbu', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-03 10:19:24', '2024-10-03 10:19:24', NULL, NULL, '1', 1),
(18, 'tweweerr11erst', 'parderene11tee2@test.com', NULL, '$2y$12$3cs6klkZ/wDyzNb2AGnEMesVLz9lTPI/.ymEZM41cqqsvEeKyFRCG', NULL, NULL, NULL, 0, 0, 0, 'j1ZmDRniPbLsNcCl5DSAduiGEhGmqeFF5vke8DOPRcjcHoBDtlUwW3UpnSKR', '2024-10-06 03:32:21', '2024-10-08 09:41:48', NULL, NULL, '1', 1),
(20, 'yousef', 'stuent2@test.com', NULL, '$2y$12$/./ziyjbJAZ1SVV9GSMyhuxoc.DYjU1M48yVp6uVYXWlsFkWB2g32', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-06 06:07:09', '2024-10-08 04:07:44', NULL, '2024-10-06 11:00:05', '1', 1),
(21, 'admin2', 'admineee22222@admin.com', NULL, '$2y$12$tfd.xZDQHII4g4IZlvGFvOTFcCWcMXPSQJs6ouYdrBKvXJHxq/qI6', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-06 09:55:37', '2024-10-08 09:00:33', NULL, NULL, '2', 1),
(22, 'yousef', 'ddhs8e@test.com', NULL, '$2y$12$cT1x1BZgQqSr3H814LBnheiXpfYXl2glg9wRs2GlsW.tE7GodX8Xm', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-06 16:04:48', '2024-10-06 16:04:48', NULL, NULL, '2', 1),
(23, 'admin2', 'admin22222@admin.com', NULL, '$2y$12$s5YpqJVCTJwsZH1KDFl8ZeDvmad1.USVU6ptFJPiAS/MefmRIcFxS', NULL, NULL, NULL, 0, 1, 0, NULL, '2024-10-08 03:27:16', '2024-10-08 08:37:25', NULL, '2024-08-07 07:43:16', '1', 1),
(24, 'yousef ahmed', 'yousef20022008@gmail.com', NULL, '$2y$12$cWX1MNX3jEMQ5zFUWvrGseq.K1uxmpGTytLdZusZFU9tff6wbdAXy', NULL, NULL, NULL, 0, 1, 0, '0otWpeLQrU2NJx5OKbhLiiwEmXLEq1qzLRp9lq1DHVPvyGDWmKH0uQqqUEje', '2024-10-08 08:13:21', '2024-10-08 12:07:38', NULL, NULL, '1', 1),
(25, 'yousef', '22222@gmail.com', NULL, '$2y$12$TmSQV8hnABjywXBGbtEspulzDgvt0bb3w.7N8spCds9HUGSEwve9e', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 08:24:14', '2024-10-08 08:24:14', NULL, NULL, '2', 1),
(26, 'yousef', 'yousef@yousef.com', NULL, '$2y$12$YCsOTi5eSRV/evg/t6QDW.DiStVA5fcQbsalxts7upU94kQyHRRsm', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 08:51:39', '2024-10-08 08:51:39', NULL, NULL, '1', 1),
(27, 'yousef', 'youseeeef@yousef.com', NULL, '$2y$12$fKku7WUQfO0xcWLrkb1GHeRABxVQVLFyVle5GtF6xsVe.wgozGO56', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 09:15:55', '2024-10-08 09:15:55', NULL, NULL, '1', 1),
(28, 'yousef', 'youseeq332q44eef@yousef.com', NULL, '$2y$12$/szORM5I4/.vVfCqvSaIxOvhIt5yM7G.sg.XxIqL0nIL9tiOqjc.e', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 11:49:02', '2024-10-08 11:49:02', NULL, '2024-09-08 08:14:51', '1', 1),
(29, 'yousef', 'youq332q44eef@yousef.com', NULL, '$2y$12$.tu8FApPWZaVPRqoam5pj.1yrww2YWSJawcAV.d2WM3jOx3boh6Hy', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 11:50:53', '2024-10-08 11:50:53', NULL, NULL, '1', 1),
(30, 'yousef', 'youq2q44eef@yousef.com', NULL, '$2y$12$iEgPePcG9g7ltpl2aWMxbOqPFi/nB16C..VKpJqGBuNAm0GmFHQlC', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 11:51:37', '2024-10-08 11:51:37', NULL, NULL, '1', 1),
(31, 'yousef', 'youq2hhq44eef@yousef.com', NULL, '$2y$12$avLS5lSpLyfJktthp45fu.LX9xAv22D4ZeASZpbfv7pubxSwp07LW', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 11:53:23', '2024-10-08 11:53:23', NULL, NULL, '1', 1),
(32, 'yousef', 'youq2h44eef@yousef.com', NULL, '$2y$12$T2AwvF8f0T2rW9hg8eS6net307SqFLMzAmHnISiWGeVxggdhy3lIO', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 11:55:04', '2024-10-08 11:55:04', NULL, NULL, '1', 1),
(33, 'yousef', 'youq24eef@yousef.com', NULL, '$2y$12$7.K4HJe3sC/Z8iJADmFbKuNcbGIZH4wA8dFNiI.wEpbbnP/tYZvs6', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 11:56:25', '2024-10-08 11:56:25', NULL, NULL, '1', 1),
(34, 'yousef', 'you4eef@yousef.com', '2024-10-08 11:59:15', '$2y$12$Aowl7SM0JiQZNbt2EdBfIu7lv05pVAjIRwST3svsBIdN.6ygSZgSK', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-08 11:58:36', '2024-10-08 11:59:15', NULL, NULL, '1', 1),
(35, 'yousef', 'stu@stu.com', NULL, '$2y$12$FU7bqqPVGnx0TrpK1.76UOZL6uzbjmnSVVcK4rt5brsDlRBPbyOq6', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-09 05:16:51', '2024-10-09 05:16:51', NULL, '2024-10-04 06:48:43', '1', 1),
(36, 'yousef', 'stu2@stu.com', NULL, '$2y$12$hWc4FO8tlavbrjV8D4IXNuD47kwWyn9YE60BR18RCNUFoYw0npf96', NULL, NULL, NULL, 0, 0, 1, NULL, '2024-10-09 05:17:29', '2024-10-09 05:17:29', NULL, NULL, '1', 1),
(37, 'yousef', 'stu24@stu.com', NULL, '$2y$12$XEu5tCjSlRXDcW8w5hwwBO8Q.Vv9sTMFmwuAFXI3bM3HRcFxBjCs.', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-09 10:50:29', '2024-10-09 10:50:29', NULL, NULL, '1', 1),
(38, 'yousef', 'stu2e4@stu.com', NULL, '$2y$12$TCKtXF82EJwF0xGDI/1nwuKe/LkzEfmIW/O5CwFdlhzya0Sk3P3.a', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-09 10:51:31', '2024-10-09 10:51:31', NULL, NULL, '1', 1),
(39, 'yousef', 'tu2e4@stu.com', NULL, '$2y$12$lPAnLyScva4AOkJ1hjSsruTPi0djsYQPa6ObdmUPeY4RAb294ooge', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-10 04:06:57', '2024-10-10 04:06:57', NULL, NULL, '1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_question_id_foreign` (`question_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `1` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
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
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_quiz_id_foreign` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rates_user_id_foreign` (`user_id`);

--
-- Indexes for table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `responses_quiz_id_foreign` (`quiz_id`),
  ADD KEY `responses_student_id_foreign` (`student_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `results_user_id_foreign` (`user_id`),
  ADD KEY `results_quiz_id_foreign` (`quiz_id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `codes`
--
ALTER TABLE `codes`
  ADD CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `responses`
--
ALTER TABLE `responses`
  ADD CONSTRAINT `responses_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
