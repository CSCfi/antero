USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_henkilosto]    Script Date: 10.3.2025 9.56.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_st_henkilosto] as


SELECT --TOP 1000
	 [Tilastovuosi] = vuosi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikäryhmä II] = d12.ikaryhma3_fi
	,[Ikäryhmä I] = d12.ikaryhma4_fi
	,[Kansalaisuus] = CASE WHEN d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') THEN 'Suomi' ELSE d2.maanosa_fi END
	,[Kansalaisuus (maa)] = CASE WHEN d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') THEN 'Suomi' ELSE d2.maatjavaltiot2_fi END
	,[Tehtäväjaottelu] = CASE WHEN sektori = 'Ammattikorkeakoulutus' THEN 'AMK: '+d3a.selite_fi ELSE 'YO: '+d3b.selite_fi END
	,[Tutkijanuravaihe tai tuntiopettajuus] = d13.selite_fi
	,[Nimike] = d16.selite_fi
	,[Henkilöstöryhmä] = d9.selite_fi
	,[Henkilöstöryhmä (harjoittelukoulut)] = d10.selite_fi
	,[Merkittävimmän tutkinnon taso] = d8.selite_fi
	,[Opetushenkilökunta] = d15.selite_fi
	,[Muun henkilökunnan henkilöstöryhmä] = d14.selite_fi
	,[Muu henkilöstö] = CASE WHEN sektori = 'Ammattikorkeakoulutus' THEN 'AMK: '+d14.selite_fi ELSE 'YO: '+d9.selite_fi END
	,[Työsuhteen nimitystapa] = d11.selite_fi
	,[Työsopimuksen pituus] =
		CASE
			WHEN YEAR(q.sopimus_alkupvm) = 1899 THEN 'Tieto puuttuu'
			WHEN DATEDIFF(DAY,q.sopimus_alkupvm,q.sopimus_loppupvm) < 3 * 30 THEN 'alle 3 kk'
			WHEN DATEDIFF(DAY,q.sopimus_alkupvm,q.sopimus_loppupvm) < 6 * 30 THEN '3–6 kk'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 13 THEN '6–12 kk'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 25 THEN '1–2 v.'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 37 THEN '2–3 v.'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) >= 37 THEN 'yli 3 v.'
			ELSE 'Tieto puuttuu'
		END

	,[Sektori]
	,[Korkeakoulusektori]
	,[Koulutusala 02] = d4a.selite_fi
	,[Koulutusala 95] = d4b.selite_fi
	,[OKM ohjauksen ala] = d5.ohjauksenala_nimi_fi
	,[Päätieteenala] = d6.paatieteenala_nimi_fi
	,[Tieteenala] = d6.tieteenala_nimi_fi

	,[Korkeakoulu] = d7.organisaatio_fi
	,[Korkeakoulu (tilastovuosi)] = d7.organisaatio_vanha_fi
	,[Ammattikorkeakoulu] = d7.organisaatio_fi
	,[Ammattikorkeakoulu (tilastovuosi)] = d7.organisaatio_vanha_fi 
	,[Yliopisto] = d7.organisaatio_fi
	,[Yliopisto (tilastovuosi)] = d7.organisaatio_vanha_fi
	,[Valittu kutsumenettelyllä] = q.d_valinta_kutsumenettelylla

	--ruotsi
	,[Statistikår] = vuosi

	,[Kön] = d1.sukupuoli_sv
	,[Åldersgrupp] = d12.ikaryhma3_sv
	,[Medborgarskap] = CASE WHEN d2.maatjavaltiot2_sv in ('Finland','Åland') THEN 'Finland' ELSE d2.maanosa_sv END
	,[Medborgarskap (land)] = CASE WHEN d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') THEN 'Finland' ELSE d2.maatjavaltiot2_sv END
	,[Uppgiftsindelning] = CASE WHEN sektori = 'Ammattikorkeakoulutus' THEN 'YH: ' +d3a.selite_sv ELSE 'UNI: ' +d3b.selite_sv END
	,[Forskarkarriärens skede eller timundervisning] = d13.selite_sv
	,[Personalgrupp] = d9.selite_sv
	,[Personalgrupp (övningsskolor)] = d10.selite_sv
	,[Den mest betydande examens nivå] = d8.selite_sv
	,[Undervisningspersonal] = d15.selite_sv
	,[Övriga personal personalgrupp] = d14.selite_sv
	,[Typ av anställningsförhållande] = d11.selite_sv
	,[Andra personnel] = CASE WHEN sektori = 'Ammattikorkeakoulutus' THEN 'UAS: '+d14.selite_sv ELSE 'UNI: '+d9.selite_sv END
	,[Anställningsavtalets längd] =
		CASE
			WHEN YEAR(q.sopimus_alkupvm) = 1899 THEN 'Information saknas'
			WHEN DATEDIFF(DAY,q.sopimus_alkupvm,q.sopimus_loppupvm) < 3 * 30 THEN 'mindre än 3 månader'
			WHEN DATEDIFF(DAY,q.sopimus_alkupvm,q.sopimus_loppupvm) < 6 * 30 THEN '3–6 månader'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 13 THEN '6–12 månader'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 25 THEN '1–2 år'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 37 THEN '2–3 år'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) >= 37 THEN 'mer än 3 år.'
			ELSE 'Information saknas'
		END

	,[Sektor] = case sektori when 'Ammattikorkeakoulutus' then 'Yrkeshögskoleutbildning' when 'Yliopistokoulutus' then 'Universitetutbildning' end
	,[Utbildningsområde 02] = d4a.selite_sv
	,[Utbildningsområde 95] = d4b.selite_sv
	,[UKM-styrningsområde​] = d5.ohjauksenala_nimi_sv
	,[Huvudsakligt vetenskapsområde] = d6.paatieteenala_nimi_sv
	,[Vetenskapsområde] = d6.tieteenala_nimi_sv

	,[Högskola] = d7.organisaatio_sv
	,[Yrkeshögskola] = d7.organisaatio_sv
	,[Universitet] = d7.organisaatio_sv

	--englanti
	,[Statistical year] = vuosi

	,[Gender] = d1.sukupuoli_en
	,[Age group] = d12.ikaryhma3_en
	,[Nationality] = CASE WHEN d2.maatjavaltiot2_en in ('Finland','Åland Islands') THEN 'Finland' ELSE d2.maanosa_en END
	,[Nationality (country)] = CASE WHEN d2.maatjavaltiot2_en in ('Finland','Åland Islands') THEN 'Finland' ELSE d2.maatjavaltiot2_en END
	,[Task categorisation] = CASE WHEN sektori = 'Ammattikorkeakoulutus' THEN 'UAS: ' +d3a.selite_en ELSE 'UNI: ' +d3b.selite_en END
	,[Research career phase or hourly teaching] = d13.selite_en
	,[Personnel group] = d9.selite_en
	,[Personnel group (teacher training schools)] = d10.selite_en
	,[Level of the most significant degree] = d8.selite_en
	,[Teaching personnel] = d15.selite_en
	,[Personnel group of other staff] = d14.selite_en
	,[Employment relationship] = d11.selite_en
	,[Other staff] = CASE WHEN sektori = 'Ammattikorkeakoulutus' THEN 'UAS: '+d14.selite_en ELSE 'UNI: '+d9.selite_en END
	,[Length of employment contract] =
		CASE
			WHEN YEAR(q.sopimus_alkupvm) = 1899 THEN 'Missing data'
			WHEN DATEDIFF(DAY,q.sopimus_alkupvm,q.sopimus_loppupvm) < 3 * 30 THEN 'less than 3 months'
			WHEN DATEDIFF(DAY,q.sopimus_alkupvm,q.sopimus_loppupvm) < 6 * 30 THEN '3–6 months'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 13 THEN '6–12 months'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 25 THEN '1–2 years'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 37 THEN '2–3 years'
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) >= 37 THEN 'more than 3 years'
			ELSE 'Missing data'
		END

	,[Sector] = case sektori when 'Ammattikorkeakoulutus' then 'University of applied sciences education' when 'Yliopistokoulutus' then 'University education' end
	,[Field of education 02] = d4a.selite_en
	,[Field of education 95] = d4b.selite_en
	,[Field of education - HE steering] = d5.ohjauksenala_nimi_en
	,[Main discipline] = d6.paatieteenala_nimi_en
	,[Discipline] = d6.tieteenala_nimi_en

	,[Higher education institution] = d7.organisaatio_en
	,[University of applied sciences] = d7.organisaatio_en
	,[University] = d7.organisaatio_en


	--mittarit
	,[henkilotyovuosi]
	,[tyoajan_kayttotiedot_opetus]
	,[tyoajan_kayttotiedot_tki_hallinto]
	,[tyoajan_kayttotiedot_tki_toiminta]

	--koodit
	,[Koodit Tehtäväjaottelu] = COALESCE(NULLIF(d3a.koodi,-1), d3b.koodi)
	,[Koodit Korkeakoulu] = d7.organisaatio_koodi
	,[Koodit Ammattikorkeakoulu] = d7.organisaatio_koodi
	,[Koodit Yliopisto] = d7.organisaatio_koodi
	,[Koodit Henkilöstöryhmä] = d9.koodi
	,[Koodit OKM ohjauksen ala] = CASE d5.ohjauksenala_koodi WHEN -1 THEN 99 ELSE d5.ohjauksenala_koodi END
	,[Koodit Tieteenala] = d6.tieteenala_koodi
	,[Koodit Päätieteenala] = d6.paatieteenala_koodi
	,[Koodit Merkittävimmän tutkinnon taso] = d8.koodi
	,[Koodit Muun henkilöstön henkilöstöryhmä] = d14.koodi
	,[Koodit Työsuhteen nimitystapa] = d11.koodi
	,[Koodit Tutkijanuravaihe tai tuntiopettajuus] = d13.koodi
	,[Koodit Nimike] = d16.koodi
	--järjestykset
	,[jarj Ikäryhmä II] = d12.jarjestys_ikaryhma3
	,[jarj Ikäryhmä I] = d12.jarjestys_ikaryhma4
	,[Kansalaisuus järj] =
	  CASE
		  WHEN d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') THEN 1
		  WHEN d2.maatjavaltiot2_koodi = '-1' THEN 9
		  WHEN d2.maanosa_koodi = '-1' THEN 9
		  WHEN d2.maanosa_koodi in ('2A','2B') THEN 2+1
		  ELSE cast(d2.maanosa_koodi AS int)+1
	  END
	,[jarj Tehtäväjaottelu] = CASE WHEN sektori = 'Ammattikorkeakoulutus' THEN 'AMK'+d3a.jarjestys_koodi ELSE 'YO'+d3b.jarjestys_koodi END--CASE  WHEN d3a.selite_fi = 'Muu henkilökunta' OR d3b.selite_fi = 'Muu henkilökunta' THEN 4 ELSE COALESCE(NULLIF(d3a.jarjestys_koodi,99999), d3b.jarjestys_koodi) END
	,[jarj Muu henkilöstö] = CASE WHEN sektori = 'Ammattikorkeakoulutus' THEN 'AMK'+d14.jarjestys_koodi ELSE 'YO'+d9.jarjestys_koodi END
	,[jarj Henkilöstöryhmä (harjoittelukoulut)] = d10.jarjestys_koodi
	,[jarj Merkittävimmän tutkinnon taso] = d8.jarjestys_koodi
	,[jarj Opetushenkilökunta] = d15.jarjestys_koodi
	,[jarj Nimitystapa] = CASE WHEN d11.jarjestys_koodi = 6 THEN 5 ELSE d11.jarjestys_koodi END
	,[jarj Työsopimuksen pituus] =
		CASE
			WHEN YEAR(q.sopimus_alkupvm) = 1899 THEN 9
			WHEN DATEDIFF(DAY,q.sopimus_alkupvm,q.sopimus_loppupvm) < 3 * 30 THEN 1
			WHEN DATEDIFF(DAY,q.sopimus_alkupvm,q.sopimus_loppupvm) < 6 * 30 THEN 2
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 13 THEN 3
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 25 THEN 4
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) < 37 THEN 5
			WHEN DATEDIFF(MONTH,q.sopimus_alkupvm,q.sopimus_loppupvm) >= 37 THEN 6
			ELSE 9
		END
	,[jarj Koulutusala 02] = d4a.jarjestys_koodi
	,[jarj Koulutusala 95] = d4b.jarjestys_koodi
	,[jarj Päätieteenala] = d6.jarjestys_paatieteenala_koodi
	,[jarj Tieteenala] = d6.jarjestys_tieteenala_koodi
	,[jarj Nimike] = d16.jarjestys_koodi



