-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2023 at 01:16 PM
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
(1, 'uploads/YnAr8hqXU600tzU35tc7ckIl0CG5Yk.jpg', 'Super Admin', 'admin@gmail.com', NULL, '$2y$10$RxoK28Fal.WuEJRPI4SnUOnE7g897GONA6SYnQg6WNQuukBsBSlfe', 1, 'mntYsz5yiaIbVICYiXyVMxYQfoJIsj2By3ST3NUKE5oqVNYbLA61lQdDZjg3', '2023-05-21 06:37:47', '2023-06-19 22:32:16'),
(4, '', 'Lead Writer', 'writer@gmail.com', NULL, '$2y$10$ERKjlgmxyGFrYhC38nIbGO.B8GUoebDHc7lG5QCLwXX7N.LUv9eTS', 1, NULL, '2023-06-12 23:55:45', '2023-06-13 02:20:09'),
(7, '', 'editor', 'editor@gmail.com', NULL, '$2y$10$Oz70D7bE0ntq5xfevfV6tOlIocbvZrWdJjPo6rWj4oinIqLwdXB.q', 1, NULL, '2023-10-25 23:26:48', '2023-10-25 23:26:48');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `language`, `name`, `slug`, `show_at_nav`, `status`, `created_at`, `updated_at`) VALUES
(13, 'en', 'Business', 'business', 1, 1, '2023-06-21 21:40:05', '2023-06-21 21:40:05'),
(14, 'en', 'Event', 'event', 1, 1, '2023-06-21 21:40:15', '2023-06-21 21:40:15'),
(15, 'en', 'Lifestyle', 'lifestyle', 1, 1, '2023-06-21 21:40:24', '2023-06-21 21:40:24'),
(17, 'en', 'Sports', 'sports', 1, 1, '2023-06-21 21:40:44', '2023-06-21 21:40:44'),
(18, 'en', 'Tech', 'tech', 0, 1, '2023-06-21 21:40:56', '2023-06-21 21:40:56'),
(19, 'en', 'Travel', 'travel', 0, 1, '2023-06-21 21:41:06', '2023-06-21 21:41:06'),
(34, 'en', 'Politics', 'politics', 0, 1, '2023-10-25 23:21:23', '2023-10-25 23:21:23');

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
(12, 49, 1, NULL, 'comment', '2023-10-25 11:01:31', '2023-10-25 11:01:31');

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
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `is_breaking_news` tinyint(1) NOT NULL DEFAULT 0,
  `show_at_slider` tinyint(1) NOT NULL DEFAULT 0,
  `show_at_popular` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) DEFAULT 0,
  `views` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `language`, `category_id`, `auther_id`, `image`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `is_breaking_news`, `show_at_slider`, `show_at_popular`, `status`, `is_approved`, `views`, `created_at`, `updated_at`) VALUES
