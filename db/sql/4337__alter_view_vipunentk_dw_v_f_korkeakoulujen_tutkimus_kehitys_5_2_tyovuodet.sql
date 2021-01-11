USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_2_tyovuodet]    Script Date: 7.1.2021 21:50:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_2_tyovuodet] AS
--
--Select * into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_2_tyovuodet from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_2_tyovuodet

--Delete from VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_2_tyovuodet 
--Insert into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_2_tyovuodet Select * from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_2_tyovuodet 


SELECT [tilastovuosi]
      ,[tilv_date]
      ,f.[oppilaitos_avain]
      ,[oppilaitos_id] = ISNULL(d_ol.id, -1)
      --,[oppilaitos_sijaintikunta_avain] = ISNULL(d_ol.sijaintikuntakoodi, '-1')
      --,[oppilaitos_sijaintikunta_id] = ISNULL(d_ol_al.id, -1)
      ,f.[tieteenala_avain]
      ,[tieteenala_id] = ISNULL(d_ta.id, -1)
      ,[virkaryhma_avain]
      ,[virkaryhma_id] = ISNULL(d_vr.id, -1)
      ,f.[ika_avain]
      ,[ika_id] = ISNULL(d_ika.id, -1)
      ,[sukupuoli_avain]
      ,[sukupuoli_id] = ISNULL(d_sp.id, -1)
      ,[tutkintotaso_avain]
      ,[tutkintotaso_id] = ISNULL((SELECT TOP 1 id from VipunenTK.dbo.d_koulutusluokitus where koulutusluokitus_avain='KASTET2'+tutkintotaso_avain), -1)
	  ,[koulutusaste_taso2_avain]
	  ,[koulutusaste_taso2_id]=ISNULL((SELECT TOP 1 id from VipunenTK.dbo.d_koulutusluokitus where koulutusluokitus_avain='KASTET2'+koulutusaste_taso2_avain), -1)
      ,[lkm_tutkimustyovuodet]
	  ,[apuraha]
      ,f.[tietolahde]
      ,[rivinumero]
  FROM [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain] f
LEFT JOIN VipunenTK.dbo.d_sukupuoli d_sp
	ON d_sp.sukupuoli_koodi = f.sukupuoli_avain
LEFT JOIN VipunenTK.dbo.d_ika 
	ON d_ika.ika_avain = f.ika_avain
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol
	ON d_ol.oppilaitos_avain = f.oppilaitos_avain
--LEFT JOIN VipunenTK.dbo.d_alueluokitus d_ol_al
--	ON d_ol_al.alueluokitus_avain = d_ol.sijaintikuntakoodi
LEFT JOIN VipunenTK.dbo.d_tieteenala d_ta
	ON d_ta.tieteenala_avain = f.tieteenala_avain
LEFT JOIN VipunenTK.dbo.d_virkaryhma d_vr
	ON d_vr.virkaryhma_koodi = f.virkaryhma_avain
--LEFT JOIN (SELECT TOP 1 id,Koulutusaste_taso2_koodi FROM VipunenTK.dbo.d_koulutusluokitus) d_tt on d_tt.Koulutusaste_taso2_koodi=f.tutkintotaso_avain
	--ON d_tt.tutkintotaso_koodi = f.tutkintotaso_avain


GO


use antero