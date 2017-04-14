-- MySQL dump 10.13  Distrib 5.7.16, for Win32 (AMD64)
--
-- Host: localhost    Database: keytrace
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `random_text`
--

DROP TABLE IF EXISTS `random_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `random_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `random_text`
--

LOCK TABLES `random_text` WRITE;
/*!40000 ALTER TABLE `random_text` DISABLE KEYS */;
INSERT INTO `random_text` VALUES (1,'Your passion is the integral part of you, the minute you lose it you will start losing yourself. Did you ever feel that you hardly even remember the girl you were when you were 16? What gave you that enthusiastic drive to pursue your goals and dreams?'),(2,'No matter how many years passed since you were 16, that girl still lives inside of you. Even though today you have responsibilities, chores and THE schedule you still need to make room for your passion.'),(3,'Living a full life means being bold and courageous in order to protect what you stand for and aspire for your biggest dreams. Every day we face choices and the course your life is taking depends greatly on how courageous you are when making decisions.'),(4,'Our dreams, they feel real while we\'re in them, right? It\'s only when we wake up that we realize how things are actually strange. Let me ask you a question, you, you never really remember the beginning of a dream do you? You always wind up right in the middle of what\'s going on.'),(5,'What\'s the most resilient parasite? An Idea. A single idea from the human mind can build cities. An idea can transform the world and rewrite all the rules. Which is why I have to steal it.'),(6,'You\'re waiting for a train, a train that will take you far away. You know where you hope this train will take you, but you can\'t be sure. But it doesn\'t matter - because we\'ll be together.'),(7,'One is always on a strange road, watching strange scenery and listening to strange music. Then one day, you will find that the things you try hard to forget are already gone.'),(8,'Happiness is not about being immortal nor having food or rights in one\'s hand. It’s about having each tiny wish come true, or having something to eat when you are hungry or having someone\'s love when you need love.'),(9,'One may fall in love with many people during the lifetime. When you finally get your own happiness, you will understand the previous sadness is kind of treasure, which makes you better to hold and cherishthe people you love.'),(10,'When you are young, you may want several love experiences. But as time goes on, you will realize that if you really love someone, the whole life will not be enough.'),(11,'Don’t forget the things you once you owned. Treasure the things you can’t get. Don\'t give up the things that belong to you and keep those lost things in memory.'),(12,'Men love from overlooking while women love from looking up. If love isa mountain, then if men go up, more women they will see while womenwill see fewer men.'),(13,'In your life, there will at least one time that you forget yourself for someone, asking for no result, no company, no ownership nor love. Just ask for meeting you in my most beautiful years.'),(14,'No matter how cruel the destiny treats one with tribulation and misfortune, it will correspondingly treat him with happiness and sweetness. Even if the happiness is short and false, it\'s enough to light up the whole future life.'),(15,'The more you wanna know whether you have forgotten something, the better you remember; I once heard that, the only thing you can do when you no longer have something is not to forget.'),(16,'It is graceful grief and sweet sadness to think of you, but in my heart, there is a kind of soft warmth that can’t be expressed with any choice of words.'),(17,'Thousand of time I have thought of you .My heart is going high into the air and flying with my blessing towards you I don’t care loneliness. I am satisfied when you are happy and I am happy when I think of you!'),(18,'Wish you a happy new year and a good fortune in the coming year when we will share our happiness, think of our good friends, and our dreams come true!'),(19,'I came here tonight because when you realize you want to spend the rest of your life with somebody, you want the rest of the life to start as soon as possoble.'),(20,'Life is filled with regrets. Ask anyone around you what their regrets are and they usually have no difficulty coming up with many items on their regret list. And for some reason our twenties are ripe for a field of regrets.'),(21,'Yesterday is a memory, tommorrow is a dream, so live for today, just do it right now. I believe if you can dream it you can make it, if you do you will win if you don\'t you won\'t. Believe in youself trust youself try your best.'),(22,'Youth is not a time of life, it is a state of mind; it is not rosy cheeks, red lips and supple knees, it is a matter of the emotions: it is the freshness; it is the freshness of the deep springs of life.'),(23,'The road of life is like a large river, because of the power of the currents, river courses appear unexpectedly where there is no flowing water.'),(24,'The failures and reverses which await men and one after another sadden the brow of youth, add a dignity to the prospect of human life, which no Arcadian success would do.'),(25,'May I be strenuous, energetic and persevering! May I be patient! May I be able to bear and forbear the wrongs of others! May I ever keep a promise given!'),(26,'Life without sinuations and frustrations is life the flower in greenhouse, which can not stand the challenge from wind and rain, frost and snow, and will srely die away in the end.'),(27,'Make a note to yourself to start thinking more about what you have than what you want. If you do, your life will start appearing much better than before. For perhaps the first time in your life, you’ll know what it means to feel satisfied.');
/*!40000 ALTER TABLE `random_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (2,'record/148983302950079.csv'),(3,'record/148983341567881.csv');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_pass_hash` varchar(40) NOT NULL,
  `user_pass_record` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (15,'','d41d8cd98f00b204e9800998ecf8427e','key,ms,type\nkey,ms,type\n'),(16,'zhao','8e5ec213551d3e8a4a09ab490e7d096c','key,ms,type\n9,0,1\n57,504,0\n57,559,1\n57,647,0\n57,711,1\n52,807,0\n53,872,0\n52,936,1\n53,991,1\n57,1023,0\n57,1087,1\n57,1184,0\n57,1239,1\n9,1351,0\nkey,ms,type\n9,0,1\n57,136,0\n57,200,1\n57,280,0\n57,368,1\n52,784,0\n53,888,0\n52,928,1\n53,991,1\n57,1008,0\n57,1072,1\n57,1144,0\n57,1224,1\n13,1776,0\n13,1816,1\n'),(17,'hello','df6d2338b2b8fce1ec2f6dda0a630eb0','key,ms,type\n9,0,1\n57,1439,0\n56,1535,0\n57,1639,1\n56,1703,1\n55,1895,0\n55,2031,1\n9,2744,0\nkey,ms,type\n9,0,1\n57,265,0\n56,384,0\n57,480,1\n56,512,1\n55,632,0\n55,720,1\n');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_text_record`
--

DROP TABLE IF EXISTS `user_text_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_text_record` (
  `user_id` int(11) DEFAULT NULL,
  `record` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_text_record`
--

LOCK TABLES `user_text_record` WRITE;
/*!40000 ALTER TABLE `user_text_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_text_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-13 17:23:22
