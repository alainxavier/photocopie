-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 24 fév. 2021 à 18:04
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `photocopie`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe` varchar(255) DEFAULT NULL,
  `niveau` varchar(255) DEFAULT NULL,
  `date_creation` varchar(10) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `classe`, `niveau`, `date_creation`) VALUES
(1, '6eA', 'college', '21/01/2021'),
(2, '6eB', 'college', '21/01/2021'),
(3, '6eC', 'college', '21/01/2021'),
(4, '6eD', 'college', '21/01/2021'),
(6, '5eA', 'college', '21/01/2021'),
(7, '5eB', 'college', '21/01/2021'),
(8, '5eC', 'college', '21/01/2021'),
(9, '5eD', 'college', '21/01/2021'),
(11, '4eA', 'college', '21/01/2021'),
(12, '4eB', 'college', '21/01/2021'),
(13, '4eC', 'college', '21/01/2021'),
(14, '4eD', 'college', '21/01/2021'),
(16, '3eA', 'college', '21/01/2021'),
(17, '3eB', 'college', '21/01/2021'),
(18, '3eC', 'college', '21/01/2021'),
(19, '3eD', 'college', '21/01/2021'),
(21, '2eA', 'lycee', '21/01/2021'),
(22, '2eB', 'lycee', '21/01/2021'),
(23, '2eC', 'lycee', '21/01/2021'),
(24, '2eD', 'lycee', '21/01/2021'),
(26, '1eA', 'lycee', '21/01/2021'),
(27, '1eB', 'lycee', '21/01/2021'),
(28, '1eC', 'lycee', '21/01/2021'),
(29, '1eD', 'lycee', '21/01/2021'),
(30, '1eE', 'lycee', '21/01/2021'),
(32, 'TeA', 'lycee', '21/01/2021'),
(33, 'TeB', 'lycee', '21/01/2021'),
(34, 'TeC', 'lycee', '21/01/2021'),
(35, 'TeD', 'lycee', '21/01/2021');

-- --------------------------------------------------------

--
-- Structure de la table `impression`
--

DROP TABLE IF EXISTS `impression`;
CREATE TABLE IF NOT EXISTS `impression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_personnel` int(11) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `intitule` varchar(255) NOT NULL,
  `pages` int(11) NOT NULL,
  `copie` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `rectoverso` varchar(255) NOT NULL,
  `papier` varchar(255) NOT NULL,
  `date_imp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `impression`
--

