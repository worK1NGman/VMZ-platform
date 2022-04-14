-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 28 2021 г., 13:32
-- Версия сервера: 5.6.37
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `VMZ`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Detail`
--

CREATE TABLE `Detail` (
  `Detail_Cipher` varchar(15) NOT NULL,
  `ID_Group` varchar(15) DEFAULT NULL,
  `ID_Technologist` varchar(15) DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `Material` varchar(30) NOT NULL,
  `Machine` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Detail`
--

INSERT INTO `Detail` (`Detail_Cipher`, `ID_Group`, `ID_Technologist`, `Name`, `Material`, `Machine`, `Date`) VALUES
('3461209001', '4', 'Вера', 'Винт', '30ХГСА', '1В340', NULL),
('780895104', NULL, NULL, 'Втулка', '30ХГСА', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Detail_Operation`
--

CREATE TABLE `Detail_Operation` (
  `Detail_Cipher` varchar(15) NOT NULL,
  `ID_Operation` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Operation`
--

CREATE TABLE `Operation` (
  `ID_Operation` varchar(15) NOT NULL,
  `Detail_Cipher` varchar(15) NOT NULL,
  `ID_Act` varchar(15) DEFAULT NULL,
  `ID_Time` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Detail`
--
ALTER TABLE `Detail`
  ADD PRIMARY KEY (`Detail_Cipher`);

--
-- Индексы таблицы `Detail_Operation`
--
ALTER TABLE `Detail_Operation`
  ADD PRIMARY KEY (`Detail_Cipher`,`ID_Operation`),
  ADD KEY `ID_Operation` (`ID_Operation`);

--
-- Индексы таблицы `Operation`
--
ALTER TABLE `Operation`
  ADD PRIMARY KEY (`ID_Operation`),
  ADD KEY `ID_Cipher` (`Detail_Cipher`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Detail_Operation`
--
ALTER TABLE `Detail_Operation`
  ADD CONSTRAINT `detail_operation_ibfk_1` FOREIGN KEY (`Detail_Cipher`) REFERENCES `Detail` (`Detail_Cipher`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_operation_ibfk_2` FOREIGN KEY (`ID_Operation`) REFERENCES `Operation` (`ID_Operation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Operation`
--
ALTER TABLE `Operation`
  ADD CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`ID_Operation`) REFERENCES `Detail_Operation` (`ID_Operation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`Detail_Cipher`) REFERENCES `Detail_Operation` (`Detail_Cipher`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
