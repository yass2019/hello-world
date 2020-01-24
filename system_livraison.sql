-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 24 Janvier 2020 à 16:44
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `system_livraison`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `n_client` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `Tel` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `mot_de_passe` varchar(10) NOT NULL,
  `notes` varchar(40) NOT NULL,
  `etat_du_client` varchar(10) NOT NULL,
  `NB_visite` int(10) NOT NULL,
  `Date_inscription` varchar(20) NOT NULL,
  PRIMARY KEY (`n_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`n_client`, `nom`, `prenom`, `Tel`, `email`, `Adresse`, `mot_de_passe`, `notes`, `etat_du_client`, `NB_visite`, `Date_inscription`) VALUES
(1, 'FF', 'FF', 233, 'DDD', 'ddd', '1234', 'dddd', 'pasencore', 0, '2020-01-12 20:37:10'),
(2, 'ddd', 'dd', 333, 'ddd', 'ddd', '1234', 'DFF', 'pasencore', 0, '2020-01-12 20:38:37');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `n_commande` int(11) NOT NULL,
  `n_client` int(11) DEFAULT NULL,
  `quantite` varchar(45) DEFAULT NULL,
  `prix` varchar(45) DEFAULT NULL,
  `heure_commande` varchar(45) DEFAULT NULL,
  `date_commande` varchar(45) DEFAULT NULL,
  `Commandecol` varchar(45) DEFAULT NULL,
  `Livraison_n_livraison` int(11) NOT NULL,
  `A_servi` varchar(45) NOT NULL,
  `Mesures_idMesures` int(11) NOT NULL,
  `Mesures_Reclamation_n_reclamation` int(11) NOT NULL,
  `Nom_commande` varchar(45) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  PRIMARY KEY (`n_commande`,`Livraison_n_livraison`,`Mesures_idMesures`,`Mesures_Reclamation_n_reclamation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE IF NOT EXISTS `livraison` (
  `n_livraison` int(11) NOT NULL,
  `n_commande` varchar(45) DEFAULT NULL,
  `Nom` varchar(45) DEFAULT NULL,
  `Livreur_affecte` varchar(45) DEFAULT NULL,
  `Nombre_articles` varchar(45) DEFAULT NULL,
  `Mesures_idMesures` int(11) NOT NULL,
  `Mesures_Reclamation_n_reclamation` int(11) NOT NULL,
  PRIMARY KEY (`n_livraison`,`Mesures_idMesures`,`Mesures_Reclamation_n_reclamation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

CREATE TABLE IF NOT EXISTS `localisation` (
  `n_localisation` int(10) NOT NULL AUTO_INCREMENT,
  `ville` varchar(10) NOT NULL,
  `quartier` varchar(10) NOT NULL,
  `boulevard` varchar(10) NOT NULL,
  `bloc` varchar(10) NOT NULL,
  `n_local` varchar(10) NOT NULL,
  PRIMARY KEY (`n_localisation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `localisation`
--

INSERT INTO `localisation` (`n_localisation`, `ville`, `quartier`, `boulevard`, `bloc`, `n_local`) VALUES
(1, 'Rabat', 'airfan', 'premiere', '1', '23');

-- --------------------------------------------------------

--
-- Structure de la table `mesures`
--

CREATE TABLE IF NOT EXISTS `mesures` (
  `idMesures` int(11) NOT NULL,
  `Nombre_reclamationparclient` int(11) DEFAULT NULL,
  `Nombre_commandeparclient` int(11) DEFAULT NULL,
  `Nombre_visiteparclient` int(11) DEFAULT NULL,
  `Nombre_commande_erronee` int(11) DEFAULT NULL,
  `Nombre_livraison_reussi` int(11) DEFAULT NULL,
  `Localiser_temps_reel` float DEFAULT NULL,
  `Detecter_accident_Tempsreel` float DEFAULT NULL,
  `Detecter_meteo_Tempsreel` float DEFAULT NULL,
  `Reclamation_n_reclamation` int(11) NOT NULL,
  PRIMARY KEY (`idMesures`,`Reclamation_n_reclamation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `n_produit` int(10) NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(45) NOT NULL,
  `prix` int(40) NOT NULL,
  PRIMARY KEY (`n_produit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`n_produit`, `nom_produit`, `prix`) VALUES
(1, 'Tacos', 32),
(2, 'Panini', 20);

-- --------------------------------------------------------

--
-- Structure de la table `reclamation`
--

CREATE TABLE IF NOT EXISTS `reclamation` (
  `n_reclamation` int(11) NOT NULL AUTO_INCREMENT,
  `n_client` int(11) DEFAULT NULL,
  `note_reclamation` varchar(45) DEFAULT NULL,
  `heure_reclamation` varchar(45) DEFAULT NULL,
  `date_reclamation` varchar(45) DEFAULT NULL,
  `Nombre_reclamationparclient` int(11) DEFAULT NULL,
  PRIMARY KEY (`n_reclamation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `reclamation`
--

INSERT INTO `reclamation` (`n_reclamation`, `n_client`, `note_reclamation`, `heure_reclamation`, `date_reclamation`, `Nombre_reclamationparclient`) VALUES
(1, 12, '', '2020-01-12 13:17:08', '2020-01-12 13:17:08', 4),
(2, 12, '', '2020-01-12 15:09:18', '2020-01-12 15:09:18', 3),
(3, 12, '', '2020-01-12 15:09:22', '2020-01-12 15:09:22', 2),
(4, 12, '', '2020-01-12 15:09:24', '2020-01-12 15:09:24', 1),
(5, 14, '', '2020-01-12 16:11:21', '2020-01-12 16:11:21', 1),
(6, 23, 'DDD', '2020-01-12 20:09:30', '2020-01-12 20:09:30', 2),
(7, 23, 'DDDded', '2020-01-12 20:11:48', '2020-01-12', 1),
(8, 2, NULL, NULL, NULL, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