INSERT INTO `impression` (`id`, `id_personnel`, `classe`, `intitule`, `pages`, `copie`, `total`, `rectoverso`, `papier`, `date_imp`) VALUES
(1, 4, '5eC', 'Divers', 1, 1, 100, 'Non', 'A4', '2021-01-16 15:32:18'),
(2, 1, '4eC, 3eC', 'Divers', 1, 1, 1, 'Non', 'A4', '2021-02-16 15:36:58'),
(3, 1, '3eA', 'Divers', 1, 1, 1, 'Non', 'A4', '2021-08-16 16:51:54'),
(4, 1, '4eC, 4eD', 'Support de cours', 1, 2, 2, 'Non', 'A4', '2021-02-16 16:52:20'),
(5, 1, '4eA, 4eB', 'Control', 2, 1, 2, 'Non', 'A4', '2021-02-16 16:52:44'),
(6, 4, '3eA', 'Devoir de classe', 1, 1, 1, 'Non', 'A4', '2021-02-16 16:54:57'),
(7, 2, '3eA', 'Divers', 1, 1, 1, 'Non', 'A4', '2021-02-16 17:07:18'),
(8, 1, '5eD', 'Devoir de classe', 8, 20, 160, 'Oui', 'A4', '2021-03-17 13:33:47'),
(9, 13, '4eD, 3eA', 'Devoir de niveau', 10, 30, 300, 'Non', 'A4', '2021-02-17 14:28:21'),
(10, 6, '6eC, 6eD', 'Devoir de classe', 3, 30, 90, 'Non', 'A4', '2021-04-18 09:06:02'),
(11, 2, '4eB', 'Devoir de classe', 2, 60, 120, 'Non', 'A4', '2021-02-19 09:28:26'),
(12, 16, '4eD, 3eA', 'Devoir de classe', 10, 15, 150, 'Non', 'A4', '2021-01-19 09:30:13'),
(13, 16, '4eD, 3eA', 'Divers', 12, 25, 300, 'Non', 'A4', '2021-05-19 09:30:35'),
(14, 55, '5eC, 5eD', 'Support de cours', 5, 120, 600, 'Non', 'A4', '2021-06-19 09:31:03'),
(15, 55, '6eD, 5eB, 4eD, 3eA', 'Devoir de niveau', 10, 9, 90, 'Non', 'A4', '2021-07-19 09:31:30'),
(16, 24, '3eA, 3eC, 3eD', 'Devoir de niveau', 4, 130, 520, 'Oui', 'A4', '2021-02-22 14:56:16'),
(17, 4, 'TeD', 'Devoir de classe', 5, 32, 160, 'Non', 'A4', '2021-02-22 15:15:54'),
(18, 11, '1eD', 'Support de cours', 3, 33, 99, 'Non', 'A4', '2021-02-22 15:16:26'),
(19, 4, '4eD', 'Devoir de classe', 1, 130, 130, 'Non', 'A4', '2021-02-22 15:55:09'),
(20, 2, 'TeD', 'Support de cours', 1, 1, 1, 'Non', 'A4', '2021-02-22 15:59:17'),
(21, 5, '1eA, 1eB', 'Divers', 1, 30, 30, 'Non', 'A4', '2021-02-22 16:07:23'),
(22, 2, 'TeD', 'Divers', 1, 1, 1, 'Non', 'A4', '2021-02-23 12:43:15'),
(23, 1, '4eD', 'Divers', 1, 1, 1, 'Non', 'A4', '2021-02-23 13:57:45'),
(24, 1, '3eA', 'Divers', 1, 1, 1, 'Non', 'A4', '2021-02-23 13:57:52'),
(25, 1, '4eD', 'Divers', 1, 1, 1, 'Non', 'A4', '2021-02-23 13:57:56'),
(26, 1, 'TeA, TeB', 'Divers', 1, 1, 1, 'Non', 'A4', '2021-02-23 13:58:01'),
(27, 1, '4eC, 4eD', 'Divers', 1, 1, 1, 'Non', 'A4', '2021-02-23 13:58:06');

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `discipline` varchar(255) DEFAULT NULL,
  `niveau` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`id`, `nom`, `prenom`, `discipline`, `niveau`, `date_creation`) VALUES
