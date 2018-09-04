-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 05 Juillet 2018 à 10:20
-- Version du serveur :  5.7.22-0ubuntu0.16.04.1
-- Version de PHP :  7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `boitier` int(11) DEFAULT NULL,
  `cpu` int(11) DEFAULT NULL,
  `ram1` int(11) DEFAULT NULL,
  `ram2` int(11) DEFAULT NULL,
  `ram3` int(11) DEFAULT NULL,
  `ram4` int(11) DEFAULT NULL,
  `hdd1` int(11) DEFAULT NULL,
  `hdd2` int(11) DEFAULT NULL,
  `hdd3` int(11) DEFAULT NULL,
  `hdd4` int(11) DEFAULT NULL,
  `hdd5` int(11) DEFAULT NULL,
  `hdd6` int(11) DEFAULT NULL,
  `network_card1` int(11) DEFAULT NULL,
  `network_card2` int(11) DEFAULT NULL,
  `network_card3` int(11) DEFAULT NULL,
  `graphic_card` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `computer`
--

INSERT INTO `computer` (`id`, `libelle`, `place`, `description`, `creation_date`, `update_date`, `createur`, `remarque`, `boitier`, `cpu`, `ram1`, `ram2`, `ram3`, `ram4`, `hdd1`, `hdd2`, `hdd3`, `hdd4`, `hdd5`, `hdd6`, `network_card1`, `network_card2`, `network_card3`, `graphic_card`) VALUES
(1, 'Station EPSI', 'Salle serveur', NULL, '2018-07-03 15:51:26', '2018-07-03 15:51:26', 'test.prof', NULL, 7, 2, 3, 3, 3, 3, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Station EPSI', 'Salle annexe', NULL, '2018-07-03 15:51:26', '2018-07-03 15:51:26', 'test.prof', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `portable`
--

CREATE TABLE `portable` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `libellecourt` varchar(30) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  identifiant varchar(30) DEFAULT NULL,
  `marque` varchar(100) NOT NULL,
  `screen` int(11) NOT NULL,
  `cpu` varchar(50) NOT NULL,
  `memory` int(11) NOT NULL,
  `hdd1` int(11) NOT NULL,
  `hdd2` int(11) DEFAULT '0',
  `cdrom` int(11) DEFAULT '1',
  `user_login` varchar(50) DEFAULT NULL,
  date_emprunt datetime DEFAULT NULL,
  date_retour datetime DEFAULT NULL,
  valider_par varchar(50) DEFAULT NULL,
  retour_par varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `portable`
--

INSERT INTO `portable` (`id`, `libelle`, `libellecourt`, `description`, `marque`, `screen`, `cpu`, `memory`, `hdd1`, `hdd2`, `cdrom`, `user_login`) VALUES
(1, 'ASUS K750L', 'ASUS K750L', 'ASUS K750L 17 pouces', 'ASUS', 17, 'Intel Core i7', 8, 1536, 0, 1, NULL),
(2, 'ASUS P2520LA-XO0456T', 'ASUS P2520LA-XO0456T', 'ASUS P2520LA-XO0456T', 'ASUS', 15, 'Intel Core i3', 4, 1024, 0, 1, NULL),
(3, 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI', 15, 'Intel Core i3', 4, 500, 0, 1, NULL),
(4, 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI', 15, 'Intel Core i3', 4, 500, 0, 1, NULL),
(5, 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI', 15, 'Intel Core i3', 4, 500, 0, 1, NULL),
(6, 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI', 15, 'Intel Core i3', 4, 500, 0, 1, NULL),
(7, 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI', 15, 'Intel Core i3', 4, 500, 0, 1, NULL),
(8, 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI', 15, 'Intel Core i3', 4, 500, 0, 1, NULL),
(9, 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI', 15, 'Intel Core i3', 4, 500, 0, 1, NULL),
(10, 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI CX62 7QL-024FR', 'MSI', 15, 'Intel Core i3', 4, 500, 0, 1, NULL);

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
-- Contenu de la table `subcategory`
--

INSERT INTO `subcategory` (`id`, `libelle`, `category_id`) VALUES
(1, 'Mécanique', 5),
(2, 'SSD', 5),
(3, 'ATX', 1),
(4, 'DDR2', 4),
(5, 'DDR3', 4),
(6, 'DDR4', 4),
(7, 'Intel 1 Gbits', 6),
(8, 'DLink 1 Gbits', 6),
(9, 'ASROCK Intel ATX', 2),
(10, 'Intel', 3),
(11, 'AMD', 3);

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
-- Contenu de la table `user`
--

INSERT INTO `user` (`login`, `prenom`, `nom`, `classe`) VALUES
('test.prof', 'Test', 'PROF', 'PROF');

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
  ADD KEY `createur` (`createur`);

--
-- Index pour la table `portable`
--
ALTER TABLE `portable`
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
-- AUTO_INCREMENT pour la table `portable`
--
ALTER TABLE `portable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
  ADD CONSTRAINT `component_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`);

--
-- Contraintes pour la table `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`createur`) REFERENCES `user` (`login`);

--
-- Contraintes pour la table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
