USE [VipunenTK_DW]
GO

ALTER PROCEDURE [dbo].[p_lataa_f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan] AS

TRUNCATE TABLE [VipunenTK].[dbo].[f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]

INSERT INTO [VipunenTK].[dbo].[f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]
SELECT [tilv]
      ,COALESCE(d1.id, 69) AS aidinkieli_I_id
      ,COALESCE(d2.id, -1) AS aidinkieli_II_id
      ,d3.id AS alueluokitus_id
      ,d4.id AS ika_id
      ,COALESCE(d5.id, -1) AS koulutusala_id
      ,COALESCE(d6.id, 20) AS koulutusaste_id
	  ,COALESCE(d7.id, -1) AS koulutusala_taso1_id
      ,COALESCE(d8.id, -1) AS koulutusaste_taso2_id
      ,[lkm]
  FROM [VipunenTK_SA].[dbo].[v_sa_K4_22_Yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan] f
  LEFT JOIN [VipunenTK].[dbo].[d_aidinkieli_versio2] d1 ON f.aikieli = d1.aidinkieli_versio2_koodi
  LEFT JOIN [VipunenTK].[dbo].[d_kieli] d2 ON f.aikieli = d2.kieli_koodi
  LEFT JOIN [VipunenTK].[dbo].[d_alueluokitus] d3 ON RIGHT('00' + f.tilvaskun, 3) = d3.kunta_koodi
  LEFT JOIN [VipunenTK].[dbo].[d_ika] d4 ON f.ikar5 = d4.ika_avain
  LEFT JOIN [VipunenTK].[dbo].[d_opetushallinnon_koulutusala] d5 ON f.opmala = d5.koulutusala_koodi
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusaste_2002] d6 ON f.opmast = d6.koulutusaste_2002koodi
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d7 ON 'ISCFIBROAD'+f.iscfibroad2013=d7.koulutusluokitus_avain
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d8 ON 'KASTET2'+f.kaste_t2=d8.koulutusluokitus_avain


  GO

  USE [ANTERO]