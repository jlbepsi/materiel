-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 05 Juillet 2018 à 10:17
-- Version du serveur :  5.7.22-0ubuntu0.16.04.1
-- Version de PHP :  7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestionmateriel_v1`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addOrUpdateComputerItem` (`computerId` INT, `itemId` INT, `qty` INT)  BEGIN
    DECLARE qtyStock INT;

    IF (EXISTS( SELECT * FROM computeritem
                WHERE computer_id = computerId
                  AND item_id = itemId)) THEN
    BEGIN
      UPDATE computeritem SET quantity = quantity + qty
      WHERE computer_id = computerId  AND item_id = itemId;
    END;
    ELSE
    BEGIN
      INSERT INTO computeritem VALUES (computer_id, item_id, quantity);
    END;
    END IF;

  END$$

DELIMITER ;

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
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `libelle`, `quantitymax`) VALUES
(1, 'Boitier', 1),
(2, 'Carte mère', 1),
(3, 'Processeur', 1),
(4, 'RAM', 4),
(5, 'Disque Dur', 4),
(6, 'Carte réseau', 2),
(7, 'Station', -1),
(8, 'Portable', -1);

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
-- Contenu de la table `command`
--

INSERT INTO `command` (`id`, `login`, `date`) VALUES
(1, 'test.v2', '2018-06-08 16:35:10'),
(2, 'test.v2', '2018-04-20 22:00:00');

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
-- Contenu de la table `commanddetail`
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
-- Contenu de la table `component`
--

INSERT INTO `component` (`id`, `libelle`, `quantitystock`, `quantityused`, `subcategory_id`, `shortlibelle`, `description`) VALUES
(1, 'DD 1 To ', 9, 3, 1, '1 To', 'Seagate BarraCuda 1 To SATA 6Go/bps'),
(2, 'Intel Core I5', 13, 0, 10, 'Intel Core I5', 'Intel Core I5-8400 (2.8 GHz)'),
(3, 'RAM DDR4 8 Go', 52, 0, 6, 'RAM 32 Go', 'Crucial DDR4 Barette de 8 Go'),
(4, 'SSD 500 Go', 12, 0, 2, 'SSD 850', 'Samsung SSD 850 EVO 500 Go SATA6Go/bps'),
(5, 'Intel Gigabit', 27, 0, 7, 'Intel Desktop', 'Intel Gigabit CT Deskopt Single Port 1 Go PCIe'),
(6, 'ASRock PRO4', 13, 0, 9, 'CM ASRock', 'ASRock Z370 PRO4 chipset 1511'),
(7, 'Advance Origin', 13, 0, 3, 'Boitier Advance', 'Advance Origin 480 ATX'),
(8, 'DD 2 To ', 4, 1, 1, '2 To', 'Seagate BarraCuda 2 To SATA 6 Go/bps');

--
-- Déclencheurs `component`
--
DELIMITER $$
CREATE TRIGGER `item_onchange` BEFORE INSERT ON `component` FOR EACH ROW BEGIN

  -- Vérification de la quantité en stock
  IF NEW.quantitystock < 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La quantité en stock doit être suprérieure à 0';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `computer`
--

CREATE TABLE `computer` (
  `id` int(11) NOT NULL,
  `libelle` varchar(250) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `composite` tinyint(4) NOT NULL DEFAULT '0',
  `place` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `computer`
--

INSERT INTO `computer` (`id`, `libelle`, `subcategory_id`, `composite`, `place`, `description`) VALUES
(1, 'Station EPSI', 12, 1, 'Salle serveur', NULL),
(2, 'Portables Asus Pro', 13, 0, 'Apothicaires', 'Intel Core i3, 4Go, 1To'),
(3, 'Station EPSI', 12, 1, 'Salle annexe', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `computercomponent`
--

CREATE TABLE `computercomponent` (
  `computer_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `computercomponent`
--

INSERT INTO `computercomponent` (`computer_id`, `component_id`, `quantity`) VALUES
(1, 1, 4),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 6, 1),
(1, 7, 1),
(3, 1, 3);

--
-- Index pour les tables exportées
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
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Index pour la table `computercomponent`
--
ALTER TABLE `computercomponent`
  ADD PRIMARY KEY (`computer_id`,`component_id`),
  ADD KEY `item_id` (`component_id`);

--
-- AUTO_INCREMENT pour les tables exportées
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `computer`
--
ALTER TABLE `computer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
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
  ADD CONSTRAINT `component_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `gestionmateriel`.`subcategory` (`id`);

--
-- Contraintes pour la table `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `gestionmateriel`.`subcategory` (`id`);

--
-- Contraintes pour la table `computercomponent`
--
ALTER TABLE `computercomponent`
  ADD CONSTRAINT `computercomponent_ibfk_1` FOREIGN KEY (`computer_id`) REFERENCES `computer` (`id`),
  ADD CONSTRAINT `computercomponent_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
