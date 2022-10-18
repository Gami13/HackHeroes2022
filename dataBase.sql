CREATE TABLE IF NOT EXISTS `users` (
    `id` bigint(20) NOT NULL,
    `firstName` varchar(255) NOT NULL,
    `lastName` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `salt` varchar(255) NOT NULL,
    `tokens` JSON NOT NULL DEFAULT '[]',
    `ranks` JSON NOT NULL DEFAULT '["user"]',
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
-- publication
CREATE TABLE IF NOT EXISTS `publication` (
    `id` bigint(20) NOT NULL,
    `userId` bigint(20) NOT NULL,
    `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `title` varchar(255) NOT NULL,
    `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
    `footer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;



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
-- data
INSERT INTO wojewodztwa (name)
VALUES ('dolnośląskie'),
    ('kujawsko-pomorskie'),
    ('lubelskie'),
    ('lubuskie'),
    ('łódzkie'),
    ('małopolskie'),
    ('mazowieckie'),
    ('opolskie'),
    ('podkarpackie'),
    ('podlaskie'),
    ('pomorskie'),
    ('śląskie'),
    ('świętokrzyskie'),
    ('warmińsko-mazurskie'),
    ('wielkopolskie'),
    ('zachodniopomorskie');
INSERT INTO powiaty (name, wojId)
VALUES (
        'Powiat bolesławiecki',
        (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat dzierżoniowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat głogowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat górowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat jaworski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat karkonoski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat kamiennogórski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat kłodzki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat legnicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat lubański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat lubiński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat lwówecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat milicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat oleśnicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat oławski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat polkowicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat strzeliński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat średzki (województwo dolnośląskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat świdnicki (województwo dolnośląskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat trzebnicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat wałbrzyski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat wołowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat wrocławski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat ząbkowicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat zgorzelecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat złotoryjski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Jelenia Góra', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Legnica', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Wrocław', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Wałbrzych', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'dolnośląskie'
            LIMIT 1
        )
    ), (
        'Powiat aleksandrowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat brodnicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat bydgoski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat chełmiński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat golubsko-dobrzyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat grudziądzki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat inowrocławski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat lipnowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat mogileński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat nakielski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat radziejowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat rypiński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat sępoleński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat świecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat toruński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat tucholski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat wąbrzeski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat włocławski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat żniński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Bydgoszcz', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Grudziądz', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Toruń', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Włocławek', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'kujawsko-pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat bialski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat biłgorajski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat chełmski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat hrubieszowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat janowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat krasnostawski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat kraśnicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat lubartowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat lubelski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat łęczyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat łukowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat opolski (województwo lubelskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat parczewski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat puławski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat radzyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat rycki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat świdnicki (województwo lubelskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat tomaszowski (województwo lubelskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat włodawski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat zamojski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Biała Podlaska', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Chełm', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Lublin', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Zamość', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubelskie'
            LIMIT 1
        )
    ), (
        'Powiat gorzowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat krośnieński (województwo lubuskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat międzyrzecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat nowosolski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat słubicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat strzelecko-drezdenecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat sulęciński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat świebodziński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat zielonogórski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat żagański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat żarski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat wschowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Gorzów Wielkopolski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Zielona Góra', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'lubuskie'
            LIMIT 1
        )
    ), (
        'Powiat bełchatowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat kutnowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat łaski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat łęczycki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat łowicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat łódzki wschodni', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat opoczyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat pabianicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat pajęczański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat piotrkowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat poddębicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat radomszczański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat rawski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat sieradzki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat skierniewicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat tomaszowski (województwo łódzkie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat wieluński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat wieruszowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat zduńskowolski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat zgierski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat brzeziński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Łódź', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Piotrków Trybunalski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Skierniewice', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'łódzkie'
            LIMIT 1
        )
    ), (
        'Powiat bocheński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat brzeski (województwo małopolskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat chrzanowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat dąbrowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat gorlicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat krakowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat limanowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat miechowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat myślenicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat nowosądecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat nowotarski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat olkuski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat oświęcimski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat proszowicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat suski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat tarnowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat tatrzański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat wadowicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat wielicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Kraków', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Nowy Sącz', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Tarnów', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'małopolskie'
            LIMIT 1
        )
    ), (
        'Powiat białobrzeski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat ciechanowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat garwoliński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat gostyniński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat grodziski (województwo mazowieckie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat grójecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat kozienicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat legionowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat lipski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat łosicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat makowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat miński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat mławski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat nowodworski (województwo mazowieckie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat ostrołęcki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat ostrowski (województwo mazowieckie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat otwocki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat piaseczyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat płocki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat płoński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat pruszkowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat przasnyski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat przysuski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat pułtuski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat radomski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat siedlecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat sierpecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat sochaczewski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat sokołowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat szydłowiecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat warszawski zachodni', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat węgrowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat wołomiński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat wyszkowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat zwoleński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat żuromiński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat żyrardowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Ostrołęka', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Płock', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Radom', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Siedlce', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Warszawa', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'mazowieckie'
            LIMIT 1
        )
    ), (
        'Powiat brzeski (województwo opolskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat głubczycki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat kędzierzyńsko-kozielski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat kluczborski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat krapkowicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat namysłowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat nyski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat oleski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat opolski (województwo opolskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat prudnicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat strzelecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Opole', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'opolskie'
            LIMIT 1
        )
    ), (
        'Powiat bieszczadzki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat brzozowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat dębicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat jarosławski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat jasielski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat kolbuszowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat krośnieński (województwo podkarpackie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat leżajski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat lubaczowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat łańcucki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat mielecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat niżański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat przemyski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat przeworski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat ropczycko-sędziszowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat rzeszowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat sanocki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat stalowowolski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat strzyżowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat tarnobrzeski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat leski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Krosno', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Przemyśl', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Rzeszów', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Tarnobrzeg', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podkarpackie'
            LIMIT 1
        )
    ), (
        'Powiat augustowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat białostocki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat bielski (województwo podlaskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat grajewski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat hajnowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat kolneński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat łomżyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat moniecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat sejneński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat siemiatycki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat sokólski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat suwalski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat wysokomazowiecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat zambrowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Białystok', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Łomża', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Suwałki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'podlaskie'
            LIMIT 1
        )
    ), (
        'Powiat bytowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat chojnicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat człuchowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat gdański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat kartuski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat kościerski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat kwidzyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat lęborski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat malborski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat nowodworski (województwo pomorskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat pucki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat słupski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat starogardzki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat tczewski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat wejherowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat sztumski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Gdańsk', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Gdynia', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Słupsk', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Sopot', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'pomorskie'
            LIMIT 1
        )
    ), (
        'Powiat będziński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat bielski (województwo śląskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat cieszyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat częstochowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat gliwicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat kłobucki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat lubliniecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat mikołowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat myszkowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat pszczyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat raciborski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat rybnicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat tarnogórski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat bieruńsko-lędziński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat wodzisławski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat zawierciański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat żywiecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Bielsko-Biała', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Bytom', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Chorzów', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Częstochowa', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Dąbrowa Górnicza', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Gliwice', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Jastrzębie-Zdrój', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Jaworzno', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Katowice', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Mysłowice', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Piekary Śląskie', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Ruda Śląska', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Rybnik', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Siemianowice Śląskie', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Sosnowiec', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Świętochłowice', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Tychy', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Zabrze', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Żory', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'śląskie'
            LIMIT 1
        )
    ), (
        'Powiat buski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat jędrzejowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat kazimierski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat kielecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat konecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat opatowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat ostrowiecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat pińczowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat sandomierski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat skarżyski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat starachowicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat staszowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat włoszczowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Kielce', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'świętokrzyskie'
            LIMIT 1
        )
    ), (
        'Powiat bartoszycki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat braniewski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat działdowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat elbląski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat ełcki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat giżycki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat iławski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat kętrzyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat lidzbarski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat mrągowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat nidzicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat nowomiejski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat olecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat olsztyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat ostródzki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat piski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat szczycieński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat gołdapski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat węgorzewski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Elbląg', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Olsztyn', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'warmińsko-mazurskie'
            LIMIT 1
        )
    ), (
        'Powiat chodzieski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat czarnkowsko-trzcianecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat gnieźnieński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat gostyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat grodziski (województwo wielkopolskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat jarociński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat kaliski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat kępiński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat kolski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat koniński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat kościański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat krotoszyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat leszczyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat międzychodzki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat nowotomyski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat obornicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat ostrowski (województwo wielkopolskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat ostrzeszowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat pilski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat pleszewski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat poznański', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat rawicki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat słupecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat szamotulski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat średzki (województwo wielkopolskie)', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat śremski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat turecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat wągrowiecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat wolsztyński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat wrzesiński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat złotowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Kalisz', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Konin', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Leszno', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Poznań', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'wielkopolskie'
            LIMIT 1
        )
    ), (
        'Powiat białogardzki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat choszczeński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat drawski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat goleniowski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat gryficki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat gryfiński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat kamieński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat kołobrzeski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat koszaliński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat myśliborski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat policki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat pyrzycki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat sławieński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat stargardzki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat szczecinecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat świdwiński', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat wałecki', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Powiat łobeski', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Koszalin', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Szczecin', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    ), (
        'Świnoujście', (
            SELECT id
            FROM wojewodztwa
            WHERE name = 'zachodniopomorskie'
            LIMIT 1
        )
    );
INSERT INTO gminy (name, powId)
VALUES (
        'Bolesławiec',
        (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bolesławiecki'
            LIMIT 1
        )
    ), (
        'Bolesławiec (gmina wiejska w województwie dolnośląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bolesławiecki'
            LIMIT 1
        )
    ), (
        'Gromadka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bolesławiecki'
            LIMIT 1
        )
    ), (
        'Nowogrodziec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bolesławiecki'
            LIMIT 1
        )
    ), (
        'Osiecznica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bolesławiecki'
            LIMIT 1
        )
    ), (
        'Warta Bolesławiecka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bolesławiecki'
            LIMIT 1
        )
    ), (
        'Bielawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dzierżoniowski'
            LIMIT 1
        )
    ), (
        'Dzierżoniów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dzierżoniowski'
            LIMIT 1
        )
    ), (
        'Pieszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dzierżoniowski'
            LIMIT 1
        )
    ), (
        'Piława Górna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dzierżoniowski'
            LIMIT 1
        )
    ), (
        'Dzierżoniów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dzierżoniowski'
            LIMIT 1
        )
    ), (
        'Łagiewniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dzierżoniowski'
            LIMIT 1
        )
    ), (
        'Niemcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dzierżoniowski'
            LIMIT 1
        )
    ), (
        'Głogów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głogowski'
            LIMIT 1
        )
    ), (
        'Głogów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głogowski'
            LIMIT 1
        )
    ), (
        'Jerzmanowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głogowski'
            LIMIT 1
        )
    ), (
        'Kotla', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głogowski'
            LIMIT 1
        )
    ), (
        'Pęcław', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głogowski'
            LIMIT 1
        )
    ), (
        'Żukowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głogowski'
            LIMIT 1
        )
    ), (
        'Góra', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat górowski'
            LIMIT 1
        )
    ), (
        'Jemielno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat górowski'
            LIMIT 1
        )
    ), (
        'Niechlów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat górowski'
            LIMIT 1
        )
    ), (
        'Wąsosz (gmina w województwie dolnośląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat górowski'
            LIMIT 1
        )
    ), (
        'Jawor (miasto)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jaworski'
            LIMIT 1
        )
    ), (
        'Bolków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jaworski'
            LIMIT 1
        )
    ), (
        'Męcinka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jaworski'
            LIMIT 1
        )
    ), (
        'Mściwojów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jaworski'
            LIMIT 1
        )
    ), (
        'Paszowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jaworski'
            LIMIT 1
        )
    ), (
        'Wądroże Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jaworski'
            LIMIT 1
        )
    ), (
        'Karpacz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat karkonoski'
            LIMIT 1
        )
    ), (
        'Kowary', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat karkonoski'
            LIMIT 1
        )
    ), (
        'Piechowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat karkonoski'
            LIMIT 1
        )
    ), (
        'Szklarska Poręba', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat karkonoski'
            LIMIT 1
        )
    ), (
        'Janowice Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat karkonoski'
            LIMIT 1
        )
    ), (
        'Jeżów Sudecki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat karkonoski'
            LIMIT 1
        )
    ), (
        'Mysłakowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat karkonoski'
            LIMIT 1
        )
    ), (
        'Podgórzyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat karkonoski'
            LIMIT 1
        )
    ), (
        'Stara Kamienica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat karkonoski'
            LIMIT 1
        )
    ), (
        'Kamienna Góra', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamiennogórski'
            LIMIT 1
        )
    ), (
        'Kamienna Góra (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamiennogórski'
            LIMIT 1
        )
    ), (
        'Lubawka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamiennogórski'
            LIMIT 1
        )
    ), (
        'Marciszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamiennogórski'
            LIMIT 1
        )
    ), (
        'Duszniki-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Kłodzko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Kudowa-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Nowa Ruda', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Polanica-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Bystrzyca Kłodzka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Kłodzko (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Lądek-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Lewin Kłodzki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Międzylesie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Nowa Ruda (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Radków (gmina w województwie dolnośląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Stronie Śląskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Szczytna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłodzki'
            LIMIT 1
        )
    ), (
        'Chojnów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legnicki'
            LIMIT 1
        )
    ), (
        'Chojnów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legnicki'
            LIMIT 1
        )
    ), (
        'Krotoszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legnicki'
            LIMIT 1
        )
    ), (
        'Kunice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legnicki'
            LIMIT 1
        )
    ), (
        'Legnickie Pole', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legnicki'
            LIMIT 1
        )
    ), (
        'Miłkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legnicki'
            LIMIT 1
        )
    ), (
        'Prochowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legnicki'
            LIMIT 1
        )
    ), (
        'Ruja', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legnicki'
            LIMIT 1
        )
    ), (
        'Lubań (województwo dolnośląskie)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubański'
            LIMIT 1
        )
    ), (
        'Świeradów-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubański'
            LIMIT 1
        )
    ), (
        'Leśna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubański'
            LIMIT 1
        )
    ), (
        'Lubań (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubański'
            LIMIT 1
        )
    ), (
        'Olszyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubański'
            LIMIT 1
        )
    ), (
        'Platerówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubański'
            LIMIT 1
        )
    ), (
        'Siekierczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubański'
            LIMIT 1
        )
    ), (
        'Lubin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubiński'
            LIMIT 1
        )
    ), (
        'Lubin (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubiński'
            LIMIT 1
        )
    ), (
        'Rudna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubiński'
            LIMIT 1
        )
    ), (
        'Ścinawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubiński'
            LIMIT 1
        )
    ), (
        'Gryfów Śląski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lwówecki'
            LIMIT 1
        )
    ), (
        'Lubomierz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lwówecki'
            LIMIT 1
        )
    ), (
        'Lwówek Śląski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lwówecki'
            LIMIT 1
        )
    ), (
        'Mirsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lwówecki'
            LIMIT 1
        )
    ), (
        'Wleń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lwówecki'
            LIMIT 1
        )
    ), (
        'Cieszków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat milicki'
            LIMIT 1
        )
    ), (
        'Krośnice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat milicki'
            LIMIT 1
        )
    ), (
        'Milicz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat milicki'
            LIMIT 1
        )
    ), (
        'Oleśnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleśnicki'
            LIMIT 1
        )
    ), (
        'Bierutów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleśnicki'
            LIMIT 1
        )
    ), (
        'Dobroszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleśnicki'
            LIMIT 1
        )
    ), (
        'Dziadowa Kłoda', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleśnicki'
            LIMIT 1
        )
    ), (
        'Międzybórz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleśnicki'
            LIMIT 1
        )
    ), (
        'Oleśnica (gmina wiejska w województwie dolnośląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleśnicki'
            LIMIT 1
        )
    ), (
        'Syców', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleśnicki'
            LIMIT 1
        )
    ), (
        'Twardogóra', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleśnicki'
            LIMIT 1
        )
    ), (
        'Oława', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oławski'
            LIMIT 1
        )
    ), (
        'Domaniów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oławski'
            LIMIT 1
        )
    ), (
        'Jelcz-Laskowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oławski'
            LIMIT 1
        )
    ), (
        'Oława (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oławski'
            LIMIT 1
        )
    ), (
        'Chocianów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat polkowicki'
            LIMIT 1
        )
    ), (
        'Gaworzyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat polkowicki'
            LIMIT 1
        )
    ), (
        'Grębocice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat polkowicki'
            LIMIT 1
        )
    ), (
        'Polkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat polkowicki'
            LIMIT 1
        )
    ), (
        'Przemków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat polkowicki'
            LIMIT 1
        )
    ), (
        'Radwanice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat polkowicki'
            LIMIT 1
        )
    ), (
        'Borów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzeliński'
            LIMIT 1
        )
    ), (
        'Kondratowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzeliński'
            LIMIT 1
        )
    ), (
        'Przeworno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzeliński'
            LIMIT 1
        )
    ), (
        'Strzelin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzeliński'
            LIMIT 1
        )
    ), (
        'Wiązów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzeliński'
            LIMIT 1
        )
    ), (
        'Kostomłoty', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Malczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Miękinia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Środa Śląska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Udanin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Świdnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Świebodzice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Dobromierz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Jaworzyna Śląska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Marcinowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Strzegom', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Świdnica (gmina wiejska w województwie dolnośląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Żarów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo dolnośląskie)'
            LIMIT 1
        )
    ), (
        'Oborniki Śląskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat trzebnicki'
            LIMIT 1
        )
    ), (
        'Prusice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat trzebnicki'
            LIMIT 1
        )
    ), (
        'Trzebnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat trzebnicki'
            LIMIT 1
        )
    ), (
        'Wisznia Mała', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat trzebnicki'
            LIMIT 1
        )
    ), (
        'Zawonia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat trzebnicki'
            LIMIT 1
        )
    ), (
        'Żmigród', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat trzebnicki'
            LIMIT 1
        )
    ), (
        'Boguszów-Gorce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałbrzyski'
            LIMIT 1
        )
    ), (
        'Jedlina-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałbrzyski'
            LIMIT 1
        )
    ), (
        'Szczawno-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałbrzyski'
            LIMIT 1
        )
    ), (
        'Czarny Bór (gmina w powiecie wałbrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałbrzyski'
            LIMIT 1
        )
    ), (
        'Głuszyca', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałbrzyski'
            LIMIT 1
        )
    ), (
        'Mieroszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałbrzyski'
            LIMIT 1
        )
    ), (
        'Stare Bogaczowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałbrzyski'
            LIMIT 1
        )
    ), (
        'Walim', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałbrzyski'
            LIMIT 1
        )
    ), (
        'Brzeg Dolny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołowski'
            LIMIT 1
        )
    ), (
        'Wińsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołowski'
            LIMIT 1
        )
    ), (
        'Wołów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołowski'
            LIMIT 1
        )
    ), (
        'Czernica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrocławski'
            LIMIT 1
        )
    ), (
        'Długołęka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrocławski'
            LIMIT 1
        )
    ), (
        'Jordanów Śląski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrocławski'
            LIMIT 1
        )
    ), (
        'Kąty Wrocławskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrocławski'
            LIMIT 1
        )
    ), (
        'Kobierzyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrocławski'
            LIMIT 1
        )
    ), (
        'Mietków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrocławski'
            LIMIT 1
        )
    ), (
        'Sobótka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrocławski'
            LIMIT 1
        )
    ), (
        'Siechnice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrocławski'
            LIMIT 1
        )
    ), (
        'Żórawina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrocławski'
            LIMIT 1
        )
    ), (
        'Bardo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ząbkowicki'
            LIMIT 1
        )
    ), (
        'Ciepłowody', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ząbkowicki'
            LIMIT 1
        )
    ), (
        'Kamieniec Ząbkowicki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ząbkowicki'
            LIMIT 1
        )
    ), (
        'Stoszowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ząbkowicki'
            LIMIT 1
        )
    ), (
        'Ząbkowice Śląskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ząbkowicki'
            LIMIT 1
        )
    ), (
        'Ziębice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ząbkowicki'
            LIMIT 1
        )
    ), (
        'Złoty Stok', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ząbkowicki'
            LIMIT 1
        )
    ), (
        'Zawidów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgorzelecki'
            LIMIT 1
        )
    ), (
        'Zgorzelec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgorzelecki'
            LIMIT 1
        )
    ), (
        'Bogatynia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgorzelecki'
            LIMIT 1
        )
    ), (
        'Pieńsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgorzelecki'
            LIMIT 1
        )
    ), (
        'Sulików', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgorzelecki'
            LIMIT 1
        )
    ), (
        'Węgliniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgorzelecki'
            LIMIT 1
        )
    ), (
        'Zgorzelec (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgorzelecki'
            LIMIT 1
        )
    ), (
        'Wojcieszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotoryjski'
            LIMIT 1
        )
    ), (
        'Złotoryja', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotoryjski'
            LIMIT 1
        )
    ), (
        'Pielgrzymka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotoryjski'
            LIMIT 1
        )
    ), (
        'Świerzawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotoryjski'
            LIMIT 1
        )
    ), (
        'Zagrodno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotoryjski'
            LIMIT 1
        )
    ), (
        'Złotoryja (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotoryjski'
            LIMIT 1
        )
    ), (
        'Jelenia Góra', (
            SELECT id
            FROM powiaty
            WHERE name = 'Jelenia Góra'
            LIMIT 1
        )
    ), (
        'Legnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Legnica'
            LIMIT 1
        )
    ), (
        'Wrocław', (
            SELECT id
            FROM powiaty
            WHERE name = 'Wrocław'
            LIMIT 1
        )
    ), (
        'Wałbrzych', (
            SELECT id
            FROM powiaty
            WHERE name = 'Wałbrzych'
            LIMIT 1
        )
    ), (
        'Aleksandrów Kujawski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat aleksandrowski'
            LIMIT 1
        )
    ), (
        'Ciechocinek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat aleksandrowski'
            LIMIT 1
        )
    ), (
        'Nieszawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat aleksandrowski'
            LIMIT 1
        )
    ), (
        'Aleksandrów Kujawski (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat aleksandrowski'
            LIMIT 1
        )
    ), (
        'Bądkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat aleksandrowski'
            LIMIT 1
        )
    ), (
        'Koneck', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat aleksandrowski'
            LIMIT 1
        )
    ), (
        'Raciążek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat aleksandrowski'
            LIMIT 1
        )
    ), (
        'Waganiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat aleksandrowski'
            LIMIT 1
        )
    ), (
        'Zakrzewo (gmina w województwie kujawsko-pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat aleksandrowski'
            LIMIT 1
        )
    ), (
        'Brodnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Bobrowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Brodnica (gmina wiejska w województwie kujawsko-pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Brzozie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Górzno (gmina w województwie kujawsko-pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Bartniczka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Jabłonowo Pomorskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Osiek (gmina w województwie kujawsko-pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Świedziebnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Zbiczno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brodnicki'
            LIMIT 1
        )
    ), (
        'Białe Błota', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bydgoski'
            LIMIT 1
        )
    ), (
        'Dąbrowa Chełmińska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bydgoski'
            LIMIT 1
        )
    ), (
        'Dobrcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bydgoski'
            LIMIT 1
        )
    ), (
        'Koronowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bydgoski'
            LIMIT 1
        )
    ), (
        'Nowa Wieś Wielka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bydgoski'
            LIMIT 1
        )
    ), (
        'Osielsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bydgoski'
            LIMIT 1
        )
    ), (
        'Sicienko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bydgoski'
            LIMIT 1
        )
    ), (
        'Solec Kujawski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bydgoski'
            LIMIT 1
        )
    ), (
        'Chełmno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmiński'
            LIMIT 1
        )
    ), (
        'Chełmno (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmiński'
            LIMIT 1
        )
    ), (
        'Kijewo Królewskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmiński'
            LIMIT 1
        )
    ), (
        'Lisewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmiński'
            LIMIT 1
        )
    ), (
        'Papowo Biskupie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmiński'
            LIMIT 1
        )
    ), (
        'Stolno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmiński'
            LIMIT 1
        )
    ), (
        'Unisław', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmiński'
            LIMIT 1
        )
    ), (
        'Golub-Dobrzyń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat golubsko-dobrzyński'
            LIMIT 1
        )
    ), (
        'Ciechocin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat golubsko-dobrzyński'
            LIMIT 1
        )
    ), (
        'Golub-Dobrzyń (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat golubsko-dobrzyński'
            LIMIT 1
        )
    ), (
        'Kowalewo Pomorskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat golubsko-dobrzyński'
            LIMIT 1
        )
    ), (
        'Radomin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat golubsko-dobrzyński'
            LIMIT 1
        )
    ), (
        'Zbójno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat golubsko-dobrzyński'
            LIMIT 1
        )
    ), (
        'Grudziądz (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grudziądzki'
            LIMIT 1
        )
    ), (
        'Gruta', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grudziądzki'
            LIMIT 1
        )
    ), (
        'Łasin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grudziądzki'
            LIMIT 1
        )
    ), (
        'Radzyń Chełmiński', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grudziądzki'
            LIMIT 1
        )
    ), (
        'Rogóźno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grudziądzki'
            LIMIT 1
        )
    ), (
        'Świecie nad Osą', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grudziądzki'
            LIMIT 1
        )
    ), (
        'Inowrocław', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat inowrocławski'
            LIMIT 1
        )
    ), (
        'Dąbrowa Biskupia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat inowrocławski'
            LIMIT 1
        )
    ), (
        'Gniewkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat inowrocławski'
            LIMIT 1
        )
    ), (
        'Inowrocław (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat inowrocławski'
            LIMIT 1
        )
    ), (
        'Janikowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat inowrocławski'
            LIMIT 1
        )
    ), (
        'Kruszwica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat inowrocławski'
            LIMIT 1
        )
    ), (
        'Pakość', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat inowrocławski'
            LIMIT 1
        )
    ), (
        'Rojewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat inowrocławski'
            LIMIT 1
        )
    ), (
        'Złotniki Kujawskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat inowrocławski'
            LIMIT 1
        )
    ), (
        'Lipno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipnowski'
            LIMIT 1
        )
    ), (
        'Bobrowniki (gmina w województwie kujawsko-pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipnowski'
            LIMIT 1
        )
    ), (
        'Chrostkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipnowski'
            LIMIT 1
        )
    ), (
        'Dobrzyń nad Wisłą', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipnowski'
            LIMIT 1
        )
    ), (
        'Kikół', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipnowski'
            LIMIT 1
        )
    ), (
        'Lipno (gmina wiejska w województwie kujawsko-pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipnowski'
            LIMIT 1
        )
    ), (
        'Skępe', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipnowski'
            LIMIT 1
        )
    ), (
        'Tłuchowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipnowski'
            LIMIT 1
        )
    ), (
        'Wielgie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipnowski'
            LIMIT 1
        )
    ), (
        'Dąbrowa (gmina w województwie kujawsko-pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mogileński'
            LIMIT 1
        )
    ), (
        'Jeziora Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mogileński'
            LIMIT 1
        )
    ), (
        'Mogilno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mogileński'
            LIMIT 1
        )
    ), (
        'Strzelno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mogileński'
            LIMIT 1
        )
    ), (
        'Kcynia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nakielski'
            LIMIT 1
        )
    ), (
        'Mrocza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nakielski'
            LIMIT 1
        )
    ), (
        'Nakło nad Notecią', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nakielski'
            LIMIT 1
        )
    ), (
        'Sadki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nakielski'
            LIMIT 1
        )
    ), (
        'Szubin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nakielski'
            LIMIT 1
        )
    ), (
        'Radziejów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radziejowski'
            LIMIT 1
        )
    ), (
        'Bytoń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radziejowski'
            LIMIT 1
        )
    ), (
        'Dobre (gmina w województwie kujawsko-pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radziejowski'
            LIMIT 1
        )
    ), (
        'Osięciny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radziejowski'
            LIMIT 1
        )
    ), (
        'Piotrków Kujawski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radziejowski'
            LIMIT 1
        )
    ), (
        'Radziejów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radziejowski'
            LIMIT 1
        )
    ), (
        'Topólka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radziejowski'
            LIMIT 1
        )
    ), (
        'Rypin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rypiński'
            LIMIT 1
        )
    ), (
        'Brzuze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rypiński'
            LIMIT 1
        )
    ), (
        'Rogowo (gmina w powiecie rypińskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rypiński'
            LIMIT 1
        )
    ), (
        'Rypin (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rypiński'
            LIMIT 1
        )
    ), (
        'Skrwilno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rypiński'
            LIMIT 1
        )
    ), (
        'Wąpielsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rypiński'
            LIMIT 1
        )
    ), (
        'Kamień Krajeński', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sępoleński'
            LIMIT 1
        )
    ), (
        'Sępólno Krajeńskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sępoleński'
            LIMIT 1
        )
    ), (
        'Sośno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sępoleński'
            LIMIT 1
        )
    ), (
        'Więcbork', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sępoleński'
            LIMIT 1
        )
    ), (
        'Bukowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Dragacz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Drzycim', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Jeżewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Lniano', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Nowe', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Osie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Pruszcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Świecie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Świekatowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Warlubie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świecki'
            LIMIT 1
        )
    ), (
        'Chełmża', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat toruński'
            LIMIT 1
        )
    ), (
        'Chełmża (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat toruński'
            LIMIT 1
        )
    ), (
        'Czernikowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat toruński'
            LIMIT 1
        )
    ), (
        'Lubicz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat toruński'
            LIMIT 1
        )
    ), (
        'Łubianka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat toruński'
            LIMIT 1
        )
    ), (
        'Łysomice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat toruński'
            LIMIT 1
        )
    ), (
        'Obrowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat toruński'
            LIMIT 1
        )
    ), (
        'Wielka Nieszawka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat toruński'
            LIMIT 1
        )
    ), (
        'Zławieś Wielka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat toruński'
            LIMIT 1
        )
    ), (
        'Cekcyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tucholski'
            LIMIT 1
        )
    ), (
        'Gostycyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tucholski'
            LIMIT 1
        )
    ), (
        'Kęsowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tucholski'
            LIMIT 1
        )
    ), (
        'Lubiewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tucholski'
            LIMIT 1
        )
    ), (
        'Śliwice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tucholski'
            LIMIT 1
        )
    ), (
        'Tuchola', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tucholski'
            LIMIT 1
        )
    ), (
        'Wąbrzeźno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wąbrzeski'
            LIMIT 1
        )
    ), (
        'Dębowa Łąka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wąbrzeski'
            LIMIT 1
        )
    ), (
        'Książki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wąbrzeski'
            LIMIT 1
        )
    ), (
        'Płużnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wąbrzeski'
            LIMIT 1
        )
    ), (
        'Ryńsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wąbrzeski'
            LIMIT 1
        )
    ), (
        'Kowal (miasto)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Baruchowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Boniewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Brześć Kujawski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Choceń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Chodecz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Fabianki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Izbica Kujawska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Kowal (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Lubanie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Lubień Kujawski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Lubraniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Włocławek (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włocławski'
            LIMIT 1
        )
    ), (
        'Barcin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żniński'
            LIMIT 1
        )
    ), (
        'Gąsawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żniński'
            LIMIT 1
        )
    ), (
        'Janowiec Wielkopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żniński'
            LIMIT 1
        )
    ), (
        'Łabiszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żniński'
            LIMIT 1
        )
    ), (
        'Rogowo (gmina w powiecie żnińskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żniński'
            LIMIT 1
        )
    ), (
        'Żnin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żniński'
            LIMIT 1
        )
    ), (
        'Bydgoszcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Bydgoszcz'
            LIMIT 1
        )
    ), (
        'Grudziądz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Grudziądz'
            LIMIT 1
        )
    ), (
        'Toruń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Toruń'
            LIMIT 1
        )
    ), (
        'Włocławek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Włocławek'
            LIMIT 1
        )
    ), (
        'Międzyrzec Podlaski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Terespol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Biała Podlaska (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Drelów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Janów Podlaski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Kodeń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Konstantynów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Leśna Podlaska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Łomazy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Międzyrzec Podlaski (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Piszczac', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Rokitno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Rossosz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Sławatycze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Sosnówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Terespol (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Tuczna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Wisznice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Zalesie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bialski'
            LIMIT 1
        )
    ), (
        'Biłgoraj', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Aleksandrów (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Biłgoraj (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Biszcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Frampol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Goraj', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Józefów (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Księżpol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Łukowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Obsza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Potok Górny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Tarnogród', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Tereszpol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Turobin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat biłgorajski'
            LIMIT 1
        )
    ), (
        'Rejowiec Fabryczny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Białopole', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Chełm (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Dorohusk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Dubienka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Kamień (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Leśniowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Rejowiec Fabryczny (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Ruda-Huta', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Sawin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Siedliszcze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Wierzbica (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Wojsławice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Żmudź', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Rejowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chełmski'
            LIMIT 1
        )
    ), (
        'Hrubieszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hrubieszowski'
            LIMIT 1
        )
    ), (
        'Dołhobyczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hrubieszowski'
            LIMIT 1
        )
    ), (
        'Horodło', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hrubieszowski'
            LIMIT 1
        )
    ), (
        'Hrubieszów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hrubieszowski'
            LIMIT 1
        )
    ), (
        'Mircze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hrubieszowski'
            LIMIT 1
        )
    ), (
        'Trzeszczany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hrubieszowski'
            LIMIT 1
        )
    ), (
        'Uchanie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hrubieszowski'
            LIMIT 1
        )
    ), (
        'Werbkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hrubieszowski'
            LIMIT 1
        )
    ), (
        'Batorz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat janowski'
            LIMIT 1
        )
    ), (
        'Chrzanów (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat janowski'
            LIMIT 1
        )
    ), (
        'Dzwola', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat janowski'
            LIMIT 1
        )
    ), (
        'Godziszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat janowski'
            LIMIT 1
        )
    ), (
        'Janów Lubelski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat janowski'
            LIMIT 1
        )
    ), (
        'Modliborzyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat janowski'
            LIMIT 1
        )
    ), (
        'Potok Wielki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat janowski'
            LIMIT 1
        )
    ), (
        'Krasnystaw', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Fajsławice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Gorzków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Izbica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Krasnystaw (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Kraśniczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Łopiennik Górny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Rudnik (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Siennica Różana', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Żółkiewka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krasnostawski'
            LIMIT 1
        )
    ), (
        'Kraśnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Annopol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Dzierzkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Gościeradów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Kraśnik (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Szastarka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Trzydnik Duży', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Urzędów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Wilkołaz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Zakrzówek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kraśnicki'
            LIMIT 1
        )
    ), (
        'Lubartów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Abramów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Firlej', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Jeziorzany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Kamionka (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Kock', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Lubartów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Michów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Niedźwiada', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Ostrów Lubelski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Ostrówek (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Serniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Uścimów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubartowski'
            LIMIT 1
        )
    ), (
        'Bełżyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Borzechów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Bychawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Garbów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Głusk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Jabłonna (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Jastków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Konopnica (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Krzczonów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Niedrzwica Duża', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Niemce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Strzyżewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Wojciechów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Wólka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Wysokie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Zakrzew (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubelski'
            LIMIT 1
        )
    ), (
        'Cyców', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczyński'
            LIMIT 1
        )
    ), (
        'Ludwin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczyński'
            LIMIT 1
        )
    ), (
        'Łęczna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczyński'
            LIMIT 1
        )
    ), (
        'Milejów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczyński'
            LIMIT 1
        )
    ), (
        'Puchaczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczyński'
            LIMIT 1
        )
    ), (
        'Spiczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczyński'
            LIMIT 1
        )
    ), (
        'Łuków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Stoczek Łukowski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Adamów (gmina w powiecie łukowskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Krzywda', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Łuków (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Serokomla', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Stanin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Stoczek Łukowski (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Trzebieszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Wojcieszków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Wola Mysłowska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łukowski'
            LIMIT 1
        )
    ), (
        'Chodel', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Józefów nad Wisłą', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Karczmiska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Łaziska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Opole Lubelskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Poniatowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Wilków (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Dębowa Kłoda', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat parczewski'
            LIMIT 1
        )
    ), (
        'Jabłoń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat parczewski'
            LIMIT 1
        )
    ), (
        'Milanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat parczewski'
            LIMIT 1
        )
    ), (
        'Parczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat parczewski'
            LIMIT 1
        )
    ), (
        'Podedwórze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat parczewski'
            LIMIT 1
        )
    ), (
        'Siemień', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat parczewski'
            LIMIT 1
        )
    ), (
        'Sosnowica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat parczewski'
            LIMIT 1
        )
    ), (
        'Puławy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Baranów (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Janowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Kazimierz Dolny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Końskowola', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Kurów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Markuszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Nałęczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Puławy (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Wąwolnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Żyrzyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat puławski'
            LIMIT 1
        )
    ), (
        'Radzyń Podlaski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radzyński'
            LIMIT 1
        )
    ), (
        'Borki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radzyński'
            LIMIT 1
        )
    ), (
        'Czemierniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radzyński'
            LIMIT 1
        )
    ), (
        'Kąkolewnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radzyński'
            LIMIT 1
        )
    ), (
        'Komarówka Podlaska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radzyński'
            LIMIT 1
        )
    ), (
        'Radzyń Podlaski (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radzyński'
            LIMIT 1
        )
    ), (
        'Ulan-Majorat', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radzyński'
            LIMIT 1
        )
    ), (
        'Wohyń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radzyński'
            LIMIT 1
        )
    ), (
        'Dęblin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rycki'
            LIMIT 1
        )
    ), (
        'Kłoczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rycki'
            LIMIT 1
        )
    ), (
        'Nowodwór', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rycki'
            LIMIT 1
        )
    ), (
        'Ryki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rycki'
            LIMIT 1
        )
    ), (
        'Stężyca (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rycki'
            LIMIT 1
        )
    ), (
        'Ułęż', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rycki'
            LIMIT 1
        )
    ), (
        'Świdnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Mełgiew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Piaski (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Rybczewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Trawniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdnicki (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Tomaszów Lubelski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Bełżec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Jarczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Krynice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Lubycza Królewska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Łaszczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Rachanie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Susiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Tarnawatka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Telatyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Tomaszów Lubelski (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Tyszowce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Ulhówek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo lubelskie)'
            LIMIT 1
        )
    ), (
        'Włodawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włodawski'
            LIMIT 1
        )
    ), (
        'Hanna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włodawski'
            LIMIT 1
        )
    ), (
        'Hańsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włodawski'
            LIMIT 1
        )
    ), (
        'Stary Brus', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włodawski'
            LIMIT 1
        )
    ), (
        'Urszulin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włodawski'
            LIMIT 1
        )
    ), (
        'Włodawa (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włodawski'
            LIMIT 1
        )
    ), (
        'Wola Uhruska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włodawski'
            LIMIT 1
        )
    ), (
        'Wyryki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włodawski'
            LIMIT 1
        )
    ), (
        'Adamów (gmina w powiecie zamojskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Grabowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Komarów-Osada', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Krasnobród', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Łabunie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Miączyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Nielisz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Radecznica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Sitno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Skierbieszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Stary Zamość', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Sułów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Szczebrzeszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Zamość (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Zwierzyniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zamojski'
            LIMIT 1
        )
    ), (
        'Biała Podlaska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Biała Podlaska'
            LIMIT 1
        )
    ), (
        'Chełm', (
            SELECT id
            FROM powiaty
            WHERE name = 'Chełm'
            LIMIT 1
        )
    ), (
        'Lublin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Lublin'
            LIMIT 1
        )
    ), (
        'Zamość', (
            SELECT id
            FROM powiaty
            WHERE name = 'Zamość'
            LIMIT 1
        )
    ), (
        'Kostrzyn nad Odrą', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorzowski'
            LIMIT 1
        )
    ), (
        'Bogdaniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorzowski'
            LIMIT 1
        )
    ), (
        'Deszczno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorzowski'
            LIMIT 1
        )
    ), (
        'Kłodawa (gmina w województwie lubuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorzowski'
            LIMIT 1
        )
    ), (
        'Lubiszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorzowski'
            LIMIT 1
        )
    ), (
        'Santok', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorzowski'
            LIMIT 1
        )
    ), (
        'Witnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorzowski'
            LIMIT 1
        )
    ), (
        'Gubin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo lubuskie)'
            LIMIT 1
        )
    ), (
        'Bobrowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo lubuskie)'
            LIMIT 1
        )
    ), (
        'Bytnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo lubuskie)'
            LIMIT 1
        )
    ), (
        'Dąbie (gmina w województwie lubuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo lubuskie)'
            LIMIT 1
        )
    ), (
        'Gubin (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo lubuskie)'
            LIMIT 1
        )
    ), (
        'Krosno Odrzańskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo lubuskie)'
            LIMIT 1
        )
    ), (
        'Maszewo (gmina w województwie lubuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo lubuskie)'
            LIMIT 1
        )
    ), (
        'Bledzew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzyrzecki'
            LIMIT 1
        )
    ), (
        'Międzyrzecz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzyrzecki'
            LIMIT 1
        )
    ), (
        'Przytoczna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzyrzecki'
            LIMIT 1
        )
    ), (
        'Pszczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzyrzecki'
            LIMIT 1
        )
    ), (
        'Skwierzyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzyrzecki'
            LIMIT 1
        )
    ), (
        'Trzciel', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzyrzecki'
            LIMIT 1
        )
    ), (
        'Nowa Sól', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosolski'
            LIMIT 1
        )
    ), (
        'Bytom Odrzański', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosolski'
            LIMIT 1
        )
    ), (
        'Kolsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosolski'
            LIMIT 1
        )
    ), (
        'Kożuchów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosolski'
            LIMIT 1
        )
    ), (
        'Nowa Sól (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosolski'
            LIMIT 1
        )
    ), (
        'Nowe Miasteczko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosolski'
            LIMIT 1
        )
    ), (
        'Otyń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosolski'
            LIMIT 1
        )
    ), (
        'Siedlisko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosolski'
            LIMIT 1
        )
    ), (
        'Cybinka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słubicki'
            LIMIT 1
        )
    ), (
        'Górzyca', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słubicki'
            LIMIT 1
        )
    ), (
        'Ośno Lubuskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słubicki'
            LIMIT 1
        )
    ), (
        'Rzepin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słubicki'
            LIMIT 1
        )
    ), (
        'Słubice (gmina w województwie lubuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słubicki'
            LIMIT 1
        )
    ), (
        'Dobiegniew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecko-drezdenecki'
            LIMIT 1
        )
    ), (
        'Drezdenko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecko-drezdenecki'
            LIMIT 1
        )
    ), (
        'Stare Kurowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecko-drezdenecki'
            LIMIT 1
        )
    ), (
        'Strzelce Krajeńskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecko-drezdenecki'
            LIMIT 1
        )
    ), (
        'Zwierzyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecko-drezdenecki'
            LIMIT 1
        )
    ), (
        'Krzeszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sulęciński'
            LIMIT 1
        )
    ), (
        'Lubniewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sulęciński'
            LIMIT 1
        )
    ), (
        'Słońsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sulęciński'
            LIMIT 1
        )
    ), (
        'Sulęcin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sulęciński'
            LIMIT 1
        )
    ), (
        'Torzym', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sulęciński'
            LIMIT 1
        )
    ), (
        'Lubrza (gmina w województwie lubuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świebodziński'
            LIMIT 1
        )
    ), (
        'Łagów (gmina w województwie lubuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świebodziński'
            LIMIT 1
        )
    ), (
        'Skąpe', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świebodziński'
            LIMIT 1
        )
    ), (
        'Szczaniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świebodziński'
            LIMIT 1
        )
    ), (
        'Świebodzin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świebodziński'
            LIMIT 1
        )
    ), (
        'Zbąszynek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świebodziński'
            LIMIT 1
        )
    ), (
        'Babimost', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zielonogórski'
            LIMIT 1
        )
    ), (
        'Bojadła', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zielonogórski'
            LIMIT 1
        )
    ), (
        'Czerwieńsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zielonogórski'
            LIMIT 1
        )
    ), (
        'Kargowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zielonogórski'
            LIMIT 1
        )
    ), (
        'Nowogród Bobrzański', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zielonogórski'
            LIMIT 1
        )
    ), (
        'Sulechów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zielonogórski'
            LIMIT 1
        )
    ), (
        'Świdnica (gmina w województwie lubuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zielonogórski'
            LIMIT 1
        )
    ), (
        'Trzebiechów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zielonogórski'
            LIMIT 1
        )
    ), (
        'Zabór', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zielonogórski'
            LIMIT 1
        )
    ), (
        'Gozdnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żagański'
            LIMIT 1
        )
    ), (
        'Żagań', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żagański'
            LIMIT 1
        )
    ), (
        'Brzeźnica (gmina w województwie lubuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żagański'
            LIMIT 1
        )
    ), (
        'Iłowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żagański'
            LIMIT 1
        )
    ), (
        'Małomice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żagański'
            LIMIT 1
        )
    ), (
        'Niegosławice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żagański'
            LIMIT 1
        )
    ), (
        'Szprotawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żagański'
            LIMIT 1
        )
    ), (
        'Wymiarki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żagański'
            LIMIT 1
        )
    ), (
        'Żagań (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żagański'
            LIMIT 1
        )
    ), (
        'Łęknica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Żary', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Brody (gmina w województwie lubuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Jasień', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Lipinki Łużyckie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Lubsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Przewóz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Trzebiel', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Tuplice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Żary (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żarski'
            LIMIT 1
        )
    ), (
        'Sława', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wschowski'
            LIMIT 1
        )
    ), (
        'Szlichtyngowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wschowski'
            LIMIT 1
        )
    ), (
        'Wschowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wschowski'
            LIMIT 1
        )
    ), (
        'Gorzów Wielkopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Gorzów Wielkopolski'
            LIMIT 1
        )
    ), (
        'Zielona Góra', (
            SELECT id
            FROM powiaty
            WHERE name = 'Zielona Góra'
            LIMIT 1
        )
    ), (
        'Bełchatów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bełchatowski'
            LIMIT 1
        )
    ), (
        'Bełchatów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bełchatowski'
            LIMIT 1
        )
    ), (
        'Drużbice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bełchatowski'
            LIMIT 1
        )
    ), (
        'Kleszczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bełchatowski'
            LIMIT 1
        )
    ), (
        'Kluki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bełchatowski'
            LIMIT 1
        )
    ), (
        'Rusiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bełchatowski'
            LIMIT 1
        )
    ), (
        'Szczerców', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bełchatowski'
            LIMIT 1
        )
    ), (
        'Zelów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bełchatowski'
            LIMIT 1
        )
    ), (
        'Kutno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Bedlno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Dąbrowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Krośniewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Krzyżanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Kutno (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Łanięta', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Nowe Ostrowy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Oporów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Strzelce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Żychlin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kutnowski'
            LIMIT 1
        )
    ), (
        'Buczek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łaski'
            LIMIT 1
        )
    ), (
        'Łask', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łaski'
            LIMIT 1
        )
    ), (
        'Sędziejowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łaski'
            LIMIT 1
        )
    ), (
        'Widawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łaski'
            LIMIT 1
        )
    ), (
        'Wodzierady', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łaski'
            LIMIT 1
        )
    ), (
        'Łęczyca', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczycki'
            LIMIT 1
        )
    ), (
        'Daszyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczycki'
            LIMIT 1
        )
    ), (
        'Góra Świętej Małgorzaty', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczycki'
            LIMIT 1
        )
    ), (
        'Grabów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczycki'
            LIMIT 1
        )
    ), (
        'Łęczyca (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczycki'
            LIMIT 1
        )
    ), (
        'Piątek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczycki'
            LIMIT 1
        )
    ), (
        'Świnice Warckie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczycki'
            LIMIT 1
        )
    ), (
        'Witonia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łęczycki'
            LIMIT 1
        )
    ), (
        'Łowicz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Bielawy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Chąśno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Domaniewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Kiernozia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Kocierzew Południowy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Łowicz (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Łyszkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Nieborów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Zduny (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łowicki'
            LIMIT 1
        )
    ), (
        'Andrespol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łódzki wschodni'
            LIMIT 1
        )
    ), (
        'Brójce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łódzki wschodni'
            LIMIT 1
        )
    ), (
        'Koluszki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łódzki wschodni'
            LIMIT 1
        )
    ), (
        'Nowosolna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łódzki wschodni'
            LIMIT 1
        )
    ), (
        'Rzgów (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łódzki wschodni'
            LIMIT 1
        )
    ), (
        'Tuszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łódzki wschodni'
            LIMIT 1
        )
    ), (
        'Białaczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opoczyński'
            LIMIT 1
        )
    ), (
        'Drzewica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opoczyński'
            LIMIT 1
        )
    ), (
        'Mniszków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opoczyński'
            LIMIT 1
        )
    ), (
        'Opoczno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opoczyński'
            LIMIT 1
        )
    ), (
        'Paradyż', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opoczyński'
            LIMIT 1
        )
    ), (
        'Poświętne (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opoczyński'
            LIMIT 1
        )
    ), (
        'Sławno (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opoczyński'
            LIMIT 1
        )
    ), (
        'Żarnów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opoczyński'
            LIMIT 1
        )
    ), (
        'Konstantynów Łódzki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pabianicki'
            LIMIT 1
        )
    ), (
        'Pabianice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pabianicki'
            LIMIT 1
        )
    ), (
        'Dłutów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pabianicki'
            LIMIT 1
        )
    ), (
        'Dobroń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pabianicki'
            LIMIT 1
        )
    ), (
        'Ksawerów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pabianicki'
            LIMIT 1
        )
    ), (
        'Lutomiersk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pabianicki'
            LIMIT 1
        )
    ), (
        'Pabianice (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pabianicki'
            LIMIT 1
        )
    ), (
        'Działoszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pajęczański'
            LIMIT 1
        )
    ), (
        'Kiełczygłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pajęczański'
            LIMIT 1
        )
    ), (
        'Nowa Brzeźnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pajęczański'
            LIMIT 1
        )
    ), (
        'Pajęczno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pajęczański'
            LIMIT 1
        )
    ), (
        'Rząśnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pajęczański'
            LIMIT 1
        )
    ), (
        'Siemkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pajęczański'
            LIMIT 1
        )
    ), (
        'Strzelce Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pajęczański'
            LIMIT 1
        )
    ), (
        'Sulmierzyce (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pajęczański'
            LIMIT 1
        )
    ), (
        'Aleksandrów (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Czarnocin (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Gorzkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Grabica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Łęki Szlacheckie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Moszczenica (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Ręczno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Rozprza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Sulejów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Wola Krzysztoporska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Wolbórz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piotrkowski'
            LIMIT 1
        )
    ), (
        'Dalików', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poddębicki'
            LIMIT 1
        )
    ), (
        'Pęczniew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poddębicki'
            LIMIT 1
        )
    ), (
        'Poddębice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poddębicki'
            LIMIT 1
        )
    ), (
        'Uniejów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poddębicki'
            LIMIT 1
        )
    ), (
        'Wartkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poddębicki'
            LIMIT 1
        )
    ), (
        'Zadzim', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poddębicki'
            LIMIT 1
        )
    ), (
        'Radomsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Dobryszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Gidle', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Gomunice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Kamieńsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Kobiele Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Kodrąb', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Lgota Wielka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Ładzice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Masłowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Przedbórz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Radomsko (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Wielgomłyny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Żytno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomszczański'
            LIMIT 1
        )
    ), (
        'Rawa Mazowiecka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawski'
            LIMIT 1
        )
    ), (
        'Biała Rawska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawski'
            LIMIT 1
        )
    ), (
        'Cielądz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawski'
            LIMIT 1
        )
    ), (
        'Rawa Mazowiecka (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawski'
            LIMIT 1
        )
    ), (
        'Regnów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawski'
            LIMIT 1
        )
    ), (
        'Sadkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawski'
            LIMIT 1
        )
    ), (
        'Sieradz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Błaszki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Brąszewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Brzeźnio', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Burzenin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Goszczanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Klonowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Sieradz (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Warta', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Wróblew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Złoczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sieradzki'
            LIMIT 1
        )
    ), (
        'Bolimów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skierniewicki'
            LIMIT 1
        )
    ), (
        'Głuchów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skierniewicki'
            LIMIT 1
        )
    ), (
        'Godzianów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skierniewicki'
            LIMIT 1
        )
    ), (
        'Kowiesy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skierniewicki'
            LIMIT 1
        )
    ), (
        'Lipce Reymontowskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skierniewicki'
            LIMIT 1
        )
    ), (
        'Maków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skierniewicki'
            LIMIT 1
        )
    ), (
        'Nowy Kawęczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skierniewicki'
            LIMIT 1
        )
    ), (
        'Skierniewice (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skierniewicki'
            LIMIT 1
        )
    ), (
        'Słupia (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skierniewicki'
            LIMIT 1
        )
    ), (
        'Tomaszów Mazowiecki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Będków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Budziszewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Czerniewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Inowłódz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Lubochnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Rokiciny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Rzeczyca', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Tomaszów Mazowiecki (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Ujazd (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Żelechlinek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tomaszowski (województwo łódzkie)'
            LIMIT 1
        )
    ), (
        'Biała (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Czarnożyły', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Konopnica (gmina w województwie lubelskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Mokrsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Osjaków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Ostrówek (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Pątnów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Skomlin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Wieluń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Wierzchlas', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieluński'
            LIMIT 1
        )
    ), (
        'Bolesławiec (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieruszowski'
            LIMIT 1
        )
    ), (
        'Czastary', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieruszowski'
            LIMIT 1
        )
    ), (
        'Galewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieruszowski'
            LIMIT 1
        )
    ), (
        'Lututów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieruszowski'
            LIMIT 1
        )
    ), (
        'Łubnice (gmina w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieruszowski'
            LIMIT 1
        )
    ), (
        'Sokolniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieruszowski'
            LIMIT 1
        )
    ), (
        'Wieruszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wieruszowski'
            LIMIT 1
        )
    ), (
        'Zduńska Wola', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zduńskowolski'
            LIMIT 1
        )
    ), (
        'Szadek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zduńskowolski'
            LIMIT 1
        )
    ), (
        'Zapolice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zduńskowolski'
            LIMIT 1
        )
    ), (
        'Zduńska Wola (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zduńskowolski'
            LIMIT 1
        )
    ), (
        'Głowno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgierski'
            LIMIT 1
        )
    ), (
        'Ozorków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgierski'
            LIMIT 1
        )
    ), (
        'Zgierz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgierski'
            LIMIT 1
        )
    ), (
        'Aleksandrów Łódzki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgierski'
            LIMIT 1
        )
    ), (
        'Głowno (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgierski'
            LIMIT 1
        )
    ), (
        'Ozorków (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgierski'
            LIMIT 1
        )
    ), (
        'Parzęczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgierski'
            LIMIT 1
        )
    ), (
        'Stryków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgierski'
            LIMIT 1
        )
    ), (
        'Zgierz (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zgierski'
            LIMIT 1
        )
    ), (
        'Brzeziny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeziński'
            LIMIT 1
        )
    ), (
        'Brzeziny (gmina wiejska w województwie łódzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeziński'
            LIMIT 1
        )
    ), (
        'Dmosin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeziński'
            LIMIT 1
        )
    ), (
        'Jeżów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeziński'
            LIMIT 1
        )
    ), (
        'Rogów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeziński'
            LIMIT 1
        )
    ), (
        'Łódź', (
            SELECT id
            FROM powiaty
            WHERE name = 'Łódź'
            LIMIT 1
        )
    ), (
        'Piotrków Trybunalski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Piotrków Trybunalski'
            LIMIT 1
        )
    ), (
        'Skierniewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Skierniewice'
            LIMIT 1
        )
    ), (
        'Bochnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bocheński'
            LIMIT 1
        )
    ), (
        'Bochnia (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bocheński'
            LIMIT 1
        )
    ), (
        'Drwinia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bocheński'
            LIMIT 1
        )
    ), (
        'Lipnica Murowana', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bocheński'
            LIMIT 1
        )
    ), (
        'Łapanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bocheński'
            LIMIT 1
        )
    ), (
        'Nowy Wiśnicz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bocheński'
            LIMIT 1
        )
    ), (
        'Rzezawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bocheński'
            LIMIT 1
        )
    ), (
        'Trzciana', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bocheński'
            LIMIT 1
        )
    ), (
        'Żegocina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bocheński'
            LIMIT 1
        )
    ), (
        'Borzęcin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo małopolskie)'
            LIMIT 1
        )
    ), (
        'Brzesko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo małopolskie)'
            LIMIT 1
        )
    ), (
        'Czchów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo małopolskie)'
            LIMIT 1
        )
    ), (
        'Dębno (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo małopolskie)'
            LIMIT 1
        )
    ), (
        'Gnojnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo małopolskie)'
            LIMIT 1
        )
    ), (
        'Iwkowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo małopolskie)'
            LIMIT 1
        )
    ), (
        'Szczurowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo małopolskie)'
            LIMIT 1
        )
    ), (
        'Alwernia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chrzanowski'
            LIMIT 1
        )
    ), (
        'Babice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chrzanowski'
            LIMIT 1
        )
    ), (
        'Chrzanów (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chrzanowski'
            LIMIT 1
        )
    ), (
        'Libiąż', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chrzanowski'
            LIMIT 1
        )
    ), (
        'Trzebinia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chrzanowski'
            LIMIT 1
        )
    ), (
        'Bolesław (gmina w powiecie dąbrowskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dąbrowski'
            LIMIT 1
        )
    ), (
        'Dąbrowa Tarnowska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dąbrowski'
            LIMIT 1
        )
    ), (
        'Gręboszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dąbrowski'
            LIMIT 1
        )
    ), (
        'Mędrzechów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dąbrowski'
            LIMIT 1
        )
    ), (
        'Olesno (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dąbrowski'
            LIMIT 1
        )
    ), (
        'Radgoszcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dąbrowski'
            LIMIT 1
        )
    ), (
        'Szczucin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dąbrowski'
            LIMIT 1
        )
    ), (
        'Gorlice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Biecz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Bobowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Gorlice (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Lipinki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Łużna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Moszczenica (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Ropa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Sękowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Uście Gorlickie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gorlicki'
            LIMIT 1
        )
    ), (
        'Czernichów (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Igołomia-Wawrzeńczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Iwanowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Jerzmanowice-Przeginia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Kocmyrzów-Luborzyca', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Krzeszowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Liszki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Michałowice (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Mogilany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Skała', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Skawina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Słomniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Sułoszowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Świątniki Górne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Wielka Wieś', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Zabierzów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Zielonki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krakowski'
            LIMIT 1
        )
    ), (
        'Limanowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Mszana Dolna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Dobra (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Jodłownik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Kamienica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Laskowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Limanowa (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Łukowica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Mszana Dolna (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Niedźwiedź', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Słopnice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Tymbark', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat limanowski'
            LIMIT 1
        )
    ), (
        'Charsznica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miechowski'
            LIMIT 1
        )
    ), (
        'Gołcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miechowski'
            LIMIT 1
        )
    ), (
        'Kozłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miechowski'
            LIMIT 1
        )
    ), (
        'Książ Wielki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miechowski'
            LIMIT 1
        )
    ), (
        'Miechów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miechowski'
            LIMIT 1
        )
    ), (
        'Racławice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miechowski'
            LIMIT 1
        )
    ), (
        'Słaboszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miechowski'
            LIMIT 1
        )
    ), (
        'Dobczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myślenicki'
            LIMIT 1
        )
    ), (
        'Lubień', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myślenicki'
            LIMIT 1
        )
    ), (
        'Myślenice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myślenicki'
            LIMIT 1
        )
    ), (
        'Pcim', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myślenicki'
            LIMIT 1
        )
    ), (
        'Raciechowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myślenicki'
            LIMIT 1
        )
    ), (
        'Siepraw', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myślenicki'
            LIMIT 1
        )
    ), (
        'Sułkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myślenicki'
            LIMIT 1
        )
    ), (
        'Tokarnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myślenicki'
            LIMIT 1
        )
    ), (
        'Wiśniowa (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myślenicki'
            LIMIT 1
        )
    ), (
        'Grybów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Chełmiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Gródek nad Dunajcem', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Grybów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Kamionka Wielka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Korzenna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Krynica-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Łabowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Łącko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Łososina Dolna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Muszyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Nawojowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Piwniczna-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Podegrodzie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Rytro', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Stary Sącz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowosądecki'
            LIMIT 1
        )
    ), (
        'Nowy Targ', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Szczawnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Czarny Dunajec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Czorsztyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Jabłonka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Krościenko nad Dunajcem', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Lipnica Wielka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Łapsze Niżne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Nowy Targ (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Ochotnica Dolna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Raba Wyżna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Rabka-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Spytkowice (gmina w powiecie wadowickim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Szaflary', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotarski'
            LIMIT 1
        )
    ), (
        'Bukowno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olkuski'
            LIMIT 1
        )
    ), (
        'Bolesław (gmina w powiecie olkuskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olkuski'
            LIMIT 1
        )
    ), (
        'Klucze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olkuski'
            LIMIT 1
        )
    ), (
        'Olkusz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olkuski'
            LIMIT 1
        )
    ), (
        'Trzyciąż', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olkuski'
            LIMIT 1
        )
    ), (
        'Wolbrom', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olkuski'
            LIMIT 1
        )
    ), (
        'Oświęcim', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oświęcimski'
            LIMIT 1
        )
    ), (
        'Brzeszcze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oświęcimski'
            LIMIT 1
        )
    ), (
        'Chełmek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oświęcimski'
            LIMIT 1
        )
    ), (
        'Kęty', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oświęcimski'
            LIMIT 1
        )
    ), (
        'Osiek (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oświęcimski'
            LIMIT 1
        )
    ), (
        'Oświęcim (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oświęcimski'
            LIMIT 1
        )
    ), (
        'Polanka Wielka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oświęcimski'
            LIMIT 1
        )
    ), (
        'Przeciszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oświęcimski'
            LIMIT 1
        )
    ), (
        'Zator', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oświęcimski'
            LIMIT 1
        )
    ), (
        'Koniusza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat proszowicki'
            LIMIT 1
        )
    ), (
        'Koszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat proszowicki'
            LIMIT 1
        )
    ), (
        'Nowe Brzesko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat proszowicki'
            LIMIT 1
        )
    ), (
        'Pałecznica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat proszowicki'
            LIMIT 1
        )
    ), (
        'Proszowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat proszowicki'
            LIMIT 1
        )
    ), (
        'Radziemice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat proszowicki'
            LIMIT 1
        )
    ), (
        'Jordanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suski'
            LIMIT 1
        )
    ), (
        'Sucha Beskidzka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suski'
            LIMIT 1
        )
    ), (
        'Budzów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suski'
            LIMIT 1
        )
    ), (
        'Bystra-Sidzina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suski'
            LIMIT 1
        )
    ), (
        'Jordanów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suski'
            LIMIT 1
        )
    ), (
        'Maków Podhalański', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suski'
            LIMIT 1
        )
    ), (
        'Stryszawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suski'
            LIMIT 1
        )
    ), (
        'Zawoja', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suski'
            LIMIT 1
        )
    ), (
        'Zembrzyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suski'
            LIMIT 1
        )
    ), (
        'Ciężkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Gromnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Lisia Góra', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Pleśna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Radłów (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Ryglice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Rzepiennik Strzyżewski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Skrzyszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Tarnów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Tuchów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Wierzchosławice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Wietrzychowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Wojnicz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Zakliczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Żabno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Szerzyny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnowski'
            LIMIT 1
        )
    ), (
        'Zakopane', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tatrzański'
            LIMIT 1
        )
    ), (
        'Biały Dunajec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tatrzański'
            LIMIT 1
        )
    ), (
        'Bukowina Tatrzańska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tatrzański'
            LIMIT 1
        )
    ), (
        'Kościelisko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tatrzański'
            LIMIT 1
        )
    ), (
        'Poronin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tatrzański'
            LIMIT 1
        )
    ), (
        'Andrychów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Brzeźnica (gmina w województwie małopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Kalwaria Zebrzydowska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Lanckorona', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Mucharz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Spytkowice (gmina w powiecie wadowickim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Stryszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Tomice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Wadowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Wieprz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wadowicki'
            LIMIT 1
        )
    ), (
        'Biskupice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wielicki'
            LIMIT 1
        )
    ), (
        'Gdów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wielicki'
            LIMIT 1
        )
    ), (
        'Kłaj', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wielicki'
            LIMIT 1
        )
    ), (
        'Niepołomice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wielicki'
            LIMIT 1
        )
    ), (
        'Wieliczka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wielicki'
            LIMIT 1
        )
    ), (
        'Kraków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Kraków'
            LIMIT 1
        )
    ), (
        'Nowy Sącz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Nowy Sącz'
            LIMIT 1
        )
    ), (
        'Tarnów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Tarnów'
            LIMIT 1
        )
    ), (
        'Białobrzegi (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białobrzeski'
            LIMIT 1
        )
    ), (
        'Promna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białobrzeski'
            LIMIT 1
        )
    ), (
        'Radzanów (gmina w powiecie białobrzeskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białobrzeski'
            LIMIT 1
        )
    ), (
        'Stara Błotnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białobrzeski'
            LIMIT 1
        )
    ), (
        'Stromiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białobrzeski'
            LIMIT 1
        )
    ), (
        'Wyśmierzyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białobrzeski'
            LIMIT 1
        )
    ), (
        'Ciechanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ciechanowski'
            LIMIT 1
        )
    ), (
        'Ciechanów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ciechanowski'
            LIMIT 1
        )
    ), (
        'Glinojeck', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ciechanowski'
            LIMIT 1
        )
    ), (
        'Gołymin-Ośrodek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ciechanowski'
            LIMIT 1
        )
    ), (
        'Grudusk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ciechanowski'
            LIMIT 1
        )
    ), (
        'Ojrzeń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ciechanowski'
            LIMIT 1
        )
    ), (
        'Opinogóra Górna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ciechanowski'
            LIMIT 1
        )
    ), (
        'Regimin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ciechanowski'
            LIMIT 1
        )
    ), (
        'Sońsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ciechanowski'
            LIMIT 1
        )
    ), (
        'Garwolin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Łaskarzew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Borowie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Garwolin (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Górzno (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Łaskarzew (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Maciejowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Miastków Kościelny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Parysów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Pilawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Sobolew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Trojanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Wilga', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Żelechów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat garwoliński'
            LIMIT 1
        )
    ), (
        'Gostynin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyniński'
            LIMIT 1
        )
    ), (
        'Gostynin (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyniński'
            LIMIT 1
        )
    ), (
        'Pacyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyniński'
            LIMIT 1
        )
    ), (
        'Sanniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyniński'
            LIMIT 1
        )
    ), (
        'Szczawin Kościelny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyniński'
            LIMIT 1
        )
    ), (
        'Milanówek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Podkowa Leśna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Baranów (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Grodzisk Mazowiecki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Jaktorów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Żabia Wola', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Belsk Duży', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Błędów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Chynów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Goszczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Grójec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Jasieniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Mogielnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Nowe Miasto nad Pilicą', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Pniewy (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Warka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grójecki'
            LIMIT 1
        )
    ), (
        'Garbatka-Letnisko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kozienicki'
            LIMIT 1
        )
    ), (
        'Głowaczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kozienicki'
            LIMIT 1
        )
    ), (
        'Gniewoszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kozienicki'
            LIMIT 1
        )
    ), (
        'Grabów nad Pilicą', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kozienicki'
            LIMIT 1
        )
    ), (
        'Kozienice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kozienicki'
            LIMIT 1
        )
    ), (
        'Magnuszew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kozienicki'
            LIMIT 1
        )
    ), (
        'Sieciechów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kozienicki'
            LIMIT 1
        )
    ), (
        'Legionowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legionowski'
            LIMIT 1
        )
    ), (
        'Jabłonna (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legionowski'
            LIMIT 1
        )
    ), (
        'Nieporęt', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legionowski'
            LIMIT 1
        )
    ), (
        'Serock', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legionowski'
            LIMIT 1
        )
    ), (
        'Wieliszew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat legionowski'
            LIMIT 1
        )
    ), (
        'Chotcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipski'
            LIMIT 1
        )
    ), (
        'Ciepielów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipski'
            LIMIT 1
        )
    ), (
        'Lipsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipski'
            LIMIT 1
        )
    ), (
        'Rzeczniów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipski'
            LIMIT 1
        )
    ), (
        'Sienno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipski'
            LIMIT 1
        )
    ), (
        'Solec nad Wisłą', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lipski'
            LIMIT 1
        )
    ), (
        'Huszlew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łosicki'
            LIMIT 1
        )
    ), (
        'Łosice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łosicki'
            LIMIT 1
        )
    ), (
        'Olszanka (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łosicki'
            LIMIT 1
        )
    ), (
        'Platerów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łosicki'
            LIMIT 1
        )
    ), (
        'Sarnaki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łosicki'
            LIMIT 1
        )
    ), (
        'Stara Kornica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łosicki'
            LIMIT 1
        )
    ), (
        'Maków Mazowiecki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Czerwonka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Karniewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Krasnosielc', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Młynarze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Płoniawy-Bramura', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Różan', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Rzewnie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Sypniewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Szelków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat makowski'
            LIMIT 1
        )
    ), (
        'Mińsk Mazowiecki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Cegłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Dębe Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Dobre (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Halinów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Jakubów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Kałuszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Latowicz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Mińsk Mazowiecki (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Mrozy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Siennica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Stanisławów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Sulejówek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat miński'
            LIMIT 1
        )
    ), (
        'Mława', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Dzierzgowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Lipowiec Kościelny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Radzanów (gmina w powiecie mławskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Strzegowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Stupsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Szreńsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Szydłowo (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Wieczfnia Kościelna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Wiśniewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mławski'
            LIMIT 1
        )
    ), (
        'Nowy Dwór Mazowiecki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Czosnów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Leoncin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Nasielsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Pomiechówek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Zakroczym', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Baranowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Czarnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Czerwin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Goworowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Kadzidło', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Lelis', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Łyse', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Myszyniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Olszewo-Borki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Rzekuń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Troszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrołęcki'
            LIMIT 1
        )
    ), (
        'Ostrów Mazowiecka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Andrzejewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Boguty-Pianki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Brok', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Małkinia Górna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Nur', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Ostrów Mazowiecka (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Stary Lubotyń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Szulborze Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Wąsewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Zaręby Kościelne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo mazowieckie)'
            LIMIT 1
        )
    ), (
        'Józefów (powiat otwocki)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat otwocki'
            LIMIT 1
        )
    ), (
        'Otwock', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat otwocki'
            LIMIT 1
        )
    ), (
        'Celestynów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat otwocki'
            LIMIT 1
        )
    ), (
        'Karczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat otwocki'
            LIMIT 1
        )
    ), (
        'Kołbiel', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat otwocki'
            LIMIT 1
        )
    ), (
        'Osieck', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat otwocki'
            LIMIT 1
        )
    ), (
        'Sobienie-Jeziory', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat otwocki'
            LIMIT 1
        )
    ), (
        'Wiązowna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat otwocki'
            LIMIT 1
        )
    ), (
        'Góra Kalwaria', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piaseczyński'
            LIMIT 1
        )
    ), (
        'Konstancin-Jeziorna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piaseczyński'
            LIMIT 1
        )
    ), (
        'Lesznowola', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piaseczyński'
            LIMIT 1
        )
    ), (
        'Piaseczno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piaseczyński'
            LIMIT 1
        )
    ), (
        'Prażmów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piaseczyński'
            LIMIT 1
        )
    ), (
        'Tarczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piaseczyński'
            LIMIT 1
        )
    ), (
        'Bielsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Bodzanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Brudzeń Duży', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Bulkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Drobin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Gąbin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Łąck', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Mała Wieś', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Nowy Duninów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Radzanowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Słubice (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Słupno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Stara Biała', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Staroźreby', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Wyszogród', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płocki'
            LIMIT 1
        )
    ), (
        'Płońsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Raciąż', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Baboszewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Czerwińsk nad Wisłą', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Dzierzążnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Joniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Naruszewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Nowe Miasto', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Płońsk (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Raciąż (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Sochocin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Załuski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat płoński'
            LIMIT 1
        )
    ), (
        'Piastów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pruszkowski'
            LIMIT 1
        )
    ), (
        'Pruszków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pruszkowski'
            LIMIT 1
        )
    ), (
        'Brwinów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pruszkowski'
            LIMIT 1
        )
    ), (
        'Michałowice (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pruszkowski'
            LIMIT 1
        )
    ), (
        'Nadarzyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pruszkowski'
            LIMIT 1
        )
    ), (
        'Raszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pruszkowski'
            LIMIT 1
        )
    ), (
        'Przasnysz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przasnyski'
            LIMIT 1
        )
    ), (
        'Chorzele', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przasnyski'
            LIMIT 1
        )
    ), (
        'Czernice Borowe', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przasnyski'
            LIMIT 1
        )
    ), (
        'Jednorożec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przasnyski'
            LIMIT 1
        )
    ), (
        'Krasne (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przasnyski'
            LIMIT 1
        )
    ), (
        'Krzynowłoga Mała', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przasnyski'
            LIMIT 1
        )
    ), (
        'Przasnysz (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przasnyski'
            LIMIT 1
        )
    ), (
        'Borkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przysuski'
            LIMIT 1
        )
    ), (
        'Gielniów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przysuski'
            LIMIT 1
        )
    ), (
        'Klwów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przysuski'
            LIMIT 1
        )
    ), (
        'Odrzywół', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przysuski'
            LIMIT 1
        )
    ), (
        'Potworów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przysuski'
            LIMIT 1
        )
    ), (
        'Przysucha', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przysuski'
            LIMIT 1
        )
    ), (
        'Rusinów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przysuski'
            LIMIT 1
        )
    ), (
        'Wieniawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przysuski'
            LIMIT 1
        )
    ), (
        'Gzy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pułtuski'
            LIMIT 1
        )
    ), (
        'Obryte', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pułtuski'
            LIMIT 1
        )
    ), (
        'Pokrzywnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pułtuski'
            LIMIT 1
        )
    ), (
        'Pułtusk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pułtuski'
            LIMIT 1
        )
    ), (
        'Świercze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pułtuski'
            LIMIT 1
        )
    ), (
        'Winnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pułtuski'
            LIMIT 1
        )
    ), (
        'Zatory', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pułtuski'
            LIMIT 1
        )
    ), (
        'Pionki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Gózd', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Iłża', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Jastrzębia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Jedlińsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Jedlnia-Letnisko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Kowala', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Pionki (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Przytyk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Skaryszew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Wierzbica (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Wolanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Zakrzew (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat radomski'
            LIMIT 1
        )
    ), (
        'Domanice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Korczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Kotuń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Mokobody', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Mordy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Paprotnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Przesmyki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Siedlce (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Skórzec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Suchożebry', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Wiśniew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Wodynie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Zbuczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siedlecki'
            LIMIT 1
        )
    ), (
        'Sierpc', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sierpecki'
            LIMIT 1
        )
    ), (
        'Gozdowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sierpecki'
            LIMIT 1
        )
    ), (
        'Mochowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sierpecki'
            LIMIT 1
        )
    ), (
        'Rościszewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sierpecki'
            LIMIT 1
        )
    ), (
        'Sierpc (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sierpecki'
            LIMIT 1
        )
    ), (
        'Szczutowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sierpecki'
            LIMIT 1
        )
    ), (
        'Zawidz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sierpecki'
            LIMIT 1
        )
    ), (
        'Sochaczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sochaczewski'
            LIMIT 1
        )
    ), (
        'Brochów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sochaczewski'
            LIMIT 1
        )
    ), (
        'Iłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sochaczewski'
            LIMIT 1
        )
    ), (
        'Młodzieszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sochaczewski'
            LIMIT 1
        )
    ), (
        'Nowa Sucha', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sochaczewski'
            LIMIT 1
        )
    ), (
        'Rybno (gmina w województwie mazowieckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sochaczewski'
            LIMIT 1
        )
    ), (
        'Sochaczew (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sochaczewski'
            LIMIT 1
        )
    ), (
        'Teresin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sochaczewski'
            LIMIT 1
        )
    ), (
        'Sokołów Podlaski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokołowski'
            LIMIT 1
        )
    ), (
        'Bielany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokołowski'
            LIMIT 1
        )
    ), (
        'Ceranów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokołowski'
            LIMIT 1
        )
    ), (
        'Jabłonna Lacka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokołowski'
            LIMIT 1
        )
    ), (
        'Kosów Lacki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokołowski'
            LIMIT 1
        )
    ), (
        'Repki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokołowski'
            LIMIT 1
        )
    ), (
        'Sabnie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokołowski'
            LIMIT 1
        )
    ), (
        'Sokołów Podlaski (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokołowski'
            LIMIT 1
        )
    ), (
        'Sterdyń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokołowski'
            LIMIT 1
        )
    ), (
        'Chlewiska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szydłowiecki'
            LIMIT 1
        )
    ), (
        'Jastrząb', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szydłowiecki'
            LIMIT 1
        )
    ), (
        'Mirów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szydłowiecki'
            LIMIT 1
        )
    ), (
        'Orońsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szydłowiecki'
            LIMIT 1
        )
    ), (
        'Szydłowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szydłowiecki'
            LIMIT 1
        )
    ), (
        'Błonie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat warszawski zachodni'
            LIMIT 1
        )
    ), (
        'Izabelin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat warszawski zachodni'
            LIMIT 1
        )
    ), (
        'Kampinos', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat warszawski zachodni'
            LIMIT 1
        )
    ), (
        'Leszno (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat warszawski zachodni'
            LIMIT 1
        )
    ), (
        'Łomianki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat warszawski zachodni'
            LIMIT 1
        )
    ), (
        'Ożarów Mazowiecki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat warszawski zachodni'
            LIMIT 1
        )
    ), (
        'Stare Babice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat warszawski zachodni'
            LIMIT 1
        )
    ), (
        'Węgrów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgrowski'
            LIMIT 1
        )
    ), (
        'Grębków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgrowski'
            LIMIT 1
        )
    ), (
        'Korytnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgrowski'
            LIMIT 1
        )
    ), (
        'Liw', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgrowski'
            LIMIT 1
        )
    ), (
        'Łochów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgrowski'
            LIMIT 1
        )
    ), (
        'Miedzna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgrowski'
            LIMIT 1
        )
    ), (
        'Sadowne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgrowski'
            LIMIT 1
        )
    ), (
        'Stoczek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgrowski'
            LIMIT 1
        )
    ), (
        'Wierzbno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgrowski'
            LIMIT 1
        )
    ), (
        'Kobyłka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Marki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Ząbki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Zielonka (powiat wołomiński)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Dąbrówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Jadów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Klembów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Poświętne (gmina w województwie podlaskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Radzymin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Strachówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Tłuszcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Wołomin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wołomiński'
            LIMIT 1
        )
    ), (
        'Brańszczyk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wyszkowski'
            LIMIT 1
        )
    ), (
        'Długosiodło', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wyszkowski'
            LIMIT 1
        )
    ), (
        'Rząśnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wyszkowski'
            LIMIT 1
        )
    ), (
        'Somianka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wyszkowski'
            LIMIT 1
        )
    ), (
        'Wyszków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wyszkowski'
            LIMIT 1
        )
    ), (
        'Zabrodzie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wyszkowski'
            LIMIT 1
        )
    ), (
        'Kazanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zwoleński'
            LIMIT 1
        )
    ), (
        'Policzna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zwoleński'
            LIMIT 1
        )
    ), (
        'Przyłęk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zwoleński'
            LIMIT 1
        )
    ), (
        'Tczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zwoleński'
            LIMIT 1
        )
    ), (
        'Zwoleń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zwoleński'
            LIMIT 1
        )
    ), (
        'Bieżuń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żuromiński'
            LIMIT 1
        )
    ), (
        'Kuczbork-Osada', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żuromiński'
            LIMIT 1
        )
    ), (
        'Lubowidz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żuromiński'
            LIMIT 1
        )
    ), (
        'Lutocin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żuromiński'
            LIMIT 1
        )
    ), (
        'Siemiątkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żuromiński'
            LIMIT 1
        )
    ), (
        'Żuromin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żuromiński'
            LIMIT 1
        )
    ), (
        'Żyrardów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żyrardowski'
            LIMIT 1
        )
    ), (
        'Mszczonów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żyrardowski'
            LIMIT 1
        )
    ), (
        'Puszcza Mariańska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żyrardowski'
            LIMIT 1
        )
    ), (
        'Radziejowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żyrardowski'
            LIMIT 1
        )
    ), (
        'Wiskitki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żyrardowski'
            LIMIT 1
        )
    ), (
        'Ostrołęka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Ostrołęka'
            LIMIT 1
        )
    ), (
        'Płock', (
            SELECT id
            FROM powiaty
            WHERE name = 'Płock'
            LIMIT 1
        )
    ), (
        'Radom', (
            SELECT id
            FROM powiaty
            WHERE name = 'Radom'
            LIMIT 1
        )
    ), (
        'Siedlce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Siedlce'
            LIMIT 1
        )
    ), (
        'Warszawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Warszawa'
            LIMIT 1
        )
    ), (
        'Brzeg (miasto)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Skarbimierz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Grodków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Lewin Brzeski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Lubsza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Olszanka (gmina w województwie opolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzeski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Baborów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głubczycki'
            LIMIT 1
        )
    ), (
        'Branice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głubczycki'
            LIMIT 1
        )
    ), (
        'Głubczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głubczycki'
            LIMIT 1
        )
    ), (
        'Kietrz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat głubczycki'
            LIMIT 1
        )
    ), (
        'Kędzierzyn-Koźle', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kędzierzyńsko-kozielski'
            LIMIT 1
        )
    ), (
        'Bierawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kędzierzyńsko-kozielski'
            LIMIT 1
        )
    ), (
        'Cisek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kędzierzyńsko-kozielski'
            LIMIT 1
        )
    ), (
        'Pawłowiczki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kędzierzyńsko-kozielski'
            LIMIT 1
        )
    ), (
        'Polska Cerekiew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kędzierzyńsko-kozielski'
            LIMIT 1
        )
    ), (
        'Reńska Wieś', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kędzierzyńsko-kozielski'
            LIMIT 1
        )
    ), (
        'Byczyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kluczborski'
            LIMIT 1
        )
    ), (
        'Kluczbork', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kluczborski'
            LIMIT 1
        )
    ), (
        'Lasowice Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kluczborski'
            LIMIT 1
        )
    ), (
        'Wołczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kluczborski'
            LIMIT 1
        )
    ), (
        'Gogolin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krapkowicki'
            LIMIT 1
        )
    ), (
        'Krapkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krapkowicki'
            LIMIT 1
        )
    ), (
        'Strzeleczki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krapkowicki'
            LIMIT 1
        )
    ), (
        'Walce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krapkowicki'
            LIMIT 1
        )
    ), (
        'Zdzieszowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krapkowicki'
            LIMIT 1
        )
    ), (
        'Domaszowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat namysłowski'
            LIMIT 1
        )
    ), (
        'Namysłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat namysłowski'
            LIMIT 1
        )
    ), (
        'Pokój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat namysłowski'
            LIMIT 1
        )
    ), (
        'Świerczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat namysłowski'
            LIMIT 1
        )
    ), (
        'Wilków (gmina w województwie opolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat namysłowski'
            LIMIT 1
        )
    ), (
        'Głuchołazy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nyski'
            LIMIT 1
        )
    ), (
        'Kamiennik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nyski'
            LIMIT 1
        )
    ), (
        'Korfantów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nyski'
            LIMIT 1
        )
    ), (
        'Łambinowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nyski'
            LIMIT 1
        )
    ), (
        'Nysa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nyski'
            LIMIT 1
        )
    ), (
        'Otmuchów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nyski'
            LIMIT 1
        )
    ), (
        'Paczków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nyski'
            LIMIT 1
        )
    ), (
        'Pakosławice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nyski'
            LIMIT 1
        )
    ), (
        'Skoroszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nyski'
            LIMIT 1
        )
    ), (
        'Dobrodzień', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleski'
            LIMIT 1
        )
    ), (
        'Gorzów Śląski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleski'
            LIMIT 1
        )
    ), (
        'Olesno (gmina w województwie opolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleski'
            LIMIT 1
        )
    ), (
        'Praszka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleski'
            LIMIT 1
        )
    ), (
        'Radłów (gmina w województwie opolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleski'
            LIMIT 1
        )
    ), (
        'Rudniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleski'
            LIMIT 1
        )
    ), (
        'Zębowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat oleski'
            LIMIT 1
        )
    ), (
        'Chrząstowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Dąbrowa (gmina w województwie opolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Dobrzeń Wielki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Komprachcice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Łubniany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Murów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Niemodlin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Ozimek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Popielów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Prószków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Tarnów Opolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Tułowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Turawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opolski (województwo opolskie)'
            LIMIT 1
        )
    ), (
        'Biała (gmina w województwie opolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat prudnicki'
            LIMIT 1
        )
    ), (
        'Głogówek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat prudnicki'
            LIMIT 1
        )
    ), (
        'Lubrza (gmina w województwie opolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat prudnicki'
            LIMIT 1
        )
    ), (
        'Prudnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat prudnicki'
            LIMIT 1
        )
    ), (
        'Izbicko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecki'
            LIMIT 1
        )
    ), (
        'Jemielnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecki'
            LIMIT 1
        )
    ), (
        'Kolonowskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecki'
            LIMIT 1
        )
    ), (
        'Leśnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecki'
            LIMIT 1
        )
    ), (
        'Strzelce Opolskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecki'
            LIMIT 1
        )
    ), (
        'Ujazd (gmina w województwie opolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecki'
            LIMIT 1
        )
    ), (
        'Zawadzkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzelecki'
            LIMIT 1
        )
    ), (
        'Opole', (
            SELECT id
            FROM powiaty
            WHERE name = 'Opole'
            LIMIT 1
        )
    ), (
        'Czarna (gmina w powiecie bieszczadzkim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bieszczadzki'
            LIMIT 1
        )
    ), (
        'Lutowiska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bieszczadzki'
            LIMIT 1
        )
    ), (
        'Ustrzyki Dolne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bieszczadzki'
            LIMIT 1
        )
    ), (
        'Brzozów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzozowski'
            LIMIT 1
        )
    ), (
        'Domaradz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzozowski'
            LIMIT 1
        )
    ), (
        'Dydnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzozowski'
            LIMIT 1
        )
    ), (
        'Haczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzozowski'
            LIMIT 1
        )
    ), (
        'Jasienica Rosielna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzozowski'
            LIMIT 1
        )
    ), (
        'Nozdrzec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat brzozowski'
            LIMIT 1
        )
    ), (
        'Dębica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dębicki'
            LIMIT 1
        )
    ), (
        'Brzostek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dębicki'
            LIMIT 1
        )
    ), (
        'Czarna (gmina w powiecie dębickim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dębicki'
            LIMIT 1
        )
    ), (
        'Dębica (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dębicki'
            LIMIT 1
        )
    ), (
        'Jodłowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dębicki'
            LIMIT 1
        )
    ), (
        'Pilzno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dębicki'
            LIMIT 1
        )
    ), (
        'Żyraków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat dębicki'
            LIMIT 1
        )
    ), (
        'Jarosław (województwo podkarpackie)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Radymno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Chłopice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Jarosław (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Laszki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Pawłosiów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Pruchnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Radymno (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Rokietnica (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Roźwienica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Wiązownica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarosławski'
            LIMIT 1
        )
    ), (
        'Jasło', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Brzyska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Dębowiec (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Jasło (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Kołaczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Krempna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Nowy Żmigród', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Osiek Jasielski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Skołyszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Tarnowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jasielski'
            LIMIT 1
        )
    ), (
        'Cmolas', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolbuszowski'
            LIMIT 1
        )
    ), (
        'Kolbuszowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolbuszowski'
            LIMIT 1
        )
    ), (
        'Majdan Królewski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolbuszowski'
            LIMIT 1
        )
    ), (
        'Niwiska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolbuszowski'
            LIMIT 1
        )
    ), (
        'Raniżów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolbuszowski'
            LIMIT 1
        )
    ), (
        'Dzikowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolbuszowski'
            LIMIT 1
        )
    ), (
        'Chorkówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Dukla', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Iwonicz-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Jedlicze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Korczyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Krościenko Wyżne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Miejsce Piastowe', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Rymanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Wojaszówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Jaśliska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krośnieński (województwo podkarpackie)'
            LIMIT 1
        )
    ), (
        'Leżajsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leżajski'
            LIMIT 1
        )
    ), (
        'Grodzisko Dolne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leżajski'
            LIMIT 1
        )
    ), (
        'Kuryłówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leżajski'
            LIMIT 1
        )
    ), (
        'Leżajsk (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leżajski'
            LIMIT 1
        )
    ), (
        'Nowa Sarzyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leżajski'
            LIMIT 1
        )
    ), (
        'Lubaczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubaczowski'
            LIMIT 1
        )
    ), (
        'Cieszanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubaczowski'
            LIMIT 1
        )
    ), (
        'Horyniec-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubaczowski'
            LIMIT 1
        )
    ), (
        'Lubaczów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubaczowski'
            LIMIT 1
        )
    ), (
        'Narol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubaczowski'
            LIMIT 1
        )
    ), (
        'Oleszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubaczowski'
            LIMIT 1
        )
    ), (
        'Stary Dzików', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubaczowski'
            LIMIT 1
        )
    ), (
        'Wielkie Oczy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubaczowski'
            LIMIT 1
        )
    ), (
        'Łańcut', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łańcucki'
            LIMIT 1
        )
    ), (
        'Białobrzegi (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łańcucki'
            LIMIT 1
        )
    ), (
        'Czarna (gmina w powiecie łańcuckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łańcucki'
            LIMIT 1
        )
    ), (
        'Łańcut (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łańcucki'
            LIMIT 1
        )
    ), (
        'Markowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łańcucki'
            LIMIT 1
        )
    ), (
        'Rakszawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łańcucki'
            LIMIT 1
        )
    ), (
        'Żołynia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łańcucki'
            LIMIT 1
        )
    ), (
        'Mielec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Borowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Czermin (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Gawłuszowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Mielec (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Padew Narodowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Przecław', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Radomyśl Wielki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Tuszów Narodowy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Wadowice Górne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mielecki'
            LIMIT 1
        )
    ), (
        'Harasiuki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat niżański'
            LIMIT 1
        )
    ), (
        'Jarocin (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat niżański'
            LIMIT 1
        )
    ), (
        'Jeżowe', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat niżański'
            LIMIT 1
        )
    ), (
        'Krzeszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat niżański'
            LIMIT 1
        )
    ), (
        'Nisko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat niżański'
            LIMIT 1
        )
    ), (
        'Rudnik nad Sanem', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat niżański'
            LIMIT 1
        )
    ), (
        'Ulanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat niżański'
            LIMIT 1
        )
    ), (
        'Bircza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Dubiecko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Fredropol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Krasiczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Krzywcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Medyka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Orły', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Przemyśl (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Stubno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Żurawica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przemyski'
            LIMIT 1
        )
    ), (
        'Przeworsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przeworski'
            LIMIT 1
        )
    ), (
        'Adamówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przeworski'
            LIMIT 1
        )
    ), (
        'Gać', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przeworski'
            LIMIT 1
        )
    ), (
        'Jawornik Polski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przeworski'
            LIMIT 1
        )
    ), (
        'Kańczuga', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przeworski'
            LIMIT 1
        )
    ), (
        'Przeworsk (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przeworski'
            LIMIT 1
        )
    ), (
        'Sieniawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przeworski'
            LIMIT 1
        )
    ), (
        'Tryńcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przeworski'
            LIMIT 1
        )
    ), (
        'Zarzecze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat przeworski'
            LIMIT 1
        )
    ), (
        'Iwierzyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ropczycko-sędziszowski'
            LIMIT 1
        )
    ), (
        'Ostrów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ropczycko-sędziszowski'
            LIMIT 1
        )
    ), (
        'Ropczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ropczycko-sędziszowski'
            LIMIT 1
        )
    ), (
        'Sędziszów Małopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ropczycko-sędziszowski'
            LIMIT 1
        )
    ), (
        'Wielopole Skrzyńskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ropczycko-sędziszowski'
            LIMIT 1
        )
    ), (
        'Dynów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Błażowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Boguchwała', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Chmielnik (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Dynów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Głogów Małopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Hyżne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Kamień (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Krasne (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Lubenia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Sokołów Małopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Świlcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Trzebownisko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Tyczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rzeszowski'
            LIMIT 1
        )
    ), (
        'Sanok', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sanocki'
            LIMIT 1
        )
    ), (
        'Besko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sanocki'
            LIMIT 1
        )
    ), (
        'Bukowsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sanocki'
            LIMIT 1
        )
    ), (
        'Komańcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sanocki'
            LIMIT 1
        )
    ), (
        'Sanok (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sanocki'
            LIMIT 1
        )
    ), (
        'Tyrawa Wołoska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sanocki'
            LIMIT 1
        )
    ), (
        'Zagórz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sanocki'
            LIMIT 1
        )
    ), (
        'Zarszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sanocki'
            LIMIT 1
        )
    ), (
        'Stalowa Wola', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stalowowolski'
            LIMIT 1
        )
    ), (
        'Bojanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stalowowolski'
            LIMIT 1
        )
    ), (
        'Pysznica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stalowowolski'
            LIMIT 1
        )
    ), (
        'Radomyśl nad Sanem', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stalowowolski'
            LIMIT 1
        )
    ), (
        'Zaklików', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stalowowolski'
            LIMIT 1
        )
    ), (
        'Zaleszany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stalowowolski'
            LIMIT 1
        )
    ), (
        'Czudec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzyżowski'
            LIMIT 1
        )
    ), (
        'Frysztak', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzyżowski'
            LIMIT 1
        )
    ), (
        'Niebylec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzyżowski'
            LIMIT 1
        )
    ), (
        'Strzyżów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzyżowski'
            LIMIT 1
        )
    ), (
        'Wiśniowa (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat strzyżowski'
            LIMIT 1
        )
    ), (
        'Baranów Sandomierski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnobrzeski'
            LIMIT 1
        )
    ), (
        'Gorzyce (gmina w województwie podkarpackim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnobrzeski'
            LIMIT 1
        )
    ), (
        'Grębów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnobrzeski'
            LIMIT 1
        )
    ), (
        'Nowa Dęba', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnobrzeski'
            LIMIT 1
        )
    ), (
        'Baligród', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leski'
            LIMIT 1
        )
    ), (
        'Cisna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leski'
            LIMIT 1
        )
    ), (
        'Lesko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leski'
            LIMIT 1
        )
    ), (
        'Olszanica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leski'
            LIMIT 1
        )
    ), (
        'Solina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leski'
            LIMIT 1
        )
    ), (
        'Krosno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Krosno'
            LIMIT 1
        )
    ), (
        'Przemyśl', (
            SELECT id
            FROM powiaty
            WHERE name = 'Przemyśl'
            LIMIT 1
        )
    ), (
        'Rzeszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Rzeszów'
            LIMIT 1
        )
    ), (
        'Tarnobrzeg', (
            SELECT id
            FROM powiaty
            WHERE name = 'Tarnobrzeg'
            LIMIT 1
        )
    ), (
        'Augustów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat augustowski'
            LIMIT 1
        )
    ), (
        'Augustów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat augustowski'
            LIMIT 1
        )
    ), (
        'Bargłów Kościelny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat augustowski'
            LIMIT 1
        )
    ), (
        'Lipsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat augustowski'
            LIMIT 1
        )
    ), (
        'Nowinka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat augustowski'
            LIMIT 1
        )
    ), (
        'Płaska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat augustowski'
            LIMIT 1
        )
    ), (
        'Sztabin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat augustowski'
            LIMIT 1
        )
    ), (
        'Choroszcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Czarna Białostocka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Dobrzyniewo Duże', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Gródek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Juchnowiec Kościelny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Łapy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Michałowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Poświętne (gmina w województwie podlaskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Supraśl', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Suraż', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Turośń Kościelna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Tykocin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Wasilków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Zabłudów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Zawady', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białostocki'
            LIMIT 1
        )
    ), (
        'Bielsk Podlaski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo podlaskie)'
            LIMIT 1
        )
    ), (
        'Brańsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo podlaskie)'
            LIMIT 1
        )
    ), (
        'Bielsk Podlaski (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo podlaskie)'
            LIMIT 1
        )
    ), (
        'Boćki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo podlaskie)'
            LIMIT 1
        )
    ), (
        'Brańsk (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo podlaskie)'
            LIMIT 1
        )
    ), (
        'Orla', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo podlaskie)'
            LIMIT 1
        )
    ), (
        'Rudka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo podlaskie)'
            LIMIT 1
        )
    ), (
        'Wyszki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo podlaskie)'
            LIMIT 1
        )
    ), (
        'Grajewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grajewski'
            LIMIT 1
        )
    ), (
        'Grajewo (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grajewski'
            LIMIT 1
        )
    ), (
        'Radziłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grajewski'
            LIMIT 1
        )
    ), (
        'Rajgród', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grajewski'
            LIMIT 1
        )
    ), (
        'Szczuczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grajewski'
            LIMIT 1
        )
    ), (
        'Wąsosz (gmina w województwie podlaskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grajewski'
            LIMIT 1
        )
    ), (
        'Hajnówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hajnowski'
            LIMIT 1
        )
    ), (
        'Białowieża', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hajnowski'
            LIMIT 1
        )
    ), (
        'Czeremcha', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hajnowski'
            LIMIT 1
        )
    ), (
        'Czyże', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hajnowski'
            LIMIT 1
        )
    ), (
        'Dubicze Cerkiewne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hajnowski'
            LIMIT 1
        )
    ), (
        'Hajnówka (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hajnowski'
            LIMIT 1
        )
    ), (
        'Kleszczele', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hajnowski'
            LIMIT 1
        )
    ), (
        'Narew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hajnowski'
            LIMIT 1
        )
    ), (
        'Narewka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat hajnowski'
            LIMIT 1
        )
    ), (
        'Kolno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolneński'
            LIMIT 1
        )
    ), (
        'Grabowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolneński'
            LIMIT 1
        )
    ), (
        'Kolno (gmina wiejska w województwie podlaskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolneński'
            LIMIT 1
        )
    ), (
        'Mały Płock', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolneński'
            LIMIT 1
        )
    ), (
        'Stawiski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolneński'
            LIMIT 1
        )
    ), (
        'Turośl', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolneński'
            LIMIT 1
        )
    ), (
        'Jedwabne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łomżyński'
            LIMIT 1
        )
    ), (
        'Łomża (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łomżyński'
            LIMIT 1
        )
    ), (
        'Miastkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łomżyński'
            LIMIT 1
        )
    ), (
        'Nowogród', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łomżyński'
            LIMIT 1
        )
    ), (
        'Piątnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łomżyński'
            LIMIT 1
        )
    ), (
        'Przytuły', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łomżyński'
            LIMIT 1
        )
    ), (
        'Śniadowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łomżyński'
            LIMIT 1
        )
    ), (
        'Wizna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łomżyński'
            LIMIT 1
        )
    ), (
        'Zbójna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łomżyński'
            LIMIT 1
        )
    ), (
        'Goniądz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat moniecki'
            LIMIT 1
        )
    ), (
        'Jasionówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat moniecki'
            LIMIT 1
        )
    ), (
        'Jaświły', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat moniecki'
            LIMIT 1
        )
    ), (
        'Knyszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat moniecki'
            LIMIT 1
        )
    ), (
        'Krypno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat moniecki'
            LIMIT 1
        )
    ), (
        'Mońki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat moniecki'
            LIMIT 1
        )
    ), (
        'Trzcianne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat moniecki'
            LIMIT 1
        )
    ), (
        'Sejny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sejneński'
            LIMIT 1
        )
    ), (
        'Giby', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sejneński'
            LIMIT 1
        )
    ), (
        'Krasnopol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sejneński'
            LIMIT 1
        )
    ), (
        'Puńsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sejneński'
            LIMIT 1
        )
    ), (
        'Sejny (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sejneński'
            LIMIT 1
        )
    ), (
        'Siemiatycze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siemiatycki'
            LIMIT 1
        )
    ), (
        'Drohiczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siemiatycki'
            LIMIT 1
        )
    ), (
        'Dziadkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siemiatycki'
            LIMIT 1
        )
    ), (
        'Grodzisk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siemiatycki'
            LIMIT 1
        )
    ), (
        'Mielnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siemiatycki'
            LIMIT 1
        )
    ), (
        'Milejczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siemiatycki'
            LIMIT 1
        )
    ), (
        'Nurzec-Stacja', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siemiatycki'
            LIMIT 1
        )
    ), (
        'Perlejewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siemiatycki'
            LIMIT 1
        )
    ), (
        'Siemiatycze (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat siemiatycki'
            LIMIT 1
        )
    ), (
        'Dąbrowa Białostocka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Janów (gmina w województwie podlaskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Korycin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Krynki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Kuźnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Nowy Dwór', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Sidra', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Sokółka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Suchowola', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Szudziałowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sokólski'
            LIMIT 1
        )
    ), (
        'Bakałarzewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suwalski'
            LIMIT 1
        )
    ), (
        'Filipów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suwalski'
            LIMIT 1
        )
    ), (
        'Jeleniewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suwalski'
            LIMIT 1
        )
    ), (
        'Przerośl', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suwalski'
            LIMIT 1
        )
    ), (
        'Raczki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suwalski'
            LIMIT 1
        )
    ), (
        'Rutka-Tartak', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suwalski'
            LIMIT 1
        )
    ), (
        'Suwałki (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suwalski'
            LIMIT 1
        )
    ), (
        'Szypliszki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suwalski'
            LIMIT 1
        )
    ), (
        'Wiżajny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat suwalski'
            LIMIT 1
        )
    ), (
        'Wysokie Mazowieckie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Ciechanowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Czyżew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Klukowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Kobylin-Borzymy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Kulesze Kościelne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Nowe Piekuty', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Sokoły', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Szepietowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Wysokie Mazowieckie (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wysokomazowiecki'
            LIMIT 1
        )
    ), (
        'Zambrów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zambrowski'
            LIMIT 1
        )
    ), (
        'Kołaki Kościelne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zambrowski'
            LIMIT 1
        )
    ), (
        'Rutki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zambrowski'
            LIMIT 1
        )
    ), (
        'Szumowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zambrowski'
            LIMIT 1
        )
    ), (
        'Zambrów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zambrowski'
            LIMIT 1
        )
    ), (
        'Białystok', (
            SELECT id
            FROM powiaty
            WHERE name = 'Białystok'
            LIMIT 1
        )
    ), (
        'Łomża', (
            SELECT id
            FROM powiaty
            WHERE name = 'Łomża'
            LIMIT 1
        )
    ), (
        'Suwałki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Suwałki'
            LIMIT 1
        )
    ), (
        'Borzytuchom', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Bytów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Czarna Dąbrówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Kołczygłowy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Lipnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Miastko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Parchowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Studzienice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Trzebielino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Tuchomie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bytowski'
            LIMIT 1
        )
    ), (
        'Chojnice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chojnicki'
            LIMIT 1
        )
    ), (
        'Brusy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chojnicki'
            LIMIT 1
        )
    ), (
        'Chojnice (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chojnicki'
            LIMIT 1
        )
    ), (
        'Czersk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chojnicki'
            LIMIT 1
        )
    ), (
        'Konarzyny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chojnicki'
            LIMIT 1
        )
    ), (
        'Człuchów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat człuchowski'
            LIMIT 1
        )
    ), (
        'Czarne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat człuchowski'
            LIMIT 1
        )
    ), (
        'Człuchów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat człuchowski'
            LIMIT 1
        )
    ), (
        'Debrzno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat człuchowski'
            LIMIT 1
        )
    ), (
        'Koczała', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat człuchowski'
            LIMIT 1
        )
    ), (
        'Przechlewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat człuchowski'
            LIMIT 1
        )
    ), (
        'Rzeczenica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat człuchowski'
            LIMIT 1
        )
    ), (
        'Pruszcz Gdański', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gdański'
            LIMIT 1
        )
    ), (
        'Cedry Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gdański'
            LIMIT 1
        )
    ), (
        'Kolbudy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gdański'
            LIMIT 1
        )
    ), (
        'Pruszcz Gdański (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gdański'
            LIMIT 1
        )
    ), (
        'Przywidz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gdański'
            LIMIT 1
        )
    ), (
        'Pszczółki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gdański'
            LIMIT 1
        )
    ), (
        'Suchy Dąb', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gdański'
            LIMIT 1
        )
    ), (
        'Trąbki Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gdański'
            LIMIT 1
        )
    ), (
        'Chmielno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kartuski'
            LIMIT 1
        )
    ), (
        'Kartuzy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kartuski'
            LIMIT 1
        )
    ), (
        'Przodkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kartuski'
            LIMIT 1
        )
    ), (
        'Sierakowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kartuski'
            LIMIT 1
        )
    ), (
        'Somonino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kartuski'
            LIMIT 1
        )
    ), (
        'Stężyca (gmina w województwie pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kartuski'
            LIMIT 1
        )
    ), (
        'Sulęczyno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kartuski'
            LIMIT 1
        )
    ), (
        'Żukowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kartuski'
            LIMIT 1
        )
    ), (
        'Kościerzyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościerski'
            LIMIT 1
        )
    ), (
        'Dziemiany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościerski'
            LIMIT 1
        )
    ), (
        'Karsin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościerski'
            LIMIT 1
        )
    ), (
        'Kościerzyna (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościerski'
            LIMIT 1
        )
    ), (
        'Liniewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościerski'
            LIMIT 1
        )
    ), (
        'Lipusz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościerski'
            LIMIT 1
        )
    ), (
        'Nowa Karczma', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościerski'
            LIMIT 1
        )
    ), (
        'Stara Kiszewa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościerski'
            LIMIT 1
        )
    ), (
        'Kwidzyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kwidzyński'
            LIMIT 1
        )
    ), (
        'Gardeja', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kwidzyński'
            LIMIT 1
        )
    ), (
        'Kwidzyn (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kwidzyński'
            LIMIT 1
        )
    ), (
        'Prabuty', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kwidzyński'
            LIMIT 1
        )
    ), (
        'Ryjewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kwidzyński'
            LIMIT 1
        )
    ), (
        'Sadlinki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kwidzyński'
            LIMIT 1
        )
    ), (
        'Lębork', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lęborski'
            LIMIT 1
        )
    ), (
        'Łeba', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lęborski'
            LIMIT 1
        )
    ), (
        'Cewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lęborski'
            LIMIT 1
        )
    ), (
        'Nowa Wieś Lęborska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lęborski'
            LIMIT 1
        )
    ), (
        'Wicko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lęborski'
            LIMIT 1
        )
    ), (
        'Malbork', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat malborski'
            LIMIT 1
        )
    ), (
        'Lichnowy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat malborski'
            LIMIT 1
        )
    ), (
        'Malbork (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat malborski'
            LIMIT 1
        )
    ), (
        'Miłoradz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat malborski'
            LIMIT 1
        )
    ), (
        'Nowy Staw', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat malborski'
            LIMIT 1
        )
    ), (
        'Stare Pole', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat malborski'
            LIMIT 1
        )
    ), (
        'Krynica Morska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo pomorskie)'
            LIMIT 1
        )
    ), (
        'Nowy Dwór Gdański', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo pomorskie)'
            LIMIT 1
        )
    ), (
        'Ostaszewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo pomorskie)'
            LIMIT 1
        )
    ), (
        'Stegna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo pomorskie)'
            LIMIT 1
        )
    ), (
        'Sztutowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowodworski (województwo pomorskie)'
            LIMIT 1
        )
    ), (
        'Hel (miasto)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pucki'
            LIMIT 1
        )
    ), (
        'Gmina Jastarnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pucki'
            LIMIT 1
        )
    ), (
        'Puck', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pucki'
            LIMIT 1
        )
    ), (
        'Władysławowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pucki'
            LIMIT 1
        )
    ), (
        'Kosakowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pucki'
            LIMIT 1
        )
    ), (
        'Krokowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pucki'
            LIMIT 1
        )
    ), (
        'Puck (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pucki'
            LIMIT 1
        )
    ), (
        'Ustka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Damnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Dębnica Kaszubska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Główczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Kępice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Kobylnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Potęgowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Słupsk (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Smołdzino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Ustka (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupski'
            LIMIT 1
        )
    ), (
        'Czarna Woda', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Skórcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Starogard Gdański', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Bobowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Kaliska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Lubichowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Osieczna (gmina w województwie pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Osiek (gmina w województwie pomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Skarszewy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Skórcz (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Smętowo Graniczne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Starogard Gdański (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Zblewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starogardzki'
            LIMIT 1
        )
    ), (
        'Tczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tczewski'
            LIMIT 1
        )
    ), (
        'Gniew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tczewski'
            LIMIT 1
        )
    ), (
        'Morzeszczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tczewski'
            LIMIT 1
        )
    ), (
        'Pelplin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tczewski'
            LIMIT 1
        )
    ), (
        'Subkowy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tczewski'
            LIMIT 1
        )
    ), (
        'Tczew (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tczewski'
            LIMIT 1
        )
    ), (
        'Reda (miasto)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Rumia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Wejherowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Choczewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Gniewino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Linia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Luzino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Łęczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Szemud', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Wejherowo (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wejherowski'
            LIMIT 1
        )
    ), (
        'Dzierzgoń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sztumski'
            LIMIT 1
        )
    ), (
        'Mikołajki Pomorskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sztumski'
            LIMIT 1
        )
    ), (
        'Stary Dzierzgoń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sztumski'
            LIMIT 1
        )
    ), (
        'Stary Targ', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sztumski'
            LIMIT 1
        )
    ), (
        'Sztum', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sztumski'
            LIMIT 1
        )
    ), (
        'Gdańsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Gdańsk'
            LIMIT 1
        )
    ), (
        'Gdynia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Gdynia'
            LIMIT 1
        )
    ), (
        'Słupsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Słupsk'
            LIMIT 1
        )
    ), (
        'Sopot', (
            SELECT id
            FROM powiaty
            WHERE name = 'Sopot'
            LIMIT 1
        )
    ), (
        'Będzin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat będziński'
            LIMIT 1
        )
    ), (
        'Czeladź (miasto)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat będziński'
            LIMIT 1
        )
    ), (
        'Wojkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat będziński'
            LIMIT 1
        )
    ), (
        'Bobrowniki (gmina w województwie śląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat będziński'
            LIMIT 1
        )
    ), (
        'Mierzęcice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat będziński'
            LIMIT 1
        )
    ), (
        'Psary', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat będziński'
            LIMIT 1
        )
    ), (
        'Siewierz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat będziński'
            LIMIT 1
        )
    ), (
        'Sławków (województwo śląskie)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat będziński'
            LIMIT 1
        )
    ), (
        'Szczyrk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Bestwina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Buczkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Czechowice-Dziedzice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Jasienica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Jaworze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Kozy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Porąbka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Wilamowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Wilkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bielski (województwo śląskie)'
            LIMIT 1
        )
    ), (
        'Cieszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Ustroń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Wisła (miasto)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Brenna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Chybie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Dębowiec (gmina w województwie śląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Goleszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Hażlach', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Istebna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Skoczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Strumień', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Zebrzydowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat cieszyński'
            LIMIT 1
        )
    ), (
        'Blachownia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Dąbrowa Zielona', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Janów (gmina w województwie śląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Kamienica Polska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Kłomnice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Koniecpol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Konopiska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Kruszyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Lelów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Mstów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Mykanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Olsztyn (gmina w województwie śląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Poczesna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Przyrów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Rędziny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Starcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat częstochowski'
            LIMIT 1
        )
    ), (
        'Knurów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gliwicki'
            LIMIT 1
        )
    ), (
        'Pyskowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gliwicki'
            LIMIT 1
        )
    ), (
        'Gierałtowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gliwicki'
            LIMIT 1
        )
    ), (
        'Pilchowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gliwicki'
            LIMIT 1
        )
    ), (
        'Rudziniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gliwicki'
            LIMIT 1
        )
    ), (
        'Sośnicowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gliwicki'
            LIMIT 1
        )
    ), (
        'Toszek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gliwicki'
            LIMIT 1
        )
    ), (
        'Wielowieś', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gliwicki'
            LIMIT 1
        )
    ), (
        'Kłobuck', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłobucki'
            LIMIT 1
        )
    ), (
        'Krzepice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłobucki'
            LIMIT 1
        )
    ), (
        'Lipie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłobucki'
            LIMIT 1
        )
    ), (
        'Miedźno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłobucki'
            LIMIT 1
        )
    ), (
        'Opatów (gmina w województwie śląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłobucki'
            LIMIT 1
        )
    ), (
        'Panki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłobucki'
            LIMIT 1
        )
    ), (
        'Popów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłobucki'
            LIMIT 1
        )
    ), (
        'Przystajń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłobucki'
            LIMIT 1
        )
    ), (
        'Wręczyca Wielka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kłobucki'
            LIMIT 1
        )
    ), (
        'Lubliniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubliniecki'
            LIMIT 1
        )
    ), (
        'Boronów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubliniecki'
            LIMIT 1
        )
    ), (
        'Ciasna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubliniecki'
            LIMIT 1
        )
    ), (
        'Herby', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubliniecki'
            LIMIT 1
        )
    ), (
        'Kochanowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubliniecki'
            LIMIT 1
        )
    ), (
        'Koszęcin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubliniecki'
            LIMIT 1
        )
    ), (
        'Pawonków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubliniecki'
            LIMIT 1
        )
    ), (
        'Woźniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lubliniecki'
            LIMIT 1
        )
    ), (
        'Łaziska Górne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mikołowski'
            LIMIT 1
        )
    ), (
        'Mikołów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mikołowski'
            LIMIT 1
        )
    ), (
        'Orzesze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mikołowski'
            LIMIT 1
        )
    ), (
        'Ornontowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mikołowski'
            LIMIT 1
        )
    ), (
        'Wyry', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mikołowski'
            LIMIT 1
        )
    ), (
        'Myszków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myszkowski'
            LIMIT 1
        )
    ), (
        'Koziegłowy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myszkowski'
            LIMIT 1
        )
    ), (
        'Niegowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myszkowski'
            LIMIT 1
        )
    ), (
        'Poraj', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myszkowski'
            LIMIT 1
        )
    ), (
        'Żarki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myszkowski'
            LIMIT 1
        )
    ), (
        'Goczałkowice-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pszczyński'
            LIMIT 1
        )
    ), (
        'Kobiór', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pszczyński'
            LIMIT 1
        )
    ), (
        'Miedźna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pszczyński'
            LIMIT 1
        )
    ), (
        'Pawłowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pszczyński'
            LIMIT 1
        )
    ), (
        'Pszczyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pszczyński'
            LIMIT 1
        )
    ), (
        'Suszec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pszczyński'
            LIMIT 1
        )
    ), (
        'Racibórz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat raciborski'
            LIMIT 1
        )
    ), (
        'Kornowac', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat raciborski'
            LIMIT 1
        )
    ), (
        'Krzanowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat raciborski'
            LIMIT 1
        )
    ), (
        'Krzyżanowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat raciborski'
            LIMIT 1
        )
    ), (
        'Kuźnia Raciborska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat raciborski'
            LIMIT 1
        )
    ), (
        'Nędza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat raciborski'
            LIMIT 1
        )
    ), (
        'Pietrowice Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat raciborski'
            LIMIT 1
        )
    ), (
        'Rudnik (gmina w województwie śląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat raciborski'
            LIMIT 1
        )
    ), (
        'Czerwionka-Leszczyny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rybnicki'
            LIMIT 1
        )
    ), (
        'Gaszowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rybnicki'
            LIMIT 1
        )
    ), (
        'Jejkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rybnicki'
            LIMIT 1
        )
    ), (
        'Lyski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rybnicki'
            LIMIT 1
        )
    ), (
        'Świerklany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rybnicki'
            LIMIT 1
        )
    ), (
        'Kalety', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnogórski'
            LIMIT 1
        )
    ), (
        'Miasteczko Śląskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnogórski'
            LIMIT 1
        )
    ), (
        'Radzionków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnogórski'
            LIMIT 1
        )
    ), (
        'Tarnowskie Góry', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnogórski'
            LIMIT 1
        )
    ), (
        'Krupski Młyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnogórski'
            LIMIT 1
        )
    ), (
        'Ożarowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnogórski'
            LIMIT 1
        )
    ), (
        'Świerklaniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnogórski'
            LIMIT 1
        )
    ), (
        'Tworóg', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnogórski'
            LIMIT 1
        )
    ), (
        'Zbrosławice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat tarnogórski'
            LIMIT 1
        )
    ), (
        'Bieruń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bieruńsko-lędziński'
            LIMIT 1
        )
    ), (
        'Imielin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bieruńsko-lędziński'
            LIMIT 1
        )
    ), (
        'Lędziny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bieruńsko-lędziński'
            LIMIT 1
        )
    ), (
        'Bojszowy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bieruńsko-lędziński'
            LIMIT 1
        )
    ), (
        'Chełm Śląski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bieruńsko-lędziński'
            LIMIT 1
        )
    ), (
        'Pszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wodzisławski'
            LIMIT 1
        )
    ), (
        'Radlin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wodzisławski'
            LIMIT 1
        )
    ), (
        'Rydułtowy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wodzisławski'
            LIMIT 1
        )
    ), (
        'Wodzisław Śląski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wodzisławski'
            LIMIT 1
        )
    ), (
        'Godów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wodzisławski'
            LIMIT 1
        )
    ), (
        'Gorzyce (gmina w województwie śląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wodzisławski'
            LIMIT 1
        )
    ), (
        'Lubomia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wodzisławski'
            LIMIT 1
        )
    ), (
        'Marklowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wodzisławski'
            LIMIT 1
        )
    ), (
        'Mszana', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wodzisławski'
            LIMIT 1
        )
    ), (
        'Poręba', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Zawiercie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Irządze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Kroczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Łazy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Ogrodzieniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Pilica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Szczekociny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Włodowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Żarnowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat zawierciański'
            LIMIT 1
        )
    ), (
        'Żywiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Czernichów (gmina w województwie śląskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Gilowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Jeleśnia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Koszarawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Lipowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Łękawica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Łodygowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Milówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Radziechowy-Wieprz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Rajcza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Ślemień', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Świnna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Ujsoły', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Węgierska Górka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat żywiecki'
            LIMIT 1
        )
    ), (
        'Bielsko-Biała', (
            SELECT id
            FROM powiaty
            WHERE name = 'Bielsko-Biała'
            LIMIT 1
        )
    ), (
        'Bytom', (
            SELECT id
            FROM powiaty
            WHERE name = 'Bytom'
            LIMIT 1
        )
    ), (
        'Chorzów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Chorzów'
            LIMIT 1
        )
    ), (
        'Częstochowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Częstochowa'
            LIMIT 1
        )
    ), (
        'Dąbrowa Górnicza', (
            SELECT id
            FROM powiaty
            WHERE name = 'Dąbrowa Górnicza'
            LIMIT 1
        )
    ), (
        'Gliwice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Gliwice'
            LIMIT 1
        )
    ), (
        'Jastrzębie-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Jastrzębie-Zdrój'
            LIMIT 1
        )
    ), (
        'Jaworzno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Jaworzno'
            LIMIT 1
        )
    ), (
        'Katowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Katowice'
            LIMIT 1
        )
    ), (
        'Mysłowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Mysłowice'
            LIMIT 1
        )
    ), (
        'Piekary Śląskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Piekary Śląskie'
            LIMIT 1
        )
    ), (
        'Ruda Śląska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Ruda Śląska'
            LIMIT 1
        )
    ), (
        'Rybnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Rybnik'
            LIMIT 1
        )
    ), (
        'Siemianowice Śląskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Siemianowice Śląskie'
            LIMIT 1
        )
    ), (
        'Sosnowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Sosnowiec'
            LIMIT 1
        )
    ), (
        'Świętochłowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Świętochłowice'
            LIMIT 1
        )
    ), (
        'Tychy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Tychy'
            LIMIT 1
        )
    ), (
        'Zabrze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Zabrze'
            LIMIT 1
        )
    ), (
        'Żory', (
            SELECT id
            FROM powiaty
            WHERE name = 'Żory'
            LIMIT 1
        )
    ), (
        'Busko-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat buski'
            LIMIT 1
        )
    ), (
        'Gnojno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat buski'
            LIMIT 1
        )
    ), (
        'Nowy Korczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat buski'
            LIMIT 1
        )
    ), (
        'Pacanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat buski'
            LIMIT 1
        )
    ), (
        'Solec-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat buski'
            LIMIT 1
        )
    ), (
        'Stopnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat buski'
            LIMIT 1
        )
    ), (
        'Tuczępy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat buski'
            LIMIT 1
        )
    ), (
        'Wiślica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat buski'
            LIMIT 1
        )
    ), (
        'Imielno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jędrzejowski'
            LIMIT 1
        )
    ), (
        'Jędrzejów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jędrzejowski'
            LIMIT 1
        )
    ), (
        'Małogoszcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jędrzejowski'
            LIMIT 1
        )
    ), (
        'Nagłowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jędrzejowski'
            LIMIT 1
        )
    ), (
        'Oksa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jędrzejowski'
            LIMIT 1
        )
    ), (
        'Sędziszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jędrzejowski'
            LIMIT 1
        )
    ), (
        'Słupia (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jędrzejowski'
            LIMIT 1
        )
    ), (
        'Sobków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jędrzejowski'
            LIMIT 1
        )
    ), (
        'Wodzisław', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jędrzejowski'
            LIMIT 1
        )
    ), (
        'Bejsce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kazimierski'
            LIMIT 1
        )
    ), (
        'Czarnocin (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kazimierski'
            LIMIT 1
        )
    ), (
        'Kazimierza Wielka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kazimierski'
            LIMIT 1
        )
    ), (
        'Opatowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kazimierski'
            LIMIT 1
        )
    ), (
        'Skalbmierz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kazimierski'
            LIMIT 1
        )
    ), (
        'Bieliny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Bodzentyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Chęciny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Chmielnik (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Daleszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Górno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Łagów (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Łopuszno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Masłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Miedziana Góra', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Mniów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Morawica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Nowa Słupia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Piekoszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Pierzchnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Raków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Nowiny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Strawczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Zagnańsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kielecki'
            LIMIT 1
        )
    ), (
        'Fałków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat konecki'
            LIMIT 1
        )
    ), (
        'Gowarczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat konecki'
            LIMIT 1
        )
    ), (
        'Końskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat konecki'
            LIMIT 1
        )
    ), (
        'Radoszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat konecki'
            LIMIT 1
        )
    ), (
        'Ruda Maleniecka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat konecki'
            LIMIT 1
        )
    ), (
        'Słupia Konecka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat konecki'
            LIMIT 1
        )
    ), (
        'Smyków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat konecki'
            LIMIT 1
        )
    ), (
        'Stąporków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat konecki'
            LIMIT 1
        )
    ), (
        'Baćkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opatowski'
            LIMIT 1
        )
    ), (
        'Iwaniska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opatowski'
            LIMIT 1
        )
    ), (
        'Lipnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opatowski'
            LIMIT 1
        )
    ), (
        'Opatów (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opatowski'
            LIMIT 1
        )
    ), (
        'Ożarów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opatowski'
            LIMIT 1
        )
    ), (
        'Sadowie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opatowski'
            LIMIT 1
        )
    ), (
        'Tarłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opatowski'
            LIMIT 1
        )
    ), (
        'Wojciechowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat opatowski'
            LIMIT 1
        )
    ), (
        'Ostrowiec Świętokrzyski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowiecki'
            LIMIT 1
        )
    ), (
        'Bałtów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowiecki'
            LIMIT 1
        )
    ), (
        'Bodzechów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowiecki'
            LIMIT 1
        )
    ), (
        'Ćmielów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowiecki'
            LIMIT 1
        )
    ), (
        'Kunów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowiecki'
            LIMIT 1
        )
    ), (
        'Waśniów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowiecki'
            LIMIT 1
        )
    ), (
        'Działoszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pińczowski'
            LIMIT 1
        )
    ), (
        'Kije', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pińczowski'
            LIMIT 1
        )
    ), (
        'Michałów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pińczowski'
            LIMIT 1
        )
    ), (
        'Pińczów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pińczowski'
            LIMIT 1
        )
    ), (
        'Złota', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pińczowski'
            LIMIT 1
        )
    ), (
        'Sandomierz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sandomierski'
            LIMIT 1
        )
    ), (
        'Dwikozy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sandomierski'
            LIMIT 1
        )
    ), (
        'Klimontów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sandomierski'
            LIMIT 1
        )
    ), (
        'Koprzywnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sandomierski'
            LIMIT 1
        )
    ), (
        'Łoniów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sandomierski'
            LIMIT 1
        )
    ), (
        'Obrazów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sandomierski'
            LIMIT 1
        )
    ), (
        'Samborzec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sandomierski'
            LIMIT 1
        )
    ), (
        'Wilczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sandomierski'
            LIMIT 1
        )
    ), (
        'Zawichost', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sandomierski'
            LIMIT 1
        )
    ), (
        'Skarżysko-Kamienna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skarżyski'
            LIMIT 1
        )
    ), (
        'Bliżyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skarżyski'
            LIMIT 1
        )
    ), (
        'Łączna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skarżyski'
            LIMIT 1
        )
    ), (
        'Skarżysko Kościelne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skarżyski'
            LIMIT 1
        )
    ), (
        'Suchedniów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat skarżyski'
            LIMIT 1
        )
    ), (
        'Starachowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starachowicki'
            LIMIT 1
        )
    ), (
        'Brody (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starachowicki'
            LIMIT 1
        )
    ), (
        'Mirzec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starachowicki'
            LIMIT 1
        )
    ), (
        'Pawłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starachowicki'
            LIMIT 1
        )
    ), (
        'Wąchock', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat starachowicki'
            LIMIT 1
        )
    ), (
        'Bogoria', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat staszowski'
            LIMIT 1
        )
    ), (
        'Łubnice (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat staszowski'
            LIMIT 1
        )
    ), (
        'Oleśnica (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat staszowski'
            LIMIT 1
        )
    ), (
        'Osiek (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat staszowski'
            LIMIT 1
        )
    ), (
        'Połaniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat staszowski'
            LIMIT 1
        )
    ), (
        'Rytwiany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat staszowski'
            LIMIT 1
        )
    ), (
        'Staszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat staszowski'
            LIMIT 1
        )
    ), (
        'Szydłów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat staszowski'
            LIMIT 1
        )
    ), (
        'Kluczewsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włoszczowski'
            LIMIT 1
        )
    ), (
        'Krasocin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włoszczowski'
            LIMIT 1
        )
    ), (
        'Moskorzew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włoszczowski'
            LIMIT 1
        )
    ), (
        'Radków (gmina w województwie świętokrzyskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włoszczowski'
            LIMIT 1
        )
    ), (
        'Secemin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włoszczowski'
            LIMIT 1
        )
    ), (
        'Włoszczowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat włoszczowski'
            LIMIT 1
        )
    ), (
        'Kielce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Kielce'
            LIMIT 1
        )
    ), (
        'Bartoszyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bartoszycki'
            LIMIT 1
        )
    ), (
        'Górowo Iławeckie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bartoszycki'
            LIMIT 1
        )
    ), (
        'Bartoszyce (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bartoszycki'
            LIMIT 1
        )
    ), (
        'Bisztynek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bartoszycki'
            LIMIT 1
        )
    ), (
        'Górowo Iławeckie (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bartoszycki'
            LIMIT 1
        )
    ), (
        'Sępopol', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat bartoszycki'
            LIMIT 1
        )
    ), (
        'Braniewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat braniewski'
            LIMIT 1
        )
    ), (
        'Braniewo (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat braniewski'
            LIMIT 1
        )
    ), (
        'Frombork', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat braniewski'
            LIMIT 1
        )
    ), (
        'Lelkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat braniewski'
            LIMIT 1
        )
    ), (
        'Pieniężno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat braniewski'
            LIMIT 1
        )
    ), (
        'Płoskinia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat braniewski'
            LIMIT 1
        )
    ), (
        'Wilczęta', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat braniewski'
            LIMIT 1
        )
    ), (
        'Działdowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat działdowski'
            LIMIT 1
        )
    ), (
        'Działdowo (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat działdowski'
            LIMIT 1
        )
    ), (
        'Iłowo-Osada', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat działdowski'
            LIMIT 1
        )
    ), (
        'Lidzbark', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat działdowski'
            LIMIT 1
        )
    ), (
        'Płośnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat działdowski'
            LIMIT 1
        )
    ), (
        'Rybno (gmina w województwie warmińsko-mazurskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat działdowski'
            LIMIT 1
        )
    ), (
        'Elbląg (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat elbląski'
            LIMIT 1
        )
    ), (
        'Godkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat elbląski'
            LIMIT 1
        )
    ), (
        'Gronowo Elbląskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat elbląski'
            LIMIT 1
        )
    ), (
        'Markusy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat elbląski'
            LIMIT 1
        )
    ), (
        'Milejewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat elbląski'
            LIMIT 1
        )
    ), (
        'Młynary', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat elbląski'
            LIMIT 1
        )
    ), (
        'Pasłęk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat elbląski'
            LIMIT 1
        )
    ), (
        'Rychliki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat elbląski'
            LIMIT 1
        )
    ), (
        'Tolkmicko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat elbląski'
            LIMIT 1
        )
    ), (
        'Ełk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ełcki'
            LIMIT 1
        )
    ), (
        'Ełk (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ełcki'
            LIMIT 1
        )
    ), (
        'Kalinowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ełcki'
            LIMIT 1
        )
    ), (
        'Prostki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ełcki'
            LIMIT 1
        )
    ), (
        'Stare Juchy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ełcki'
            LIMIT 1
        )
    ), (
        'Giżycko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat giżycki'
            LIMIT 1
        )
    ), (
        'Giżycko (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat giżycki'
            LIMIT 1
        )
    ), (
        'Kruklanki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat giżycki'
            LIMIT 1
        )
    ), (
        'Miłki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat giżycki'
            LIMIT 1
        )
    ), (
        'Ryn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat giżycki'
            LIMIT 1
        )
    ), (
        'Wydminy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat giżycki'
            LIMIT 1
        )
    ), (
        'Iława', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat iławski'
            LIMIT 1
        )
    ), (
        'Lubawa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat iławski'
            LIMIT 1
        )
    ), (
        'Iława (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat iławski'
            LIMIT 1
        )
    ), (
        'Kisielice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat iławski'
            LIMIT 1
        )
    ), (
        'Lubawa (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat iławski'
            LIMIT 1
        )
    ), (
        'Susz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat iławski'
            LIMIT 1
        )
    ), (
        'Zalewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat iławski'
            LIMIT 1
        )
    ), (
        'Kętrzyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kętrzyński'
            LIMIT 1
        )
    ), (
        'Barciany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kętrzyński'
            LIMIT 1
        )
    ), (
        'Kętrzyn (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kętrzyński'
            LIMIT 1
        )
    ), (
        'Korsze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kętrzyński'
            LIMIT 1
        )
    ), (
        'Reszel', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kętrzyński'
            LIMIT 1
        )
    ), (
        'Srokowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kętrzyński'
            LIMIT 1
        )
    ), (
        'Lidzbark Warmiński', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lidzbarski'
            LIMIT 1
        )
    ), (
        'Kiwity', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lidzbarski'
            LIMIT 1
        )
    ), (
        'Lidzbark Warmiński (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lidzbarski'
            LIMIT 1
        )
    ), (
        'Lubomino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lidzbarski'
            LIMIT 1
        )
    ), (
        'Orneta', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat lidzbarski'
            LIMIT 1
        )
    ), (
        'Mrągowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mrągowski'
            LIMIT 1
        )
    ), (
        'Mikołajki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mrągowski'
            LIMIT 1
        )
    ), (
        'Mrągowo (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mrągowski'
            LIMIT 1
        )
    ), (
        'Piecki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mrągowski'
            LIMIT 1
        )
    ), (
        'Sorkwity', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat mrągowski'
            LIMIT 1
        )
    ), (
        'Janowiec Kościelny', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nidzicki'
            LIMIT 1
        )
    ), (
        'Janowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nidzicki'
            LIMIT 1
        )
    ), (
        'Kozłowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nidzicki'
            LIMIT 1
        )
    ), (
        'Nidzica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nidzicki'
            LIMIT 1
        )
    ), (
        'Nowe Miasto Lubawskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowomiejski'
            LIMIT 1
        )
    ), (
        'Biskupiec (gmina w powiecie nowomiejskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowomiejski'
            LIMIT 1
        )
    ), (
        'Grodziczno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowomiejski'
            LIMIT 1
        )
    ), (
        'Kurzętnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowomiejski'
            LIMIT 1
        )
    ), (
        'Nowe Miasto Lubawskie (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowomiejski'
            LIMIT 1
        )
    ), (
        'Kowale Oleckie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olecki'
            LIMIT 1
        )
    ), (
        'Olecko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olecki'
            LIMIT 1
        )
    ), (
        'Świętajno (gmina w powiecie oleckim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olecki'
            LIMIT 1
        )
    ), (
        'Wieliczki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olecki'
            LIMIT 1
        )
    ), (
        'Barczewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Biskupiec (gmina w powiecie olsztyńskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Dobre Miasto', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Dywity', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Gietrzwałd', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Jeziorany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Jonkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Kolno (gmina w województwie warmińsko-mazurskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Olsztynek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Purda', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Stawiguda', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Świątki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat olsztyński'
            LIMIT 1
        )
    ), (
        'Ostróda', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostródzki'
            LIMIT 1
        )
    ), (
        'Dąbrówno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostródzki'
            LIMIT 1
        )
    ), (
        'Grunwald', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostródzki'
            LIMIT 1
        )
    ), (
        'Łukta', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostródzki'
            LIMIT 1
        )
    ), (
        'Małdyty', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostródzki'
            LIMIT 1
        )
    ), (
        'Miłakowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostródzki'
            LIMIT 1
        )
    ), (
        'Miłomłyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostródzki'
            LIMIT 1
        )
    ), (
        'Morąg', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostródzki'
            LIMIT 1
        )
    ), (
        'Ostróda (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostródzki'
            LIMIT 1
        )
    ), (
        'Biała Piska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piski'
            LIMIT 1
        )
    ), (
        'Orzysz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piski'
            LIMIT 1
        )
    ), (
        'Pisz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piski'
            LIMIT 1
        )
    ), (
        'Ruciane-Nida', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat piski'
            LIMIT 1
        )
    ), (
        'Szczytno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczycieński'
            LIMIT 1
        )
    ), (
        'Dźwierzuty', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczycieński'
            LIMIT 1
        )
    ), (
        'Jedwabno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczycieński'
            LIMIT 1
        )
    ), (
        'Pasym', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczycieński'
            LIMIT 1
        )
    ), (
        'Rozogi', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczycieński'
            LIMIT 1
        )
    ), (
        'Szczytno (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczycieński'
            LIMIT 1
        )
    ), (
        'Świętajno (gmina w powiecie szczycieńskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczycieński'
            LIMIT 1
        )
    ), (
        'Wielbark', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczycieński'
            LIMIT 1
        )
    ), (
        'Banie Mazurskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gołdapski'
            LIMIT 1
        )
    ), (
        'Dubeninki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gołdapski'
            LIMIT 1
        )
    ), (
        'Gołdap', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gołdapski'
            LIMIT 1
        )
    ), (
        'Budry', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgorzewski'
            LIMIT 1
        )
    ), (
        'Pozezdrze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgorzewski'
            LIMIT 1
        )
    ), (
        'Węgorzewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat węgorzewski'
            LIMIT 1
        )
    ), (
        'Elbląg', (
            SELECT id
            FROM powiaty
            WHERE name = 'Elbląg'
            LIMIT 1
        )
    ), (
        'Olsztyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Olsztyn'
            LIMIT 1
        )
    ), (
        'Chodzież', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chodzieski'
            LIMIT 1
        )
    ), (
        'Budzyń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chodzieski'
            LIMIT 1
        )
    ), (
        'Chodzież (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chodzieski'
            LIMIT 1
        )
    ), (
        'Margonin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chodzieski'
            LIMIT 1
        )
    ), (
        'Szamocin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat chodzieski'
            LIMIT 1
        )
    ), (
        'Czarnków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat czarnkowsko-trzcianecki'
            LIMIT 1
        )
    ), (
        'Czarnków (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat czarnkowsko-trzcianecki'
            LIMIT 1
        )
    ), (
        'Drawsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat czarnkowsko-trzcianecki'
            LIMIT 1
        )
    ), (
        'Krzyż Wielkopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat czarnkowsko-trzcianecki'
            LIMIT 1
        )
    ), (
        'Lubasz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat czarnkowsko-trzcianecki'
            LIMIT 1
        )
    ), (
        'Połajewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat czarnkowsko-trzcianecki'
            LIMIT 1
        )
    ), (
        'Trzcianka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat czarnkowsko-trzcianecki'
            LIMIT 1
        )
    ), (
        'Wieleń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat czarnkowsko-trzcianecki'
            LIMIT 1
        )
    ), (
        'Gniezno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Czerniejewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Gniezno (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Kiszkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Kłecko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Łubowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Mieleszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Niechanowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Trzemeszno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Witkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gnieźnieński'
            LIMIT 1
        )
    ), (
        'Borek Wielkopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyński'
            LIMIT 1
        )
    ), (
        'Gostyń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyński'
            LIMIT 1
        )
    ), (
        'Krobia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyński'
            LIMIT 1
        )
    ), (
        'Pępowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyński'
            LIMIT 1
        )
    ), (
        'Piaski (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyński'
            LIMIT 1
        )
    ), (
        'Pogorzela', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyński'
            LIMIT 1
        )
    ), (
        'Poniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gostyński'
            LIMIT 1
        )
    ), (
        'Granowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Grodzisk Wielkopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Kamieniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Rakoniewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Wielichowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat grodziski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Jaraczewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarociński'
            LIMIT 1
        )
    ), (
        'Jarocin (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarociński'
            LIMIT 1
        )
    ), (
        'Kotlin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarociński'
            LIMIT 1
        )
    ), (
        'Żerków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat jarociński'
            LIMIT 1
        )
    ), (
        'Blizanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Brzeziny (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Ceków-Kolonia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Godziesze Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Koźminek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Lisków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Mycielin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Opatówek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Stawiszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Szczytniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Żelazków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kaliski'
            LIMIT 1
        )
    ), (
        'Baranów (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kępiński'
            LIMIT 1
        )
    ), (
        'Bralin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kępiński'
            LIMIT 1
        )
    ), (
        'Kępno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kępiński'
            LIMIT 1
        )
    ), (
        'Łęka Opatowska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kępiński'
            LIMIT 1
        )
    ), (
        'Perzów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kępiński'
            LIMIT 1
        )
    ), (
        'Rychtal', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kępiński'
            LIMIT 1
        )
    ), (
        'Trzcinica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kępiński'
            LIMIT 1
        )
    ), (
        'Koło (miasto)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Babiak', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Chodów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Dąbie (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Grzegorzew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Kłodawa (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Koło (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Kościelec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Olszówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Osiek Mały', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Przedecz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kolski'
            LIMIT 1
        )
    ), (
        'Golina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Grodziec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Kazimierz Biskupi', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Kleczew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Kramsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Krzymów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Rychwał', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Rzgów (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Skulsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Sompolno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Stare Miasto', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Ślesin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Wierzbinek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Wilczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koniński'
            LIMIT 1
        )
    ), (
        'Kościan', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościański'
            LIMIT 1
        )
    ), (
        'Czempiń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościański'
            LIMIT 1
        )
    ), (
        'Kościan (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościański'
            LIMIT 1
        )
    ), (
        'Krzywiń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościański'
            LIMIT 1
        )
    ), (
        'Śmigiel', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kościański'
            LIMIT 1
        )
    ), (
        'Sulmierzyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krotoszyński'
            LIMIT 1
        )
    ), (
        'Kobylin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krotoszyński'
            LIMIT 1
        )
    ), (
        'Koźmin Wielkopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krotoszyński'
            LIMIT 1
        )
    ), (
        'Krotoszyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krotoszyński'
            LIMIT 1
        )
    ), (
        'Rozdrażew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krotoszyński'
            LIMIT 1
        )
    ), (
        'Zduny (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat krotoszyński'
            LIMIT 1
        )
    ), (
        'Krzemieniewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leszczyński'
            LIMIT 1
        )
    ), (
        'Lipno (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leszczyński'
            LIMIT 1
        )
    ), (
        'Osieczna (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leszczyński'
            LIMIT 1
        )
    ), (
        'Rydzyna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leszczyński'
            LIMIT 1
        )
    ), (
        'Święciechowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leszczyński'
            LIMIT 1
        )
    ), (
        'Wijewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leszczyński'
            LIMIT 1
        )
    ), (
        'Włoszakowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat leszczyński'
            LIMIT 1
        )
    ), (
        'Chrzypsko Wielkie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzychodzki'
            LIMIT 1
        )
    ), (
        'Kwilcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzychodzki'
            LIMIT 1
        )
    ), (
        'Międzychód', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzychodzki'
            LIMIT 1
        )
    ), (
        'Sieraków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat międzychodzki'
            LIMIT 1
        )
    ), (
        'Kuślin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotomyski'
            LIMIT 1
        )
    ), (
        'Lwówek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotomyski'
            LIMIT 1
        )
    ), (
        'Miedzichowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotomyski'
            LIMIT 1
        )
    ), (
        'Nowy Tomyśl', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotomyski'
            LIMIT 1
        )
    ), (
        'Opalenica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotomyski'
            LIMIT 1
        )
    ), (
        'Zbąszyń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat nowotomyski'
            LIMIT 1
        )
    ), (
        'Oborniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat obornicki'
            LIMIT 1
        )
    ), (
        'Rogoźno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat obornicki'
            LIMIT 1
        )
    ), (
        'Ryczywół', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat obornicki'
            LIMIT 1
        )
    ), (
        'Ostrów Wielkopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Nowe Skalmierzyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Odolanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Ostrów Wielkopolski (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Przygodzice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Raszków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Sieroszewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Sośnie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrowski (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Czajków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrzeszowski'
            LIMIT 1
        )
    ), (
        'Doruchów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrzeszowski'
            LIMIT 1
        )
    ), (
        'Grabów nad Prosną', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrzeszowski'
            LIMIT 1
        )
    ), (
        'Kobyla Góra', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrzeszowski'
            LIMIT 1
        )
    ), (
        'Kraszewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrzeszowski'
            LIMIT 1
        )
    ), (
        'Mikstat', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrzeszowski'
            LIMIT 1
        )
    ), (
        'Ostrzeszów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat ostrzeszowski'
            LIMIT 1
        )
    ), (
        'Piła (miasto)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pilski'
            LIMIT 1
        )
    ), (
        'Białośliwie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pilski'
            LIMIT 1
        )
    ), (
        'Kaczory', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pilski'
            LIMIT 1
        )
    ), (
        'Łobżenica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pilski'
            LIMIT 1
        )
    ), (
        'Miasteczko Krajeńskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pilski'
            LIMIT 1
        )
    ), (
        'Szydłowo (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pilski'
            LIMIT 1
        )
    ), (
        'Ujście', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pilski'
            LIMIT 1
        )
    ), (
        'Wyrzysk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pilski'
            LIMIT 1
        )
    ), (
        'Wysoka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pilski'
            LIMIT 1
        )
    ), (
        'Chocz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pleszewski'
            LIMIT 1
        )
    ), (
        'Czermin (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pleszewski'
            LIMIT 1
        )
    ), (
        'Dobrzyca', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pleszewski'
            LIMIT 1
        )
    ), (
        'Gizałki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pleszewski'
            LIMIT 1
        )
    ), (
        'Gołuchów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pleszewski'
            LIMIT 1
        )
    ), (
        'Pleszew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pleszewski'
            LIMIT 1
        )
    ), (
        'Luboń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Puszczykowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Buk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Czerwonak', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Dopiewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Kleszczewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Komorniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Kostrzyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Kórnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Mosina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Murowana Goślina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Pobiedziska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Rokietnica (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Stęszew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Suchy Las', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Swarzędz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Tarnowo Podgórne', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat poznański'
            LIMIT 1
        )
    ), (
        'Bojanowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawicki'
            LIMIT 1
        )
    ), (
        'Jutrosin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawicki'
            LIMIT 1
        )
    ), (
        'Miejska Górka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawicki'
            LIMIT 1
        )
    ), (
        'Pakosław', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawicki'
            LIMIT 1
        )
    ), (
        'Rawicz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat rawicki'
            LIMIT 1
        )
    ), (
        'Słupca', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupecki'
            LIMIT 1
        )
    ), (
        'Lądek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupecki'
            LIMIT 1
        )
    ), (
        'Orchowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupecki'
            LIMIT 1
        )
    ), (
        'Ostrowite', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupecki'
            LIMIT 1
        )
    ), (
        'Powidz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupecki'
            LIMIT 1
        )
    ), (
        'Słupca (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupecki'
            LIMIT 1
        )
    ), (
        'Strzałkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupecki'
            LIMIT 1
        )
    ), (
        'Zagórów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat słupecki'
            LIMIT 1
        )
    ), (
        'Obrzycko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szamotulski'
            LIMIT 1
        )
    ), (
        'Duszniki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szamotulski'
            LIMIT 1
        )
    ), (
        'Kaźmierz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szamotulski'
            LIMIT 1
        )
    ), (
        'Obrzycko (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szamotulski'
            LIMIT 1
        )
    ), (
        'Ostroróg', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szamotulski'
            LIMIT 1
        )
    ), (
        'Pniewy (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szamotulski'
            LIMIT 1
        )
    ), (
        'Szamotuły', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szamotulski'
            LIMIT 1
        )
    ), (
        'Wronki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szamotulski'
            LIMIT 1
        )
    ), (
        'Dominowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Krzykosy', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Nowe Miasto nad Wartą', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Środa Wielkopolska', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Zaniemyśl', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat średzki (województwo wielkopolskie)'
            LIMIT 1
        )
    ), (
        'Brodnica (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat śremski'
            LIMIT 1
        )
    ), (
        'Dolsk', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat śremski'
            LIMIT 1
        )
    ), (
        'Książ Wielkopolski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat śremski'
            LIMIT 1
        )
    ), (
        'Śrem', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat śremski'
            LIMIT 1
        )
    ), (
        'Turek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat turecki'
            LIMIT 1
        )
    ), (
        'Brudzew', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat turecki'
            LIMIT 1
        )
    ), (
        'Dobra (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat turecki'
            LIMIT 1
        )
    ), (
        'Kawęczyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat turecki'
            LIMIT 1
        )
    ), (
        'Malanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat turecki'
            LIMIT 1
        )
    ), (
        'Przykona', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat turecki'
            LIMIT 1
        )
    ), (
        'Tuliszków', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat turecki'
            LIMIT 1
        )
    ), (
        'Turek (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat turecki'
            LIMIT 1
        )
    ), (
        'Władysławów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat turecki'
            LIMIT 1
        )
    ), (
        'Wągrowiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wągrowiecki'
            LIMIT 1
        )
    ), (
        'Damasławek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wągrowiecki'
            LIMIT 1
        )
    ), (
        'Gołańcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wągrowiecki'
            LIMIT 1
        )
    ), (
        'Mieścisko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wągrowiecki'
            LIMIT 1
        )
    ), (
        'Skoki', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wągrowiecki'
            LIMIT 1
        )
    ), (
        'Wapno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wągrowiecki'
            LIMIT 1
        )
    ), (
        'Wągrowiec (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wągrowiecki'
            LIMIT 1
        )
    ), (
        'Przemęt', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wolsztyński'
            LIMIT 1
        )
    ), (
        'Siedlec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wolsztyński'
            LIMIT 1
        )
    ), (
        'Wolsztyn', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wolsztyński'
            LIMIT 1
        )
    ), (
        'Kołaczkowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrzesiński'
            LIMIT 1
        )
    ), (
        'Miłosław', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrzesiński'
            LIMIT 1
        )
    ), (
        'Nekla', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrzesiński'
            LIMIT 1
        )
    ), (
        'Pyzdry', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrzesiński'
            LIMIT 1
        )
    ), (
        'Września', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wrzesiński'
            LIMIT 1
        )
    ), (
        'Złotów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotowski'
            LIMIT 1
        )
    ), (
        'Jastrowie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotowski'
            LIMIT 1
        )
    ), (
        'Krajenka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotowski'
            LIMIT 1
        )
    ), (
        'Lipka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotowski'
            LIMIT 1
        )
    ), (
        'Okonek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotowski'
            LIMIT 1
        )
    ), (
        'Tarnówka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotowski'
            LIMIT 1
        )
    ), (
        'Zakrzewo (gmina w województwie wielkopolskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotowski'
            LIMIT 1
        )
    ), (
        'Złotów (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat złotowski'
            LIMIT 1
        )
    ), (
        'Kalisz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Kalisz'
            LIMIT 1
        )
    ), (
        'Konin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Konin'
            LIMIT 1
        )
    ), (
        'Leszno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Leszno'
            LIMIT 1
        )
    ), (
        'Poznań', (
            SELECT id
            FROM powiaty
            WHERE name = 'Poznań'
            LIMIT 1
        )
    ), (
        'Białogard', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białogardzki'
            LIMIT 1
        )
    ), (
        'Białogard (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białogardzki'
            LIMIT 1
        )
    ), (
        'Karlino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białogardzki'
            LIMIT 1
        )
    ), (
        'Tychowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat białogardzki'
            LIMIT 1
        )
    ), (
        'Bierzwnik', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat choszczeński'
            LIMIT 1
        )
    ), (
        'Choszczno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat choszczeński'
            LIMIT 1
        )
    ), (
        'Drawno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat choszczeński'
            LIMIT 1
        )
    ), (
        'Krzęcin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat choszczeński'
            LIMIT 1
        )
    ), (
        'Pełczyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat choszczeński'
            LIMIT 1
        )
    ), (
        'Recz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat choszczeński'
            LIMIT 1
        )
    ), (
        'Czaplinek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat drawski'
            LIMIT 1
        )
    ), (
        'Drawsko Pomorskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat drawski'
            LIMIT 1
        )
    ), (
        'Kalisz Pomorski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat drawski'
            LIMIT 1
        )
    ), (
        'Wierzchowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat drawski'
            LIMIT 1
        )
    ), (
        'Złocieniec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat drawski'
            LIMIT 1
        )
    ), (
        'Goleniów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat goleniowski'
            LIMIT 1
        )
    ), (
        'Maszewo (gmina w województwie zachodniopomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat goleniowski'
            LIMIT 1
        )
    ), (
        'Nowogard', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat goleniowski'
            LIMIT 1
        )
    ), (
        'Osina', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat goleniowski'
            LIMIT 1
        )
    ), (
        'Przybiernów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat goleniowski'
            LIMIT 1
        )
    ), (
        'Stepnica', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat goleniowski'
            LIMIT 1
        )
    ), (
        'Brojce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryficki'
            LIMIT 1
        )
    ), (
        'Gryfice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryficki'
            LIMIT 1
        )
    ), (
        'Karnice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryficki'
            LIMIT 1
        )
    ), (
        'Płoty', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryficki'
            LIMIT 1
        )
    ), (
        'Rewal', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryficki'
            LIMIT 1
        )
    ), (
        'Trzebiatów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryficki'
            LIMIT 1
        )
    ), (
        'Banie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryfiński'
            LIMIT 1
        )
    ), (
        'Cedynia', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryfiński'
            LIMIT 1
        )
    ), (
        'Chojna', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryfiński'
            LIMIT 1
        )
    ), (
        'Gryfino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryfiński'
            LIMIT 1
        )
    ), (
        'Mieszkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryfiński'
            LIMIT 1
        )
    ), (
        'Moryń', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryfiński'
            LIMIT 1
        )
    ), (
        'Stare Czarnowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryfiński'
            LIMIT 1
        )
    ), (
        'Trzcińsko-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryfiński'
            LIMIT 1
        )
    ), (
        'Widuchowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat gryfiński'
            LIMIT 1
        )
    ), (
        'Dziwnów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamieński'
            LIMIT 1
        )
    ), (
        'Golczewo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamieński'
            LIMIT 1
        )
    ), (
        'Kamień Pomorski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamieński'
            LIMIT 1
        )
    ), (
        'Międzyzdroje', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamieński'
            LIMIT 1
        )
    ), (
        'Świerzno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamieński'
            LIMIT 1
        )
    ), (
        'Wolin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kamieński'
            LIMIT 1
        )
    ), (
        'Kołobrzeg', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kołobrzeski'
            LIMIT 1
        )
    ), (
        'Dygowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kołobrzeski'
            LIMIT 1
        )
    ), (
        'Gościno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kołobrzeski'
            LIMIT 1
        )
    ), (
        'Kołobrzeg (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kołobrzeski'
            LIMIT 1
        )
    ), (
        'Rymań', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kołobrzeski'
            LIMIT 1
        )
    ), (
        'Siemyśl', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kołobrzeski'
            LIMIT 1
        )
    ), (
        'Ustronie Morskie', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat kołobrzeski'
            LIMIT 1
        )
    ), (
        'Będzino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koszaliński'
            LIMIT 1
        )
    ), (
        'Biesiekierz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koszaliński'
            LIMIT 1
        )
    ), (
        'Bobolice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koszaliński'
            LIMIT 1
        )
    ), (
        'Manowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koszaliński'
            LIMIT 1
        )
    ), (
        'Mielno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koszaliński'
            LIMIT 1
        )
    ), (
        'Polanów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koszaliński'
            LIMIT 1
        )
    ), (
        'Sianów', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koszaliński'
            LIMIT 1
        )
    ), (
        'Świeszyno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat koszaliński'
            LIMIT 1
        )
    ), (
        'Barlinek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myśliborski'
            LIMIT 1
        )
    ), (
        'Boleszkowice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myśliborski'
            LIMIT 1
        )
    ), (
        'Dębno (gmina w województwie zachodniopomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myśliborski'
            LIMIT 1
        )
    ), (
        'Myślibórz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myśliborski'
            LIMIT 1
        )
    ), (
        'Nowogródek Pomorski', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat myśliborski'
            LIMIT 1
        )
    ), (
        'Dobra (Szczecińska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat policki'
            LIMIT 1
        )
    ), (
        'Kołbaskowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat policki'
            LIMIT 1
        )
    ), (
        'Nowe Warpno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat policki'
            LIMIT 1
        )
    ), (
        'Police', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat policki'
            LIMIT 1
        )
    ), (
        'Bielice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pyrzycki'
            LIMIT 1
        )
    ), (
        'Kozielice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pyrzycki'
            LIMIT 1
        )
    ), (
        'Lipiany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pyrzycki'
            LIMIT 1
        )
    ), (
        'Przelewice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pyrzycki'
            LIMIT 1
        )
    ), (
        'Pyrzyce', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pyrzycki'
            LIMIT 1
        )
    ), (
        'Warnice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat pyrzycki'
            LIMIT 1
        )
    ), (
        'Darłowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sławieński'
            LIMIT 1
        )
    ), (
        'Sławno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sławieński'
            LIMIT 1
        )
    ), (
        'Darłowo (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sławieński'
            LIMIT 1
        )
    ), (
        'Malechowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sławieński'
            LIMIT 1
        )
    ), (
        'Postomino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sławieński'
            LIMIT 1
        )
    ), (
        'Sławno (gmina wiejska w województwie zachodniopomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat sławieński'
            LIMIT 1
        )
    ), (
        'Stargard', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Chociwel', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Dobrzany', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Dolice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Ińsko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Kobylanka', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Marianowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Stara Dąbrowa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Stargard (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Suchań', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat stargardzki'
            LIMIT 1
        )
    ), (
        'Szczecinek', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczecinecki'
            LIMIT 1
        )
    ), (
        'Barwice', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczecinecki'
            LIMIT 1
        )
    ), (
        'Biały Bór', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczecinecki'
            LIMIT 1
        )
    ), (
        'Borne Sulinowo', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczecinecki'
            LIMIT 1
        )
    ), (
        'Grzmiąca', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczecinecki'
            LIMIT 1
        )
    ), (
        'Szczecinek (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat szczecinecki'
            LIMIT 1
        )
    ), (
        'Świdwin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdwiński'
            LIMIT 1
        )
    ), (
        'Brzeżno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdwiński'
            LIMIT 1
        )
    ), (
        'Połczyn-Zdrój', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdwiński'
            LIMIT 1
        )
    ), (
        'Rąbino', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdwiński'
            LIMIT 1
        )
    ), (
        'Sławoborze', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdwiński'
            LIMIT 1
        )
    ), (
        'Świdwin (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat świdwiński'
            LIMIT 1
        )
    ), (
        'Wałcz', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałecki'
            LIMIT 1
        )
    ), (
        'Człopa', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałecki'
            LIMIT 1
        )
    ), (
        'Mirosławiec', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałecki'
            LIMIT 1
        )
    ), (
        'Tuczno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałecki'
            LIMIT 1
        )
    ), (
        'Wałcz (gmina wiejska)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat wałecki'
            LIMIT 1
        )
    ), (
        'Dobra (gmina w województwie zachodniopomorskim)', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łobeski'
            LIMIT 1
        )
    ), (
        'Łobez', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łobeski'
            LIMIT 1
        )
    ), (
        'Radowo Małe', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łobeski'
            LIMIT 1
        )
    ), (
        'Resko', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łobeski'
            LIMIT 1
        )
    ), (
        'Węgorzyno', (
            SELECT id
            FROM powiaty
            WHERE name = 'Powiat łobeski'
            LIMIT 1
        )
    ), (
        'Koszalin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Koszalin'
            LIMIT 1
        )
    ), (
        'Szczecin', (
            SELECT id
            FROM powiaty
            WHERE name = 'Szczecin'
            LIMIT 1
        )
    ), (
        'Świnoujście', (
            SELECT id
            FROM powiaty
            WHERE name = 'Świnoujście'
            LIMIT 1
        )
    )