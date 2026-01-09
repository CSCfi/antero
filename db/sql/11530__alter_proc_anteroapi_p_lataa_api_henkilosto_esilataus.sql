USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_henkilosto_esilataus]    Script Date: 9.1.2026 8.26.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_henkilosto_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_henkilosto];

INSERT INTO AnteroAPI.dw.[api_henkilosto]

SELECT 
	   ROW_NUMBER() 
		OVER( ORDER BY 
			f.tilastovuosi ASC, 
			f.[Koodit Ammattikorkeakoulu] ASC, 
			f.[Koodit Yliopisto] ASC) as defaultorder
      ,f.Tilastovuosi as [tilastovuosi]
      ,f.Sukupuoli as [sukupuoli]
	  ,f.Kansalaisuus as [kansalaisuus]
	  ,f.Tehtäväjaottelu as [tehtäväjaottelu]
	  ,f.[Tutkijanuravaihe tai tuntiopettajuus] as [tutkijanuravaihe_tai_tuntiopettajuus]
	  ,f.Henkilöstöryhmä as henkilöstöryhmä
	  ,f.[Henkilöstöryhmä (harjoittelukoulut)] as [henkilöstöryhmä(harjoittelukoulut)]
	  ,f.[Merkittävimmän tutkinnon taso] as [merkittävimmän_tutkinnon_taso]
	  ,f.[Muun henkilöstön henkilöstöryhmä] as [muun_henkilöstön_henkilöstöryhmä]
	  ,f.[Työsuhteen nimitystapa] as [työsuhteen_nimitystapa]
	  ,f.Sektori as [sektori]
	  ,f.[Koulutusala 02] as [koulutusala_02]
	  ,f.[Koulutusala 95] as [Koulutusala_95]
	  ,f.[OKM ohjauksen ala] as [okm_ohjauksen_ala]
	  ,f.Päätieteenala as [päätieteenala]
	  ,f.Tieteenala as [tieteenala]
	  ,f.Ammattikorkeakoulu as [ammattikorkeakoulu]
	  ,f.Yliopisto as [Yliopisto]
	  ,sum(f.henkilotyovuosi) as [henkilotyovuosi]
	  ,f.[Koodit Tehtäväjaottelu] as [koodit_tehtäväjaottelu]
	  ,f.[Koodit Ammattikorkeakoulu] as [koodit_ammattikorkeakoulu]
	  ,f.[Koodit Yliopisto] as [koodit_yliopisto]
	  ,f.[Koodit Henkilöstöryhmä] as [koodit_henkilöstöryhmä]
	  ,f.[Koodit OKM ohjauksen ala] as [koodit_okm_ohjauksen_ala]
      ,f.[Koodit Tieteenala] as [koodit_tieteenala]
      ,f.[Koodit Päätieteenala] as [koodit_päätieteenala]
      ,f.[Koodit Merkittävimmän tutkinnon taso] as [koodit_merkittävimmän_tutkinnon_taso]
      ,f.[Koodit Muun henkilöstön henkilöstöryhmä] as [koodit_muun_henkilöstön_henkilöstöryhmä]
      ,f.[Koodit Työsuhteen nimitystapa] as [koodit_työsuhteen_nimitystapa]
      ,f.[Kansalaisuus järj] as [kansalaisuus_järj]
