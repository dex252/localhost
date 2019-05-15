-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 15 2019 г., 07:38
-- Версия сервера: 5.6.41
-- Версия PHP: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `anime_database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `age_limitations_table`
--

CREATE TABLE `age_limitations_table` (
  `id_age_limitations` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `anime_table`
--

CREATE TABLE `anime_table` (
  `id_anime` int(11) NOT NULL,
  `id_ganre` int(11) DEFAULT '0',
  `id_age_limitations` int(11) DEFAULT '0',
  `id_video_type` int(11) DEFAULT '0',
  `id_exit_status` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT '0',
  `author` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `num_series` int(11) DEFAULT '0',
  `discription` longtext,
  `img_link` longtext,
  `date_created` datetime DEFAULT NULL,
  `date_last_change` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `anime_type_table`
--

CREATE TABLE `anime_type_table` (
  `id_video_type` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `exit_status_table`
--

CREATE TABLE `exit_status_table` (
  `id_exit_status` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ganre_table`
--

CREATE TABLE `ganre_table` (
  `id_ganre` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `series_table`
--

CREATE TABLE `series_table` (
  `id_series` int(11) NOT NULL,
  `id_anime` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `link` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `status_comment_table`
--

CREATE TABLE `status_comment_table` (
  `id_status_comment` int(11) NOT NULL,
  `status_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_user_video_table`
--

CREATE TABLE `type_user_video_table` (
  `id_type` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_table`
--

CREATE TABLE `users_table` (
  `id_user` int(11) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status_active` tinyint(1) DEFAULT '0',
  `dob` datetime DEFAULT NULL,
  `vk` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `last_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_comments_table`
--

CREATE TABLE `user_comments_table` (
  `id_comment` int(11) NOT NULL,
  `id_anime` int(11) DEFAULT '0',
  `id_user` int(11) DEFAULT '0',
  `id_status_comment` int(11) DEFAULT '0',
  `text` longtext,
  `date` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_video_table`
--

CREATE TABLE `user_video_table` (
  `id_video` int(11) NOT NULL,
  `id_type` int(11) DEFAULT '0',
  `id_user` int(11) DEFAULT '0',
  `id_anime` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `age_limitations_table`
--
ALTER TABLE `age_limitations_table`
  ADD PRIMARY KEY (`id_age_limitations`);

--
-- Индексы таблицы `anime_table`
--
ALTER TABLE `anime_table`
  ADD PRIMARY KEY (`id_anime`),
  ADD KEY `id_ganre` (`id_ganre`),
  ADD KEY `id_age_limitations` (`id_age_limitations`),
  ADD KEY `id_video_type` (`id_video_type`),
  ADD KEY `id_exit_status` (`id_exit_status`);

--
-- Индексы таблицы `anime_type_table`
--
ALTER TABLE `anime_type_table`
  ADD PRIMARY KEY (`id_video_type`);

--
-- Индексы таблицы `exit_status_table`
--
ALTER TABLE `exit_status_table`
  ADD PRIMARY KEY (`id_exit_status`);

--
-- Индексы таблицы `ganre_table`
--
ALTER TABLE `ganre_table`
  ADD PRIMARY KEY (`id_ganre`);

--
-- Индексы таблицы `series_table`
--
ALTER TABLE `series_table`
  ADD PRIMARY KEY (`id_series`),
  ADD KEY `id_anime` (`id_anime`);

--
-- Индексы таблицы `status_comment_table`
--
ALTER TABLE `status_comment_table`
  ADD PRIMARY KEY (`id_status_comment`);

--
-- Индексы таблицы `type_user_video_table`
--
ALTER TABLE `type_user_video_table`
  ADD PRIMARY KEY (`id_type`);

--
-- Индексы таблицы `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `user_comments_table`
--
ALTER TABLE `user_comments_table`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_status_comment` (`id_status_comment`),
  ADD KEY `id_anime` (`id_anime`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `user_video_table`
--
ALTER TABLE `user_video_table`
  ADD PRIMARY KEY (`id_video`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_anime` (`id_anime`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `age_limitations_table`
--
ALTER TABLE `age_limitations_table`
  MODIFY `id_age_limitations` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `anime_table`
--
ALTER TABLE `anime_table`
  MODIFY `id_anime` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `anime_type_table`
--
ALTER TABLE `anime_type_table`
  MODIFY `id_video_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exit_status_table`
--
ALTER TABLE `exit_status_table`
  MODIFY `id_exit_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ganre_table`
--
ALTER TABLE `ganre_table`
  MODIFY `id_ganre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `series_table`
--
ALTER TABLE `series_table`
  MODIFY `id_series` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `status_comment_table`
--
ALTER TABLE `status_comment_table`
  MODIFY `id_status_comment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `type_user_video_table`
--
ALTER TABLE `type_user_video_table`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user_comments_table`
--
ALTER TABLE `user_comments_table`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user_video_table`
--
ALTER TABLE `user_video_table`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `anime_table`
--
ALTER TABLE `anime_table`
  ADD CONSTRAINT `anime_table_ibfk_1` FOREIGN KEY (`id_ganre`) REFERENCES `ganre_table` (`id_ganre`),
  ADD CONSTRAINT `anime_table_ibfk_2` FOREIGN KEY (`id_age_limitations`) REFERENCES `age_limitations_table` (`id_age_limitations`),
  ADD CONSTRAINT `anime_table_ibfk_3` FOREIGN KEY (`id_video_type`) REFERENCES `anime_type_table` (`id_video_type`),
  ADD CONSTRAINT `anime_table_ibfk_4` FOREIGN KEY (`id_exit_status`) REFERENCES `exit_status_table` (`id_exit_status`);

--
-- Ограничения внешнего ключа таблицы `series_table`
--
ALTER TABLE `series_table`
  ADD CONSTRAINT `series_table_ibfk_1` FOREIGN KEY (`id_anime`) REFERENCES `anime_table` (`id_anime`);

--
-- Ограничения внешнего ключа таблицы `user_comments_table`
--
ALTER TABLE `user_comments_table`
  ADD CONSTRAINT `user_comments_table_ibfk_1` FOREIGN KEY (`id_anime`) REFERENCES `anime_table` (`id_anime`),
  ADD CONSTRAINT `user_comments_table_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users_table` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `user_video_table`
--
ALTER TABLE `user_video_table`
  ADD CONSTRAINT `user_video_table_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_user_video_table` (`id_type`),
  ADD CONSTRAINT `user_video_table_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users_table` (`id_user`),
  ADD CONSTRAINT `user_video_table_ibfk_3` FOREIGN KEY (`id_anime`) REFERENCES `anime_table` (`id_anime`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;