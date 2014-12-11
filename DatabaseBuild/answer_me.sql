-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: answer_me
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `contain`
--
/*使用方法 在phpmyadmin中把下面代码复制到SQL选卡的文本框中单击执行中即可*/

create database IF NOT EXISTS answer_me default character set utf8;

use answer_me;

DROP TABLE IF EXISTS `contain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contain` (
  `cid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  PRIMARY KEY (`cid`,`hid`),
  KEY `hid` (`hid`),
  CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `courseindex` (`cid`),
  CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`hid`) REFERENCES `homeworkindex` (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contain`
--

LOCK TABLES `contain` WRITE;
/*!40000 ALTER TABLE `contain` DISABLE KEYS */;
/*!40000 ALTER TABLE `contain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `teacher` varchar(255) NOT NULL,
  `course_time` varchar(255) NOT NULL,
  `course_place` varchar(255) NOT NULL,
  `editor` varchar(255) NOT NULL,
  `update_time` datetime NOT NULL,
  `brief` text NOT NULL,
  `profession` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL,
  `school` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,1,'book_1.jpg','电子商务物流','王平','周二3-5节','公共教学楼B401','2333','2014-02-24 12:12:23','电子商务物流是一整套的电子物流解决方案，就是俗话说的ERP系统，电子上的物流显示及相关操作，物流还是需要机器和人搬运的。电子商务物流还要从传统物流做起。目前国内外的各种物流配送虽然大都跨越了简单送货上门的阶段，但在层次上仍是传统意义上的物流配送，因此在经营中存在着传统物流配送无法克服的种种弊端和问题，尚不具备或基本不具备信息化、现代化、社会化的新型物流配送的特征。','数字媒体','软件学院','中山大学'),(2,1,'book_2.jpg','实用软件工程','王军','周三3-5节','公共教学楼B302','6666','2014-04-21 09:22:31','软件工程的内容与方法、软件生命周期与开发模型、软件立项与合同、软件需求、软件策划、软件建模、软件设计、软件测试、软件实施与维护和软件管理。','数字媒体','软件学院','中山大学'),(3,1,'book_3.jpg','高等数学导论','陆群','周四13-15节','公共教学楼C205','我爸是李刚','2014-10-31 23:11:21','从专业实际需要出发，把教学的重点定位在对学生数学应用能力的培养方面。对教材的编写内容作了创新，首先，在每一节内容的一开始通过一些引例激发学生的兴趣，引出本节内容。其次，在每一节结束都安排知识应用案例，使学生能灵活应用本节知识解决实际问题。最后，在每一节后都有习题，每一章后有复习题给学生提供大量的练习机会。每一章后还安排了数学实验，使学生学会用数学软件解决复杂的数学计算问题。','计算机应用','软件学院','中山大学'),(4,1,'book_4.jpg','线性代数简明教程','高成英','周五9-11节','公共教学楼A101','你妈喊你回家吃饭','2014-02-24 00:12:20','行列式，矩阵，向量空间，线性方程组，矩阵的相似对角化，二次型，线性空间与线性变换等。','电子政务','软件学院','中山大学'),(5,1,'book_5.jpg','离散数学','吴向军','周二7-9节','公共教学楼D103','下雨啦回家收衣服啦','2014-09-15 12:12:57','离散数学(Discrete mathematics)是研究离散量的结构及其相互关系的数学学科，是现代数学的一个重要分支。离散的含义是指不同的连接在一起的元素，主要是研究基于离散量的结构和相互间的关系，其对象一般是有限个或可数个元素。','数字媒体','软件学院','中山大学'),(6,1,'book_6.jpg','数字集成电路','王新明','周二4-6节','公共教学楼B202','今天怎么不开心','2014-01-22 09:12:23','数字集成电路是将元器件和连线集成于同一半导体芯片上而制成的数字逻辑电路或系统。根据数字集成电路中包含的门电路或元、器件数量，可将数字集成电路分为小规模集成（SSI）电路、中规模集成MSI电路、大规模集成（LSI）电路、超大规模集成VLSI电路和特大规模集成（ULSI）电路。','嵌入式软件','软件学院','中山大学'),(7,1,'book_7.jpg','数据库系统教程','冯建林','周三11-13节','公共教学楼B101','suspension system','2014-02-25 12:24:25','数据库基本概念、关系运算、SQL语言、数据库管理、规范化设计、ER模型、高级概念建模活动、对象关系数据库、面向对象数据库、分布式数据库、异构多数据源的访问、XML技术、数据仓库、OLAP技术和数据挖掘。','嵌入式软件','软件学院','中山大学'),(8,1,'book_8.jpg','计算机网络教程','郑轨','周一3-5节','公共教学楼E504','张全蛋','2014-07-21 08:11:23','系统地介绍了计算机网络的基本概念、原理与技术，包括绪论、物理层、数据链路层、局域网、网络层、传输层、应用层和网络安全共8章内容','软件工程','软件学院','中山大学');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseindex`
--

DROP TABLE IF EXISTS `courseindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseindex` (
  `cid` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `like_number` int(11) NOT NULL,
  `taken_number` int(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseindex`
--

LOCK TABLES `courseindex` WRITE;
/*!40000 ALTER TABLE `courseindex` DISABLE KEYS */;
INSERT INTO `courseindex` VALUES (1,1,12,21),(2,1,45,54),(3,1,56,54),(4,1,89,66),(5,1,23,32),(6,1,56,65),(7,1,78,87),(8,1,23,32);
/*!40000 ALTER TABLE `courseindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `createcourse`
--

DROP TABLE IF EXISTS `createcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `createcourse` (
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`uid`,`cid`,`version`),
  KEY `cid` (`cid`,`version`),
  CONSTRAINT `createcourse_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `createcourse_ibfk_2` FOREIGN KEY (`cid`, `version`) REFERENCES `course` (`cid`, `version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `createcourse`
--

LOCK TABLES `createcourse` WRITE;
/*!40000 ALTER TABLE `createcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `createcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `createhw`
--

DROP TABLE IF EXISTS `createhw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `createhw` (
  `uid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`uid`,`hid`,`version`),
  KEY `hid` (`hid`,`version`),
  CONSTRAINT `createhw_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `createhw_ibfk_2` FOREIGN KEY (`hid`, `version`) REFERENCES `homework` (`hid`, `version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `createhw`
--

LOCK TABLES `createhw` WRITE;
/*!40000 ALTER TABLE `createhw` DISABLE KEYS */;
/*!40000 ALTER TABLE `createhw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editcourse`
--

DROP TABLE IF EXISTS `editcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editcourse` (
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `edit_time` datetime NOT NULL,
  PRIMARY KEY (`uid`,`cid`,`version`),
  KEY `cid` (`cid`,`version`),
  CONSTRAINT `editcourse_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `editcourse_ibfk_2` FOREIGN KEY (`cid`, `version`) REFERENCES `course` (`cid`, `version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editcourse`
--

LOCK TABLES `editcourse` WRITE;
/*!40000 ALTER TABLE `editcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `editcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edithw`
--

DROP TABLE IF EXISTS `edithw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edithw` (
  `uid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `edit_time` datetime NOT NULL,
  PRIMARY KEY (`uid`,`hid`,`version`),
  KEY `hid` (`hid`,`version`),
  CONSTRAINT `edithw_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `edithw_ibfk_2` FOREIGN KEY (`hid`, `version`) REFERENCES `homework` (`hid`, `version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edithw`
--

LOCK TABLES `edithw` WRITE;
/*!40000 ALTER TABLE `edithw` DISABLE KEYS */;
/*!40000 ALTER TABLE `edithw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homework` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `editor` varchar(255) NOT NULL,
  `update_time` datetime NOT NULL,
  `due_time` datetime NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`hid`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeworkindex`
--

DROP TABLE IF EXISTS `homeworkindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homeworkindex` (
  `hid` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `like_number` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeworkindex`
--

LOCK TABLES `homeworkindex` WRITE;
/*!40000 ALTER TABLE `homeworkindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `homeworkindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `type` int(1) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `own`
--

DROP TABLE IF EXISTS `own`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `own` (
  `uid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`mid`),
  KEY `mid` (`mid`),
  CONSTRAINT `own_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `own_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `material` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `own`
--

LOCK TABLES `own` WRITE;
/*!40000 ALTER TABLE `own` DISABLE KEYS */;
/*!40000 ALTER TABLE `own` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `take`
--

DROP TABLE IF EXISTS `take`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `take` (
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `HW_now` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`cid`),
  KEY `cid` (`cid`),
  CONSTRAINT `take_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `take_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `courseindex` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `take`
--

LOCK TABLES `take` WRITE;
/*!40000 ALTER TABLE `take` DISABLE KEYS */;
INSERT INTO `take` VALUES (4,1,0),(4,2,0),(4,5,0);
/*!40000 ALTER TABLE `take` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload`
--

DROP TABLE IF EXISTS `upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload` (
  `uid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `upload_time` datetime NOT NULL,
  PRIMARY KEY (`uid`,`mid`),
  KEY `mid` (`mid`),
  CONSTRAINT `upload_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `upload_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `material` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload`
--

LOCK TABLES `upload` WRITE;
/*!40000 ALTER TABLE `upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `experience` int(11) NOT NULL,
  `school` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `entry_year` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'yangliu','625e4b21a62c3986b62cbf065e585080','1151730511@qq.com',0,'软件学院','中山大学','数字媒体',2012);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-10 22:07:25
