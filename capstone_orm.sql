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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comments` (`comment_id`, `content`, `user_id`, `image_id`, `create_at`, `isDelete`) VALUES
(2, 'put content', 1, 1, '2024-03-24 00:20:17', 0);
INSERT INTO `comments` (`comment_id`, `content`, `user_id`, `image_id`, `create_at`, `isDelete`) VALUES
(4, '124', 1, 1, '2024-03-24 09:13:32', 0);
INSERT INTO `comments` (`comment_id`, `content`, `user_id`, `image_id`, `create_at`, `isDelete`) VALUES
(5, '1', 4, 1, '2024-03-27 17:51:02', 0);
INSERT INTO `comments` (`comment_id`, `content`, `user_id`, `image_id`, `create_at`, `isDelete`) VALUES
(6, '2', 4, 1, '2024-03-27 18:03:59', 0),
(7, '3', 4, 1, '2024-03-27 18:16:16', 0),
(8, '4', 4, 1, '2024-03-27 18:24:52', 0),
(9, '5', 4, 1, '2024-03-27 18:38:26', 0),
(10, 'test', 4, 1, '2024-03-27 18:43:17', 0),
(11, 'cac', 4, 1, '2024-03-27 18:54:17', 0),
(12, '123', 4, 1, '2024-03-27 18:54:32', 0),
(13, '1', 4, 1, '2024-03-28 03:43:43', 0),
(14, '1', 4, 1, '2024-03-28 03:49:04', 0),
(15, '1', 4, 1, '2024-03-28 03:49:09', 0),
(16, '1', 4, 1, '2024-03-28 03:53:43', 0),
(17, '1', 4, 1, '2024-03-28 03:58:55', 0),
(18, 'put content', 3, 2, '2024-03-30 12:36:02', 1),
(19, 'cmt', 3, 2, '2024-03-30 12:51:31', 0),
(20, 'string', 1, 3, '2024-04-01 18:44:26', 0),
(21, 'string', 1, 3, '2024-04-01 18:44:38', 0),
(22, NULL, 1, 2, '2024-04-02 02:08:40', 1),
(23, NULL, 1, 2, '2024-04-02 02:08:54', 0),
(24, NULL, 1, 10, '2024-04-02 02:16:39', 0),
(25, 'test comment', 1, 10, '2024-04-02 02:29:59', 0),
(26, '123456', 1, 10, '2024-04-02 02:30:20', 0),
(27, '123', 1, 10, '2024-04-02 02:31:25', 0),
(28, '1234', 1, 10, '2024-04-02 02:33:19', 0),
(29, 'lòi', 1, 10, '2024-04-02 02:37:41', 0),
(30, '1', 1, 10, '2024-04-02 02:38:11', 0),
(31, '12', 1, 10, '2024-04-02 02:43:00', 0),
(32, '00', 1, 5, '2024-04-02 02:50:58', 0),
(33, '11', 1, 5, '2024-04-02 02:56:26', 0);

INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`, `isDelete`) VALUES
(1, 'edra.jpg', '1710886460292_edra.jpg', 'haha', 1, '2024-03-19 22:56:41', 0);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`, `isDelete`) VALUES
(2, 'dvx.jpg', '1710889000670_dvx.jpg', 'hehe', 1, '2024-03-19 22:56:41', 0);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`, `isDelete`) VALUES
(3, 'full white.jpg', '1711093155080_full white.jpg', 'hee', 1, '2024-03-22 07:39:15', 0);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `description`, `user_id`, `create_at`, `isDelete`) VALUES
(4, 'full white.jpg', '1711093457291_full white.jpg', 'test', 1, '2024-03-22 07:44:17', 0),
(5, 'dsrj.jpg', '1711094709798_dsrj.jpg', 'lalaa', 1, '2024-03-22 08:05:09', 0),
(6, 'dsrj.jpg', '1711095198323_dsrj.jpg', 'test', 1, '2024-03-22 08:13:18', 1),
(7, 'dsrj.jpg', '1711095237159_dsrj.jpg', 'test', 1, '2024-03-22 08:13:57', 0),
(8, 'vp.jpg', '1711097079271_vp.jpg', 'máy tính văn phòng', 1, '2024-03-22 08:44:39', 0),
(9, 'hồng.jpg', '1711802333349_hồng.jpg', 'test', 1, '2024-03-30 12:38:53', 0),
(10, 'sd.jpg', '1711803187960_sd.jpg', 'màn kv', 1, '2024-03-30 12:53:07', 0),
(11, 'infiniy.jpg', '1712000510079_infiniy.jpg', 'vo cuc', 4, '2024-04-01 19:41:50', 1),
(12, 'sd.jpg', '1712055903597_sd.jpg', 'sa', 1, '2024-04-02 11:05:03', 1);