FROM (
	--amk
	SELECT
		vuosi
		,f.d_sukupuoli_id
		,f.d_ika_id
		,f.d_maa_id AS d_kansalaisuus_id
		,f.d_tehtavanjaottelu AS d_tehtavanjaottelu_amk_id
		,-1 AS d_tehtavanjaottelu_yo_id
		,-1 AS d_tutkijanuravaihe_id
		,-1 AS d_henkilostoryhma_id
		,-1 AS d_harjoittelukoulujen_henkilostoryhma_id
		,d_tutkinnon_taso AS d_tutkinnon_taso_id
		,d_muun_henkiloston_henkilostoryhma_id
		,d_paatoimiset_opettajat AS d_amk_paatoimiset_opettajat_id
		,d_nimitystapa_id
		,sopimus_alkupvm
		,sopimus_loppupvm

		,'Ammattikorkeakoulutus' AS sektori
		,'Ammattikorkeakoulut' AS Korkeakoulusektori
		,'Tieto puuttuu' AS d_valinta_kutsumenettelylla
		,f.d_koulutusala02_id
		,-1 AS d_koulutusala95_id
		,f.d_ohjauksenala_id
		,f.d_tieteenala_id

		,d.organisaatio_koodi AS korkeakoulu_koodi

		,henkilotyovuosi
		,f.d_nimike_id
		,f.tyoajan_kayttotiedot_opetus
		,f.tyoajan_kayttotiedot_tki_hallinto
		,f.tyoajan_kayttotiedot_tki_toiminta
	FROM [dw].[f_amk_henkilon_tyo] f
	LEFT JOIN dw.d_organisaatioluokitus d ON d.id=f.d_amk_id


	UNION ALL

	--yo
	SELECT
		vuosi
		,f.d_sukupuoli_id
		,f.d_ika_id
		,f.d_kansalaisuus_id
		,-1 AS d_tehtavanjaottelu_amk_id
		,f.d_tehtavanjaottelu_id AS d_tehtavanjaottelu_yo_id
		,f.d_tutkijanuravaihe_id
		,f.d_henkilostoryhma_id
		,f.d_harjoittelukoulujen_henkilostoryhma_id
		,d_tutkinnon_taso_id
		,-1 AS d_muun_henkiloston_henkilostoryhma_id
		,-1 AS d_amk_paatoimiset_opettajat_id
		,d_nimitystapa_id
		,sopimus_alkupvm
		,sopimus_loppupvm

		,'Yliopistokoulutus' AS sektori
		,'Yliopistot' AS Korkeakoulusektori
		,d2.selite_fi AS d_valinta_kutsumenettelylla
		,-1 AS d_koulutusala02_id
		,f.d_koulutusala_id AS d_koulutusala95_id
		,f.d_ohjauksenala_id
		,f.d_tieteenala_id

		,d.organisaatio_koodi AS korkeakoulu_koodi

		,henkilotyovuosi
		,f.d_nimike_id
		,NULL AS tyoajan_kayttotiedot_opetus
		,NULL AS tyoajan_kayttotiedot_tki_hallinto
		,NULL AS tyoajan_kayttotiedot_tki_toiminta
	FROM [dw].[f_yo_henkilon_tyo] f
	LEFT JOIN dw.d_organisaatioluokitus d ON d.id=f.d_yliopisto_id
	LEFT JOIN dw.d_yo_valinta_kutsumenettelylla d2 ON d2.id=f.d_valinta_kutsumenettelylla_id

) q


