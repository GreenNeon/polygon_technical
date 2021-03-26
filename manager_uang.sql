-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 26, 2021 at 05:57 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ta_theo`
--
CREATE DATABASE IF NOT EXISTS `ta_theo` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_cs;
USE `ta_theo`;

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

DROP TABLE IF EXISTS `alamat`;
CREATE TABLE IF NOT EXISTS `alamat` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alamat` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rt` int(11) NOT NULL,
  `rw` int(11) NOT NULL,
  `provinsi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota_kabupaten` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_pos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE IF NOT EXISTS `jadwal` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mulai` datetime NOT NULL,
  `berhenti` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `mulai`, `berhenti`, `created_at`, `updated_at`) VALUES
(12, '2021-02-01 00:00:00', '2021-02-28 00:00:00', '2021-02-06 04:21:20', '2021-02-06 04:21:20'),
(34, '2021-02-01 00:00:00', '2021-02-28 00:00:00', '2021-02-13 07:17:58', '2021-02-13 07:17:58'),
(35, '2021-02-01 00:00:00', '2021-02-28 00:00:00', '2021-02-13 07:23:00', '2021-02-13 10:27:35'),
(39, '2021-02-01 00:00:00', '2021-02-28 00:00:00', '2021-02-13 11:05:57', '2021-02-13 23:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
CREATE TABLE IF NOT EXISTS `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(52) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pegawai_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jadwal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jurusan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kelas` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kelas_pegawai_id_foreign` (`pegawai_id`),
  KEY `kelas_jadwal_id_foreign` (`jadwal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama`, `pegawai_id`, `jadwal_id`, `jurusan`, `kode_kelas`, `created_at`, `updated_at`) VALUES
(10, 'Spc 2020', 1, 12, 'IPA', '10', '2021-02-06 04:21:20', '2021-02-06 04:21:20');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_pelajaran`
--

DROP TABLE IF EXISTS `kelas_pelajaran`;
CREATE TABLE IF NOT EXISTS `kelas_pelajaran` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hari` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Senin',
  `kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pelajaran_id` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kelas_pelajaran_kelas_id_foreign` (`kelas_id`),
  KEY `kelas_pelajaran_pelajaran_id_foreign` (`pelajaran_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas_pelajaran`
--

INSERT INTO `kelas_pelajaran` (`id`, `hari`, `kelas_id`, `pelajaran_id`) VALUES
(1, 'Kamis', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_siswa`
--

DROP TABLE IF EXISTS `kelas_siswa`;
CREATE TABLE IF NOT EXISTS `kelas_siswa` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kelas_siswa_kelas_id_foreign` (`kelas_id`),
  KEY `kelas_siswa_siswa_id_foreign` (`siswa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas_siswa`
--

INSERT INTO `kelas_siswa` (`id`, `kelas_id`, `siswa_id`) VALUES
(9, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_11_24_053516_alamat', 1),
(7, '2020_11_24_053518_siswa', 1),
(8, '2020_11_24_054122_orangtua', 1),
(9, '2020_11_24_054652_pegawai', 1),
(10, '2021_01_10_120115_pelajaran', 1),
(11, '2021_01_10_120219_jadwal', 1),
(12, '2021_01_10_120227_kelas', 1),
(13, '2021_01_10_120249_nilai', 1),
(14, '2021_01_10_122431_pembayaran', 1),
(15, '2021_01_13_084131_create_sessions_table', 1),
(16, '2021_01_15_110038_orangtua_siswa_table', 1),
(17, '2021_02_06_042926_kelas_siswa', 2),
(18, '2021_03_15_022326_kelas_pelajaran', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

DROP TABLE IF EXISTS `nilai`;
CREATE TABLE IF NOT EXISTS `nilai` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `master_id` bigint(20) UNSIGNED DEFAULT NULL,
  `semester` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai` double(8,2) DEFAULT NULL,
  `kkm` double(8,2) DEFAULT NULL,
  `praktek` double DEFAULT NULL,
  `kkm_praktek` double DEFAULT NULL,
  `catatan` longtext COLLATE utf8mb4_unicode_ci,
  `kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pelajaran_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nilai_kelas_id_foreign` (`kelas_id`),
  KEY `nilai_siswa_id_foreign` (`siswa_id`),
  KEY `nilai_pelajaran_id_foreign` (`pelajaran_id`),
  KEY `master` (`master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `master_id`, `semester`, `nilai`, `kkm`, `praktek`, `kkm_praktek`, `catatan`, `kelas_id`, `siswa_id`, `pelajaran_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '1', NULL, 77.81, NULL, 60, NULL, 10, NULL, 1, '2021-02-18 17:00:00', '2021-03-14 18:37:02'),
(2, 1, '1', 90.00, 77.80, 85, 65, 'Baik.', 10, 1, 1, '2021-02-18 17:00:00', '2021-02-18 17:00:00'),
(30, NULL, '1', NULL, 65.10, NULL, 60, NULL, 10, NULL, 2, '2021-03-14 18:35:15', '2021-03-14 18:38:00'),
(31, 30, '1', 89.70, 65.10, 65, 64, 'Baik Sekali.', 10, 1, 2, '2021-03-14 18:47:30', '2021-03-14 18:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `orangtua`
--

DROP TABLE IF EXISTS `orangtua`;
CREATE TABLE IF NOT EXISTS `orangtua` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pendidikan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orangtua_alamat_id_foreign` (`alamat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orangtua`
--

INSERT INTO `orangtua` (`id`, `nama`, `nik`, `tanggal_lahir`, `tempat_lahir`, `jenis_kelamin`, `pekerjaan`, `pendidikan`, `email`, `telepon`, `no_hp`, `alamat_id`, `created_at`, `updated_at`) VALUES
(2, 'Fileal Vilo', '812382183218', '1980-09-21', 'Jakarta', 'Perempuan', 'Rodi', 'TK', 'fileal@email.com', '0123123218', '123981283128', NULL, '2021-01-19 01:42:00', '2021-01-19 01:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `orangtua_siswa`
--

DROP TABLE IF EXISTS `orangtua_siswa`;
CREATE TABLE IF NOT EXISTS `orangtua_siswa` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orangtua_id` bigint(20) UNSIGNED DEFAULT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orangtua_siswa_orangtua_id_foreign` (`orangtua_id`),
  KEY `orangtua_siswa_siswa_id_foreign` (`siswa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orangtua_siswa`
--

INSERT INTO `orangtua_siswa` (`id`, `orangtua_id`, `siswa_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE IF NOT EXISTS `pegawai` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pendidikan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `alamat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pegawai_user_id_foreign` (`user_id`),
  KEY `pegawai_alamat_id_foreign` (`alamat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nip`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `agama`, `pendidikan`, `status`, `user_id`, `alamat_id`, `created_at`, `updated_at`) VALUES
(1, '111.222.119.01', 'Unifi Zero', 'Laki-Laki', 'Bandung', '1985-01-21', 'Khatolik', 'Universitas STIK', 'OK', 9, NULL, '2021-01-19 02:09:26', '2021-01-19 02:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran`
--

DROP TABLE IF EXISTS `pelajaran`;
CREATE TABLE IF NOT EXISTS `pelajaran` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10',
  `pegawai_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deskripsi` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pegawai_id_index` (`pegawai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelajaran`
--

INSERT INTO `pelajaran` (`id`, `nama`, `kelas`, `pegawai_id`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Bahasa Indonesia', '10', 1, 'Belajar bahasa indonesia.', '2021-01-21 00:41:16', '2021-01-21 00:41:16'),
(2, 'Matematika', '10', NULL, 'Matematika.', '2021-03-14 17:39:55', '2021-03-14 17:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` double(8,2) NOT NULL,
  `deskripsi` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jadwal_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pembayaran_siswa_id_foreign` (`siswa_id`),
  KEY `pembayaran_jadwal_id_foreign` (`jadwal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `nama`, `nominal`, `deskripsi`, `status`, `siswa_id`, `jadwal_id`, `created_at`, `updated_at`) VALUES
(6, 'Uang SPP Kelas 10 2021#1', 100000.00, '\r\n\r\nLorem ipsum dolor sit amet. ', 'Lunas', NULL, 39, '2021-02-13 11:05:57', '2021-02-13 23:53:12'),
(8, 'Uang SPP Kelas 10 2021#1', 100000.00, '\r\n\r\nLorem ipsum dolor sit amet. ', 'Belum Lunas', 1, 39, '2021-02-13 11:22:58', '2021-02-14 00:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7KvCY4PBh3ZpQ836CwYtaEwY99mNEsfPGTDPeMnC', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoibTdnMWs0OElpcURvaWVud1BXYTY3RkJYc0N6VUtKV3paaHR2akN2bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFNFZ1JRM0VpTE5iRkxpNVV2dUtvaWV2Vk5kWEVFbXhyaHlaUDZ6eUlsR2VMa0puTWtBVmZ1IjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRTRWdSUTNFaUxOYkZMaTVVdnVLb2lldlZOZFhFRW14cmh5WlA2enlJbEdlTGtKbk1rQVZmdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL25pbGFpLzEvc2lzd2E/dW5kZWZpbmVkPTEwIjt9fQ==', 1616720070),
('va7tUQr7qRVPkUw1hf13KeJ2RLscqv2IFfvdzWtq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibGtNRDUzTmlDQmhVWTZKYmlBUFJpdHNRbnJvM3RwSUdNNHVDZXpxMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1616733647);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
CREATE TABLE IF NOT EXISTS `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `alamat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `siswa_user_id_foreign` (`user_id`),
  KEY `siswa_alamat_id_foreign` (`alamat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nama`, `jenis_kelamin`, `nis`, `nisn`, `nik`, `tempat_lahir`, `tanggal_lahir`, `agama`, `status`, `user_id`, `alamat_id`, `created_at`, `updated_at`) VALUES
(1, 'Erza Vilo', 'Laki-Laki', '1001.118.01', '12312312312312', '1231231231231', 'Jakarta', '2021-01-05', 'Kristen', 'OK', 2, NULL, '2021-01-18 08:54:24', '2021-01-18 08:54:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `role` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super@admin.com', NULL, '$2y$10$SEgRQ3EiLNbFLi5UvuKoievVNdXEEmxrhyZP6zyIlGeLkJnMkAVfu', NULL, NULL, 'Nb520lChKmPVWJQgc7XjI2Ks97U6DhtW43p7Cqr1d4bnJbGl2G0Ok9tN8aZk', NULL, NULL, 'SA', '2021-01-18 08:53:46', '2021-01-18 08:53:46'),
(2, 'Erza Vilo', '1001.118.01@siswa.com', NULL, '$2y$10$5xWBp7IRRSs8X1TREVS.We4ZoBA6V0JzzNB/bTIju9FSO.R3FEvRq', NULL, NULL, '5fltySz2QARGS9khQF2Nxb3FY2w2FrjxBThNy8gBKM8uLjCSxlr74WiTUCvS', NULL, NULL, 'SW', '2021-01-18 08:54:24', '2021-01-18 08:54:24'),
(8, 'Orangtua-1', '1001.118.01@ortu.com', NULL, '$2y$10$RmN5gaOgQxaYEZHB8lLpz.p3G8.35B0fKnmwfAtQrVsWz79XakMQ6', NULL, NULL, NULL, NULL, NULL, 'OR', '2021-01-19 01:47:07', '2021-01-19 01:47:07'),
(9, 'Unifi Zero', '111.222.119.01@admin.com', NULL, '$2y$10$FBubtkCLjdATy8kr.gM79utJg60mzdSXGWYormeyZwP/mIejqmyuK', NULL, NULL, NULL, NULL, NULL, 'AD', '2021-01-19 02:09:26', '2021-01-19 02:09:26');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kelas_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kelas_pelajaran`
--
ALTER TABLE `kelas_pelajaran`
  ADD CONSTRAINT `kelas_pelajaran_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kelas_pelajaran_pelajaran_id_foreign` FOREIGN KEY (`pelajaran_id`) REFERENCES `pelajaran` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD CONSTRAINT `kelas_siswa_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kelas_siswa_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_master_id_foreign` FOREIGN KEY (`master_id`) REFERENCES `nilai` (`id`),
  ADD CONSTRAINT `nilai_pelajaran_id_foreign` FOREIGN KEY (`pelajaran_id`) REFERENCES `pelajaran` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orangtua`
--
ALTER TABLE `orangtua`
  ADD CONSTRAINT `orangtua_alamat_id_foreign` FOREIGN KEY (`alamat_id`) REFERENCES `alamat` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orangtua_siswa`
--
ALTER TABLE `orangtua_siswa`
  ADD CONSTRAINT `orangtua_siswa_orangtua_id_foreign` FOREIGN KEY (`orangtua_id`) REFERENCES `orangtua` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orangtua_siswa_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_alamat_id_foreign` FOREIGN KEY (`alamat_id`) REFERENCES `alamat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pegawai_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pelajaran`
--
ALTER TABLE `pelajaran`
  ADD CONSTRAINT `pegawai_constraint` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembayaran_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_alamat_id_foreign` FOREIGN KEY (`alamat_id`) REFERENCES `alamat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `siswa_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
