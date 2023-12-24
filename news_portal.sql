-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2023 at 07:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_portal`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_customer` (IN `customerNumber` INT(11), IN `customerName` VARCHAR(50), IN `contactLastName` VARCHAR(50), IN `contactFirstName` VARCHAR(50), IN `phone` VARCHAR(50), IN `addressLine1` VARCHAR(50), IN `addressLine2` VARCHAR(50), IN `city` VARCHAR(50), IN `state` VARCHAR(50), IN `postalCode` VARCHAR(15), IN `country` VARCHAR(50), IN `salesRepEmployeeNumber` INT, IN `creditLimit` DECIMAL(10,2))   BEGIN
    INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
    VALUES (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_payment` (IN `customerNumber` INT, IN `checkNumber` VARCHAR(50), IN `paymentDate` DATE, IN `amount` DECIMAL(10,2))   BEGIN
    INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
    VALUES (customerNumber, checkNumber, paymentDate, amount);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_stock` (IN `productCode_` VARCHAR(15), IN `quantity` INT)   BEGIN
    UPDATE products p
    SET quantityInStock = quantityInStock + quantity
    WHERE p.productCode = productCode_;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `image`, `name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'uploads/YnAr8hqXU600tzU35tc7ckIl0CG5Yk.jpg', 'Super Admin', 'admin@gmail.com', NULL, '$2y$10$RxoK28Fal.WuEJRPI4SnUOnE7g897GONA6SYnQg6WNQuukBsBSlfe', 1, 'ssPinQT8orhXXeuC5f9Cq2lxfCxbHB1s9mktZBiK5E7IJw659ZaTGwmfNt2u', '2023-05-21 06:37:47', '2023-06-19 22:32:16'),
(4, '', 'Lead Writer', 'writer@gmail.com', NULL, '$2y$10$ERKjlgmxyGFrYhC38nIbGO.B8GUoebDHc7lG5QCLwXX7N.LUv9eTS', 1, 'cdVTyKJXPXvhNWqcmJG7nxG8ccKvig6JBQtkuqwh39AXsGzmKxjUWrMFNbhM', '2023-06-12 23:55:45', '2023-06-13 02:20:09'),
(5, '', 'Jennifer', 'jennifer@gmail.com', NULL, '$2y$10$ERKjlgmxyGFrYhC38nIbGO.B8GUoebDHc7lG5QCLwXX7N.LUv9eTS', 1, 'G8z2Xhy04yNtsXTZAZh6e8DVJ22kQ1LE5wUz0kgt1609f2pCnUc5Q96bcfh1', '2023-06-12 23:55:45', '2023-06-13 02:20:09'),
(6, '', 'Mahdyan', 'mahdyan@gmail.com', NULL, '$2y$10$ERKjlgmxyGFrYhC38nIbGO.B8GUoebDHc7lG5QCLwXX7N.LUv9eTS', 1, 'G8z2Xhy04yNtsXTZAZh6e8DVJ22kQ1LE5wUz0kgt1609f2pCnUc5Q96bcfh1', '2023-06-12 23:55:45', '2023-06-13 02:20:09'),
(7, '', 'Azhar', 'azhar@gmail.com', NULL, '$2y$10$ERKjlgmxyGFrYhC38nIbGO.B8GUoebDHc7lG5QCLwXX7N.LUv9eTS', 1, 'G8z2Xhy04yNtsXTZAZh6e8DVJ22kQ1LE5wUz0kgt1609f2pCnUc5Q96bcfh1', '2023-06-12 23:55:45', '2023-06-13 02:20:09'),
(10, '', 'Editor', 'editor@gmail.com', NULL, '$2y$10$Oz70D7bE0ntq5xfevfV6tOlIocbvZrWdJjPo6rWj4oinIqLwdXB.q', 1, 'GEDaVk9SjeYEDHC7zjBoB20OVZnzurkEvRqTFhvbkgZMKpmjkCqbB6ZJfUFg', '2023-10-25 23:26:48', '2023-10-25 23:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `show_at_nav` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_category_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `language`, `name`, `slug`, `show_at_nav`, `status`, `created_at`, `updated_at`, `parent_category_id`) VALUES
(1, 'en', 'Bisnis', 'bisnis', 1, 1, '2023-06-21 14:40:05', '2023-06-21 14:40:05', NULL),
(2, 'en', 'Keuangan', 'keuangan', 1, 1, '2023-06-21 14:40:06', '2023-06-21 14:40:06', '1'),
(3, 'en', 'Pemasaran', 'pemasaran', 1, 1, '2023-06-21 14:40:07', '2023-06-21 14:40:07', '1'),
(4, 'en', 'Kewirausahaan', 'kewirausahaan', 1, 1, '2023-06-21 14:40:08', '2023-06-21 14:40:08', '1'),
(5, 'en', 'Perdagangan', 'perdagangan', 1, 1, '2023-06-21 14:40:09', '2023-06-21 14:40:09', '1'),
(6, 'en', 'Inovasi Bisnis', 'inovasi-bisnis', 1, 1, '2023-06-21 14:40:10', '2023-06-21 14:40:10', '1'),
(7, 'en', 'Event', 'event', 1, 1, '2023-06-21 14:40:15', '2023-06-21 14:40:15', NULL),
(8, 'en', 'Acara Korporat', 'acara-korporat', 1, 1, '2023-06-21 14:40:16', '2023-06-21 14:40:16', '7'),
(9, 'en', 'Pertemuan Komunitas', 'pertemuan-komunitas', 1, 1, '2023-06-21 14:40:17', '2023-06-21 14:40:17', '7'),
(10, 'en', 'Pameran', 'pameran', 1, 1, '2023-06-21 14:40:18', '2023-06-21 14:40:18', '7'),
(11, 'en', 'Hiburan', 'hiburan', 1, 1, '2023-06-21 14:40:19', '2023-06-21 14:40:19', '7'),
(12, 'en', 'Olahraga', 'olahraga', 1, 1, '2023-06-21 14:40:20', '2023-06-21 14:40:20', '7'),
(13, 'en', 'Lifestyle', 'lifestyle', 1, 1, '2023-06-21 14:40:24', '2023-06-21 14:40:24', NULL),
(14, 'en', 'Kesehatan dan Kecantikan', 'kesehatan-dan-kecantikan', 1, 1, '2023-06-21 14:40:25', '2023-06-21 14:40:25', '13'),
(15, 'en', 'Gaya Hidup Aktif', 'gaya-hidup-aktif', 1, 1, '2023-06-21 14:40:26', '2023-06-21 14:40:26', '13'),
(16, 'en', 'Seni dan Budaya', 'seni-dan-budaya', 1, 1, '2023-06-21 14:40:27', '2023-06-21 14:40:27', '13'),
(17, 'en', 'Hobi dan Rekreasi', 'hobi-dan-rekreasi', 1, 1, '2023-06-21 14:40:28', '2023-06-21 14:40:28', '13'),
(18, 'en', 'Petualangan dan Wisata', 'petualangan-dan-wisata', 1, 1, '2023-06-21 14:40:29', '2023-06-21 14:40:29', '13'),
(19, 'en', 'Bola', 'bola', 1, 1, '2023-06-21 14:40:44', '2023-06-21 14:40:44', NULL),
(20, 'en', 'Sepak Bola', 'sepak-bola', 1, 1, '2023-06-21 14:40:45', '2023-06-21 14:40:45', '19'),
(21, 'en', 'Basket', 'basket', 1, 1, '2023-06-21 14:40:46', '2023-06-21 14:40:46', '19'),
(22, 'en', 'Bulu Tangkis', 'bulu-tangkis', 1, 1, '2023-06-21 14:40:47', '2023-06-21 14:40:47', '19'),
(23, 'en', 'Olahraga Bola Lainnya', 'olahraga-bola-lainnya', 1, 1, '2023-06-21 14:40:48', '2023-06-21 14:40:48', '19'),
(24, 'en', 'Politik', 'politik', 1, 1, '2023-10-26 01:56:37', '2023-10-26 01:56:37', NULL),
(25, 'en', 'Berita Politik', 'berita-politik', 1, 1, '2023-10-26 01:56:38', '2023-10-26 01:56:38', '24'),
(26, 'en', 'Pemilu', 'pemilu', 1, 1, '2023-10-26 01:56:39', '2023-10-26 01:56:39', '24'),
(27, 'en', 'Kebijakan Publik', 'kebijakan-publik', 1, 1, '2023-10-26 01:56:40', '2023-10-26 01:56:40', '24'),
(28, 'en', 'Hubungan Internasional', 'hubungan-internasional', 1, 1, '2023-10-26 01:56:41', '2023-10-26 01:56:41', '24'),
(29, 'en', 'Teknologi', 'teknologi', 1, 1, '2023-06-21 14:40:56', '2023-06-21 14:40:56', NULL),
(30, 'en', 'Hardware', 'hardware', 1, 1, '2023-06-21 14:40:57', '2023-06-21 14:40:57', '29'),
(31, 'en', 'Perangkat Lunak', 'perangkat-lunak', 1, 1, '2023-06-21 14:40:58', '2023-06-21 14:40:58', '29'),
(32, 'en', 'Inovasi Teknologi', 'inovasi-teknologi', 1, 1, '2023-06-21 14:40:59', '2023-06-21 14:40:59', '29'),
(33, 'en', 'Komunikasi', 'komunikasi', 1, 1, '2023-06-21 14:41:00', '2023-06-21 14:41:00', '29'),
(34, 'en', 'Keamanan Teknologi', 'keamanan-teknologi', 1, 1, '2023-06-21 14:41:01', '2023-06-20 17:00:00', '29');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `news_id`, `user_id`, `parent_id`, `comment`, `created_at`, `updated_at`) VALUES
(28, 73, 3, NULL, 'Berita menarik! Terima kasih sudah berbagi.', '2023-12-23 23:37:06', '2023-12-23 23:37:06'),
(29, 73, 3, 28, 'Tidak terlalu penting. Fokus pada berita yang lebih serius.', '2023-12-23 23:37:15', '2023-12-23 23:37:15'),
(30, 70, 3, NULL, 'Bukan berita terbaik. Harap ada konten yang lebih menarik.', '2023-12-23 23:37:35', '2023-12-23 23:37:35'),
(31, 70, 3, 30, 'Membuat saya bosan. Harap ada berita yang lebih menghibur', '2023-12-23 23:37:45', '2023-12-23 23:37:45'),
(32, 67, 3, NULL, 'Tidak begitu tertarik. Bagaimana dengan berita lingkungan?', '2023-12-23 23:38:17', '2023-12-23 23:38:17'),
(33, 67, 3, NULL, 'Tidak istimewa. Harap berikan konten yang lebih menarik.', '2023-12-23 23:38:24', '2023-12-23 23:38:24'),
(34, 49, 3, NULL, 'Kurang menggugah petualangan. Ada berita petualangan lain?', '2023-12-23 23:38:36', '2023-12-23 23:38:36'),
(35, 49, 3, NULL, 'Kurang teknologi. Harap lebih banyak berita teknologi.', '2023-12-23 23:38:44', '2023-12-23 23:38:44'),
(36, 52, 3, NULL, 'Tidak setuju. Sumber mungkin kurang dapat dipercaya.', '2023-12-23 23:38:55', '2023-12-23 23:38:55'),
(37, 37, 3, NULL, 'Tidak relevan dengan fashion. Harap sesuai dengan minat saya.', '2023-12-23 23:39:10', '2023-12-23 23:39:10');

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
-- Table structure for table `home_section_settings`
--

CREATE TABLE `home_section_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_section_one` varchar(255) NOT NULL,
  `category_section_two` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_section_settings`
--

INSERT INTO `home_section_settings` (`id`, `category_section_one`, `category_section_two`, `language`, `created_at`, `updated_at`) VALUES
(1, '15', '14', 'en', '2023-06-03 01:22:51', '2023-06-22 00:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `lang`, `slug`, `default`, `status`, `created_at`, `updated_at`) VALUES
(3, 'English', 'en', 'en', 1, 1, '2023-05-27 00:54:48', '2023-05-29 06:35:52');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_21_092521_create_admins_table', 2),
(7, '2023_05_25_093155_create_languages_table', 3),
(8, '2023_05_27_091159_create_categories_table', 4),
(9, '2023_05_28_040844_create_news_table', 5),
(10, '2023_05_28_093323_create_tags_table', 6),
(11, '2023_05_28_093523_create_news_tags_table', 6),
(12, '2023_05_31_091856_create_comments_table', 7),
(13, '2023_06_03_045954_create_home_section_settings_table', 8),
(15, '2023_06_04_032108_create_social_counts_table', 9),
(18, '2023_06_05_074833_create_ads_table', 10),
(19, '2023_06_06_061800_create_subscribers_table', 11),
(20, '2023_06_06_102406_create_social_links_table', 12),
(21, '2023_06_07_043229_create_footer_infos_table', 13),
(22, '2023_06_07_063900_create_footer_grid_ones_table', 14),
(23, '2023_06_07_092407_create_footer_grid_twos_table', 15),
(24, '2023_06_07_102857_create_footer_grid_threes_table', 16),
(25, '2023_06_08_035931_create_footer_titles_table', 17),
(27, '2023_06_08_053338_create_abouts_table', 18),
(28, '2023_06_08_070724_create_contacts_table', 19),
(30, '2023_06_08_112641_create_recived_mails_table', 20),
(31, '2023_06_10_105757_create_settings_table', 21),
(32, '2023_06_11_110729_create_permission_tables', 22);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 7),
(3, 'App\\Models\\Admin', 1),
(6, 'App\\Models\\Admin', 4);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `auther_id` bigint(20) UNSIGNED NOT NULL,
  `image` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` text NOT NULL,
  `content` text NOT NULL,
  `show_at_popular` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) DEFAULT 0,
  `views` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `likes` int(11) DEFAULT 0,
  `share` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `language`, `category_id`, `auther_id`, `image`, `title`, `slug`, `content`, `show_at_popular`, `status`, `is_approved`, `views`, `created_at`, `updated_at`, `likes`, `share`) VALUES
(20, 'en', 13, 5, 'uploads/OH9GtR9XgO2FEMG9tcasuvEMqVY05s.jpg', 'Membuka Kesuksesan Wirausaha: Strategi Membangun Bisnis yang Berkembang', 'membuka-kesuksesan-wirausaha-strategi-membangun-bisnis-yang-berkembang', '<p>Pendahuluan: \r\nBisnis adalah tulang punggung ekonomi global, memacu inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah berkembang pesat karena teknologi, globalisasi, dan pergeseran permintaan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman tentang prinsip-prinsip, tantangan, dan strategi utama. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.</p> \r\n<p>Dasar Bisnis: \r\nPada intinya, bisnis melibatkan penciptaan, pengiriman, dan penangkapan nilai. Para wirausahawan memainkan peran penting dalam mendirikan bisnis, mengidentifikasi kesenjangan pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan sumber daya, dan ketahanan. Startup dan bisnis kecil menghadapi tantangan unik tetapi juga mendapatkan keuntungan dari kegesitan dan fleksibilitas dalam memenuhi kebutuhan pasar.</p> \r\n<p>Seni Manajemen: \r\nManajemen yang efektif sangat penting bagi bisnis dalam semua skala. Ini mencakup perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasi. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasi, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah menjadi kritis untuk keberhasilan.</p> \r\n<p>Menguasai Pemasaran:\r\nPemasaran melibatkan pemahaman akan kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.</p> \r\n<p>Perspektif Keuangan: \r\nKeuangan sangat penting untuk keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penyusunan anggaran, analisis keuangan, manajemen risiko, dan mengoptimalkan struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.</p> \r\n<p>Mengadopsi Tanggung Jawab Sosial Perusahaan: \r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar secara sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik etis dan berkelanjutan. Inisiatif dapat meliputi pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya yang beretika. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.</p> \r\n<p>Kesimpulan: \r\nDunia bisnis adalah lanskap yang kompleks dan terus berkembang. Tetap memperhatikan dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengadopsi tanggung jawab sosial memposisikan bisnis untuk sukses. Perjalanan kewirausahaan dan manajemen bisnis menantang namun membawa peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis memainkan peran penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.</p> <p></p>', 1, 0, 1, 1240, '2023-06-21 15:13:13', '2023-12-22 14:51:34', 214, 56),
(23, 'en', 13, 7, 'uploads/I4L2c4J0gV4CUXvhzqTGdynzjZFv5J.jpeg', 'Menavigasi Lanskap Kompetitif: Wawasan untuk Pertumbuhan Usaha Kecil', 'menavigasi-lanskap-Kompetitif-wawasan-untuk-pertumbuhan-usaha-kecil', '<p>Pendahuluan: \r\nBisnis adalah tulang punggung ekonomi global, memacu inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah berkembang pesat karena teknologi, globalisasi, dan pergeseran permintaan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman tentang prinsip-prinsip, tantangan, dan strategi utama. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.</p> <p>Dasar Bisnis: \r\nPada intinya, bisnis melibatkan penciptaan, pengiriman, dan penangkapan nilai. Para wirausahawan memainkan peran penting dalam mendirikan bisnis, mengidentifikasi kesenjangan pasar, dan menghidupkan ide-ide inovatif. Keberhasilan kewirausahaan membutuhkan kreativitas, kecukupan sumber daya, dan ketahanan. Startup dan bisnis kecil menghadapi tantangan unik tetapi juga mendapatkan manfaat dari kegesitan dan fleksibilitas dalam memenuhi kebutuhan pasar.</p> \r\n<p>Seni Manajemen: \r\nManajemen yang efektif sangat penting bagi bisnis dalam semua skala. Ini mencakup perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasi. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasi, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah menjadi kritis untuk keberhasilan.</p> <p>Menguasai Pemasaran: \r\nPemasaran melibatkan pemahaman akan kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, menyediakan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.</p> \r\n<p>Perspektif Keuangan: \r\nKeuangan sangat penting untuk kelangsungan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penyusunan anggaran, analisis keuangan, manajemen risiko, dan mengoptimalkan struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.</p> \r\n<p>Mengadopsi Tanggung Jawab Sosial Perusahaan: \r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar secara sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik etis dan berkelanjutan. Inisiatif dapat meliputi pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya yang beretika. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.</p> <p>Kesimpulan: \r\nDunia bisnis adalah lanskap yang kompleks dan terus berkembang. Tetap memperhatikan dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengadopsi tanggung jawab sosial adalah langkah-langkah yang memposisikan bisnis untuk sukses. Perjalanan kewirausahaan dan manajemen bisnis menantang namun memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis memainkan peran penting dalam membentuk ekonomi,mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.</p> <p></p>', 1, 1, 1, 1003, '2023-06-21 15:18:43', '2023-12-22 14:48:05', 312, 75),
(24, 'en', 13, 7, 'uploads/5LVocggwDRXqMySdDZg46I0ekZMFGd.jpeg', 'Dari Startup hingga Sukses: Pelajaran dari Usaha Bisnis Inovatif', 'dari-startup-hingga-sukses-pelajaran-dari-usaha-bisnis-inovatif', '<p>Pendahuluan: \r\nBisnis adalah tulang punggung ekonomi global, memacu inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah berkembang pesat karena teknologi, globalisasi, dan pergeseran permintaan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman tentang prinsip-prinsip, tantangan, dan strategi utama. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.</p> <p>Dasar Bisnis: \r\nPada intinya, bisnis melibatkan penciptaan, pengiriman, dan penangkapan nilai. Para wirausahawan memainkan peran penting dalam mendirikan bisnis, mengidentifikasi kesenjangan pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan sumber daya, dan ketahanan. Startup dan bisnis kecil menghadapi tantangan unik tetapi juga mendapatkan keuntungan dari kegesitan dan fleksibilitas dalam memenuhi kebutuhan pasar.</p> \r\n<p>Seni Manajemen: \r\nManajemen yang efektif sangat penting bagi bisnis dalam semua skala. Ini mencakup perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasi. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasi, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah menjadi kritis untuk keberhasilan.</p> <p>Menguasai Pemasaran:\r\nPemasaran melibatkan pemahaman akan kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.</p> \r\n<p>Perspektif Keuangan: \r\nKeuangan sangat penting untuk keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penyusunan anggaran, analisis keuangan, manajemen risiko, dan mengoptimalkan struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.</p> \r\n<p>Mengadopsi Tanggung Jawab Sosial Perusahaan: \r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar secara sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik etis dan berkelanjutan. Inisiatif dapat meliputi pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya yang beretika. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.</p> <p>Kesimpulan: \r\nDunia bisnis adalah lanskap yang kompleks dan terus berkembang. Tetap memperhatikan dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengadopsi tanggung jawab sosial memposisikan bisnis untuk sukses. Perjalanan kewirausahaan dan manajemen bisnis menantang namun membawa peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis memainkan peran penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.</p> <p></p>', 1, 1, 1, 1403, '2023-06-21 15:19:43', '2023-12-22 15:18:45', 100, 3),
(25, 'en', 13, 7, 'uploads/gFgEHeZHf5Euz7jCtVrA7Vd6B47YPS.jpeg', 'Mendorong Profitabilitas: Manajemen Keuangan yang Efektif untuk Bisnis', 'mendorong-profitabilitas-manajemen-keuangan-yang-efektif-untuk-bisnis', '<p>Pendahuluan: \r\nBisnis adalah tulang punggung ekonomi global, memacu inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah berkembang pesat karena teknologi, globalisasi, dan pergeseran permintaan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman tentang prinsip-prinsip, tantangan, dan strategi utama. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.</p> \r\n<p>Dasar Bisnis: \r\nPada intinya, bisnis melibatkan penciptaan, pengiriman, dan penangkapan nilai. Para wirausahawan memainkan peran penting dalam mendirikan bisnis, mengidentifikasi kesenjangan pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan sumber daya, dan ketahanan. Startup dan bisnis kecil menghadapi tantangan unik tetapi juga mendapatkan keuntungan dari kegesitan dan fleksibilitas dalam memenuhi kebutuhan pasar.</p> \r\n<p>Seni Manajemen: \r\nManajemen yang efektif sangat penting bagi bisnis dalam semua skala. Ini mencakup perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasi. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasi, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah menjadi kritis untuk keberhasilan.</p> \r\n<p>Menguasai Pemasaran:\r\nPemasaran melibatkan pemahaman akan kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.</p> \r\n<p>Perspektif Keuangan: \r\nKeuangan sangat penting untuk keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penyusunan anggaran, analisis keuangan, manajemen risiko, dan mengoptimalkan struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.</p> \r\n<p>Mengadopsi Tanggung Jawab Sosial Perusahaan: \r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar secara sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik etis dan berkelanjutan. Inisiatif dapat meliputi pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya yang beretika. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.</p> \r\n<p>Kesimpulan: \r\nDunia bisnis adalah lanskap yang kompleks dan terus berkembang. Tetap memperhatikan dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengadopsi tanggung jawab sosial memposisikan bisnis untuk sukses. Perjalanan kewirausahaan dan manajemen bisnis menantang namun membawa peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis memainkan peran penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.</p> <p></p>', 1, 1, 1, 983, '2023-06-21 15:20:34', '2023-12-22 14:51:30', 214, 95),
(34, 'en', 14, 7, 'uploads/1W5bMGNWVTHODgwSnxI1QOuVFMLM83.jpg', 'Menciptakan Pengalaman yang Berkesan: Melepaskan Keajaiban Perencanaan Acara', 'menciptakan-pengalaman-yang-berkesan-melepaskan-keajaiban-perencanaan-acara', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 1, 1, 1, 750, '2023-06-21 15:51:11', '2023-12-22 14:51:28', 421, 64),
(37, 'en', 14, 6, 'uploads/K9h4VVS8JCpxqwOMGHTUVHuDVnokff.jpg', 'Menguasai Pemasaran Acara: Strategi untuk Meningkatkan Kehadiran dan Keterlibatan', 'menguasai-pemasaran-acara-strategi-untuk--meningkatkan-kehadiran-dan-keterlibatan', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 1, 1, 1, 902, '2023-06-21 15:53:22', '2023-12-23 23:39:10', 412, 32),
(40, 'en', 14, 6, 'uploads/XtLfEDo2k3e4qKMTzrdk8rnmspjsVf.jpg', 'Di Balik Layar: Seni Eksekusi Acara yang Mulus', 'di-balik-layar-seni-eksekusi-acara-yang-mulus', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 1, 1, 1, 999, '2023-06-21 15:55:35', '2023-12-22 14:51:24', 244, 72),
(43, 'en', 15, 6, 'uploads/1Lw6dCj40WrzmxowFxJfWufMRateSJ.jpg', 'Mendobrak Hambatan: Inovasi dalam Pengalaman Acara Virtual dan Hibrid', 'mendobrak-hambatan-inovasi-dalam-pengalaman-acara-virtual-dan-hibrid', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 1, 1, 1, 1073, '2023-06-21 15:59:33', '2023-06-21 17:44:56', 124, 63),
(46, 'en', 15, 5, 'uploads/GEPaNuO7AksjQom7EEPzJWjLYMtN8l.jpg', 'Seni Keseimbangan Kehidupan-Kerja: Memelihara Harmoni di Dunia yang Bergerak Cepat', 'seni-keseimbangan-Kehidupan-kerja-memelihara-harmoni-di-dunia-yang-bergerak-cepat', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 1, 1, 1, 905, '2023-06-21 16:05:42', '2023-12-22 17:36:16', 222, 99),
(49, 'en', 15, 5, 'uploads/2JSPqkxcMrcGHYHWCH68TxVfvUj4Uf.jpg', 'Perhatian dalam Kehidupan Sehari-hari: Menumbuhkan Kedamaian dan Kebahagiaan Batin', 'perhatian-dalam-kehidupan-sehari-hari-menumbuhkan-kedamaian-dan-kebahagiaan-batin', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 1, 1, 1, 567, '2023-06-21 16:16:18', '2023-12-23 23:38:44', 211, 2),
(52, 'en', 15, 6, '', 'Merancang Gaya Hidup Impian Anda: Menciptakan Jalan Pribadi Menuju Kesuksesan', 'merancang-gaya-hidup-impian-anda-menciptakan-jalan-pribadi-menuju-kesuksesan', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 1, 1, 1, 504, '2023-06-21 16:20:16', '2023-12-23 23:38:56', 222, 16),
(67, 'en', 14, 7, 'uploads/ZOfmDXwmsX3ZJYYI8XIYq89kT36TPp.jpg', 'Mencapai Kehebatan Olahraga: Pelajaran dari Atlet Legendaris', 'mencapai-kehebatan-olahraga-pelajaran-dari-atlet-legendaris', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 0, 1, 1, 1009, '2023-06-21 16:50:32', '2023-12-23 23:39:01', 412, 76),
(70, 'en', 14, 4, 'uploads/9HH6pcbhOuoLdY7CLebgp8W05VCEWK.jpg', 'Kehebatan Olahraga: Pelajaran dari Atlet Legendaris', 'kehebatan-olahraga-pelajaran-dari-atlet-legendaris', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 0, 1, 1, 142, '2023-06-21 16:54:17', '2023-12-23 23:38:08', 334, 27);
INSERT INTO `news` (`id`, `language`, `category_id`, `auther_id`, `image`, `title`, `slug`, `content`, `show_at_popular`, `status`, `is_approved`, `views`, `created_at`, `updated_at`, `likes`, `share`) VALUES
(73, 'en', 14, 4, 'uploads/2uMMsxJ9TfsAkyhKaduNkZfSsULgbB.jpg', 'Gaya Hidup Impian: Menciptakan Jalan Pribadi Menuju Kesuksesan', 'gaya-hidup-impian-menciptakan-jalan-pribadi-menuju-kesuksesan', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', 1, 1, 1, 111, '2023-06-21 17:02:33', '2023-12-23 23:38:00', 113, 10);

-- --------------------------------------------------------

--
-- Table structure for table `news_tags`
--

CREATE TABLE `news_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$10$m5NW3rtlO/JqFGIDi6hhJeYWkNOtdJHzgIJcMmgmQdS4k/cJcnhVK', '2023-06-19 22:25:21'),
('maula@gmail.com', '$2y$10$G7T70o31SG1qedUhEvfX5.juLDRJQsvcbsROyMrP.uYhH8dnSRtse', '2023-10-26 08:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(2, 'category index', 'admin', 'Category Permissions', '2023-06-12 00:41:28', '2023-06-12 00:41:28'),
(3, 'category create', 'admin', 'Category Permissions', '2023-06-12 00:42:32', '2023-06-12 00:42:32'),
(4, 'category update', 'admin', 'Category Permissions', '2023-06-12 00:42:42', '2023-06-12 00:42:42'),
(5, 'category delete', 'admin', 'Category Permissions', '2023-06-12 00:42:49', '2023-06-12 00:42:49'),
(6, 'news index', 'admin', 'News Permissions', '2023-06-13 05:05:58', '2023-06-13 05:05:58'),
(7, 'news create', 'admin', 'News Permissions', '2023-06-13 05:06:12', '2023-06-13 05:06:12'),
(8, 'news update', 'admin', 'News Permissions', '2023-06-13 05:06:20', '2023-06-13 05:06:20'),
(9, 'news delete', 'admin', 'News Permissions', '2023-06-13 05:06:28', '2023-06-13 05:06:28'),
(10, 'news approval', 'admin', 'News Permissions', '2023-10-26 12:41:45', '2023-10-26 12:41:45'),
(40, 'news status', 'admin', 'News Permissions', '2023-10-26 12:21:03', '2023-10-26 12:21:03'),
(41, 'news all-access', 'admin', 'News Permissions', '2023-10-26 12:21:03', '2023-10-26 12:21:03');

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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Editor', 'admin', '2023-10-25 19:15:20', '2023-10-25 19:15:20'),
(3, 'Super Admin', 'admin', '2023-06-12 03:28:34', '2023-06-12 03:28:34'),
(4, 'Writer 1', 'admin', '2023-06-12 23:52:28', '2023-06-12 23:52:28'),
(5, 'Writer 2', 'admin', '2023-06-12 23:52:28', '2023-06-12 23:52:28'),
(6, 'Writer 3', 'admin', '2023-06-12 23:52:28', '2023-06-12 23:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(6, 1),
(6, 6),
(7, 6),
(8, 1),
(8, 6),
(9, 6),
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Top News', '2023-06-10 22:51:50', '2023-06-10 22:51:50'),
(2, 'site_logo', 'uploads/PLptCMbjJY3ysW2L26gqE5Kx2X5nsO.png', '2023-06-10 22:51:50', '2023-06-10 22:51:50'),
(3, 'site_favicon', 'uploads/TDEfYu0SAHEAbaDvb6jMQ6vGyxl53a.png', '2023-06-10 22:51:50', '2023-06-10 22:51:50'),
(4, 'site_seo_title', 'Carson Moran', '2023-06-11 01:05:31', '2023-06-11 01:05:31'),
(5, 'site_seo_description', 'Quaerat vitae nostru', '2023-06-11 01:05:31', '2023-06-11 01:05:31'),
(6, 'site_seo_keywords', 'Chantale Dickson,test', '2023-06-11 01:05:31', '2023-06-11 01:10:07'),
(7, 'site_color', '#0073ff', '2023-06-11 03:45:30', '2023-06-24 03:25:35'),
(8, 'site_microsoft_api_host', 'microsoft-translator-text.p.rapidapi.com', '2023-06-21 03:44:20', '2023-06-21 03:49:24'),
(9, 'site_microsoft_api_key', '9644c1868amsh7d7ad4b2feb85afp1973f8jsneb5a65f1a736', '2023-06-21 03:44:20', '2023-06-21 03:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`, `language`) VALUES
(454, 'Bisnis', '2023-12-22 21:47:29', '2023-12-22 21:47:29', NULL),
(457, 'Sehat', '2023-12-22 21:48:31', '2023-12-22 21:48:31', NULL),
(458, 'Sehat', '2023-12-22 21:48:44', '2023-12-22 21:48:44', NULL),
(459, 'Sehat', '2023-12-22 21:49:01', '2023-12-22 21:49:01', NULL),
(460, 'Sukses', '2023-12-22 21:49:18', '2023-12-22 21:49:18', NULL),
(461, 'Sukses', '2023-12-22 21:49:27', '2023-12-22 21:49:27', NULL),
(462, 'Sukses', '2023-12-22 21:49:35', '2023-12-22 21:49:35', NULL),
(463, 'Motivasi', '2023-12-22 21:50:03', '2023-12-22 21:50:03', NULL),
(464, 'Marketing', '2023-12-22 21:50:27', '2023-12-22 21:50:27', NULL),
(465, 'Bisnis', '2023-12-22 21:50:27', '2023-12-22 21:50:27', NULL),
(466, 'Motivasi', '2023-12-22 21:50:44', '2023-12-22 21:50:44', NULL),
(467, 'Sehat', '2023-12-22 21:50:53', '2023-12-22 21:50:53', NULL),
(468, 'Sehat', '2023-12-22 21:51:03', '2023-12-22 21:51:03', NULL),
(469, 'Sukses', '2023-12-22 21:51:03', '2023-12-22 21:51:03', NULL),
(470, 'Kesuksesan', '2023-12-22 21:51:10', '2023-12-22 21:51:10', NULL);

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Maula Irfani', 'maula@gmail.com', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2023-10-26 08:51:00', '2023-10-26 08:51:00'),
(4, 'Roy Kihn', 'lucienne05@example.net', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jAa6ibLT4W', '2023-12-22 22:03:02', '2023-12-22 22:03:02'),
(5, 'Alexandre Marvin Jr.', 'jeramie83@example.org', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'c0RDaSRIE2', '2023-12-22 22:03:02', '2023-12-22 22:03:02'),
(6, 'Zachery Jaskolski MD', 'kerluke.leopoldo@example.org', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hXLR64nlJU', '2023-12-22 22:03:02', '2023-12-22 22:03:02'),
(7, 'Rafael Tillman', 'acremin@example.net', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bJsDa2Q2Sa', '2023-12-22 22:03:02', '2023-12-22 22:03:02'),
(8, 'Isaias Langworth DVM', 'tomas89@example.org', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0TvVduhVQY', '2023-12-22 22:03:02', '2023-12-22 22:03:02'),
(9, 'Otilia Durgan', 'trantow.alisha@example.com', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yTtrxOMFvq', '2023-12-22 22:03:02', '2023-12-22 22:03:02'),
(10, 'Francisca Zulauf', 'raymundo.mcglynn@example.com', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hMU88cP3cg', '2023-12-22 22:03:02', '2023-12-22 22:03:02'),
(11, 'Willow Mayert', 'buford73@example.com', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'twUkhSZVe9', '2023-12-22 22:03:02', '2023-12-22 22:03:02'),
(12, 'Dr. Moshe Becker', 'lebsack.lela@example.com', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gGRcETMOuz', '2023-12-22 22:03:02', '2023-12-22 22:03:02'),
(13, 'Madie Boehm', 'reymundo52@example.org', '2023-12-22 22:03:02', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UkuZ65pQqW', '2023-12-22 22:03:02', '2023-12-22 22:03:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_news_id_foreign` (`news_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_section_settings`
--
ALTER TABLE `home_section_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_category_id_foreign` (`category_id`),
  ADD KEY `news_auther_id_foreign` (`auther_id`);

--
-- Indexes for table `news_tags`
--
ALTER TABLE `news_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_tags_news_id_foreign` (`news_id`),
  ADD KEY `news_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_section_settings`
--
ALTER TABLE `home_section_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `news_tags`
--
ALTER TABLE `news_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=474;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=474;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_auther_id_foreign` FOREIGN KEY (`auther_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `news_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_tags`
--
ALTER TABLE `news_tags`
  ADD CONSTRAINT `news_tags_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
