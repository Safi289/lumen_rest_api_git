-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2022 at 06:40 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lumen_rest_api`
--

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
(1, '2022_10_03_054446_create_posts_table', 1),
(2, '2022_10_03_062554_create_users_table', 2),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(6, '2016_06_01_000004_create_oauth_clients_table', 3),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2fc12b451d7d29cc75d526cb6ab91b635b7490cdd10f8755a5cd2d9705fc7d1a5f3f979f1b8c6b02', 7, 8, NULL, '[]', 0, '2022-10-03 11:05:43', '2022-10-03 11:05:43', '2023-10-03 11:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Lumen Personal Access Client', 'brBTmUzniLe4ahCRgCRQl23brdbZ7pk1hz0d7UjX', NULL, 'http://localhost', 1, 0, 0, '2022-10-03 06:54:10', '2022-10-03 06:54:10'),
(2, NULL, 'Lumen Password Grant Client', 'XUWd2EjBcKp0X01V05faM6w2GyZpHLGwv5T5mm8G', 'users', 'http://localhost', 0, 1, 0, '2022-10-03 06:54:10', '2022-10-03 06:54:10'),
(3, NULL, 'Lumen Personal Access Client', '3dnwhzZ1zd8uvkgy9rtSs3neD7JYcCpFrsIHo82p', NULL, 'http://localhost', 1, 0, 0, '2022-10-03 08:44:29', '2022-10-03 08:44:29'),
(4, NULL, 'Lumen Password Grant Client', 'WAZbMQ3ChEgkFUfR9dYeGOWWkupB2J4RMQCFb7vC', 'users', 'http://localhost', 0, 1, 0, '2022-10-03 08:44:29', '2022-10-03 08:44:29'),
(5, NULL, 'Lumen Personal Access Client', 'iVlcxPNjPk5EJwHSQQv5mmhELOaFD3Gm94T0Nc8J', NULL, 'http://localhost', 1, 0, 0, '2022-10-03 09:26:05', '2022-10-03 09:26:05'),
(6, NULL, 'Lumen Password Grant Client', 'N99q2GaZGUzBtjvcf5tcoRDykX32riXQM7rVwjfU', 'users', 'http://localhost', 0, 1, 0, '2022-10-03 09:26:05', '2022-10-03 09:26:05'),
(7, NULL, 'Lumen Personal Access Client', 'gM7knoUzKXKtPUlU6AIIIXFi5rALeT847o1icBNB', NULL, 'http://localhost', 1, 0, 0, '2022-10-03 09:26:25', '2022-10-03 09:26:25'),
(8, NULL, 'Lumen Password Grant Client', '6ZcKDT0Y7ztjDbSsM0nnzDdTzgVMJUZMwvpVK1HX', 'users', 'http://localhost', 0, 1, 0, '2022-10-03 09:26:25', '2022-10-03 09:26:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-10-03 06:54:10', '2022-10-03 06:54:10'),
(2, 3, '2022-10-03 08:44:29', '2022-10-03 08:44:29'),
(3, 5, '2022-10-03 09:26:05', '2022-10-03 09:26:05'),
(4, 7, '2022-10-03 09:26:25', '2022-10-03 09:26:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('15f5317a62092d38fa6c1628b8d83fb38ac7608b2d59c4cf00da1a9b77d3943bf2f1c6693717b666', '4ab0a43236a13d12c913c2ddc783c60c9146c80110e9f719b4d66b222e850854e13f4e963723e2df', 0, '2023-10-03 09:53:56'),
('21c5fac9e9d4633bf9673a1be84523db63547b8173133d2434246d5e1f873d5deaeff5ddb1622819', 'fc01077238a6828d0c338fa7502176a490c6e7d7d7938ab8f6bd1c3bae29716d8c08c1e68d6182ba', 0, '2023-10-03 11:14:01'),
('320e5d8b54fca2683e399eb4f16ea808d882d6ce5bf6582b32d584b68f4cc1112595e476993c9d4d', 'e6cc35e3f19cd0a2177566db22994ee34418a6d3cbbc2fd01c05579a0093bb5fcba02db4fc4a9ee2', 0, '2023-10-03 11:05:38'),
('3482cbdb632fa7c78e02da383849b6a4b7e3579ff9bf7a705db0fb10d91a6edaac8a41774a0f2419', '2fc12b451d7d29cc75d526cb6ab91b635b7490cdd10f8755a5cd2d9705fc7d1a5f3f979f1b8c6b02', 0, '2023-10-03 11:05:43'),
('37c35d255c8571efb529f8b402c9869421c7c397c8f2f45b69655e0bd0cccdbc0e5efc7b6d1676a1', 'c75da27f3efd33746a822109b08c7f9c69f1fc91db8bff528cd70832e8c3eb89f28131ce0b29d215', 0, '2023-10-03 09:54:27'),
('425095139eebd0248e1e642634f7056d438e9e05de1dcd67446983a907497ce5d10edd3bb20d4717', 'b309d5dabf96063bcf39bb17107e047345a11b926b769cd73dabcc75c63fe74ec6ea119de0912380', 0, '2023-10-03 10:38:14'),
('52370a3e03bbc33222aa6b9129f0b580bed010a5206cc3949733cab660f40b70d5b1cdf2ad7d2905', '52f372929034e8207dc91459de22f3b9182d4a6493b145e4564efe3de798a7fe431a2b6382929796', 0, '2023-10-03 10:57:10'),
('526d5793f3c5a68c0c31a19b65f1f4bdb67b4baeb4259310156ffae37b1bb67cd38d6f25fe0096bc', '4206d57dc94d6e7931668e79fcbec17b4bd7f4e9643041c1fc600327c3bcf50e16c6262739b636be', 0, '2023-10-03 10:58:19'),
('8a20aac97541241175e0c370ea5049b4db127266eaa395a62437b14a648aede68129f0c82ac26fe5', '8955e239bc52b2d490cabf9963cf41ba74e71a6930de1022b027add89040642fe710bf36427726da', 0, '2023-10-03 10:23:30'),
('97ed27287d9e9fb2bd38d92f5c1e195a2a32b4ec894471f395a5054833fae3c02ec8f5dcf0ba5d95', '3aa4f2a7c2ed1aa78aee094e3e81c376c2972004ed3094cf63bbfca6663c2c428df082dd01eea7b9', 0, '2023-10-03 09:27:30'),
('c84df930dcaa63177917846637a864885f2b8b1293fdbabab9ceda0e3c48aface1f523010a132665', '34731ac83dbbc124c32edbebb1a00ca23b52527055de64e591bfb39ff4b87a75bbdd16552255be19', 0, '2023-10-03 10:48:07'),
('e8cc39f7f9d7ff1c3d73b3667259c03ca3391d09683668e02b7c8e0e5543245d8ccd07b1ebf4b6c5', 'a035fc9491a1ebb8a4375f83e6edc3e2aa9037e5c17b5942cb957569143ae4b36bf6ffd680f21aec', 0, '2023-10-03 10:58:41'),
('fc0820605b4db728741d51d9d4422b92e0988637614401535feb0a99623920ffc4384ba2deb29bc5', 'aad7cbb1fabf1468e833a73d38f9d1a007130b58b1e645b18e32caaa8683bad9e10302ae9cc11047', 0, '2023-10-03 10:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 'Necessitatibus aut nihil corrupti sunt illo qui.', 'Dolor et pariatur suscipit enim sed. Dolore voluptas quo placeat maiores eum. Occaecati quas libero sunt recusandae facilis id deserunt.', '2022-10-03 05:51:21', '2022-10-03 05:51:21'),
(2, 'Provident illum voluptas est accusamus sed debitis.', 'Sapiente eum doloremque quia et adipisci. Delectus non inventore consequatur. Quia enim aut laborum sed eos dolorum expedita.', '2022-10-03 05:51:21', '2022-10-03 05:51:21'),
(3, 'Delectus odit earum et quasi.', 'Animi et minus autem odio accusantium qui. Magni dicta aliquid error voluptatum sapiente exercitationem animi asperiores. Sed eum sit qui.', '2022-10-03 05:51:21', '2022-10-03 05:51:21'),
(4, 'Repellendus error perferendis quae.', 'Est et sed molestias quae omnis aut. Eaque est quam necessitatibus est nulla tempore. Consequatur eos voluptatem inventore voluptatem aut aut. Ducimus aut voluptatem quas.', '2022-10-03 05:51:21', '2022-10-03 05:51:21'),
(5, 'Harum quia ipsum ad accusamus officiis.', 'Qui similique corrupti ad minus sunt dolores. Cum et tempore ut ad amet similique. Porro et omnis ipsum culpa sed qui. Quia facilis rerum laudantium laudantium aspernatur non id.', '2022-10-03 05:51:21', '2022-10-03 05:51:21'),
(6, 'Aspernatur magnam esse molestiae.', 'Neque harum illo et impedit qui blanditiis voluptas. Ut modi dolor consequatur similique. Excepturi laudantium veritatis rerum ipsam sit reiciendis qui.', '2022-10-03 05:51:21', '2022-10-03 05:51:21'),
(7, 'Velit adipisci eos adipisci maiores sit distinctio dolor.', 'Sunt vitae sunt ea necessitatibus sit ullam mollitia neque. Tempore alias sequi provident esse officiis necessitatibus. Recusandae dolor culpa voluptates et itaque. Quo dolores sint ea et quas est minima.', '2022-10-03 05:51:21', '2022-10-03 05:51:21'),
(8, 'Repudiandae exercitationem repudiandae cum eos architecto eius assumenda.', 'Perspiciatis nostrum nulla sed. Non vel cumque voluptate dolor et dolor corporis. Accusantium maxime ratione iusto dolor culpa eligendi dolor. Facilis quisquam officia tempore.', '2022-10-03 05:51:21', '2022-10-03 05:51:21'),
(9, 'Harum ipsa voluptatum in odio.', 'Consequatur porro quas voluptate. Et libero sint quaerat quidem repudiandae ea. Sit molestiae est dolore nisi eum. Nostrum saepe possimus amet qui necessitatibus voluptates.', '2022-10-03 05:51:21', '2022-10-03 05:51:21'),
(10, 'Tenetur et quo ipsam vel.', 'Illo cum vitae asperiores adipisci quia. Voluptas aut aut quos id repellendus quas odio aut. Velit pariatur illo sequi id. Unde deserunt aut hic quibusdam.', '2022-10-03 05:51:21', '2022-10-03 05:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Gus Schumm II', 'gardner.robel@example.org', '$2y$10$5CUvhw58cJ9F3uPL0Rvja.C0EXIkmy8uqoQ0pepI1HVw4Y8BZ0CI6', '2022-10-03 06:31:35', '2022-10-03 06:31:35'),
(2, 'Alycia Hyatt', 'michaela.kreiger@example.org', '$2y$10$2htFGFxLRzG7vEEJpe5K5.XG1BFSHlTPO1UXeEAy5dJPoGiTfBH4i', '2022-10-03 06:31:35', '2022-10-03 06:31:35'),
(3, 'Tommie Wehner', 'nicholas91@example.org', '$2y$10$gcA1Sd01g0706hbpwix8gulwUUVp/DnsNGX3Nh8HltzpFRUBlsbVy', '2022-10-03 06:31:35', '2022-10-03 06:31:35'),
(4, 'Fredrick Bartell', 'nlemke@example.com', '$2y$10$.ZoQp.C4QViML4kZyP4ptuS8NoSf/bcrTcGWiQAmHohvzSVQfYAx2', '2022-10-03 06:31:35', '2022-10-03 06:31:35'),
(5, 'Alfred Raynor', 'lew.cummerata@example.org', '$2y$10$aeBPDXmIvD7LSNHRlPak0eaetGkkjozLyLipdJl4lXpSdei/taTZK', '2022-10-03 06:31:36', '2022-10-03 06:31:36'),
(6, 'Safi', 'safi@gmail.com', '$2y$10$BjkUdX4eWcXU7j343QxQie7MRZ4n4uL.tijL.GeaqDYuv1ThWVvxm', '2022-10-03 10:36:48', '2022-10-03 10:36:48'),
(7, 'Safi ul sahid', 'safi.sahid@gmail.com', '$2y$10$AXGeW//bW7nuVHGG.cpgcu9EBjFehBh2beI3yfQ3K7TCoVHbOHo1q', '2022-10-03 10:38:13', '2022-10-03 10:38:13'),
(8, 'rafi', 'rafi@gmail.com', '$2y$10$ql2KYs.HPH7QVNO4UjjioukR2E13u40mgglDNj2ELIILIOCj1Mnh.', '2022-10-03 11:42:49', '2022-10-03 11:42:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_password_unique` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
