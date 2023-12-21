USE [VipunenTK]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7]    Script Date: 21.12.2023 15:37:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Drop table if exists VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_aiempi_koulutus_4_7_yhteiset
GO

Select top 0 * into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_aiempi_koulutus_4_7_yhteiset from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_aikaisempi_koulutus_yhteiset]


