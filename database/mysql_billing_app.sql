
DROP TABLE IF EXISTS `tbl_category`;

CREATE TABLE `tbl_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bg_color` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6tqm19rficylm9e18oxdvr350` (`category_id`),
  UNIQUE KEY `UK8f25rdca1qev4kqtyrxwsx0k8` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tbl_items`;

CREATE TABLE `tbl_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKbbx9gl7bt5u3ktguqkw59ehhf` (`item_id`),
  KEY `FKrxxi38a9m21eltievg2qhhk2n` (`category_id`),
  CONSTRAINT `FKrxxi38a9m21eltievg2qhhk2n` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tbl_order_items`;

CREATE TABLE `tbl_order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi5qvuwu0gqfww50julf2kq3d7` (`order_id`),
  CONSTRAINT `FKi5qvuwu0gqfww50julf2kq3d7` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tbl_orders`;

CREATE TABLE `tbl_orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `razorpay_order_id` varchar(255) DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_signature` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `payment_method` enum('CASH','UPI') DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `tbl_orders_chk_1` CHECK ((`status` between 0 and 2))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmjbs9x9gfunub398pfm26lmnd` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;