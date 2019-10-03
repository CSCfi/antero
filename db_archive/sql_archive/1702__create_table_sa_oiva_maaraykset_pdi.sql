USE [ANTERO]

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_oiva_maaraykset_pdi')
BEGIN
CREATE TABLE sa.sa_oiva_maaraykset_pdi
	(
	  id INT
	, lupaId INT
	, "kohde.tunniste" NVARCHAR(100)
	, koodisto NVARCHAR(100)
	, koodiarvo NVARCHAR(100)
	, arvo INT
	, "maaraystyyppi.tunniste" NVARCHAR(50)
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
