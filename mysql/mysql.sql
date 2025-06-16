-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: web1
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `bug_reports`
--

DROP TABLE IF EXISTS `bug_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bug_reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` enum('pending','in_progress','resolved') DEFAULT 'pending',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `report_idx` (`user_id`),
  CONSTRAINT `report` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug_reports`
--

LOCK TABLES `bug_reports` WRITE;
/*!40000 ALTER TABLE `bug_reports` DISABLE KEYS */;
INSERT INTO `bug_reports` VALUES (27,15,'Không thể đăng nhập vào web được.','tài khoản của tôi mặc dù đã được tạo nhưng không thể đăng nhập được','resolved','2025-06-03 19:41:54','2025-06-03 20:24:04'),(28,16,'Lỗi phát phim','Phim không thể phát khi chạm vào màn hình','pending','2025-06-03 19:44:10','2025-06-03 19:44:10'),(29,17,'Trình duyệt không được hỗ trợ','trình duyệt của tôi không thích ứng với trình duyệt của tôi','pending','2025-06-03 19:45:33','2025-06-03 19:45:33'),(30,18,'Web không hoạt động','thường xuyên không thao tác được','resolved','2025-06-03 19:48:39','2025-06-03 20:00:02'),(31,19,'Trình duyệt không được hỗ trợ','123456789','resolved','2025-06-03 19:49:45','2025-06-03 20:00:39'),(32,20,'Trình duyệt không được hỗ trợ','1234567','resolved','2025-06-03 19:50:41','2025-06-03 20:00:48'),(33,21,'Không thể đăng nhập','123456','resolved','2025-06-03 19:51:17','2025-06-03 20:00:57'),(34,22,'Lỗi phát phim','1234567','resolved','2025-06-03 19:52:23','2025-06-03 20:01:13'),(35,23,'Web không hoạt động','123456','pending','2025-06-03 19:53:05','2025-06-03 19:53:05'),(36,24,'Lỗi phát phim','345678','resolved','2025-06-03 19:54:23','2025-06-03 20:01:22'),(37,25,'Lỗi phát phim','123456','resolved','2025-06-03 19:55:08','2025-06-03 20:01:27'),(38,26,'Trình duyệt không được hỗ trợ','qưert','pending','2025-06-03 19:56:09','2025-06-03 19:56:09'),(39,27,'cscscd','dcdcdcs','resolved','2025-06-03 19:56:59','2025-06-03 20:01:38'),(40,28,'asdfgh','dfghj','resolved','2025-06-03 19:57:43','2025-06-03 20:01:44');
/*!40000 ALTER TABLE `bug_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bug_responses`
--

DROP TABLE IF EXISTS `bug_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bug_responses` (
  `response_id` int NOT NULL AUTO_INCREMENT,
  `report_id` int DEFAULT NULL,
  `response_text` text,
  `response_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','resolved','rejected') DEFAULT 'pending',
  PRIMARY KEY (`response_id`),
  KEY `report_idx` (`report_id`),
  CONSTRAINT `response` FOREIGN KEY (`report_id`) REFERENCES `bug_reports` (`report_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug_responses`
--

LOCK TABLES `bug_responses` WRITE;
/*!40000 ALTER TABLE `bug_responses` DISABLE KEYS */;
INSERT INTO `bug_responses` VALUES (13,30,'Chào bạn, để hỗ trợ khắc phục sự cố nhanh chóng, bạn vui lòng cung cấp thêm thông tin sau:\n+ Lỗi cụ thể khi thao tác (ví dụ: không load được trang, không bấm được nút, hay gặp thông báo lỗi nào không?)\n+ Thiết bị và trình duyệt đang sử dụng (ví dụ: điện thoại Android, iPhone, Chrome, Cốc Cốc, v.v.)\n+ Lỗi xảy ra thường xuyên hay vào thời điểm cụ thể?\nTrong thời gian chờ xử lý, bạn có thể thử:\n+ Kiểm tra lại kết nối mạng.\n+ Sử dụng trình duyệt khác để kiểm tra.\nChúng tôi sẽ cố gắng khắc phục sớm nhất có thể. Cảm ơn bạn đã thông báo và mong tiếp tục nhận được sự ủng hộ!','2025-06-03 20:00:02','pending'),(14,31,'123456','2025-06-03 20:00:39','pending'),(15,32,'qưerty','2025-06-03 20:00:48','pending'),(16,33,'ưertyu','2025-06-03 20:00:57','pending'),(17,34,'ưerty','2025-06-03 20:01:13','pending'),(18,36,'sdfg','2025-06-03 20:01:22','pending'),(19,37,'fghj','2025-06-03 20:01:27','pending'),(20,39,'edrfgh','2025-06-03 20:01:38','pending'),(21,40,'rfghjk','2025-06-03 20:01:44','pending'),(22,27,'Chào bạn, chúng tôi rất tiếc vì bạn đang gặp sự cố khi đăng nhập vào website. Để hỗ trợ xử lý nhanh chóng, vui lòng cung cấp thêm thông tin sau:\n+ Thông báo lỗi cụ thể (nếu có).\n+ Đã thử đặt lại mật khẩu chưa? Nếu có, hệ thống có gửi mã xác nhận không?\n+ Sự cố xảy ra trên thiết bị hoặc trình duyệt nào?\nTrong thời gian chờ hỗ trợ, bạn có thể thử:\n+ Kiểm tra xem tài khoản và mật khẩu có chính xác không.\n+ Xóa cache trình duyệt hoặc thử trên một trình duyệt khác.\n+ Kiểm tra xem website có đang bảo trì không.\nNếu vẫn không đăng nhập được, vui lòng phản hồi lại để chúng tôi hỗ trợ ngay.','2025-06-03 20:24:04','pending');
/*!40000 ALTER TABLE `bug_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'Hài hước'),(1,'Hành động'),(7,'Học đường'),(5,'Lịch sử'),(6,'Thể thao'),(3,'Tình cảm '),(4,'Võ thuật');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodes` (
  `episode_id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `episode_number` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video_url` text,
  PRIMARY KEY (`episode_id`),
  KEY `episode_idx` (`movie_id`),
  CONSTRAINT `episode` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (1,1,1,'Tập 1','https://www.youtube.com/embed/kwnF-N5u69A?si=3sdtiyjFEiDzbJqg'),(2,1,2,'Tập 2','https://www.youtube.com/embed/TnGT2BVhGc0?si=UJhNu_FULNn9jgEh'),(3,1,3,'Tập 3','https://www.youtube.com/embed/kwnF-N5u69A?si=3sdtiyjFEiDzbJqg'),(4,2,1,'Tập 1','https://www.youtube.com/embed/kwnF-N5u69A?si=3sdtiyjFEiDzbJqg'),(5,1,4,'Tập 4 ','https://www.youtube.com/embed/kwnF-N5u69A?si=3sdtiyjFEiDzbJqg'),(7,1,5,'tập 5','https://www.youtube.com/embed/kwnF-N5u69A?si=3sdtiyjFEiDzbJqg'),(8,1,6,'tập 6','https://www.youtube.com/embed/kwnF-N5u69A?si=3sdtiyjFEiDzbJqg'),(9,1,7,'tập 7','https://www.youtube.com/embed/kwnF-N5u69A?si=3sdtiyjFEiDzbJqg'),(10,1,8,'tập 8','https://www.youtube.com/embed/kwnF-N5u69A?si=3sdtiyjFEiDzbJqg');
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `added_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`movie_id`),
  KEY `favorites_movie_idx` (`movie_id`),
  CONSTRAINT `favorites_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `favorites_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_categories`
--

DROP TABLE IF EXISTS `movie_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_categories` (
  `movie_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`category_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_categories`
--

LOCK TABLES `movie_categories` WRITE;
/*!40000 ALTER TABLE `movie_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext,
  `release_year` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `background_url` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Jujutsu No Yaiba','Trong một thế giới nơi những con quỷ ăn thịt người không nghi ngờ gì, những mảnh vỡ của con quỷ huyền thoại và đáng sợ Ryoumen Sukuna đã bị thất lạc và nằm rải rác. Nếu bất kỳ con quỷ nào tiêu thụ các bộ phận cơ thể của Sukuna, sức mạnh mà chúng có được có thể phá hủy thế giới như chúng ta đã biết. May mắn thay, có một ngôi trường bí ẩn của các Phù thủy Jujutsu tồn tại để bảo vệ sự tồn tại bấp bênh của người sống khỏi xác sống!Yuuji Itadori là một học sinh trung học dành cả ngày để thăm ông nội nằm liệt giường của mình. Mặc dù anh ấy trông giống như một thiếu niên bình thường của bạn, nhưng sức mạnh thể chất to lớn của anh ấy là một điều đáng chú ý! Mọi câu lạc bộ thể thao đều muốn cậu tham gia, nhưng Itadori thà đi chơi với những đứa trẻ bị trường ruồng bỏ trong Câu lạc bộ huyền bí. Một ngày nọ, câu lạc bộ quản lý để có được bàn tay của họ trên một vật thể bị nguyền rủa bị phong ấn, nhưng họ ít biết nỗi kinh hoàng mà họ sẽ gây ra khi phá vỡ phong ấn ...',2024,24,'Hành động, Lãng mạn','/images/anime1.jpg','/images/15.jpg','Approved'),(2,'Bất lương nhân','phim hành động',2014,24,'Hành động','/images/batluongnhan.jpg','/images/15.jpg','Approved'),(3,'Naruto','Trong một thế giới nơi những con quỷ ăn thịt người không nghi ngờ gì, những mảnh vỡ của con quỷ huyền thoại và đáng sợ Ryoumen Sukuna đã bị thất lạc và nằm rải rác. Nếu bất kỳ con quỷ nào tiêu thụ các bộ phận cơ thể của Sukuna, sức mạnh mà chúng có được có thể phá hủy thế giới như chúng ta đã biết. May mắn thay, có một ngôi trường bí ẩn của các Phù thủy Jujutsu tồn tại để bảo vệ sự tồn tại bấp bênh của người sống khỏi xác sống!Yuuji Itadori là một học sinh trung học dành cả ngày để thăm ông nội nằm liệt giường của mình. Mặc dù anh ấy trông giống như một thiếu niên bình thường của bạn, nhưng sức mạnh thể chất to lớn của anh ấy là một điều đáng chú ý! Mọi câu lạc bộ thể thao đều muốn cậu tham gia, nhưng Itadori thà đi chơi với những đứa trẻ bị trường ruồng bỏ trong Câu lạc bộ huyền bí. Một ngày nọ, câu lạc bộ quản lý để có được bàn tay của họ trên một vật thể bị nguyền rủa bị phong ấn, nhưng họ ít biết nỗi kinh hoàng mà họ sẽ gây ra khi phá vỡ phong ấn ...',2014,24,'Hành động','/images/batluongnhan.jpg','/images/15.jpg','Approved');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` longtext,
  `review_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `movie_id_idx` (`movie_id`),
  CONSTRAINT `movie1_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role_name` enum('admin','technical','content_manager','user') NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Quản trị viên hệ thống'),(2,'technical','Kỹ thuật viên'),(3,'content_manager','Quản lý nội dung'),(4,'user','Người dùng thông thường');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(45) NOT NULL,
  `role_id` int NOT NULL DEFAULT '4',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Active','Banned') DEFAULT 'Active',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `role_idx` (`role_id`),
  CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'trandang','$2b$10$vjF.rJ/Tu9P3apvijmuaL.ZkyLtXVZxnTzzWLIruxFghiHl1o9N8C','trandang@gmail.com',4,'2025-04-11 21:38:59','Active'),(4,'dangd','$2b$10$HejCzuw39jJb3w80eLd3.OugYFNSy0AWWINffrz5sqNxxZ74jSTaO','tranda@gmail.com',1,'2025-04-11 21:43:08','Banned'),(5,'duy','$2b$10$Yt7w.qDrPouFNL4IZjuQa.5lb.ldEFi5s2rLQZAYfdxR8TSUxJHO6','duy@gmail.com',1,'2025-04-11 21:43:08','Banned'),(6,'tranda','$2b$10$/s2avQaVsUczSiIk2YUGPeb7dWMPYV7YQm4H.crodani7R5UnMRBS','trandan@gmail.com',4,'2025-04-21 14:04:38','Active'),(7,'tron','$2b$10$/s2avQaVsUczSiIk2YUGPeb7dWMPYV7YQm4H.crodani7R5UnMRBS','tron@gmail.com',1,'2025-04-23 19:14:27','Active'),(8,'dat','$2b$10$SHeVQ9s.oHU0bmHcavuZBuiWvRA6/XHJq17mya3vx/GOBovrOxQ06','dat@gmail.com',4,'2025-04-24 22:04:07','Active'),(9,'luuducdat','$2b$10$fg6rc4RHdf/5W1nlwxhGGOg70ok.KTgQVWk1ghMUX28KL3qYiKmQm','dat1@gmail.com',1,'2025-05-24 21:54:50','Active'),(10,'KTV1','123456','ktv1@gmail.com',1,'2025-05-24 22:20:32','Active'),(11,'dat2','$2b$10$OZmqakTNOfewxmAM6W252em3DijbcBnO.wMZuzz2BI/oghpaxwsUy','dat2@gmail.com',2,'2025-05-25 11:35:55','Active'),(12,'luudat','$2b$10$0ny9yje55q6gBZkIX0eciuSqLv3quZeXiBezHxZ/IU.uoTwPFDTMu','ktv2@gmail.com',2,'2025-05-26 02:56:14','Active'),(13,'Luu Duc Dat','$2b$10$CWIGKC/lsLiR5nBA5S.NT.L2Q5dmBziyFJUPAZXWycTSCFSbbdBV.','datt@gmail.com',4,'2025-06-03 02:26:04','Active'),(14,'Dat Dat','$2b$10$18QxhH0OoAlzVTg0ho0pQuQjmkiaxQ6A4Mew31BlF/TfGFsayWKiu','dattt@gmail.com',4,'2025-06-03 08:09:45','Active'),(15,'Pham Phuc Duy','$2b$10$xXmw4Kyw/SifcwsHP44DUO4YT2t.IwCco8gc2VJWw0oNlojH9kGJe','phamphucduy@gmail.com',4,'2025-06-03 19:38:12','Active'),(16,'Le Thanh Binh','$2b$10$aK9F9xkoEm/DEEIO687JdueHsu2yvveIyzOFzJ3Xrzy4RGT.PkZHK','lethanhbinh@gmail.com',4,'2025-06-03 19:43:01','Active'),(17,'Nguyen Ngoc Can','$2b$10$AIUr0y8t/PEkJqvccOceNeP4I8.YjsHRnNhO5xK5nd285NZ6Tsbqi','nguyenngoccan@gmail.com',4,'2025-06-03 19:44:36','Active'),(18,'Tran Dang Duy','$2b$10$4TM4CsLMutcbboO70Hs4/eQ5r3V4lHmMe/pCqr6D5RvHM5qD/Fpi.','trandangduy@gmail.com',4,'2025-06-03 19:47:45','Active'),(19,'Nguyen Khac Bao','$2b$10$mNPEh.X5Dgv2x0WW/HH25OaeQoO.C7w3huWHD3MMAVAr3Tu63d6ma','nguyenkhacbao@gmail.com',4,'2025-06-03 19:49:20','Active'),(20,'Nguyen Van An','$2b$10$HVgsSv0swiCh29kDWoVcwuBArNLwBoMRjCPydbPb6Lt4fxqhMiFea','nguyenvanan@gmail.com',4,'2025-06-03 19:50:25','Active'),(21,'Nguyen Gia Hung','$2b$10$BXUfoKX639gx.wVvpt3EoeoF4ax9WLQk18s7TAtqVS0Ms8uCOlilK','nguyengiahung@gmail.com',4,'2025-06-03 19:51:00','Active'),(22,'Thai Bao','$2b$10$f/wtc5VtdK66u/51GFf9/u9hYjzecV7g2PdaYmyP4.F63rtKU/yU2','thaibao@gmail.com',4,'2025-06-03 19:52:00','Active'),(23,'Tran Dinh Thinh','$2b$10$Gb4yhWqv/zcQbUroD8qqvOxvXXJRXeaE6huOLKr2Y9FzaUSYtI.h2','tdt544@gmail.com',4,'2025-06-03 19:52:43','Active'),(24,'Bui Thi Xuan','$2b$10$LngEZP4Y7VWQ3n6ETyK3k.FikgH.OIV3HNf8iiF1HMboqMKdmBqLq','buithixuan@gmail.com',4,'2025-06-03 19:54:08','Active'),(25,'Cao Ba Kien','$2b$10$PRhEq4.ZWk3dIf1rJEHBJehjzeJDgAdApxIvokSQkM6bS9drudyz.','caobakien@gmail.com',4,'2025-06-03 19:54:46','Active'),(26,'Nguyen Tien Dat','$2b$10$3pg0zKEXph6.eyh96apL.ek8ci989e.eNlyKbc5FNv/ZfoOsbAD1a','nguyentien_dat@gmail.com',4,'2025-06-03 19:55:48','Active'),(27,'Duc Trong','$2b$10$P/diMa3yvOzyKMOQf/GqHO9rAc69bgpx2CKg/5ChzQoWKm.gdxA/u','ductrong_05@gmail.com',4,'2025-06-03 19:56:39','Active'),(28,'Cao Minh Thanh','$2b$10$Rj7/iYBWPuSiQVbCnKYOm.cnq5vYM1U6pPJZqhwjb8f4jbmXPG566','caominh.thanh@gmail.com',4,'2025-06-03 19:57:25','Active');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchhistory`
--

DROP TABLE IF EXISTS `watchhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchhistory` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `watched_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `history_user_idx` (`user_id`),
  KEY `history_movie_idx` (`movie_id`),
  CONSTRAINT `history_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `history_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchhistory`
--

LOCK TABLES `watchhistory` WRITE;
/*!40000 ALTER TABLE `watchhistory` DISABLE KEYS */;
INSERT INTO `watchhistory` VALUES (2,11,2,'2025-05-26 21:07:23');
/*!40000 ALTER TABLE `watchhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-16 11:14:23
