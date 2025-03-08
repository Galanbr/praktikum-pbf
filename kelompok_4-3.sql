/*
 Navicat MySQL Dump SQL

 Source Server         : kelompok4
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : kelompok_4

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 08/03/2025 13:01:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_absensi
-- ----------------------------
DROP TABLE IF EXISTS `tb_absensi`;
CREATE TABLE `tb_absensi`  (
  `id_kehadiran` int NOT NULL AUTO_INCREMENT,
  `npm` int NOT NULL,
  `id_dosen` int NOT NULL,
  `id_matkul` int NOT NULL,
  `pertemuan` enum('1','2','3','4','5') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `keterangan` enum('H','I','S','A') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kehadiran`) USING BTREE,
  UNIQUE INDEX `npm_2`(`npm` ASC, `id_dosen` ASC, `id_matkul` ASC, `pertemuan` ASC) USING BTREE,
  INDEX `npm`(`npm` ASC) USING BTREE,
  INDEX `fk_matkul`(`id_matkul` ASC) USING BTREE,
  INDEX `fk _dosen`(`id_dosen` ASC) USING BTREE,
  CONSTRAINT `fk _dosen` FOREIGN KEY (`id_dosen`) REFERENCES `tb_dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_matkul` FOREIGN KEY (`id_matkul`) REFERENCES `tb_matkul` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_npm` FOREIGN KEY (`npm`) REFERENCES `tb_mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_absensi
-- ----------------------------
INSERT INTO `tb_absensi` VALUES (71, 230308, 113, 106, '1', 'S');
INSERT INTO `tb_absensi` VALUES (73, 230308, 113, 106, '2', 'S');
INSERT INTO `tb_absensi` VALUES (75, 230308, 113, 106, '3', 'S');
INSERT INTO `tb_absensi` VALUES (77, 230308, 113, 106, '4', 'S');
INSERT INTO `tb_absensi` VALUES (101, 230309, 113, 101, '1', 'S');
INSERT INTO `tb_absensi` VALUES (110, 230309, 333, 106, '1', 'S');

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `id_dosen` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  INDEX `fk_dosen`(`id_dosen` ASC) USING BTREE,
  CONSTRAINT `fk_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `tb_dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (5, 114, 'Pak Lutfi', '101010');
INSERT INTO `tb_admin` VALUES (6, 114, 'Pak Lutfi', '101010');
INSERT INTO `tb_admin` VALUES (7, 112, 'Pak Abdau', '151515');

-- ----------------------------
-- Table structure for tb_dosen
-- ----------------------------
DROP TABLE IF EXISTS `tb_dosen`;
CREATE TABLE `tb_dosen`  (
  `id_dosen` int NOT NULL AUTO_INCREMENT,
  `nama_dosen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_dosen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 445 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_dosen
-- ----------------------------
INSERT INTO `tb_dosen` VALUES (112, 'Pak Abdau');
INSERT INTO `tb_dosen` VALUES (113, 'Bu Rosita');
INSERT INTO `tb_dosen` VALUES (114, 'Pak Lutfi');
INSERT INTO `tb_dosen` VALUES (119, 'Pak Dodo');
INSERT INTO `tb_dosen` VALUES (222, 'Pak Wahyu');
INSERT INTO `tb_dosen` VALUES (333, 'Pak Dimas');
INSERT INTO `tb_dosen` VALUES (444, 'Pak Dodo');

-- ----------------------------
-- Table structure for tb_login
-- ----------------------------
DROP TABLE IF EXISTS `tb_login`;
CREATE TABLE `tb_login`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_login
-- ----------------------------
INSERT INTO `tb_login` VALUES ('fai', '45678990');
INSERT INTO `tb_login` VALUES ('galan', '3456789');
INSERT INTO `tb_login` VALUES ('iklima', '1234567');
INSERT INTO `tb_login` VALUES ('naimah', '2345678');
INSERT INTO `tb_login` VALUES ('nur', '1234567');

-- ----------------------------
-- Table structure for tb_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `tb_mahasiswa`;
CREATE TABLE `tb_mahasiswa`  (
  `npm` int NOT NULL,
  `nama_mahasiswa` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_matkul` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `jurusan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `prodi` enum('D3 TI','D4 TRET','D3 ELEKTRO','D3 LISTRIK','D4 TPPL','D4 RKS','D4 PPA','D4 AKUTANSI','') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tahun_akademik` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`npm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_mahasiswa
-- ----------------------------
INSERT INTO `tb_mahasiswa` VALUES (230302, 'alis', 'pbo', 'komputer dan bisnis', 'D4 TRET', '2023');
INSERT INTO `tb_mahasiswa` VALUES (230304, 'cois', 'sim', 'jrem', 'D3 ELEKTRO', '2023');
INSERT INTO `tb_mahasiswa` VALUES (230308, 'esna', 'matdis', 'komputer dan bisnis', 'D3 TI', '2023');
INSERT INTO `tb_mahasiswa` VALUES (230309, 'khiidir', 'pbo', 'komputer dan bisnis', 'D3 TI', '2023');

-- ----------------------------
-- Table structure for tb_matkul
-- ----------------------------
DROP TABLE IF EXISTS `tb_matkul`;
CREATE TABLE `tb_matkul`  (
  `id_matkul` int NOT NULL,
  `nama_matkul` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sks` int NULL DEFAULT NULL,
  `semester` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_matkul`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_matkul
-- ----------------------------
INSERT INTO `tb_matkul` VALUES (101, 'pbo', 2, '4 ');
INSERT INTO `tb_matkul` VALUES (102, 'alpro', 2, '4');
INSERT INTO `tb_matkul` VALUES (103, 'matdis', 2, '4');
INSERT INTO `tb_matkul` VALUES (105, 'imk', 2, '4');
INSERT INTO `tb_matkul` VALUES (106, 'alim', 2, '4');
INSERT INTO `tb_matkul` VALUES (121, 'PBF', 2, '4');

SET FOREIGN_KEY_CHECKS = 1;
