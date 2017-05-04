-- MySQL dump 10.13  Distrib 5.6.21, for osx10.9 (x86_64)
--
-- Host: localhost    Database: yourouiothack_development
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `yourouiothack_development`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `yourouiothack_development` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yourouiothack_development`;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-05-03 09:36:12','2017-05-03 09:36:12');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_accounts`
--

DROP TABLE IF EXISTS `oauth_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_secret` varchar(255) DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_accounts_on_user_id_and_type` (`user_id`,`type`),
  KEY `index_oauth_accounts_on_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_accounts`
--

LOCK TABLES `oauth_accounts` WRITE;
/*!40000 ALTER TABLE `oauth_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opr_recommends`
--

DROP TABLE IF EXISTS `opr_recommends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opr_recommends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `description` text,
  `start_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_opr_recommends_on_product_id` (`product_id`),
  KEY `index_opr_recommends_on_start_at_and_end_at` (`start_at`,`end_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opr_recommends`
--

LOCK TABLES `opr_recommends` WRITE;
/*!40000 ALTER TABLE `opr_recommends` DISABLE KEYS */;
/*!40000 ALTER TABLE `opr_recommends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_recipe_ingredients`
--

DROP TABLE IF EXISTS `order_recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_recipe_ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_recipe_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_recipe_ingredients_on_user_id` (`user_id`),
  KEY `index_order_recipe_ingredients_on_order_recipe_id` (`order_recipe_id`),
  KEY `index_order_recipe_ingredients_on_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_recipe_ingredients`
--

LOCK TABLES `order_recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `order_recipe_ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_recipes`
--

DROP TABLE IF EXISTS `order_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `qr_image_path` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_order_recipes_on_token` (`token`),
  KEY `index_order_recipes_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_recipes`
--

LOCK TABLES `order_recipes` WRITE;
/*!40000 ALTER TABLE `order_recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `price_in_tax` int(11) NOT NULL DEFAULT '0',
  `kcal` int(11) NOT NULL DEFAULT '0',
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_category_and_type` (`category`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'きゅうり一本漬','Food',1,310,335,24,NULL),(2,'なす一本漬','Food',1,310,335,49,NULL),(3,'枝豆','Food',1,290,313,142,NULL),(4,'キムチ','Food',1,280,302,91,NULL),(5,'まぐろアボカド（塩麹マヨ）','Food',1,360,389,200,NULL),(6,'うずら玉子醤油漬','Food',1,280,302,128,NULL),(7,'塩キャベツ','Food',1,280,302,74,NULL),(8,'厚揚','Food',1,280,302,234,NULL),(9,'おつまミミガー','Food',1,280,302,92,NULL),(10,'揚ワンタン','Food',1,280,302,178,NULL),(11,'冷しトマト','Food',1,280,302,129,NULL),(12,'明太子塩麹（炙り）','Food',1,280,302,50,NULL),(13,'冷奴','Food',1,280,302,124,NULL),(14,'チョレギサラダ','Food',2,390,421,95,NULL),(15,'さっぱりレモンサラダ（塩麹ドレッシング）','Food',2,390,421,195,NULL),(16,'具沢山シーザーサラダ','Food',2,480,518,219,NULL),(17,'ごろごろサラダ（海老&アボカド&玉子）','Food',2,450,486,283,NULL),(18,'ローストビーフサラダ','Food',2,580,626,162,NULL),(19,'さっぱりヘルシーサラダ（キヌア入り）','Food',2,390,421,195,NULL),(20,'ベーコンたまごサラダ','Food',2,320,346,255,NULL),(21,'まぐろ刺身','Food',3,480,518,72,NULL),(22,'厳選〆さば','Food',3,360,389,99,NULL),(23,'刺身三種盛り合せ','Food',3,550,594,120,NULL),(24,'サーモン刺身','Food',3,450,486,150,NULL),(25,'刺身五種盛り合せ','Food',3,990,1069,249,NULL),(26,'真鯛刺身　ポン酢添え','Food',3,480,518,93,NULL),(27,'串焼盛り合せ','Food',4,640,691,530,NULL),(28,'バラエティ盛り合せ','Food',4,1450,1566,1144,NULL),(29,'ねぎ串（１本）','Food',4,130,140,24,NULL),(30,'ねぎ串（１本）（タレ焼）','Food',4,130,140,29,NULL),(31,'鶏皮串（１本）','Food',4,150,162,154,NULL),(32,'鶏皮串（１本）（塩焼）','Food',4,150,162,159,NULL),(33,'特製つくね串（１本）','Food',4,150,162,98,NULL),(34,'特製つくね串（１本）（塩焼）','Food',4,150,162,103,NULL),(35,'室蘭風焼とん串（１本）','Food',4,150,162,178,NULL),(36,'手羽串（１本）','Food',4,150,162,132,NULL),(37,'手羽串（１本）（タレ焼）','Food',4,240,259,259,NULL),(38,'ぼんじり串（１本）','Food',4,180,194,164,NULL),(39,'ぼんじり串（１本）（タレ焼）','Food',4,180,194,168,NULL),(40,'ヤゲン串（１本）','Food',4,180,194,54,NULL),(41,'ヤゲン串（１本）（タレ焼）','Food',4,180,194,59,NULL),(42,'鶏せせり串（１本）','Food',4,180,194,64,NULL),(43,'鶏せせり串（１本）（タレ焼）','Food',4,180,194,69,NULL),(44,'四季鶏もも大串（１本）','Food',4,220,238,171,NULL),(45,'四季鶏もも大串（１本）（塩焼）','Food',4,220,238,176,NULL),(46,'砂肝串（１本）','Food',4,180,194,35,NULL),(47,'砂肝串（１本）（タレ焼）','Food',4,180,194,40,NULL),(48,'厚切りベーコン串（１本）','Food',4,150,162,78,NULL),(49,'厚切りベーコン串（１本）（タレ焼）','Food',4,150,162,83,NULL),(50,'牛カルビ串（１本）','Food',4,220,238,134,NULL),(51,'牛カルビ串（１本）（塩焼）','Food',4,220,238,139,NULL),(52,'肉詰ピーマン　チーズ焼（１本）','Food',4,240,259,113,NULL),(53,'子持ちシシャモ','Food',5,300,324,114,NULL),(54,'北海道産　真ほっけ','Food',5,780,842,365,NULL),(55,'エイヒレ','Food',5,360,389,172,NULL),(56,'いか一塩焼','Food',5,420,454,129,NULL),(57,'牛カルビみそ漬焼','Food',5,490,529,387,NULL),(58,'いわし明太','Food',5,390,421,140,NULL),(59,'さばみそ漬焼','Food',5,420,454,315,NULL),(60,'ほうれん草ベーコン','Food',6,300,324,121,NULL),(61,'レバニラ炒め','Food',6,390,421,370,NULL),(62,'鉄板餃子','Food',6,340,367,288,NULL),(63,'赤ウインナー焼','Food',6,290,313,399,NULL),(64,'自家製出し巻玉子','Food',6,420,454,285,NULL),(65,'たこチヂミ','Food',6,390,421,259,NULL),(66,'牛スジ煮込','Food',6,420,454,149,NULL),(67,'サーロインステーキ(おろしポン酢)','Food',6,620,670,527,NULL),(68,'サーロインステーキ(ガーリック風味)','Food',6,620,670,546,NULL),(69,'トンテキ','Food',6,490,529,347,NULL),(70,'コーンバター','Food',6,300,324,309,NULL),(71,'揚出し豆腐','Food',6,300,324,294,NULL),(72,'やわらか豚ヒレカツ玉子とじ','Food',6,490,529,371,NULL),(73,'厚切りベーコンステーキ','Food',6,450,486,324,NULL),(74,'いか肝みそ焼','Food',6,480,518,114,NULL),(75,'水餃子（ピリ辛ダレ）','Food',6,360,389,251,NULL),(76,'チョリソー','Food',6,380,410,520,NULL),(77,'焼肉豆腐','Food',6,360,389,423,NULL),(78,'牛ホルモン鍋','Food',6,680,734,158,NULL),(79,'赤魚煮付け','Food',6,480,518,172,NULL),(80,'ポテトフライ','Food',7,330,356,330,NULL),(81,'鶏軟骨唐揚','Food',7,330,356,168,NULL),(82,'みんなでおつまみ盛り','Food',7,888,959,997,NULL),(83,'黒毛和牛入りメンチカツ','Food',7,350,378,488,NULL),(84,'鶏もも唐揚','Food',7,490,529,574,NULL),(85,'ちくわ磯辺揚','Food',7,250,270,279,NULL),(86,'じゃこ天','Food',7,320,346,217,NULL),(87,'やわらか豚ヒレカツ','Food',7,420,454,266,NULL),(88,'とろろ磯辺揚','Food',7,390,421,370,NULL),(89,'甘えび米粉磯辺揚','Food',7,380,410,181,NULL),(90,'串揚三種','Food',7,350,378,245,NULL),(91,'アジフライ','Food',7,320,346,356,NULL),(92,'もちチー焼','Food',8,420,454,357,NULL),(93,'大盛りもやし炒め','Food',8,380,410,230,NULL),(94,'あらびきウインナー','Food',8,480,518,427,NULL),(95,'鉄板ナポリタン','Food',8,360,389,466,NULL),(96,'ふわふわとろろ芋鉄板焼','Food',8,420,454,180,NULL),(97,'豚バラのからし焼','Food',8,380,410,613,NULL),(98,'スパイシーカレーポテト炒め','Food',8,420,454,448,NULL),(99,'豚キムチ','Food',8,380,410,362,NULL),(100,'バジルピザ','Food',9,380,410,315,NULL),(101,'ミックスピザ','Food',9,680,734,699,NULL),(102,'ミックスピザ[ハーフ]','Food',9,420,454,342,NULL),(103,'ローストビーフピザ（こってり味）','Food',9,680,734,723,NULL),(104,'デザートピザ（北海道産あずき&クリーム）','Food',9,680,734,695,NULL),(105,'ミックスピザ[ハーフ]','Food',9,380,410,377,NULL),(106,'ローストビーフピザ（こってり味）[ハーフ]','Food',9,380,410,386,NULL),(107,'デザートピザ（北海道産あずき&クリーム）[ハーフ]','Food',9,380,410,342,NULL),(108,'塩焼そば','Food',10,390,421,410,NULL),(109,'みそ汁','Food',10,50,54,40,NULL),(110,'キムチチャーハン','Food',10,420,454,452,NULL),(111,'選べるおにぎり（２個）（みそ汁付き）','Food',10,320,346,187,NULL),(112,'ライス','Food',10,180,194,425,NULL),(113,'お茶漬（さけ）','Food',10,320,346,223,NULL),(114,'お茶漬（梅）','Food',10,320,346,202,NULL),(115,'お茶漬（明太子）','Food',10,320,346,212,NULL),(116,'石焼明太子チーズ（リゾット風）','Food',10,390,421,418,NULL),(117,'石焼カルビクッパ','Food',10,480,518,297,NULL),(118,'ざるそば','Food',10,300,324,338,NULL),(119,'ラーメンサラダ','Food',10,480,518,389,NULL),(120,'とろーりチーズ入りハンバーグ','Food',10,480,518,570,NULL),(121,'大盛りソース焼そば','Food',10,888,959,1271,NULL),(122,'アイスブリュレ（「ドリンクメニュー」にも掲載）','Food',11,320,346,194,NULL),(123,'アイスクリーム　ブルーベリーソース掛け（「ドリンクメニュー」にも掲載）','Food',11,150,162,59,NULL),(124,'アイスクレープ　マンゴーソース添え','Food',11,360,389,134,NULL),(125,'シチリア風アイスチーズケーキ（「ドリンクメニュー」にも掲載）','Food',11,320,346,149,NULL),(126,'ごろっとフルーツアイス添え','Food',11,320,346,108,NULL),(127,'濃抹茶アイス北海道産あずき添え','Food',11,200,216,82,NULL),(128,'濃抹茶アイス北海道産あずき添え(ホイップ付き）','Food',11,200,216,107,NULL),(129,'バクハイ 生ビール＆ウイスキー　','Drink',12,310,335,0,NULL),(130,'追加用火薬（バクハイ&カルピスバクハイ用）','Drink',12,70,76,0,NULL),(131,'白バクハイ 生ビール＆マッコリ　','Drink',12,310,335,0,NULL),(132,'追加用白火薬（白バクハイ用）','Drink',12,70,76,0,NULL),(133,'追加用ビーム火薬（ビームバクハイ用）','Drink',12,70,76,0,NULL),(134,'ビームバクハイ 生ビール＆ジムビーム','Drink',12,310,335,0,NULL),(135,'カルピスバクハイ（生ビール&ウイスキー&カルピス）','Drink',12,310,335,0,NULL),(136,'養老ビール＜大びん＞／サッポロビール＜大びん＞','Drink',13,450,486,0,NULL),(137,'サッポロ生ビール黒ラベル＜樽生＞＜大＞','Drink',13,680,734,0,NULL),(138,'サッポロ生ビール黒ラベル＜樽生＞＜中＞','Drink',13,420,454,0,NULL),(139,'ヱビスビール＜大びん＞','Drink',13,480,518,0,NULL),(140,'角ハイボール','Drink',14,380,410,0,NULL),(141,'シークヮーサーハイボール','Drink',14,380,410,0,NULL),(142,'男梅ハイボール','Drink',14,380,410,0,NULL),(143,'ジンジャーハイボール','Drink',14,380,410,0,NULL),(144,'ビームハイボール','Drink',14,380,410,0,NULL),(145,'パイナップルハイボール','Drink',14,380,410,0,NULL),(146,'ラムハイ','Drink',14,380,410,0,NULL),(147,'ラムハイジンジャー','Drink',14,380,410,0,NULL),(148,'極上ハイボール','Drink',14,380,410,0,NULL),(149,'メガ角ハイボール','Drink',14,520,562,0,NULL),(150,'メガビームハイボール','Drink',14,520,562,0,NULL),(151,'サントリー角＜ボトル＞700ml','Drink',15,2000,2160,0,NULL),(152,'サントリー角＜グラス＞（お湯割・水割・ロック）','Drink',15,290,313,0,NULL),(153,'ジムビーム（バーボン）＜ボトル＞700ml','Drink',15,2000,2160,0,NULL),(154,'ジムビーム（バーボン）＜グラス＞（お湯割・水割・ロック）','Drink',15,290,313,0,NULL),(155,'レモンサワー＜中＞','Drink',16,330,356,0,NULL),(156,'青りんごサワー＜中＞','Drink',16,330,356,0,NULL),(157,'カルピスサワー＜中＞','Drink',16,330,356,0,NULL),(158,'シークヮーサーサワー＜中＞','Drink',16,330,356,0,NULL),(159,'玉露入り　緑茶割＜中＞','Drink',16,330,356,0,NULL),(160,'ウコン茶割＜中＞','Drink',16,330,356,0,NULL),(161,'ウーロン茶割＜中＞','Drink',16,330,356,0,NULL),(162,'マンゴーサワー','Drink',16,330,356,0,NULL),(163,'苦くな～い青汁割','Drink',16,330,356,0,NULL),(164,'巨峰サワー','Drink',16,330,356,0,NULL),(165,'男梅サワー','Drink',16,330,356,0,NULL),(166,'超レモンサワー','Drink',16,330,356,0,NULL),(167,'レモンサワー＜大＞','Drink',16,480,518,0,NULL),(168,'青りんごサワー＜大＞','Drink',16,480,518,0,NULL),(169,'カルピスサワー＜大＞','Drink',16,480,518,0,NULL),(170,'シークヮーサーサワー＜大＞','Drink',16,480,518,0,NULL),(171,'玉露入り　緑茶割＜大＞','Drink',16,480,518,0,NULL),(172,'ウコン茶割＜大＞','Drink',16,480,518,0,NULL),(173,'ウーロン茶割＜大＞','Drink',16,480,518,0,NULL),(174,'コーヒー割','Drink',16,330,356,0,NULL),(175,'パイナップルサワー','Drink',16,330,356,0,NULL),(176,'ライムサワー','Drink',16,330,356,0,NULL),(177,'プレミアム玉露入り緑茶割','Drink',16,360,389,0,NULL),(178,'生レモンサワー＜中＞','Drink',17,400,432,0,NULL),(179,'生グレープフルーツサワー＜中＞','Drink',17,400,432,0,NULL),(180,'生キウイフルーツサワー＜中＞','Drink',17,400,432,0,NULL),(181,'梅干サワー（梅干入り）＜中＞','Drink',17,400,432,0,NULL),(182,'生レモンサワー＜大＞','Drink',17,550,594,0,NULL),(183,'生グレープフルーツサワー＜大＞','Drink',17,550,594,0,NULL),(184,'生キウイフルーツサワー＜大＞','Drink',17,550,594,0,NULL),(185,'梅干サワー（梅干入り）＜大＞','Drink',17,550,594,0,NULL),(186,'リモンチェッロソーダ','Drink',18,380,410,0,NULL),(187,'リモンチェッロオレンジ','Drink',18,380,410,0,NULL),(188,'カシスソーダ','Drink',19,330,356,0,NULL),(189,'カシスウーロン','Drink',19,330,356,0,NULL),(190,'カシスオレンジ','Drink',19,330,356,0,NULL),(191,'カシスオレンジスムージー','Drink',19,380,410,0,NULL),(192,'リモンチェッロカルピススムージー','Drink',19,380,410,0,NULL),(193,'ウメカク　ピンクグレープフルーツ　ロック・ソーダ','Drink',20,360,389,0,NULL),(194,'ウメカク　白桃　ロック・ソーダ','Drink',20,360,389,0,NULL),(195,'和りきゅーる　三ヶ日みかん　ロック・ソーダ','Drink',20,360,389,0,NULL),(196,'マッコリ','Drink',21,260,281,0,NULL),(197,'眞露マッコリ＜ボトル＞1000ml','Drink',21,1500,1620,0,NULL),(198,'フルーツマッコリ','Drink',21,330,356,0,NULL),(199,'本格焼酎　よかいち（20度・麦）＜ボトル＞720ml','Drink',22,1200,1296,0,NULL),(200,'本格焼酎　よかいち（20度・麦）＜グラス＞（お湯割・水割・ロック）','Drink',22,340,367,0,NULL),(201,'韓国焼酎　眞露（20度・甲類）＜ボトル＞700ml','Drink',22,1200,1296,0,NULL),(202,'韓国焼酎　眞露（20度・甲類）＜グラス＞（お湯割・水割・ロック）','Drink',22,340,367,0,NULL),(203,'本格焼酎　黒白波（25度・芋）＜ボトル＞720ml','Drink',22,1800,1944,0,NULL),(204,'本格焼酎　黒白波（25度・芋）＜グラス＞（お湯割・水割・ロック）','Drink',22,390,421,0,NULL),(205,'全量芋焼酎　一刻者（25度・芋）＜ボトル＞720ml','Drink',22,2200,2376,0,NULL),(206,'全量芋焼酎　一刻者（25度・芋）＜グラス＞（お湯割・水割・ロック）','Drink',22,440,475,0,NULL),(207,'本格焼酎　黒霧島（25度・芋）＜ボトル＞720ml','Drink',22,1800,1944,0,NULL),(208,'本格焼酎　黒霧島（25度・芋）＜グラス＞（お湯割・水割・ロック）','Drink',22,390,421,0,NULL),(209,'本格焼酎　特撰いいちこ日田全麹（25度・麦）＜ボトル＞720ml','Drink',22,2000,2160,0,NULL),(210,'本格焼酎　特撰いいちこ日田全麹（25度・麦）＜グラス＞（お湯割・水割・ロック）','Drink',22,410,443,0,NULL),(211,'極上　宝焼酎（25度・甲類）＜ボトル＞700ml','Drink',22,1800,1944,0,NULL),(212,'極上　宝焼酎（25度・甲類）＜グラス＞（お湯割・水割・ロック）','Drink',22,340,367,0,NULL),(213,'本格焼酎　神の河Light(20度・麦）＜ボトル＞600ml','Drink',22,1300,1404,0,NULL),(214,'本格焼酎　神の河Light(20度・麦）＜グラス＞（お湯割・水割・ロック）','Drink',22,390,421,0,NULL),(215,'ふんわり鏡月　ライチ＜グラス＞（ロック・水割）','Drink',22,330,356,0,NULL),(216,'ウーロン茶デカンタ（1000ml）','Drink',23,480,518,0,NULL),(217,'玉露入り緑茶デカンタ（1000ml）','Drink',23,480,518,0,NULL),(218,'ウコン茶デカンタ（1000ml）','Drink',23,480,518,0,NULL),(219,'ミネラルウォーター（富士山麓のおいしい天然水・530ml）','Drink',23,200,216,0,NULL),(220,'レモン（１ヶ）','Drink',23,140,151,0,NULL),(221,'グレープフルーツ（１/２ヶ）','Drink',23,140,151,0,NULL),(222,'梅干（１ヶ）','Drink',23,70,76,0,NULL),(223,'氷（アイスペール）','Drink',23,140,151,0,NULL),(224,'お湯（ポット）','Drink',23,140,151,0,NULL),(225,'キウイフルーツ（１/２ヶ）','Drink',23,140,151,0,NULL),(226,'鍛高譚の梅酒＜グラス＞（ロック・ソーダ・お湯割）','Drink',24,360,389,0,NULL),(227,'にごりうめ酒＜グラス＞（ロック・ソーダ・お湯割）','Drink',24,360,389,0,NULL),(228,'白加賀でつくった梅酒＜グラス＞ （ロック・お湯割）','Drink',24,330,356,0,NULL),(229,'乾杯ソーダ梅酒（マドラー変更）','Drink',24,360,389,0,NULL),(230,'焙煎樽仕込梅酒　山崎蒸溜所貯蔵＜グラス＞(ロック・ソーダ・お湯割)','Drink',24,360,389,0,NULL),(231,'白鶴　梅酒原酒＜グラス＞(ロック・ソーダ・お湯割)','Drink',24,360,389,0,NULL),(232,'灘の銘酒 白鶴＜大徳利＞','Drink',25,380,410,0,NULL),(233,'菊水の辛口　本醸造（＋7度）【新潟県】＜１杯＞','Drink',25,300,324,0,NULL),(234,'淡麗魚沼　純米　純米（＋4度）【新潟県】＜１杯＞','Drink',25,330,356,0,NULL),(235,'純米酒　浦霞　純米（＋1～2度）【宮城県】＜１杯＞','Drink',25,390,421,0,NULL),(236,'桃川にごり酒　にごり（-18度：甘口）【青森県】＜１杯＞','Drink',25,300,324,0,NULL),(237,'松竹梅白壁蔵　澪　スパークリング清酒（-70度）300ml','Drink',25,650,702,0,NULL),(238,'白鶴大吟醸　大吟醸（＋3度）【兵庫県】＜１杯＞','Drink',25,370,400,0,NULL),(239,'サッポロ　ポレールワイン（赤）＜ライトボディ・ハーフボトル/360ml＞','Drink',26,740,799,0,NULL),(240,'サッポロ　ポレールワイン（白）＜微かな甘口・ハーフボトル/360ml＞','Drink',26,740,799,0,NULL),(241,'カルロ　ロッシ（赤）＜ライトボディ＞（ロック・ソーダ・グラスワイン）','Drink',26,200,216,0,NULL),(242,'カルロ　ロッシ（赤）＜ライトボディ＞（ロック）','Drink',26,200,216,0,NULL),(243,'カルロ　ロッシ（赤）＜ライトボディ＞（ソーダ）','Drink',26,200,216,0,NULL),(244,'カルロ　ロッシ（赤）＜ライトボディ＞（グラスワイン）','Drink',26,200,216,0,NULL),(245,'サングリア（フルーツ入りワイン）','Drink',26,380,410,0,NULL),(246,'グランポレール エスプリ・ド・ヴァン・ジャポネ 絢－ＡＹＡ－（赤）＜ライトボディ・ボトル/720ml＞','Drink',26,2000,2160,0,NULL),(247,'グランポレール エスプリ・ド・ヴァン・ジャポネ 泉－ＳＥＮ－（白）＜やや辛口・ボトル/720ml＞','Drink',26,2000,2160,0,NULL),(248,'コカ・コーラzero','Drink',27,200,216,0,NULL),(249,'ウーロン茶','Drink',27,200,216,0,NULL),(250,'玉露入り緑茶','Drink',27,200,216,0,NULL),(251,'カルピス','Drink',27,200,216,0,NULL),(252,'リボンシトロン（サイダー）','Drink',27,200,216,0,NULL),(253,'ウコン茶','Drink',27,200,216,0,NULL),(254,'＜一日一杯＞苦くな～い青汁','Drink',27,200,216,0,NULL),(255,'ジンジャーエール','Drink',27,200,216,0,NULL),(256,'アイスコーヒー','Drink',27,200,216,0,NULL),(257,'オレンジジュース（果汁１００％）','Drink',27,250,270,0,NULL),(258,'サッポロ　プレミアムアルコールフリー（334ml）','Drink',27,360,389,0,NULL),(259,'マンゴーオレンジ','Drink',27,270,292,0,NULL),(260,'スパークリングフルーツ','Drink',27,300,324,0,NULL),(261,'ノンアルモヒート','Drink',27,270,292,0,NULL),(262,'巨峰レモンスムージー','Drink',27,270,292,0,NULL),(263,'青りんごカルピススムージー','Drink',27,270,292,0,NULL),(264,'フルーツパンチスムージー','Drink',27,320,346,0,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20170503085344'),('20170503085358'),('20170503085432'),('20170503091521'),('20170503091718'),('20170503092122');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_token` (`token`),
  KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-04 15:33:05
