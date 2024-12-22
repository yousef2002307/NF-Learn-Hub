-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 07:30 PM
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
(4, 35, '2024-10-10', 1, '2024-10-07 08:56:57', '2024-10-07 08:56:57'),
(5, 35, '2024-08-05', 0, NULL, NULL),
(6, 35, '2024-06-03', 1, NULL, NULL);

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
('5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1729245817),
('5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1729245817;', 1729245817),
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
(6, 'KvgEODVVYe9d', 24, '2024-10-09 03:24:13', '2024-10-09 03:24:13'),
(7, 'UWOUF8cLXK3j', 36, '2024-10-17 03:39:59', '2024-10-17 04:09:05'),
(8, 'u6IWyw5QyVwu', 35, '2024-10-20 10:38:41', '2024-10-20 10:39:10'),
(9, '6tJNpVDzP1VW', 69, '2024-10-21 10:04:45', '2024-10-21 10:04:45'),
(10, '3qFzjfOlwFc7', 70, '2024-10-21 10:05:29', '2024-10-21 10:05:29'),
(11, '7Bx3PToQWNBO', 71, '2024-11-03 05:17:13', '2024-11-03 05:17:13');

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
  `study_year` int(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `embeded` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `description`, `video_url`, `video_id`, `duration`, `status`, `study_year`, `created_at`, `updated_at`, `embeded`) VALUES
(8, 'test', 'test', 'https://vimeo.com/1027396271', '/videos/1027396271', NULL, 'active', 3, '2024-11-07 16:14:10', '2024-11-07 16:14:10', NULL),
(9, 'test', 'test', 'https://vimeo.com/1027399131', '/videos/1027399131', NULL, 'active', 3, '2024-11-07 16:22:29', '2024-11-07 16:22:29', '<iframe src=\"https://player.vimeo.com/video/1027399131?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=480972\" width=\"400\" height=\"300\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture; clipboard-write\" title=\"Test Video\"></iframe>'),
(10, 'test2', 'test2', 'https://vimeo.com/1027400349', '/videos/1027400349', NULL, 'active', 3, '2024-11-07 16:26:24', '2024-11-07 16:26:24', '<iframe src=\"https://player.vimeo.com/video/1027400349?badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=480972\" width=\"400\" height=\"300\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture; clipboard-write\" title=\"test2\"></iframe>');

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
(29, '2024_10_07_013328_create_lessons_table', 17),
(30, '2024_10_07_121250_add_payment_details_to_payments_table', 18),
(31, '2024_10_07_131647_add_lesson_id_to_quizzes_table', 19);

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_transaction_id` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `amount`, `created_at`, `updated_at`, `payment_transaction_id`, `payment_method`, `payment_status`) VALUES
(4, 23, 22.30, '2024-10-08 06:40:28', '2024-10-08 06:40:28', NULL, NULL, NULL),
(5, 23, 22.30, '2024-10-08 06:44:41', '2024-10-08 06:44:41', NULL, NULL, NULL),
(6, 35, 22.30, '2024-10-28 03:59:13', '2024-10-28 03:59:13', NULL, NULL, NULL),
(7, 35, 22.30, '2024-11-03 12:15:20', '2024-11-03 12:15:20', NULL, NULL, NULL),
(8, 35, 22.30, '2024-11-03 12:19:25', '2024-11-03 12:19:25', NULL, NULL, NULL),
(9, 35, 22.30, '2024-11-03 12:42:48', '2024-11-03 12:42:48', NULL, NULL, NULL),
(10, 35, 22.30, '2024-11-03 12:47:16', '2024-11-03 12:48:38', 'TX-2946551240', 'online-payment', 'Completed'),
(11, 35, 22.30, '2024-11-03 12:52:15', '2024-11-03 12:52:15', NULL, NULL, NULL),
(12, 35, 22.30, '2024-11-03 12:53:12', '2024-11-03 12:54:59', 'TX-2946551244', 'online-payment', 'Completed'),
(13, 35, 22.30, '2024-11-03 12:55:32', '2024-11-03 12:56:53', 'TX-2946551254', 'online-payment', 'Completed'),
(14, 35, 22.30, '2024-11-03 13:00:59', '2024-11-03 13:01:47', 'TX-2946551258', 'online-payment', 'Completed'),
(15, 35, 22.30, '2024-11-03 13:02:54', '2024-11-03 13:03:33', 'TX-2946551262', 'online-payment', 'Completed'),
(16, 35, 22.30, '2024-11-05 08:21:14', '2024-11-05 08:22:50', 'TX-2946551282', 'online-payment', 'Completed');

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
(153, 'App\\Models\\User', 24, 'YourAppName', '4c15f7ce62b3634b8bff9216cc4c27c6201e25cb6d6eae68069b980c9e548b05', '[\"*\"]', '2024-10-17 03:39:32', NULL, '2024-10-09 03:23:54', '2024-10-17 03:39:32'),
(154, 'App\\Models\\User', 24, 'YourAppName', '8b9e5ee8fb2f734de11c32a65b528646811c666c19d797bdcac715cdeffb5709', '[\"*\"]', '2024-10-09 05:00:46', NULL, '2024-10-09 05:00:32', '2024-10-09 05:00:46'),
(155, 'App\\Models\\User', 24, 'YourAppName', '4dbdc5cff85f6bcfe91d9cf79f292ecbaf178da7f45840b7297c8e5918afef95', '[\"*\"]', NULL, NULL, '2024-10-09 05:02:11', '2024-10-09 05:02:11'),
(156, 'App\\Models\\User', 24, 'YourAppName', 'cb5dd8aaebf057ef5ea35d3d4fb551f5647d42e2ce96eba36a39cba17762adea', '[\"*\"]', '2024-10-09 05:19:24', NULL, '2024-10-09 05:06:47', '2024-10-09 05:19:24'),
(180, 'App\\Models\\User', 36, 'YourAppName', '08afb02bca4bfb9bb41ebe5da43ed1f444e4dbd40cffba5a8fa5404ad29f1ed7', '[\"*\"]', NULL, NULL, '2024-10-18 07:04:40', '2024-10-18 07:04:40'),
(181, 'App\\Models\\User', 36, 'YourAppName', '95c0f0a2c3fdab9ee090536553aa3e8f827f3f1c4ed57fc04401ff16deaf79df', '[\"*\"]', NULL, NULL, '2024-10-18 08:54:25', '2024-10-18 08:54:25'),
(188, 'App\\Models\\User', 69, 'YourAppName', '0c633dc20fe039637cdedf72999522161c23b31cc90f19009274a91ef0548502', '[\"*\"]', NULL, NULL, '2024-10-21 10:03:02', '2024-10-21 10:03:02'),
(189, 'App\\Models\\User', 69, 'YourAppName', '7d545fc9208ef610e693654933e496ab5c98aafd82ac3257b9cef9e9cc514ed6', '[\"*\"]', NULL, NULL, '2024-10-21 10:03:20', '2024-10-21 10:03:20'),
(190, 'App\\Models\\User', 69, 'YourAppName', '308b42360c2e2430ac8c84a5937aabf01d5e18753af3eafed6024239658390c3', '[\"*\"]', NULL, NULL, '2024-10-21 10:04:44', '2024-10-21 10:04:44'),
(191, 'App\\Models\\User', 69, 'YourAppName', 'db72c4cd694bdbcc749bb8150bd728af5a763896ca1509c1b5662ec90ef8dc8a', '[\"*\"]', NULL, NULL, '2024-10-21 10:05:03', '2024-10-21 10:05:03'),
(192, 'App\\Models\\User', 70, 'YourAppName', 'f4f5bafa0406bfcae2c2fdd68f9881594883933fffdcb4b5b04b261c9f83d0d6', '[\"*\"]', NULL, NULL, '2024-10-21 10:05:29', '2024-10-21 10:05:29'),
(196, 'App\\Models\\User', 71, 'YourAppName', 'f6042d861a59f9c77fe74641cd30385c4282c6cb591075942997ccb9755a28c9', '[\"*\"]', '2024-11-03 09:52:19', NULL, '2024-11-03 05:17:13', '2024-11-03 09:52:19'),
(197, 'App\\Models\\User', 71, 'YourAppName', 'ce1b34a986ebba26cf0fd5065686ff0f693373538913abd28ccfa4858dcb96fc', '[\"*\"]', '2024-11-03 09:56:14', NULL, '2024-11-03 09:50:22', '2024-11-03 09:56:14'),
(200, 'App\\Models\\User', 35, 'YourAppName', 'b3bbdcde8c7d4bc8c8d709e0a536e093e47716b08ca696979a27e4b7dc3483a5', '[\"*\"]', '2024-11-03 13:02:54', NULL, '2024-11-03 12:42:19', '2024-11-03 13:02:54'),
(201, 'App\\Models\\User', 35, 'YourAppName', '9a9b106fc4fb43dae08096547cee2d64728fb2f6e22b517c38fd5f0235fd91aa', '[\"*\"]', '2024-11-05 08:21:14', NULL, '2024-11-05 08:20:52', '2024-11-05 08:21:14'),
(202, 'App\\Models\\User', 36, 'YourAppName', 'b1da8d4bd7c572c3371eb560bb8d70bd43e281a01686c4899347549e9dc86128', '[\"*\"]', '2024-11-06 11:02:56', NULL, '2024-11-06 10:47:23', '2024-11-06 11:02:56'),
(203, 'App\\Models\\User', 36, 'YourAppName', '63512c187808563dc13ec4607a60094e2c5a589de95f9d9fa285060189cccfa7', '[\"*\"]', '2024-11-07 16:29:28', NULL, '2024-11-07 16:28:01', '2024-11-07 16:29:28');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('0KwbTrO1NgIL9yqPirNggRA1XI0iObQEtqHWmEkl', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMzNnUjE0ZDducHhmSkdKNjVOUlhxRkltVGVTbW4xVWNSTEFQYXBiVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1729516260),
('2HtWmhtEOe9egyWMFX4I7l0Vwah6xaI0BVbQDJ7A', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib2VhOG05SkJpVlZBRlRTMlZLdHZmdnlOQUg4c0pUTmVabHJITGQwVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1730648053),
('6XUdWcKq5571Q2hmYKloDtdCktlXNVnnrTXfFCme', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSE5LaFQ4UUdWcE9WeXZmZWZwUnVEUWcxRjRPWUFiaDZhM1k5UWdOcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1729412400),
('7n0GxoAQI861ime0HyZiuspAvMta6crWGQeVWgWi', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZW9MZjY4UHZVN01maWQ3bnlOUjEza2xUbFRvWHhIdWJRVU83d3JXMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1730359211),
('aj9p8CHsuvVJFkwNnaTIdIXD5Qw1BmKKIT1DZERW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEtQTHRkQjdqc1R3Wkt2aTJyNld6d0JLd1RGdmZ5cVhsQnFvUVcxdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729252218),
('c1kAwap9aT35dHfieNUXVAZbvyalyQsJBupfEv2C', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTnRqTlRFaHp1emNWeHo0dnpUZXhyck1XYkJsQkhJZFIwdG0weExjeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1730897243),
('cpVHVJOIba9wpke9sRJih8G2lSwAonB4Vo7X88Wv', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVkc5ZUM5QndHRnplYTdDQktuSjd0WloyaTJvaWpyN25BTU1qWWlxWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1729432311),
('cR2qlYpUNWbdHG1YKBCIi8bsZFDwWMAVi4WnQ6MG', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYjZ5V2Jzc0ZqRmdFRjhnSUJjbWhnOEFWcEI5bUd2TnZYRUU2YVJOWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1730635181),
('dnrdKhe0pkMQjEgjFdxhBWisVGMggaELK9tUdPaA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWNYUlZRcktZQmlFcEw0VnlRa25kbXkzZjRKU0pJRFFXV3BmSnNmbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730897067),
('fTlhmQR7TYqZrIqFgdDempTnlAOo8zlHnnQVtn6v', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0R3NUZXZ1h0YTFoUlZEUDJmRDhDRjlkTk95bWJwYTdXMnp5Q2lnYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730802177),
('ibfnOQkRw6p9tetaXJgFQPrGSuiETQCzyu5S5qBR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUZEU0paSkYzSVQ3TEZ6c3dZQXBBRHoxNGJ6cEowNlJYbHFueHpubyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730359057),
('KAftpkb6lIYUOaYJ6IwmclIL4Gzv0gJg1hkuJYw6', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiako0UGRWeDdiQ1I0WFRDMlh6cDh5dlNFd0MwbmE3SEpvSnFMVmVWNCI7fQ==', 1729252474),
('KtSfIwOpG0mVW8pXRbFjfXfEU7hcWeC9TFQO9Cyx', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQjZVNFIzMGV6UFZ3RTAxNHVDYW5zMEVYSURSZTR0a2NYZEZkNWwxbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1730618233),
('llZXnrvZYrfU3VpJ5C4F4GOftn3o1K6nQ0taYtLw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUZHV1pqR0pjZVB2bVpnV1NWVGdtYk0xWFZlbFlRUXRBMjd2bnhrciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730646220),
('NzvgGMx07fmfqAgmXFznKe1kJPfi4E5S4oewHMdX', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiREFCYmgxdjNTUnE1Q21uSWhDbUY5bHR0cE43N1RQaXFaQmpxQnJzZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1730802052),
('PZyKfA2yQrH7uvki1hTeczeLrlFLUnIK2GHdhaXj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHZ5R29lSTUxdGtpZ2ZJMU95UzlKaVQ5eU9rQVd6b1hzWXRVVmpiaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730646808),
('sf0AWCrOHY8TfdXtcmXX0nbW8T2er2XXJKJC41C0', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzIzU2RiQzFoOThPNjVkRDNZVnVzMEpHZnFyMjVmY3lDbExxektDVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1731004081),
('Xuhv52Hxa43pH3zV8rBCg9aKnYP45E90zOW8jn5b', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMXlVemZTWFlsUlRtUjFrREJvQWdYQ0plZVpRUlQ5NkRzeGFMelNDdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1730097498);

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
(2, 'admin', 'addmin@super.com', NULL, '$2y$12$pkkV1EdMCWOGRmVbL3svA.oqk80/hpBoesHxAMaaGh7Jcowqi1ScG', NULL, NULL, NULL, 0, 1, 0, NULL, '2024-10-03 06:26:17', '2024-10-17 03:42:48', NULL, NULL, '1', 0),
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
(35, 'yousef', 'stu@stu.com', NULL, '$2y$12$FU7bqqPVGnx0TrpK1.76UOZL6uzbjmnSVVcK4rt5brsDlRBPbyOq6', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-09 05:16:51', '2024-11-05 08:22:50', NULL, '2024-11-05 08:22:50', '3', 1),
(36, 'yousef', 'stu2@stu.com', NULL, '$2y$12$hWc4FO8tlavbrjV8D4IXNuD47kwWyn9YE60BR18RCNUFoYw0npf96', NULL, NULL, NULL, 0, 0, 1, NULL, '2024-10-09 05:17:29', '2024-10-09 05:17:29', NULL, NULL, '3', 1),
(37, 'yousef', 'stu24@stu.com', NULL, '$2y$12$XEu5tCjSlRXDcW8w5hwwBO8Q.Vv9sTMFmwuAFXI3bM3HRcFxBjCs.', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-09 10:50:29', '2024-10-09 10:50:29', NULL, NULL, '1', 1),
(38, 'yousef', 'stu2e4@stu.com', NULL, '$2y$12$TCKtXF82EJwF0xGDI/1nwuKe/LkzEfmIW/O5CwFdlhzya0Sk3P3.a', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-09 10:51:31', '2024-10-09 10:51:31', NULL, NULL, '1', 1),
(39, 'yousef', 'tu2e4@stu.com', NULL, '$2y$12$lPAnLyScva4AOkJ1hjSsruTPi0djsYQPa6ObdmUPeY4RAb294ooge', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-10 04:06:57', '2024-10-10 04:06:57', NULL, NULL, '1', 1),
(40, 'youeesef', 'masr@stu.com', NULL, '$2y$12$Y1346adfEr6YS.oXlvc/zuHO6GKrksEnZIMWMRGomJqhkbD2I5ADy', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-13 09:19:18', '2024-10-13 09:19:18', NULL, NULL, '1', 1),
(41, 'youeesef', 'masdr@stu.com', NULL, '$2y$12$73KKXQGJ8aASJV4m85oUgOeOXx1OZb2K6F4ISdkJZfY8Z7zv/jo6u', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-17 03:39:19', '2024-10-17 03:39:19', NULL, NULL, '1', 1),
(42, 'youeesef', 'ma22sdr@stu.com', NULL, '$2y$12$DIL.MaT6LnZMZ1.52smAEOv083zHWhwxTYSaXpUGAy3Z38aK2HqXm', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 06:50:58', '2024-10-18 06:50:58', NULL, NULL, '1', 1),
(43, 'youeesef', 'sdr@stu.com', NULL, '$2y$12$x2CQ1qbxhRuSh8RdKh4iuuULENZxZO1OpPEm7sLJ./gd9ywgh2EHa', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 06:59:14', '2024-10-18 06:59:14', NULL, NULL, '1', 1),
(44, 'youeesef', 'sr@stu.com', NULL, '$2y$12$cqM1XjMMLieozKsJDkr13.sVuWkit/S.6McaZN7HmrGSyt.HxQpIW', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:14:25', '2024-10-18 07:14:25', NULL, NULL, '1', 1),
(45, 'youeesef', 's@stu.com', NULL, '$2y$12$K8vZ.rpQ.WdJ3NDf3OIUzuMEVOLPDtLjm3JKsbLYEAsEmRfk4VcOS', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:20:17', '2024-10-18 07:20:17', NULL, NULL, '1', 1),
(46, 'youeesef', 'rrs@stu.com', '2024-10-18 07:24:08', '$2y$12$WGAzTnsUn9AQZPXbUPBqpeHnZ4BXZXOplScGZ/vlUyVfn9uJcHFOO', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:21:51', '2024-10-18 07:24:09', NULL, NULL, '1', 1),
(47, 'youeesef', 'rr7s@stu.com', NULL, '$2y$12$lM6jRk3RLp7MdVeso3zvl.k4GFNukQwvSPwiMbyuAXQrKPfyhKQ9W', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:25:23', '2024-10-18 07:25:23', NULL, NULL, '1', 1),
(48, 'youeesef', 'rrd7s@stu.com', NULL, '$2y$12$bdOD0QVN/UiZ3aC.yaX3wu8iNuqSiZPMe0vSimJAt/cPIrqUXb3tu', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:29:30', '2024-10-18 07:29:30', NULL, NULL, '1', 1),
(49, 'youeesef', 'rrtd7s@stu.com', '2024-10-18 07:30:30', '$2y$12$UkIQxTPEoChvMYBCH1WKGuaiLVH9Lh5fy6Vfx6KZbzHfhPO1yHXGi', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:30:24', '2024-10-18 07:30:30', NULL, NULL, '1', 1),
(50, 'youeesef', 'rrtfd7s@stu.com', NULL, '$2y$12$8LMY0dqRa8GGmzjZkeddxuwElhwnGXJJ3pDf8oXT6OTCA2U6t0sGW', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:35:15', '2024-10-18 07:35:15', NULL, NULL, '1', 1),
(51, 'youeesef', 'rrtffd7s@stu.com', NULL, '$2y$12$cSutnNnhV9uav6phRQa.Q.HQl9NVQf45lfKRysrTvWtOrAm4w0pGu', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:39:57', '2024-10-18 07:39:57', NULL, NULL, '1', 1),
(52, 'youeesef', 'rrtffrd7s@stu.com', NULL, '$2y$12$odxzEg46d9K2XCDJNPGf/OUuKrEL3cl92cJxvaDaYwd4PFz7JgLUq', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:40:29', '2024-10-18 07:40:29', NULL, NULL, '1', 1),
(53, 'youeesef', 'rrtfrd7s@stu.com', NULL, '$2y$12$4UR9nnMw0JewAqyj8Zbhhu5DPwQLOsr9/fg757SCqLOBSZBG8N3oW', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:41:04', '2024-10-18 07:41:04', NULL, NULL, '1', 1),
(54, 'youeesef', 'tfrd7s@stu.com', NULL, '$2y$12$5u2Fid2yoRq2ZySDZObMyOscxyLHHP8dxkWCH8opohkfvpmVD5BPm', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:41:25', '2024-10-18 07:41:25', NULL, NULL, '1', 1),
(55, 'youeesef', 'tfrfddfd7s@stu.com', '2024-10-18 07:44:09', '$2y$12$79DHLBc36dFMP5L1lT4jkeaFjQkPVeOC9zIC7gpUQx2eoHQRTCqiK', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:42:33', '2024-10-18 07:44:09', NULL, NULL, '1', 1),
(56, 'youeesef', 'trfddfd7s@stu.com', '2024-10-18 07:45:53', '$2y$12$e1CSxl8cagnNlZFmJH7lTeP.SU74v9fhiSIOsHncyqQFBXTk.4FOi', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:45:28', '2024-10-18 07:45:53', NULL, NULL, '1', 1),
(57, 'youeesef', 'trfderrdfd7s@stu.com', '2024-10-18 07:52:33', '$2y$12$.KXdGQiSqSW254ACEPOwHuE4rHGCHpPGWktjCTb1ceeQI9JxZDA6a', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:52:11', '2024-10-18 07:52:33', NULL, NULL, '1', 1),
(58, 'youeesef', 'tderrdfd7s@stu.com', NULL, '$2y$12$7o2p4vT0NVtBHjrLyC7e1uY3Yzb1kG9Q5Rm4kksl.1eGB3n/pnzom', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 07:55:11', '2024-10-18 07:55:11', NULL, NULL, '1', 1),
(59, 'youeesef', 'rerreer@stu.com', NULL, '$2y$12$z7O/eLOn6fG9jBcqZxPQIulBWMQtxvEdwLuagxWV2PwCkfO1S3z7.', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 08:01:32', '2024-10-18 08:01:32', NULL, NULL, '1', 1),
(60, 'youeesef', 'rerreeryy@stu.com', NULL, '$2y$12$3Tn956LVrX0D/xJUMt0dBujkxaHirFp3yPDRX03dEdt7brQNGzcMK', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 08:01:51', '2024-10-18 08:01:51', NULL, NULL, '1', 1),
(61, 'youeesef', 'rerrrrreeryy@stu.com', NULL, '$2y$12$7ZisraLQ7uR4jXTd0.AnY.c8FyOKjjQKoTdtychof1O4BomzjLVuO', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 08:02:44', '2024-10-18 08:02:44', NULL, NULL, '1', 1),
(62, 'youeesef', 'rerrrrrrreeryy@stu.com', '2024-10-18 08:04:28', '$2y$12$vU9wzseD40d.l0BTzmeFC.5O1gPzG82tiuhE9VYDIuMJqk11gNbDe', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 08:04:18', '2024-10-18 08:04:28', NULL, NULL, '1', 1),
(63, 'youeesef', 'rerrrryuyurrreeryy@stu.com', '2024-10-18 08:05:26', '$2y$12$aofwCSkuOsv7RFqCkLeKNeAK.SI4NF.BXYzWTR0NhmT/xykiCiZYq', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 08:05:20', '2024-10-18 08:05:26', NULL, NULL, '1', 1),
(64, 'youeesef', 'rerrrryuyurrryy@stu.com', '2024-10-18 08:47:11', '$2y$12$.TcFwMSqGgswa.8SzfoBueweITagAtyzRXEaMAoT.V4o5X3.tOLDm', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 08:46:43', '2024-10-18 08:47:11', NULL, NULL, '1', 1),
(65, 'youeesef', 'rerrrryuyudddrrryy@stu.com', NULL, '$2y$12$lmQ2TTAl4fGRFMV2N3dVTu.7FHXZHrra1G6pJ.pTgds31JZWKVSfC', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 08:47:33', '2024-10-18 08:47:33', NULL, NULL, '1', 1),
(66, 'youeesef', 'rerrrryhhhuyudddrrryy@stu.com', '2024-10-18 08:49:14', '$2y$12$MJEsVNliwkcalIVcn.NB6OyqzUOeblC0IHCcU7yW25yje9Hj1D8uO', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 08:49:04', '2024-10-18 08:49:14', NULL, NULL, '1', 1),
(67, 'youeesef', 'rerrrryhhyudddrrryy@stu.com', NULL, '$2y$12$/Ny6cm7hL0pjk9jSPybzkuf06Uh/R.OOwcESkYeOzET0sbXi6MJQy', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-18 08:50:28', '2024-10-18 08:50:28', NULL, NULL, '1', 1),
(68, 'youeesef', 'rerrrryudddrrryy@stu.com', NULL, '$2y$12$uQvFY4tUYhqoc7uyGdjlkO0xgDIJvXtJijCxhtLLczAzaajZ6JtxG', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-20 05:17:16', '2024-10-20 05:17:16', NULL, NULL, '1', 1),
(69, 'youeesef', 'sss@stu.com', NULL, '$2y$12$K4F8THQobzyFVlkmCOi2YuDGND3Lv.wZ8mgbw8/vfW6radIoRnzVq', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-21 10:02:29', '2024-10-21 10:02:29', NULL, NULL, '1', 1),
(70, 'youeesef', 'sss2@stu.com', NULL, '$2y$12$jc1F4OCRhZu1GNEgE6rgJerMPc.EgYOGdLhWlhU2aAIW2blBnPQh2', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-10-21 10:05:23', '2024-10-21 10:05:23', NULL, NULL, '1', 1),
(71, 'youeesef', 'empty@empty.com', NULL, '$2y$12$Pd0M94C9ZzTPNFlyymMQ4.7YFbLgf.8sgPWXKHf4SSisCHqAZE2/m', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-11-03 05:14:24', '2024-11-03 05:14:24', NULL, NULL, '1', 1),
(72, 'youeesef', 'empty2@empty.com', NULL, '$2y$12$dCUTHh7PsNd4d5V7qD.E7.CTNMzpvRDj5Y.jM6QlUVK7k5pmJAdCq', NULL, NULL, NULL, 0, 0, 0, NULL, '2024-11-03 09:49:26', '2024-11-03 09:49:26', NULL, NULL, '1', 1);

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
  ADD KEY `quizzes_admin_id_foreign` (`admin_id`),
  ADD KEY `quizzes_lesson_id_foreign` (`lesson_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

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
  ADD CONSTRAINT `quizzes_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quizzes_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
