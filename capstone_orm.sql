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
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_name` varchar(50) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `saves`;
CREATE TABLE `saves` (
  `sav_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sav_id`),
  KEY `user_id` (`user_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `saves_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `saves_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comments` (`comment_id`, `content`, `user_id`, `image_id`, `create_at`) VALUES
(2, 'put content', 1, 1, '2024-03-24 00:20:17');


INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`) VALUES
(1, 'edra.jpg', '1710886460292_edra.jpg', 'haha', 1, NULL);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`) VALUES
(2, 'dvx.jpg', '1710889000670_dvx.jpg', 'hehe', 1, '2024-03-19 22:56:41');
INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`) VALUES
(3, 'full white.jpg', '1711093155080_full white.jpg', 'hee', 1, '2024-03-22 07:39:15');
INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`) VALUES
(4, 'full white.jpg', '1711093457291_full white.jpg', 'test', 1, '2024-03-22 07:44:17'),
(5, 'dsrj.jpg', '1711094709798_dsrj.jpg', 'lalaa', 1, '2024-03-22 08:05:09'),
(6, 'dsrj.jpg', '1711095198323_dsrj.jpg', 'test', 1, '2024-03-22 08:13:18'),
(7, 'dsrj.jpg', '1711095237159_dsrj.jpg', 'test', 1, '2024-03-22 08:13:57'),
(8, 'vp.jpg', '1711097079271_vp.jpg', 'máy tính văn phòng', 1, '2024-03-22 08:44:39');

INSERT INTO `saves` (`sav_id`, `user_id`, `image_id`, `create_at`) VALUES
(1, 1, 1, '2024-03-24 00:05:44');
INSERT INTO `saves` (`sav_id`, `user_id`, `image_id`, `create_at`) VALUES
(2, 1, 2, '2024-03-24 00:06:12');
INSERT INTO `saves` (`sav_id`, `user_id`, `image_id`, `create_at`) VALUES
(3, 1, 6, '2024-03-24 00:06:26');

INSERT INTO `users` (`user_id`, `user_name`, `age`, `email`, `password`, `avatar`, `create_at`, `refresh_token`) VALUES
(1, 'Nguyễn Văn An', 18, 'nva@gmail.com', '$2b$10$wGWj1eiGhADY86gIEaW71.nA8Hg89gWaG//b6Yi/PotH5Z8datpSK', 'avt.jpg', '2024-03-09 05:01:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImtleSI6MTcxMTIzODY2MzA2MywiaWF0IjoxNzExMjM4NjYzLCJleHAiOjE3MTE4NDM0NjN9.48-FGBi6mBxiCSwwQ0LntwVlvuEPVauhVXyIdh4Ln5Q');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;