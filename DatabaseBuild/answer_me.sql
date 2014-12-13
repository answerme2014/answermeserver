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
INSERT INTO `contain` VALUES (1,1),(1,2),(1,3),(1,4),(3,5),(3,6),(3,7),(8,8),(8,9),(8,10),(5,11),(5,12),(2,13),(2,14),(2,15),(7,16),(7,17),(7,18),(6,19),(4,20),(4,21),(4,22);
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
INSERT INTO `course` VALUES (1,1,'book_1.jpg','电子商务物流','王平','周二3-5节','公共教学楼B401','yangliu','2014-02-24 12:12:23','电子商务物流是一整套的电子物流解决方案，就是俗话说的ERP系统，电子上的物流显示及相关操作，物流还是需要机器和人搬运的。电子商务物流还要从传统物流做起。目前国内外的各种物流配送虽然大都跨越了简单送货上门的阶段，但在层次上仍是传统意义上的物流配送，因此在经营中存在着传统物流配送无法克服的种种弊端和问题，尚不具备或基本不具备信息化、现代化、社会化的新型物流配送的特征。','数字媒体','软件学院','中山大学'),(2,1,'book_2.jpg','实用软件工程','王军','周三3-5节','公共教学楼B302','yangliu','2014-04-21 09:22:31','软件工程的内容与方法、软件生命周期与开发模型、软件立项与合同、软件需求、软件策划、软件建模、软件设计、软件测试、软件实施与维护和软件管理。','数字媒体','软件学院','中山大学'),(3,1,'book_3.jpg','高等数学导论','陆群','周四13-15节','公共教学楼C205','yanyan','2014-10-31 23:11:21','从专业实际需要出发，把教学的重点定位在对学生数学应用能力的培养方面。对教材的编写内容作了创新，首先，在每一节内容的一开始通过一些引例激发学生的兴趣，引出本节内容。其次，在每一节结束都安排知识应用案例，使学生能灵活应用本节知识解决实际问题。最后，在每一节后都有习题，每一章后有复习题给学生提供大量的练习机会。每一章后还安排了数学实验，使学生学会用数学软件解决复杂的数学计算问题。','计算机应用','软件学院','中山大学'),(4,1,'book_4.jpg','线性代数简明教程','高成英','周五9-11节','公共教学楼A101','wangxinyan','2014-02-24 00:12:20','行列式，矩阵，向量空间，线性方程组，矩阵的相似对角化，二次型，线性空间与线性变换等。','电子政务','软件学院','中山大学'),(5,1,'book_5.jpg','离散数学','吴向军','周二7-9节','公共教学楼D103','xiaowenhui','2014-09-15 12:12:57','离散数学(Discrete mathematics)是研究离散量的结构及其相互关系的数学学科，是现代数学的一个重要分支。离散的含义是指不同的连接在一起的元素，主要是研究基于离散量的结构和相互间的关系，其对象一般是有限个或可数个元素。','数字媒体','软件学院','中山大学'),(6,1,'book_6.jpg','数字集成电路','王新明','周二4-6节','公共教学楼B202','lixiaoliang','2014-01-22 09:12:23','数字集成电路是将元器件和连线集成于同一半导体芯片上而制成的数字逻辑电路或系统。根据数字集成电路中包含的门电路或元、器件数量，可将数字集成电路分为小规模集成（SSI）电路、中规模集成MSI电路、大规模集成（LSI）电路、超大规模集成VLSI电路和特大规模集成（ULSI）电路。','嵌入式软件','软件学院','中山大学'),(7,1,'book_7.jpg','数据库系统教程','冯剑琳','周三11-13节','公共教学楼B101','lixiaoliang','2014-02-25 12:24:25','数据库基本概念、关系运算、SQL语言、数据库管理、规范化设计、ER模型、高级概念建模活动、对象关系数据库、面向对象数据库、分布式数据库、异构多数据源的访问、XML技术、数据仓库、OLAP技术和数据挖掘。','嵌入式软件','软件学院','中山大学'),(8,1,'book_8.jpg','计算机网络','郑贵峰','周一3-5节','公共教学楼E504','xuhang','2014-07-21 08:11:23','系统地介绍了计算机网络的基本概念、原理与技术，包括绪论、物理层、数据链路层、局域网、网络层、传输层、应用层和网络安全共8章内容','软件工程','软件学院','中山大学');
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
INSERT INTO `createcourse` VALUES (8,3,1,'2014-10-31 23:11:21'),(9,4,1,'2014-02-24 00:12:20'),(12,8,1,'2014-07-21 08:11:23'),(13,6,1,'2014-01-22 09:12:23'),(13,7,1,'2014-02-25 12:24:25'),(14,5,1,'2014-09-15 12:12:57'),(16,1,1,'2014-02-24 12:12:23'),(16,2,1,'2014-04-21 09:22:31');
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
INSERT INTO `createhw` VALUES (8,1,1,'2014-09-09 12:00:21'),(8,10,1,'2014-09-15 19:30:12'),(8,19,1,'2014-09-09 12:00:21'),(9,2,1,'2014-09-16 14:22:22'),(9,11,1,'2014-09-17 12:00:00'),(9,20,1,'2014-09-16 12:00:00'),(10,3,1,'2014-09-23 22:11:20'),(10,12,1,'2014-10-03 12:00:00'),(10,21,1,'2014-09-25 12:00:00'),(11,4,1,'2014-10-07 22:21:33'),(11,13,1,'2014-09-09 12:01:21'),(11,22,1,'2014-10-02 12:00:00'),(12,5,1,'2014-11-09 08:00:21'),(12,14,1,'2014-09-09 15:30:21'),(13,6,1,'2014-11-17 18:12:12'),(13,15,1,'2014-09-21 12:12:21'),(14,7,1,'2014-12-01 19:30:12'),(14,16,1,'2014-09-09 12:00:21'),(15,8,1,'2014-08-21 12:30:12'),(15,17,1,'2014-09-16 12:22:22'),(16,9,1,'2014-09-01 19:30:12'),(16,18,1,'2014-09-23 11:11:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (1,1,'第一次作业','yanyan','2014-09-09 12:00:21','2014-09-15 23:59:59','简答：\r\n1.什么是物流？其功能是什么？\r\n2.物流有哪些分类？\r\n3.什么是物流系统？其构成情况如何？\r\n4.物流管理的具体内容有哪些？\r\n5.什么是电子商务物流？有什么特点？\r\n6.什么是第三方物流？\r\n7.物流的基本技术有哪些？'),(2,1,'第二次作业','wangxinyan','2014-09-16 14:22:22','2014-09-23 23:59:59','判断：\r\n1.装卸搬运是物流系统中最基本功能要素之一，存在于货物运输、储存、包装、流通加工和配送等过程中，贯穿于物流作业的始末。（）\r\n2.物流技术及其装备是构筑物流系统的主要成本因素。（）\r\n3.企业自动化物流系统，可使各种物料最合理、最经济、最有效地流动，最终实现商流物流合一。（）\r\n4.装卸搬运技术装备用于生产企业内部物料的起重输送和搬运、用于船舶与车辆货物的装卸以及库场货物的堆垛等。（）\r\n5.起重机械只能用于垂直升降货物，以满足货物的装卸作业要求。（）\r\n6.自动导向搬运车系统是一种使车辆按照给定路线自动运行到指定场所，完成物料搬运作业的系统。（）\r\n7.仓储技术设备能调节物资的供需，实现物资的配送功能和节约物资的功能。（   ）\r\n8.货架可充分利用仓库空间，提高库容利用率，并可做到先进先出。          （   ）\r\n9.分拣是把货物按不同品种、不同单位和不同储位分配到所设置的场所的一种搬运过程。                                                                    （   ）\r\n10.集装单元化就是把一定的物料整齐地集结成一个便于储放、搬运和运输的单元。（   ）\r\n11.集装单元化技术是适合于小批量、长距离输送和机械化大生产，便于采用自动控制管理的一种现代科学技术。                                                 （   ）\r\n12.集装单元化技术是指物流管理中物流设备如集装箱、托盘等硬技术。       （   ）\r\n13.集装单元化系统是由货物单元、集装器具、物料搬运装备设备和输送设备等组成的具有物流功能的运作系统。                                         （   ）\r\n14.包装的目的就是保护产品，便于储存和运输。                       （   ）\r\n15.按包装功能可分为工业包装和商业包装。工业包装也称为运输包装，其目的是保证商品在运输、保管、装卸搬运过程中保持商品的完好。                      （   ）\r\n16.产品包装处于生产的始点，又是进入流通领域商品物流链的终点。  （   ）\r\n答案：\r\n1．  √    2.  √  3.  ×     4.  √      5.   ×     6.  √   7． ×     8.  √   \r\n9.   √    10.  ×  11． ×   12.  ×     13.  √    14.  ×   15． √    16. ×'),(3,1,'第三次作业','shuizemin','2014-09-23 22:11:20','2014-10-01 23:59:59','一、单项选择题\r\n1.身份认证的主要目标包括：确保交易者是交易者本人、避免与超过权限的交易者进行交易和_______。\r\n(A) 可信性\r\n(B) 访问控制\r\n(C) 完整性\r\n(D) 保密性\r\n答案：B；\r\n2.目前最安全的身份认证机制是_______。\r\n(A) 一次口令机制\r\n(B) 双因素法\r\n(C) 基于智能卡的用户身份认证\r\n(D) 身份认证的单因素法\r\n答案：A；\r\n3.下列是利用身份认证的双因素法的是_______。\r\n(A) 电话卡\r\n(B) 交通卡\r\n(C) 校园饭卡\r\n(D) 银行卡\r\n答案：D；\r\n4.下列环节中无法实现信息加密的是_______。\r\n(A) 链路加密\r\n(B) 上传加密\r\n(C) 节点加密\r\n(D) 端到端加密\r\n答案：B；\r\n5基于私有密钥体制的信息认证方法采用的算法是_______。\r\n(A) 素数检测\r\n(B) 非对称算法\r\n(C) RSA算法\r\n(D) 对称加密算法\r\n答案：D；\r\n6.RSA算法建立的理论基础是_______。\r\n(A) DES\r\n(B) 替代相组合\r\n(C) 大数分解和素数检测\r\n(D) 哈希函数\r\n答案：C；\r\n7.防止他人对传输的文件进行破坏需要 _______。\r\n(A) 数字签字及验证\r\n(B) 对文件进行加密\r\n(C) 身份认证\r\n(D) 时间戳\r\n答案：A；\r\n8.下面的机构如果都是认证中心，你认为可以作为资信认证的是_______。\r\n(A) 国家工商局\r\n(B) 著名企业\r\n(C) 商务部\r\n(D) 人民银行\r\n答案：D；\r\n9.属于黑客入侵的常用手段_______。\r\n(A) 口令设置\r\n(B) 邮件群发\r\n(C) 窃取情报\r\n(D) IP欺骗\r\n答案：D；\r\n10.我国电子商务立法目前所处的阶段是_______。\r\n(A) 已有《电子商务示范法》\r\n(B) 已有多部独立的电子商务法\r\n(C) 成熟的电子商务法体系\r\n(D) 还没有独立的电子商务法\r\n答案：D；\r\n二、多项选择题\r\n1. 网络交易的信息风险主要来自_______。\r\n(A) 冒名偷窃\r\n(B) 篡改数据\r\n(C) 信息丢失\r\n(D) 虚假信息\r\n答案：A、B、C；\r\n2. 典型的电子商务采用的支付方式是_______。\r\n(A) 汇款\r\n(B) 交货付款\r\n(C) 网上支付\r\n(D) 虚拟银行的电子资金划拨\r\n答案：C、D；\r\n3. 简易的电子商务采用的支付方式是_______。\r\n(A) 汇款\r\n(B) 交货付款\r\n(C) 网上支付\r\n(D) 虚拟银行的电子资金划拨\r\n答案：A、B；\r\n4. 安全认证主要包括_______。\r\n(A) 时间认证\r\n(B) 支付手段认证\r\n(C) 身份认证\r\n(D) 信息认证\r\n答案：C、D；\r\n5. 在企业电子商务的安全认证中，信息认证主要用于_______。\r\n(A) 信息的可信性\r\n(B) 信息的完整性\r\n(C) 通信双方的不可抵赖性\r\n(D) 访问控制\r\n答案：A、B、C；\r\n6. 数字证书按照安全协议的不同，可分为_______。\r\n(A) 单位数字证书\r\n(B) 个人数字证书\r\n(C) SET数字证书\r\n(D) SSL数字证书\r\n答案：C、D；\r\n7. 下列说法中正确的是_______。\r\n(A) 身份认证是判明和确认贸易双方真实身份的重要环节\r\n(B) 不可抵赖性是认证机构或信息服务商应当提供的认证功能之一\r\n(C) 身份认证要求对数据和信息的来源进行验证，以确保发信人的身份\r\n(D) SET是提供公钥加密和数字签名服务的平台\r\n答案：A、B；\r\n?\r\n8．属于传统防火墙的类型有_______。\r\n(A) 包过滤\r\n(B) 远程磁盘镜像技术\r\n(C) 电路层网关\r\n(D) 应用层网关\r\n(E) 入侵检测技术\r\n答案：A、C、D；\r\n9．目前运用的数据恢复技术主要是_______。\r\n(A) 瞬时复制技术\r\n(B) 远程磁盘镜像技术\r\n(C) 数据库恢复技术\r\n(D) 系统还原技术\r\n答案：A、B、C；\r\n?\r\n10．属于电子商务的立法目的考虑的方面是_______。\r\n(A) 为电子商务的健康、快速发展创造一个良好的法律环境\r\n(B) 鼓励利用现代信息技术促进交易活动\r\n(C) 弥补现有法律的缺陷和不足\r\n(D) 与联合国《电子商业示范法》保持一致\r\n答案：A、B、C；'),(4,1,'第四次作业','wanchengcheng','2014-10-07 22:21:33','2014-10-14 23:59:59','填空题\r\n1．对网络交易的风险必须进行深入的分析，并从技术、_________和_________角度提出风险控制办法。\r\n答案：管理；法律；\r\n2．_______是网络交易成功与否的关键所在。\r\n答案：网络交易安全问题；\r\n3. 一个完整的网络交易安全体系，至少应包括三类措施。一是_______方面的措施；二是_______方面的措施；三是社会的法律政策与法律保障。\r\n答案：技术；管理；\r\n4. 客户认证主要包括_______和_______。\r\n答案：客户身份认证；客户信息认证；\r\n5. 身份认证包含_______和_______两个过程。\r\n答案：识别；鉴别；\r\n6. 基于私有密钥体制的信息认证是一种传统的信息认证方法。这种方法采用_______算法，该种算法中最常用的是_______算法。\r\n答案：对称加密；DES；\r\n7. _______及验证是实现信息在公开网络上的安全传输的重要方法。该方法过程实际上是通过_______来实现的。\r\n答案：数字签字；哈希函数；\r\n8. 时间戳是一个经加密后形成的凭证文档，它包括需加_______的文件的摘要（digest）、DTS收到文件的日期和时间和_______三个部分。\r\n答案：时间戳；DTS的数字签字；\r\n9. PKI/公钥是提供公钥加密和数字签字服务的安全基础平台，目的是管理_______和_______。\r\n答案：基础设施；密钥证书；\r\n10. 一个典型的PKI应用系统包括五个部分：_______、_______、证书签发子系统、证书发布子系统和目录服务子系统。\r\n答案：密钥管理子系统；证书受理子系统；\r\n11. 同传统的商务交易一样，电子商务交易认证主要涉及的内容有_______、_______、税收认证和外贸认证。\r\n答案：身份认证；资信认证；\r\n12. 比较常用的防范黑客的技术产品有_______、_______和安全工具包/软件。\r\n答案：网络安全检测设备；防火墙；\r\n13. 新型防火墙的设计目标是既有________的功能，又能在________进行代理，能从链路层到应用层进行全方位安全处理。\r\n答案：包过滤；应用层数据；\r\n14. 物理隔离技术是近年来发展起来的防止外部黑客攻击的有效手段。物理隔离产品主要有________和_______。\r\n答案：物理隔离卡；隔离网闸；\r\n15. 信息的安全级别一般可分为三级：_______、_______、秘密级。\r\n答案：绝密级；机密级；'),(5,1,'第一次作业','xuhang','2014-11-09 08:00:21','2014-11-15 23:59:59','1、一列客车从甲地开往乙地，同时一列货车从甲地开往乙地，当货车行了180千米时，客车行了全程的七分之四；当客车到达乙地时，货车行了全程的八分之七。甲乙两地相距多少千米？\r\n 解：\r\n 把全部路程看作单位1\r\n 那么客车到达终点行了全程，也就是单位1\r\n 当客车到达乙地时，货车行了全程的八分之七\r\n 相同的时间，路程比就是速度比\r\n 由此我们可以知道客车货车的速度比=1：7/8=8：7\r\n 所以客车行的路程是货车的8/7倍\r\n 所以当客车行了全程的4/7时\r\n 货车行了全程的（4/7）/（8/7）=1/2\r\n 那么甲乙两地相距180/（1/2）=360千米\r\n 1/2就是180千米的对应分率\r\n 分析：此题中运用了单位1，用到了比例问题，我们要熟练掌握比例，对于路程、速度和时间之间的关系，一定要清楚，在速度或时间一定时，路程都和另外一个量成正比例，当路程一定时，速度和时间成反比例，这个是基本常识。\r\n\r\n 2、甲、乙两车同时从A、B两地相对开出，2小时相遇。相遇后两车继续前行，当甲车到达B地时，乙车离A地还有60千米，一直两车速度比是3:2。求甲乙两车的速度。\r\n 解：将全部路程看作单位1\r\n 速度比=路程比=3：2，也就是说乙行的路程是甲的2/3\r\n 那么甲到达B地时，行了全部路程，乙行了1×2/3=2/3\r\n 此时距离终点A还有1-2/3=1/3\r\n 那么全程=60/（1/3）=180千米\r\n 速度和=180/2=90千米/小时\r\n 甲的速度=90×3/（3+2）=54千米/小时\r\n 乙的速度=90-54=36千米/小时\r\n\r\n 3、甲、乙两车分别同时从A、B两成相对开出,甲车从A城开往B城,每小时行全程的10%,乙车从B城开往A城，每小时行8千米，当甲车距A城260千米时，乙车距B地320千米。A、B两成之间的路程有多少千米？\r\n 解：这个问题可以看作相遇问题，因为是相向而行\r\n 乙车还要行驶320/8=4小时\r\n 4个小时甲车行驶全程的10%×4=40%=2/5\r\n 那么甲车还要行驶全程的2/5，也就是剩下的260千米\r\n AB距离=260/（2/5）=650千米\r\n\r\n 4、一客车和一货车同时从甲乙两地相对开出,经过3小时相遇,相遇后仍以原速继续行驶，客车行驶2小时到达乙地，此时货车距离甲地150千米，求甲乙两地距离？\r\n 解：解此题的关键是把甲乙看成一个整体，问题就迎刃而解了。\r\n 甲乙每小时行驶全程的1/3\r\n 那么2小时行驶2x1/3=2/3\r\n 甲乙相距=150/（1-2/3）=450千米'),(6,1,'第二次作业','lixiaoliang','2014-11-17 18:12:12','2014-11-25 23:59:59','1.学校建校舍计划投资45万元，实际投资40万元。实际投资节约了百分之几？(浙江诸暨市) \r\n\r\n2.学校五月份计划用电480度，实际少用60度。实际用电节省百分之几？(福建云宵实验小学) \r\n\r\n3.某厂计划三月份生产电视机400台，实际上半个月生产了250台，下半个月生产了230台，实际超额完成计划的百分之几？(南昌市青云谱区) \r\n\r\n4.现有甲、乙、丙三个水管，甲水管以每秒4克的流量流出含盐20％的盐水，乙水管以每秒6克的流量流出含盐15％的盐水，丙水管以每秒10克的流量流出水，丙管打开后开始2秒不流，接着流5秒，然后又停2秒，再流5秒……三管同时打开，1分钟后都关上，这时流出的混合液含盐百分之几？(武汉大学附属外国语学校) \r\n\r\n5.新光小学书画班有75人，舞蹈班有48人，书画班人数比舞蹈班多百分之几？(南宁市)'),(7,1,'第三次作业','xiaowenhui','2014-12-01 19:30:12','2014-12-15 23:59:59','一批商品，按期望获得50%的利润来定价，结果只销掉70%的商品，为尽早销掉剩下商品，商店决定按定价打折出售，这样所获的全部利润是原来期望利润的82%。问打了多少折扣？\r\n1）由按期望获得50%的利润来定价，结果只销掉70%的商品可知：所获的利润是35%，30%的商品所获的利润是15%\r\n（2）由为尽早销掉剩下商品，商店决定按定价打折出售，这样所获的全部利润是原来期望利润的82%可知：所获的利润是41%。\r\n（3）可知剩下商品是30%所获的利润为原来期望利润的41%-35%=6%。\r\n（4）1*（30%+6%）/1*（30%+15%）=80%\r\n（5）打了八折\r\n1、小力在玩游戏时 把一个底面直径为1.2分米 高15分米的铅锤放入一个装有水且底面直径为2.2分米的圆柱型的玻璃杯中 水没有溢出 当取出铅锤后 杯里的水下降了几厘米? 保留2位小数 \r\n2、在一个高3分米底面半径2分米的圆锥形容器里装满沙子，再将这些沙子全部倒入一个圆柱形容器内，刚好装了圆柱形容器的7分之2，这个容器容积是多少立方分米？ \r\n3、圆柱的底面半径6厘米,高7厘米,侧面积、表面积、体积各是多少 \r\n4、一个圆锥和一个圆柱的底面积相等，已知圆锥与圆柱的体积比是1：6，圆锥的高为4.8厘米，圆柱的高是多少cm                                         5、小红用5.50元钱可买2支相同的铅笔和一个笔记本。当文具价格上涨10%后，5.50元恰好能买一只同样的铅笔和一个笔记本，若价格又上涨10%后，这5.50元钱还够不够买一个笔记本？                                                                                     二、按规律填数。 \r\n\r\n1）64，48，40，36，34，( ) \r\n2）8，15，10，13，12，11，( ) \r\n3)1、4、5、8、9、（ ）、13、（ ）、（ ） \r\n4)2、4、5、10、11、（ ）、（ ） \r\n5)5,9,13,17,21,( ),( ) \r\n三、等差数列 \r\n1.在等差数列3，12，21，30，39，48，…中912是第几个数？ \r\n\r\n2.求1至100内所有不能被5或9整除的整数和 \r\n\r\n3.把210拆成7个自然数的和，使这7个数从小到大排成一行后，相邻两个数的差都是5，那么，第1个数与第6个数分别是多少？ \r\n\r\n4.把从1开始的所有奇数进行分组，其中每组的第一个数都等于此组中所有数的个数，如（1），（3、5、7），（9、11、13、15、17、19、21、23、25），（27、29、……79），（81、……），求第5组中所有数的和 \r\n\r\n5.将自然数如下排列， \r\n\r\n1 2 6 7 15 16 … \r\n\r\n3 5 8 14 17 … \r\n\r\n4 9 13 18 … \r\n\r\n10 12 … \r\n\r\n11 … \r\n\r\n… \r\n\r\n在这样的排列下，数字排在第2行第1列，13排在第3行第3列，问：1993排在第几行第几列？'),(8,1,'第一次作业','liuyongkang','2014-08-21 12:30:12','2014-08-28 23:59:59','单项选择题?\r\n\r\n1.以下属于物理层的设备是（A）\r\nA.中继器  B.以太网交换机  C.桥  D.网关\r\n\r\n2.在以太网中，是根据___地址来区分不同的设备的（B)\r\nA.LLC地址  B.MAC地址  C.IP地址  D.?IPX地址\r\n\r\n\r\n3.IEEE802.3u标准是指（B)\r\nA. 以太网  B. 快速以太网  C. 令牌环网  D. FDDI网\r\n\r\n4.下面哪种LAN 是应用CSMA/CD协议的 （C） \r\nA、令牌环 B、FDDI C、ETHERNET D、NOVELL\r\n\r\n\r\n5.FDDI?使用的是___局域网技术。（C）\r\nA、以太网；?B、快速以太网；?C、令牌环；?D、令牌总线\r\n\r\n6.TCP和UDP协议的相似之处是（C）\r\nA、面向连接的协议  B、面向非连接的协议  C、传输层协议  D、以上均不对\r\n\r\n7.应用程序PING发出的是___报文。（C）\r\nA、TCP?请求报文。  B、TCP?应答报文。  C、ICMP  请求报文。  D、ICMP应答报文。\r\n\r\n8.小于___的TCP/UDP端口号已保留与现有服务一一对应，此数字以上的端口号可自由分配。(C）\r\nA、199  B、100  C、1024  D、2048\r\n\r\n9.当一台主机从一个网络移到另一个网络时，以下说法正确的是（B）\r\nA、必须改变它的IP地址和MAC地址\r\nB、必须改变它的IP地址，但不需改动MAC地址\r\nC、必须改变它的MAC地址，但不需改动IP地址\r\nD、MAC?地址、IP?地址都不需改动\r\n\r\n10.IEEE802.5标准是指（C）\r\nA、以太网  B、令牌总线网  C、令牌环网  D、FDDI网'),(9,1,'第二次作业','yangliu','2014-09-01 19:30:12','2014-09-10 23:59:59','选择题?\r\n\r\n1.美国国防部高级研究计划局（ARPA）的ARPANET，其核心技术是（B）\r\nA.电路交换 B.分组交换 C.报文交换 D.信元交换\r\n\r\n2.当表示子网掩码时，下列哪项表示的是同一个含义？(C)\r\nA/10和255.224.0.0\r\nB/15和255.255.0.0\r\nC/21和255.255.248.0\r\nD/24和255.255.0.0\r\n\r\n3.交换机利用（D）地址构建MAC地址表？\r\nA目标IP地址  B目标MAC地址 C 源IP地址 D 源MAC地址\r\n\r\n4.网卡MAC地址的长度是（D）\r\nA12bits\r\nB24bits\r\nC38bits\r\nD48bits\r\n\r\n5.路由器根据数据包的（A）作出转发决定??\r\n\r\nA目的IP地址\r\nBMAC地址\r\nC源IP地址\r\nD默认网关\r\n\r\n\r\n6.某主机的IP地址是192.168.32.52，掩码为255.255.255.240，其网络地址是（C)\r\nA192.168.32.0\r\nB192.168.32.32\r\nC192.168.32.48\r\nD192.168.32.63'),(10,1,'第三次作业','yanyan','2014-09-15 19:30:12','2014-09-28 23:59:59','选择题?\r\n\r\n1、完成路径选择功能是在OSI模型的（）。\r\nA.物理层  B.数据链路层  C.网络层  D.运输层\r\n\r\n\r\n2、在TCP/IP协议簇的层次中，保证端-端的可靠性是在哪层上完成的？（）\r\nA.网络接口层  B.互连层  C.传输层  D.应用层\r\n\r\n3、在TCP/IP体系结构中，与OSI参考模型的网络层对应的是（）。\r\nA.网络接口层B.互联层C.传输层D.应用层\r\n\r\n4、在OSI七层结构模型中，处于数据链路层与传输层之间的是（）。\r\nA.物理层  B.网络层  C.会话层  D.表示层\r\n\r\n5、计算机网络中可以共享的资源包括（）。\r\nA.硬件、软件、数据  B.主机、外设、软件\r\nC.硬件、程序、数据  D.主机、程序、数据\r\n\r\n6、网络协议组成部分为（?）。\r\nA.数据格式、编码、信号电平 B.数据格式、控制信息、速度匹配\r\nC.语法、语义、定时关系     D.编码、控制信息、定时关系'),(11,1,'第一次作业','wangxinyan','2014-09-17 12:00:00','2014-10-02 00:00:00','Calculation：\r\n1.Let A={A1,A2,A3,A4,A5,A6} where   A1={1,2} A2={2,3} A3={3,4} A4={4,5} A5={5,6} A6={6,1}  Determine the number of different SDR’s that A has. Generalize to n sets.\r\nSolutions：\r\nA has 2 different SDR’s. Suppose that we choose 1 in from A1, and choose 3 from A2, then we can just choose 4 from A3, choose 5 from A4, choose 6 from A5, and choose 1 from A1, but it contract with the 1 from A1. So, we only have two different SDR’s. \r\n① Choose 1 from A1, choose 2 from A2,…,choose 6 from A6. So, SDR1={1,2,3,4,5,6}. ② Choose 2 from A1, Choose 3 from A2,…, choose 1 from A6. So, SDR2={2,3,4,5,6,1}. Generalize to n sets, there are only two SDR’s in n-sets the same: \r\nSDR1={1,2,3,4,…,n} SDR2={2,3,4,…,n,1}\r\n2.Determine the complementary design of the BIBD with parameters b=v=7, k=r=3, λ=1 in Section 10.2\r\nSolutions：\r\nParameters of the BIBD: \r\n1) b: the number of blocks; \r\n2) v: the number of varieties; \r\n3) k: the number of varieties in each block;  \r\n4) r: the number of blocks containing each variety  \r\n5) : the number of blocks containing each pair of varieties. \r\nHere, we get that b=v=7, k=r=3, λ=1:'),(12,1,'第二次作业','shuizemin','2014-10-03 12:00:00','2014-10-17 00:00:00','概念题：\r\n1.什么是离散数学？\r\n答案：离散数学是研究离散量的结构及相互关系的学科，其研究对象一般是有限个或可数个元素。它充分描述了计算机科学离散性的特点，在计算机理论研究及软、硬件开发的各个领域有着广泛的应用\r\n2.什么是集合？\r\n答案：集合是一些具有确定的、可以区分的若干事件的全体，而集合中的事件称为元素。\r\n3.什么是有序对？\r\n答案：有序对是指两个元素x和y（允许x=y）按给定顺序排列组成的二元组合，记作<x,y>.其中x是它的第一元素，y是它的第二元素。\r\n4.什么是图？\r\n答案：图——图可以用集合的形式表示，即图可以表示为一个三元组，包含结点集、边集，以及边与结点对集间的映射．如果用结点对来表示边，则图可以表示成一个由结点集与边集组成的二元组．\r\n5.什么是有向边？\r\n答案：有向边、端点——若图中的边e所对应的结点偶对是有序的，记为<a，b>，则称e是有向边（简称弧）．a，b分别称为弧的始点与终点，并均称为e的端点．称e是关联于结点a和b的，结点a和结点b是相、邻的，或称结点a和结点b是邻接的．\r\n6.什么是无向边？\r\n答案：无向边、端点——若图中的边e所对应的结点偶对是无序的，记为（a，b），则称e是无向边（简称棱）．a，b称为e的端点．称e是关联于结点a和b的，结点a和结点b是相、邻的，或称结点a和结点b是邻接的．\r\n7.有向图、无向图、底图、孤立节点、零图的概念分别是什么？\r\n答案：有向图——每一条边均为有向边的图称为有向图． 无\r\n      向图——每一条边均为无向边的图称为无向图．  \r\n      底图——如果把有向图中每条有向边都看作无向边，就得一个无向图，此无向图称为原有向图的底图．底图只表示出结点间的连接关系而没有表示出连接边的方向．  \r\n      弧立结点——图中不与任何相邻的结点称为弧立结点． \r\n      零图——全由孤立结点构成的图称为零图．'),(13,1,'第一次作业','wangchengcheng','2014-09-09 12:01:21','2014-09-15 23:59:59','1.什么叫文档？?\r\n\r\n文档是确定软件生产各个阶段必须完成的有关计算机程序功能、设计和使用的文字或图形资料。\r\n\r\n2.什么叫软件？软件和程序的区别是什么？\r\n软件是计算机程序及其有关数据和文档的完整集合。程序是能够完成预定功能的可执行的指令序列?。而软件=程序+文档。\r\n\r\n3.软件工程方法学的三个要素是什么？各个要素的作用是什么？\r\n三个要素：方法、工具和过程。\r\n方法：完成软件开发任务的技术方法。\r\n工具：为方法的运用提供自动或半自动的软件支撑环境\r\n过程：规定了完成任务的工作阶段、工作内容、产品、验收的步骤和完成准则。\r\n\r\n4.瀑布模型把软件生命周期分为那几个时期？有分为那几个阶段？\r\n分为三个时期：计划时期、开发时期、运行时期?\r\n计划时期可分为：问题定义、可行性研究、需求分析\r\n开发时期可分为：概要设计、详细设计、软件实现、软件测试?运行时期：运行维护\r\n\r\n\r\n5.软件工程学的主要内容是什么？\r\n是软件开发技术和软件工程管理。\r\n\r\n6.软件开发模型有哪些？\r\n\r\n总体来说包括传统的瀑布模型和后来兴起的快速原型模型。\r\n具体分为:瀑布模型、快速原型模型、增量模型、喷泉模型、螺旋模型和统一模型\r\n\r\n7.可行性研究包括哪几个方面？各包括那些内容？\r\n包括技术方面、经济方面、社会因素方面?\r\n\r\n（1）技术可行性是指对设备条件、技术解决方案的实用性和技术资源的可用性的度量。\r\n（2）经济可行性是指希望以最小的成本开发出具有最佳的经济效益的软件产品。其内容如下：\r\n	<1>支出\r\n	<2>收益\r\n	<3>收益/投资比\r\n	<4>投资回收周期\r\n	<5>敏感度分析\r\n（3）社会因素方面的可行性主要从法律、用户等方面分析可行性。\r\n\r\n8.需求分析有什么必要？在这一阶段常绘制那些图形？\r\n\r\n需求分析的基本任务是软件人员和用户一起完全弄清用户对系统的确切要求。需求分析的结果是否正确，关系到软件开发的成败，正确的需求分析是整个系统开发的基础。\r\n常绘制的图包括：实体-关系图、数据流图、状态转换图、数据字典、层次图、Warnier图、IPO图等。\r\n\r\n9.进行系统需求分析时应确定所开发系统的哪些具体要求？\r\n包括：确定系统的运行环境要求、系统的性能要求、系统功能、接口需求四个方面。'),(14,1,'第二次作业','xuhang','2014-09-09 15:30:21','2014-09-20 23:59:59','1.开发文档都有哪些？\r\n开发文档包括目标程序、源程序、详细设计说明书、概要设计说明书、需求规格说明书、用户需求报告、软件合同，它们之间的关系如下图所示。\r\n\r\n\r\n2.简述软件工程研究的内容。\r\n软件工程研究的内容包括软件开发方法、软件开发模型、软件支持过程和软件管理过程。\r\n\r\n其中软件开发方法的内容又涵盖市场调研、正式立项、需求分析、项目策划、概要设计、详细设计、编程、测试、试运行、产品发布、用户培训、产品复制、销售、实施、系统维护、版本升级。常用的软件开发模型有瀑布模型、迭代模型、增量模型和原型模型。\r\n软件支持过程由所支持的CASE工具组成，常用的CASE工具有Power?Designer和Rational Rose。\r\n软件管理过程主要有CMMI、ISO9000、微软企业文化和敏捷文化现象。\r\n\r\n3.详细解释软件的定义、程序的定义及软件工程的定义。?\r\n软件的定义：软件＝程序＋数据＋文档。这里的程序是指程序系统。这里的数据不仅包括初始化数据、测试数据，而且包括研发数据、运行数据、维护数据，也包括软件企业积累的项目工程数据和项目管理数据中的大量决策原始记录数据。这里的文档指的是软件开发过程中的分析、设计、实现、测试、维护文档、管理文档。?\r\n现在有一种新提法正在引起关注，这种提法是：软件＝知识＋程序＋数据＋文档。?\r\n程序是计算机为完成特定任务而执行的指令的有序集合。从应用的角度可理解为：面向过程的程序＝算法＋数据结构?面向对象的程序＝对象＋信息。面向构件的程序＝构件＋构架。软件工程是研究软件开发和软件管理的一门工程学科。\r\n\r\n\r\n4.软件工程的7+1条基本原理有什么现实意义？\r\n软件工程的7条基本原理是在面向过程的程序设计时代（结构化时代）提出来的，但在面向数据和面向对象的程序设计的今天，它仍然有效。并且在军事上的实时跟踪监控系统中有很好的应用，而且随着软件的开发和管理的进步，它将不断完善和充实。?\r\n请读者注意，作者在书中又新加入了第8条基本原理：软件工程中的二八定律，这是对基本原理的补充与发展。'),(15,1,'第三次作业','lixiaoliang','2014-09-21 12:12:21','2014-09-30 23:59:59','选择题：\r\n1.下列选项中,不属于软件危机主要表现的是()\r\nA.软件错误很难消除\r\nB.程序开发进度无法预测\r\nC.程序设计技术落后\r\nD.缺乏软件优劣的标准\r\n答案：C\r\n\r\n2.下面不属于软件工程的三个要素的是()\r\nA.工具?B.过程?C.方法?D.环境?\r\n答案：D\r\n\r\n3.下列描述中正确的是()\r\nA.程序就是软件\r\nB.软件开发不受计算机系统的限制\r\nC.软件既是逻辑实体,又是物理实体.\r\nD.软件是程序、数据与相关文档的集合。\r\n答案：D\r\n\r\n4．下列描述中正确的是（）\r\nA.软件工程只是解决软件项目的管理问题\r\nB.软件工程主要解决软件产品的生产率问题。\r\nC.软件工程的主要思想是强调在软件开发过程中需要应用工程化的原则。\r\nD.软件工程只是解决软件开发中的技术问题。\r\n答案：D\r\n\r\n5.下列选项中不属于软件生命周期开发阶段任务的是（）\r\nA.软件测试  B.概要设计  C.软件维护  D.详细设计\r\n答案：D\r\n\r\n6.在软件生命周期中，能准备地确定软件系统必须做什么和必须具备哪些功能的阶段是（）.\r\nA.概要设计  B.详细设计  C.可行性分析  D.需要分析\r\n答案：D\r\n\r\n7.在结构化方法中，软件功能分解属于下列软件开发中的阶段是()\r\nA.详细设计  B需求分析  C总体设计  D.编程调试 \r\n\r\n答案：B\r\n\r\n\r\n8．软件需求分析阶段的工作，可以分为四个方面：需求获取，需求分析，编写需求规格说明书，以及（ ）。\r\nA.阶段性报告  B. 需求评审  C总结  D都不正确\r\n答案：B\r\n\r\n9.从工程管理角度，软件设计一般分为两步完成，它们是(  )\r\nA.概要设计和详细设计 \r\nB数据设计与接口设计 \r\nC.软件结构设计与数据设计 \r\nD.过程设计与数据设计 \r\n答案：A\r\n\r\n10．数据流图用于抽象描述一个软件的逻辑模型，数据流图由一些特定的图符构成。下列图符名标识的图符不属于数据流合法图符的是（）\r\nA.控制流  B加工  C.数据存储  D.源和潭 \r\n答案：A\r\n\r\n11.在数据流图(DFD)中，带有名字的箭头表示（）\r\nA．模块之间的调用关系  B.程序的组成成分\r\nC.控制程序的执行顺序   D.数据的流向\r\n答案：D\r\n\r\n12．下列工具中为需求分析常用工具的是（）\r\nA.PAD  B.PFD  C.N-S  D.DFD\r\n答案：D\r\n\r\n13.下面不属于软件设计原则的是(）\r\nA.抽象  B.模块化  C.自底向上  D信息隐藏\r\n答案：C\r\n\r\n14.软件测试的目的是（）\r\nA．发现错误  B改正错误  C.改善软件的性能  D.挖掘软件的潜能\r\n答案：A\r\n\r\n15.检查软件产品是否符合需求定义的过程称为（）\r\nA.确认测试  B集成测试  C.验证测试  D验收测试\r\n答案：A'),(16,1,'第一次作业','xiaowenhui','2014-09-09 12:00:21','2014-09-15 23:59:59','1. Suppose you are given a relation R with four attributes ABCD. Assume that the following FDs are the only dependencies that hold for R. We have the FD set: F = {AB->A, AB->C, AB->D, C->A, D->B}\r\n(1) Compute the attribute closure AB+ and A+ with respect to F with detailed explanation.  AB+ = ABCD AB+内一定包含AB。因为AB->C,所以AB+内包含C。因为AB->D,所以AB+内 包含D。\r\nA+=A\r\n因为从A无法推出其他属性。所以A+只包含A。\r\n (2) Identify the candidate key(s) for R. Briefly explain the reason.\r\nA+ = A, B+= B, C+=CA, D+=DB, AB+=ABCD, AC+=AC, AD+=ABCD, BC+=ABCD, BD+=BD, CD+=ABCD 所以R的候选码有AB,AD,BC,CD。\r\n\r\n(3) Find out the trivial functional dependencies in F and prove that they are trivial FDs.  AB->A 因为AB->A中,函数依赖右边的属性A是左边的属性 AB的子集,所以它是平 凡函数依赖。'),(17,1,'第二次作业','liuyongkang','2014-09-16 12:22:22','2014-09-23 23:59:59','2. Suppose you are given a relation R with attributes ABCDEFGHIJK. Assume that the following FDs are the only dependencies that hold for R. We have the FD set: FD = {ABD->E, AB->G, B->F, C->J, CJ->I, G->H}\r\n\r\n(1) Compute the attribute closure AB+ and C+ with respect to FD with detailed explanation.  AB+ = ABFGH \r\nAB+内一定包含AB。因为B->F,所以AB+内包含F。\r\n因为AB->G,所以AB+内包含G。因为G->H,所以AB+内包含H。 C+ = CJI C+内一定包含C。因为C->J,所以C+内包含J。因为CJ->I,所以C+内包含I。\r\n\r\n(2) Identify the candidate key(s) for R. Briefly explain the reason. \r\nL = ABCD R = EFHI N =K LR = GJ 计算LN集合,即LN = ABCDK,求出ABCDK+=ABCDEFGHIJK,已经包含R 的全部属性。所以R的候选码为ABCDK。\r\n\r\n(3) Write down a minimal cover for the set F. Briefly explain the reason. \r\n\r\na.将FD中的所有依赖右边化为单一元素 FD = {ABD->E, AB->G, B->F, C->J, CJ->I, G->H}已经满足。 \r\n\r\nb.去掉FD中的所有依赖左边的冗余属性. 在依赖CJ->I中,因为C+=CJI,其中包含I,所以J是冗余的,可去除。 FD = {ABD->E, AB->G, B->F, C->J, C->I, G->H} \r\n	\r\nc.去掉FD中所有冗余依赖关系. 做法为从FD中去掉某关系,如去掉X->Y,然后在FD中求X+,如果Y在X+中, 则表明X是多余的.需要去掉. 如果FD去掉ABD->E, FD将等于{ AB->G, B->F, C->I, G->H },而 ABD+=ADBFGH,其中不包含E.所 以ABD->E不是多余的. 同理,AB->G , B->F , C->I, G->H不是多余,故不能去掉. 所以所求最小函数依赖集为{ ABD->E, AB->G, B->F, C->J,C->I, G->H }. '),(18,1,'第三次作业','yangliu','2014-09-23 11:11:20','2014-10-01 23:59:59','1.Suppose you are given a relation R with four attributes ABCD. Assume that the following FDs are the only dependencies that hold for R.\r\n We have the FD set: F = { C->D, C->A, B->C} Identify the best normal form that R satisfies (1NF, 2NF, 3NF and BCNF). If R is not in 3NF, decompose it into a set of 3NF relations that preserve the dependencies.   2NF. (R的码为B,B->C, C->D和B->C, C->A都有传递依赖) 3NF分解过程:  F的最小覆盖为{C->D, C->A, B->C},使用保持依赖的算法得到关系模式 CD、AC、BC,合并后得到ACD,BC。 \r\n\r\n\r\n2.Suppose you are given a relation R with four attributes ABCDEG. Assume that the following FDs are the only dependencies that hold for R. \r\nWe have the FD set: F = { A->B, B->C, AD->G, D->E} Identify the best normal form that R satisfies (1NF, 2NF, 3NF and BCNF). If R is not in BCNF, decompose it into a set of BCNF relations that preserve the dependencies. \r\n1NF。(因为R的码为AD,A->B违反了部分依赖,所以R甚至不符合2NF。 所以它只符合1NF) \r\nBCNF分解过程:\r\n 1 违反函数依赖的有A->B,D->E,A->C\r\n按A->B分解成AB,ACDEG ACDEG按D->E分解成DE,ACDG ACDG按A->C分解成AC,ADG 所以最后结果是AB, DE, AC,ADG (分解顺序不同也都是这个结果) \r\n\r\n2 违反函数依赖的有A->B,D->E,B->C\r\n按B->C分解成BC,ABDEG ABDEG按A->B分解成AB, ADEG ADEG按D->E分解成DE,ADG 所以最后结果是BC, AB, DE,ADG'),(19,1,'第一次作业','yanyan','2014-09-09 12:00:21','2014-09-15 23:59:59','1.一场大雪过后,人们会感到外面万籁俱静.究其原因,你认为正确的是( ) \r\nA.可能是大雪后,行驶的车辆减少,噪声减小 \r\nB.可能是大雪蓬松且多孔,对噪声有吸收作用 \r\nC.可能是大雪后,大地银装素裹,噪声被反射 \r\nD.可能是大雪后气温较低,噪声传播速度变慢 \r\n2.助听器的工作原理是利用仪器( ) \r\nA.引起头骨、颌骨振动，传到听觉神经，引起听觉 \r\nB.引起鼓膜振动,经过听小骨及其他组织传给听觉神经,引起听觉 \r\nC.产生超声波直接作用在听觉神经引起听觉 \r\nD.产生声波直接作用在听觉神经引起听觉 \r\n3.如图1所示,老师用同样的力吹一根吸管,并将它的长度逐渐剪短,他在研究声音的( ) \r\nA.响度与吸管长短的关系 B.音调与吸管材料的关系 \r\nC.音调与吸管长短的关系 D.音色与吸管材料的关系 \r\n4.2004年6月8日13时左右在南通市可以看到“金星凌日”的天文奇观.“金星凌日”是在地球上看到金星从太阳面上移过的现象,它的产生和日食的道理相同.图为发生“金星凌日”现象时的示意图,图中金星的位置应在( ) \r\nA.甲 B.乙 C.丙 D.丁 \r\n5.下列事例中,属于光的反射现象的是( ) \r\nA. 阳光下人的影子 \r\nB.人在河边看到水中游动的鱼 \r\nC.人在湖边看到自己在水中的倒影 \r\nD.插在水中的筷子看上去好像折断了 \r\n6.小汽车的挡风玻璃不竖直安装的主要原因是为了( ) \r\nA.造型美观 B.减少外界噪音干扰 \r\nC.增大采光面积 D.排除因平面镜成像造成的不安全因素 \r\n7.一束光线与水面成锐角由空气斜射入水中时,入射角为α,反射角为β,折射角为γ,则( ) \r\nA.α＞β＞γ B.α＝β＞γ C.α＝β＜γ D.α＜β＜γ \r\n8.蜡烛放在离凸透镜20cm的主光轴上,在透镜的另一侧光屏上得到放大的像,若把蜡烛向透镜方向移动8cm,则所成的像一定是( ) \r\nA.放大的 B.缩小的 C.正立的 D.倒立的 \r\n9.某校新建成一个喷水池,在池底的中央安装一只射灯.池内无水时,射灯发出的一束光照在池壁上,在S点形成一个亮斑,如图3所示.现往池内注水,水面升至a位置时,站在池旁的人看到亮斑的位置在P点;如果水面升至b位置时看到亮斑的位置在Q点,则( ) \r\nA. P点在S点的上方,Q点在S点的上方 \r\nB.P点在S点的上方,Q点在S点的下方 \r\nC.P点在S点的下方,Q点在S点的上方 \r\nD.P点在S点的下方,Q点在S点的下方 \r\n10.如图4所示的四幅图中,分别表示近视眼成像情况和矫正做法的是( ) \r\nA.②① B.③① C.②④ D.③④ \r\n11.小明使用显微镜观察时发现视野中有一小污点,为了判断此污点究竟位于玻片上还是位于显微镜的镜头上,小明进行了如下操作:(1)移动玻片,结果视野中的污点不移动;(2)移动转换器,将低倍物镜转换成高倍物镜,结果视野中原先的污点仍然存在.由此可以推测视野中的小污点最可能位于( ) \r\nA.玻片上 B.低倍物镜上 \r\nC.高倍物镜上 D.目镜上 \r\n12.如图5所示是投影仪的结构图,在水平旋转的凸透镜的正上方有一与水平面成45度角的平面镜,右边竖直放一屏幕.物体发出的光线经过凸透镜和平面镜后,可在屏上成一清晰的像.一教师在使用投影仪时,发现在屏幕上的画面太小,正确的调节方法是( ) \r\nA.减小投影仪与屏幕间的距离,下调凸透镜,减小凸透镜到物体间的距离 \r\nB.减小投影仪与屏幕间的距离,上调凸透镜,增大凸透镜到物体间的距离 \r\nC.增大投影仪与屏幕间的距离,下调凸透镜,减小凸透镜到物体间的距离 \r\nD.增大投影仪与屏幕间的距离,上调凸透镜,增大凸透镜到物体间的距离 '),(20,1,'第一次作业','wangxinyan','2014-09-16 12:00:00','2014-09-24 00:00:00','简答题：\r\n1.对一组整数进行四则运算，所得结果是什么数？\r\n答案：（1）整数相加得到整数；（2）整数相减得到整数；（3）整数相乘得到整数；（4）整数相除得到的是有理数。所以对一组整数进行四则运算得到的是有理数。\r\n2.写出4个数码1,2,3,4的所有4阶排列. 分析4阶排列是指由1,2,3,4构成的有序的数组,共有4！个,每个数字必须出现且只能出现一次,具体做法可以是先确定排在第一位的数,比如为1,然后排第二位的数分别为2,3,4,接着排第三位、第四位的数.\r\n答案：分析4阶排列是指由1,2,3,4构成的有序的数组,共有4！个,每个数字必须出现且只能出现一次,具体做法可以是先确定排在第一位的数,比如为1,然后排第二位的数分别为2,3,4,接着排第三位、第四位的数.\r\n3.分别计算下列四个4阶排列的逆序数,然后指出奇排列是（）\r\n（A）4312；（B）4132；（C）1342；（D）2314\r\n答案：A；分析，1前面比1大的数的个数＋2前面比2大的数的个数＋＋前面比大的数的个⋯⋯(1)n−1n−数.\r\n逆序数是奇数的称为奇排列，逆序数是偶数的成为偶排列.\r\n4.写出全体形如的5阶排列.总结一下，有个位置数码给定的阶排列有多52253∗∗∗∗∗及k()nnk>少个？\r\n答案：分析形如的5阶排列中5和2的位置已经确定，3个位置只能取数字1，3，4中的某一个.52∗∗∗∗\r\n解，形如5**2*及2*5*3的5阶排列中第一个可取1，3，4中的任何一个，故有3种取法，第二个可取剩52∗∗∗∗∗下数字当中的任一个，有两种取法，最后一个只能取余下的那一个数，据乘法原理共有种取 ∗3213!××=\r\n法，即形如的阶排列有（5－2）！个.同理形如的阶排列共有（5－3）！个.因而，有个52∗∗∗253∗∗k位置数码给定的阶排列有个.'),(21,1,'第二次作业','shuizemin','2014-09-25 12:00:00','2014-10-01 00:00:00','content:\r\n简答题：\r\n1.在由1,2,3,4,5,6,7,8,9组成的下述9阶排列中,选择使得:ij与（1）2147958ij为偶排列；（2）1254896ij为奇排列；（3）4125769ij偶排列；（4）3142786ij奇排列.\r\n答案：分析 排列1i25j4896中的两个未知数i与j据排列的定义只能取3或7.因而只有两种情况：1� 132574896 与 2� 172534896，然而我们只需计算上述的一个排列就可得知结果，因为1� 与 2�是3和7做一次对换得到的，而做一次对换必改变排列的奇偶性，也就是说若1� 为偶排列，则2�必为奇排列。其余题解法类似。'),(22,1,'第三次作业','wanchengcheng','2014-10-02 12:00:00','2014-10-08 00:00:00','简答题：\r\n1.若n阶行列式 D=绝对值a中元素 aij (i,j=1,2,⋯,n) 均为整数, 则D必为整数, 这结论对不对? 为什么?\r\n答案：对. 行列式的值是行列式中取自所有不同行不同列的元素乘积的代数和 , 而整数经加,减,乘之后仍然为整数.');
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
INSERT INTO `homeworkindex` VALUES (1,1,21,1),(2,1,45,2),(3,1,56,3),(4,1,34,4),(5,1,36,1),(6,1,76,2),(7,1,7,3),(8,1,23,1),(9,1,6,2),(10,1,34,3),(11,1,74,1),(12,1,24,2),(13,1,1,1),(14,1,67,2),(15,1,4,3),(16,1,123,1),(17,1,43,2),(18,1,66,3),(19,1,34,1),(20,1,7,1),(21,1,1,2),(22,1,2,3);
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
INSERT INTO `take` VALUES (8,3,1),(8,8,1),(9,4,1),(9,8,1),(10,4,1),(10,8,1),(11,4,1),(11,8,1),(12,8,1),(13,6,1),(13,7,1),(13,8,1),(14,1,1),(14,2,1),(14,5,1),(14,8,1),(15,8,1),(16,1,1),(16,2,1),(16,5,1),(16,8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'yanyan','7219b9b60d9d70a9a7014369d88ebefe','1966997923@qq.com',0,'软件学院','中山大学','计算机应用',2012),(9,'wangxinyan','5340ed252aa12739b42559526f69ff60','364313689@qq.com',0,'软件学院','中山大学','电子政务',2012),(10,'shuizemin','9738ac83e94f6f2ceee775671ed144d0','1264717771@qq.com',0,'软件学院','中山大学','电子政务',2012),(11,'wanchengcheng','b7ddf2777eea41f8e1bc82bc685c18a8','714146815@qq.com',0,'软件学院','中山大学','电子政务',2012),(12,'xuhang','3f29480477e45b147c3c195a6edbcbec','466356670@qq.com',0,'软件学院','中山大学','数字媒体',2013),(13,'lixiaoliang','3b13764d806412660601bee526e389c9','348004611@qq.com',0,'软件学院','中山大学','嵌入式软件',2012),(14,'xiaowenhui','fa8d0e69e819e64fbb92dc970d82e575','522171087@qq.com',0,'软件学院','中山大学','数字媒体',2012),(15,'liuyongkang','baaa7238969070e7ac5c77e6e8a341c6','876687680@qq.com',0,'软件学院','中山大学','通用软件',2012),(16,'yangliu','89da5f1bc89f0a8870e980286c94d87f','1151730511@qq.com',0,'软件学院','中山大学','数字媒体',2012);
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

-- Dump completed on 2014-12-13  0:39:02
