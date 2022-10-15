CREATE TABLE IF NOT EXISTS `users` (
    `id` bigint(20) NOT NULL,
    `firstName` varchar(255) NOT NULL,
    `lastName` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `salt` varchar(255) NOT NULL,
    `tokens` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '[]',
    `ranks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '["user"]',
    `isBanned` tinyint(1) NOT NULL,
    `isActivated` tinyint(1) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
ALTER TABLE `users`
ADD PRIMARY KEY (`id`);
CREATE TABLE IF NOT EXISTS `verifyaccount` (
    `id` bigint(20) NOT NULL,
    `userId` bigint(20) NOT NULL,
    `hash` varchar(255) NOT NULL,
    `isUsed` tinyint(1) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
ALTER TABLE `verifyaccount`
ADD PRIMARY KEY (`id`, `userId`);
-- create table wojewodztwa
CREATE TABLE IF NOT EXISTS `wojewodztwa` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- create table powiaty
CREATE TABLE IF NOT EXISTS `powiaty` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `wojId` int(11) NOT NULL -- ,FOREIGN KEY (wojId) REFERENCES wojewodztwa(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- create table gminy
CREATE TABLE IF NOT EXISTS `gminy` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `powId` int(11) NOT NULL -- ,FOREIGN KEY (powId) REFERENCES powiaty(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- check if in table powiaty are any duplicates
-- SELECT name, COUNT(*) FROM powiaty GROUP BY name HAVING COUNT(*) > 1;
-- -- check if in table gminy are any duplicates
-- SELECT name, COUNT(*) FROM gminy GROUP BY name HAVING COUNT(*) > 1;