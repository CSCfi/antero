USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_amk_tutkimus_kehitys]    Script Date: 25.3.2020 9:34:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_tab_amk_tutkimus_kehitys] AS

SELECT 
--Aikamuuttyjat
		  'Tilastovuosi' = [tilastovuosi]
--Aluemuuttujat
		  ,'AVI-alue (tutkimusmenot)' = d_alueluokitus_historia.avi
		  ,'ELY-alue (tutkimusmenot)' = d_alueluokitus_historia.ely
		  ,'Maakunta (tutkimusmenot)' = d_alueluokitus_historia.maakunta
		  ,'Kunta (tutkimusmenot)' = d_alueluokitus_historia.kunta
--Henkilömuuttujat
          ,'Sukupuoli' = d_sukupuoli.sukupuoli
          ,'Tutkintotaso' = d_tutkintotaso.tutkintotaso
		  ,'Tutkimustehtävä' = d_tutkimus_tehtava.tutkimus_tehtava
		  ,'AVI-alue (T&K henkilökunta)' = d_alueluokitus_historia.avi
		  ,'ELY-alue (T&K henkilökunta)' = d_alueluokitus_historia.ely
		  ,'Maakunta (T&K henkilökunta)' = d_alueluokitus_historia.maakunta
		  ,'Kunta (T&K henkilökunta)' = d_alueluokitus_historia.kunta
--Organisaatiomuuttujat
          ,'Ammattikorkeakoulu' = d_oppilaitoksen_taustatiedot.oppilaitos
--Tieteenalamuuttujat
          ,'Päätieteenala (2007 luokitus)' = d_tieteenala.paatieteenala2007
          ,'Päätieteenala (2010 luokitus)' = d_tieteenala.paatieteenala2010
          ,'Tieteenala (2007 luokitus)' = d_tieteenala.tieteenala2007
          ,'Tieteenala (2010 luokitus)' = d_tieteenala.tieteenala2010
--Rahoitus- ja menomuuttujat
          ,'Rahoituslähde' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 'OKM perusrahoitus ja oma rahoitus' else d_tutkimuksen_rahoituslahde.rahoituslahde end
          ,'Rahoituksen laatu' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 'budjettirahoitus ja oma rahoitus' else  d_tutkimuksen_rahoituslahde.rahoituksen_laatu end
          ,'Rahoituslähteen tyyppi' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 'budjettirahoitus ja oma rahoitus' else d_tutkimuksen_rahoituslahde.rahoituslahteen_tyyppi end
          ,'Ulkop. rahoituksen kansainvälisyys' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 'kotimainen' else d_tutkimuksen_rahoituslahde.ulkopuolisen_rahoituksen_kansainvalisyys end
          ,'Rahoituslähdetarkennus' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 'OKM perusrahoitus ja oma rahoitus' else d_tutkimuksen_rahoituslahde.rahoituslahdetarkennus end
          ,'Tutkimusmenojen kohde' = d_tutkimusmenojen_kohde.menokohde
          ,'Tutkimusmenotyyppi' = d_tutkimusmenojen_kohde.menotyyppi
--Järjestykset
          ,jarjestys_amk = d_oppilaitoksen_taustatiedot.jarjestys_oppilaitos
          ,jarjestys_sukupuoli = d_sukupuoli.jarjestys
		  ,jarjestys_tutkimustehtava = d_tutkimus_tehtava.jarjestys
		  ,jarjestys_avi = d_alueluokitus_historia.jarjestys_avi
		  ,jarjestys_ely = d_alueluokitus_historia.jarjestys_ely
		  ,jarjestys_maakunta = d_alueluokitus_historia.jarjestys_maakunta
          ,d_tieteenala.jarjestys_paatieteenala2007
          ,d_tieteenala.jarjestys_paatieteenala2010
          ,d_tieteenala.jarjestys_tieteenala2007
          ,d_tieteenala.jarjestys_tieteenala2010
          ,jarjestys_tutkintotaso = d_tutkintotaso.jarjestys
          ,'jarjestys_rahoituslahde' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 997 else d_tutkimuksen_rahoituslahde.jarjestys_rahoituslahde end
          ,'jarjestys_rahoituksen_laatu' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 997 else d_tutkimuksen_rahoituslahde.jarjestys_rahoituksen_laatu end
          ,'jarjestys_rahoituslahteen_tyyppi' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 997 else d_tutkimuksen_rahoituslahde.jarjestys_rahoituslahteen_tyyppi end
          ,'jarjestys_ulkopuolisen_rahoituksen_kansainvalisyys' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 200 else d_tutkimuksen_rahoituslahde.jarjestys_ulkopuolisen_rahoituksen_kansainvalisyys end
          ,'jarjestys_rahoituslahdetarkennus' = case when f.rahoituslahde_avain = 'OKM_Perus_ORAHAS' then 997 else d_tutkimuksen_rahoituslahde.jarjestys_rahoituslahdetarkennus end
          ,d_tutkimusmenojen_kohde.jarjestys_menokohde
          ,d_tutkimusmenojen_kohde.jarjestys_menotyyppi