(20, 'en', 13, 1, 'uploads/OH9GtR9XgO2FEMG9tcasuvEMqVY05s.jpg', 'Membuka Kesuksesan Wirausaha: Strategi Membangun Bisnis yang Berkembang', 'membuka-kesuksesan-wirausaha-strategi-membangun-bisnis-yang-berkembang', '<p>Pendahuluan: \r\nBisnis adalah tulang punggung ekonomi global, memacu inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah berkembang pesat karena teknologi, globalisasi, dan pergeseran permintaan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman tentang prinsip-prinsip, tantangan, dan strategi utama. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.</p> \r\n<p>Dasar Bisnis: \r\nPada intinya, bisnis melibatkan penciptaan, pengiriman, dan penangkapan nilai. Para wirausahawan memainkan peran penting dalam mendirikan bisnis, mengidentifikasi kesenjangan pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan sumber daya, dan ketahanan. Startup dan bisnis kecil menghadapi tantangan unik tetapi juga mendapatkan keuntungan dari kegesitan dan fleksibilitas dalam memenuhi kebutuhan pasar.</p> \r\n<p>Seni Manajemen: \r\nManajemen yang efektif sangat penting bagi bisnis dalam semua skala. Ini mencakup perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasi. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasi, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah menjadi kritis untuk keberhasilan.</p> \r\n<p>Menguasai Pemasaran:\r\nPemasaran melibatkan pemahaman akan kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.</p> \r\n<p>Perspektif Keuangan: \r\nKeuangan sangat penting untuk keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penyusunan anggaran, analisis keuangan, manajemen risiko, dan mengoptimalkan struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.</p> \r\n<p>Mengadopsi Tanggung Jawab Sosial Perusahaan: \r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar secara sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik etis dan berkelanjutan. Inisiatif dapat meliputi pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya yang beretika. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.</p> \r\n<p>Kesimpulan: \r\nDunia bisnis adalah lanskap yang kompleks dan terus berkembang. Tetap memperhatikan dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengadopsi tanggung jawab sosial memposisikan bisnis untuk sukses. Perjalanan kewirausahaan dan manajemen bisnis menantang namun membawa peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis memainkan peran penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.</p> <p></p>', NULL, NULL, 1, 1, 1, 0, 1, 0, '2023-06-21 22:13:13', '2023-06-21 22:23:50'),
(23, 'en', 13, 1, 'uploads/I4L2c4J0gV4CUXvhzqTGdynzjZFv5J.jpeg', 'Menavigasi Lanskap Kompetitif: Wawasan untuk Pertumbuhan Usaha Kecil', 'menavigasi-lanskap-Kompetitif-wawasan-untuk-pertumbuhan-usaha-kecil', '<p>Pendahuluan: \r\nBisnis adalah tulang punggung ekonomi global, memacu inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah berkembang pesat karena teknologi, globalisasi, dan pergeseran permintaan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman tentang prinsip-prinsip, tantangan, dan strategi utama. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.</p> <p>Dasar Bisnis: \r\nPada intinya, bisnis melibatkan penciptaan, pengiriman, dan penangkapan nilai. Para wirausahawan memainkan peran penting dalam mendirikan bisnis, mengidentifikasi kesenjangan pasar, dan menghidupkan ide-ide inovatif. Keberhasilan kewirausahaan membutuhkan kreativitas, kecukupan sumber daya, dan ketahanan. Startup dan bisnis kecil menghadapi tantangan unik tetapi juga mendapatkan manfaat dari kegesitan dan fleksibilitas dalam memenuhi kebutuhan pasar.</p> \r\n<p>Seni Manajemen: \r\nManajemen yang efektif sangat penting bagi bisnis dalam semua skala. Ini mencakup perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasi. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasi, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah menjadi kritis untuk keberhasilan.</p> <p>Menguasai Pemasaran: \r\nPemasaran melibatkan pemahaman akan kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, menyediakan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.</p> \r\n<p>Perspektif Keuangan: \r\nKeuangan sangat penting untuk kelangsungan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penyusunan anggaran, analisis keuangan, manajemen risiko, dan mengoptimalkan struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.</p> \r\n<p>Mengadopsi Tanggung Jawab Sosial Perusahaan: \r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar secara sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik etis dan berkelanjutan. Inisiatif dapat meliputi pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya yang beretika. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.</p> <p>Kesimpulan: \r\nDunia bisnis adalah lanskap yang kompleks dan terus berkembang. Tetap memperhatikan dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengadopsi tanggung jawab sosial adalah langkah-langkah yang memposisikan bisnis untuk sukses. Perjalanan kewirausahaan dan manajemen bisnis menantang namun memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis memainkan peran penting dalam membentuk ekonomi,mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.</p> <p></p>', NULL, NULL, 1, 1, 1, 1, 1, 0, '2023-06-21 22:18:43', '2023-06-21 22:19:39'),
(24, 'en', 13, 1, 'uploads/5LVocggwDRXqMySdDZg46I0ekZMFGd.jpeg', 'Dari Startup hingga Sukses: Pelajaran dari Usaha Bisnis Inovatif', 'dari-startup-hingga-sukses-pelajaran-dari-usaha-bisnis-inovatif', '<p>Pendahuluan: \r\nBisnis adalah tulang punggung ekonomi global, memacu inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah berkembang pesat karena teknologi, globalisasi, dan pergeseran permintaan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman tentang prinsip-prinsip, tantangan, dan strategi utama. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.</p> <p>Dasar Bisnis: \r\nPada intinya, bisnis melibatkan penciptaan, pengiriman, dan penangkapan nilai. Para wirausahawan memainkan peran penting dalam mendirikan bisnis, mengidentifikasi kesenjangan pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan sumber daya, dan ketahanan. Startup dan bisnis kecil menghadapi tantangan unik tetapi juga mendapatkan keuntungan dari kegesitan dan fleksibilitas dalam memenuhi kebutuhan pasar.</p> \r\n<p>Seni Manajemen: \r\nManajemen yang efektif sangat penting bagi bisnis dalam semua skala. Ini mencakup perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasi. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasi, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah menjadi kritis untuk keberhasilan.</p> <p>Menguasai Pemasaran:\r\nPemasaran melibatkan pemahaman akan kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.</p> \r\n<p>Perspektif Keuangan: \r\nKeuangan sangat penting untuk keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penyusunan anggaran, analisis keuangan, manajemen risiko, dan mengoptimalkan struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.</p> \r\n<p>Mengadopsi Tanggung Jawab Sosial Perusahaan: \r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar secara sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik etis dan berkelanjutan. Inisiatif dapat meliputi pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya yang beretika. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.</p> <p>Kesimpulan: \r\nDunia bisnis adalah lanskap yang kompleks dan terus berkembang. Tetap memperhatikan dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengadopsi tanggung jawab sosial memposisikan bisnis untuk sukses. Perjalanan kewirausahaan dan manajemen bisnis menantang namun membawa peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis memainkan peran penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.</p> <p></p>', NULL, NULL, 1, 1, 1, 1, 1, 1, '2023-06-21 22:19:43', '2023-10-25 11:07:10'),
(25, 'en', 13, 1, 'uploads/gFgEHeZHf5Euz7jCtVrA7Vd6B47YPS.jpeg', 'Mendorong Profitabilitas: Manajemen Keuangan yang Efektif untuk Bisnis', 'mendorong-profitabilitas-manajemen-keuangan-yang-efektif-untuk-bisnis', '<p>Pendahuluan: \r\nBisnis adalah tulang punggung ekonomi global, memacu inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah berkembang pesat karena teknologi, globalisasi, dan pergeseran permintaan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman tentang prinsip-prinsip, tantangan, dan strategi utama. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.</p> \r\n<p>Dasar Bisnis: \r\nPada intinya, bisnis melibatkan penciptaan, pengiriman, dan penangkapan nilai. Para wirausahawan memainkan peran penting dalam mendirikan bisnis, mengidentifikasi kesenjangan pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan sumber daya, dan ketahanan. Startup dan bisnis kecil menghadapi tantangan unik tetapi juga mendapatkan keuntungan dari kegesitan dan fleksibilitas dalam memenuhi kebutuhan pasar.</p> \r\n<p>Seni Manajemen: \r\nManajemen yang efektif sangat penting bagi bisnis dalam semua skala. Ini mencakup perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasi. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasi, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah menjadi kritis untuk keberhasilan.</p> \r\n<p>Menguasai Pemasaran:\r\nPemasaran melibatkan pemahaman akan kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.</p> \r\n<p>Perspektif Keuangan: \r\nKeuangan sangat penting untuk keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penyusunan anggaran, analisis keuangan, manajemen risiko, dan mengoptimalkan struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.</p> \r\n<p>Mengadopsi Tanggung Jawab Sosial Perusahaan: \r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar secara sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik etis dan berkelanjutan. Inisiatif dapat meliputi pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya yang beretika. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.</p> \r\n<p>Kesimpulan: \r\nDunia bisnis adalah lanskap yang kompleks dan terus berkembang. Tetap memperhatikan dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengadopsi tanggung jawab sosial memposisikan bisnis untuk sukses. Perjalanan kewirausahaan dan manajemen bisnis menantang namun membawa peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis memainkan peran penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.</p> <p></p>', NULL, NULL, 1, 1, 1, 1, 1, 2, '2023-06-21 22:20:34', '2023-10-25 08:43:05'),
(34, 'en', 14, 1, 'uploads/1W5bMGNWVTHODgwSnxI1QOuVFMLM83.jpg', 'Menciptakan Pengalaman yang Berkesan: Melepaskan Keajaiban Perencanaan Acara', 'menciptakan-pengalaman-yang-berkesan-melepaskan-keajaiban-perencanaan-acara', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 1, 1, 1, 1, 1, 1, '2023-06-21 22:51:11', '2023-10-25 09:28:12'),
(37, 'en', 14, 1, 'uploads/K9h4VVS8JCpxqwOMGHTUVHuDVnokff.jpg', 'Menguasai Pemasaran Acara: Strategi untuk Meningkatkan Kehadiran dan Keterlibatan', 'menguasai-pemasaran-acara-strategi-untuk--meningkatkan-kehadiran-dan-keterlibatan', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 1, 1, 1, 1, 1, 1, '2023-06-21 22:53:22', '2023-06-22 03:34:52'),
(40, 'en', 14, 1, 'uploads/XtLfEDo2k3e4qKMTzrdk8rnmspjsVf.jpg', 'Di Balik Layar: Seni Eksekusi Acara yang Mulus', 'di-balik-layar-seni-eksekusi-acara-yang-mulus', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 1, 1, 1, 1, 1, 0, '2023-06-21 22:55:35', '2023-06-21 22:56:25'),
(43, 'en', 15, 1, 'uploads/1Lw6dCj40WrzmxowFxJfWufMRateSJ.jpg', 'Mendobrak Hambatan: Inovasi dalam Pengalaman Acara Virtual dan Hibrid', 'mendobrak-hambatan-inovasi-dalam-pengalaman-acara-virtual-dan-hibrid', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 1, 1, 1, 1, 1, 1, '2023-06-21 22:59:33', '2023-06-22 00:44:56'),
(46, 'en', 15, 1, 'uploads/GEPaNuO7AksjQom7EEPzJWjLYMtN8l.jpg', 'Seni Keseimbangan Kehidupan-Kerja: Memelihara Harmoni di Dunia yang Bergerak Cepat', 'seni-keseimbangan-Kehidupan-kerja-memelihara-harmoni-di-dunia-yang-bergerak-cepat', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 1, 1, 1, 1, 1, 1, '2023-06-21 23:05:42', '2023-10-25 11:32:46'),
(49, 'en', 15, 1, 'uploads/2JSPqkxcMrcGHYHWCH68TxVfvUj4Uf.jpg', 'Perhatian dalam Kehidupan Sehari-hari: Menumbuhkan Kedamaian dan Kebahagiaan Batin', 'perhatian-dalam-kehidupan-sehari-hari-menumbuhkan-kedamaian-dan-kebahagiaan-batin', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 1, 1, 1, 1, 1, 3, '2023-06-21 23:16:18', '2023-10-25 11:01:25'),
(52, 'en', 15, 1, 'uploads/2uMMsxJ9TfsAkyhKaduNkZfSsULgbB.jpg', 'Merancang Gaya Hidup Impian Anda: Menciptakan Jalan Pribadi Menuju Kesuksesan', 'merancang-gaya-hidup-impian-anda-menciptakan-jalan-pribadi-menuju-kesuksesan', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 1, 1, 1, 1, 1, 2, '2023-06-21 23:20:16', '2023-06-24 00:02:03'),
(67, 'en', 14, 1, 'uploads/ZOfmDXwmsX3ZJYYI8XIYq89kT36TPp.jpg', 'Mencapai Kehebatan Olahraga: Pelajaran dari Atlet Legendaris', 'mencapai-kehebatan-olahraga-pelajaran-dari-atlet-legendaris', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 0, 0, 0, 1, 1, 0, '2023-06-21 23:50:32', '2023-06-21 23:51:41'),
(70, 'en', 14, 1, 'uploads/9HH6pcbhOuoLdY7CLebgp8W05VCEWK.jpg', 'Kehebatan Olahraga: Pelajaran dari Atlet Legendaris', 'kehebatan-olahraga-pelajaran-dari-atlet-legendaris', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 0, 0, 0, 1, 1, 7, '2023-06-21 23:54:17', '2023-10-25 10:56:32');
INSERT INTO `news` (`id`, `language`, `category_id`, `auther_id`, `image`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `is_breaking_news`, `show_at_slider`, `show_at_popular`, `status`, `is_approved`, `views`, `created_at`, `updated_at`) VALUES
(73, 'en', 14, 1, 'uploads/2uMMsxJ9TfsAkyhKaduNkZfSsULgbB.jpg', 'Gaya Hidup Impian: Menciptakan Jalan Pribadi Menuju Kesuksesan', 'gaya-hidup-impian-menciptakan-jalan-pribadi-menuju-kesuksesan', 'Pengantar:<br>\r\nBisnis merupakan tulang punggung ekonomi global, mendorong inovasi, pertumbuhan, dan menciptakan peluang. Di dunia yang terus berubah, lanskap bisnis telah mengalami perkembangan yang signifikan akibat teknologi, globalisasi, dan perubahan tuntutan konsumen. Menavigasi lingkungan yang dinamis ini membutuhkan pemahaman atas prinsip-prinsip utama, tantangan, dan strategi-strategi. Artikel ini menjelajahi berbagai aspek dunia bisnis, termasuk kewirausahaan, manajemen, pemasaran, keuangan, dan tanggung jawab sosial perusahaan.<br><br>\r\nDasar Bisnis:<br>\r\nPada intinya, bisnis melibatkan penciptaan, penyampaian, dan pengambilan nilai. Para pengusaha memainkan peran penting dalam mendirikan bisnis, mengidentifikasi celah pasar, dan mewujudkan ide-ide inovatif. Kewirausahaan yang sukses membutuhkan kreativitas, kecerdasan dalam menggunakan sumber daya, dan ketangguhan. Startup dan bisnis kecil menghadapi tantangan yang unik tetapi juga mendapatkan keuntungan dari fleksibilitas dalam memenuhi kebutuhan pasar.<br><br>\r\nSeni Manajemen:<br>\r\nManajemen yang efektif sangat penting bagi bisnis dalam segala skala. Ini meliputi perencanaan, pengorganisasian, kepemimpinan, dan pengendalian operasional. Manajer harus memiliki keterampilan kepemimpinan, memotivasi tim, dan memiliki visi strategis. Fungsi manajemen kunci meliputi manajemen sumber daya manusia, manajemen operasional, dan perencanaan strategis. Kemampuan komunikasi yang efektif, pengambilan keputusan, dan pemecahan masalah sangat penting untuk keberhasilan.<br><br>\r\nMenguasai Pemasaran:<br>\r\nPemasaran melibatkan pemahaman terhadap kebutuhan pelanggan, menciptakan proposisi nilai, dan mempromosikan produk atau layanan. Ini mencakup riset pasar, segmentasi, penargetan, penempatan, dan branding. Pemasaran digital telah merevolusi bidang ini, memberikan saluran baru untuk periklanan, keterlibatan pelanggan, dan analisis data. Kampanye yang sukses memanfaatkan wawasan konsumen dan beradaptasi dengan preferensi yang berubah.<br><br>\r\nPerspektif Keuangan:<br>\r\nKeuangan sangat penting bagi keberlanjutan bisnis. Memahami konsep keuangan, mengelola arus kas, dan membuat keputusan investasi yang terinformasi adalah krusial. Manajemen keuangan meliputi penganggaran, analisis keuangan, manajemen risiko, dan optimasi struktur modal. Perencanaan keuangan yang baik memastikan bisnis memiliki sumber daya untuk beroperasi, berkembang, dan berinovasi.<br><br>\r\nMengadopsi Tanggung Jawab Sosial Perusahaan:<br>\r\nBisnis diharapkan bertindak secara bertanggung jawab dalam lingkungan yang sadar sosial saat ini. Tanggung Jawab Sosial Perusahaan (CSR) mengacu pada praktik-praktik etis dan berkelanjutan. Inisiatif dapat mencakup pengelolaan lingkungan, keterlibatan masyarakat, dan sumber daya etis. Memprioritaskan CSR meningkatkan reputasi, menarik pelanggan, dan mempertahankan karyawan.<br><br>\r\nKesimpulan:<br>\r\nDunia bisnis adalah lanskap yang kompleks dan selalu berubah. Tetap mengikuti dinamika pasar, teknologi, dan preferensi konsumen sangat penting. Mengadopsi inovasi, memupuk kepemimpinan, memanfaatkan strategi pemasaran yang efektif, mengelola keuangan dengan bijaksana, dan mengambil tanggung jawab sosial akan menempatkan bisnis pada posisi yang sukses. Perjalanan kewirausahaan dan manajemen bisnis penuh tantangan namun juga memberikan peluang pertumbuhan, dampak, dan pemenuhan pribadi. Bisnis berperan penting dalam membentuk ekonomi, mendorong inovasi, dan meningkatkan kualitas hidup individu dan masyarakat.<br>', NULL, NULL, 1, 1, 1, 0, 1, 3, '2023-06-22 00:02:33', '2023-10-23 18:45:45');

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

