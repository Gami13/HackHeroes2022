CREATE TABLE IF NOT EXISTS `users` (
    `id` bigint(20) NOT NULL,
    `firstName` varchar(255) NOT NULL,
    `lastName` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `salt` varchar(255) NOT NULL,
    `tokens` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '[]',
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