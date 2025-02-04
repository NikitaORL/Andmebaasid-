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
