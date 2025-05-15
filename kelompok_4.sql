-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2025 at 07:37 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kelompok_4`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentikasi`
--

CREATE TABLE `authentikasi` (
  `id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authentikasi`
--

INSERT INTO `authentikasi` (`id`, `email`, `password`) VALUES
(1, 'muhammadrifai3776@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'bayu@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` int UNSIGNED NOT NULL,
  `nama_mahasiswa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_matkul` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jurusan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodi` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_akademik` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2025-02-25-004808', 'App\\Database\\Migrations\\Kehadiran', 'default', 'App', 1746507098, 1),
(2, '2025-02-25-022329', 'App\\Database\\Migrations\\Mahasiswa', 'default', 'App', 1746507098, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_absensi`
--

CREATE TABLE `tb_absensi` (
  `id_kehadiran` int NOT NULL,
  `npm` int NOT NULL,
  `id_dosen` int NOT NULL,
  `id_matkul` int NOT NULL,
  `pertemuan` enum('1','2','3','4','5') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `keterangan` enum('H','I','S','A') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_absensi`
--

INSERT INTO `tb_absensi` (`id_kehadiran`, `npm`, `id_dosen`, `id_matkul`, `pertemuan`, `keterangan`) VALUES
(59, 230308, 114, 106, '5', 'H');

-- --------------------------------------------------------

--
-- Table structure for table `tb_dosen`
--

CREATE TABLE `tb_dosen` (
  `id_dosen` int NOT NULL,
  `nama_dosen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_dosen`
--

INSERT INTO `tb_dosen` (`id_dosen`, `nama_dosen`) VALUES
(114, 'Pak Lutfi'),
(222, 'Pak Wahyu'),
(224, 'Pak Yanto'),
(227, 'pak gofar'),
(228, 'pak hamdan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `npm` int NOT NULL,
  `nama_mahasiswa` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_matkul` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jurusan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prodi` enum('D3 TI','D4 TRET','D3 ELEKTRO','D3 LISTRIK','D4 TPPL','D4 RKS','D4 PPA','D4 AKUTANSI','') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tahun_akademik` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`npm`, `nama_mahasiswa`, `nama_matkul`, `jurusan`, `prodi`, `tahun_akademik`) VALUES
(230308, 'YUNI', 'alpro', 'komputer dan bisnis', 'D3 TI', '2024'),
(230309, 'yanto', 'alpro', 'konputer dan bisnis', 'D3 ELEKTRO', '2022'),
(230310, 'yanto', 'alpro', 'konputer dan bisnis', 'D3 ELEKTRO', '2022'),
(230314, 'budiman', 'RPL', 'komputer dan bisnis', 'D4 RKS', '2024');

-- --------------------------------------------------------

--
-- Table structure for table `tb_matkul`
--

CREATE TABLE `tb_matkul` (
  `id_matkul` int NOT NULL,
  `nama_matkul` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sks` int DEFAULT NULL,
  `semester` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_matkul`
--

INSERT INTO `tb_matkul` (`id_matkul`, `nama_matkul`, `sks`, `semester`) VALUES
(101, 'basis data', 4, '4'),
(102, 'JARKOM', 4, '4'),
(103, 'RPL', 4, '3'),
(105, 'imk', 2, '4'),
(106, 'alim', 2, '4'),
(107, 'SIM', 2, '4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('mahasiswa','dosen','admin') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `role`, `created_at`, `email`) VALUES
(1, '$2y$10$jU6W24nNLFPGLFzWVUxlM.vwUYYeWtNURE0J3c4SdzkqRcSG96nVq', 'admin', '2025-04-25 14:20:51', 'admin@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentikasi`
--
ALTER TABLE `authentikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD PRIMARY KEY (`id_kehadiran`) USING BTREE,
  ADD KEY `npm` (`npm`) USING BTREE,
  ADD KEY `fk_matkul` (`id_matkul`) USING BTREE,
  ADD KEY `fk_dosen` (`id_dosen`) USING BTREE;

--
-- Indexes for table `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD PRIMARY KEY (`id_dosen`) USING BTREE;

--
-- Indexes for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`npm`) USING BTREE;

--
-- Indexes for table `tb_matkul`
--
ALTER TABLE `tb_matkul`
  ADD PRIMARY KEY (`id_matkul`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authentikasi`
--
ALTER TABLE `authentikasi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `npm` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  MODIFY `id_kehadiran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tb_dosen`
--
ALTER TABLE `tb_dosen`
  MODIFY `id_dosen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  MODIFY `npm` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230315;

--
-- AUTO_INCREMENT for table `tb_matkul`
--
ALTER TABLE `tb_matkul`
  MODIFY `id_matkul` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD CONSTRAINT `fk_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `tb_dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matkul` FOREIGN KEY (`id_matkul`) REFERENCES `tb_matkul` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_npm` FOREIGN KEY (`npm`) REFERENCES `tb_mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
