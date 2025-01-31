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

CREATE TABLE Language
(
ID int NOT NULL PRIMARY KEY,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
);

INSERT INTO Language(ID, Code, Language)
VALUES (1, 'EST', 'eesti'), (2, 'RUS', 'vene'), (3, 'ENG', 'inglise'), (4, 'DE', 'saksa')

Create table keeleValik(
keeleValikId int primary key identity(1,1),
valikuNimetus varchar(10) not null, 
opilaneId int,
Foreign key (opilaneId) references opilane(opilaneId),
Language int,
Foreign key (Language) references Language (ID)
)
select * from keelevalik;
select * from Language;
select * from opilane;

INSERT INTO keeleValik(valikuNimetus, opilaneId, Language)
Values('valik E', 3, 3)

SELECT opilane.eesnimi, Language.Language 
FROM opilane, Language, keelevalik
WHERE opilane.opilaneId=keelevalik.opilaneId
AND Language.ID=keelevalik.Language

SELECT * 
FROM opilane, Language, keelevalik
WHERE opilane.opilaneId=keelevalik.opilaneId
AND Language.ID=keelevalik.Language

Create table oppiminee(
oppimineId int primary key identity(1,1),
aine varchar(10) not null, 
opilaneId int,
aasta int,
hinne int,
opetaja varchar(20) not null,
)

select * from oppiminee;

INSERT INTO oppiminee (aine, opilaneId, aasta, hinne, opetaja)
Values ('Vene Keel', 1, 2008, 5, 'Orlenko')
