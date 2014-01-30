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
-- Table structure for table `book_book`
--

DROP TABLE IF EXISTS `book_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_book` (
  `bookid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `place` int(11) DEFAULT NULL,
  `publisher` int(11) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `copyrighter` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `translated` tinyint(1) NOT NULL,
  `purchdate` date NOT NULL,
  `price` double NOT NULL,
  `pubdate` date NOT NULL,
  `printdate` date NOT NULL,
  `ver` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `deco` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `kword` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `isbn` varchar(17) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `instock` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookid_UNIQUE` (`bookid`),
  KEY `IDX_D278E839741D53CD` (`place`),
  KEY `IDX_D278E8399CE8D546` (`publisher`),
  CONSTRAINT `fk_book_place` FOREIGN KEY (`place`) REFERENCES `book_place` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_publisher` FOREIGN KEY (`publisher`) REFERENCES `book_publisher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_headline`
--

DROP TABLE IF EXISTS `book_headline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_headline` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `reviewtitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_at` date NOT NULL,
  `display` tinyint(1) NOT NULL,
  PRIMARY KEY (`hid`),
  UNIQUE KEY `bid_UNIQUE` (`bid`),
  KEY `IDX_F91777E436BB5955` (`bid`),
  CONSTRAINT `fk_headline_book` FOREIGN KEY (`bid`) REFERENCES `book_book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_place`
--

DROP TABLE IF EXISTS `book_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_publisher`
--

DROP TABLE IF EXISTS `book_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_review`
--

DROP TABLE IF EXISTS `book_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `datein` date NOT NULL,
  `URI` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_review_ibfk_1` (`hid`),
  CONSTRAINT `fk_review_headline` FOREIGN KEY (`hid`) REFERENCES `book_headline` (`hid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_taglist`
--

DROP TABLE IF EXISTS `book_taglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_taglist` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `tag` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `bookid` (`bid`,`tag`),
  KEY `bookid_2` (`bid`),
  CONSTRAINT `fk_tag_book` FOREIGN KEY (`bid`) REFERENCES `book_book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4391 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_visit`
--

DROP TABLE IF EXISTS `book_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_visit` (
  `bid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `visitwhen` datetime NOT NULL,
  PRIMARY KEY (`bid`,`visitwhen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lakers`
--

DROP TABLE IF EXISTS `lakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lakers` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `team` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `selfscore` int(11) NOT NULL,
  `oppscore` int(11) NOT NULL,
  `dateplayed` date NOT NULL,
  `winlose` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qotd`
--

DROP TABLE IF EXISTS `qotd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qotd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote` longtext COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'rsywx_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-30  8:31:05
