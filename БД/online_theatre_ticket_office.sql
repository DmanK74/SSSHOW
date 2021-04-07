-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 08 2021 г., 01:15
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `online_theatre_ticket_office`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `NickName` varchar(30) NOT NULL,
  `Pass` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `NickName`, `Pass`, `Email`) VALUES
(1, 'Kalash', '12072001DDD', 'mitya.kalashnikov.01@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `genre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`id`, `genre`) VALUES
(9, 'Боевик'),
(3, 'Вестерн'),
(21, 'Детект'),
(12, 'Детектив'),
(4, 'Драмма'),
(2, 'Комедия'),
(1, 'Фантастика'),
(11, 'Фэнтези');

-- --------------------------------------------------------

--
-- Структура таблицы `modders`
--

CREATE TABLE `modders` (
  `id` int(255) NOT NULL,
  `NickName` varchar(30) NOT NULL,
  `Pass` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `modders`
--

INSERT INTO `modders` (`id`, `NickName`, `Pass`, `Email`) VALUES
(1, 'Kalash', '12072001DDD', 'mitya.kalashnikov.01@mail.ru'),
(3, 'Lilya', 'prostoPESNYA2001', 'nasibyano@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `shows`
--

CREATE TABLE `shows` (
  `showName` varchar(100) NOT NULL,
  `genre` varchar(30) NOT NULL,
  `actors` varchar(255) NOT NULL,
  `director` varchar(30) NOT NULL,
  `id` int(11) NOT NULL,
  `scoreShow` int(10) NOT NULL,
  `poster` text NOT NULL,
  `showCost` int(30) NOT NULL,
  `showInfo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shows`
--

INSERT INTO `shows` (`showName`, `genre`, `actors`, `director`, `id`, `scoreShow`, `poster`, `showCost`, `showInfo`) VALUES
('Выживший', 'Вестерн', 'Леонардо ДиКаприо, Том Харди, Донал Глисон, Уилл Поултер, Форрест Гудлак, Пол Андерсон', 'Алехандро Гонсалес', 1, 8, 'assets/images/remnant.jpg', 400, 'Охотник Хью Гласс серьезно ранен на неизведанных просторах американского Дикого Запада. Товарищ Хью по отряду покорителей новых земель Джон Фицжеральд предательски оставляет его умирать в одиночестве. Теперь у Гласса осталось только одно оружие — его сила воли. Он готов бросить вызов первобытной природе, суровой зиме и враждебным племенам индейцев, только чтобы выжить и отомстить Фицжеральду.'),
('Довод', 'Фантастика', 'Джон Дэвид Вашингтон, \r\nРоберт Паттинсон, \r\nЭлизабет Дебики, \r\nКеннет Брана, \r\nКлеманс Поэзи', 'Кристофер Нолан', 2, 7, 'assets/images/dovod.jpg', 350, 'Главный герой — секретный агент, который проходит жестокий тест на надежность и присоединяется к невероятной миссии. От ее выполнения зависит судьба мира, а для успеха необходимо отбросить все прежние представления о пространстве и времени.'),
('Люди x', 'Фантастика', 'Хью Джекман,Патрик Стюарт, Иэн Маккеллен, Фамке Янссен, Холли Берри', ' Брайан Сингер', 3, 6, 'assets/images/xmen.jpg', 200, 'Они — дети атомного века, сверхлюди, новое звено в цепи эволюции. Каждый из них был рождён в результате уникальной генетической мутации, наделившей их с детства необыкновенными способностями. Под руководством профессора Чарльза Ксавьера, телепата с мировым именем, одарённые ученики научились контролировать и управлять своими удивительными способностями в интересах человечества.  Но не все мутанты разделяют взгляды профессора: могущественный мутант Магнето, которому подвластны все металлы, собрал команду единомышленников. Он не верит, что люди и мутанты когда-либо смогут мирно сосуществовать. Они разработали план, чтобы осуществить захват власти над миром, и тогда, только ученики профессора Ксавьера смогут защитить этот мир…'),
('Титаник', 'Драмма', 'Леонардо ДиКаприо, Кейт Уинслет, Кэти Бейтс, Фрэнсис Фишер, Глория Стюарт, Билл Пэкстон', 'Джеймс Кэмерон', 4, 5, 'assets/images/titanic.jpg', 100, 'Молодые влюбленные Джек и Роза находят друг друга в первом и последнем плавании «непотопляемого» Титаника. Они не могли знать, что шикарный лайнер столкнется с айсбергом в холодных водах Северной Атлантики, и их страстная любовь превратится в схватку со смертью…'),
('Малоун', 'Комедия', 'Квен, Мэлоун, Поднимаемся', 'Новинки Белорус', 5, 10, 'assets/images/asylum.jpg', 500, 'Ад - это эксперимент, который нельзя пережить. Журналист-расследователь Майлз Апшур, исследуует гору \"Массивное Убежище\" и пытается выжить достаточно долго, чтобы обнаружить ее ужасную тайну...'),
('Плачущий дьявол', 'Боевик', 'Дантос, Виталя, Нероу, Спардак', 'Ева Гринн', 6, 9, 'assets/images/dmc.jpg', 600, ' Таинственный человек, Аркхэм, прибывает с приглашением от брата Данте Вергилия в форме демонической атаки. После того, как Данте побеждает группу демонов, огромная башня вырывается из земли поблизости, затмевая окружающий ее обширный город. Чувствуя, что Вергилий находится на вершине конструкции, Данте интерпретирует это как вызов. Во время своего путешествия он начинает сражаться с большим количеством демонов, некоторые из которых становятся его оружием после поражения. На Данте нападает женщина на мотоцикле, которая оказывается Мэри , дочерью Аркхэма, которая хочет отомстить своему отцу за смерть своей матери. Выясняется, что Аркхэм работает на Вергилия; они планируют взять половину амулета матери Данте и использовать его силу на башне, чтобы соединить человеческий и демонический миры. '),
('Прикосновение Небес', 'Фэнтези', 'Широкий, Сейба, Арчибальд, Райда', 'Гил Гамешь', 8, 10, 'assets/images/fate3.jpg', 1000, 'Согласно древним законам, «королевскую битву» ведут семь Мастеров-магов, каждый из которых вызывает Слугу – одного из вечных героев ушедших или будущих эпох. Последний оставшийся Мастер получает Грааль – величайшее сокровище, которое выполняет любое желание. Правил нет, цель оправдывает средства, вчерашний друг может оказаться соперником и без раздумий предать, ударить в спину. Узнав правду, Сиро становится перед тяжким выбором – уйти, отказаться от борьбы или рискнуть и поставить на карту все — невеликий (так он думает) магический дар, горячее сердце, отчаянное желание спасти всех, кто ему дорог. Но последней каплей на чаше весов чести и мужества станут зеленые глаза из далекого прошлого, засиявшие той самой ночью.'),
('Castlevania', 'Фэнтези', 'Влад Цепеш, Адриан Цепеш, Тревор Бельмонд, Сифа Белнадес.', 'Уоррен Эллис', 9, 10, 'assets/images/castle.jpg', 600, 'Смелая девушка Лиза приходит прямиком в замок графа Дракулы, чтобы тот поделился с ней всеми доступными научными знаниями. У неё благородная цель - девушка хочет стать лучшим врачом и облегчить жизнь людей, но местные не оценили рвения, и вот уже Лизу сжигают на костре за колдовство. Взбешённый Дракула решает мстить за любимую - он даёт жителям города год, а затем насылает на них полчища демонов из ада. Но находится отважный герой, согласившийся противостоять повелителю вампиров.'),
('Кровь Дракона', 'Фэнтези', 'Девион, Мирана, Инвокер, Луна, Селемина', 'Древний', 10, 8, 'assets/images/dota.jpg', 560, 'Прославленный драконий рыцарь Дэвион посвятил жизнь борьбе с бедами мира. После встречи с могущественным древним эльдвурмом и с благородной принцессой Мираной, у которой есть своя тайная миссия, Дэвион оказывается в эпицентре событий куда более масштабных, чем он мог себе представить.'),
('ррр', 'ррр', 'ррр', 'рр', 17, 8, 'assets/images/titanic.jpg', 700, 'яяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяяя');

-- --------------------------------------------------------

--
-- Структура таблицы `ticket`
--

CREATE TABLE `ticket` (
  `TiketId` int(30) NOT NULL,
  `showCost` int(30) NOT NULL,
  `Visitor_id` int(11) NOT NULL,
  `ShowId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ticket`
--

INSERT INTO `ticket` (`TiketId`, `showCost`, `Visitor_id`, `ShowId`) VALUES
(1, 400, 1, 1),
(2, 100, 2, 4),
(5, 400, 1, 1),
(6, 500, 1, 5),
(7, 350, 2, 2),
(8, 200, 2, 3),
(9, 350, 2, 2),
(10, 350, 2, 2),
(53, 100, 1, 4),
(54, 100, 2, 4),
(55, 500, 1, 5),
(56, 200, 1, 3),
(57, 500, 1, 5),
(58, 350, 1, 2),
(59, 400, 1, 1),
(60, 600, 1, 6),
(61, 100, 1, 4),
(62, 350, 1, 2),
(63, 1000, 1, 8),
(64, 1000, 1, 8),
(65, 350, 1, 2),
(66, 1000, 53, 8),
(67, 400, 53, 1),
(68, 600, 54, 6),
(69, 400, 54, 1),
(70, 1000, 54, 8),
(71, 200, 2, 4),
(72, 200, 2, 4),
(73, 200, 2, 4),
(74, 600, 1, 6),
(75, 200, 55, 3),
(76, 500, 1, 5),
(77, 600, 1, 6),
(78, 500, 1, 5),
(79, 350, 1, 2),
(80, 400, 50, 1),
(81, 500, 50, 5),
(82, 1000, 50, 8),
(83, 600, 4, 9),
(84, 1000, 4, 8),
(85, 560, 4, 10),
(86, 200, 4, 3),
(87, 600, 4, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `visitors`
--

CREATE TABLE `visitors` (
  `id` int(255) NOT NULL,
  `NickName` varchar(30) NOT NULL,
  `Pass` varchar(255) NOT NULL,
  `Permision` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `visitors`
--

INSERT INTO `visitors` (`id`, `NickName`, `Pass`, `Permision`) VALUES
(1, 'Kalash', '12072001DDD', 1),
(2, 'Karpov', 'karpov228', 2),
(3, 'Lilya', 'prostoPESNYA', 2),
(4, 'Olya', 'okalas2001OK', 0),
(29, 'dimas', '12345', 0),
(48, 'sasskebbn', '12345h', 0),
(49, 'Kalashsad', '12072001DDD', 0),
(50, 'sw', '12345', 0),
(51, 'Karpoi', '12345', 0),
(52, 'JJJJ', '12345', 0),
(53, 'Kalashik', '12072001DDD', 0),
(54, 'pop', '12345', 0),
(55, 'C', 'asdasda', 0),
(56, 'uuu', 'uuuuu', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `genre` (`genre`);

--
-- Индексы таблицы `modders`
--
ALTER TABLE `modders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `showName` (`showName`),
  ADD KEY `showName_2` (`showName`),
  ADD KEY `showCost` (`showCost`);

--
-- Индексы таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TiketId`),
  ADD UNIQUE KEY `TiketId` (`TiketId`),
  ADD KEY `Visitor_id_2` (`Visitor_id`),
  ADD KEY `ShowId` (`ShowId`),
  ADD KEY `showCost` (`showCost`),
  ADD KEY `Visitor_id` (`Visitor_id`) USING BTREE,
  ADD KEY `ShowId_2` (`ShowId`) USING BTREE;

--
-- Индексы таблицы `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `NickName` (`NickName`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `modders`
--
ALTER TABLE `modders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `shows`
--
ALTER TABLE `shows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `ticket`
--
ALTER TABLE `ticket`
  MODIFY `TiketId` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id`) REFERENCES `modders` (`id`);

--
-- Ограничения внешнего ключа таблицы `modders`
--
ALTER TABLE `modders`
  ADD CONSTRAINT `modders_ibfk_1` FOREIGN KEY (`id`) REFERENCES `visitors` (`id`);

--
-- Ограничения внешнего ключа таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`Visitor_id`) REFERENCES `visitors` (`id`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`ShowId`) REFERENCES `shows` (`id`),
  ADD CONSTRAINT `ticket_ibfk_5` FOREIGN KEY (`showCost`) REFERENCES `shows` (`showCost`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
