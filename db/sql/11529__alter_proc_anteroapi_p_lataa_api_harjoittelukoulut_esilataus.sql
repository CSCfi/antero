USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_harjoittelukoulut_esilataus]    Script Date: 9.1.2026 8.24.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_api_harjoittelukoulut_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_harjoittelukoulut];

INSERT INTO [dw].[api_harjoittelukoulut]

SELECT 
	   ROW_NUMBER() 
		OVER( ORDER BY 
			f.Tilastovuosi ASC, 
			f.[Koodit Yliopisto] ASC, 
			f.[Koodit ohjauksen ala] ASC, 
			f.[Koodit Koulutusala] ASC,
			f.[Koodit Henkilöstöryhmä] ASC) as defaultorder
	  ,f.Tilastovuosi as [tilastovuosi]
	  ,f.Yliopisto as [yliopisto]
	  ,f.Henkilöstöryhmä as henkilöstöryhmä
	  ,f.Koulutusala as [koulutusala]
      ,f.[ohjauksen ala] as [ohjauksen_ala]
	  ,SUM([harjoittelukoulun_oppilaat_esiopetus]) as [harjoittelukoulun_oppilaat_esiopetus]
      ,SUM([harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6]) as [harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6]
      ,SUM([harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9]) as [harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9]
      ,SUM([harjoittelukoulun_oppilaat_lukio]) as [harjoittelukoulun_oppilaat_lukio]
      ,SUM([harjoittelukoulun_oppilaat_yhteensa]) as [harjoittelukoulun_oppilaat_yhteensa]
      ,SUM([harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit]) as [harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit]
      ,SUM([harjoittelukoulun_kokonaistuntimaara]) as [harjoittelukoulun_kokonaistuntimaara]
      ,SUM([opintopisteet_lastentarha]) as [opintopisteet_lastentarha]
      ,SUM([opintopisteet_luokanopettaja]) as [opintopisteet_luokanopettaja]
      ,SUM([opintopisteet_aineenopettaja]) as [opintopisteet_aineenopettaja]
      ,SUM([opintopisteet_erityisopettaja]) as [opintopisteet_erityisopettaja]
      ,SUM([opintopisteet_opinto_ohjaaja]) as [opintopisteet_opinto_ohjaaja]
      ,SUM([opintopisteet_aikuiskoulutus]) as [opintopisteet_aikuiskoulutus]
      ,SUM([opintopisteet_muut]) as [opintopisteet_muut]
      ,SUM([henkilotyovuosi]) as [henkilotyovuosi]
      ,f.[Koodit Yliopisto] as [koodit_yliopisto]
      ,f.[Koodit Koulutusala] as [koodit_koulutusala]
	  ,f.[Koodit Ohjauksen ala] as [koodit_okm_ohjauksen_ala]
	  ,f.[Koodit Henkilöstöryhmä] as koodit_henkilöstöryhmä
FROM (
	SELECT
		 [Tilastovuosi] = vuosi
		,[Yliopisto] = d1.organisaatio_fi
		,[Henkilöstöryhmä] = null
		,[Koulutusala] = 'Tieto puuttuu'
		,[Ohjauksen ala] = 'Tieto puuttuu'
		--mittarit
		,f.harjoittelukoulun_oppilaat_esiopetus
		,f.harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6
		,f.harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9
		,f.harjoittelukoulun_oppilaat_lukio
		,f.harjoittelukoulun_oppilaat_yhteensa
		,f.harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit
		,f.harjoittelukoulun_kokonaistuntimaara
		,[opintopisteet_lastentarha] = null
		,[opintopisteet_luokanopettaja] = null
		,[opintopisteet_aineenopettaja] = null
		,[opintopisteet_erityisopettaja] = null
		,[opintopisteet_opinto_ohjaaja] = null
		,[opintopisteet_aikuiskoulutus] = null
		,[opintopisteet_muut] = null
		,henkilotyovuosi = null
		--koodit
		,[Koodit Yliopisto] = d1.organisaatio_nykyinen_koodi
		,[Koodit Koulutusala] = 99
		,[Koodit Ohjauksen ala] = 99
		,[Koodit Henkilöstöryhmä] = 99
	FROM ANTERO.[dw].[f_yo_harjoittelukoulut] f
	JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id

	UNION ALL

	SELECT
		 [Tilastovuosi] = vuosi
		,[Yliopisto] = d1.organisaatio_fi
		,null
		,[Koulutusala] = 'Tieto puuttuu'
		,[Ohjauksen ala] = 'Tieto puuttuu'
		--mittarit
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,f.suoritetut_opintopisteet_lastentarhanopettajat
		,f.suoritetut_opintopisteet_luokanopettajaharjoittelu
		,f.suoritetut_opintopisteet_aineenopettajaharjoittelu
		,f.suoritetut_opintopisteet_erityisopettajat
		,f.suoritetut_opintopisteet_opinto_ohjaajat
		,f.suoritetut_opintopisteet_aikuiskoulutus_harjoittelu
		,f.suoritetut_opintopisteet_muut_opettajankoulutusryhmat
		,null
		--koodit
		,[Koodit Yliopisto] = d1.organisaatio_nykyinen_koodi
		,[Koodit Koulutusala] = 99
		,[Koodit Ohjauksen ala] = 99
		,[Koodit Henkilöstöryhmä] = 99
	FROM ANTERO.[dw].[f_yo_harjoittelukoulujen_opintopisteet] f
	JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id

	UNION ALL

	SELECT
		 [Tilastovuosi] = vuosi
		,[Yliopisto] = d1.organisaatio_fi
		,[Henkilöstöryhmä] = d3.selite_fi
		,[Koulutusala] = d4.selite_fi
		,[Ohjauksen ala] = d5.ohjauksenala_nimi_fi
		--mittarit
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,henkilotyovuosi
		--koodit
		,[Koodit Yliopisto] = d1.organisaatio_nykyinen_koodi
		,[Koodit Koulutusala] = case d4.koodi when -1 then 99 else d4.koodi end
		,[Koodit Ohjauksen ala] = case d5.ohjauksenala_koodi when -1 then 99 else d5.ohjauksenala_koodi end
		,[Koodit Henkilöstöryhmä] = d3.koodi
	FROM ANTERO.[dw].[f_yo_henkilon_tyo] f
	JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id
	JOIN ANTERO.dw.d_yo_tehtavanjaottelu d2 on d2.id=f.d_tehtavanjaottelu_id
	JOIN ANTERO.dw.d_yo_harjoittelukoulujen_henkilostoryhma d3 on d3.id=f.d_harjoittelukoulujen_henkilostoryhma_id
	JOIN ANTERO.dw.d_koulutusala_1995 d4 on d4.id=f.d_koulutusala_id
	JOIN ANTERO.dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
	where d2.selite_fi='Harjoittelukoulujen henkilöstö'
) f

GROUP BY
	 f.Tilastovuosi
	,f.[Ohjauksen ala]
	,f.Koulutusala
	,f.Yliopisto
	,f.[Koodit Yliopisto]
	,f.[Koodit Ohjauksen ala]
	,f.[Koodit Koulutusala]
	,f.[Koodit Henkilöstöryhmä]
	,f.Henkilöstöryhmä
 
GO