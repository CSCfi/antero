USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_katsomusaineet f_2_27a]    Script Date: 19.1.2026 12.38.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

















CREATE OR ALTER PROCEDURE [dbo].[p_lataa_f_katsomusaineet f_2_27a] AS

TRUNCATE TABLE  [VipunenTK].[dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta]

INSERT INTO [VipunenTK].[dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta]
SELECT 
       [tilastovuosi]  = f.tilv
      ,[tilv_date] = f.tilv_date
      ,[koulutuksen_sijaintimaakunta] = f.kmaak
      ,[koulutuksen_sijaintimaakunta_id] = coalesce(d1.id, -1)
      ,[vuosiluokat] = f.vuosiluokat
      ,[vuosiluokat_id] = coalesce(d2.id, -1)
      ,[katsomusaine] = f.aine
      ,[katsomusaine_id] = coalesce(d3.id, -1)
      ,[lkm] = f.lkm
  FROM [VipunenTK_DW].[dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta] f
  LEFT JOIN VipunenTK..v_d_maakunta d1 ON d1.maakunta_koodi = f.kmaak
  LEFT JOIN VipunenTK..d_perusopetuksen_vuosiluokat d2 ON d2.vuosiluokka_koodi = f.vuosiluokat AND f.tilv_date between d2.alkaa and d2.paattyy
  LEFT JOIN VipunenTK..d_katsomusaine AS d3 ON d3.katsomusaine_koodi=f.aine AND f.tilv_date between d3.alkaa and d3.paattyy

GO


