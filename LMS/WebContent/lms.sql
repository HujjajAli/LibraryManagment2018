/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.0.81-community-nt : Database - lms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`lms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `lms`;

/*Table structure for table `author` */

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `id` int(11) NOT NULL auto_increment,
  `author` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `dob` date default NULL,
  `lifestatus` varchar(20) default NULL,
  `country` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `author` */

insert  into `author`(`id`,`author`,`gender`,`dob`,`lifestatus`,`country`) values (3,'Ahmed Faraz','MALE','1941-10-26','Died','Pakistan'),(4,'Vishal Layka','MALE','1988-05-10','Alive','India'),(5,'Abbey Deitel','FEMALE','1975-09-22','Alive','Japan'),(6,'Richard Warburton','MALE','1977-09-11','Alive','England'),(7,'Paul Deitel','MALE','1964-07-11','Alive','USA'),(8,'Muhammad Tauqueer','MALE','1971-03-08','Alive','Pakistan');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL auto_increment,
  `book` varchar(255) default NULL,
  `edition` varchar(100) default NULL,
  `pages` int(11) default NULL,
  `category` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `publisher` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_book_category` (`category`),
  KEY `FK_book_author` (`author`),
  KEY `FK_book_publisher` (`publisher`),
  CONSTRAINT `FK_book_author` FOREIGN KEY (`author`) REFERENCES `author` (`id`),
  CONSTRAINT `FK_book_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_book_publisher` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `book` */

insert  into `book`(`id`,`book`,`edition`,`pages`,`category`,`author`,`publisher`) values (1,'Learn Java For Web Development','2nd',1350,1,4,1),(2,'Internet and WWW How to Program','2nd',1800,1,5,2),(3,'Data Structure in C++','3rd',1200,4,8,5),(4,'Java 8 Lambdas','1st',890,1,6,3),(5,'Java How To Program','7th',1950,1,7,4),(6,'Learn Java For Web Development','2nd',1320,1,4,1),(7,'Learn Java For Web Development','3rd',1370,1,4,1),(8,'Java How To Program','8th',2000,1,7,4),(9,'Java How To Program','9th',2050,1,7,4),(10,'Java How To Program','10th',2100,1,7,4),(11,'Java 8 Lambdas','3rd',1130,1,6,3);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment,
  `category` varchar(255) NOT NULL,
  `description` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`id`,`category`,`description`) values (1,'Programming','Contained Computer Programming Books of Every Kind'),(2,'Mathmatics','Mathmathics Books Matric Enter BSc B.Com BA MA'),(3,'Novel','Contain Novels of different kinds for readers'),(4,'Algorithms','Save Computer Programming Algorithms Books Here');

/*Table structure for table `lib_address` */

DROP TABLE IF EXISTS `lib_address`;

