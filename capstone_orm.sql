/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_name` varchar(50) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `saves`;
CREATE TABLE `saves` (
  `save_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `isSave` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`save_id`),
  KEY `user_id` (`user_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `saves_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `saves_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `refresh_token` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comments` (`comment_id`, `content`, `user_id`, `image_id`, `create_at`, `isDelete`) VALUES
(2, 'put content', 1, 1, '2024-03-24 00:20:17', 0);
INSERT INTO `comments` (`comment_id`, `content`, `user_id`, `image_id`, `create_at`, `isDelete`) VALUES
(4, '124', 1, 1, '2024-03-24 09:13:32', 0);


INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`, `isDelete`) VALUES
(1, 'edra.jpg', '1710886460292_edra.jpg', 'haha', 1, '2024-03-19 22:56:41', 0);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`, `isDelete`) VALUES
(2, 'dvx.jpg', '1710889000670_dvx.jpg', 'hehe', 1, '2024-03-19 22:56:41', 0);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`, `isDelete`) VALUES
(3, 'full white.jpg', '1711093155080_full white.jpg', 'hee', 1, '2024-03-22 07:39:15', 0);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`, `isDelete`) VALUES
(4, 'full white.jpg', '1711093457291_full white.jpg', 'test', 1, '2024-03-22 07:44:17', 0),
(5, 'dsrj.jpg', '1711094709798_dsrj.jpg', 'lalaa', 1, '2024-03-22 08:05:09', 0),
(6, 'dsrj.jpg', '1711095198323_dsrj.jpg', 'test', 1, '2024-03-22 08:13:18', 0),
(7, 'dsrj.jpg', '1711095237159_dsrj.jpg', 'test', 1, '2024-03-22 08:13:57', 0),
(8, 'vp.jpg', '1711097079271_vp.jpg', 'máy tính văn phòng', 1, '2024-03-22 08:44:39', 0);

INSERT INTO `saves` (`save_id`, `user_id`, `image_id`, `create_at`, `isSave`) VALUES
(1, 1, 1, '2024-03-24 00:05:44', 1);
INSERT INTO `saves` (`save_id`, `user_id`, `image_id`, `create_at`, `isSave`) VALUES
(2, 1, 2, '2024-03-24 00:06:12', 1);
INSERT INTO `saves` (`save_id`, `user_id`, `image_id`, `create_at`, `isSave`) VALUES
(3, 1, 6, '2024-03-24 00:06:26', 1);
INSERT INTO `saves` (`save_id`, `user_id`, `image_id`, `create_at`, `isSave`) VALUES
(5, 1, 7, '2024-03-26 08:33:55', 1),
(6, 1, 3, '2024-03-26 08:43:02', 0);

INSERT INTO `users` (`user_id`, `user_name`, `age`, `email`, `password`, `avatar`, `create_at`, `refresh_token`) VALUES
(1, 'Nguyễn Văn An', 18, 'nva@gmail.com', '$2b$10$wGWj1eiGhADY86gIEaW71.nA8Hg89gWaG//b6Yi/PotH5Z8datpSK', 'avt.jpg', '2024-03-09 05:01:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImtleSI6MTcxMTQzNzk4MjUzOSwiaWF0IjoxNzExNDM3OTgyLCJleHAiOjE3MTIwNDI3ODJ9.x3aqfNCVV7V2UvdAYqvEu4Itg3s-FgddxpydrIWe_iU');
INSERT INTO `users` (`user_id`, `user_name`, `age`, `email`, `password`, `avatar`, `create_at`, `refresh_token`) VALUES
(2, 'Nguyễn Văn B', 18, 'nvb@gmail.com', '$2b$10$fNLr0GCR7naBebrE1VbdDOemI5m3NJAZ4IT1khsbTp/Yx.9hymtTS', NULL, '2024-03-25 03:48:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImtleSI6MTcxMTQzNzYxNjQ4MCwiaWF0IjoxNzExNDM3NjE2LCJleHAiOjE3MTIwNDI0MTZ9.U2hrA-xDXud-YJwXvFnJaUc_Be1TMuMn7kcrgFkK0xo');
INSERT INTO `users` (`user_id`, `user_name`, `age`, `email`, `password`, `avatar`, `create_at`, `refresh_token`) VALUES
(3, 'Nguyễn Văn Ba', 18, 'nvba@gmail.com', '$2b$10$X8wFx.2hIgfI2da62cZZ6etd5bmV1enSLd3WrzcmMLJIwA3a/KOQG', NULL, '2024-03-25 04:16:23', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImtleSI6MTcxMTQzNTUwNzQwOCwiaWF0IjoxNzExNDM1NTA3LCJleHAiOjE3MTIwNDAzMDd9.wGX4Z2ocxXYmekTbMteUWnGqnYGHRS5xNDXKBhed7lw');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;