FROM (
	SELECT
		 Tilastovuosi = vuosi
		,Sukupuoli = d1.sukupuoli_fi
		,Kansalaisuus = case when d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 'Suomi' else d2.maanosa_fi end
		,Tehtäväjaottelu = d3.selite_fi
		,[Tutkijanuravaihe tai tuntiopettajuus] = null
		,[Henkilöstöryhmä] = null
		,[Henkilöstöryhmä (harjoittelukoulut)] = null
		,[Merkittävimmän tutkinnon taso] = d8.selite_fi
		,[Muun henkilöstön henkilöstöryhmä] = d9.selite_fi
		,[Työsuhteen nimitystapa] = d10.selite_fi
		,[Sektori] = 'Ammattikorkeakoulutus'
		,[Koulutusala 02] = d4.selite_fi
		,[Koulutusala 95] = null
		,[OKM ohjauksen ala] = d5.ohjauksenala_nimi_fi
		,Päätieteenala = d6.paatieteenala_nimi_fi
		,Tieteenala = d6.tieteenala_nimi_fi
		,Ammattikorkeakoulu = d7.organisaatio_fi
		,Yliopisto = null
		--mittarit
		,[henkilotyovuosi]
		--koodit
		,[Koodit Tehtäväjaottelu] = d3.koodi
		,[Koodit Ammattikorkeakoulu] = d7.organisaatio_nykyinen_koodi
		,[Koodit Yliopisto] = null
		,[Koodit Henkilöstöryhmä] = null
		,[Koodit OKM ohjauksen ala] = case d5.ohjauksenala_koodi when -1 then 99 else d5.ohjauksenala_koodi end
		,[Koodit Tieteenala] = d6.tieteenala_koodi
		,[Koodit Päätieteenala] = d6.paatieteenala_koodi
		,[Koodit Merkittävimmän tutkinnon taso] = d8.koodi
		,[Koodit Muun henkilöstön henkilöstöryhmä] = d9.koodi
		,[Koodit Työsuhteen nimitystapa] = d10.koodi
		--järjestykset
		,[Kansalaisuus järj] =
		  case
		  when d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 1
		  when d2.maatjavaltiot2_koodi = '-1' then 9
		  when d2.maanosa_koodi = '-1' then 9
		  when d2.maanosa_koodi in ('2A','2B') then 2+1
		  else cast(d2.maanosa_koodi as int)+1
		  end
	FROM ANTERO.[dw].[f_amk_henkilon_tyo] f
	LEFT JOIN ANTERO.dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
	LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d2 on d2.id=f.d_maa_id
	LEFT JOIN ANTERO.dw.d_amk_tehtavanjaottelu d3 on d3.id=f.d_tehtavanjaottelu
	LEFT JOIN ANTERO.dw.d_koulutusala_2002 d4 on d4.id=f.d_koulutusala02_id
	LEFT JOIN ANTERO.dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
	LEFT JOIN ANTERO.dw.d_tieteenala d6 on d6.id=f.d_tieteenala_id
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7 on d7.id=f.d_amk_id
	LEFT JOIN ANTERO.dw.d_tutkinnon_taso d8 on d8.id=f.d_tutkinnon_taso
	LEFT JOIN ANTERO.dw.d_amk_muun_henkilokunnan_henkilostoryhma d9 on d9.id=f.d_muun_henkiloston_henkilostoryhma_id
	LEFT JOIN ANTERO.dw.d_yo_nimitystapa d10 on d10.id=f.d_nimitystapa_id

	UNION ALL

	SELECT
		 Tilastovuosi = vuosi
		,Sukupuoli = d1.sukupuoli_fi
		,Kansalaisuus = case when d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 'Suomi' else d2.maanosa_fi end
		,Tehtäväjaottelu = d3.selite_fi
		,[Tutkijanuravaihe tai tuntiopettajuus] = d8.selite_fi
		,[Henkilöstöryhmä] = d9.selite_fi
		,[Henkilöstöryhmä (harjoittelukoulut)] = d10.selite_fi
		,[Tutkinnon taso] = null
		,[Muun henkilöstön henkilöstöryhmä] = null
		,[Työsuhteen nimitystapa] = d11.selite_fi
		,[Sektori] = 'Yliopistokoulutus'
		,[Koulutusala 02] = null
		,[Koulutusala 95] = d4.selite_fi
		,[OKM ohjauksen ala] = d5.ohjauksenala_nimi_fi
		,Päätieteenala = d6.paatieteenala_nimi_fi
		,Tieteenala = d6.tieteenala_nimi_fi
		,Ammattikorkeakoulu = null
		,Yliopisto = d7.organisaatio_fi
		--mittarit
		,[henkilotyovuosi]
		--koodit
		,[Koodit Tehtäväjaottelu] = case when d3.selite_fi='Muu henkilökunta' then 3 else d3.koodi end
		,[Koodit Ammattikorkeakoulu] = null
		,[Koodit Yliopisto] = d7.organisaatio_nykyinen_koodi
		,[Koodit Henkilöstöryhmä] = d10.koodi
		,[Koodit OKM ohjauksen ala] = case d5.ohjauksenala_koodi when -1 then 99 else d5.ohjauksenala_koodi end
		,[Koodit Tieteenala] = d6.tieteenala_koodi
		,[Koodit Päätieteenala] = d6.paatieteenala_koodi
		,[Koodit Merkittävimmän tutkinnon taso] = 9
		,[Koodit Muun henkilöstön henkilöstöryhmä] = 9
		,[Koodit Työsuhteen nimitystapa] = d11.koodi
		--järjestykset
		,[Kansalaisuus järj] =
		  case
		  when d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 1
		  when d2.maatjavaltiot2_koodi = '-1' then 9
		  when d2.maanosa_koodi = '-1' then 9
		  when d2.maanosa_koodi in ('2A','2B') then 2+1
		  else cast(d2.maanosa_koodi as int)+1
		  end
	FROM ANTERO.[dw].[f_yo_henkilon_tyo] f
	LEFT JOIN ANTERO.dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
	LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d2 on d2.id=f.d_kansalaisuus_id
	LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d3 on d3.id=f.d_tehtavanjaottelu_id
	LEFT JOIN ANTERO.dw.d_koulutusala_1995 d4 on d4.id=f.d_koulutusala_id
	LEFT JOIN ANTERO.dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
	LEFT JOIN ANTERO.dw.d_tieteenala d6 on d6.id=f.d_tieteenala_id
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7 on d7.id=f.d_yliopisto_id
	LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d8 on d8.id=f.d_tutkijanuravaihe_id
	LEFT JOIN ANTERO.dw.d_yo_henkilostoryhma d9 on d9.id=f.d_henkilostoryhma_id
	LEFT JOIN ANTERO.dw.d_yo_harjoittelukoulujen_henkilostoryhma d10 on d10.id=f.d_harjoittelukoulujen_henkilostoryhma_id
	LEFT JOIN ANTERO.dw.d_yo_nimitystapa d11 on d11.id=f.d_nimitystapa_id
) f

