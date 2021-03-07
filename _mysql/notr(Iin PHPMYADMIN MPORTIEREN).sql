-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Mrz 2021 um 19:57
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.2.34

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
CREATE DATABASE IF NOT EXISTS `notr` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
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
(426, 'Einkaufszettel Netto', 0, NULL, NULL, 0, '0000-00-00 00:00:00'),
(427, 'Baumarkt', 0, NULL, NULL, 0, '0000-00-00 00:00:00'),
(428, 'Oma Abendessen', 0, NULL, NULL, 0, '0000-00-00 00:00:00'),
(432, 'Nicht umgesetzte Ideen', 0, NULL, NULL, 0, '0000-00-00 00:00:00');

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
(862, 426),
(862, 427),
(872, 428),
(899, 428),
(909, 432),
(917, 427);

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
(426, 374),
(427, 375),
(428, 376),
(432, 380);

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
(862, 'einkaufen'),
(899, 'essen'),
(917, 'hobby'),
(909, 'projekt'),
(872, 'termin');

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
(374, 'Netto\r\n- Eier\r\n- Bier\r\n- Wein'),
(375, 'Holz\r\nKleber'),
(376, '14.03.2021\r\n- Schweinebraten'),
(380, '- Listen\r\n- mehrere Notizenfelder pro Notiz\r\n- Erinnerungen\r\n- Passwortschutz\r\n- Bilder einfügen\r\n- Daten anhängen\r\n- Export als Textdatei');

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
  ADD UNIQUE KEY `ID_tags` (`ID_tags`,`ID_notizen`),
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
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `name` (`name`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=924;

--
-- AUTO_INCREMENT für Tabelle `text`
--
ALTER TABLE `text`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;

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
