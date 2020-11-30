-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlynhasach
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `baocaocongno`
--

DROP TABLE IF EXISTS `baocaocongno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baocaocongno` (
  `MaBaoCao` int NOT NULL AUTO_INCREMENT,
  `Thang` int NOT NULL,
  `Nam` int NOT NULL,
  PRIMARY KEY (`MaBaoCao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baocaocongno`
--

LOCK TABLES `baocaocongno` WRITE;
/*!40000 ALTER TABLE `baocaocongno` DISABLE KEYS */;
INSERT INTO `baocaocongno` VALUES (1,2,2016),(2,3,2016),(3,4,2016);
/*!40000 ALTER TABLE `baocaocongno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baocaoton`
--

DROP TABLE IF EXISTS `baocaoton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baocaoton` (
  `MaBaoCao` int NOT NULL AUTO_INCREMENT,
  `Thang` int NOT NULL,
  `Nam` int NOT NULL,
  PRIMARY KEY (`MaBaoCao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baocaoton`
--

LOCK TABLES `baocaoton` WRITE;
/*!40000 ALTER TABLE `baocaoton` DISABLE KEYS */;
INSERT INTO `baocaoton` VALUES (3,4,2016),(4,3,2016),(5,2,2016),(6,1,2016);
/*!40000 ALTER TABLE `baocaoton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietbaocaocongno`
--

DROP TABLE IF EXISTS `chitietbaocaocongno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietbaocaocongno` (
  `MaBaoCao` int NOT NULL,
  `MaKhachHang` int NOT NULL,
  `SoTienNoDau` int NOT NULL DEFAULT '0',
  `SoTienNoCuoi` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaBaoCao`,`MaKhachHang`),
  KEY `FK_ChiTietBaoCaoCongNo_KhachHang` (`MaKhachHang`),
  CONSTRAINT `FK_ChiTietBaoCaoCongNo_BaoCaoCongNo` FOREIGN KEY (`MaBaoCao`) REFERENCES `baocaocongno` (`MaBaoCao`),
  CONSTRAINT `FK_ChiTietBaoCaoCongNo_KhachHang` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietbaocaocongno`
--

LOCK TABLES `chitietbaocaocongno` WRITE;
/*!40000 ALTER TABLE `chitietbaocaocongno` DISABLE KEYS */;
INSERT INTO `chitietbaocaocongno` VALUES (1,14,0,12000),(1,15,0,8000),(1,20,0,12000),(1,23,0,8000),(2,14,12000,12000),(2,15,8000,8000),(2,16,0,2000),(2,20,12000,12000),(2,21,0,20000),(2,23,8000,8000),(2,24,0,2000),(3,14,12000,12000),(3,15,8000,8000),(3,16,2000,10000),(3,20,12000,12000),(3,21,20000,20000),(3,23,8000,8000),(3,24,2000,2000);
/*!40000 ALTER TABLE `chitietbaocaocongno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietbaocaoton`
--

DROP TABLE IF EXISTS `chitietbaocaoton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietbaocaoton` (
  `MaBaoCao` int NOT NULL,
  `MaSach` int NOT NULL,
  `SoLuongTonDau` int NOT NULL DEFAULT '0',
  `SoLuongTonCuoi` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaBaoCao`,`MaSach`),
  KEY `FK_ChiTietBaoCaoTon_Sach` (`MaSach`),
  CONSTRAINT `FK_ChiTietBaoCaoTon_BaoCaoTon` FOREIGN KEY (`MaBaoCao`) REFERENCES `baocaoton` (`MaBaoCao`),
  CONSTRAINT `FK_ChiTietBaoCaoTon_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietbaocaoton`
--

LOCK TABLES `chitietbaocaoton` WRITE;
/*!40000 ALTER TABLE `chitietbaocaoton` DISABLE KEYS */;
INSERT INTO `chitietbaocaoton` VALUES (3,1,142,342),(3,2,138,288),(3,3,147,147),(3,4,149,149),(3,5,146,294),(3,6,147,297),(3,7,148,148),(3,8,148,147),(3,9,150,300),(3,10,149,149),(3,11,150,150),(3,12,147,146),(3,13,149,148),(3,14,150,150),(3,15,149,148),(3,16,150,150),(3,17,150,150),(3,18,150,150),(3,19,150,150),(3,20,150,150),(3,21,150,150),(3,23,150,150),(3,26,149,149),(3,36,150,150),(3,37,150,149),(3,38,150,150),(3,39,149,149),(3,40,150,149),(3,41,150,150),(3,42,150,150),(3,43,150,150),(3,44,150,149),(3,45,150,149),(3,46,150,149),(3,47,150,150),(3,48,149,148),(3,50,150,149),(3,51,149,149),(3,52,150,150),(3,53,149,149),(3,54,149,149),(3,55,150,150),(3,56,150,150),(3,57,149,149),(4,1,149,142),(4,2,149,138),(4,3,150,147),(4,4,149,149),(4,5,148,146),(4,6,149,147),(4,7,150,148),(4,8,149,148),(4,9,150,150),(4,10,149,149),(4,11,150,150),(4,12,147,147),(4,13,149,149),(4,14,150,150),(4,15,150,149),(4,16,150,150),(4,17,150,150),(4,18,150,150),(4,19,150,150),(4,20,150,150),(4,21,150,150),(4,23,150,150),(4,26,150,149),(4,36,150,150),(4,37,0,150),(4,38,0,150),(4,39,0,149),(4,40,0,150),(4,41,0,150),(4,42,0,150),(4,43,0,150),(4,44,0,150),(4,45,0,150),(4,46,0,150),(4,47,0,150),(4,48,0,149),(4,50,0,150),(4,51,0,149),(4,52,0,150),(4,53,0,149),(4,54,0,149),(4,55,0,150),(4,56,0,150),(4,57,0,149),(5,1,150,149),(5,2,150,149),(5,3,150,150),(5,4,150,149),(5,5,150,148),(5,6,150,149),(5,7,150,150),(5,8,150,149),(5,9,150,150),(5,10,150,149),(5,11,150,150),(5,12,150,147),(5,13,150,149),(5,14,0,150),(5,15,0,150),(5,16,0,150),(5,17,0,150),(5,18,0,150),(5,19,0,150),(5,20,0,150),(5,21,0,150),(5,23,0,150),(5,26,0,150),(5,36,0,150),(6,1,0,150),(6,2,0,150),(6,3,0,150),(6,4,0,150),(6,5,0,150),(6,6,0,150),(6,7,0,150),(6,8,0,150),(6,9,0,150),(6,10,0,150),(6,11,0,150),(6,12,0,150),(6,13,0,150);
/*!40000 ALTER TABLE `chitietbaocaoton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiethoadon` (
  `MaHoaDon` int NOT NULL,
  `MaSach` int NOT NULL,
  `SoLuong` int NOT NULL DEFAULT '0',
  `DonGia` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaHoaDon`,`MaSach`),
  KEY `FK_ChiTietHoaDon_Sach` (`MaSach`),
  CONSTRAINT `FK_ChiTietHoaDon_HoaDon` FOREIGN KEY (`MaHoaDon`) REFERENCES `hoadon` (`MaHoaDon`),
  CONSTRAINT `FK_ChiTietHoaDon_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` VALUES (1,1,5,300000),(1,2,10,240000),(2,5,2,160000),(2,40,1,92000),(3,2,1,240000),(3,6,2,50000),(4,13,1,98000),(4,48,1,90000),(5,8,1,222000),(5,15,1,270000),(5,50,1,20000),(6,10,1,212000),(7,44,1,180000),(7,45,1,180000),(7,46,1,180000),(8,38,1,106000),(9,39,1,72000),(9,54,1,240000),(10,20,1,520000),(10,57,1,108000),(11,1,2,300000),(11,3,1,220000),(11,7,2,248000),(12,5,2,160000),(12,12,3,96000),(13,12,1,96000),(13,37,1,96000),(14,1,1,300000),(14,4,1,40000),(14,6,1,50000),(14,8,1,222000),(15,3,1,220000),(15,26,1,20000),(15,51,1,20000),(15,53,1,20000),(16,5,2,160000),(16,8,1,222000),(17,3,1,220000),(17,48,1,90000),(17,57,1,108000),(18,10,1,212000),(18,56,1,86000),(19,13,1,98000),(20,2,1,240000),(21,15,1,270000);
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietphieunhap`
--

DROP TABLE IF EXISTS `chitietphieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieunhap` (
  `MaPhieuNhap` int NOT NULL ,
  `MaSach` int NOT NULL,
  `SoLuong` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaPhieuNhap`,`MaSach`),
  KEY `FK_ChiTietPhieuNhap_Sach` (`MaSach`),
  CONSTRAINT `FK_ChiTietPhieuNhap_PhieuNhap` FOREIGN KEY (`MaPhieuNhap`) REFERENCES `phieunhap` (`MaPhieuNhap`),
  CONSTRAINT `FK_ChiTietPhieuNhap_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieunhap`
--

LOCK TABLES `chitietphieunhap` WRITE;
/*!40000 ALTER TABLE `chitietphieunhap` DISABLE KEYS */;
INSERT INTO `chitietphieunhap` VALUES (2,1,150),(2,2,150),(2,3,150),(2,4,150),(2,5,150),(2,6,150),(2,7,150),(2,8,150),(2,9,150),(2,10,150),(2,11,150),(2,12,150),(2,13,150),(3,14,150),(3,15,150),(3,16,150),(3,17,150),(3,18,150),(3,19,150),(3,20,150),(3,21,150),(3,23,150),(3,26,150),(3,36,150),(4,37,150),(4,38,150),(4,39,150),(4,40,150),(4,41,150),(4,42,150),(4,43,150),(4,44,150),(4,45,150),(4,46,150),(4,47,150),(4,48,150),(4,50,150),(4,51,150),(4,52,150),(4,53,150),(4,54,150),(4,55,150),(4,56,150),(4,57,150),(5,1,200),(5,2,150),(5,5,150),(5,6,150),(5,9,150);
/*!40000 ALTER TABLE `chitietphieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitiettacgiasach`
--

DROP TABLE IF EXISTS `chitiettacgiasach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiettacgiasach` (
  `MaSach` int NOT NULL,
  `MaTacGia` int NOT NULL,
  PRIMARY KEY (`MaSach`,`MaTacGia`),
  KEY `FK_ChiTietTacGiaSach_TacGia` (`MaTacGia`),
  CONSTRAINT `FK_ChiTietTacGiaSach_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`),
  CONSTRAINT `FK_ChiTietTacGiaSach_TacGia` FOREIGN KEY (`MaTacGia`) REFERENCES `tacgia` (`MaTacGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiettacgiasach`
--

LOCK TABLES `chitiettacgiasach` WRITE;
/*!40000 ALTER TABLE `chitiettacgiasach` DISABLE KEYS */;
INSERT INTO `chitiettacgiasach` VALUES (38,1),(39,1),(58,1),(13,2),(14,3),(2,4),(17,5),(18,5),(7,6),(8,6),(9,6),(10,6),(11,6),(54,6),(5,7),(1,8),(4,9),(6,10),(48,10),(3,11),(20,12),(57,13),(12,16),(37,16),(16,18),(19,19),(55,19),(21,20),(23,21),(26,21),(50,21),(51,21),(52,21),(53,21),(36,22),(15,24),(40,25),(41,26),(42,27),(44,28),(45,28),(46,28),(47,28),(56,29);
/*!40000 ALTER TABLE `chitiettacgiasach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitiettheloaisach`
--

DROP TABLE IF EXISTS `chitiettheloaisach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiettheloaisach` (
  `MaSach` int NOT NULL,
  `MaTheLoai` int NOT NULL,
  PRIMARY KEY (`MaSach`,`MaTheLoai`),
  KEY `FK_ChiTietTheLoaiSach_TheLoai` (`MaTheLoai`),
  CONSTRAINT `FK_ChiTietTheLoaiSach_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`),
  CONSTRAINT `FK_ChiTietTheLoaiSach_TheLoai` FOREIGN KEY (`MaTheLoai`) REFERENCES `theloai` (`MaTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiettheloaisach`
--

LOCK TABLES `chitiettheloaisach` WRITE;
/*!40000 ALTER TABLE `chitiettheloaisach` DISABLE KEYS */;
INSERT INTO `chitiettheloaisach` VALUES (6,16),(12,16),(37,16),(48,16),(58,19),(7,21),(8,21),(9,21),(10,21),(11,21),(13,21),(15,21),(54,21),(5,22),(13,22),(2,23),(17,23),(18,23),(19,23),(20,23),(36,23),(55,23),(36,24),(2,25),(21,25),(36,25),(4,26),(17,27),(19,27),(36,27),(38,29),(39,29),(6,30),(12,30),(21,30),(37,30),(1,31),(40,31),(1,32),(3,32),(14,32),(23,32),(26,32),(44,32),(45,32),(46,32),(47,32),(50,32),(51,32),(52,32),(53,32),(40,33),(7,34),(44,34),(45,34),(46,34),(47,34),(23,35),(26,35),(50,35),(51,35),(52,35),(53,35),(12,36),(37,36),(2,37),(16,37),(56,37),(40,38),(57,38),(7,39),(21,39),(36,39),(57,39),(36,40),(55,40),(55,41),(10,42),(11,42),(12,42),(37,42),(54,42),(3,43),(7,43),(8,43),(9,43),(10,43),(11,43),(14,43),(44,43),(45,43),(46,43),(47,43),(3,44),(8,44),(9,44),(10,44),(44,44),(45,44),(46,44),(47,44),(43,45),(41,47),(42,47),(1,48),(2,48),(3,48),(4,48),(5,48),(6,48),(7,48),(8,48),(9,48),(10,48),(11,48),(12,48),(13,48),(14,48),(15,48),(16,48),(17,48),(18,48),(19,48),(20,48),(21,48),(36,48),(37,48),(40,48),(44,48),(45,48),(46,48),(47,48),(48,48),(54,48),(55,48),(56,48),(57,48),(2,49),(16,50);
/*!40000 ALTER TABLE `chitiettheloaisach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `MaHoaDon` int NOT NULL AUTO_INCREMENT,
  `MaKhachHang` int NOT NULL,
  `NgayLap` datetime(6) NOT NULL,
  `TienTra` int NOT NULL DEFAULT '0',
  `TongTien` int NOT NULL DEFAULT '0',
  `DaLuu` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaHoaDon`),
  KEY `FK_HoaDon_KhachHang` (`MaKhachHang`),
  CONSTRAINT `FK_HoaDon_KhachHang` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,13,'2016-03-24 12:53:14.000000',3900000,3900000,1),(2,13,'2016-04-10 12:53:44.000000',412000,412000,1),(3,16,'2016-03-28 12:54:15.000000',338000,340000,1),(4,16,'2016-04-14 12:54:38.000000',180000,188000,1),(5,14,'2016-04-24 12:55:15.000000',512000,512000,1),(6,14,'2016-02-19 12:55:29.000000',200000,212000,1),(7,17,'2016-04-01 12:56:02.000000',540000,540000,1),(8,14,'2016-05-07 12:56:20.000000',106000,106000,1),(9,24,'2016-03-22 12:56:55.000000',310000,312000,1),(10,13,'2016-05-04 12:57:37.000000',628000,628000,1),(11,18,'2016-03-25 12:58:48.000000',1316000,1316000,1),(12,23,'2016-02-10 12:59:33.000000',600000,608000,1),(13,15,'2016-04-18 13:00:07.000000',192000,192000,1),(14,20,'2016-02-25 13:02:07.000000',600000,612000,1),(15,21,'2016-03-20 13:03:02.000000',270000,280000,1),(16,13,'2016-03-01 13:10:34.000000',542000,542000,1),(17,21,'2016-03-19 13:11:09.000000',418000,418000,1),(18,14,'2016-05-01 13:11:47.000000',298000,298000,1),(19,15,'2016-02-24 13:12:03.000000',90000,98000,1),(20,15,'2016-02-14 13:12:18.000000',240000,240000,1),(21,21,'2016-03-08 13:12:41.000000',260000,270000,1);
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `MaKhachHang` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SoTienNo` int NOT NULL DEFAULT '0',
  `DiaChi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DienThoai` char(20) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `BiXoa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (13,'Khách Hàng Thông Thường',0,'<Địa chỉ>','00000000000',NULL,0),(14,'Huỳnh Chí Phong',12000,'792/4 đường Kha Vạn Cân, phường Linh Đông, quận Thủ Đức, tp Hồ Chí Minh, nước Việt Nam, tinh cầu Trái Đất, tinh hệ Thái Dương Hệ','01203875665','hiroshi.kaze1994@gmail.com',0),(15,'Võ Hoài Nam',8000,'Trên mặt đất, dưới bầu trời','00000000001',NULL,0),(16,'Tô Chính Tín',10000,'Ngoài hành tinh','0907993625',NULL,0),(17,'Lãnh Thừa Phong',0,'Có hả?','0123456789',NULL,0),(18,'Lý Thất Dạ',0,'Trong truyện Đế Bá của lão Yếm','00000000002',NULL,0),(19,'Hàn Phong',0,'Nhà e ở đâu?','00000000003','emlaai@meomeo.com',1),(20,'Dư Chính Phong',12000,'Trong não chui ra, quê quán không rõ','00000000004',NULL,0),(21,'Diệu Yến',20000,'Ai đây o.O','00000000005',NULL,0),(22,'Tiêu Viêm',0,'Đấu Phá Thương Khung/Thiên Tàm Thổ Đậu','00000000006',NULL,1),(23,'Diệp Phàm',8000,'Lý do em đến Trái Đất là gì?','00000000007',NULL,0),(24,'Hoa Thiên Cốt',2000,'Ờ thì Hoa Thiên Cốt','00000000008','tieucot@quaqua.com',0);
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phanquyen`
--

DROP TABLE IF EXISTS `phanquyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phanquyen` (
  `MaPhanQuyen` int NOT NULL AUTO_INCREMENT,
  `TenPhanQuyen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MaPhanQuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phanquyen`
--

LOCK TABLES `phanquyen` WRITE;
/*!40000 ALTER TABLE `phanquyen` DISABLE KEYS */;
INSERT INTO `phanquyen` VALUES (1,'Nhân viên'),(2,'Quản lý'),(3,'Quản trị viên');
/*!40000 ALTER TABLE `phanquyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieunhap`
--

DROP TABLE IF EXISTS `phieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieunhap` (
  `MaPhieuNhap` int NOT NULL AUTO_INCREMENT,
  `NgayNhapKho` datetime(6) NOT NULL,
  `NgayTaoPhieu` datetime(6) NOT NULL,
  `MaTaiKhoan` int NOT NULL,
  `DaNhap` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaPhieuNhap`),
  KEY `FK_PhieuNhap_TaiKhoan` (`MaTaiKhoan`),
  CONSTRAINT `FK_PhieuNhap_TaiKhoan` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieunhap`
--

LOCK TABLES `phieunhap` WRITE;
/*!40000 ALTER TABLE `phieunhap` DISABLE KEYS */;
INSERT INTO `phieunhap` VALUES (2,'2016-02-01 00:00:00.000000','2016-01-20 10:39:38.000000',4,1),(3,'2016-02-08 00:00:00.000000','2016-02-04 00:00:00.000000',4,1),(4,'2016-03-15 00:00:00.000000','2016-03-01 00:00:00.000000',4,1),(5,'2016-04-25 00:00:00.000000','2016-04-20 12:45:48.000000',4,1);
/*!40000 ALTER TABLE `phieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuthutien`
--

DROP TABLE IF EXISTS `phieuthutien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuthutien` (
  `MaPhieuThu` int NOT NULL AUTO_INCREMENT,
  `MaKhachHang` int NOT NULL,
  `NgayThu` datetime(6) NOT NULL,
  `SoTienThu` int NOT NULL DEFAULT '0',
  `MaTaiKhoan` int NOT NULL,
  PRIMARY KEY (`MaPhieuThu`),
  KEY `FK_PhieuThuTien_KhachHang` (`MaKhachHang`),
  KEY `FK_PhieuThuTien_TaiKhoan` (`MaTaiKhoan`),
  CONSTRAINT `FK_PhieuThuTien_KhachHang` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`),
  CONSTRAINT `FK_PhieuThuTien_TaiKhoan` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuthutien`
--

LOCK TABLES `phieuthutien` WRITE;
/*!40000 ALTER TABLE `phieuthutien` DISABLE KEYS */;
INSERT INTO `phieuthutien` VALUES (1,18,'2016-04-17 16:51:39.000000',20000,1);
/*!40000 ALTER TABLE `phieuthutien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quydinh`
--

DROP TABLE IF EXISTS `quydinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quydinh` (
  `MaQuyDinh` int NOT NULL AUTO_INCREMENT,
  `NgayCapNhat` datetime(6) NOT NULL,
  `SoLuongSachTonToiThieuDeNhap` int NOT NULL DEFAULT '0',
  `SoLuongSachNhapToiThieu` int NOT NULL,
  `TienNoToiDa` int NOT NULL DEFAULT '0',
  `SoLuongSachTonToiThieuSauKhiBan` int NOT NULL DEFAULT '0',
  `DuocThuVuotSoTienKhachHangDangNo` tinyint(1) NOT NULL DEFAULT '1',
  `SuDung` boolean default 'False',
  PRIMARY KEY (`MaQuyDinh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quydinh`
--

LOCK TABLES `quydinh` WRITE;
/*!40000 ALTER TABLE `quydinh` DISABLE KEYS */;
INSERT INTO `quydinh` VALUES (1,'2016-04-06 00:00:00.000000',300,150,20000,20,1);
/*!40000 ALTER TABLE `quydinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sach` (
  `MaSach` int NOT NULL AUTO_INCREMENT,
  `TenSach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AnhBia` varchar(255) DEFAULT NULL,
  `SoLuongTon` int NOT NULL DEFAULT '0',
  `DonGia` int NOT NULL DEFAULT '0',
  `BiXoa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` VALUES (1,'Kính Vạn Hoa - Trọn bộ','KVH_TronBo.png',342,300000,0),(2,'Hoa Thiên Cốt - Trọn bộ','HoaThienCot_TronBo.png',288,240000,0),(3,'Narnia - Trọn bộ','Narnia_TronBo.png',147,220000,0),(4,'Truyện Kiều','TruyenKieu.jpg',149,40000,0),(5,'Another - Trọn bộ 2 tập','Another.png',294,160000,0),(6,'5 Centimet trên giây','5cm_tren_giay.jpg',297,50000,0),(7,'Hỏa Ngục','HoaNguc.jpg',148,248000,0),(8,'Mật mã Da Vinci','DaVinciCode.jpg',147,222000,0),(9,'Biểu tượng thất truyền','BieuTuongThatTruyen.jpg',300,256000,0),(10,'Thiên thần và ác quỷ','ThienThanVaAcQuy.jpg',148,212000,0),(11,'Pháo đài số','PhaoDaiSo.jpg',150,204000,0),(12,'Sword Art Online: Aincrad - Tập 1','SAO_Aincrad1.jpg',146,96000,0),(13,'Ma sói','MaSoi.jpg',148,98000,0),(14,'Daren Shan - Trọn Bộ','DarrenShan.png',150,212000,0),(15,'Sherlock Holmes - Trọn bộ','SherlockHolmes_TronBo.png',148,270000,0),(16,'Bài học yêu của tiểu ma vương','BaiHocYeuCuaTieuMaVuong.jpg',150,110000,0),(17,'Đấu phá thương khung',NULL,150,420000,0),(18,'Đại chúa tể',NULL,150,450000,1),(19,'Đấu la đại lục',NULL,150,210000,1),(20,'Đế bá',NULL,149,520000,0),(21,'Vệ sĩ thần cấp của nữ tổng giám đốc',NULL,150,245000,1),(23,'Doraemon: Chú khủng long của Nobita','Doraemon_ChuKhungLongCuaNobita.jpg',150,20000,0),(26,'Doraemon: Vương quốc trên mây','Doraemon_VuongQuocTrenMay.jpg',149,20000,0),(36,'Yêu cung',NULL,150,366000,1),(37,'Sword Art Online: Aincrad - Tập 2','SAO_Aincrad2.jpg',149,96000,0),(38,'Bộ sách giáo khoa lớp 9','BoSachGiaoKhoaLop9.png',149,106000,0),(39,'Bộ vở bài tập lớp 9','BoVoBaiTapLop9.png',149,72000,0),(40,'Cô nàng quản trị','CoNangQuanTri.jpg',149,92000,0),(41,'Nấu ăn bằng cả trái tim','NauAnBangCaTraiTim.png',150,82000,0),(42,'Ốc đảo mùi hương','OcDaoMuiHuong.jpg',150,77000,0),(43,'Tài liệu luyện thi năng lực Nhật ngữ N5 (Kèm CD)','TaiLieuLuyenThiNangLucNhatNguN5_CD.jpg',150,50000,0),(44,'Chúa tể những chiếc nhẫn: Đoàn hộ nhẫn','CTNCN_DoanHoNhan.jpg',149,180000,0),(45,'Chúa tể những chiếc nhẫn: Hai tòa tháp','CTNCN_HaiToaThap.jpg',149,180000,0),(46,'Chúa tể những chiếc nhẫn: Nhà vua trở về','CTNCN_NhaVuaTroVe.jpg',149,180000,0),(47,'Anh Chàng Hobbit (Tái Bản 2014)','AnhChangHobbit.jpg',150,165000,0),(48,'Khu Vườn Ngôn Từ','KhuVuonNgonTu.jpg',148,90000,0),(50,'Doraemon: Nobita và chuyến phiêu lưu vào xứ quỷ','Doraemon_PhieuLuuVaoXuQuy.jpg',149,20000,0),(51,'Doraemon: Nobita ở xứ sở nghìn lẻ một đêm','Doraemon_NghinLeMotDem.jpg',149,20000,0),(52,'Doraemon: Nobita và người khổng lồ xanh','Doraemon_NguoiKhongLoXanh.jpg',150,20000,0),(53,'Doraemon: Nobita và cuộc đại thủy chiến ở xứ sở người cá','Doraemon_XuSoNguoiCa.jpg',149,20000,0),(54,'Điểm dối lừa','DeceptionPoint.jpg',149,240000,0),(55,'Đấu la đại lục 2',NULL,150,225000,1),(56,'Yêu anh hơn cả tử thần','YeuAnhHonCaTuThan.jpg',149,86000,0),(57,'Ame và Yuki: Những đứa con của sói','Ame_Yuki_wolf_children.png',148,108000,0),(58,'Sách dạy xếp hình',NULL,0,1000000,1);
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tacgia`
--

DROP TABLE IF EXISTS `tacgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tacgia` (
  `MaTacGia` int NOT NULL AUTO_INCREMENT,
  `TenTacGia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MaTacGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tacgia`
--

LOCK TABLES `tacgia` WRITE;
/*!40000 ALTER TABLE `tacgia` DISABLE KEYS */;
INSERT INTO `tacgia` VALUES (1,'Nhiều tác giả'),(2,'Fred Vargas'),(3,'Darren Shan'),(4,'Fresh Quả Quả'),(5,'Thiên Tàm Thổ Đậu'),(6,'Dan Brown'),(7,'Yukito Ayatsuji'),(8,'Nguyễn Nhật Ánh'),(9,'Nguyễn Du'),(10,'Shinkai Makoto'),(11,'Clive Staples Lewis'),(12,'Yếm Bút Tiêu Sinh'),(13,'Mamoru Hasoda'),(14,'Kobayashi Ritz'),(15,'Yonezawa Honobu'),(16,'Kawahara Reki'),(17,'Tanigawa Nagaru'),(18,'Minh Nguyệt Thính Phong'),(19,'Đường Gia Tam Thiếu'),(20,'Mai Can Thái Thiếu Bính'),(21,'Fujiko F. Fujio'),(22,'Minh Nguyệt'),(24,'Conan Doyle'),(25,'Iwasaki Natsumi'),(26,'Christine Hà'),(27,'Huỳnh Hải Yến'),(28,'J.R.R Tolkien'),(29,'Tào Đình');
/*!40000 ALTER TABLE `tacgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `MaTaiKhoan` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `MatKhau` varchar(50) NOT NULL,
  `HoTen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MaPhanQuyen` int NOT NULL,
  `BiXoa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaTaiKhoan`),
  KEY `FK_TaiKhoan_PhanQuyen` (`MaPhanQuyen`),
  CONSTRAINT `FK_TaiKhoan_PhanQuyen` FOREIGN KEY (`MaPhanQuyen`) REFERENCES `phanquyen` (`MaPhanQuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` VALUES (1,'NhanVien1@gmail.com','16097e1c44d61a3e23e146f74915b797','Test 1',1,0),(2,'NhanVien2@gmail.com','388336ca45a680db9bb58919c74fcfdf','Test 2',1,0),(3,'NhanVien3@gmail.com','84269779782d15f40a55fe197490c514','Test 3',1,0),(4,'QuanLy@gmail.com','00b325db6bf1189a540d515bb87d963d','Test 4',2,0),(5,'QuanTri@gmail.com','fff84a084c578d9068b432bb45136377','Test 5',3,0);
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloai`
--

DROP TABLE IF EXISTS `theloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloai` (
  `MaTheLoai` int NOT NULL AUTO_INCREMENT,
  `TenTheLoai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MaTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloai`
--

LOCK TABLES `theloai` WRITE;
/*!40000 ALTER TABLE `theloai` DISABLE KEYS */;
INSERT INTO `theloai` VALUES (1,'1+'),(2,'2+'),(3,'3+'),(4,'4+'),(5,'5+'),(6,'6+'),(7,'7+'),(8,'8+'),(9,'9+'),(10,'10+'),(11,'11+'),(12,'12+'),(13,'13+'),(14,'14+'),(15,'15+'),(16,'16+'),(17,'17+'),(18,'18+'),(19,'69+'),(20,'96+'),(21,'Trinh Thám'),(22,'Kinh Dị'),(23,'Huyền Huyễn'),(24,'Dị Giới'),(25,'Tu Tiên'),(26,'Thơ'),(27,'Xuyên Không'),(28,'Trùng Sinh'),(29,'Sách Giáo Khoa'),(30,'Lãng Mạng'),(31,'Học Trò'),(32,'Thiếu Nhi'),(33,'Thể Thao'),(34,'Hư Cấu'),(35,'Truyện Tranh, Comic, Manga'),(36,'Game'),(37,'Ngôn Tình'),(38,'Đời Thường'),(39,'Giả Tưởng'),(40,'Tiên Hiệp'),(41,'Huyền Ảo'),(42,'Khoa Học Giả Tưởng'),(43,'Kỳ Ảo'),(44,'Sử Thi'),(45,'Sách Học Ngoại Ngữ'),(46,'Từ Điển'),(47,'Sách Thường Thức - Đời Sống'),(48,'Sách Văn Học - Truyện Ngắn - Tiểu Thuyết'),(49,'Ngược'),(50,'Siêu năng lực');
/*!40000 ALTER TABLE `theloai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-30 16:19:18