GROUP BY
	   f.Tilastovuosi
      ,f.Sukupuoli
	  ,f.Kansalaisuus
	  ,f.Tehtäväjaottelu
	  ,f.[Tutkijanuravaihe tai tuntiopettajuus]
	  ,f.Henkilöstöryhmä
	  ,f.[Henkilöstöryhmä (harjoittelukoulut)]
	  ,f.[Merkittävimmän tutkinnon taso]
	  ,f.[Muun henkilöstön henkilöstöryhmä]
	  ,f.[Työsuhteen nimitystapa]
      ,f.[OKM ohjauksen ala]
	  ,f.Sektori
	  ,f.[Koulutusala 02]
	  ,f.[Koulutusala 95]
	  ,f.[OKM ohjauksen ala]
	  ,f.Päätieteenala
	  ,f.Tieteenala
	  ,f.Ammattikorkeakoulu
	  ,f.Yliopisto
	  ,f.[Koodit Tehtäväjaottelu]
	  ,f.[Koodit Ammattikorkeakoulu]
	  ,f.[Koodit Yliopisto]
	  ,f.[Koodit Henkilöstöryhmä]
	  ,f.[Koodit OKM ohjauksen ala]
      ,f.[Koodit Tieteenala]
      ,f.[Koodit Päätieteenala]
      ,f.[Koodit Merkittävimmän tutkinnon taso]
      ,f.[Koodit Muun henkilöstön henkilöstöryhmä]
      ,f.[Koodit Työsuhteen nimitystapa]
      ,f.[Kansalaisuus järj]
	
GO