/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - nuansa_hijau
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nuansa_hijau` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `nuansa_hijau`;

/*Table structure for table `katalog` */

DROP TABLE IF EXISTS `katalog`;

CREATE TABLE `katalog` (
  `id_katalog` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_katalog` VARCHAR(64) NOT NULL,
  `slug` VARCHAR(64) NOT NULL,
  `deskripsi` TEXT NOT NULL,
  PRIMARY KEY (`id_katalog`)
) ENGINE=INNODB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `katalog` */

INSERT  INTO `katalog`(`id_katalog`,`nama_katalog`,`slug`,`deskripsi`) VALUES 
(10,'MAKANAN','MAKANAN',''),
(11,'MINUMAN','MINUMAN',''),
(12,'CEMILAN','CEMILAN','');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id_order` INT(11) NOT NULL AUTO_INCREMENT,
  `resi` VARCHAR(16) NOT NULL,
  `pembeli_id` INT(11) NOT NULL,
  `total_harga` DOUBLE(16,0) NOT NULL,
  `status` ENUM('0','1','2') NOT NULL,
  `kirim_ke` TEXT NOT NULL,
  `terbaca` ENUM('0','1','2') NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_order`)
) ENGINE=INNODB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `order` */

INSERT  INTO `order`(`id_order`,`resi`,`pembeli_id`,`total_harga`,`status`,`kirim_ke`,`terbaca`,`created_at`,`updated_at`) VALUES 
(14,'1492986210',0,150000,'0','Bandar Lampung, KOTA : Banadr Lampung, PROFINSI : LAMPUNG, KODEPOS : 1234567','0','2024-04-24 00:23:30','2024-04-24 00:23:30'),
(15,'1492986242',0,70000,'0','Bandar Lampung, KOTA : Bandar Lampung, PROFINSI : LAMPUNG, KODEPOS : 1234567','0','2024-04-24 00:24:02','2024-04-24 00:24:02'),
(16,'1492986284',0,120000,'0','Bandar Lampung, KOTA : Bandar Lampung, PROFINSI : LAMPUNG, KODEPOS : 1234567','0','2024-04-24 00:24:44','2024-04-24 00:24:44'),
(17,'1492986338',0,70000,'0','Bandar Lampung, KOTA : Bandar Lampung, PROFINSI : LAMPUNG, KODEPOS : 1234567','0','2024-04-24 00:25:38','2024-04-24 00:25:38'),
(18,'1492986376',0,150000,'0','Bandar Lampung, KOTA : Bandar lampung, PROFINSI : LAMPUNG, KODEPOS : 1234567','0','2024-04-24 00:26:16','2024-04-24 00:26:16'),
(19,'1492986445',0,250000,'0','Bandar Lampung, KOTA : Bandar Lampung, PROFINSI : LAMPUNG, KODEPOS : 1234567','0','2024-04-24 00:27:25','2024-04-24 00:27:25'),
(20,'1704274514',3,22700514,'2','Bandar Lampung, KOTA : Bandar Lampung, PROFINSI : LAMPUNG, KODEPOS : 314141','0','2024-01-03 16:40:03','2024-01-03 10:35:14'),
(21,'1704274923',3,4000923,'0','Bandar Lampung, KOTA : Bandar Lampung, PROFINSI : LAMPUNG, KODEPOS : 314141','0','2024-01-03 10:42:03','2024-01-03 10:42:03');

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `id_ordetail` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `produk_id` INT(11) NOT NULL,
  `produk_harga` DOUBLE(16,0) NOT NULL,
  `qty` TINYINT(4) NOT NULL,
  `subtotal` DOUBLE(16,0) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id_ordetail`)
) ENGINE=INNODB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `orderdetail` */

INSERT  INTO `orderdetail`(`id_ordetail`,`order_id`,`produk_id`,`produk_harga`,`qty`,`subtotal`,`created_at`) VALUES 
(1,1,12,18000,1,18000,'2024-03-26 10:59:28'),
(2,2,12,18000,1,18000,'2024-03-26 11:02:59'),
(3,3,12,18000,1,18000,'2024-03-26 11:06:55'),
(4,4,6,15000,2,30000,'2024-03-28 06:23:34'),
(5,5,10,25000,1,25000,'2024-03-28 06:26:23'),
(6,6,12,18000,1,18000,'2024-04-28 04:32:54'),
(7,7,8,3000,1,3000,'2024-04-28 04:37:14'),
(8,8,12,18000,1,18000,'2024-04-28 04:40:53'),
(9,9,9,25000,1,25000,'2024-04-28 04:45:52'),
(10,10,6,15000,1,15000,'2024-04-30 04:11:45'),
(11,11,11,25000,1,25000,'2024-04-30 04:34:58'),
(12,12,5,5000,1,5000,'2024-04-30 04:41:49'),
(13,13,10,25000,1,25000,'2024-04-24 00:13:10'),
(14,14,10,25000,1,25000,'2024-04-24 00:23:30'),
(15,15,12,18000,1,18000,'2024-04-24 00:24:03'),
(16,16,11,25000,1,25000,'2024-04-24 00:24:44'),
(17,17,12,18000,1,18000,'2024-04-24 00:25:38'),
(18,18,10,25000,1,25000,'2024-04-24 00:26:16'),
(19,19,8,3000,1,3000,'2024-04-24 00:27:25'),
(20,20,17,7000,2,14000,'2024-01-03 10:35:14'),
(21,20,18,5000,1,5000,'2024-01-03 10:35:14'),
(22,20,16,20000,1,20000,'2024-01-03 10:35:14'),
(23,21,17,7000,1,7000,'2024-01-03 10:42:03');

/*Table structure for table `orderkonfirm` */

DROP TABLE IF EXISTS `orderkonfirm`;

CREATE TABLE `orderkonfirm` (
  `id_orkonfirm` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `resi` VARCHAR(16) NOT NULL,
  `metode` VARCHAR(16) NOT NULL,
  `tujuan` VARCHAR(16) NOT NULL,
  `atasnama` VARCHAR(128) NOT NULL,
  `dari` VARCHAR(16) NOT NULL,
  `rekening` VARCHAR(32) NOT NULL,
  `tanggal_transfer` DATE NOT NULL,
  `terbaca` ENUM('0','1') NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id_orkonfirm`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `orderkonfirm` */

