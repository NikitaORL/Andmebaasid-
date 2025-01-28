--AB loomine
create database OrlenkoBaas;

use OrlenkoBaas;
create table opilane(
opilaneId int primary key identity(1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskimine_hinne decimal(2,1)
)
select * from opilane;
--andmete lisamine tabekelisse
INSERT INTO opilane(
eesnimi,
perenimi,
synniaeg,
stip,
keskimine_hinne)
VALUES(
'Nikita',
'Nikita',
'2008-10-10',
1,
4.5),
(
'Nikita2',
'Nikita2',
'2008-10-10',
1,
4.5)
--drop table opilane (почистить таблицу)
DELETE FROM opilane WHERE opilaneId=2;

--andmete uuendamine
UPDATE opilane SET aadress='Tartu'
Where opilaneId=3
