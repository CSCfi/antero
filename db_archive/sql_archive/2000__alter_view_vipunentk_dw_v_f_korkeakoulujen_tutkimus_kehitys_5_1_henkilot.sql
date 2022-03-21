USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot]    Script Date: 4.12.2018 15:33:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot] AS
--
--Select * into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot

--Delete from VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot 
--Insert into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot Select * from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot 


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
      ,[tutkintotaso_id] = ISNULL(d_tt.id, -1)
	  ,[koulutusaste_taso2_avain]
	  ,[koulutusaste_taso2_id] = ISNULL(d_tt2.id, -1)
      ,[lkm_tutkimushenkilokunta]
      ,f.[tietolahde]
      ,[rivinumero]
  FROM [dbo].[f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain] f
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
LEFT JOIN (SELECT TOP 1 id,Koulutusaste_taso2_koodi FROM VipunenTK.dbo.d_koulutusluokitus) d_tt on d_tt.Koulutusaste_taso2_koodi=f.tutkintotaso_avain
	--ON d_tt.tutkintotaso_koodi = f.tutkintotaso_avain
LEFT JOIN (SELECT TOP 1 id,Koulutusaste_taso2_koodi FROM VipunenTK.dbo.d_koulutusluokitus) d_tt2 on d_tt2.Koulutusaste_taso2_koodi=f.koulutusaste_taso2_avain



GO


USE [ANTERO]