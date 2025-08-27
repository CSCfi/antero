USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_koulutukseen_sijoittuneet_8v]    Script Date: 22.10.2024 16:55:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












-- Eri tarkastelujaksojen välisen yhtenäisen rivinumeroinnin tähden tarvitaan sa-taululataus heti alkuun. Mika Rissanen 07.02.2024.

CREATE OR ALTER PROCEDURE [dbo].[p_lataa_koulutukseen_sijoittuneet_8v] AS

TRUNCATE TABLE [VipunenTK_DW].[dbo].[sa_K3_13b_Perusk_paattaneet_amm_tutk_suorittaneet];
INSERT INTO [VipunenTK_DW].[dbo].[sa_K3_13b_Perusk_paattaneet_amm_tutk_suorittaneet] SELECT * FROM [VipunenTK_SA].[dbo].[v_K3_13b_Perusk_paattaneet_amm_tutk_suorittaneet];

TRUNCATE TABLE [VipunenTK_DW].[dbo].[_koulutukseen_sijoittuneet_8v_tarkastelu];

EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_0__valittomasti_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_0_5_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_1_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_1_5_tarkastelujakso;

EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_2_0_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_2_5_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_3_0_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_3_5_tarkastelujakso;

EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_4_0_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_4_5_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_5_0_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_5_5_tarkastelujakso;

EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_6_0_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_6_5_tarkastelujakso;
EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_7_0_tarkastelujakso;


EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_ensimmainen_laskenta;

--EXEC [VipunenTK_SA].[dbo].p_lataa_f_koulutukseen_sijoittuneet_8v_visualisointi;

GO


