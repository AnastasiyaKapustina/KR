-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 18 2023 г., 10:38
-- Версия сервера: 5.7.33-log
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ecommerce`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '123');

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'IMIR'),
(2, 'STENSER'),
(3, 'Banda'),
(4, 'SKOS Fashion'),
(5, 'Renovacio'),
(6, 'Другие');

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(148, 1, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Костюмы'),
(2, 'Верхняя одежда'),
(3, 'Рубашки и сорочки'),
(4, 'Трикотаж'),
(5, 'Аксессуары'),
(6, 'Нижнее белье'),
(7, 'Джинсовая одежда');

-- --------------------------------------------------------

--
-- Структура таблицы `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(6, '123@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(2, 12, 'Пользователь', '123@gmail.com', 'Адрес', 'Адрес', 'Адрес', 672000, 'Пользователь', '4154 2699 6299 2374', '12/22', 2, 11900, 881),
(3, 12, 'Пользователь', '123@gmail.com', 'Адрес 1', 'Чита', 'Россия', 672000, 'Пользователь', '4154 2699 6299 2374', '12/26', 2, 26900, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(76, 2, 3, 1, 10000),
(77, 2, 16, 1, 1900),
(78, 3, 2, 1, 25000),
(79, 3, 21, 1, 1900);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Костюм мужской тройка Пиджак+брюки+жилет', 10000, 'Костюм мужской тройка Пиджак+брюки+жилет', 'product07.png', '1'),
(2, 1, 3, 'Классический свадебный офисный костюм тройка ', 20000, 'Классический свадебный офисный костюм тройка ', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png', '2'),
(3, 1, 3, 'Костюм классический двойка', 10000, 'Костюм классический двойка', 'da4371ffa192a115f922b1c0dff88193.png', '3'),
(4, 1, 3, 'Классический свадебный офисный костюм тройка', 25000, 'Классический свадебный офисный костюм тройка приталенный ', 'http___pluspng.com_img-png_iphone-6s-png-iphone-6s-gold-64gb-1000.png', '4'),
(5, 1, 2, 'Костюм ТРОЙКА (ПИДЖАК+БРЮКИ+ЖИЛЕТ)', 15000, 'Костюм ТРОЙКА (ПИДЖАК+БРЮКИ+ЖИЛЕТ +ВЕШАЛКА) PALAMOS COMBO', 'iPad-air.png', '5'),
(6, 1, 1, 'Костюм ДВОЙКА (ПИДЖАК+БРЮКИ+ВЕШАЛКА)', 10000, 'Костюм ДВОЙКА (ПИДЖАК+БРЮКИ+ВЕШАЛКА) COVE', 'laptop_PNG5939.png', '6'),
(7, 1, 1, 'Костюм ДВОЙКА (ПИДЖАК+БРЮКИ+ВЕШАЛКА)', 12000, 'Костюм ДВОЙКА (ПИДЖАК+БРЮКИ+ВЕШАЛКА) ENRICO', 'laptop_PNG5930.png', '7'),
(8, 1, 4, 'Костюм ДВОЙКА (ПИДЖАК+БРЮКИ+ВЕШАЛКА)', 20000, 'Костюм ДВОЙКА (ПИДЖАК+БРЮКИ+ВЕШАЛКА) MONSORO', '530201353846AM_635_sony_xperia_z.png', '8'),
(9, 1, 3, 'Костюм офисный классический деловой', 12000, 'Костюм офисный классический деловой, двойка большие размеры', 'iphone-hd-png-iphone-apple-png-file-550.png', '9'),
(10, 2, 6, 'Куртка мужская зимняя с капюшоном', 10000, 'Куртка мужская зимняя с капюшоном (пуховик, парка на осень)', 'red dress.jpg', '10'),
(11, 2, 6, 'Пуховик, мужской, длинный ', 15000, 'Пуховик, мужской, длинный ', 'images.jpg', '11'),
(12, 2, 6, 'Куртка мужская зимняя длинная пуховик', 7000, 'Куртка мужская зимняя длинная пуховик', '7475-ladies-casual-dresses-summer-two-colors-pleated.jpg', '12'),
(13, 2, 6, 'Пуховик мужской зимний куртка оверсайз', 15000, 'Пуховик мужской зимний куртка оверсайз', 'Spring-Autumn-Winter-Young-Ladies-Casual-Wool-Dress-Women-s-One-Piece-Dresse-Dating-Clothes-Medium.jpg_640x640.jpg', '13'),
(14, 2, 6, 'Пальто с капюшоном на синтепоне', 10000, 'Пальто с капюшоном на синтепоне / Удлиненный пуховик', 'download.jpg', '14'),
(15, 2, 6, 'Кожаная куртка с натуральным мехом', 9000, 'Кожаная куртка с натуральным мехом с капюшоном', 'shutterstock_203611819.jpg', '15'),
(16, 3, 6, 'Рубашка с запонками запонки и пуговицы', 1900, 'Рубашка с запонками запонки и пуговицы', '2012-Winter-Sweater-for-Men-for-better-outlook.jpg', '16'),
(17, 3, 6, 'Рубашка Slim Fit для мужчин классическая', 1700, 'Рубашка Slim Fit для мужчин классическая', 'gents-formal-250x250.jpg', '17'),
(19, 3, 6, 'Рубашка мужская белая классическая офис', 1300, 'Рубашка мужская белая классическая офис', 'images (1).jpg', '18'),
(20, 3, 6, 'Рубашка Slim Fit для мужчин классическая', 1600, 'Рубашка Slim Fit для мужчин классическая', 'Winter-fashion-men-burst-sweater.png', '19'),
(21, 3, 6, 'Рубашка Slim Fit мужская классическая', 1900, 'Рубашка Slim Fit мужская классическая', 'IN-Mens-Apparel-Voodoo-Tiles-09._V333872612_.jpg', '20'),
(22, 4, 6, 'Свитер мужской с горлом,водолазка', 1300, 'yello t shirt with pant', '1.0x0.jpg', '21'),
(23, 4, 6, 'Свитер мужской новогодний с оленями', 1900, 'Свитер мужской новогодний с оленями', 'GirlsClothing_Widgets.jpg', '22'),
(24, 4, 6, 'Свитер теплый джемпер вязаный', 700, 'Свитер теплый джемпер вязаный', 'images.jpg', '23'),
(25, 4, 6, 'Джемпер мужской хлопок', 1500, 'Джемпер мужской хлопок', 'images (3).jpg', '24'),
(27, 4, 6, 'Кофта флисовая на молнии Толстовка', 5000, 'Кофта флисовая на молнии Толстовка', 'image28.jpg', '25'),
(32, 5, 0, 'Подарочный набор для мужчин', 2500, 'Подарочный набор для мужчин', 'furniture-book-shelf-250x250.jpg', '26'),
(33, 6, 2, 'Термобельё флисовое зимнее Fleece', 2500, 'Термобельё флисовое зимнее Fleece', 'CT_WM_BTS-BTC-AppliancesHome_20150723.jpg', '27'),
(40, 2, 6, 'Длинная утепленная куртка', 3000, 'Длинная утепленная куртка', 'girl-walking.jpg', '28'),
(47, 4, 6, 'Свитер мужской с горлом теплый зимний', 4500, 'Свитер мужской с горлом теплый зимний', 'product01.png', '29'),
(50, 3, 6, 'Рубашка мужская классическая прямая', 1800, 'Рубашка мужская классическая прямая', 'pm1.JPG', '30'),
(51, 3, 6, 'Рубашка мужская классическая', 1500, 'Рубашка мужская классическая с длинным рукавом приталенная', 'pm2.JPG', '31'),
(52, 3, 6, 'Рубашка мужская джинсовая', 1800, 'Рубашка мужская джинсовая с длинным рукавом', 'pm3.JPG', '32'),
(53, 3, 6, 'Рубашка мужская белая классическая офис', 220, 'Рубашка мужская белая классическая офис', 'ms1.JPG', '33'),
(72, 7, 2, 'Джинсы прямые классические', 3500, 'Джинсы прямые классические', 'product02.png', '34');

-- --------------------------------------------------------

--
-- Структура таблицы `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Пользователь', '1', '123@gmail.com', '123', '0008880088', 'Адрес 1', 'Адрес 2');

--
-- Триггеры `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Индексы таблицы `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблицы `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