(1, 'ABOKE', 'CAPOH JEAN-MICHEL FREDDY', 'LATIN', 'Collège', '2021-01-21 00:00:00'),
(2, 'ABONGOH', 'JOSEPH GABIN', 'FRANÇAIS', 'Collège', '2021-01-21 00:00:00'),
(3, 'ABOUA', 'MICHEL SERGE', 'SVT', 'Lycée', '2021-01-21 00:00:00'),
(4, 'ABOUGNAN', 'NICAISE', 'EPS', 'Collège', '2021-01-21 00:00:00'),
(5, 'ADIKO', 'ILDEVERT DESIRE', 'PHYS-Ch / Tech', 'Collège', '2021-01-21 00:00:00'),
(6, 'AGNIMOU', 'MALAN NESTOR', 'FRANÇAIS', 'Collège', '2021-01-21 00:00:00'),
(7, 'AHISSOU ', 'TADEGNON MARIETTE VICTOIRE', 'ANGLAIS', 'Lycée', '2021-01-21 00:00:00'),
(8, 'AHOUSSI', 'PREGNON HONORE', 'EPS', 'Collège', '2021-01-21 00:00:00'),
(9, 'AKA', 'EBA FLEUR-JOCELYNE', 'HIST-GEO-EMC', 'Collège', '2021-01-21 00:00:00'),
(10, 'AKA', 'PANCRACE', 'PHILO', 'Lycée', '2021-01-21 00:00:00'),
(11, 'ALLEGBE', 'THEODORA', 'PHILO', 'Lycée', '2021-01-21 00:00:00'),
(12, 'ANOH', 'PAUL EMILE', 'ARTS PLAST', 'Collège', '2021-01-21 00:00:00'),
(13, 'ASSA', 'AKPI ARNAUD STEPHANE', 'ANGLAIS', 'Collège', '2021-01-21 00:00:00'),
(14, 'ASSA', 'AKPI ARNAUD STEPHANE', 'ANGLAIS', 'Lycée', '2021-01-21 00:00:00'),
(15, 'ASSEMIAN', 'KASSI', 'HIST-GEO-EMC', 'Collège', '2021-01-21 00:00:00'),
(16, 'AVI', 'AKOUA CHARLOTTE', 'EPS', 'Collège', '2021-01-21 00:00:00'),
(17, 'BILE', 'RITA ANNA PERPETUE', 'HIST-GEO-EMC', 'Collège', '2021-01-21 00:00:00'),
(18, 'BILE', 'RITA ANNA PERPETUE', 'HIST-GEO-EMC', 'Lycée', '2021-01-21 00:00:00'),
(19, 'BOGUI', 'REINE', 'ESPAGNOL', 'Lycée', '2021-01-21 00:00:00'),
(20, 'BROU', 'JEANNETTE', 'MATHS', 'Collège', '2021-01-21 00:00:00'),
(21, 'BROU', 'MARIE MICHELLE TATIANA', 'ANGLAIS', 'Lycée', '2021-01-21 00:00:00'),
(22, 'COULIBALY', 'AHOUA', 'ANGLAIS', 'Collège', '2021-01-21 00:00:00'),
(23, 'COULIBALY', 'PATRICK', 'EPS', 'Lycée', '2021-01-21 00:00:00'),
(24, 'DADIE', 'MATHILDE', 'FRANÇAIS', 'Collège', '2021-01-21 00:00:00'),
(25, 'DEI', 'LOUA SYLVAIN', 'ANGLAIS', 'Collège', '2021-01-21 00:00:00'),
(26, 'DIABY', 'KASSAMBA ABDEL AZIZ', 'PHYSIQUE-CHIMIE', 'Lycée', '2021-01-21 00:00:00'),
(27, 'DIARRASSOUBA', 'TIEMOKOBA', 'MATHS', 'Collège', '2021-01-21 00:00:00'),
(28, 'DJEZO', 'Née N\'GUESSAN GNALI ANICETTE', 'FRANÇAIS', 'Collège', '2021-01-21 00:00:00'),
(29, 'DON', 'ASSALE PATRICE', 'MATHEMATIQUES', 'Lycée', '2021-01-21 00:00:00'),
(30, 'EDI', 'Yves Roméo', 'FRANÇAIS', 'Collège', '2021-01-21 00:00:00'),
(31, 'ELOGNE', 'CONSTANT', 'MATHEMATIQUES', 'Lycée', '2021-01-21 00:00:00'),
(32, 'ETTIEN', 'KUMASSI AIME', 'ANGLAIS', 'Collège', '2021-01-21 00:00:00'),
(33, 'ETTIEN', 'TOKOU PIERRE', 'SES', 'Lycée', '2021-01-21 00:00:00'),
(34, 'GNANZOU', 'HOLAN J. B. ', 'MATHS', 'Collège', '2021-01-21 00:00:00'),
(35, 'GOUENE', 'SADIA SEBASTIEN', 'FRANÇAIS', 'Lycée', '2021-01-21 00:00:00'),
(36, 'GUIRO', 'GBEHE ALBERT', 'ALLEMAND', 'Collège', '2021-01-21 00:00:00'),
(37, 'HALLAGE', 'JEAN-JACQUES', 'EPS', 'Collège', '2021-01-21 00:00:00'),
(38, 'KADJO', 'BROU PAUL', 'MATHEMATIQUES', 'Lycée', '2021-01-21 00:00:00'),
(39, 'KAKOU', 'AMANI YVETTE', 'ESPAGNOL', 'Lycée', '2021-01-21 00:00:00'),
(40, 'KATTE', 'ADOU HONORAT', 'HIST-GEO-EMC', 'Collège', '2021-01-21 00:00:00'),
(41, 'KOFFI', 'APHOUET AURELIE', 'PHYS-Ch / Tech', 'Collège', '2021-01-21 00:00:00'),
(42, 'KOFFI', 'YOBOUE ERIC', 'EPS', 'Collège', '2021-01-21 00:00:00'),
(43, 'KOFFI', 'YOBOUE ERIC', 'EPS', 'Lycée', '2021-01-21 00:00:00'),
(44, 'KONATE', 'ISSA', 'PHYSIQUE-CHIMIE', 'Lycée', '2021-01-21 00:00:00'),
(45, 'KONE', 'Née OUATTARA SIMONE', 'FRANÇAIS', 'Lycée', '2021-01-21 00:00:00'),
(46, 'KOUADIO-PAYNE épse BLESSOU', 'YELI', 'SVT', 'Collège', '2021-01-21 00:00:00'),
(47, 'KOUAKOU', 'N\'GUESSAN DENIS', 'HIST-GEO-EMC', 'Lycée', '2021-01-21 00:00:00'),
(48, 'KOUAME', 'KOFFI JEAN BRUCE', 'ESPAGNOL', 'Lycée', '2021-01-21 00:00:00'),
(49, 'KOUAME', 'KOUAKOU AUGUSTIN', 'SVT', 'Lycée', '2021-01-21 00:00:00'),
(50, 'KOYE', 'FRANCIS MORAND', 'ARTS PLAST', 'Collège', '2021-01-21 00:00:00'),
(51, 'LAHOURE', 'ALLOU ALAIN', 'MATHEMATIQUES', 'Lycée', '2021-01-21 00:00:00'),
(52, 'LOKA', 'KONAN PASCAL', 'FRANÇAIS', 'Lycée', '2021-01-21 00:00:00'),
(53, 'MONSOH', 'JEAN THIERRY CONDOU STANISLAS', 'MATHEMATIQUES', 'Lycée', '2021-01-21 00:00:00'),
(54, 'N\'DRI', 'OLIVIER KOUAMEKAN', 'SES', 'Lycée', '2021-01-21 00:00:00'),
(55, 'N\'GORAN', 'ADJOUA FLORE', 'EPS', 'Collège', '2021-01-21 00:00:00'),
(56, 'N\'GORAN', 'ADJOUA FLORE', 'EPS', 'Lycée', '2021-01-21 00:00:00'),
(57, 'N\'GUESSAN', 'AKISSI MARCELLINE', 'SVT', 'Lycée', '2021-01-21 00:00:00'),
(58, 'N\'GUESSAN', 'ALANGBA MARDOCHEE', 'EDUC MUS', 'Collège', '2021-01-21 00:00:00'),
(59, 'N\'GUESSAN', 'ANNETTE PATRICIA', 'FRANÇAIS', 'Collège', '2021-01-21 00:00:00'),
(60, 'N\'ZI', 'YAO KOUASSI DESIRE', 'MATHS', 'Collège', '2021-01-21 00:00:00'),
(61, 'OUATTARA', 'DIAKARIDJA', 'HIST-GEO-EMC', 'Lycée', '2021-01-21 00:00:00'),
(62, 'OUEDRAOGO', 'MAMADOU', 'SVT', 'Collège', '2021-01-21 00:00:00'),
(63, 'QUENUM', 'COOVI FRANCIS', 'SES', 'Lycée', '2021-01-21 00:00:00'),
(64, 'SEGUI', 'AMESSAN CHARLES', 'ESPAGNOL', 'Lycée', '2021-01-21 00:00:00'),
(65, 'SERY', 'MARIE-BLANCHE', 'ANGLAIS', 'Collège', '2021-01-21 00:00:00'),
(66, 'SORO', 'FANTA', 'HIST-GEO-EMC', 'Lycée', '2021-01-21 00:00:00'),
(67, 'SOUMAH', 'MAHENI MYRIAM', 'ESPAGNOL', 'Collège', '2021-01-21 00:00:00'),
(68, 'TANOH', 'N\'DA ADELINE INES', 'ESPAGNOL', 'Collège', '2021-01-21 00:00:00'),
(69, 'TCHIMOU', 'TOUSSAINT', 'MATHS', 'Collège', '2021-01-21 00:00:00'),
(70, 'TIMOTOU', 'ADEYOLE', 'PHYS-Ch / Tech', 'Collège', '2021-01-21 00:00:00'),
(71, 'TIMOTOU', 'ADEYOLE', 'PHYSIQUE-CHIMIE', 'Lycée', '2021-01-21 00:00:00'),
(72, 'TOURE', 'NARCISSE', 'ANGLAIS', 'Lycée', '2021-01-21 00:00:00'),
(73, 'WADJA', 'JEAN-BERENGER', 'HIST-GEO-EMC', 'Lycée', '2021-01-21 00:00:00'),
(74, 'WADJAS', 'NIAMKE YOLANDE', 'FRANÇAIS', 'Collège', '2021-01-21 00:00:00'),
(75, 'YAO', 'AFFOUET PARFAITE', 'HIST-GEO-EMC', 'Collège', '2021-01-21 00:00:00'),
(76, 'YAO', 'AFFOUET PARFAITE', 'HIST-GEO-EMC', 'Lycée', '2021-01-21 00:00:00'),
(77, 'YAPI', 'ACAFOU THIERRY', 'PHYSIQUE-CHIMIE', 'Lycée', '2021-01-21 00:00:00'),
(78, 'YEBOUET', 'GISELE', 'ALLEMAND', 'Lycée', '2021-01-21 00:00:00'),
(79, 'YEO', 'SOULEYMANE', 'ANGLAIS', 'Lycée', '2021-01-21 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
