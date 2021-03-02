-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Mrz 2021 um 10:41
-- Server-Version: 10.4.17-MariaDB
-- PHP-Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `notr`
--
CREATE DATABASE IF NOT EXISTS `notr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `notr`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dateien`
--

CREATE TABLE `dateien` (
  `ID` int(11) NOT NULL,
  `ID-notizen` int(11) NOT NULL,
  `datei` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notizen`
--

CREATE TABLE `notizen` (
  `ID` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `password_check` tinyint(1) NOT NULL,
  `password` varchar(34) DEFAULT NULL,
  `alarm` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `notizen`
--

INSERT INTO `notizen` (`ID`, `title`, `password_check`, `password`, `alarm`, `deleted`, `updated`) VALUES
(1, 'Arztermin', 0, NULL, NULL, 0, '2021-01-21 10:41:40'),
(2, 'Bestellung', 0, NULL, NULL, 0, '2021-01-17 10:41:40'),
(3, 'Essen gehen\r\n', 0, NULL, NULL, 0, '0000-00-00 00:00:00'),
(4, 'Einkaufszettel', 0, NULL, NULL, 0, '0000-00-00 00:00:00'),
(8, '', 0, NULL, NULL, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notizen_tags`
--

CREATE TABLE `notizen_tags` (
  `ID_tags` int(11) NOT NULL,
  `ID_notizen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `notizen_tags`
--

INSERT INTO `notizen_tags` (`ID_tags`, `ID_notizen`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notizen_text`
--

CREATE TABLE `notizen_text` (
  `ID_notizen` int(11) NOT NULL,
  `ID_text` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `notizen_text`
--

INSERT INTO `notizen_text` (`ID_notizen`, `ID_text`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 3),
(8, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE `tags` (
  `ID` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tags`
--

INSERT INTO `tags` (`ID`, `name`) VALUES
(1, 'test'),
(2, 'arbeit');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `text`
--

CREATE TABLE `text` (
  `ID` int(11) NOT NULL,
  `section` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `text`
--

INSERT INTO `text` (`ID`, `section`) VALUES
(1, 'Dienstag 16.2.2021'),
(2, 'Bestellung Tabletten für Oma'),
(3, 'Brot\r\nFisch \r\nGemüse'),
(4, 'Freitag 28.2.2021'),
(5, '');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `dateien`
--
ALTER TABLE `dateien`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID-notizen` (`ID-notizen`);

--
-- Indizes für die Tabelle `notizen`
--
ALTER TABLE `notizen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `notizen_tags`
--
ALTER TABLE `notizen_tags`
  ADD PRIMARY KEY (`ID_tags`,`ID_notizen`),
  ADD KEY `ID-tags` (`ID_tags`),
  ADD KEY `ID-notizen` (`ID_notizen`);

--
-- Indizes für die Tabelle `notizen_text`
--
ALTER TABLE `notizen_text`
  ADD PRIMARY KEY (`ID_notizen`,`ID_text`),
  ADD KEY `ID-notizen` (`ID_notizen`,`ID_text`),
  ADD KEY `FK_notizen-text_text` (`ID_text`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `text`
--
ALTER TABLE `text`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `dateien`
--
ALTER TABLE `dateien`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `notizen`
--
ALTER TABLE `notizen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `text`
--
ALTER TABLE `text`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `dateien`
--
ALTER TABLE `dateien`
  ADD CONSTRAINT `FK_dateien_notizen` FOREIGN KEY (`ID-notizen`) REFERENCES `notizen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `notizen_tags`
--
ALTER TABLE `notizen_tags`
  ADD CONSTRAINT `FK_notizen-tags_notizen` FOREIGN KEY (`ID_notizen`) REFERENCES `notizen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_notizen-tags_tags` FOREIGN KEY (`ID_tags`) REFERENCES `tags` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `notizen_text`
--
ALTER TABLE `notizen_text`
  ADD CONSTRAINT `FK_notizen-text_notizen` FOREIGN KEY (`ID_notizen`) REFERENCES `notizen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_notizen-text_text` FOREIGN KEY (`ID_text`) REFERENCES `text` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