LEFT JOIN dw.d_sukupuoli d1 on d1.id=q.d_sukupuoli_id
LEFT JOIN dw.d_maatjavaltiot2 d2 on d2.id=q.d_kansalaisuus_id
LEFT JOIN dw.d_amk_tehtavanjaottelu d3a on d3a.id=q.d_tehtavanjaottelu_amk_id
LEFT JOIN dw.d_yo_tehtavanjaottelu d3b on d3b.id=q.d_tehtavanjaottelu_yo_id
LEFT JOIN dw.d_koulutusala_2002 d4a on d4a.id=q.d_koulutusala02_id
LEFT JOIN dw.d_koulutusala_1995 d4b on d4b.id=q.d_koulutusala95_id
LEFT JOIN dw.d_ohjauksenala d5 on d5.id=q.d_ohjauksenala_id
LEFT JOIN dw.d_tieteenala d6 on d6.id=q.d_tieteenala_id
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.organisaatio_avain='oppilaitos_'+q.korkeakoulu_koodi
LEFT JOIN dw.d_tutkinnon_taso d8 on d8.id=q.d_tutkinnon_taso_id
LEFT JOIN dw.d_yo_henkilostoryhma d9 on d9.id=q.d_henkilostoryhma_id
LEFT JOIN dw.d_yo_harjoittelukoulujen_henkilostoryhma d10 on d10.id=q.d_harjoittelukoulujen_henkilostoryhma_id
LEFT JOIN dw.d_nimitystapa d11 on d11.id=q.d_nimitystapa_id
LEFT JOIN dw.d_ika d12 on d12.id=q.d_ika_id
LEFT JOIN dw.d_yo_tutkijanuravaihe d13 on d13.id=q.d_tutkijanuravaihe_id
LEFT JOIN dw.d_amk_muun_henkilokunnan_henkilostoryhma d14 on d14.id=q.d_muun_henkiloston_henkilostoryhma_id
LEFT JOIN dw.d_amk_paatoimiset_opettajat d15 ON d15.id=q.d_amk_paatoimiset_opettajat_id
LEFT JOIN dw.d_ek_nimike d16 ON d16.id = q.d_nimike_id

GO

USE [ANTERO]