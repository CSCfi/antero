USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_koulutukseen_sijoittuneet_6v]    Script Date: 7.2.2024 9:38:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Eri tarkastelujaksojen välisen yhtenäisen rivinumeroinnin tähden tarvitaan sa-taululataus heti alkuun. Mika Rissanen 07.022024.

ALTER PROCEDURE [dbo].[p_lataa_koulutukseen_sijoittuneet_6v] AS

TRUNCATE TABLE [VipunenTK_DW].[dbo].[sa_K3_13_Perusk_paattaneet_amm_tutk_suorittaneet];
INSERT INTO [VipunenTK_DW].[dbo].[sa_K3_13_Perusk_paattaneet_amm_tutk_suorittaneet] SELECT *  FROM [VipunenTK_SA].[dbo].[v_K3_13_Perusk_paattaneet_amm_tutk_suorittaneet];

TRUNCATE TABLE [VipunenTK_DW].[dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu];

EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_0__valittomasti_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_0_5_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_1_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_1_5_tarkastelujakso;

EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_2_0_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_2_5_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_3_0_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_3_5_tarkastelujakso;

EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_4_0_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_4_5_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_5_0_tarkastelujakso;

EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_6v_ensimmainen_laskenta;



GO