--Lukumäärämuuttujat
      ,'Tutkimusrahoitus (1000 euroa)2' = [tutkimusrahoitus]
      ,'Tutkimushenkilökunnan lkm (alueittain)2' = lkm_tutkimushenkilokunta_alueittain
	  ,'Tutkimushenkilökunnan lkm (tehtävittäin)2' = lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain
	  ,'Tutkimushenkilökunnan lkm (tutkintotasoittain)2' = lkm_tutkimushenkilokunta_tutkintotasoittain
	  ,'Tutkimusmenot (1000 euroa)2' = [tutkimusmenot]
	  ,'Tutkimusmenot (1000 euroa) arvio seuraavasta tilastovuodesta2' = [tutkimusmenot_arvio_seuraavatilastovuosi]
	  ,'Tutkimusmenot (1000 euroa) (alueittain)2' = [tutkimusmenot_alueittain]
	  ,'Tutkimusmenot (1000 euroa) (tieteenaloittain)2' = [tutkimusmenot_tieteenaloittain]
	  ,'Tutkimustyövuodet (alueittain)2' = [lkm_tutkimustyovuodet_alueittain]
	  ,'Tutkimustyövuodet (tehtävittäin)2' = [lkm_tutkimustyovuodet_tehtavittain]
	  ,'Tutkimustyövuodet (tutkintotasoittain)2' = [lkm_tutkimustyovuodet_tutkintotasoittain]

--RUOTSI
--Aikamuuttyjat
		  ,'Statistikår' = [tilastovuosi]
--Aluemuuttujat
		  ,'RFV-område (forskningsutgifter)' = d_alueluokitus_historia.avi_SV
		  ,'NTM-område (forskningsutgifter)' = d_alueluokitus_historia.ely_SV
		  ,'Landskap (forskningsutgifter)' = d_alueluokitus_historia.maakunta_SV
		  ,'Kommun (forskningsutgifter)' = d_alueluokitus_historia.kunta_SV
--Henkilömuuttujat
          ,'Kön' = d_sukupuoli.sukupuoli_SV
          ,'Examensnivå' = d_tutkintotaso.tutkintotaso_SV
		  ,'Forskningsuppgift' = d_tutkimus_tehtava.tutkimus_tehtava_SV
		  ,'RFV-område (F&U personal)' = d_alueluokitus_historia.avi_SV
		  ,'NTM-område (F&U personal)' = d_alueluokitus_historia.ely_SV
		  ,'Landskap (F&U personal)' = d_alueluokitus_historia.maakunta_SV
		  ,'Kommun (F&U personal)' = d_alueluokitus_historia.kunta_SV
--Organisaatiomuuttujat
          ,'Yrkehögskola' = d_oppilaitoksen_taustatiedot.oppilaitos_SV
--Tieteenalamuuttujat
          ,'Huvudvetenskapsgren (2007)' = d_tieteenala.paatieteenala2007_SV
          ,'Huvudvetenskapsgren (2010)' = d_tieteenala.paatieteenala2010_SV
          ,'Vetenskapsgren (2007)' = d_tieteenala.tieteenala2007_SV
          ,'Vetenskapsgren (2010)' = d_tieteenala.tieteenala2010_SV
