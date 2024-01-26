USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_rekrytointi_hakijat_ja_valitut]    Script Date: 24.5.2023 16:15:07 ******/
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
	NULL as 'Suoritettu tohtorintutkinto',
	NULL as 'Ylemmän korkeakoulututkinnon suoritusvuosi',
	NULL as 'Ylemmän korkeakoulututkinnon korkeakoulu',
	NULL as 'Suoritettu ylempi korkeakoulututkinto',

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
	'Tieto puuttuu' as 'Tehtäväryhmä',

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
	NULL as vast_pros,
	
	NULL as tohtori_sama_yo,
	NULL as tohtori_eri_yo,
	NULL as tohtori_ulk_yo,
	NULL as ykk_sama_kk,
	NULL as ykk_eri_kk,


	NULL as kokemus_sama_yo_amk,
	NULL as kokemus_muu_yo,
	NULL as kokemus_muu_amk,
	NULL as kokemus_tutklaitos,
	NULL as kokemus_ulk_kk_tutklaitos,
	NULL as kokemus_muu_oppil,
	NULL as kokemus_yritys,
	NULL as kokemus_yritys_ulk,
	NULL as kokemus_julk_hallinto,
	NULL as kokemus_muu_org,
	NULL as kokemus_muu_org_ulk,

	[työkokemus_vastanneet] = NULL,
	[ed_tyopaikka_vastanneet] = NULL,

	NULL as ed_sama_yo_amk,
	NULL as ed_muu_yo,
	NULL as ed_muu_amk,
	NULL as ed_tutklaitos,
	NULL as ed_ulk_kk_tutklaitos,
	NULL as ed_muu_oppil,
	NULL as ed_yritys,
	NULL as ed_yritys_ulk,
	NULL as ed_julk_hallinto,
	NULL as ed_muu_org,
	NULL as ed_muu_org_ulk,

	NULL as aika1_ulk_kk_tutklaitos,
	NULL as aika2_ulk_kk_tutklaitos,
	NULL as aika3_ulk_kk_tutklaitos,

	NULL as aika1_yritys_suomi,
	NULL as aika2_yritys_suomi,
	NULL as aika3_yritys_suomi,

	d1.organisaatio_koodi as 'Koodit Korkeakoulu',
	NULL as 'Koodit Suoritettu ylempi korkeakoulututkinto',
	NULL as 'Koodit Suoritettu tohtorintutkinto',

	d1.jarjestys_organisaatio_koodi as 'Järjestys Korkeakoulu',
	d2.jarjestys_sukupuoli_koodi as 'Järjestys Sukupuoli',
	'999' as 'Järjestys Ikä',
	'29' as 'Järjestys Ikäryhmä',
	'99999' as 'Järjestys Äidinkieli',
	'99999' as 'Järjestys Päätoimiset opettajat',
	'99999' as 'Järjestys Tutkijanuravaihe',
	'999' as 'Järjestys Tehtäväryhmä',
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
	coalesce(d21.koulutusluokitus_fi, 'Tieto puuttuu') as 'Suoritettu tohtorintutkinto',
	coalesce(f.[Ylemmän korkeakoulututkinnon suoritusvuosi], 'Tieto puuttuu') as 'Ylemmän korkeakoulututkinnon suoritusvuosi',
	coalesce(d19.organisaatio_fi, 'Tieto puuttuu') as 'Ylemmän korkeakoulututkinnon korkeakoulu',
	coalesce(d20.koulutusluokitus_fi, 'Tieto puuttuu') as 'Suoritettu ylempi korkeakoulututkinto',


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
	d18.selite_fi as 'Tehtäväryhmä',

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
	q3.vast_pros,

	--tohtorintutkinnon organisaatio
	case when d1.organisaatio_nykyinen_koodi = d16.organisaatio_nykyinen_koodi and d1.organisaatio_koodi != '-1' and f.[Tohtorintutkinnon suoritusvuosi] <= f.Tilastovuosi then 1 else 0 end as tohtori_sama_yo,
	case when d1.organisaatio_nykyinen_koodi != d16.organisaatio_nykyinen_koodi and d1.organisaatio_koodi != '-1' and d16.organisaatio_koodi!='-1' and f.[Tohtorintutkinnon suoritusvuosi] <= f.Tilastovuosi then 1 else 0 end as tohtori_eri_yo,
	case when d17.maatjavaltiot2_koodi not in ('-1','246') and f.[Tohtorintutkinnon suoritusvuosi] <= f.Tilastovuosi then 1 else 0 end as tohtori_ulk_yo,

	--ylemmän kk-tutkinnon organisaatio
	case when d1.organisaatio_nykyinen_koodi = d19.organisaatio_nykyinen_koodi and d1.organisaatio_koodi != '-1' and f.[Ylemmän korkeakoulututkinnon suoritusvuosi] <= f.Tilastovuosi then 1 else 0 end as ykk_sama_kk,
	case when d1.organisaatio_nykyinen_koodi != d19.organisaatio_nykyinen_koodi and d1.organisaatio_koodi != '-1' and d19.organisaatio_koodi!='-1' and f.[Ylemmän korkeakoulututkinnon suoritusvuosi] <= f.Tilastovuosi then 1 else 0 end as ykk_eri_kk,

	--muu työkokemus
	case when d9.kysymys_fi = 'Nykyisessä yliopistossa / ammattikorkeakoulussa:'																	and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_sama_yo_amk,
	case when d9.kysymys_fi = 'Muussa yliopistossa Suomessa:'																						and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_yo,
	case when d9.kysymys_fi = 'Muussa ammattikorkeakoulussa Suomessa:'																			and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_amk,
	case when d9.kysymys_fi = 'Tutkimuslaitoksessa Suomessa:'																						and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_tutklaitos,
	case when d9.kysymys_fi = 'Ulkomaisessa korkeakoulussa / tutkimuslaitoksessa:'																and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_ulk_kk_tutklaitos,
	case when d9.kysymys_fi = 'Vähintään yhdessä muussa oppilaitoksessa (ei korkeakoulu) Suomessa tai ulkomailla:'								and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_oppil,
	case when d9.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut Suomessa):'															and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_yritys,
	case when d9.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut ulkomailla):'															and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_yritys_ulk,
	case when d9.kysymys_fi = 'Julkinen hallinto (valtio, kunnat (ml. yliopistolliset keskussairaalat), Kela, yms.)  Suomessa tai ulkomailla:'	and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_julk_hallinto,
	case when d9.kysymys_fi = 'Muussa organisaatiossa (järjestöt jne.) (organisaation toimipaikka sijainnut Suomessa):'							and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_org,
	case when d9.kysymys_fi = 'Muussa organisaatiossa (järjestöt jne.) (organisaation toimipaikka sijainnut ulkomailla):'							and d10.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d10.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_org_ulk,

	[työkokemus_vastanneet] = case when d9.kysymysryhma_fi='Tiedot tehtävään valitun henkilön aiemmasta työskentelystä' and d10.vastaus_koodi <> '-1' then 1 else 0 end,
	[ed_tyopaikka_vastanneet] = case when d9.kysymysryhma_fi='Tiedot tehtävään valitun henkilön aiemmasta työskentelystä' and d10.vastaus_koodi <> '-1' then 1 else 0 end,

	--edellinen työpaikka
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Nykyinen yliopisto / ammattikorkeakoulu' then 1 else 0 end as ed_sama_yo_amk,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Muu yliopisto Suomessa' then 1 else 0 end as ed_muu_yo,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Muu ammattikorkeakoulu Suomessa' then 1 else 0 end as ed_muu_amk,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Tutkimuslaitos Suomessa' then 1 else 0 end as ed_tutklaitos,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Ulkomainen korkeakoulu / tutkimuslaitos' then 1 else 0 end as ed_ulk_kk_tutklaitos,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Muu oppilaitos (ei korkeakoulu) Suomessa tai ulkomailla' then 1 else 0 end as ed_muu_oppil,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Yritys (yrityksen toimipakka sijainnut Suomessa)' then 1 else 0 end as ed_yritys,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Yritys (yrityksen toimipakka sijainnut ulkomailla)' then 1 else 0 end as ed_yritys_ulk,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Julkinen hallinto (valtio, kunnat (ml. yliopistolliset keskussairaalat), Kela, yms.) Suomessa tai ulkomailla' then 1 else 0 end as ed_julk_hallinto,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Muu organisaatio (järjestöt jne.) (organisaation toimipaikka sijainnut Suomessa)' then 1 else 0 end as ed_muu_org,
	case when d9.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d10.vastaus_fi = 'Muu organisaatio (järjestöt jne.) (organisaation toimipaikka sijainnut ulkomailla)' then 1 else 0 end as ed_muu_org_ulk,

	--aika ulkomaisessa korkeakoulussa
	case when d9.kysymys_fi = 'Ulkomaisessa korkeakoulussa / tutkimuslaitoksessa:' and d10.vastaus_fi = '0,5-3 vuotta' then 1 else 0 end as aika1_ulk_kk_tutklaitos,
	case when d9.kysymys_fi = 'Ulkomaisessa korkeakoulussa / tutkimuslaitoksessa:' and d10.vastaus_fi = '3-7 vuotta' then 1 else 0 end as aika2_ulk_kk_tutklaitos,
	case when d9.kysymys_fi = 'Ulkomaisessa korkeakoulussa / tutkimuslaitoksessa:' and d10.vastaus_fi = 'yli 7 vuotta' then 1 else 0 end as aika3_ulk_kk_tutklaitos,

	--aika yrityksessä (toimipaikka Suomessa)
	case when d9.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut Suomessa):' and d10.vastaus_fi = '0,5-3 vuotta' then 1 else 0 end as aika1_yritys_suomi,
	case when d9.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut Suomessa):' and d10.vastaus_fi = '3-7 vuotta' then 1 else 0 end as aika2_yritys_suomi,
	case when d9.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut Suomessa):' and d10.vastaus_fi = 'yli 7 vuotta' then 1 else 0 end as aika3_yritys_suomi,


	d1.organisaatio_koodi as 'Koodit Korkeakoulu',
	d20.koulutusluokitus_koodi as 'Koodit Suoritettu ylempi korkeakoulututkinto',
	d21.koulutusluokitus_koodi as 'Koodit Suoritettu tohtorintutkinto',
	d1.jarjestys_organisaatio_koodi as 'Järjestys Korkeakoulu',
	d2.jarjestys_sukupuoli_koodi as 'Järjestys Sukupuoli',
	d7.jarjestys_ika as 'Järjestys Ikä',
	d7.jarjestys_ikaryhma4 as 'Järjestys Ikäryhmä',
	d8.jarjestys_kieliryhma1 as 'Järjestys Äidinkieli',
	d14.jarjestys_koodi as 'Järjestys Päätoimiset opettajat',
	d15.jarjestys_koodi as 'Järjestys Tutkijanuravaihe',
	d18.jarjestys_koodi as 'Järjestys Tehtäväryhmä',
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
LEFT JOIN ANTERO.dw.d_amk_tehtavaryhma d18 on d18.id = f.d_tehtavaryhma_id
LEFT JOIN (

	SELECT
		 f.Tilastovuosi
		,f.d_korkeakoulu_id
		,CASE
			WHEN cast(count(DISTINCT CASE WHEN f.d_arvo_vastaus_id != '-1' THEN f.henkilonumero ELSE NULL END) as float) / cast(count(DISTINCT f.henkilonumero) as float) >= 0.25 THEN 1
			ELSE 0
			END as vast_pros
	FROM dw.f_rekrytointi_valitut_yhteinen f
	GROUP BY f.Tilastovuosi,f.d_korkeakoulu_id
) q3 on q3.d_korkeakoulu_id = f.d_korkeakoulu_id and q3.Tilastovuosi = f.Tilastovuosi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d19 on d19.id = f.d_ylemman_kk_tutkinnon_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 on d20.id = f.d_ylemman_kk_tutkinnon_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d21 on d21.id = f.d_tohtorintutkinnon_koulutusluokitus_id


GO

USE [ANTERO]