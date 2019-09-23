USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_aloittaneiden_lapaisy_esivalmistelu_T1285]    Script Date: 16.9.2019 9:26:47 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_f_aloittaneiden_lapaisy_esivalmistelu_T1285]
GO

DROP PROCEDURE IF EXISTS [dbo].[p_lataa_f_aloittaneiden_lapaisy_esivalmistelu]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_aloittaneiden_lapaisy_esivalmistelu_T1285]    Script Date: 16.9.2019 9:26:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[p_lataa_f_aloittaneiden_lapaisy_esivalmistelu] AS

--EXECUTE p_lataa_f_aloittaneiden_lapaisy_esivalmistelu

/* Ajetaan alla oleva vain kun läpäisyn päättelyajo on ajettu läpi / Jarmo 29.1.2014
-- Päivitetty uudelleen nimettyjä dimensiotauluja vasten devissä 7.3.2014 / Lasse
--Otetaan näkymä talteen tauluun ajon nopeuttamiseksi

--Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
--Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
--  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
*/
Truncate table VipunenTK.dbo.f_aloittaneiden_lapaisy
Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet 

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('0,5', '1', '1,5', '2', '2,5', '3')
EXEC dbo.p_lataa_f_aloittaneiden_lapaisy;
Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('3,5', '4', '4,5', '5', '5,5', '6')
EXEC dbo.p_lataa_f_aloittaneiden_lapaisy;
Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('6,5', '7', '7,5', '8', '8,5', '9')
EXEC dbo.p_lataa_f_aloittaneiden_lapaisy;
Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('9,5', '10', '10,5', '11', '11,5', '12')
EXEC dbo.p_lataa_f_aloittaneiden_lapaisy;
Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('12,5', '13', '13,5', '14', '14,5', '15')
EXEC dbo.p_lataa_f_aloittaneiden_lapaisy;
Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet

-- Jos halutaan enemmän tarkastelujaksoja, täytyy ne lisätä myös proseduuriin p_lataa_sa_aloittaneiden_lapaisy_tiivistetty_nykytila ja mahdollisesti C#-koodiin / jsyrjala 20.9.2019
/*
Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('15,5', '16', '16,5', '17', '17,5', '18')
EXEC dbo.p_lataa_f_aloittaneiden_lapaisy;
Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
*/

--dwitestdesk1
--22.3.2016
--(6976260 row(s) affected)
--(6976260 row(s) affected)
--(6976260 row(s) affected)
--(6976260 row(s) affected)
--(4650840 row(s) affected)
--(0 row(s) affected)
--04:14:02

--dwitestdesk1
--23.10.2015
--(11644386 row(s) affected)
--(11644386 row(s) affected)
--(11644386 row(s) affected)
--(11644386 row(s) affected)
--(7762924 row(s) affected)
--10:47:37


--6.1.2015
--(10351908 row(s) affected)
--(10351908 row(s) affected)
--(10351908 row(s) affected)
--(10351908 row(s) affected)
--(3450636 row(s) affected)
--09:49:13

-- Drop table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
-- Select top 0 * into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet 






GO

USE [ANTERO]