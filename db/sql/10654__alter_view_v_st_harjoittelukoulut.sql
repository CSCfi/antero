USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_harjoittelukoulut]    Script Date: 10.3.2025 9.53.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER view [dw].[v_st_harjoittelukoulut] as

select 
[Tilastovuosi] = vuosi
,[Yliopisto] = d1.organisaatio_fi

,[Henkilöstöryhmä] = null

,[Koulutusala] = 'Tieto puuttuu'
,[Ohjauksen ala] = 'Tieto puuttuu'
,[Päätieteenala] = 'Tieto puuttuu'
,[Tieteenala] = 'Tieto puuttuu'
,[Tutkijanuravaihe tai tuntiopettajuus] = 'Tieto puuttuu'
,[Ikäryhmä] = 'Tieto puuttuu'
,[Kansalaisuus] = 'Tieto puuttuu'
,[Työsuhteen nimitystapa] = null
,[Työsopimuksen pituus] = null
,[Merkittävimmän tutkinnon taso] = 'Tieto puuttuu'
,[Sukupuoli] = 'Tieto puuttuu'

--sv
,[Statistikår] = vuosi
,[Universitet] = d1.organisaatio_sv

,[Personalgrupp] = null

,[Utbildningsområde] = 'Information saknas'
,[UKM-styrningsområde] = 'Information saknas'
,[Huvudsakligt vetenskapsområde] = 'Information saknas'
,[Vetenskapsområde] = 'Information saknas'
,[Forskarkarriärens skede eller timundervisning] = 'Information saknas'
,[Åldersgrupp] = 'Information saknas'
,[Medborgarskap] = 'Information saknas'
,[Typ av anställningsförhållande] = null
,[Anställningsavtalets längd] = null
,[Den mest betydande examens nivå] = 'Information saknas'
,[Kön] = 'Information saknas'

--en
,[Statistical year] = vuosi
,[University] = d1.organisaatio_en

,[Personnel group] = null

,[Field of education] = 'Missing information'
,[Field of education - HE steering] = 'Missing information'
,[Main discipline] = 'Missing information'
,[Discipline] = 'Missing information'
,[Research career phase or hourly teaching] = 'Missing information'
,[Age group] = 'Missing information'
,[Nationality] = 'Missing information'
,[Employment relationship] = null
,[Length of employment contract] = null
,[Level of the most significant degree] = 'Missing information'
,[Gender] = 'Missing information'

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
,[Koodit Yliopisto] = d1.organisaatio_koodi
,[Koodit Koulutusala] = 99
,[Koodit Ohjauksen ala] = 99
,[Koodit Henkilöstöryhmä] = 99

--järjestys
,[jarj Kansalaisuus] = 9
,[jarj Työsuhteen nimitystapa] = null
,[jarj Työsopimuksen pituus] = null
,[jarj Tieteenala] = 99999
,[jarj Päätieteenala] = 99999
,[jarj Tutkijanuravaihe tai tuntiopettajuus] = 99999
,[jarj Ikäryhmä] = 999
,[jarj Merkittävimmän tutkinnon taso] = 99999
,[jarj Sukupuoli] = 99999


from [dw].[f_yo_harjoittelukoulut] f
join dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id

UNION ALL

select 
[Tilastovuosi] = vuosi
,[Yliopisto] = d1.organisaatio_fi

,null

,[Koulutusala] = 'Tieto puuttuu'
,[Ohjauksen ala] = 'Tieto puuttuu'
,[Päätieteenala] = 'Tieto puuttuu'
,[Tieteenala] = 'Tieto puuttuu'
,[Tutkijanuravaihe tai tuntiopettajuus] = 'Tieto puuttuu'
,[Ikäryhmä] = 'Tieto puuttuu'
,[Kansalaisuus] = 'Tieto puuttuu'
,[Työsuhteen nimitystapa] = null
,[Työsopimuksen pituus] = null
,[Merkittävimmän tutkinnon taso] = 'Tieto puuttuu'
,[Sukupuoli] = 'Tieto puuttuu'

--sv
,[Statistikår] = vuosi
,[Universitet] = d1.organisaatio_sv

,[Personalgrupp] = null

,[Utbildningsområde] = 'Information saknas'
,[UKM-styrningsområde] = 'Information saknas'
,[Huvudsakligt vetenskapsområde] = 'Information saknas'
,[Vetenskapsområde] = 'Information saknas'
,[Forskarkarriärens skede eller timundervisning] = 'Information saknas'
,[Åldersgrupp] = 'Information saknas'
,[Medborgarskap] = 'Information saknas'
,[Typ av anställningsförhållande] = null
,[Anställningsavtalets längd] = null
,[Den mest betydande examens nivå] = 'Information saknas'
,[Kön] = 'Information saknas'

