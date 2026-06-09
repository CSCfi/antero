USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_katsomusaineet f_2_27b]    Script Date: 19.1.2026 12.39.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






















CREATE OR ALTER PROCEDURE [dbo].[p_lataa_f_katsomusaineet_f_2_27b] AS

TRUNCATE TABLE  [VipunenTK].[dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja]

INSERT INTO [VipunenTK].[dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja]
SELECT 
       [tilastovuosi]  = f.tilv
      ,[tilv_date] = f.tilv_date
	  ,[jarjestaja] = f.jarj
	  ,[jarjestaja_id] = coalesce(d1.id, -1)
      ,[koulutuksen_sijaintimaakunta] = f.kmaak
      ,[koulutuksen_sijaintimaakunta_id] = coalesce(d2.id, -1)
      ,[vuosiluokat] = f.vuosiluokat
      ,[vuosiluokat_id] = coalesce(d3.id, -1)
	  ,[katsomusaine] = f.aine
      ,[katsomusaine_id] = coalesce(d4.id, -1)
	  ,[lkm]
  FROM [VipunenTK_DW].[dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja] f
  LEFT JOIN VipunenTK..d_jarjestaja d1 ON d1.[koulutuksen_jarjestajakoodi] = f.jarj and d1.tilv = f.tilv
  LEFT JOIN VipunenTK..v_d_maakunta d2 ON d2.maakunta_koodi = f.kmaak
  LEFT JOIN VipunenTK..d_perusopetuksen_vuosiluokat d3 ON d3.vuosiluokka_koodi = f.vuosiluokat AND f.tilv_date between d3.alkaa and d3.paattyy
  LEFT JOIN VipunenTK..d_katsomusaine AS d4 ON d4.katsomusaine_koodi=f.aine AND f.tilv_date between d4.alkaa and d4.paattyy

GO


