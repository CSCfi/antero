USE [VipunenTK_lisatiedot]
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' and TABLE_NAME='tieteenala') BEGIN

/*
Haapamäki pyysi Tilastokeskusta päivittämään tieteenalaluokituksen
https://www.stat.fi/meta/luokitukset/tieteenala/001-2010/index.html

Päivityksessä muutettiin tieteenala2010 koodi 3121 Sisätaudit alla olevaan muotoon
tieteenala2010	tieteenala2010_SV	tieteenala2010_EN
3121 Sisätaudit	3121 Invärtesmedicin	3121 Internal medicine
*/
UPDATE [dbo].[tieteenala]
   SET 
       [tieteenala2010] = '3121 Yleislääketiede, sisätaudit ja muut kliiniset lääketieteet' --old: 3121 Sisätaudit
      ,[tieteenala2010_SV] = '3121 Allmän medicin, inre medicin och annan klinisk medicin' --old: 3121 Invärtesmedicin
      ,[tieteenala2010_EN] = '3121 General medicine, internal medicine and other clinical medicine' --old: 3121 Internal medicine
	  ,[kommentti] = 'OKM Haapamäki, TK luokituksen päivitys'

 WHERE [id]=85;
END;


USE [ANTERO]