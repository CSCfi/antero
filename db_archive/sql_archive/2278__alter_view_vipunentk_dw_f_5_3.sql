USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]    Script Date: 28.5.2019 15:47:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER view [dbo].[v_f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] as

-- CSC JN 26.1.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain
-- Select * into VipunenTK_DW.dbo.f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain from VipunenTK_DW.dbo.v_f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain
-- Insert into VipunenTK_DW.dbo.f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain Select * from VipunenTK_DW.dbo.v_f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain


SELECT tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = tunn
      ,tieteenala_avain = [tiede]

,'Tutkimusmenot_yhteensa' = yhme
,'Kayttomenot_yhteensa' = kmeno
,'Kayttomenoista_palkat' = palme
,'Kayttomenoista_apurahat' = apuraha
,'Laskettu_muutkayttomenot' = kmeno-palme-apuraha
,'Menot_laitehankinnat' = mkmeno
,'OKM_perusrahoitus' = ptmeno
,'SuomenAkatemia' = SAKAT
,'Muu_OKM' = MOKM
,'TEKES' = TEKES
,'Muu_TEM' = MTEM
,'UM' = UM
,'OM' = OM
,'SM' = SM
,'PM' = PM
,'VM' = VM
,'MMM' = MMM
,'LVM' = LVM
,'STM' = STM
,'YM' = YM
,'Kunnat' = kunnat
,'Muu_julkinen_rahoitus' = mjulk
,'Kotimaiset_rahastot' = krahas
,'Kotimaiset_yritykset' = kyrit
,'Ulkomaiset_yritykset' = uyrit
,'EU_puiteohjelmarahoitus' = eupuite
,'EU_aluekehitysrahoitus' = [eakr]
,'EU_sosiaalirahasto' = [esr]
,'Muu_EU' = [muueu]
,'Ulkomaiset_rahastot' = urahas
,'Kansainvaliset_jarjestot' = kv_jarj
,'Muu_ulkomainen_rahoitus' = mulko
,'Korkeakoulun_omat_varat' = ot_menot
,'Muut_kotimaiset_korkeakoulut' = rkork



      ,[tietolahde]
      ,[rivinumero]
  FROM [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]



GO


USE [ANTERO]