INSERT  INTO `orderkonfirm`(`id_orkonfirm`,`order_id`,`resi`,`metode`,`tujuan`,`atasnama`,`dari`,`rekening`,`tanggal_transfer`,`terbaca`,`created_at`) VALUES 
(2,20,'1704274514','','Mandiri','fajar','BRI','1234567890','2024-04-26','0','2024-01-03 10:40:03');

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `id_pelanggan` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` VARCHAR(128) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `phone` VARCHAR(16) NOT NULL,
  `alamat` TEXT NOT NULL,
  `kota` VARCHAR(64) NOT NULL,
  `profinsi` VARCHAR(32) NOT NULL,
  `kodepos` VARCHAR(8) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pelanggan` */

INSERT  INTO `pelanggan`(`id_pelanggan`,`nama_pelanggan`,`email`,`phone`,`alamat`,`kota`,`profinsi`,`kodepos`,`password`,`created_at`,`updated_at`) VALUES 
(3,'Fajar Hidayat','fajar@gmail.coom','123','Bandar Lampung','Lampung','Lampung','314141','202cb962ac59075b964b07152d234b70','2024-01-03 10:10:48','2024-01-03 10:10:48');

/*Table structure for table `pengaturan` */

DROP TABLE IF EXISTS `pengaturan`;