--en
,[Statistical year] = vuosi
,[University] = d1.organisaatio_en

,[Personnel group] = null

,[Field of education] = 'Missing information'
,[Field of education - HE steering] = 'Missing information'
,[Main discipline] = 'Missing information'
,[Discipline] = 'Missing information'
,[Research career phase or hourly teaching] = 'Missing information'
,[Age group] = 'Missing information'
,[Nationality] = 'Missing information'
,[Employment relationship] = null
,[Length of employment contract] = null
,[Level of the most significant degree] = 'Missing information'
,[Gender] = 'Missing information'

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
,[Koodit Yliopisto] = d1.organisaatio_koodi
,[Koodit Koulutusala] = 99
,[Koodit Ohjauksen ala] = 99
,[Koodit Henkilöstöryhmä] = 99

--järjestys
,[jarj Kansalaisuus] = 9
,[jarj Työsuhteen nimitystapa] = null
,[jarj Työsopimuksen pituus] = null
,[jarj Tieteenala] = 99999
,[jarj Päätieteenala] = 99999
,[jarj Tutkijanuravaihe tai tuntiopettajuus] = 99999
,[jarj Ikäryhmä] = 999
,[jarj Merkittävimmän tutkinnon taso] = 99999
,[jarj Sukupuoli] = 99999


from [dw].[f_yo_harjoittelukoulujen_opintopisteet] f
join dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id

UNION ALL

select 
 [Tilastovuosi] = vuosi
,[Yliopisto] = d1.organisaatio_fi

,[Henkilöstöryhmä] = d3.selite_fi

,[Koulutusala] = d4.selite_fi
,[Ohjauksen ala] = d5.ohjauksenala_nimi_fi
,[Päätieteenala] = d6.paatieteenala_nimi_fi
,[Tieteenala] = d6.tieteenala_nimi_fi
,[Tutkijanuravaihe tai tuntiopettajuus] = d7.selite_fi
,[Ikäryhmä] = d8.ikaryhma3_fi
,[Kansalaisuus] = CASE WHEN d9.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') THEN 'Suomi' ELSE d9.maanosa_fi END
,[Työsuhteen nimitystapa] = d10.selite_fi
,[Työsopimuksen pituus] =
		CASE
			WHEN YEAR(f.sopimus_alkupvm) = 1899 THEN 'Tieto puuttuu'
			WHEN DATEDIFF(DAY,f.sopimus_alkupvm,f.sopimus_loppupvm) < 3 * 30 THEN 'alle 3 kk'
			WHEN DATEDIFF(DAY,f.sopimus_alkupvm,f.sopimus_loppupvm) < 6 * 30 THEN '3–6 kk'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 13 THEN '6–12 kk'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 25 THEN '1–2 v.'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 37 THEN '2–3 v.'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) >= 37 THEN 'yli 3 v.'
			ELSE 'Tieto puuttuu'
		END
,[Merkittävimmän tutkinnon taso] = d11.selite_fi
,[Sukupuoli] = d12.sukupuoli_fi

--sv
,[Statistikår] = vuosi
,[Universitet] = d1.organisaatio_sv

,[Personalgrupp] = d3.selite_sv

,[Utbildningsområde] = d4.selite_sv
,[UKM-styrningsområde] = d5.ohjauksenala_nimi_sv
,[Huvudsakligt vetenskapsområde] = d6.paatieteenala_nimi_sv
,[Vetenskapsområde] = d6.tieteenala_nimi_sv
,[Forskarkarriärens skede eller timundervisning] = d7.selite_sv
,[Åldersgrupp] = d8.ikaryhma3_sv
,[Medborgarskap] = CASE WHEN d9.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') THEN 'Finland' ELSE d9.maanosa_sv END
,[Typ av anställningsförhållande] = d10.selite_sv
,[Anställningsavtalets längd] =
		CASE
			WHEN YEAR(f.sopimus_alkupvm) = 1899 THEN 'Information saknas'
			WHEN DATEDIFF(DAY,f.sopimus_alkupvm,f.sopimus_loppupvm) < 3 * 30 THEN 'mindre än 3 månader'
			WHEN DATEDIFF(DAY,f.sopimus_alkupvm,f.sopimus_loppupvm) < 6 * 30 THEN '3–6 månader'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 13 THEN '6–12 månader'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 25 THEN '1–2 år'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 37 THEN '2–3 år'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) >= 37 THEN 'mer än 3 år.'
			ELSE 'Information saknas'
		END
,[Den mest betydande examens nivå] = d11.selite_sv
,[Kön] = d12.sukupuoli_sv

