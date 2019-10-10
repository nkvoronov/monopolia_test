USE MonopoliaTest;
GO

SET NOCOUNT ON;

/***  Добавление клиентов  **/
BEGIN TRANSACTION;
INSERT INTO CLIENTS (NAME) VALUES ('Anna Ross');
INSERT INTO CLIENTS (NAME) VALUES ('Darunok');
INSERT INTO CLIENTS (NAME) VALUES ('Flower Avenue');
INSERT INTO CLIENTS (NAME) VALUES ('LLC Pesoto');
INSERT INTO CLIENTS (NAME) VALUES ('Pride&Joy');
INSERT INTO CLIENTS (NAME) VALUES ('BlankNote');
INSERT INTO CLIENTS (NAME) VALUES ('RoyalBag');
INSERT INTO CLIENTS (NAME) VALUES ('Kigurumi');
INSERT INTO CLIENTS (NAME) VALUES ('Plasto Ok');
INSERT INTO CLIENTS (NAME) VALUES ('Kingway');
INSERT INTO CLIENTS (NAME) VALUES ('Media Display');
COMMIT;
GO

/***  Добавление товаров  **/
BEGIN TRANSACTION;
INSERT INTO GOODS (NAME) VALUES ('Ручка роллер Parker');
INSERT INTO GOODS (NAME) VALUES ('Ручка гелевая автоматическая');
INSERT INTO GOODS (NAME) VALUES ('Карандаши простые');
INSERT INTO GOODS (NAME) VALUES ('Фломастеры 18цв.');
INSERT INTO GOODS (NAME) VALUES ('Ластик-клячка Koh-i-noor');
INSERT INTO GOODS (NAME) VALUES ('Линейка 15см металл Buromax');
INSERT INTO GOODS (NAME) VALUES ('Лазерная линейка CP - 3010');
INSERT INTO GOODS (NAME) VALUES ('Стакан для ручек');
INSERT INTO GOODS (NAME) VALUES ('Стакан для ручек и карандашей');
INSERT INTO GOODS (NAME) VALUES ('Набор картриджей 4шт синих');
INSERT INTO GOODS (NAME) VALUES ('Стержень капиллярный к ручкам-роллерам');
INSERT INTO GOODS (NAME) VALUES ('Нож канцелярский лезвие 9мм');
INSERT INTO GOODS (NAME) VALUES ('Ножницы титановые Santi 3D');
INSERT INTO GOODS (NAME) VALUES ('Корректор-лента Buromax');
INSERT INTO GOODS (NAME) VALUES ('Корректирующая жидкость Axent 20мл');
INSERT INTO GOODS (NAME) VALUES ('Скобы для степлера №23');
INSERT INTO GOODS (NAME) VALUES ('Бумага для дизайна Роса Talent А4');
INSERT INTO GOODS (NAME) VALUES ('Economix Скобы к степлеру №10');
INSERT INTO GOODS (NAME) VALUES ('Степлер пластиковый к 10арк.');
INSERT INTO GOODS (NAME) VALUES ('Резинки для денег');
INSERT INTO GOODS (NAME) VALUES ('Клей ПВА Buromax Евроколпачок');
INSERT INTO GOODS (NAME) VALUES ('Клей ПВА 50 гр');
INSERT INTO GOODS (NAME) VALUES ('Дырокол Buromax мощность 100л.');
INSERT INTO GOODS (NAME) VALUES ('Дырокол металлический Buromax мощность 30л.');
COMMIT;
GO

SET NOCOUNT OFF;