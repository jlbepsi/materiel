-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  ven. 18 jan. 2019 à 13:34
-- Version du serveur :  5.7.24-0ubuntu0.18.04.1
-- Version de PHP :  7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestionmateriel`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `libelle` varchar(250) NOT NULL,
  `quantitymax` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `libelle`, `quantitymax`) VALUES
(1, 'Boitier', 1),
(2, 'Carte mère', 1),
(3, 'Processeur', 1),
(4, 'RAM', 4),
(5, 'Disque Dur', 4),
(6, 'Carte réseau', 2),
(7, 'Carte graphique', 1);

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

CREATE TABLE `command` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `command`
--

INSERT INTO `command` (`id`, `login`, `date`) VALUES
(1, 'test.v2', '2018-06-08 14:35:10'),
(2, 'test.v2', '2018-04-20 20:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `commanddetail`
--

CREATE TABLE `commanddetail` (
  `command_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commanddetail`
--

INSERT INTO `commanddetail` (`command_id`, `component_id`, `quantity`) VALUES
(1, 1, 13),
(1, 2, 13),
(2, 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `component`
--

CREATE TABLE `component` (
  `id` int(11) NOT NULL,
  `libelle` varchar(250) NOT NULL,
  `quantitystock` int(11) NOT NULL,
  `quantityused` int(11) DEFAULT '0',
  `subcategory_id` int(11) DEFAULT NULL,
  `shortlibelle` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `component`
--

INSERT INTO `component` (`id`, `libelle`, `quantitystock`, `quantityused`, `subcategory_id`, `shortlibelle`, `description`) VALUES
(1, 'DD 1 To ', 11, 1, 1, '1 To', 'Seagate BarraCuda 1 To SATA 6Go/bps'),
(2, 'Intel Core I5', 12, 1, 10, 'Intel Core I5', 'Intel Core I5-8400 (2.8 GHz)'),
(3, 'RAM DDR4 8 Go', 49, 3, 6, 'RAM 32 Go', 'Crucial DDR4 Barette de 8 Go'),
(4, 'SSD 500 Go', 11, 1, 2, 'SSD 850', 'Samsung SSD 850 EVO 500 Go SATA6Go/bps'),
(5, 'Intel Gigabit', 27, 0, 7, 'Intel Desktop', 'Intel Gigabit CT Deskopt Single Port 1 Go PCIe'),
(6, 'ASRock PRO4', 12, 1, 9, 'CM ASRock', 'ASRock Z370 PRO4 chipset 1511'),
(7, 'Advance Origin', 13, 0, 3, 'Boitier Advance', 'Advance Origin 480 ATX'),
(8, 'DD 2 To ', 3, 4, 1, '2 To', 'Seagate BarraCuda 2 To SATA 6 Go/bps'),
(9, 'Boitier test', 3, 2, 3, 'Boitier test', 'Boitier test'),
(10, 'MSI GeForce 710', 1, 1, 12, 'MSI GeForce 710', 'MSI GeForce 710');

-- --------------------------------------------------------

--
-- Structure de la table `computer`
--

CREATE TABLE `computer` (
  `id` int(11) NOT NULL,
  `libelle` varchar(250) NOT NULL,
  `place` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createur` varchar(50) NOT NULL,
  `remarque` varchar(250) DEFAULT NULL,
  `boitier` int(11),
  `cartemere` int(11) DEFAULT NULL,
  `cpu` int(11),
  `ram1` int(11),
  `ram2` int(11),
  `ram3` int(11),
  `ram4` int(11),
  `hdd1` int(11),
  `hdd2` int(11),
  `hdd3` int(11),
  `hdd4` int(11) DEFAULT NULL,
  `network_card1` int(11),
  `network_card2` int(11),
  `network_card3` int(11),
  `graphic_card` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `computer`
--