--en
,[Statistical year] = vuosi
,[University] = d1.organisaatio_en

,[Personnel group] = d3.selite_en

,[Field of education] = d4.selite_en
,[Field of education - HE steering] = d5.ohjauksenala_nimi_en
,[Main discipline] = d6.paatieteenala_nimi_en
,[Discipline] = d6.tieteenala_nimi_en
,[Research career phase or hourly teaching] = d7.selite_en
,[Age group] = d8.ikaryhma3_en
,[Nationality] = CASE WHEN d9.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') THEN 'Finland' ELSE d9.maanosa_en END
,[Employment relationship] = d10.selite_en
,[Length of employment contract] =
		CASE
			WHEN YEAR(f.sopimus_alkupvm) = 1899 THEN 'Missing data'
			WHEN DATEDIFF(DAY,f.sopimus_alkupvm,f.sopimus_loppupvm) < 3 * 30 THEN 'less than 3 months'
			WHEN DATEDIFF(DAY,f.sopimus_alkupvm,f.sopimus_loppupvm) < 6 * 30 THEN '3–6 months'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 13 THEN '6–12 months'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 25 THEN '1–2 years'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 37 THEN '2–3 years'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) >= 37 THEN 'more than 3 years'
			ELSE 'Missing data'
		END
,[Level of the most significant degree] = d11.selite_en
,[Gender] = d12.sukupuoli_en

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
,[Koodit Yliopisto] = d1.organisaatio_koodi
,[Koodit Koulutusala] = case d4.koodi when -1 then 99 else d4.koodi end
,[Koodit Ohjauksen ala] = case d5.ohjauksenala_koodi when -1 then 99 else d5.ohjauksenala_koodi end
,[Koodit Henkilöstöryhmä] = d3.koodi

--järjestys
,[jarj Kansalaisuus] =
	  CASE
		  WHEN d9.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') THEN 1
		  WHEN d9.maatjavaltiot2_koodi = '-1' THEN 9
		  WHEN d9.maanosa_koodi = '-1' THEN 9
		  WHEN d9.maanosa_koodi in ('2A','2B') THEN 2+1
		  ELSE cast(d9.maanosa_koodi AS int)+1
	  END

,[jarj Työsuhteen nimitystapa] = CASE WHEN d10.jarjestys_koodi = 6 THEN 5 ELSE d10.jarjestys_koodi END
,[jarj Työsopimuksen pituus] =
		CASE
			WHEN YEAR(f.sopimus_alkupvm) = 1899 THEN 9
			WHEN DATEDIFF(DAY,f.sopimus_alkupvm,f.sopimus_loppupvm) < 3 * 30 THEN 1
			WHEN DATEDIFF(DAY,f.sopimus_alkupvm,f.sopimus_loppupvm) < 6 * 30 THEN 2
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 13 THEN 3
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 25 THEN 4
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 37 THEN 5
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) >= 37 THEN 6
			ELSE 9
		END
,[jarj Tieteenala] = d6.jarjestys_tieteenala_koodi
,[jarj Päätieteenala] = d6.jarjestys_paatieteenala_koodi
,[jarj Tutkijanuravaihe tai tuntiopettajuus] = d7.jarjestys_koodi
,[jarj Ikäryhmä] = d8.jarjestys_ikaryhma3
,[jarj Merkittävimmän tutkinnon taso] = d11.jarjestys_koodi
,[jarj Sukupuoli] = d12.jarjestys_sukupuoli_koodi

from [dw].[f_yo_henkilon_tyo] f
join dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id
join dw.d_yo_tehtavanjaottelu d2 on d2.id=f.d_tehtavanjaottelu_id
join dw.d_yo_harjoittelukoulujen_henkilostoryhma d3 on d3.id=f.d_harjoittelukoulujen_henkilostoryhma_id
join dw.d_koulutusala_1995 d4 on d4.id=f.d_koulutusala_id
join dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
join dw.d_tieteenala d6 on d6.id=f.d_tieteenala_id
join dw.d_yo_tutkijanuravaihe d7 on d7.id=f.d_tutkijanuravaihe_id
join dw.d_ika d8 on d8.id=f.d_ika_id
join dw.d_maatjavaltiot2 d9 on d9.id=f.d_kansalaisuus_id
join dw.d_nimitystapa d10 on d10.id=f.d_nimitystapa_id
join dw.d_tutkinnon_taso d11 on d11.id=f.d_tutkinnon_taso_id
join dw.d_sukupuoli d12 on d12.id = f.d_sukupuoli_id
where d2.selite_fi='Harjoittelukoulujen henkilöstö'


GO

USE [ANTERO]