--Rahoitus- ja menomuuttujat
          ,'Finansieringskälla' = d_tutkimuksen_rahoituslahde.rahoituslahde_SV
          ,'Finansieringstyp' = d_tutkimuksen_rahoituslahde.rahoituksen_laatu_SV
          ,'Finansieringskällans typ' = d_tutkimuksen_rahoituslahde.rahoituslahteen_tyyppi_SV
          ,'Externa finansieringens internat.' = d_tutkimuksen_rahoituslahde.ulkopuolisen_rahoituksen_kansainvalisyys_SV
          ,'Spec. av finansieringskällan' = d_tutkimuksen_rahoituslahde.rahoituslahdetarkennus_SV
          ,'Forskningsutgifternas mål' = d_tutkimusmenojen_kohde.menokohde_SV
          ,'Typ av forskningsutgifter' = d_tutkimusmenojen_kohde.menotyyppi_SV

--ENGLANTI
--Aikamuuttyjat
		  ,'Statistical year' = [tilastovuosi]
--Aluemuuttujat
		  ,'AVI area (R&D budget funds)' = d_alueluokitus_historia.avi_EN
		  ,'ELY area (R&D budget funds)' = d_alueluokitus_historia.ely_EN
		  ,'Region (R&D budget funds)' = d_alueluokitus_historia.maakunta_EN
		  ,'Municipality (R&D budget funds)' = d_alueluokitus_historia.kunta_EN
--Henkilömuuttujat
          ,'Gender' = d_sukupuoli.sukupuoli_EN
          ,'Level of degree' = d_tutkintotaso.tutkintotaso_EN
		  ,'R&D task' = d_tutkimus_tehtava.tutkimus_tehtava_EN
		  ,'AVI area (R&D personnel)' = d_alueluokitus_historia.avi_EN
		  ,'ELY area (R&D personnel)' = d_alueluokitus_historia.ely_EN
		  ,'Region (R&D personnel)' = d_alueluokitus_historia.maakunta_EN
		  ,'Municipality (R&D personnel)' = d_alueluokitus_historia.kunta_EN
--Organisaatiomuuttujat
          ,'Univ. of applied sciences' = d_oppilaitoksen_taustatiedot.oppilaitos_EN
--Tieteenalamuuttujat
          ,'Main discipline (2007)' = d_tieteenala.paatieteenala2007_EN
          ,'Main discipline (2010)' = d_tieteenala.paatieteenala2010_EN
          ,'Discipline (2007)' = d_tieteenala.tieteenala2007_EN
          ,'Discipline (2010)' = d_tieteenala.tieteenala2010_EN
--Rahoitus- ja menomuuttujat
          ,'Source of funding I' = d_tutkimuksen_rahoituslahde.rahoituslahde_EN
          ,'Type of funding II' = d_tutkimuksen_rahoituslahde.rahoituksen_laatu_EN
          ,'Type of funding I' = d_tutkimuksen_rahoituslahde.rahoituslahteen_tyyppi_EN
          ,'External funding (internat.)' = d_tutkimuksen_rahoituslahde.ulkopuolisen_rahoituksen_kansainvalisyys_EN
          ,'Source of funding II' = d_tutkimuksen_rahoituslahde.rahoituslahdetarkennus_EN
          ,'Target of budget funds' = d_tutkimusmenojen_kohde.menokohde_EN
          ,'Type of budget funds' = d_tutkimusmenojen_kohde.menotyyppi_EN