--
-- Dumping data for table `news_tags`
--

INSERT INTO `news_tags` (`id`, `news_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(84, 23, 84, NULL, NULL),
(85, 23, 85, NULL, NULL),
(86, 23, 86, NULL, NULL),
(90, 24, 90, NULL, NULL),
(91, 24, 91, NULL, NULL),
(92, 24, 92, NULL, NULL),
(106, 25, 106, NULL, NULL),
(107, 25, 107, NULL, NULL),
(108, 25, 108, NULL, NULL);

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
('admin@gmail.com', '$2y$10$m5NW3rtlO/JqFGIDi6hhJeYWkNOtdJHzgIJcMmgmQdS4k/cJcnhVK', '2023-06-19 22:25:21');

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
(9, 'news delete', 'admin', 'News Permissions', '2023-06-13 05:06:28', '2023-06-13 05:06:28');

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
(1, 'editor', 'admin', '2023-10-25 19:15:20', '2023-10-25 19:15:20'),
(3, 'Super Admin', 'admin', '2023-06-12 03:28:34', '2023-06-12 03:28:34'),
(6, 'writer', 'admin', '2023-06-12 23:52:28', '2023-06-12 23:52:28');

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
(7, 1),
(7, 6),
(8, 1),
(8, 6);

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
(84, 'Business', '2023-06-21 22:19:39', '2023-06-21 22:19:39', 'en'),
(85, ' Event', '2023-06-21 22:19:39', '2023-06-21 22:19:39', 'en'),
(86, ' Lifestyle', '2023-06-21 22:19:39', '2023-06-21 22:19:39', 'en'),
(90, 'Business', '2023-06-21 22:20:19', '2023-06-21 22:20:19', 'en'),
(91, ' Event', '2023-06-21 22:20:19', '2023-06-21 22:20:19', 'en'),
(92, ' Lifestyle', '2023-06-21 22:20:19', '2023-06-21 22:20:19', 'en'),
(106, 'Business', '2023-06-21 22:24:13', '2023-06-21 22:24:13', 'en'),
(107, ' Event', '2023-06-21 22:24:13', '2023-06-21 22:24:13', 'en'),
(108, ' Lifestyle', '2023-06-21 22:24:13', '2023-06-21 22:24:13', 'en');

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
(1, 'user123', 'user123@gmail.com', NULL, '$2y$10$63BjxFQWL5PjM4COz1kns.GrtBIc2jo/AV24DxsgbgXykvHz3C6.m', 'mC9dodqrClO5P5eMx5tL6fwzNkHFILYhMfW0I0AAv4tpkvDISRCboCo6KfXY', '2023-05-21 00:06:29', '2023-06-19 23:10:50'),
(2, 'usertest', 'testuser@gmail.com', NULL, '$2y$10$tgMoTZNtFyKdBCT3Hsrvc.P2wZOhekfjk..7vn57Z0I.BuwIlse8a', NULL, '2023-06-19 04:41:23', '2023-06-19 04:41:23');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `news_tags`
--
ALTER TABLE `news_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