INSERT INTO `saves` (`save_id`, `user_id`, `image_id`, `create_at`, `isSave`) VALUES
(1, 1, 1, '2024-03-24 00:05:44', 1);
INSERT INTO `saves` (`save_id`, `user_id`, `image_id`, `create_at`, `isSave`) VALUES
(2, 1, 2, '2024-03-24 00:06:12', 1);
INSERT INTO `saves` (`save_id`, `user_id`, `image_id`, `create_at`, `isSave`) VALUES
(3, 1, 6, '2024-03-24 00:06:26', 1);
INSERT INTO `saves` (`save_id`, `user_id`, `image_id`, `create_at`, `isSave`) VALUES
(5, 1, 7, '2024-03-26 08:33:55', 0),
(6, 1, 3, '2024-03-26 08:43:02', 0),
(7, 1, 4, '2024-03-26 09:44:34', 0),
(8, 1, 8, '2024-03-26 10:02:46', 1),
(9, 4, 3, '2024-03-27 15:01:36', 1),
(10, 4, 5, '2024-03-27 15:01:37', 1),
(11, 4, 1, '2024-03-27 16:32:36', 1),
(12, 3, 3, '2024-03-30 12:35:29', 1),
(13, 1, 11, '2024-04-02 02:14:12', 0),
(14, 1, 12, '2024-04-02 11:43:06', 1);

INSERT INTO `users` (`user_id`, `user_name`, `age`, `email`, `password`, `avatar`, `create_at`, `refresh_token`) VALUES
(1, 'Nguyễn Văn An', 18, 'nva@gmail.com', '$2b$10$8Y9C7UBa5S0OxvuqDoEGDeGC6UoiYkMoC9MBw65D6ukt/F6hVPzhm', 'avt.jpg', '2024-03-09 05:01:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImtleSI6MTcxMjA0ODQzNjc0MywiaWF0IjoxNzEyMDQ4NDM2LCJleHAiOjE3MTI2NTMyMzZ9.kbu_qeCiwkGqnZb7xMkrO1rqjVPIeMD1dPVTH9gAmMg');
INSERT INTO `users` (`user_id`, `user_name`, `age`, `email`, `password`, `avatar`, `create_at`, `refresh_token`) VALUES
(2, 'Nguyễn Văn B', 18, 'nvb@gmail.com', '$2b$10$fNLr0GCR7naBebrE1VbdDOemI5m3NJAZ4IT1khsbTp/Yx.9hymtTS', NULL, '2024-03-25 03:48:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImtleSI6MTcxMTQzNzYxNjQ4MCwiaWF0IjoxNzExNDM3NjE2LCJleHAiOjE3MTIwNDI0MTZ9.U2hrA-xDXud-YJwXvFnJaUc_Be1TMuMn7kcrgFkK0xo');
INSERT INTO `users` (`user_id`, `user_name`, `age`, `email`, `password`, `avatar`, `create_at`, `refresh_token`) VALUES
(3, 'Nguyễn Văn Ann', 18, 'nvba@gmail.com', '$2b$10$0AA7uEezguteUjMGAEIT4ezQO6K8n5s1NnUy9SJ8YgM1oY9i7ZEPe', NULL, '2024-03-25 04:16:23', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImtleSI6MTcxMTgwMTkyNDkzNiwiaWF0IjoxNzExODAxOTI0LCJleHAiOjE3MTI0MDY3MjR9.1KfzFpGRsl-lNV3odLAw-2GCfpLX82YKnWz4l-SF2Ow');
INSERT INTO `users` (`user_id`, `user_name`, `age`, `email`, `password`, `avatar`, `create_at`, `refresh_token`) VALUES
(4, 'mck', 18, 'mck@gmail.com', '$2b$10$L7dFMJlVQjpxMNRJsHZtbuEgTAxc4AvzD8vqRVLtVV.P6lzCBvSAu', 'logo.jpg', '2024-03-27 15:01:15', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImtleSI6MTcxMjAyNjIyMjM4MSwiaWF0IjoxNzEyMDI2MjIyLCJleHAiOjE3MTI2MzEwMjJ9.L6P5TLGkwQbNj93Od_Uk7W4YH3Gku16KXcWrW8VCSug'),
(5, 'Nguyễn củ chi', 17, 'abc@gmail.com', '$2b$10$Rg8mTkOOpBFFtH4JV5qRBeKVUXccWTjVqBZLfz3zc5fMjDJ30DAjq', NULL, NULL, NULL);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;