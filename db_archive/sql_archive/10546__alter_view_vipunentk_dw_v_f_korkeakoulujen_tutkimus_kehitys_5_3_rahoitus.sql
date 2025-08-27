USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus]    Script Date: 28.1.2025 15.31.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus] AS
--
--Drop table VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus
--Select * into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus

--Delete from VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus 
--Insert into VipunenTK.dbo.f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus Select * from VipunenTK_DW.dbo.v_f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus 


SELECT [tilastovuosi]
      ,[tilv_date]
      ,kaikki.[oppilaitos_avain]
      ,[oppilaitos_id] = ISNULL(d_ol.id, -1)
      --,[oppilaitos_sijaintikunta_avain] = ISNULL(d_ol.sijaintikuntakoodi, '-1')
      --,[oppilaitos_sijaintikunta_id] = ISNULL(d_ol_al.id, -1)
      ,kaikki.[tieteenala_avain]
      ,[tieteenala_id] = ISNULL(d_ta.id, -1)
      ,kaikki.[rahoituslahde_avain]
      ,[rahoituslahde_id] = ISNULL(d_rl.id, -1)
	  ,tutkimusrahoitus
      ,kaikki.[tietolahde]
      ,[rivinumero]
  FROM ( --kaikki
  
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'OKM_PERUS'
	,tutkimusrahoitus = [OKM_perusrahoitus]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [OKM_perusrahoitus] <> 0.0

Union all  
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'AKATEMIA'
	,tutkimusrahoitus = [SuomenAkatemia]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [SuomenAkatemia] <> 0.0

Union all  
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'OKM_MUU'
	,tutkimusrahoitus = [Muu_OKM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Muu_OKM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'TEKES'
	,tutkimusrahoitus = [TEKES]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [TEKES] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'TEM_MUU'
	,tutkimusrahoitus = [Muu_TEM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Muu_TEM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'UM'
	,tutkimusrahoitus = [UM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [UM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'OM'
	,tutkimusrahoitus = [OM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [OM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'SM'
	,tutkimusrahoitus = [SM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [SM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'PM'
	,tutkimusrahoitus = [PM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [PM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'VM'
	,tutkimusrahoitus = [VM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [VM] <> 0.0

Union all  
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'MMM'
	,tutkimusrahoitus = [MMM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [MMM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'LVM'
	,tutkimusrahoitus = [LVM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [LVM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'STM'
	,tutkimusrahoitus = [STM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [STM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'YM'
	,tutkimusrahoitus = [YM]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [YM] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'KUNNAT'
	,tutkimusrahoitus = [Kunnat]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Kunnat] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'JULK_MUU'
	,tutkimusrahoitus = [Muu_julkinen_rahoitus]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Muu_julkinen_rahoitus] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'RAHASTO_K'
	,tutkimusrahoitus = [Kotimaiset_rahastot]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Kotimaiset_rahastot] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'YRITYS_K'
	,tutkimusrahoitus = [Kotimaiset_yritykset]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Kotimaiset_yritykset] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'YRITYS_U'
	,tutkimusrahoitus = [Ulkomaiset_yritykset]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Ulkomaiset_yritykset] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'EU_PUITE'
	,tutkimusrahoitus = [EU_puiteohjelmarahoitus]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [EU_puiteohjelmarahoitus] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'EU_ALUE'
	,tutkimusrahoitus = [EU_aluekehitysrahoitus]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [EU_aluekehitysrahoitus] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'EU_SOS'
	,tutkimusrahoitus = [EU_sosiaalirahasto]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [EU_sosiaalirahasto] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'EU_MUU'
	,tutkimusrahoitus = [Muu_EU]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Muu_EU] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'RAHASTO_U'
	,tutkimusrahoitus = [Ulkomaiset_rahastot]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Ulkomaiset_rahastot] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'JARJESTO_U'
	,tutkimusrahoitus = [Kansainvaliset_jarjestot]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Kansainvaliset_jarjestot] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'MUU_U'
	,tutkimusrahoitus = [Muu_ulkomainen_rahoitus]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Muu_ulkomainen_rahoitus] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'KOULU'
	,tutkimusrahoitus = [Korkeakoulun_omat_varat]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Korkeakoulun_omat_varat] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'RKORK'
	,tutkimusrahoitus = [Muut_kotimaiset_korkeakoulut]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Muut_kotimaiset_korkeakoulut] <> 0.0

Union all 
Select 
	 [tilastovuosi]
	,[tilv_date]
	,[oppilaitos_avain]
	,[tieteenala_avain]
	,rahoituslahde_avain = 'HALUEET'
	,tutkimusrahoitus = [Hyvinvointialueet]
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] 
Where [Hyvinvointialueet] <> 0.0 

 ) kaikki
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol
	ON d_ol.oppilaitos_avain = kaikki.oppilaitos_avain
--LEFT JOIN VipunenTK.dbo.d_alueluokitus d_ol_al
--	ON d_ol_al.alueluokitus_avain = d_ol.sijaintikuntakoodi
LEFT JOIN VipunenTK.dbo.d_tieteenala d_ta
	ON d_ta.tieteenala_avain = kaikki.tieteenala_avain
LEFT JOIN VipunenTK.dbo.d_tutkimuksen_rahoituslahde d_rl
	ON d_rl.rahoituslahde_avain = kaikki.rahoituslahde_avain
	



GO


