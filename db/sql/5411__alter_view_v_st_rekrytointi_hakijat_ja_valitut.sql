USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_rekrytointi_hakijat_ja_valitut]    Script Date: 10.1.2022 15:38:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_st_rekrytointi_hakijat_ja_valitut] AS

 SELECT DISTINCT
	f.Tilastovuosi,
	
	d1.organisaatio_fi as Korkeakoulu,

	CASE
		WHEN f.koodi_sektori = 'amk' THEN 'Ammattikorkeakoulu'
		WHEN f.koodi_sektori = 'yo' THEN 'Yliopisto'
		ELSE 'Tieto puuttuu'
	END AS Sektori,
	NULL as 'Tohtorintutkinnon suoritusmaa',
	NULL as 'Tohtorintutkinnon suoritusmaanosa',
	NULL as 'Tohtorintutkinnon suoritusvuosi',
	NULL as 'Tohtorintutkinnon yliopisto',

	d2.sukupuoli_fi as Sukupuoli,
	d7.kytkin_fi as 'Kansalaisuus (Suomi)',
	CASE WHEN d7.kytkin_fi = 'Kyllä' THEN 'Suomi' 
	WHEN d8.rekrytointi_maanosat_fi = 'Eurooppa' THEN 'Eurooppa (pl. Suomi)'
	WHEN d8.id = '-1' THEN 'Tieto puuttuu'
	ELSE 'Muu' END as 'Kansalaisuus (maanosa)',
	'Tieto puuttuu' as 'Ikä',
	'Tieto puuttuu' AS 'Ikäryhmä',
	'Tieto puuttuu' AS 'Äidinkieli',
	'Tieto puuttuu' AS 'Tehtäväjaottelu',
	'Tieto puuttuu' as 'Opettajaryhmä (AMK)',
	'Tieto puuttuu' as 'Tutkijanuravaihe',

	d6.kytkin_fi as Kutsuhaku,
	d5.kytkin_fi as 'Kansainvälinen haku',
	d4.kytkin_fi as Yhteisprofessuuri,
	d9.kytkin_fi as 'Hausta on valittu henkilö',

	NULL as 'ARVO kysymysryhmä',
	NULL as 'ARVO kysymys', 
	NULL as 'ARVO vastaus', 

	'Tieto puuttuu' as 'Tieteenala',
	'Tieto puuttuu' as 'Päätieteenala',

	f.hakijat as hakijat2,
	'Hakijat' as 'aineisto',
	NULL as henkilonumero,
	NULL as sopimusnumero,
	f.Hakunumero as hakunumero,
	NULL as hakuavain,
	coalesce(q1.avain, q2.avain) as mittari_avain,
	NULL as tohtori_sama_yo,
	NULL as tohtori_eri_yo,
	NULL as tohtori_ulk_yo,

	d1.organisaatio_koodi as 'Koodit Korkeakoulu',

	d1.jarjestys_organisaatio_koodi as 'Järjestys Korkeakoulu',
	d2.jarjestys_sukupuoli_koodi as 'Järjestys Sukupuoli',
	'999' as 'Järjestys Ikä',
	'29' as 'Järjestys Ikäryhmä',
	'99999' as 'Järjestys Äidinkieli',
	'99999' as 'Järjestys Päätoimiset opettajat',
	'99999' as 'Järjestys Tutkijanuravaihe',
	'99999' as 'Järjestys Tieteenala',
	'99999' as 'Järjestys Päätieteenala',
	CASE WHEN d7.kytkin_fi = 'Kyllä' THEN '1' 
	WHEN d8.rekrytointi_maanosat_fi = 'Eurooppa' THEN '2'
	WHEN d8.id = '-1' THEN '9'
	ELSE '3' END as 'Järjestys Kansalaisuus'
 FROM [ANTERO].[dw].[f_rekrytointihaut_yhteinen] f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_korkeakoulu_id
LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_rekrytointi_maanosat d3 on d3.id = f.d_kansalaisuus_maanosa_id
LEFT JOIN ANTERO.dw.d_kytkin d4 on d4.kytkin_koodi = f.d_yhteisprofessuuri_id
LEFT JOIN ANTERO.dw.d_kytkin d5 on d5.kytkin_koodi = f.d_kansainvalinen_haku_id
LEFT JOIN ANTERO.dw.d_kytkin d6 on d6.kytkin_koodi = f.d_kutsuhaku_id
LEFT JOIN ANTERO.dw.d_kytkin d7 on d7.kytkin_koodi = f.d_kansalaisuus_suomi_id
LEFT JOIN ANTERO.dw.d_rekrytointi_maanosat d8 on d8.id = f.d_kansalaisuus_maanosa_id
LEFT JOIN (SELECT DISTINCT hakunumero, d_korkeakoulu_id, Tilastovuosi, 1 as avain FROM [ANTERO].[dw].[f_rekrytointi_valitut_yhteinen]) q1 on q1.hakunumero = f.hakunumero and q1.d_korkeakoulu_id = f.d_korkeakoulu_id and q1.Tilastovuosi = f.Tilastovuosi
LEFT JOIN (SELECT DISTINCT hakunumero, d_korkeakoulu_id, Tilastovuosi, 1 as avain FROM [ANTERO].[dw].[f_rekrytointi_valitut_yhteinen]) q2 on q2.hakunumero = f.hakunumero and q2.d_korkeakoulu_id = f.d_korkeakoulu_id and (q2.Tilastovuosi - 1) = f.Tilastovuosi
LEFT JOIN ANTERO.dw.d_kytkin d9 on d9.kytkin_koodi = coalesce(q1.avain,coalesce(q2.avain,0))

UNION ALL

SELECT DISTINCT
	coalesce(q1.Tilastovuosi, coalesce(q2.Tilastovuosi, f.Tilastovuosi)) as Tilastovuosi,

	d1.organisaatio_fi as Korkeakoulu,

	CASE
		WHEN f.tunnus_sektori = 'amk' THEN 'Ammattikorkeakoulu'
		WHEN f.tunnus_sektori = 'yo' THEN 'Yliopisto'
		ELSE 'Tieto puuttuu'
	END AS Sektori,
	coalesce(d17.maatjavaltiot2_fi, 'Tieto puuttuu') as 'Tohtorintutkinnon suoritusmaa',
	coalesce(d17.maanosa_fi, 'Tieto puuttuu') as 'Tohtorintutkinnon suoritusmaanosa',
	coalesce(f.[Tohtorintutkinnon suoritusvuosi], 'Tieto puuttuu') as 'Tohtorintutkinnon suoritusvuosi',
	coalesce(d16.organisaatio_fi, 'Tieto puuttuu') as 'Tohtorintutkinnon yliopisto',

	d2.sukupuoli_fi as Sukupuoli,
	CASE WHEN d3.maatjavaltiot2_fi = 'Suomi' THEN 'Kyllä'
	WHEN f.d_kansalaisuus_id = '-1' THEN 'Tieto puuttuu'
	ELSE 'Ei' END as 'Kansalaisuus (Suomi)',
	d3.maanosa4_fi as 'Kansalaisuus (maanosa)',
	d7.ika_fi as 'Ikä',
	d7.ikaryhma4_fi as 'Ikäryhmä',
	d8.kieli_fi as 'Äidinkieli',
	CASE WHEN d12.id = '-1' THEN d13.selite_fi
	WHEN d13.id = '-1' THEN d12.selite_fi
	ELSE 'Tieto puuttuu' END AS 'Tehtäväjaottelu',
	d14.selite_fi as 'Opettajaryhmä (AMK)',
	d15.selite_fi as 'Tutkijanuravaihe',

	d6.kytkin_fi as Kutsuhaku,
	d5.kytkin_fi as 'Kansainvälinen haku',
	d4.kytkin_fi as Yhteisprofessuuri,
	'Kyllä' as 'Hausta on valittu henkilö',
	
	d9.kysymysryhma_fi as 'ARVO kysymysryhmä',
	d9.kysymys_fi as 'ARVO kysymys', 
	d10.vastaus_fi as 'ARVO vastaus', 

	d11.tieteenala_nimi_fi as 'Tieteenala',
	d11.paatieteenala_nimi_fi as 'Päätieteenala',

	null as hakijat2,
	'Valitut' as 'aineisto',
	f.henkilonumero,
	f.sopimusnumero,
	f.hakunumero,
	CONCAT(f.hakunumero, f.henkilonumero, f.d_korkeakoulu_id) as hakuavain,
	1 as mittari_avain,
	case when d1.organisaatio_nykyinen_koodi = d16.organisaatio_nykyinen_koodi and d1.organisaatio_koodi != '-1' and f.[Tohtorintutkinnon suoritusvuosi] <= f.Tilastovuosi then 1 else 0 end as tohtori_sama_yo,
	case when d1.organisaatio_nykyinen_koodi != d16.organisaatio_nykyinen_koodi and d1.organisaatio_koodi != '-1' and d16.organisaatio_koodi!='-1' and f.[Tohtorintutkinnon suoritusvuosi] <= f.Tilastovuosi then 1 else 0 end as tohtori_eri_yo,
	case when d17.maatjavaltiot2_koodi not in ('-1','246') and f.[Tohtorintutkinnon suoritusvuosi] <= f.Tilastovuosi then 1 else 0 end as tohtori_ulk_yo,

	d1.organisaatio_koodi as 'Koodit Korkeakoulu',

	d1.jarjestys_organisaatio_koodi as 'Järjestys Korkeakoulu',
	d2.jarjestys_sukupuoli_koodi as 'Järjestys Sukupuoli',
	d7.jarjestys_ika as 'Järjestys Ikä',
	d7.jarjestys_ikaryhma4 as 'Järjestys Ikäryhmä',
	d8.jarjestys_kieliryhma1 as 'Järjestys Äidinkieli',
	d14.jarjestys_koodi as 'Järjestys Päätoimiset opettajat',
	d15.jarjestys_koodi as 'Järjestys Tutkijanuravaihe',
	d11.jarjestys_tieteenala_koodi as 'Järjestys Tieteenala',
	d11.jarjestys_paatieteenala_koodi as 'Järjestys Päätieteenala',
	d3.jarjestys_maanosa4_koodi as 'Järjestys Kansalaisuus'
