DROP DATABASE IF EXISTS `cocktail`;
CREATE DATABASE IF NOT EXISTS `cocktail`;
USE `cocktail`;

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `birth` date DEFAULT '2023-1-1',
  PRIMARY KEY (`username`)
);
INSERT INTO `member` VALUEs ('admin',1234,'管理員','admin@gmail.com','2022-11-11');
INSERT INTO `member` VALUEs ('an',1234,'','','2023-1-1');