USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_prosessoi_3_13]    Script Date: 1.2.2024 12:30:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[p_prosessoi_3_13]

GO


-- Lis‰t‰‰n _f_koulutukseen_sijoittuneet_6v_tarkastelu taulun eri tarkastelujaksoille tarkastelujakso 0 koulutustieto (id-tunnus VipunenTK.dbo.d_koulutusluokitus tauluun)

CREATE PROCEDURE [dbo].[p_prosessoi_3_13] AS

WITH sijoittuneet_tj0_cte(aineistorivinumero, tilv, id)
AS
(SELECT [aineistorivinumero]
      ,[tilv]    
	  ,k.id
FROM [VipunenTK_DW].[dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu] f
JOIN VipunenTK.dbo.d_koulutusluokitus k on k.koulutusluokitus_avain = f.koulutus
WHERE tarkastelujakso = '0' and f.koulutus <> '')

UPDATE f
SET f.[tj0_koul_luokitus_id] = c.id
FROM [dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu] f
JOIN sijoittuneet_tj0_cte c ON f.tilv = c.tilv and f.aineistorivinumero = c.aineistorivinumero




GO


