DROP DATABASE IF EXISTS `cocktail`;
CREATE DATABASE IF NOT EXISTS `cocktail`;
USE `cocktail`;

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT '使用者',
  `email` varchar(100) DEFAULT '@gmail.com',
  `birth` date DEFAULT '2023-1-1',
  PRIMARY KEY (`username`)
);
INSERT INTO `member` VALUES ('admin',1234,'管理員','admin@gmail.com','2022-11-11');