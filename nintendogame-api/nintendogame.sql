-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost:8889
-- 產生時間： 2025 年 04 月 07 日 20:30
-- 伺服器版本： 8.0.35
-- PHP 版本： 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `nintendogame`
--

-- --------------------------------------------------------

--
-- 資料表結構 `consoles`
--

CREATE TABLE `consoles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(225) NOT NULL,
  `release_year` int NOT NULL,
  `image_url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `consoles`
--

INSERT INTO `consoles` (`id`, `name`, `release_year`, `image_url`) VALUES
(1, 'Color TV-Game', 1977, 'Color TV-Game.jpg'),
(2, 'Family Computer', 1983, 'Family Computer.jpg'),
(3, 'Super Famicom', 1990, 'Super Famicom.jpg'),
(4, 'Nintendo 64', 1996, 'Nintendo 64.jpg'),
(5, 'Nintendo GameCube', 2001, 'Nintendo GameCube.jpg'),
(6, 'Wii', 2006, 'Wii.jpg'),
(7, 'Wii U', 2012, 'Wii U.jpg'),
(8, 'Nintendo Switch', 2017, 'Nintendo Switch.jpg'),
(9, 'Nintendo Switch 2', 2025, 'Nintendo Switch 2.jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `features`
--

CREATE TABLE `features` (
  `id` int UNSIGNED NOT NULL,
  `console_id` int NOT NULL,
  `feature_name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `features`
--

INSERT INTO `features` (`id`, `console_id`, `feature_name`, `description`) VALUES
(1, 8, 'Hybrid Console Design', 'Nintendo Switch combines handheld and home console gaming, allowing seamless transition between TV mode and portable mode.'),
(2, 6, 'Motion Controls', 'The Wii revolutionized gaming with its motion-sensing Wii Remote, enabling intuitive physical interaction in games like Wii Sports.'),
(3, 5, 'Disc-based Graphics Upgrade', 'GameCube offered enhanced 3D graphics with mini optical discs, bringing beloved franchises into higher visual fidelity.'),
(4, 4, 'Analog Stick & 3D Worlds', 'Nintendo 64 was the first Nintendo console to feature an analog stick and full 3D gaming worlds, revolutionizing platformers like Super Mario 64.'),
(5, 1, 'Built-in Pong-style Games', 'Nintendo\'s first home console, featuring built-in variations of Pong-like games with no cartridges or external media.'),
(6, 2, 'Cartridge-based Gaming', 'Introduced interchangeable game cartridges and 8-bit graphics, becoming a revolutionary hit in Japanese households.'),
(7, 3, '16-bit Graphics & Sound', 'Delivered vibrant 16-bit visuals and iconic sound design, enabling classic titles like Super Mario World and The Legend of Zelda: A Link to the Past.'),
(8, 7, 'Dual-screen Gameplay', 'Featured a GamePad with its own touchscreen, enabling new gameplay possibilities with both TV and handheld-like controls.'),
(9, 9, 'Enhanced Performance Hybrid', 'The successor to the Switch, expected to offer upgraded hardware and maintain the hybrid home-handheld design that defines the platform. Joy-Con adds mouse mode.');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `consoles`
--
ALTER TABLE `consoles`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `consoles`
--
ALTER TABLE `consoles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `features`
--
ALTER TABLE `features`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
