CREATE DATABASE  IF NOT EXISTS `db_inventori` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_inventori`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_inventori
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `jenis` char(1) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `id_satuan` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `harga` int NOT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `fk_barang_satuan` (`id_satuan`),
  CONSTRAINT `fk_barang_satuan` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` VALUES (1,'M','Beras Premium',2,1,14000),(2,'M','Minyak Goreng',3,1,18000),(3,'M','Mie Instan',4,1,115000),(4,'K','Sabun Cuci Piring',1,1,9000),(5,'K','Deterjen Bubuk',1,0,22000);
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_penerimaan`
--

DROP TABLE IF EXISTS `detail_penerimaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_penerimaan` (
  `id_detail_penerimaan` bigint NOT NULL AUTO_INCREMENT,
  `id_penerimaan` bigint NOT NULL,
  `id_barang` int NOT NULL,
  `jumlah_terima` int NOT NULL,
  `harga_satuan_terima` int NOT NULL,
  `sub_total_terima` int NOT NULL,
  PRIMARY KEY (`id_detail_penerimaan`),
  KEY `fk_detpenerimaan_penerimaan` (`id_penerimaan`),
  KEY `fk_detpenerimaan_barang` (`id_barang`),
  CONSTRAINT `fk_detpenerimaan_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `fk_detpenerimaan_penerimaan` FOREIGN KEY (`id_penerimaan`) REFERENCES `penerimaan` (`id_penerimaan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_penerimaan`
--

LOCK TABLES `detail_penerimaan` WRITE;
/*!40000 ALTER TABLE `detail_penerimaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_penerimaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_pengadaan`
--

DROP TABLE IF EXISTS `detail_pengadaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_pengadaan` (
  `id_detail_pengadaan` bigint NOT NULL AUTO_INCREMENT,
  `harga_satuan` int NOT NULL,
  `jumlah` int NOT NULL,
  `sub_total` int NOT NULL,
  `id_barang` int NOT NULL,
  `id_pengadaan` bigint NOT NULL,
  PRIMARY KEY (`id_detail_pengadaan`),
  KEY `fk_detpengadaan_barang` (`id_barang`),
  KEY `fk_detpengadaan_pengadaan` (`id_pengadaan`),
  CONSTRAINT `fk_detpengadaan_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `fk_detpengadaan_pengadaan` FOREIGN KEY (`id_pengadaan`) REFERENCES `pengadaan` (`id_pengadaan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_pengadaan`
--

LOCK TABLES `detail_pengadaan` WRITE;
/*!40000 ALTER TABLE `detail_pengadaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_pengadaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_penjualan`
--

DROP TABLE IF EXISTS `detail_penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_penjualan` (
  `id_detail_penjualan` bigint NOT NULL AUTO_INCREMENT,
  `harga_satuan` int NOT NULL,
  `jumlah` int NOT NULL,
  `subtotal` int NOT NULL,
  `id_penjualan` int NOT NULL,
  `id_barang` int NOT NULL,
  PRIMARY KEY (`id_detail_penjualan`),
  KEY `fk_detpenjualan_penjualan` (`id_penjualan`),
  KEY `fk_detpenjualan_barang` (`id_barang`),
  CONSTRAINT `fk_detpenjualan_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `fk_detpenjualan_penjualan` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_penjualan`
--

LOCK TABLES `detail_penjualan` WRITE;
/*!40000 ALTER TABLE `detail_penjualan` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_retur`
--

DROP TABLE IF EXISTS `detail_retur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_retur` (
  `id_detail_retur` int NOT NULL AUTO_INCREMENT,
  `jumlah` int NOT NULL,
  `alasan` varchar(200) NOT NULL,
  `id_retur` bigint NOT NULL,
  `id_detail_penerimaan` bigint NOT NULL,
  PRIMARY KEY (`id_detail_retur`),
  KEY `fk_detretur_retur` (`id_retur`),
  KEY `fk_detretur_detpenerimaan` (`id_detail_penerimaan`),
  CONSTRAINT `fk_detretur_detpenerimaan` FOREIGN KEY (`id_detail_penerimaan`) REFERENCES `detail_penerimaan` (`id_detail_penerimaan`),
  CONSTRAINT `fk_detretur_retur` FOREIGN KEY (`id_retur`) REFERENCES `retur` (`id_retur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_retur`
--

LOCK TABLES `detail_retur` WRITE;
/*!40000 ALTER TABLE `detail_retur` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_retur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kartu_stok`
--

DROP TABLE IF EXISTS `kartu_stok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kartu_stok` (
  `id_kartu_stok` bigint NOT NULL AUTO_INCREMENT,
  `jenis_transaksi` char(1) NOT NULL,
  `masuk` int NOT NULL DEFAULT '0',
  `keluar` int NOT NULL DEFAULT '0',
  `stock` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_transaksi` int NOT NULL,
  `id_barang` int NOT NULL,
  PRIMARY KEY (`id_kartu_stok`),
  KEY `fk_kartustok_barang` (`id_barang`),
  CONSTRAINT `fk_kartustok_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kartu_stok`
--

LOCK TABLES `kartu_stok` WRITE;
/*!40000 ALTER TABLE `kartu_stok` DISABLE KEYS */;
/*!40000 ALTER TABLE `kartu_stok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `margin_penjualan`
--

DROP TABLE IF EXISTS `margin_penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `margin_penjualan` (
  `id_margin` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `persen` double NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `id_user` int NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_margin`),
  KEY `fk_margin_user` (`id_user`),
  CONSTRAINT `fk_margin_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `margin_penjualan`
--

LOCK TABLES `margin_penjualan` WRITE;
/*!40000 ALTER TABLE `margin_penjualan` DISABLE KEYS */;
INSERT INTO `margin_penjualan` VALUES (1,'2026-01-01 01:00:00',5,0,4,NULL),(2,'2026-03-01 01:00:00',8,0,4,NULL),(3,'2026-06-01 01:00:00',10,0,1,NULL),(4,'2026-08-01 01:00:00',12,0,1,NULL),(5,'2026-10-01 01:00:00',15,1,4,NULL);
/*!40000 ALTER TABLE `margin_penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerimaan`
--

DROP TABLE IF EXISTS `penerimaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penerimaan` (
  `id_penerimaan` bigint NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL,
  `id_pengadaan` bigint NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_penerimaan`),
  KEY `fk_penerimaan_pengadaan` (`id_pengadaan`),
  KEY `fk_penerimaan_user` (`id_user`),
  CONSTRAINT `fk_penerimaan_pengadaan` FOREIGN KEY (`id_pengadaan`) REFERENCES `pengadaan` (`id_pengadaan`),
  CONSTRAINT `fk_penerimaan_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaan`
--

LOCK TABLES `penerimaan` WRITE;
/*!40000 ALTER TABLE `penerimaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengadaan`
--

DROP TABLE IF EXISTS `pengadaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengadaan` (
  `id_pengadaan` bigint NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` int NOT NULL,
  `status` char(1) NOT NULL,
  `id_vendor` int NOT NULL,
  `subtotal_nilai` int NOT NULL,
  `ppn` int NOT NULL,
  `total_nilai` int NOT NULL,
  PRIMARY KEY (`id_pengadaan`),
  KEY `fk_pengadaan_user` (`id_user`),
  KEY `fk_pengadaan_vendor` (`id_vendor`),
  CONSTRAINT `fk_pengadaan_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `fk_pengadaan_vendor` FOREIGN KEY (`id_vendor`) REFERENCES `vendor` (`id_vendor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengadaan`
--

LOCK TABLES `pengadaan` WRITE;
/*!40000 ALTER TABLE `pengadaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengadaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penjualan`
--

DROP TABLE IF EXISTS `penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penjualan` (
  `id_penjualan` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subtotal_nilai` int NOT NULL,
  `ppn` int NOT NULL,
  `total_nilai` int NOT NULL,
  `id_user` int NOT NULL,
  `id_margin` int NOT NULL,
  PRIMARY KEY (`id_penjualan`),
  KEY `fk_penjualan_user` (`id_user`),
  KEY `fk_penjualan_margin` (`id_margin`),
  CONSTRAINT `fk_penjualan_margin` FOREIGN KEY (`id_margin`) REFERENCES `margin_penjualan` (`id_margin`),
  CONSTRAINT `fk_penjualan_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjualan`
--

LOCK TABLES `penjualan` WRITE;
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;
/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retur`
--

DROP TABLE IF EXISTS `retur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retur` (
  `id_retur` bigint NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_penerimaan` bigint NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_retur`),
  KEY `fk_retur_penerimaan` (`id_penerimaan`),
  KEY `fk_retur_user` (`id_user`),
  CONSTRAINT `fk_retur_penerimaan` FOREIGN KEY (`id_penerimaan`) REFERENCES `penerimaan` (`id_penerimaan`),
  CONSTRAINT `fk_retur_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retur`
--

LOCK TABLES `retur` WRITE;
/*!40000 ALTER TABLE `retur` DISABLE KEYS */;
/*!40000 ALTER TABLE `retur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(100) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Kasir'),(3,'Petugas Gudang'),(4,'Manajer'),(5,'Supervisor');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satuan`
--

DROP TABLE IF EXISTS `satuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `satuan` (
  `id_satuan` int NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(45) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satuan`
--

LOCK TABLES `satuan` WRITE;
/*!40000 ALTER TABLE `satuan` DISABLE KEYS */;
INSERT INTO `satuan` VALUES (1,'Pcs',1),(2,'Kilogram',1),(3,'Liter',1),(4,'Dus',1),(5,'Lusin',0);
/*!40000 ALTER TABLE `satuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_user_role` (`id_role`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9',1),(2,'kasir1','f02b7c1e519e4fa436147f7e1399974f9510aa9c8e0cb8be29151eb540f9d214',2),(3,'gudang1','1a62eac618f519df0f710271f67285afe8bab689f9c7d902157c50a9c90f4f9e',3),(4,'manajer1','67bc280813ebd4ef7d0e23ad4b08c6a8f48a1239339247744a97cb1222039e21',4),(5,'supervisor1','4e4c56e4a15f89f05c2f4c72613da2a18c9665d4f0d6acce16415eb06f9be776',5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `id_vendor` int NOT NULL AUTO_INCREMENT,
  `nama_vendor` varchar(100) NOT NULL,
  `badan_hukum` char(1) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id_vendor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'PT Sumber Pangan Makmu','Y','A'),(2,'PT Indo Rumah Sejahtera','Y','A'),(3,'CV Berkah Sentosa','Y','A'),(4,'Toko Grosir Pak Harjo','N','A'),(5,'UD Tani Jaya','N','N');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-09 14:41:24
