-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Jan 2021 um 10:57
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
(1, 'Testtitel', 0, NULL, NULL, 0, '2021-01-21 10:41:40'),
(2, 'Testtitel2123', 0, NULL, NULL, 0, '2021-01-17 10:41:40');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notizen-tags`
--

CREATE TABLE `notizen-tags` (
  `ID-tags` int(11) NOT NULL,
  `ID-notizen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `notizen-tags`
--

INSERT INTO `notizen-tags` (`ID-tags`, `ID-notizen`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notizen-text`
--

CREATE TABLE `notizen-text` (
  `ID-notizen` int(11) NOT NULL,
  `ID-text` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `notizen-text`
--

INSERT INTO `notizen-text` (`ID-notizen`, `ID-text`) VALUES
(1, 1),
(2, 2),
(2, 3);

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
(1, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam'),
(2, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyamdfgdfgdfg'),
(3, 'test');

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
-- Indizes für die Tabelle `notizen-tags`
--
ALTER TABLE `notizen-tags`
  ADD PRIMARY KEY (`ID-tags`,`ID-notizen`),
  ADD KEY `ID-tags` (`ID-tags`),
  ADD KEY `ID-notizen` (`ID-notizen`);

--
-- Indizes für die Tabelle `notizen-text`
--
ALTER TABLE `notizen-text`
  ADD PRIMARY KEY (`ID-notizen`,`ID-text`),
  ADD KEY `ID-notizen` (`ID-notizen`,`ID-text`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `text`
--
ALTER TABLE `text`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
