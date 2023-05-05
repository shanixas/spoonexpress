/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS client_items;
CREATE TABLE `client_items` (
  `client_id` int NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `main_image_id` int DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `category` varchar(50) NOT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `item_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`,`item_name`),
  KEY `item_id_idx` (`item_id`),
  CONSTRAINT `client_items_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS client_items_images;
CREATE TABLE `client_items_images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `item_id` int NOT NULL,
  `image_path` varchar(255) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `client_id` (`client_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `client_items_images_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `client_items_images_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `client_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS clients;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS item_status;
CREATE TABLE `item_status` (
  `client_id` int NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `status_id` int NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`client_id`,`item_name`,`status_id`),
  CONSTRAINT `item_status_ibfk_1` FOREIGN KEY (`client_id`, `item_name`) REFERENCES `client_items` (`client_id`, `item_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;