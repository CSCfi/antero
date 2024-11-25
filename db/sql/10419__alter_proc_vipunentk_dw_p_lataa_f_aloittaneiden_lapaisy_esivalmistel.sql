USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_aloittaneiden_lapaisy_esivalmistelu]    Script Date: 25.11.2024 21:14:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[p_lataa_f_aloittaneiden_lapaisy_esivalmistelu] AS

--EXECUTE p_lataa_f_aloittaneiden_lapaisy_esivalmistelu

/* Ajetaan alla oleva vain kun läpäisyn päättelyajo on ajettu läpi / Jarmo 29.1.2014
-- Päivitetty uudelleen nimettyjä dimensiotauluja vasten devissä 7.3.2014 / Lasse
--Otetaan näkymä talteen tauluun ajon nopeuttamiseksi

--Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
--Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
--  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
*/

Truncate table VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet 

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet_historia

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in (/*'0,5', */'1', '1,5', '2', '2,5', '3');

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('3,5', '4', '4,5', '5', '5,5', '6');

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('6,5', '7', '7,5', '8', '8,5', '9');

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('9,5', '10', '10,5', '11', '11,5', '12');

Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('12,5', '13', '13,5', '14', '14,5' /*, '15' */);
/*
Insert into VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
  Select * from VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_lasketut_sarakkeet
  where tarkasteluperiodi_char in ('15,5', '16', '16,5', '17', '17,5')--, '18')
*/


GO


