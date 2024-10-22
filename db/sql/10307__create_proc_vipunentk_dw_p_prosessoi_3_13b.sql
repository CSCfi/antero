USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_prosessoi_3_13b]    Script Date: 22.10.2024 17:00:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- Lisätään _f_koulutukseen_sijoittuneet_8v_tarkastelu taulun eri tarkastelujaksoille tarkastelujakso 0 koulutustieto (id-tunnus VipunenTK.dbo.d_koulutusluokitus tauluun)

CREATE OR ALTER PROCEDURE [dbo].[p_prosessoi_3_13b] AS

WITH sijoittuneet_tj0_cte(aineistorivinumero, tilv, id)
AS
(SELECT [aineistorivinumero]
      ,[tilv]    
	  ,k.id
FROM [VipunenTK_DW].[dbo].[_f_koulutukseen_sijoittuneet_8v_tarkastelu] f
JOIN VipunenTK.dbo.d_koulutusluokitus k on k.koulutusluokitus_avain = f.koulutus
WHERE tarkastelujakso = '0' and f.koulutus <> '')

UPDATE f
SET f.[tj0_koul_luokitus_id] = c.id
FROM [dbo].[_f_koulutukseen_sijoittuneet_8v_tarkastelu] f
JOIN sijoittuneet_tj0_cte c ON f.tilv = c.tilv and f.aineistorivinumero = c.aineistorivinumero




GO


