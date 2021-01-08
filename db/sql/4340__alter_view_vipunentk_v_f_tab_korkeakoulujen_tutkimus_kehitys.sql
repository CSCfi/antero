USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_korkeakoulujen_tutkimus_kehitys]    Script Date: 7.1.2021 21:52:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_f_tab_korkeakoulujen_tutkimus_kehitys] AS

--Select * from [VipunenTK].[dbo].[v_f_tab_korkeakoulujen_tutkimus_kehitys] 

SELECT 
--Aikamuuttyjat
		  'Tilastovuosi' = [tilastovuosi]
--Henkilömuuttujat
		  ,'Ikäryhmä' = d_ika.ika5v
          ,'Sukupuoli' = d_sukupuoli.sukupuoli
          ,'Tutkintotaso' = d1.Koulutusaste_taso2 --d_tutkintotaso.tutkintotaso
		  ,'Koulutusaste, taso 2' = d2.Koulutusaste_taso2
          ,'Virkaryhmä' = d_virkaryhma.virkaryhma
--Organisaatiomuuttujat
          ,'Yliopisto' = d_oppilaitoksen_taustatiedot.oppilaitos
--Tieteenalamuuttujat
          ,'Päätieteenala (2007 luokitus)' = d_tieteenala.paatieteenala2007
          ,'Päätieteenala (2010 luokitus)' = d_tieteenala.paatieteenala2010
          ,'Tieteenala (2007 luokitus)' = d_tieteenala.tieteenala2007
          ,'Tieteenala (2010 luokitus)' = d_tieteenala.tieteenala2010
--Rahoitusmuuttujat
          ,'Rahoituslähde' = d_tutkimuksen_rahoituslahde.rahoituslahde
          ,'Rahoituksen laatu' = d_tutkimuksen_rahoituslahde.rahoituksen_laatu
          ,'Rahoituslähteen tyyppi' = d_tutkimuksen_rahoituslahde.rahoituslahteen_tyyppi
          ,'Ulkop. rahoituksen kansainvälisyys' = d_tutkimuksen_rahoituslahde.ulkopuolisen_rahoituksen_kansainvalisyys
          ,'Rahoituslähdetarkennus' = d_tutkimuksen_rahoituslahde.rahoituslahdetarkennus
          ,'Tutkimusmenojen kohde' = d_tutkimusmenojen_kohde.menokohde
          ,'Tutkimusmenotyyppi' = d_tutkimusmenojen_kohde.menotyyppi
--Järjestykset
          ,d_ika.jarjestys_ika5v
          ,jarjestys_yliopisto = d_oppilaitoksen_taustatiedot.jarjestys_oppilaitos
          ,jarjestys_sukupuoli = d_sukupuoli.jarjestys
          ,d_tieteenala.jarjestys_paatieteenala2007
          ,d_tieteenala.jarjestys_paatieteenala2010
          ,d_tieteenala.jarjestys_tieteenala2007
          ,d_tieteenala.jarjestys_tieteenala2010
          ,jarjestys_tutkintotaso = d1.jarjestys_Koulutusaste_taso2
		  ,jarjestys_koulutusaste_taso2 = d2.jarjestys_Koulutusaste_taso2
          ,jarjestys_virkaryhma = d_virkaryhma.jarjestys
          ,d_tutkimuksen_rahoituslahde.jarjestys_rahoituslahde
          ,d_tutkimuksen_rahoituslahde.jarjestys_rahoituksen_laatu
          ,d_tutkimuksen_rahoituslahde.jarjestys_rahoituslahteen_tyyppi
          ,d_tutkimuksen_rahoituslahde.jarjestys_ulkopuolisen_rahoituksen_kansainvalisyys
          ,d_tutkimuksen_rahoituslahde.jarjestys_rahoituslahdetarkennus
          ,d_tutkimusmenojen_kohde.jarjestys_menokohde
          ,d_tutkimusmenojen_kohde.jarjestys_menotyyppi
--Muuttujat
      ,'Tutkimushenkilökunnan lkm' = lkm_tutkimushenkilokunta
      ,'Tutkimustyövuosien määrä' = lkm_tutkimustyovuodet
      ,'Tutkimusrahoitus (1000 euroa)' = [tutkimusrahoitus]
      ,'Tutkimusmenot (1000 euroa)' = [tutkimusmenot]
	  ,'Apuraha' = [apuraha]

