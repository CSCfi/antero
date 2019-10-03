USE [ANTERO]

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_oiva_jarjestysluvat')
BEGIN
CREATE TABLE sa.sa_oiva_jarjestysluvat
(
  id int
, edellinen_lupa_id int
, paatoskierros_id int
, lupatila_id int
, asiatyyppi_id INT
, diaarinumero NVARCHAR(100)
, jarjestajaYtunnus NVARCHAR(12)
, jarjestajaOid NVARCHAR(100)
, alkupvm DATETIME
, loppupvm DATETIME
, "meta.kirje" NVARCHAR(4000)
, "meta.ministeri" NVARCHAR(100)
, "meta.ministeri_nimike" NVARCHAR(100)
, "meta.esittelija" NVARCHAR(100)
, "meta.esittelija_nimike" NVARCHAR(100)
, "meta.paatos_old_id" int
, "meta.koulutustehtava_old_id" int
, maksu BIT
, luoja NVARCHAR(100)
, luontipvm DATETIME
, paivittaja NVARCHAR(100)
, paivityspvm DATETIME
, source NVARCHAR(100)
, loadtime DATETIME
, username NVARCHAR(100)
)
;
END