CREATE TABLE `pengaturan` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `namasitus` VARCHAR(255) NOT NULL,
  `metatag` TEXT NOT NULL,
  `metadeskripsi` TEXT NOT NULL,
  `logo` VARCHAR(255) NOT NULL,
  `favicon` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pengaturan` */

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `id_produk` INT(11) NOT NULL AUTO_INCREMENT,
  `katalog_id` INT(11) NOT NULL,
  `nama_produk` VARCHAR(255) NOT NULL,
  `permalink` VARCHAR(255) NOT NULL,
  `stok` INT(11) NOT NULL,
  `harga_jual` DOUBLE(16,0) NOT NULL,
  `harga_coret` DOUBLE(16,0) NOT NULL,
  `gambar` VARCHAR(255) NOT NULL,
  `deskripsi` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_produk`)
) ENGINE=INNODB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `produk` */

INSERT  INTO `produk`(`id_produk`,`katalog_id`,`nama_produk`,`permalink`,`stok`,`harga_jual`,`harga_coret`,`gambar`,`deskripsi`,`created_at`,`updated_at`) VALUES 
(2,11,'Jus Jambu','minuman',10,5000,5,'jus_jambu_merah_1715589635.jpg','a','2024-01-03 16:38:00','2024-01-03 10:06:09'),
(3,11,'Jus Nanas','minuman',10,7000,5,'jus_nanas_1715589655.jpg','a','2024-01-03 16:38:00','2024-01-03 10:06:09'),
(4,11,'Es Lemon','minuman',10,7000,5,'lemon_ice_1715589669.jpg','a','2024-01-03 16:38:00','2024-01-03 10:06:09'),
(5,12,'Sempol Ayam','cemilan',10,5000,5,'sempol_ayam_1715590424.jpg','a','2024-01-03 16:38:00','2024-01-03 10:06:09'),
(6,12,'Keripik Pisang','cemilan',10,7000,5,'keripik_pisang_1715590351.jpg','a','2024-01-03 16:38:00','2024-01-03 10:06:09'),
(7,12,'Gohyong','cemilan',10,5000,5,'gohyong_1715590307.jpg','a','2024-01-03 16:38:00','2024-01-03 10:06:09'),
(8,12,'Cireng','cemilan',10,3000,5,'cireng_1715590265.jpg','a','2024-01-03 16:38:00','2024-01-03 10:06:09'),
(9,10,'Nasi Goreng','makanan',1,25000,0,'nasi_goreng_1715588552.jpg','a','2024-01-03 10:09:10','2024-01-03 10:09:10'),
(10,10,'Tongseng Lele','makanan',10,25000,5,'tongseng-lele.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(11,10,'Seafood','makanan',10,25000,5,'seafood_1715589461.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(12,10,'Sate Ayam','makanan',10,18000,5,'sate_ayam_+_lontong_1715589690.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(13,10,'Ikan Bakar','makanan',10,17000,5,'ikan_bakar_1715589436.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(14,10,'BAKSO GORENG','makanan',10,15000,5,'bakso_goreng_1715590227.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(15,10,'BAKSO','makanan',10,15000,5,'bakso_1715589498.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(16,10,'Ayam Bakar','makanan',10,15000,5,'ayam_bakar_1715587515.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(17,11,'Es Jeruk','minuman',10,15000,5,'es_jeruk_1715589533.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(18,11,'Es Teh','minuman',10,15000,5,'es_teh_1715589593.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(19,12,'Bakso Bakar','cemilan',10,15000,5,'bakso_bakar_1715590392.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(20,12,'Donat','cemilan',10,15000,5,'donat_1715590281.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26'),
(21,10,'Hot Dog','cemilan',10,15000,5,'hotdog_1715590327.jpg','a','2024-01-03 16:37:49','2024-01-03 10:22:26');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(128) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nama` VARCHAR(128) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `phone` VARCHAR(16) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `users` */

INSERT  INTO `users`(`id`,`username`,`password`,`nama`,`email`,`phone`,`created_at`) VALUES 
(1,'admin','21232f297a57a5a743894a0e4a801fc3','Administrator','administrator@admin.com','08123456789','2017-04-24 05:22:06');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