--RUOTSI
--Aikamuuttyjat
		  ,'Statistikår' = [tilastovuosi]
--Henkilömuuttujat
		  ,'Åldersgrupp' = d_ika.ika5v_SV
          ,'Kön' = d_sukupuoli.sukupuoli_SV
          ,'Examensnivå' = d1.Koulutusaste_taso2_SV----d_tutkintotaso.tutkintotaso_SV
		  ,'Utbildningsnivå, nivå 2' = d2.Koulutusaste_taso2_SV
          ,'Tjänstegrupp' = d_virkaryhma.virkaryhma_SV
--Organisaatiomuuttujat
          ,'Universitet' = d_oppilaitoksen_taustatiedot.oppilaitos_SV
--Tieteenalamuuttujat
          ,'Huvudvetenskapsgren (2007)' = d_tieteenala.paatieteenala2007_SV
          ,'Huvudvetenskapsgren (2010)' = d_tieteenala.paatieteenala2010_SV
          ,'Vetenskapsgren (2007)' = d_tieteenala.tieteenala2007_SV
          ,'Vetenskapsgren (2010)' = d_tieteenala.tieteenala2010_SV
--Rahoitusmuuttujat
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
--Henkilömuuttujat
		  ,'Age group' = d_ika.ika5v_EN
          ,'Gender' = d_sukupuoli.sukupuoli_EN
          ,'Level of degree' = d1.Koulutusaste_taso2_EN--d_tutkintotaso.tutkintotaso_EN
		  ,'Level of education, tier 2' = d2.Koulutusaste_taso2_EN
          ,'Position' = d_virkaryhma.virkaryhma_EN
--Organisaatiomuuttujat
          ,'University' = d_oppilaitoksen_taustatiedot.oppilaitos_EN
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

/*
SELECT [tilastovuosi]
      ,d_ika.ika5v
	  ,d_ika.jarjestys_ika5v
	  ,d_oppilaitoksen_taustatiedot.oppilaitos
	  ,d_oppilaitoksen_taustatiedot.jarjestys_oppilaitos
	  ,d_sukupuoli.sukupuoli
	  ,jarjestys_sukupuoli = d_sukupuoli.jarjestys
	  ,d_tieteenala.paatieteenala
	  ,d_tieteenala.tieteenala
	  ,d_tieteenala.jarjestys_paatieteenala
	  ,d_tieteenala.jarjestys_tieteenala
	  ,d_tutkintotaso.tutkintotaso
	  ,jarjestys_tutkintotaso = d_tutkintotaso.jarjestys
	  ,d_virkaryhma.virkaryhma
	  ,jarjestys_virkaryhma = d_virkaryhma.jarjestys
	  ,d_tutkimuksen_rahoituslahde.rahoituslahde
	  ,d_tutkimuksen_rahoituslahde.rahoituksen_laatu
	  ,d_tutkimuksen_rahoituslahde.rahoituslahteen_tyyppi
	  ,d_tutkimuksen_rahoituslahde.ulkopuolisen_rahoituksen_kansainvalisyys
	  ,d_tutkimuksen_rahoituslahde.rahoituslahdetarkennus
	  ,d_tutkimuksen_rahoituslahde.jarjestys_rahoituslahde
	  ,d_tutkimuksen_rahoituslahde.jarjestys_rahoituksen_laatu
	  ,d_tutkimuksen_rahoituslahde.jarjestys_rahoituslahteen_tyyppi
	  ,d_tutkimuksen_rahoituslahde.jarjestys_ulkopuolisen_rahoituksen_kansainvalisyys
	  ,d_tutkimuksen_rahoituslahde.jarjestys_rahoituslahdetarkennus
	  ,d_tutkimusmenojen_kohde.menokohde
	  ,d_tutkimusmenojen_kohde.menotyyppi
	  ,d_tutkimusmenojen_kohde.jarjestys_menokohde
	  ,d_tutkimusmenojen_kohde.jarjestys_menotyyppi
      ,'tutkimushenkilökunnan lkm' = lkm_tutkimushenkilokunta
      ,'tutkimustyövuosien määrä' = lkm_tutkimustyovuodet
      ,[tutkimusrahoitus]
      ,[tutkimusmenot]
	  */
