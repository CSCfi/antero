USE [VipunenTK_DW]
GO

DROP PROCEDURE IF EXISTS [dbo].[p_lataa_f_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]    Script Date: 3.2.2022 19:39:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[p_lataa_f_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi] AS

DROP TABLE IF EXISTS VipunenTK.dbo.f_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi

SELECT [tilv]
      ,[tunn]
	  ,[tunn_id] = coalesce(d1.id, -1)
      ,[jarj]
	  ,[jarj_id] = coalesce(d2.id, -1)
	  ,[vst_oltyp]
	  ,[vst_oltyp_id] = coalesce((select top 1 id from VipunenTK.dbo.d_oppilaitoksen_taustatiedot where oppilaitostyyppikoodi = vst_oltyp), -1)
	  ,[lkm_brutto]
	  ,[lkm_netto]

INTO [VipunenTK].[dbo].f_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi

FROM VipunenTK_DW.dbo.sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi f
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitos_avain = f.tunn
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2 on d2.oppilaitos_avain = f.jarj


GO


