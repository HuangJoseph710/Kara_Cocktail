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

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(8) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_price` int(6) DEFAULT 0,
  `product_pic` varchar(45) DEFAULT '',
  PRIMARY KEY (`pid`)
);
INSERT INTO `product` VALUES 
	(0, '白酒', 25, 'spirit.jpg'),
	(1, '白蘭地', 20, 'BR.jpg'),
	(2, '威士忌', 15, 'wis.png'),
	(3, '伏特加', 15, 'vodka_2.png'),
	(4, '蘭姆酒', 15, 'lan_2.jpg'),
	(5, '苦艾酒', 15, 'absinthe.jpg'),
	(6, '日本清酒', 25, 'sake.jpg'),
	(7, '奶酒', 20, 'milkwine.jpg'),
	(8, '草莓酒', 15, 'strwine.jpg'),
	(9, '希哈 紅葡萄酒', 15, 'gw.jpg'),
	(10, '米酒', 15, 'ricewine.png'),
	(11, '梅酒', 15, 'plumwine.jpg'),
	(12, 'liz酒', 15, 'liz_2.jpg'),
	(13, '香檳酒', 25, 'sp.png'),
	(14, '氣泡酒', 20, 'chepo.jpg'),
	(15, '女巫酒', 15, 'witchwine.png'),
	(16, '琴酒', 15, 'jin.jpg'),
	(17, '常常酒酒', 15, 'liz.jpg'),
	(18, 'Provence Rose', 9000, 'rose.jpg');

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `msgid` int(8) NOT NULL AUTO_INCREMENT,
  `msg_name` varchar(45) NOT NULL,
  `msg_date` datetime NOT NULL,
  `msg_content` text NOT NULL,
  `pid` int(8) NOT NULL,
  PRIMARY KEY (`msgid`)
);


