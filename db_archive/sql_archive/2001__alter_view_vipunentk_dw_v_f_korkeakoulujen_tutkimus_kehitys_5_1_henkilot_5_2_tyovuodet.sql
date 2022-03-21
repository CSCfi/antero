USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]    Script Date: 4.12.2018 15:54:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] AS

--Select * into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet

--Delete from VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet
--Insert into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet Select * from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet

SELECT [tilastovuosi]
      ,[tilv_date]
      ,[oppilaitos_avain]
      ,[oppilaitos_id]
      --,[oppilaitos_sijaintikunta_avain]
      --,[oppilaitos_sijaintikunta_id]
      ,[tieteenala_avain]
      ,[tieteenala_id]
      ,[virkaryhma_avain]
      ,[virkaryhma_id]
      ,[ika_avain]
      ,[ika_id]
      ,[sukupuoli_avain]
      ,[sukupuoli_id]
      ,[tutkintotaso_avain]
      ,[tutkintotaso_id]
	  ,[koulutusaste_taso2_avain]
	  ,[koulutusaste_taso2_id]
      ,[lkm_tutkimushenkilokunta]
      ,[lkm_tutkimustyovuodet] = Cast(NULL as decimal(8,4))
	  ,[apuraha] = Cast(NULL as decimal(8,4))
      ,[tietolahde]
      ,[rivinumero]
  FROM [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot]

UNION ALL

SELECT [tilastovuosi]
      ,[tilv_date]
      ,[oppilaitos_avain]
      ,[oppilaitos_id]
      --,[oppilaitos_sijaintikunta_avain]
      --,[oppilaitos_sijaintikunta_id]
      ,[tieteenala_avain]
      ,[tieteenala_id]
      ,[virkaryhma_avain]
      ,[virkaryhma_id]
      ,[ika_avain]
      ,[ika_id]
      ,[sukupuoli_avain]
      ,[sukupuoli_id]
      ,[tutkintotaso_avain]
      ,[tutkintotaso_id]
	  ,[koulutusaste_taso2_avain]
	  ,[koulutusaste_taso2_id]
      ,[lkm_tutkimushenkilokunta] = Cast(NULL as int)
      ,[lkm_tutkimustyovuodet]
	  ,[apuraha]
      ,[tietolahde]
      ,[rivinumero]
  FROM [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_2_tyovuodet]

GO

USE [ANTERO]