FROM (
SELECT [tilastovuosi]
      ,ika_id
	  ,oppilaitos_id
	  ,sukupuoli_id
	  ,tieteenala_id
	  ,tutkintotaso_id
	  ,coalesce(tutkintotaso_avain,-2) as tutkintotaso_avain
	  ,koulutusaste_taso2_id
	  ,coalesce(koulutusaste_taso2_avain,-2) as koulutusaste_taso2_avain
	  ,virkaryhma_id
	  ,rahoituslahde_id = -1
	  ,menokohde_id = -1
      ,lkm_tutkimushenkilokunta
      ,lkm_tutkimustyovuodet
	  ,apuraha
      ,tutkimusrahoitus = NULL
      ,tutkimusmenot = NULL
  FROM [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]

UNION ALL
SELECT [tilastovuosi]
      ,ika_id = -1
	  ,oppilaitos_id
	  ,sukupuoli_id = -1
	  ,tieteenala_id
	  ,tutkintotaso_id = -1
	  ,tutkintotaso_avain = -2
	  ,koulutusaste_taso2_id = -1
	  ,koulutusaste_taso2_avain = -2
	  ,virkaryhma_id = -1
	  ,rahoituslahde_id
	  ,menokohde_id = -1
      ,lkm_tutkimushenkilokunta = NULL
      ,lkm_tutkimustyovuodet = NULL
	  ,apuraha = NULL
      ,tutkimusrahoitus
      ,tutkimusmenot = NULL
  FROM VipunenTK.[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus]

UNION ALL
SELECT [tilastovuosi]
      ,ika_id = -1
	  ,oppilaitos_id
	  ,sukupuoli_id = -1
	  ,tieteenala_id
	  ,tutkintotaso_id = -1
	  ,tutkintotaso_avain = -2
	  ,koulutusaste_taso2_id = -1
	  ,koulutusaste_taso2_avain = -2
	  ,virkaryhma_id = -1
	  ,rahoituslahde_id = -1
	  ,menokohde_id
      ,lkm_tutkimushenkilokunta = NULL
      ,lkm_tutkimustyovuodet = NULL
	  ,apuraha = NULL
      ,tutkimusrahoitus = NULL
      ,tutkimusmenot
  FROM VipunenTK.[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_menot]

  ) f
  INNER JOIN VipunenTK.[dbo].[d_ika]						ON d_ika.id = f.ika_id
  INNER JOIN VipunenTK.[dbo].d_oppilaitoksen_taustatiedot	ON d_oppilaitoksen_taustatiedot.id = f.oppilaitos_id
  INNER JOIN VipunenTK.[dbo].d_sukupuoli					ON d_sukupuoli.id = f.sukupuoli_id
  INNER JOIN VipunenTK.[dbo].d_tieteenala					ON d_tieteenala.id = f.tieteenala_id
  INNER JOIN VipunenTK.dbo.d_koulutusluokitus d1			ON d1.id = f.tutkintotaso_id
  --INNER JOIN (select distinct Koulutusaste_taso2_koodi,Koulutusaste_taso2,Koulutusaste_taso2_SV,Koulutusaste_taso2_EN,jarjestys_Koulutusaste_taso2 from VipunenTK.dbo.d_koulutusluokitus) d_koulutusluokitus ON d_koulutusluokitus.Koulutusaste_taso2_koodi=f.tutkintotaso_avain
  INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2			ON d2.id = f.koulutusaste_taso2_id
  --INNER JOIN (select distinct Koulutusaste_taso2_koodi,Koulutusaste_taso2,Koulutusaste_taso2_SV,Koulutusaste_taso2_EN,jarjestys_Koulutusaste_taso2 from VipunenTK.dbo.d_koulutusluokitus) d_koulutusluokitus2 ON d_koulutusluokitus2.Koulutusaste_taso2_koodi=f.koulutusaste_taso2_avain
  INNER JOIN VipunenTK.[dbo].d_virkaryhma					ON d_virkaryhma.id = f.virkaryhma_id
  INNER JOIN VipunenTK.[dbo].d_tutkimuksen_rahoituslahde	ON d_tutkimuksen_rahoituslahde.id = f.rahoituslahde_id
  INNER JOIN VipunenTK.[dbo].d_tutkimusmenojen_kohde		ON d_tutkimusmenojen_kohde.id = f.menokohde_id

	


GO


use antero