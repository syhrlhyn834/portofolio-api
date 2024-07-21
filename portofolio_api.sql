-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2024 at 04:01 PM
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
-- Database: `portofolio_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `biodatas`
--

CREATE TABLE `biodatas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `from` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `biodatas`
--

INSERT INTO `biodatas` (`id`, `content`, `description`, `name`, `age`, `from`, `image`, `created_at`, `updated_at`) VALUES
(1, 'I\'m Arl, a Web Developer', '-', 'Syahril Haryono', '20', 'Bogor, Jawa Barat, Indonesia.', 'OZiS7wTWcvVcY6v5UR7s0TytktEmWqYnsffZvACg.jpg', NULL, '2024-07-20 06:22:43');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `category_id`, `user_id`, `content`, `image`, `description`, `created_at`, `updated_at`) VALUES
(14, 'tes1', 'tes1', 16, 1, '<p><span style=\"background-color:rgb(255,255,255);color:rgb(77,81,86);\">Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak</span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><span style=\"background-color:rgb(255,255,255);color:rgb(77,81,86);\">.</span></p>', '6NSrBZeJFEeOHa0v0xt31nE2FQwes1VE7zsflt2A.png', 'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak.', '2024-07-14 10:09:24', '2024-07-17 00:28:58'),
(15, 'tes ads asa das da', 'tes-ads-asa-das-da', 16, 1, '<p>&lt;svg class=\"w-6 h-6 text-gray-800 dark:text-white\" aria-hidden=\"true\" xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" fill=\"none\" viewBox=\"0 0 24 24\"&gt;<br>&nbsp;&lt;path stroke=\"currentColor\" stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M4 10h16m-8-3V4M7 7V4m10 3V4M5 20h14a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1Zm3-7h.01v.01H8V13Zm4 0h.01v.01H12V13Zm4 0h.01v.01H16V13Zm-8 4h.01v.01H8V17Zm4 0h.01v.01H12V17Zm4 0h.01v.01H16V17Z\"/&gt;<br>&lt;/svg&gt;<br>&nbsp;</p><figure class=\"image image_resized\" style=\"width:56.59%;\"><img src=\"http://localhost/portofolio-app/public/storage/blog_images/6TOlmlxKTNrO3ks1nn4wUsyPJIVfLsoCUm0MvaDk.png\"></figure>', 'vUS2xCv0qLyKhpexV86U2yTbsxCNWSngJOT7HTP8.png', 'sasdasdasdas dasdasd asdasdasdaasd asd a', '2024-07-14 10:39:56', '2024-07-16 11:07:36'),
(16, 'adsdasd', 'adsdasd', 16, 1, '<p>asdasdasda</p>', 'tm9x2O0AXUPctYVlNrinEOncErHBfdwh1eoT4wGh.png', 'asdasdasd as dasd asdasdas', '2024-07-15 08:32:15', '2024-07-17 00:28:51'),
(17, 'ads asd', 'ads-asd', 16, 1, '<p>asd ad asa sdad sa</p>', 'MG4tNZ7v3WyrUiq3LChoMxJAYsi4NGl6mrXzEib4.png', 'ad sa ssad sad s', '2024-07-15 08:32:39', '2024-07-15 08:32:39'),
(18, 'ad asdasdasdas d', 'ad-asdasdasdas-d', 16, 1, '<p>dasddasdasdas</p>', 'hgoDtTh6XxPDJF9GZEUHsRvgIrcFC1gm1ZnZ74XK.png', 'asdasasd asd asdas dasd', '2024-07-15 08:32:56', '2024-07-17 00:28:42'),
(19, 'AASDAS DAS', 'aasdas-das', 16, 1, '<h3 style=\"margin-left:0px;\"><strong>The standard Lorem Ipsum passage, used since the 1500s</strong></h3><p style=\"margin-left:0px;text-align:justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin-left:0px;\"><strong>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</strong></h3><p style=\"margin-left:0px;text-align:justify;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin-left:0px;\"><strong>1914 translation by H. Rackham</strong></h3><p style=\"margin-left:0px;text-align:justify;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin-left:0px;\"><strong>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</strong></h3><p style=\"margin-left:0px;text-align:justify;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin-left:0px;\"><strong>1914 translation by H. Rackham</strong></h3><p style=\"margin-left:0px;text-align:justify;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'S3p6ZovDPLM7t4N2TwsFV4Ef9O5j10xJHs7s94fm.png', 'das das as', '2024-07-15 08:33:11', '2024-07-17 00:28:34'),
(20, 'Blog tes', 'blog-tes', 16, 1, '<p>Blog tes</p>', 'mL9foknf3OC9SiNBqAB7ddDAqlxugNfvjmRHU69I.png', 'Blog tes', '2024-07-17 02:27:19', '2024-07-17 02:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('DhEfPrcgdNEDLFmk', 's:7:\"forever\";', 2036249522),
('fBXuyv8rqzLOA1OY', 's:7:\"forever\";', 2036259956),
('hbbixR8XvdgpBzed', 's:7:\"forever\";', 2036260692),
('J18ACNHOzblUcqEA', 's:7:\"forever\";', 2036260642),
('obiX0tS723tyJg9P', 's:7:\"forever\";', 2036294797),
('pJl22Zh3w0HBdu9G', 's:7:\"forever\";', 2035782540),
('pxyECDWw5lVME7iR', 's:7:\"forever\";', 2035655754),
('U343EWYKU16QEkoM', 's:7:\"forever\";', 2036260814),
('vZAbOKOjWARzGJuU', 's:7:\"forever\";', 2036258220);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 'tes4', 'tes4', 'blogs', '2024-07-06 14:49:41', '2024-07-06 14:49:41', NULL),
(14, 'tes6', 'tes6', 'blogs', '2024-07-06 14:49:47', '2024-07-13 08:34:25', NULL),
(16, 'das', 'das', 'blogs', '2024-07-13 09:13:26', '2024-07-13 09:13:26', NULL),
(18, 'adsas', 'adsas', 'blogs', '2024-07-13 09:17:00', '2024-07-13 09:17:00', NULL),
(19, 'gafs', 'gafs', 'blogs', '2024-07-13 09:17:05', '2024-07-13 09:17:05', NULL),
(20, 'Tes', 'tes', 'galleries', '2024-07-13 09:31:52', '2024-07-13 09:44:53', '2024-07-13 09:44:53'),
(21, 'Syahril', 'syahril', 'galleries', '2024-07-13 09:50:20', '2024-07-13 09:51:31', '2024-07-13 09:51:31'),
(22, 'tesadasa', 'tesadasa', 'galleries', '2024-07-14 10:55:59', '2024-07-14 10:55:59', NULL),
(23, 'Pendidikan', 'pendidikan', 'galleries', '2024-07-20 00:26:20', '2024-07-20 00:26:20', NULL),
(24, 'Internet', 'internet', 'galleries', '2024-07-20 00:26:25', '2024-07-20 00:26:25', NULL),
(25, 'Hiburan', 'hiburan', 'galleries', '2024-07-20 00:26:38', '2024-07-20 00:26:38', NULL),
(26, 'Informasi', 'informasi', 'galleries', '2024-07-20 00:26:48', '2024-07-20 00:26:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `description`, `location`, `number`, `email`, `created_at`, `updated_at`) VALUES
(1, 'tes', 'Always available for freelance work if the right project comes along, Feel free to contact me!', 'dsadas', '08212312331', 'sadasda@gmail.com', NULL, '2024-07-20 05:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `place` text DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `title`, `place`, `year`, `city`, `created_at`, `updated_at`) VALUES
(1, 'Senior High School', 'SMA NEGERI 8', '2019 - 2022', 'Bogor, West Java, Indonesia.', NULL, '2024-07-16 11:38:23'),
(3, 'Bachelor Degree', 'State University of Jakarta', '2022 - Now', 'Jakarta, West Java, Indonesia.', '2024-07-14 02:52:05', '2024-07-14 02:52:05');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `place` text DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `url` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `title`, `place`, `year`, `city`, `url`, `created_at`, `updated_at`) VALUES
(3, 'Full Stack Developer', 'Paytrizz Group', '2022 - Now', 'Jakarta, DKI Jakarta, Indonesia', 'https://paytrizz.com', NULL, '2024-07-14 03:26:40'),
(8, 'Full Stack Developer', 'Pasificpedia', '2019 - 2022', 'Jakarta, DKI Jakarta, Indonesia', 'https://pasificpedia.com', '2024-07-13 05:14:37', '2024-07-14 03:25:40'),
(9, 'Full Stack Developer', 'Bytedevcode', '2018 - Now', 'Bogor, West Java, Indonesia', 'https://bytedevcode.com', '2024-07-14 03:27:22', '2024-07-14 03:27:22');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footers`
--

CREATE TABLE `footers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `footers`
--

INSERT INTO `footers` (`id`, `copyright`, `created_at`, `updated_at`) VALUES
(1, '© Syahril Haryono. All Rights Reserved.', NULL, '2024-07-07 07:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `file` text NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `title`, `slug`, `category_id`, `user_id`, `content`, `file`, `description`, `created_at`, `updated_at`) VALUES
(13, 'tes1', 'tes1', 26, 1, '<p>tes1</p>', 'rv53o1XTxZgnEFgwNfT0NdK7WqL6i3VNfsOAHI4q.png', 'tes1', '2024-07-13 09:51:17', '2024-07-20 01:03:45'),
(14, 'SAKDASD', 'sakdasd', 22, 1, '<p>ada</p>', 'PXpsSsKYI5G5JjYtTDFpb4uDOpef9iTCYxH8ZbRk.jpg', 'ads', '2024-07-17 05:40:31', '2024-07-17 05:40:31'),
(15, 'asdas', 'asdas', 22, 1, '<p>asdasddas asd asda sdasd asd asd</p>', '7Zduc8jrsUpkZp6tmZl3ujxWfb0N9n60el2VL6SB.jpg', 'adsdas asd as das das dasda sdas dasd asdas as das dasd asda sdasd asd asadsdas asd as das das dasda sdas dasd asdas as das dasd asda sdasd asd asadsdas asd as das das dasda sdas dasd asdas as das dasd asda sdasd asd asadsdas asd as das das dasda sdas dasd asdas as das dasd asda sdasd asd asadsdas asd as das das dasda sdas dasd asdas as das dasd asda sdasd asd as', '2024-07-17 05:41:47', '2024-07-18 08:55:00'),
(16, 'dsa', 'dsa', 22, 1, '<p>asd</p>', 'eSozLH2xD27mXpORL8ctRyrB26Q6YIyHFTA5kTDA.mp4', 'ads', '2024-07-17 05:43:52', '2024-07-17 05:43:52'),
(17, 'ad', 'ad', 22, 1, '<p style=\"margin-left:0px;text-align:justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sapien est, consequat et maximus nec, efficitur a velit. Nunc fringilla quam tortor, ac eleifend metus eleifend ut. Nulla scelerisque, nunc id aliquet gravida, ipsum neque eleifend lectus, nec aliquam metus enim non magna. Phasellus a lectus molestie, imperdiet arcu vitae, tincidunt est. Donec eget dui vitae lectus venenatis pellentesque. Quisque ut hendrerit elit. Vivamus lacinia tristique consectetur. Aenean tempus odio a dolor varius, a bibendum quam malesuada. Aenean a malesuada mi. Proin id suscipit elit, non mollis ligula. Suspendisse dictum purus interdum ornare vulputate. Praesent varius elit eu dolor egestas bibendum. Morbi semper aliquam felis, a euismod sem tristique at.</p><p style=\"margin-left:0px;text-align:justify;\">Praesent finibus dui eu metus euismod lobortis. Sed sagittis non erat vitae dignissim. Nullam vel dictum massa, tempor luctus velit. Curabitur maximus quis purus in malesuada. Nam sit amet justo varius neque egestas gravida in vitae risus. Vivamus sodales nisi vitae leo interdum scelerisque. Phasellus accumsan augue dignissim nisl ornare vulputate. Morbi sit amet tellus non ex hendrerit congue. Aliquam sit amet neque sit amet diam molestie malesuada nec et orci. Nullam eu vehicula lacus. Nunc metus libero, venenatis in tortor a, vulputate feugiat felis. Integer ac nisl volutpat, placerat ante nec, scelerisque ligula. Fusce posuere nisl eget lectus rhoncus, et luctus neque ornare. Nulla magna sem, aliquam non sagittis sed, condimentum sed arcu. Maecenas sed venenatis elit, vel efficitur erat. Quisque tincidunt quam eget nisi aliquet, vel pretium metus congue.</p><p style=\"margin-left:0px;text-align:justify;\">Morbi porta ac tellus non commodo. Sed pharetra, nibh eu sollicitudin ultrices, urna quam dignissim leo, id malesuada leo ipsum sit amet ante. In auctor lorem et tellus condimentum, id condimentum odio eleifend. Nunc mollis congue felis eu lacinia. Vestibulum dolor ipsum, fringilla egestas viverra at, convallis pulvinar quam. Morbi suscipit velit nulla, a eleifend odio fringilla et. Mauris tristique mi eu quam hendrerit dignissim. Integer fringilla, neque eu efficitur porttitor, diam turpis iaculis justo, vel suscipit purus augue vitae libero. Phasellus vehicula et magna in vulputate. Quisque urna neque, dictum quis accumsan ullamcorper, accumsan ornare velit. Donec ac tristique nunc.</p><p style=\"margin-left:0px;text-align:justify;\">Ut sit amet vestibulum urna. Phasellus non accumsan dui, eget facilisis lorem. Suspendisse aliquam mi id mattis volutpat. Ut efficitur nisi nec risus gravida, euismod suscipit ipsum pellentesque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam laoreet varius sem, nec mollis velit accumsan eget. Duis vehicula neque vitae nisl lobortis aliquam. Vivamus arcu odio, malesuada vel nisi sit amet, convallis lobortis arcu. Cras nec venenatis diam. Integer eget elit a mi dignissim rhoncus. Phasellus ultrices tempus mi in tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque odio nibh, gravida non sodales maximus, lobortis quis lacus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas nec est ultrices, pretium lacus a, convallis quam. Morbi fringilla neque eget nisl interdum, eget egestas nibh commodo.</p><p style=\"margin-left:0px;text-align:justify;\">Donec aliquet diam non malesuada pulvinar. Maecenas vulputate massa quis quam egestas, non congue felis auctor. Proin sed dignissim mauris. Cras nunc ante, tempor a porttitor quis, fringilla sit amet dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis commodo nulla, a gravida nulla. Nullam in nulla eget libero dapibus porttitor. Pellentesque nec massa varius, vestibulum dui id, varius justo. Praesent tincidunt libero lorem, at consequat lorem pulvinar ac. Morbi ac aliquam ligula, at maximus quam. Aliquam arcu erat, porta id velit nec, efficitur bibendum nisi. Suspendisse erat lacus, congue vitae rutrum et, condimentum consequat arcu. Vivamus laoreet, nulla quis molestie maximus, ipsum nibh suscipit arcu, et scelerisque neque justo et turpis. Sed ultricies egestas orci, ac vehicula risus porttitor et. Donec aliquet in enim ac ultricies.</p>', 'wGMRyejo93Dt0EcbqWrpwk3I774fbuvvtMYUSnF7.jpg', 'asdasddasd ad saasd', '2024-07-17 05:47:55', '2024-07-20 03:07:39'),
(18, 'asddas', 'asddas', 22, 1, '<p>asdasd</p>', 'nr3hqovXTTcoPGB0lBfU2J2T38vSl9lee0imbwcb.png', 'asdas', '2024-07-17 05:48:28', '2024-07-17 05:48:28'),
(19, 'sadd', 'sadd', 22, 1, '<p>asdasdas</p>', '1XHSndSnpleqVv7I0TH1trPdtN3GLxos2feCZp6Y.mp4', 'adsasdas', '2024-07-17 05:49:28', '2024-07-17 05:49:28'),
(20, 'asd', 'asd', 22, 1, '<p>daadsd</p>', 'V8HCrTHWCEYWuGSlcfDWRjwjvCT8WIxQjrXvC0s6.jpg', 'adsasd', '2024-07-18 08:02:54', '2024-07-18 08:02:54'),
(21, 'asdad', 'asdad', 22, 1, '<p>asdasd</p>', 'mjUv4ncWnnXvmXJVbolCRn7nCgVYagNJ99Oti7Q8.png', 'asdas', '2024-07-18 08:03:24', '2024-07-18 08:03:24'),
(22, 'asdccxz', 'asdccxz', 22, 1, '<p>ads</p>', 'rqqlTy73TQDZRpyYqD5yctRizHltVnrbFo0fGnJ7.mp4', 'ads', '2024-07-18 08:07:47', '2024-07-18 08:07:47'),
(23, 'dasdas', 'dasdas', 22, 1, '<p>asd</p>', 'FaHXPTQr2eWXBVfh5rX3vagx1OBj0iQDbrca6Odv.jpg', 'adsas', '2024-07-18 08:12:37', '2024-07-18 08:12:37'),
(24, 'adsasda', 'adsasda', 22, 1, '<p>ads</p>', 'EV3ogH9vhhkARinY4saMhLUvOi9wIAF483CpIo9O.jpg', 'adads', '2024-07-18 08:19:36', '2024-07-18 08:19:36'),
(25, 'ads', 'ads', 22, 1, '<p>ads</p>', 'JJXuqVJQ2QOC9Wc48hrmAF2yZmTHcKEYduZVhtup.mp4', 'das', '2024-07-18 08:30:33', '2024-07-18 08:30:33'),
(26, 'aadsfsd', 'aadsfsd', 22, 1, '<p>sdfdaf</p>', 'hh1lyo8gSsuXc6GghcMyfaKzsvUuwzPZKdGHhHgj.jpg', 'asdasd', '2024-07-18 10:33:58', '2024-07-18 10:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `headers`
--

CREATE TABLE `headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `headers`
--

INSERT INTO `headers` (`id`, `title`, `name`, `image`, `image2`, `created_at`, `updated_at`) VALUES
(1, 'tesssssadadsada', '___', 'WQ4bwdlF7oD6TAan9qHVFxMn2UUQfFE1jlcfoNH7.png', '0J5jCmUN1LM9CWCWRgWGdzc93220qg5IWaDPns3t.svg', NULL, '2024-07-20 06:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `inboxes`
--

CREATE TABLE `inboxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(31, '0001_01_01_000000_create_users_table', 1),
(32, '0001_01_01_000001_create_cache_table', 1),
(33, '0001_01_01_000002_create_jobs_table', 1),
(34, '2024_07_03_131732_create_categories_table', 1),
(35, '2024_07_03_131919_create_blogs_table', 1),
(36, '2024_07_03_133205_create_galleries_table', 1),
(37, '2024_07_03_134201_create_sosmeds_table', 1),
(38, '2024_07_03_134339_create_footers_table', 1),
(39, '2024_07_03_135304_create_headers_table', 1),
(40, '2024_07_03_140834_create_personal_access_tokens_table', 1),
(41, '2024_07_03_174253_create_biodatas_table', 1),
(42, '2024_07_03_174958_create_education_table', 1),
(43, '2024_07_03_175428_create_experiences_table', 1),
(44, '2024_07_03_175537_create_skills_table', 1),
(45, '2024_07_03_175723_create_contacts_table', 1),
(47, '2024_07_08_071015_create_inboxes_table', 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `description`, `image`, `created_at`, `updated_at`) VALUES
(3, 'HTML', '93v4dXgPbIgsFWqiiFiKh1URsOWcUhOXzClV3RiH.svg', '2024-07-13 06:27:32', '2024-07-14 05:01:45'),
(4, 'CSS', 'B9KwaXmPfThxVk5UeyRoxebvFf3rgXC8EqK5CQLH.svg', '2024-07-14 04:56:43', '2024-07-14 05:02:25'),
(5, 'JAVASCRIPT', 'mXY2seHQAKoUqXGAKyafq0GU2Y8ZR12gg9aKAokd.svg', '2024-07-14 05:03:07', '2024-07-14 05:03:07'),
(6, 'TAILWIND CSS', 'hPF7P49fW65nZq9Ogh4RB5nHbrWMaDt2JIL1ec2k.svg', '2024-07-14 05:03:56', '2024-07-14 05:03:56'),
(7, 'BOOTSTRAP', 'IemDr3opvc7V82ADLAthiHuQhZeGWeDdVgGOiGyE.svg', '2024-07-14 05:04:43', '2024-07-14 05:04:43'),
(8, 'NUXT JS', 'm1DwJfzDQIC0igiWtYDLv53UZAhSurF2SPEiQfnm.svg', '2024-07-14 05:05:20', '2024-07-14 05:05:20'),
(9, 'REACT JS', 'VFwZVrl1sLvkSxXoqwQe9e7mNcYlGHMk4DVotQs9.svg', '2024-07-14 05:07:51', '2024-07-14 05:07:51'),
(10, 'NODE JS', 'SEa4z08HsKt257rjpkj0mTQFzPI4T4svF3XeiyQ3.svg', '2024-07-14 05:08:30', '2024-07-14 05:08:30'),
(11, 'PHP', 'qCxy4zmYPuc0288qfyGU36YU9kvIuFD4qSHKNf2G.svg', '2024-07-14 05:28:25', '2024-07-14 06:00:21'),
(12, 'LARAVEL', 'AjfJsmKu4zwk5zJRxwLDU2qmqGfwSTqtBs4WW8Rx.svg', '2024-07-14 05:55:52', '2024-07-14 05:55:52'),
(13, 'VUE JS', 'dMegWNDxQN8CbIbOMZTeO1rCEkfeIcCOcXSJvKcT.svg', '2024-07-14 05:56:41', '2024-07-14 05:56:41'),
(14, 'GOLANG', 'TFXMnQKAvTmHTvWDCgVe0iva6f96SL6q54eCcaC7.svg', '2024-07-14 05:57:16', '2024-07-14 05:57:16'),
(15, 'NEXT JS', 'agIxmSVgW82TQ1sD61WmgUFlzAJ0dhF5ypSZALUN.svg', '2024-07-14 05:58:35', '2024-07-14 05:58:35'),
(16, 'DJANGO', 'kkbj4aixruDqNrJGTQtEimJsTLrLnK9kMnHe2p0R.svg', '2024-07-14 06:01:10', '2024-07-14 06:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `sosmeds`
--

CREATE TABLE `sosmeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sosmeds`
--

INSERT INTO `sosmeds` (`id`, `logo`, `name`, `url`, `username`, `created_at`, `updated_at`) VALUES
(2, 'bi bi-twitter-x', 'X', 'https://x.com', 'syahrilh.h', '2024-07-13 07:48:42', '2024-07-13 07:54:57'),
(3, 'bi bi-instagram', 'Instagram', 'https://instagram.com', 'syahrilh.h', '2024-07-14 00:29:47', '2024-07-14 00:29:47');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Syahril Haryono', 'admin@gmail.com', NULL, '$2y$12$u4t6EyjMgNc6IJIOgG.iz.//5BgtXBfMFH/jjPiBGacuArvsKQtfa', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biodatas`
--
ALTER TABLE `biodatas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`);

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_type_slug_unique` (`type`,`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `footers`
--
ALTER TABLE `footers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `galleries_slug_unique` (`slug`);

--
-- Indexes for table `headers`
--
ALTER TABLE `headers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sosmeds`
--
ALTER TABLE `sosmeds`
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
-- AUTO_INCREMENT for table `biodatas`
--
ALTER TABLE `biodatas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footers`
--
ALTER TABLE `footers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `headers`
--
ALTER TABLE `headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inboxes`
--
ALTER TABLE `inboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sosmeds`
--
ALTER TABLE `sosmeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
