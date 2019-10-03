USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_3_menot]    Script Date: 18.3.2018 22:44:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_3_menot] AS
--
--Drop table VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_3_menot
--Select * into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_3_menot from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_3_menot

--Delete from VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_3_menot 
--Insert into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_3_menot Select * from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_3_menot 


SELECT [tilastovuosi]
      ,[tilv_date]
      ,kaikki.[oppilaitos_avain]
      ,[oppilaitos_id] = ISNULL(d_ol.id, -1)
      --,[oppilaitos_sijaintikunta_avain] = ISNULL(d_ol.sijaintikuntakoodi, '-1')
      --,[oppilaitos_sijaintikunta_id] = ISNULL(d_ol_al.id, -1)
      ,kaikki.[tieteenala_avain]
      ,[tieteenala_id] = ISNULL(d_ta.id, -1)
      ,kaikki.menokohde_avain
      ,[menokohde_id] = ISNULL(d_mk.id, -1)
	  ,tutkimusmenot
      ,kaikki.[tietolahde]
      ,[rivinumero]
  FROM ( --kaikki
  
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,menokohde_avain = 'PALKAT'
	,tutkimusmenot = [Kayttomenoista_palkat]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Kayttomenoista_palkat] <> 0.0

Union all  
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,menokohde_avain = 'APURAHAT'
	,tutkimusmenot = [Kayttomenoista_apurahat]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Kayttomenoista_apurahat] <> 0.0

Union all  
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,menokohde_avain = 'MUUTKMENOT'
	,tutkimusmenot = [Laskettu_muutkayttomenot]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Laskettu_muutkayttomenot] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,menokohde_avain = 'MUUTMENOT'
	,tutkimusmenot = [Menot_laitehankinnat]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Menot_laitehankinnat] <> 0.0

 ) kaikki
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol
	ON d_ol.oppilaitos_avain = kaikki.oppilaitos_avain
--LEFT JOIN VipunenTK.dbo.d_alueluokitus d_ol_al
--	ON d_ol_al.alueluokitus_avain = d_ol.sijaintikuntakoodi
LEFT JOIN VipunenTK.dbo.d_tieteenala d_ta
	ON d_ta.tieteenala_avain = kaikki.tieteenala_avain
LEFT JOIN VipunenTK.dbo.d_tutkimusmenojen_kohde d_mk
	ON d_mk.menokohde_avain = kaikki.menokohde_avain
	



GO


USE [ANTERO]