INSERT INTO `computer` (`id`, `libelle`, `place`, `description`, `creation_date`, `update_date`, `createur`, `remarque`, `boitier`, `cartemere`, `cpu`, `ram1`, `ram2`, `ram3`, `ram4`, `hdd1`, `hdd2`, `hdd3`, `hdd4`, `network_card1`, `network_card2`, `network_card3`, `graphic_card`) VALUES
(1, 'Station EPSI', 'Salle serveur', NULL, '2018-07-03 15:51:26', '2018-07-03 15:51:26', 'test.prof', NULL, 7, 6, 2, 3, 3, 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Station EPSI', 'Salle annexe', NULL, '2018-07-03 15:51:26', '2018-07-03 15:51:26', 'test.prof', NULL, 9, 6, 2, 3, 3, 3, 3, 1, NULL, NULL, NULL, 5, NULL, NULL, 10);

--
-- Déclencheurs `computer`
--
DELIMITER $$
CREATE TRIGGER `deleteComponent` AFTER DELETE ON `computer` FOR EACH ROW BEGIN
    IF OLD.boitier IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.boitier;
    END IF;

    IF OLD.cartemere IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.cartemere;
    END IF;

    IF OLD.cpu IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.cpu;
    END IF;

    IF OLD.ram1 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.ram1;
    END IF;

    IF OLD.ram2 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.ram2;
    END IF;

    IF OLD.ram3 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.ram3;
    END IF;

    IF OLD.ram4 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.ram4;
    END IF;

    IF OLD.hdd1 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.hdd1;
    END IF;

    IF OLD.hdd2 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.hdd2;
    END IF;
    IF OLD.hdd3 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.hdd3;
    END IF;
    IF OLD.hdd4 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.hdd4;
    END IF;
    IF OLD.hdd5 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.hdd5;
    END IF;
    IF OLD.hdd6 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.hdd6;
    END IF;

    IF OLD.network_card1 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.network_card1;
    END IF;
    IF OLD.network_card2 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.network_card2;
    END IF;
    IF OLD.network_card3 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.network_card3;
    END IF;

    IF OLD.graphic_card IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock +1,
            component.quantityused = component.quantityused -1
        WHERE component.id = OLD.graphic_card;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertComponent` AFTER INSERT ON `computer` FOR EACH ROW BEGIN
    IF NEW.boitier IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.boitier;
    END IF;

    IF NEW.cartemere IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.cartemere;
    END IF;

    IF NEW.cpu IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.cpu;
    END IF;

    IF NEW.ram1 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.ram1;
    END IF;

    IF NEW.ram2 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.ram2;
    END IF;

    IF NEW.ram3 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.ram3;
    END IF;

    IF NEW.ram4 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.ram4;
    END IF;

    IF hdd1 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = hdd1;
    END IF;

    IF NEW.hdd2 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.hdd2;
    END IF;
    IF NEW.hdd3 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.hdd3;
    END IF;
    IF NEW.hdd4 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.hdd4;
    END IF;
    IF NEW.hdd5 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.hdd5;
    END IF;
    IF NEW.hdd6 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.hdd6;
    END IF;

    IF NEW.network_card1 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.network_card1;
    END IF;
    IF NEW.network_card2 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.network_card2;
    END IF;
    IF NEW.network_card3 IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.network_card3;
    END IF;

    IF NEW.graphic_card IS NOT null THEN
      UPDATE component
        SET component.quantitystock = component.quantitystock -1,
            component.quantityused = component.quantityused +1
        WHERE component.id = NEW.graphic_card;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateComponent` BEFORE UPDATE ON `computer` FOR EACH ROW BEGIN
    -- Boitier
    IF NOT (OLD.Boitier <=>  NEW.Boitier) THEN
      IF OLD.Boitier is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.Boitier;
      END IF;
      IF NEW.Boitier is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.Boitier;
      END IF;
    END IF;
  
    -- cartemere
    IF NOT (OLD.cartemere <=>  NEW.cartemere) THEN
      IF OLD.cartemere is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.cartemere;
      END IF;
      IF NEW.cartemere is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.cartemere;
      END IF;
    END IF;
  
      -- cpu
    IF NOT (OLD.cpu <=>  NEW.cpu) THEN
      IF OLD.cpu is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.cpu;
      END IF;
      IF NEW.cpu is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.cpu;
      END IF;
    END IF;
  
      -- ram1
    IF NOT (OLD.ram1 <=>  NEW.ram1) THEN
      IF OLD.ram1 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.ram1;
      END IF;
      IF NEW.ram1 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.ram1;
      END IF;
    END IF;
  
      -- ram2
    IF NOT (OLD.ram2 <=>  NEW.ram2) THEN
      IF OLD.ram2 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.ram2;
      END IF;
      IF NEW.ram2 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.ram2;
      END IF;
    END IF;
  
      -- ram3
    IF NOT (OLD.ram3 <=>  NEW.ram3) THEN
      IF OLD.ram3 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.ram3;
      END IF;
      IF NEW.ram3 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.ram3;
      END IF;
    END IF;
  
      -- ram4
    IF NOT (OLD.ram4 <=>  NEW.ram4) THEN
      IF OLD.ram4 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.ram4;
      END IF;
      IF NEW.ram4 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.ram4;
      END IF;
    END IF;
  
      -- hdd1
    IF NOT (OLD.hdd1 <=>  NEW.hdd1) THEN
      IF OLD.hdd1 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.hdd1;
      END IF;
      IF NEW.hdd1 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.hdd1;
      END IF;
    END IF;
  
      -- hdd2
    IF NOT (OLD.hdd2 <=>  NEW.hdd2) THEN
      IF OLD.hdd2 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.hdd2;
      END IF;
      IF NEW.hdd2 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.hdd2;
      END IF;
    END IF;
  
      -- hdd3
    IF NOT (OLD.hdd3 <=>  NEW.hdd3) THEN
      IF OLD.hdd3 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.hdd3;
      END IF;
      IF NEW.hdd3 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.hdd3;
      END IF;
    END IF;
  
      -- hdd4
    IF NOT (OLD.hdd4 <=>  NEW.hdd4) THEN
      IF OLD.hdd4 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.hdd4;
      END IF;
      IF NEW.hdd4 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.hdd4;
      END IF;
    END IF;
  
      -- network_card1
    IF NOT (OLD.network_card1 <=>  NEW.network_card1) THEN
      IF OLD.network_card1 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.network_card1;
      END IF;
      IF NEW.network_card1 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.network_card1;
      END IF;
    END IF;
  
      -- network_card2
    IF NOT (OLD.network_card2 <=>  NEW.network_card2) THEN
      IF OLD.network_card2 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.network_card2;
      END IF;
      IF NEW.network_card2 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.network_card2;
      END IF;
    END IF;
  
      -- network_card3
    IF NOT (OLD.network_card3 <=>  NEW.network_card3) THEN
      IF OLD.network_card3 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.network_card3;
      END IF;
      IF NEW.network_card3 is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.network_card3;
      END IF;
    END IF;
  
      -- graphic_card
    IF NOT (OLD.graphic_card <=>  NEW.graphic_card) THEN
      IF OLD.graphic_card is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock +1,
              component.quantityused = component.quantityused -1
          WHERE component.id = OLD.graphic_card;
      END IF;
      IF NEW.graphic_card is not null THEN
        UPDATE component
          SET component.quantitystock = component.quantitystock -1,
              component.quantityused = component.quantityused +1
          WHERE component.id = NEW.graphic_card;
      END IF;
    END IF;


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `portable`
--

CREATE TABLE `portable` (
  `mi` int(11) NOT NULL,
  `portabletype_id` int(11) NOT NULL,
  `emplacement` varchar(50) CHARACTER SET latin1 NOT NULL,
  `numserie` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `portable`
--

INSERT INTO `portable` (`mi`, `portabletype_id`, `emplacement`, `numserie`) VALUES
(404, 1, 'AP', '123456'),
(405, 2, 'AP', '123457'),
(406, 2, 'CV', '123458');

-- --------------------------------------------------------

--
-- Structure de la table `portableemprunt`
--

CREATE TABLE `portableemprunt` (
  `portable_mi` int(11) NOT NULL,
  `user_login` varchar(50) NOT NULL,
  `datedebut` date NOT NULL,
  `datefin` date NOT NULL,
  `etat` int(11) NOT NULL,
  `validerpar` varchar(50) DEFAULT NULL,
  `retourpar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `portableemprunt`
--

INSERT INTO `portableemprunt` (`portable_mi`, `user_login`, `datedebut`, `datefin`, `etat`, `validerpar`, `retourpar`) VALUES
(404, 'test.v3', '2019-01-21', '2019-01-21', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `portabletype`
--

CREATE TABLE `portabletype` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `couleur` varchar(15) DEFAULT NULL,
  `ecran` int(11) NOT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `memoire` int(11) NOT NULL,
  `disque` varchar(100) DEFAULT NULL,
  `quantite` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `portabletype`
--

INSERT INTO `portabletype` (`id`, `libelle`, `description`, `marque`, `couleur`, `ecran`, `cpu`, `memoire`, `disque`, `quantite`) VALUES
(1, 'ASUS K750L', '', 'ASUS', 'Gris', 17, 'Intel Core i7', 8, 'SSD 512 Go', 1),
(2, 'ASUS P2520LA', '', 'ASUS', '', 15, 'Intel Core i3', 4, 'HDD 1 To', 0),
(3, 'MSI CX62', '', 'MSI', 'Blanc', 15, 'Intel Core i3', 4, '1 To', 15);

-- --------------------------------------------------------

--
-- Structure de la table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `libelle` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `subcategory`
--

INSERT INTO `subcategory` (`id`, `libelle`, `category_id`) VALUES
(1, 'Mécanique', 5),
(2, 'SSD', 5),
(3, 'ATX', 1),
(4, 'DDR2', 4),
(5, 'DDR3', 4),
(6, 'DDR4', 4),
(7, '1 Gbits', 6),
(9, 'Intel ATX', 2),
(10, 'Intel', 3),
(11, 'AMD', 3),
(12, 'NVidia', 7);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `login` varchar(50) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `classe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`login`, `prenom`, `nom`, `classe`) VALUES
('test.prof', 'Test', 'PROF', 'PROF'),
('test.v3', 'V3', 'Test', 'B3'),
('test.v5', 'V5', 'Test', 'I5');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commanddetail`
--
ALTER TABLE `commanddetail`
  ADD PRIMARY KEY (`command_id`,`component_id`),
  ADD KEY `item_id` (`component_id`);

--
-- Index pour la table `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idsubcategory` (`subcategory_id`);

--
-- Index pour la table `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createur` (`createur`);

--
-- Index pour la table `portable`
--
ALTER TABLE `portable`
  ADD PRIMARY KEY (`mi`),
  ADD KEY `portable_id` (`portabletype_id`);

--
-- Index pour la table `portableemprunt`
--
ALTER TABLE `portableemprunt`
  ADD PRIMARY KEY (`portable_mi`,`user_login`,`datedebut`),
  ADD KEY `user_login` (`user_login`),
  ADD KEY `portable_mi` (`portable_mi`);

--
-- Index pour la table `portabletype`
--
ALTER TABLE `portabletype`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcategory` (`category_id`),
  ADD KEY `subcategory_category_id_index` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `command`
--
ALTER TABLE `command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `component`
--
ALTER TABLE `component`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `computer`
--
ALTER TABLE `computer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `portabletype`
--
ALTER TABLE `portabletype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commanddetail`
--
ALTER TABLE `commanddetail`
  ADD CONSTRAINT `commanddetail_ibfk_1` FOREIGN KEY (`command_id`) REFERENCES `command` (`id`),
  ADD CONSTRAINT `commanddetail_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`);

--
-- Contraintes pour la table `component`
--
ALTER TABLE `component`
  ADD CONSTRAINT `component_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`);

--
-- Contraintes pour la table `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`createur`) REFERENCES `user` (`login`);

--
-- Contraintes pour la table `portable`
--
ALTER TABLE `portable`
  ADD CONSTRAINT `portable_ibfk_1` FOREIGN KEY (`portabletype_id`) REFERENCES `portabletype` (`id`);

--
-- Contraintes pour la table `portableemprunt`
--
ALTER TABLE `portableemprunt`
  ADD CONSTRAINT `portableemprunt_ibfk_2` FOREIGN KEY (`user_login`) REFERENCES `user` (`login`),
  ADD CONSTRAINT `portableemprunt_ibfk_3` FOREIGN KEY (`portable_mi`) REFERENCES `portable` (`mi`);

--
-- Contraintes pour la table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