CREATE TABLE `lib_address` (
  `id` int(11) NOT NULL auto_increment,
  `country` varchar(100) default NULL,
  `province` varchar(100) default NULL,
  `city` varchar(100) default NULL,
  `area_street_house` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `lib_address` */

insert  into `lib_address`(`id`,`country`,`province`,`city`,`area_street_house`) values (9,'Pakistan','Sindh','Hyderabad','Qasim abad, abdullah town,house 13'),(10,'Pakistan','Sindh','Karachi','Clifton Beach,House 22'),(11,'Pakistan','Sindh','Hyderabad','Lateef Abbad Number 3,gul mohar mohalla'),(12,'Pakistan','Sindh','Hyderabad','Qasim abad, abdullah town,house 16'),(13,'Pakistan','Sindh','Matli','muhajir mohalla ward 3'),(14,'Pakistan','Sindh','Matli','Matli Parho Baba'),(15,'Pakistan','Sindh','Hyderbad','Shedhi Goth, Qasimabad');

/*Table structure for table `librarian` */

DROP TABLE IF EXISTS `librarian`;

CREATE TABLE `librarian` (
  `id` int(11) NOT NULL auto_increment,
  `librarian` varchar(255) NOT NULL,
  `surname` varchar(255) default NULL,
  `gender` varchar(10) default NULL,
  `payscale` varchar(20) default NULL,
  `salary` double default NULL,
  `cnic` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dateOfJoining` date NOT NULL,
  `address` int(11) default NULL,
  `login_details` int(11) default NULL,
  `role` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `cnic` (`cnic`),
  KEY `FK_librarian_address` (`address`),
  KEY `FK_librarian_login_details` (`login_details`),
  CONSTRAINT `FK_librarian_address` FOREIGN KEY (`address`) REFERENCES `lib_address` (`id`),
  CONSTRAINT `FK_librarian_login_details` FOREIGN KEY (`login_details`) REFERENCES `login_detials` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `librarian` */

insert  into `librarian`(`id`,`librarian`,`surname`,`gender`,`payscale`,`salary`,`cnic`,`email`,`dateOfJoining`,`address`,`login_details`,`role`) values (5,'Hujjaj Ali','Qambrani','male','BS17',56000,'4110442455411','hujjaj_ali@dev.com','2014-03-24',9,5,'admin'),(6,'Aurangzaib','Solangi','male','BS15',54500,'647367363637','auru@gmail.com','2016-06-15',10,6,'none'),(7,'Amjad Ali','Pathan','male','BS16',345672,'4311456343245','','2018-01-15',11,7,'none'),(8,'Umair','Qambrani','male','BS14',24500,'41124567843122','umair@yahoo.com','2018-10-15',12,8,'none'),(9,'Tayaba','Qaimkhani','female','BS16',0,'4115687954124','tayaba@yahoo.com','2019-02-23',13,9,'none'),(10,'Tah Ali','Baloch','male','BS16',0,'411041457511','tahali@gmail.com','2019-07-23',14,10,'none'),(11,'Khizar','Qambrani','male','BS16',0,'78965412365','khizar@yahoo.com','2019-09-09',15,11,'none');

/*Table structure for table `login_detials` */

DROP TABLE IF EXISTS `login_detials`;

CREATE TABLE `login_detials` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(100) default NULL,
  `upassword` varchar(100) default NULL,
  `salt` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `login_detials` */

insert  into `login_detials`(`id`,`username`,`upassword`,`salt`) values (5,'hujjaj_ali@dev.com','w1biiBe3weaZQSHV9QEkXjkxNiw2IIg+nvGlH8oz/IU=','e9fQBBVj'),(6,'auru@gmail.com','XVE3QQ7vvTAAl5JBVy4hYz1+zBuXAV6YNT8e3JYPZu8=','HXoqZxVu'),(7,'hello@de.com','b27FE8NLpsqrnJm5AI3GTWlIpQdWmyr7ROLUU2ueH9A=','6XYFglkr'),(8,'umair@yahoo.com','Wq1+lAwF2I0Muh9AM4Z5CWSgTUc0KYaxzs62f+SB+us=','MmbkZT4Q'),(9,'tayaba@yahoo.com','vy8RxrZzur2hYR/HCBpcFRq3FZWakbIS6n1cs786jqc=','j8bD84XJ'),(10,'tahali@gmail.com','1bkRTbCnqXCUorbqckAIvxp1TwtEgTV/S+QmsBR6WfY=','cKVAnXxL'),(11,'khizar@yahoo.com','5EGgy85ceguizdmffen0wyhJ+pGOeZ1rs7Ypx09/bu8=','5dfphBiA');

/*Table structure for table `mem_address` */

DROP TABLE IF EXISTS `mem_address`;

CREATE TABLE `mem_address` (
  `id` int(11) NOT NULL auto_increment,
  `country` varchar(100) default NULL,
  `province` varchar(100) default NULL,
  `city` varchar(100) default NULL,
  `area_street_house` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `mem_address` */

insert  into `mem_address`(`id`,`country`,`province`,`city`,`area_street_house`) values (1,'Pakistan','Sindh','Karachi','Gulshan Iqbal B Area House #32'),(2,'Pakistan','Sindh','Hyderbad','jagsi parho,ward#12');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL auto_increment,
  `member` varchar(255) default NULL,
  `fathername` varchar(255) default NULL,
  `rollNo` varchar(255) NOT NULL,
  `department` varchar(255) default NULL,
  `cnic` varchar(255) NOT NULL,
  `address` int(11) NOT NULL,
  `noOfBooksBorrowed` int(11) default NULL,
  `fines` int(11) default NULL,
  `gender` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `rollNo` (`rollNo`),
  UNIQUE KEY `cnic` (`cnic`),
  UNIQUE KEY `member` (`member`),
  KEY `FK_member_address` (`address`),
  CONSTRAINT `FK_member_address` FOREIGN KEY (`address`) REFERENCES `mem_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `member` */

insert  into `member`(`id`,`member`,`fathername`,`rollNo`,`department`,`cnic`,`address`,`noOfBooksBorrowed`,`fines`,`gender`) values (1,'Ghulam Nabi','Imran Hussain','2k14-IT-22','ITC','63114896356',1,0,0,'MALE'),(2,'Nadir Jagsi','Shahzad Jagsi','2k15-SS-44','Harticulture','4110442454564',2,0,0,'MALE');

/*Table structure for table `publisher` */

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL auto_increment,
  `publisher` varchar(255) default NULL,
  `country` varchar(100) default NULL,
  `foundingdate` date default NULL,
  `noOfBooks` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `publisher` (`publisher`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `publisher` */

insert  into `publisher`(`id`,`publisher`,`country`,`foundingdate`,`noOfBooks`) values (1,'Apress','USA','1999-01-03',1),(2,'Prentice Hall','USA','1989-05-16',1),(3,'O Reilly','USA','2002-02-19',1),(4,'Pearson','USA','1994-05-23',1),(5,'Aikman Series','Pakistan','1999-02-03',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
