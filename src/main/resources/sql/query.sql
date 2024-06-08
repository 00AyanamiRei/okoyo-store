-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 08, 2024 at 08:32 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `okoyo-store-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) DEFAULT NULL,
  `all_parent_ids` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(155) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2y94svpmqttx80mshyny85wqr` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `alias`, `all_parent_ids`, `enabled`, `image`, `title`, `parent_id`) VALUES
(1, 'production', NULL, b'1', 'Production.png', 'Продукція', NULL),
(2, 'printed-products', '-1-', b'1', 'printed-products.png', 'Друкованна продукція', 1),
(3, 'albums-for-cards', '-1-2-', b'1', 'albums-for-cards.png', 'Альбоми для карток', 2),
(4, 'collectible-cards', '-1-2-', b'1', 'collectible-cards.png', 'Колекційні картки', 2),
(5, 'journals', '-1-2-', b'1', 'journals.png', 'Журнали', 2),
(6, 'calendars', '-1-2-', b'1', 'calendars.png', 'Календарі', 2),
(7, 'stickers', '-1-2-', b'1', 'stickers.png', 'Наклейки', 2),
(8, 'postcards', '-1-2-', b'1', 'postcards', 'Відкритки', 2),
(9, 'posters', '-1-2-', b'1', 'posters.png', 'Плакати', 2),
(10, 'book-products', '-1-', b'1', 'book-products.png', 'Книжкова продукція', 1),
(12, 'artbooks', '-1-10-', b'1', 'artbooks.png', 'Артбуки', 10),
(13, 'manga', '-1-10-', b'1', 'manga.png', 'Манга', 10),
(14, 'ranobe', '-1-10-', b'1', 'ranobe.png', 'Ранобе', 10),
(16, 'manhwa', '-1-10-', b'1', 'manhwa.png', 'Манхва', 10),
(17, 'manhua', '-1-10-', b'1', 'manhua.png', 'Маньхуа', 10),
(19, 'figures', NULL, b'1', 'figures.png', 'Фігурки', NULL),
(20, 'anime-figures', '-19-', b'1', 'anime-figures.png', 'Аніме-фігурки', 19),
(21, 'acrylic-figures', '-19-20-', b'1', 'acrylic-figures.png', 'Акрилові фігурки', 20),
(22, 'complete-models', '-19-20-', b'1', 'complete-models.png', 'Complete models', 20),
(23, 'pop-up-parade', '-19-20-', b'1', 'pop-up-parade.png', 'Pop up parade', 20),
(24, 'nendoroid', '-19-20-', b'1', 'nendoroid.png', 'Nendoroid', 20),
(25, 'figma', '-19-20-', b'1', 'figma.png', 'Figma', 20),
(26, 'prefabricated-mobiles', '-19-20-', b'1', 'prefabricated-mobiles.png', 'Збірні мобілі', 20),
(27, 'soft-toys', '-19-', b'1', 'soft-toys.png', 'М\'ягкі іграшки', 19),
(28, 'accessories', NULL, b'1', 'accessories', 'Аксесуари', NULL),
(29, 'wardrobe', '-28-', b'1', 'wardrobe.png', 'Гардероб', 28),
(30, 'clothing-and-footwear', '-28-29-', b'1', 'clothing-and-footwear', 'Одяг та взуття', 29),
(31, 'shorts', '-28-29-30-', b'1', 'shorts.png', 'Шорти', 30),
(32, 'socks', '-28-29-30-', b'1', 'socks.png', 'Носки', 30),
(33, 'sweatshirts', '-28-29-30-', b'1', 'sweatshirts.png', 'Світшоти', 30),
(34, 'hoodies', '-28-29-30-', b'1', 'hoodies.png', 'Толстовки', 30),
(35, 't-shirts', '-28-29-30-', b'1', 't-shirts', 'Футболки', 30),
(36, 'headwear', '-28-29-30-', b'1', 'headwear.png', 'Головні убори', 30),
(37, 'panama', '-28-29-30-36-', b'1', 'panama.png', 'Панами', 36),
(38, 'hats', '-28-29-30-36-', b'1', 'hats.png', 'Шапки', 36),
(39, 'caps', '-28-29-30-36-', b'1', 'caps.png', 'Кепки', 36),
(40, 'scarves', '-28-29-30-', b'1', 'scarves.png', 'Шарфи', 30),
(41, 'kigurumi', '-28-29-30-', b'1', 'kigurumi.png', 'Кігурумі', 30),
(42, 'cosplay', '-28-29-', b'1', 'cosplay.png', 'Косплеї', 29),
(43, 'haori', '-28-29-42-', b'1', 'haori.png', 'Хаорі', 42),
(44, 'accessories-for-cosplay', '-28-29-42-', b'1', 'accessories-for-cosplay.png', 'Аксесуари для косплея', 42),
(45, 'quotation-marks', '-28-29-42-', b'1', 'quotation-marks.png', 'Лапки', 42),
(46, 'wigs', '-28-29-42-', b'1', 'wigs.png', 'Перуки', 42),
(47, 'ears', '-28-29-42-', b'1', 'ears.png', 'Вушки', 42),
(48, 'tails', '-28-29-42-', b'1', 'tails.png', 'Хвости', 42),
(49, 'for-gadgets', '-28-29-', b'1', 'for-gadgets.png', 'Для гаджетів', 29),
(50, 'backpacks', '-28-29-49-', b'1', 'backpacks.png', 'Рюкзаки', 49),
(51, 'bags', '-28-29-49-', b'1', 'bags.png', 'Сумки', 49),
(52, 'cardholders', '-28-29-49-', b'1', 'cardholders', 'Картхолдери', 49),
(53, 'jewelry', '-28-29-', b'1', 'jewelry.png', 'Біжутерія', 29),
(54, 'bracelets', '-28-29-53-', b'1', 'bracelets.png', 'Браслети', 53),
(55, 'pendants', '-28-29-53-', b'1', 'pendants.png', 'Підвіски', 53),
(56, 'earrings', '-28-29-53-', b'1', 'earrings.png', 'Сережки', 53),
(57, 'other-accessories', '-28-29-', b'1', 'other-accessories.png', 'Інші аксесуари', 29),
(58, 'mirrors', '-28-29-57-', b'1', 'mirrors.png', 'Зеркала', 57),
(59, 'icons', '-28-29-57-', b'1', 'icons.png', 'Значки', 57),
(60, 'mousepads-for-mice', '-28-29-57-', b'1', 'mousepads-for-mice.png', 'Коврики для мишок', 57),
(61, 'wallets', '-28-29-57-', b'1', 'wallets.png', 'Гаманці', 57),
(62, 'magnets', '-28-29-57-', b'1', 'magnets.png', 'Магніти', 57),
(63, 'patches', '-28-29-57-', b'1', 'patches.png', 'Нашивки', 57),
(64, 'covers', '-28-29-57-', b'1', 'covers.png', 'Обкладинки', 57),
(65, 'face-masks', '-28-29-57-', b'1', 'face-masks.png', 'Маски для обличчя', 57),
(66, 'gifts', NULL, b'1', 'gifts.png', 'Подарунки', NULL),
(67, 'coasters-for-mugs', '-66-', b'1', 'coasters-for-mugs.png', 'Підставки під кружки', 66),
(68, 'mugs', '-66-', b'1', 'mugs.png', 'Кружки', 66),
(69, 'gift-packages', '-66-', b'1', 'gift-packages.png', 'Подарункові пакети', 66),
(70, 'surprise-boxes', '-66-', b'1', 'surprise-boxes.png', 'Сюрприз бокси', 66),
(71, 'for-the-home', NULL, b'1', 'for-the-home.png', 'Для дому', NULL),
(72, 'household-goods', '-71-', b'1', 'household-goods.png', 'Побутові товари', 71),
(73, 'kitchen-aprons', '-71-72-', b'1', 'kitchen-aprons.png', 'Кухонні фартухи', 72),
(74, 'mats-for-the-table', '-71-72-', b'1', 'mats-for-the-table.png', 'Коврики на стіл', 72),
(75, 'plaids', '-71-72-', b'1', 'plaids.png', 'Пледи', 72),
(76, 'decorative-pillows', '-71-72-', b'1', 'decorative-pillows.png', 'Декоративні подушки', 72),
(77, 'towels', '-71-72-', b'1', 'towels', 'Полотенця', 72),
(78, 'bed-linen', '-71-72-', b'1', 'bed-linen.png', 'Постільне білизна', 72),
(79, 'decor', '-71-', b'1', 'decor.png', 'Декор', 71),
(80, 'tapestries', '-71-79-', b'1', 'tapestries.png', 'Гобелени', 79),
(81, 'shaped-pillows', '-71-79-', b'1', 'shaped-pillows', 'Фігурні подушки', 79),
(82, 'pictures-by-room', '-71-79-', b'1', 'pictures-by-room.png', 'Картинки по номерах', 79),
(83, 'stationery', NULL, b'1', 'stationery', 'Канцтовари', NULL),
(84, 'paper-products', '-83-', b'1', 'paper-products.png', 'Паперові товари', 83),
(85, 'post-it-notes', '-83-84-', b'1', 'post-it-notes.png', 'Стікери для заміток', 84),
(86, 'decorative-tape', '-83-84-', b'1', 'decorative-tape.png', 'Декоративний скотч', 84),
(87, 'notebooks', '-83-84-', b'1', 'notebooks.png', 'Блокноти', 84),
(88, 'workbooks', '-83-84-', b'1', 'workbooks.png', 'Зошити', 84),
(90, 'lines', '-83-', b'1', 'lines.png', 'Лінійки', 83),
(91, 'erasers', '-83-', b'1', 'erasers.png', 'Ластики', 83),
(92, 'pencil-cases', '-83-', b'1', 'pencil-cases.png', 'Пенали', 83),
(93, 'asian-products', NULL, b'1', 'asian-products.png', 'Азіатська продукція', NULL),
(94, 'drinks', '-93-', b'1', 'drinks.png', 'Напої', 93),
(96, 'noodles', '-93-', b'1', 'noodles.c', 'Лапша', 93),
(106, 'new_category', NULL, b'1', 'text.png', 'new_category', 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `orders_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `shipping_type` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `address`, `city`, `order_status`, `shipping_type`, `total_price`, `user_id`) VALUES
(16, 'вул. Корятовича 27', 'Ужгород', 'Waiting', 0, 2055, 1),
(17, 'вул. Корятовича 27', 'Ужгород', 'Waiting', 0, 2055, 1),
(18, 'вул. Корятовича 27', 'Ужгород', 'Paid', 0, 2055, 1),
(19, 'вул. Корятовича 27', 'Ужгород', 'Waiting', 0, 2055, 1),
(20, 'вул. Корятовича 27', 'Ужгород', 'Waiting', 0, 1260, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_basket`
--

DROP TABLE IF EXISTS `order_basket`;
CREATE TABLE IF NOT EXISTS `order_basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl7rqeve9by7viqp0whwoxths0` (`product_id`),
  KEY `FKopaem614pruff3g3ia1bpx6ag` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_basket`
--

INSERT INTO `order_basket` (`id`, `quantity`, `product_id`, `user_id`) VALUES
(5, 1, 12, 1),
(8, 1, 16, 1),
(9, 1, 6, 1),
(10, 1, 6, 1),
(11, 1, 6, 1),
(12, 1, 6, 1),
(13, 1, 6, 1),
(14, 1, 6, 1),
(15, 1, 6, 1),
(16, 1, 6, 1),
(17, 1, 6, 1),
(18, 1, 6, 1),
(19, 1, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  KEY `FK9tnjxr4w1dcvbo2qejikpxpfy` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `alias`, `description`, `image`, `price`, `title`, `category_id`, `vendor_id`) VALUES
(1, 'mangа-crucifixion-of-the-six', 'Test', 'Mangа-Crucifixion-of-the-Six.png', '300.00', 'Манга Розп\'яття шести', 13, 1),
(2, 'mangа-tomie', '<div>Tomie<br></div>', 'Mangа-Tomie.png', '568.00', 'Манга Томіе', 13, 1),
(3, 'mangа-a-monologue-b-an-herbalist', '<div>Манга Монолог травниці<br></div>', 'Mangа-A-monologue-b-an-herbalist.png', '492.00', 'Манга Монолог травниці', 13, 1),
(4, 'mangа-the-dark-butler', 'Mangа-The-dark-butler<br>', 'Mangа-The-dark-butler.png', '302.00', 'Манга Темний дворецький', 13, 1),
(5, 'pokémon-card-album', '<div>Альбом карток Покемонів, 240 карток, малюнок голограми дракона<br></div>', 'Pokémon-card-album.png', '199.00', 'Альбом карток Покемонів', 3, 1),
(6, 'demon-slayer-anime-postcard', '<div>Листівка аніме поштова посткроссінг день святого валентина валентинка відкритка день народження<br></div>', 'Demon-Slayer-anime-postcard.png', '21.00', 'Листівка ', 8, 1),
(7, 'journal-big-gangan', '<div><font color=\"#01011b\"><span style=\"font-size: 14px;\">Журнал «Великий ганган» | Великий ганган квітень 2024</span></font><br></div>', 'Journal-Big-Gangan.png', '650.00', 'Журнал «Великий ганган»', 5, 1),
(8, 'anime-calendar-poster-jujutsu-kaisen', '<div>Аніме-календар Постер Дзюдзюцу Кайсен<br></div>', 'Anime-calendar-Poster-Jujutsu-Kaisen.png', '30.00', 'Аніме-календар', 6, 1),
(9, 'one-piece-collectible-cards', '<div><h1 style=\"margin-bottom: 20px; margin-left: 20px; font-family: &quot;Roboto Slab&quot;; line-height: 24px; font-size: 20px; color: rgb(0, 121, 161);\">Колекційні картки «One Piece» 1</h1></div>', 'One-Piece-collectible-cards.png', '300.00', 'Колекційні картки', 4, 1),
(10, 'vinyl-stickers', '<div>Вінілові наклейки, стікери, аніме чан мілітарі, 10 шт<br></div>', 'Vinyl-stickers.png', '60.00', 'Вінілові наклейки', 7, 1),
(11, 'a4-anime-haikyuu-poster', '<div>Плакати надруковані на професійній цифровій друкарській машині на крейдованому папері<br></div>', 'A4-Anime-Haikyuu-Poster.png', '20.00', 'Постер А4 Аніме', 9, 1),
(12, 'artbooks-tokyo-ghoul', '<div>Tokyo Ghoul: Re Illustrations: Zakki<br></div>', 'artbooks-Tokyo-Ghoul.png', '1050.00', 'Артбук Tokyo Ghoul', 12, 1),
(13, 'manhwa-genshin-impact', '<div><font color=\"#222222\"><span style=\"font-size: 24px; text-transform: uppercase;\">МАНХВА “GENSHIN IMPACT” ТОМ 2</span></font></div>', 'MANHWA-GENSHIN-IMPACT.png', '529.00', 'МАНХВА GENSHIN IMPACT', 16, 1),
(14, 'manhua-little-mushroom-wrong', '<div>Оригінальний комікс Том 1. Китайська науково-фантастична книга<br></div>', 'manhua-Little-Mushroom-Wrong.png', '900.00', 'Маленький гриб неправильний, але все одно правильний', 17, 1),
(15, 'ranobe-eighty-six', '<div>Ранобе 86 Вісімдесят шість Том 02 | Eighty Six<br></div>', 'Ranobe-Eighty-six.png', '326.00', '86 Вісімдесят шість', 14, 1),
(16, 'test-test-test-test-', '<div><br></div>', '', '0.00', 'Test Test Test ', 1, 1),
(17, 'new_product', '<div>new_product<br></div>', 'https://plugins.shopware-staging.overdose.digital/thumbnail/d3/e3/a5/1690970711/test%20%281%29_1920x1920.png', '1201.55', 'new_product', 1, 1),
(18, 'asdfsdfdsf', '<div><br></div>', 'Anime-calendar-Poster-Jujutsu-Kaisen.png', '400.00', 'asdsadadsdsa', 93, 1),
(19, 'testtesttesttest-test', '<div><br></div>', 'testtesttesttest-test', '0.00', 'testtesttesttest-test', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `login`, `password`, `role`) VALUES
(1, 'kozlovmax27056@gmail.com', '00AyanamiRei', '$2a$10$cDz4XksdgqgnBcLp.SMN2eS8bgc77JOE3iLytPeRGjl6hrwvx9eOq', 'ADMIN'),
(2, 'c.kozlov.maksym@student.uzhnu.edu.ua', 'kozlovmaks27056@gmail.com', '$2a$10$UicqUE.PLmdq7lbob7X0ye1ljKh2ZXOy1a1vh57WG2RatQOJCQ.Ma', 'USER'),
(3, 'c.kozlov.maksym@student.uzhnu.edu.ua', 'TestNewUser', '$2a$10$wAth7tP0N6DEs3XrFuHXFuOCRPAWfwkB/PGWzHtrGggrC7aP8xpgO', 'USER'),
(4, 'c.kozlov.maksym@student.uzhnu.edu.ua', 'oidsnvdsv', '$2a$10$RACiYAxN0vM4md7LLGO9FO94yjbpWJ02HfimplNIgPemRdcBVNZp2', 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `user_info_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_info_id`, `name`, `phone`, `surname`) VALUES
(1, 'Maksym', '+380661882296', 'Kozlov'),
(2, 'Maksym', '+380661882296', 'Kozlov'),
(3, 'Maksym', '+380661882296', 'Kozlov'),
(4, 'Maksym', '+380661882296', 'Kozlov');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `title`) VALUES
(1, 'AliExpress');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product` ADD FULLTEXT KEY `title` (`title`,`description`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK2y94svpmqttx80mshyny85wqr` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `FKfci970pwpbd5v3idj3agntg80` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_basket`
--
ALTER TABLE `order_basket`
  ADD CONSTRAINT `FKl7rqeve9by7viqp0whwoxths0` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKopaem614pruff3g3ia1bpx6ag` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK9tnjxr4w1dcvbo2qejikpxpfy` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `FKis88irnme4d39p7mbidp2yhg8` FOREIGN KEY (`user_info_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
