-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 12 déc. 2024 à 13:05
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `product_tracking_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`) VALUES
(2, 'Updated Productjkjkkj', 'Updated product dekkkjjkkhkjscription', 150.00, '2024-12-12 11:27:37', '2024-12-12 11:57:14'),
(3, 'tth', 'jjvh', 40.00, '2024-12-12 11:48:50', '2024-12-12 12:03:59'),
(4, 'kjssdqf', 'kjn', 2222.00, '2024-12-12 11:49:30', '2024-12-12 11:49:30'),
(5, 'testsss', 'jnk', 20.00, '2024-12-12 12:02:01', '2024-12-12 12:02:40');

-- --------------------------------------------------------

--
-- Structure de la table `trace_products`
--

CREATE TABLE `trace_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `client_email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trace_products`
--

INSERT INTO `trace_products` (`id`, `product_id`, `client_email`, `created_at`) VALUES
(2, 2, 'client@example.com', '2024-12-12 11:28:24'),
(3, 2, 'bilelbzeouich3@gmail.com', '2024-12-12 11:29:14'),
(4, 2, 'bilelbzeouich3@gmail.com', '2024-12-12 11:55:47'),
(5, 2, 'benichieckhmedamine@gmail.com', '2024-12-12 12:00:03'),
(6, 3, 'benichieckhmedamine@gmail.com', '2024-12-12 12:03:43');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `trace_products`
--
ALTER TABLE `trace_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `trace_products`
--
ALTER TABLE `trace_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `trace_products`
--
ALTER TABLE `trace_products`
  ADD CONSTRAINT `trace_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
