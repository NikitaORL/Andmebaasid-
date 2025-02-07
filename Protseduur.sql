(localdb)\MSSQLLocalDB
-- SQL salvestatud protseduur - ?
See on funktsioon, mis käivitab serveris mitu SQL tegevust järjest. 
 Kasutame SQL Server

Create database protseduurOrlenko;
use protseduurOrlenko;
create table linn(
linnId int Primary Key identity (1,1),
linnNimi varchar(30),
rahvaArv int);

SELECT * FROM linn 
insert into linn (linnNimi, rahvaArv)
values 
('Tallinn', 440000),
('Narva', 53000),
('Tartu', 95000)

--Protseduri loomine
-- protseduur, mis lisab uus linn ja kohe näitab tabelis

create procedure lisalinn
@lnimi varchar(30),
@rArv int 
AS
BEGIN
insert into linn (linnNimi, rahvaArv)
values 
(@lnimi, @rArv);
SELECT * FROM linn
END;

--protseduuri kutse
EXEC lisalinn @lnimi='Tallinn234', @rArv=440000
--lihtsam 
EXEC lisalinn 'Saaremaa', 40000
--kirje kustutamine
DELETE FROM linn WHERE linnId=3;

--protseduur, mis kuturab linn id järgi
CREATE PROCEDURE kustutaLinn
@deleteId int
AS
BEGIN
DELETE FROM linn WHERE linnId=@deleteId
SELECT * FROM linn
END;

--kutse
EXEC kustutaLinn 4;
--proceduri kustumine 
DROP Procedure kustutaLinn;

--Protseduur, mis otsib linn esimese tähte järgi
CREATE procedure linnaotsing
@taht char(1)
AS
BEGIN
SELECT * FROM linn 
WHERE linnNimi LIKE @taht + '%';
--% - see on kõik teised tähed 
END;
--kutse
EXEC linnaotsing T;

--------------------------------------------------------------------------------------------------------------------------
Kasutamine XAMPP / localhost

Create database protseduurOrlenko;
use protseduurOrlenko;
create table linn(
linnId int Primary Key identity (1,1),
linnNimi varchar(30),
rahvaArv int);

SELECT * FROM linn 
insert into linn (linnNimi, rahvaArv)
values 
('Tallinn', 440000),
('Narva', 53000),
('Tartu', 95000)

--Protseduri loomine
-- protseduur, mis lisab uus linn ja kohe näitab tabelis

create procedure lisalinn
@lnimi varchar(30),
@rArv int 
AS
BEGIN
insert into linn (linnNimi, rahvaArv)
values 
(@lnimi, @rArv);
SELECT * FROM linn
END;

--protseduuri kutse
EXEC lisalinn @lnimi='Tallinn234', @rArv=440000
--lihtsam 
EXEC lisalinn 'Saaremaa', 40000
--kirje kustutamine
DELETE FROM linn WHERE linnId=3;

--protseduur, mis kuturab linn id järgi
CREATE PROCEDURE kustutaLinn
@deleteId int
AS
BEGIN
DELETE FROM linn WHERE linnId=@deleteId
SELECT * FROM linn
END;

--kutse
EXEC kustutaLinn 4;
--proceduri kustumine 
DROP Procedure kustutaLinn;

--Protseduur, mis otsib linn esimese tähte järgi
CREATE procedure linnaotsing
@taht char(1)
AS
BEGIN
SELECT * FROM linn 
WHERE linnNimi LIKE @taht + '%';
--% - see on kõik teised tähed 
END;
--kutse
EXEC linnaotsing T;

--tabeli uuendamine - rahvaarv kasvab 10% võrra
UPDATE linn set rahvaArv=rahvaArv*1.1
SELECT * FROM linn;
UPDATE linn set rahvaArv=rahvaArv*1.1
WHERE linnId=7;

CREATE PROCEDURE rahvaArvuUuendus
@linnId int ,
@koef decimal(2,1)
AS
BEGIN
UPDATE linn set rahvaArv=rahvaArv*@koef
WHERE linnId=@linnId;
SELECT * FROM linn;
END;

EXEC rahvaArvuUuendus 7, 1.2;

drop procedure rahvaArvuUuendus
--------------------------------------------------------------------------------
CREATE database protseduurORL
use protseduurORL
create table linn(
linnId int Primary Key identity (1,1),
linnNimi varchar(30),
rahvaArv int);

SELECT * FROM linn 
insert into linn (linnNimi, rahvaArv)
values 
('Tallinn', 440000),
('Narva', 53000),
('Tartu', 95000)

create procedure lisalinn
@lnimi varchar(30),
@rArv int 
AS
BEGIN
insert into linn (linnNimi, rahvaArv)
values 
(@lnimi, @rArv);
SELECT * FROM linn
END;

EXEC lisalinn @lnimi='Tallinn234', @rArv=440000
--lihtsam 
EXEC lisalinn 'Saaremaa', 40000
--kirje kustutamine

ALTER TABLE linn (...
SELECT * FROM linn;
--uue veeru lisamine
ALTER TABLE linn ADD test int;
--veruu kustutamine
ALTER TABLE linn DROP COLUMN test;

CREATE PROCEDURE veeruLisaKustuta
@valik varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20)=null

AS
BEGIN
declare @SQLtegevus as varchar(max)
set @SQLtegevus=case
when @valik='add' then concat ('ALTER TABLE linn ADD ',  @veerunimi, ' ', @tyyp)
when @valik='drop' then concat ('ALTER TABLE linn DROP COULM ',  @veerunimi)
END;
print @SQLtegevus;
begin
EXEC (@SQLtegevus);
END
END;

--kutse
EXEC veeruLisaKustuta @valik='add',@veerunimi='test3', @tyyp='int';
SELECT * FROM linn;
EXEC veeruLisaKustuta @valik='drop', @veerunimi='test3';

--------------------------------------------------------------


CREATE PROCEDURE veeruLisaKustutaTabelis
@valik varchar(20),
@veerunimi varchar(20),
@tabelinimi varchar(20),
@tyyp varchar(20)=null

AS
BEGIN
declare @SQLtegevus as varchar(max)
set @SQLtegevus=case
when @valik='add' then concat (' ALTER TABLE ', @tabelinimi, ' ADD ' ,  @veerunimi, ' ', @tyyp)
when @valik='drop' then concat (' ALTER TABLE ', @tabelinimi, ' DROP CO ',  @veerunimi)
END;
print @SQLtegevus;
begin
EXEC (@SQLtegevus);
END
END;

--kutse
EXEC veeruLisaKustutaTabelis @valik='add', @tabelinimi='linn', @veerunimi='test3', @tyyp='int';
SELECT * FROM linn;
EXEC veeruLisaKustutaTabelis @valik='drop', @tabelinimi='linn', @veerunimi='test3';

--protseduur tingimusega
create procedure rahvaHinnanng
@piir int


AS
BEGIN
SELECT linnNimi, IIF(rahvaArv<@piir, 'väike linn', 'suur linn') AS Hinnang
FROM linn;


END;

DROP PROCEDURE rahvaHinnanng

EXEC rahvaHinnanng 100000;
--Agregaat funktsioonid: sum(), AVERAGE - AVG(), MIN(), MAX(), COUNT()

CREATE PROCEDURE kokkuRahvaArv

AS
BEGIN
SELECT SUM(rahvaArv) AS 'kokku rahvaArv', AVG(rahvaArv) AS 'keskmine rahvaArv', COUNT(*) AS 'linnade arv' 
FROM linn;
END;

EXEC kokkuRahvaArv;