FROM (
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id
	  ,rahoituslahde_avain
	  ,alueluokitus_id = -1
	  ,sukupuoli_id = -1
	  ,tehtava_id = -1
	  ,tieteenala_id = -1
	  ,tutkintotaso_id = -1
	  ,menokohde_id = -1
      ,tutkimusrahoitus
	  ,lkm_tutkimushenkilokunta_alueittain = NULL
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = NULL
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NULL
	  ,tutkimusmenot = NULL
	  ,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	  ,tutkimusmenot_alueittain = NULL
	  ,tutkimusmenot_tieteenaloittain = NULL
	  ,lkm_tutkimustyovuodet_alueittain = NULL
	  ,lkm_tutkimustyovuodet_tehtavittain = NULL
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = NULL
  FROM [dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus]

UNION ALL
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id = -1
	  ,rahoituslahde_avain = '-1'
	  ,alueluokitus_id
	  ,sukupuoli_id = -1
	  ,tehtava_id = -1
	  ,tieteenala_id = -1
	  ,tutkintotaso_id = -1
	  ,menokohde_id = -1
      ,tutkimusrahoitus = NULL
	  ,lkm_tutkimushenkilokunta_alueittain
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = NULL
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NULL
	  ,tutkimusmenot = NULL
	  ,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	  ,tutkimusmenot_alueittain = NULL
	  ,tutkimusmenot_tieteenaloittain = NULL
	  ,lkm_tutkimustyovuodet_alueittain = NULL
	  ,lkm_tutkimustyovuodet_tehtavittain = NULL
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = NULL
  FROM VipunenTK.[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]

UNION ALL
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id = -1
	  ,rahoituslahde_avain = '-1'
	  ,alueluokitus_id = -1
	  ,sukupuoli_id
	  ,tehtava_id
	  ,tieteenala_id
	  ,tutkintotaso_id = -1
	  ,menokohde_id = -1
      ,tutkimusrahoitus = NULL
	  ,lkm_tutkimushenkilokunta_alueittain = NULL
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NULL
	  ,tutkimusmenot = NULL
	  ,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	  ,tutkimusmenot_alueittain = NULL
	  ,tutkimusmenot_tieteenaloittain = NULL
	  ,lkm_tutkimustyovuodet_alueittain = NULL
	  ,lkm_tutkimustyovuodet_tehtavittain = NULL
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = NULL
  FROM VipunenTK.[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]

UNION ALL
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id = -1
	  ,rahoituslahde_avain = '-1'
	  ,alueluokitus_id = -1
	  ,sukupuoli_id
	  ,tehtava_id = -1
	  ,tieteenala_id = -1
	  ,tutkintotaso_id
	  ,menokohde_id = -1
      ,tutkimusrahoitus = NULL
	  ,lkm_tutkimushenkilokunta_alueittain = NULL
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = NULL
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain
	  ,tutkimusmenot = NULL
	  ,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	  ,tutkimusmenot_alueittain = NULL
	  ,tutkimusmenot_tieteenaloittain = NULL
	  ,lkm_tutkimustyovuodet_alueittain = NULL
	  ,lkm_tutkimustyovuodet_tehtavittain = NULL
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = NULL
  FROM VipunenTK.[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]

UNION ALL
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id = -1
	  ,rahoituslahde_avain = '-1'
	  ,alueluokitus_id = -1
	  ,sukupuoli_id = -1
	  ,tehtava_id = -1
	  ,tieteenala_id = -1
	  ,tutkintotaso_id = -1
	  ,menokohde_id
      ,tutkimusrahoitus = NULL
	  ,lkm_tutkimushenkilokunta_alueittain = NULL
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = NULL
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NULL
	  ,tutkimusmenot
	  ,tutkimusmenot_arvio_seuraavatilastovuosi
	  ,tutkimusmenot_alueittain = NULL
	  ,tutkimusmenot_tieteenaloittain = NULL
	  ,lkm_tutkimustyovuodet_alueittain = NULL
	  ,lkm_tutkimustyovuodet_tehtavittain = NULL
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = NULL
  FROM VipunenTK.[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot]

UNION ALL
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id = -1
	  ,rahoituslahde_avain = '-1'
	  ,alueluokitus_id
	  ,sukupuoli_id = -1
	  ,tehtava_id = -1
	  ,tieteenala_id = -1
	  ,tutkintotaso_id = -1
	  ,menokohde_id = -1
      ,tutkimusrahoitus = NULL
	  ,lkm_tutkimushenkilokunta_alueittain = NULL
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = NULL
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NULL
	  ,tutkimusmenot = NULL
	  ,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	  ,tutkimusmenot_alueittain
	  ,tutkimusmenot_tieteenaloittain = NULL
	  ,lkm_tutkimustyovuodet_alueittain = NULL
	  ,lkm_tutkimustyovuodet_tehtavittain = NULL
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = NULL
  FROM VipunenTK.[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain]

UNION ALL
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id = -1
	  ,rahoituslahde_avain = '-1'
	  ,alueluokitus_id = -1
	  ,sukupuoli_id = -1
	  ,tehtava_id = -1
	  ,tieteenala_id
	  ,tutkintotaso_id = -1
	  ,menokohde_id = -1
      ,tutkimusrahoitus = NULL
	  ,lkm_tutkimushenkilokunta_alueittain = NULL
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = NULL
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NULL
	  ,tutkimusmenot = NULL
	  ,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	  ,tutkimusmenot_alueittain = NULL
	  ,tutkimusmenot_tieteenaloittain
	  ,lkm_tutkimustyovuodet_alueittain = NULL
	  ,lkm_tutkimustyovuodet_tehtavittain = NULL
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = NULL
  FROM VipunenTK.[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]

UNION ALL
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id = -1
	  ,rahoituslahde_avain = '-1'
	  ,alueluokitus_id
	  ,sukupuoli_id = -1
	  ,tehtava_id = -1
	  ,tieteenala_id = -1
	  ,tutkintotaso_id = -1
	  ,menokohde_id = -1
      ,tutkimusrahoitus = NULL
	  ,lkm_tutkimushenkilokunta_alueittain = NULL
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = NULL
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NULL
	  ,tutkimusmenot = NULL
	  ,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	  ,tutkimusmenot_alueittain = NULL
	  ,tutkimusmenot_tieteenaloittain = NULL
	  ,lkm_tutkimustyovuodet_alueittain
	  ,lkm_tutkimustyovuodet_tehtavittain = NULL
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = NULL
  FROM VipunenTK.[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]

UNION ALL
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id = -1
	  ,rahoituslahde_avain = '-1'
	  ,alueluokitus_id = -1
	  ,sukupuoli_id = -1
	  ,tehtava_id
	  ,tieteenala_id = -1
	  ,tutkintotaso_id = -1
	  ,menokohde_id = -1
      ,tutkimusrahoitus = NULL
	  ,lkm_tutkimushenkilokunta_alueittain = NULL
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = NULL
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NULL
	  ,tutkimusmenot = NULL
	  ,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	  ,tutkimusmenot_alueittain = NULL
	  ,tutkimusmenot_tieteenaloittain = NULL
	  ,lkm_tutkimustyovuodet_alueittain = NULL
	  ,lkm_tutkimustyovuodet_tehtavittain
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = NULL
  FROM VipunenTK.[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]

UNION ALL
SELECT [tilastovuosi]
	  ,oppilaitos_id
	  ,rahoituslahde_id = -1
	  ,rahoituslahde_avain = '-1'
	  ,alueluokitus_id = -1
	  ,sukupuoli_id = -1
	  ,tehtava_id = -1
	  ,tieteenala_id = -1
	  ,tutkintotaso_id
	  ,menokohde_id = -1
      ,tutkimusrahoitus = NULL
	  ,lkm_tutkimushenkilokunta_alueittain = NULL
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = NULL
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NULL
	  ,tutkimusmenot = NULL
	  ,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	  ,tutkimusmenot_alueittain = NULL
	  ,tutkimusmenot_tieteenaloittain = NULL
	  ,lkm_tutkimustyovuodet_alueittain = NULL
	  ,lkm_tutkimustyovuodet_tehtavittain = NULL
	  ,lkm_tutkimustyovuodet_tutkintotasoittain
  FROM VipunenTK.[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]

  ) f
  INNER JOIN VipunenTK.[dbo].d_oppilaitoksen_taustatiedot
	ON d_oppilaitoksen_taustatiedot.id = f.oppilaitos_id
  INNER JOIN VipunenTK.[dbo].d_tutkimuksen_rahoituslahde
	ON d_tutkimuksen_rahoituslahde.id = f.rahoituslahde_id
  INNER JOIN VipunenTK.[dbo].d_alueluokitus_historia
    ON d_alueluokitus_historia.id = f.alueluokitus_id
  INNER JOIN VipunenTK.[dbo].d_sukupuoli
	ON d_sukupuoli.id = f.sukupuoli_id
  INNER JOIN VipunenTK.[dbo].d_tutkimus_tehtava
    ON d_tutkimus_tehtava.id = f.tehtava_id
  INNER JOIN VipunenTK.[dbo].d_tieteenala
	ON d_tieteenala.id = f.tieteenala_id
  INNER JOIN VipunenTK.[dbo].d_tutkintotaso
	ON d_tutkintotaso.id = f.tutkintotaso_id
  INNER JOIN VipunenTK.[dbo].d_tutkimusmenojen_kohde
	ON d_tutkimusmenojen_kohde.id = f.menokohde_id
WHERE oppilaitoskoodi <> 02557 AND oppilaitoskoodi <> 10031 AND ((Tilastovuosi in (2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020) AND d_tutkimuksen_rahoituslahde.rahoituslahde <> 'EU yhteensä') OR Tilastovuosi = '2011')

GO

USE [ANTERO]