FROM [ANTERO].[dw].[f_rekrytointi_valitut_yhteinen] f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_korkeakoulu_id
LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3 on d3.id = f.d_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_kytkin d4 on d4.kytkin_koodi = f.d_yhteisprofessuuri_id
LEFT JOIN ANTERO.dw.d_kytkin d5 on d5.kytkin_koodi = f.d_kansainvalinen_haku_id
LEFT JOIN ANTERO.dw.d_kytkin d6 on d6.kytkin_koodi = f.d_kutsuhaku_id
LEFT JOIN ANTERO.dw.d_ika d7 on d7.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_kieli d8 on d8.id = f.d_aidinkieli_id
LEFT JOIN ANTERO.dw.d_arvokysymys d9 on d9.id = f.d_arvo_kysymys_id
LEFT JOIN ANTERO.dw.d_arvovastaus d10 on d10.id = f.d_arvo_vastaus_id
LEFT JOIN ANTERO.dw.d_tieteenala d11 on d11.id = f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d12 on d12.id = f.d_yo_tehtavajaottelu_id
LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d13 on d13.id = f.d_amk_tehtavajaottelu_id
LEFT JOIN ANTERO.dw.d_amk_paatoimiset_opettajat d14 on d14.id = f.d_paatoimiset_opettajat_id
LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d15 on d15.id = f.d_tutkijanuravaihe_id
LEFT JOIN (SELECT DISTINCT Hakunumero, d_korkeakoulu_id, Tilastovuosi FROM ANTERO.dw.f_rekrytointihaut_yhteinen) q1 on f.Tilastovuosi =  q1.Tilastovuosi    and f.hakunumero = q1.Hakunumero and f.d_korkeakoulu_id = q1.d_korkeakoulu_id
LEFT JOIN (SELECT DISTINCT Hakunumero, d_korkeakoulu_id, Tilastovuosi FROM ANTERO.dw.f_rekrytointihaut_yhteinen) q2 on f.Tilastovuosi = (q2.Tilastovuosi+1) and f.hakunumero = q2.Hakunumero and f.d_korkeakoulu_id = q2.d_korkeakoulu_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16 on d16.id = f.d_tohtorintutkinnon_yliopisto_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d17 on d17.id = f.d_tohtorintutkinnon_suoritusmaa_id

GO

USE [ANTERO]