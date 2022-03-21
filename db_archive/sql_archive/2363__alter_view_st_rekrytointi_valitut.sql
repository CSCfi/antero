USE [ANTERO]
GO

USE [ANTERO]
GO

ALTER VIEW [dw].[v_st_rekrytointi_valitut] AS

 SELECT
	 [Tilastovuosi] = f.vuosi
	,[Korkeakoulu] = d1.organisaatio_fi

	,[Sukupuoli] = d16.sukupuoli_fi
	,[Kansalaisuus] = d17.maatjavaltiot2_fi
	,[Kansalaisuus (maanosa)] =
		case
			when d17.maatjavaltiot2_koodi = '246' then 'Suomi'
			when d17.maanosa0_koodi = '1' then 'Eurooppa (pl. Suomi)'
			else d17.maanosa0_fi
		end
	,[Äidinkieli] = d18.kieliryhma1_fi
	,[Ikä] = d19.ika_fi
	,[Ikäryhmä] = d19.ikaryhma2_fi
	,[Tehtäväryhmä] = case when sektori='amk' and d3.koodi != -1 then 'AMK: '+d3.selite_fi when sektori='yo' and d3.koodi != -1 then 'YO: '+d3.selite_fi else d3.selite_fi end
	,[Henkilöstöryhmä] = d22.selite_fi
	,[Harjoittelukoulujen henkilöstöryhmä] = d24.selite_fi
	,[Tehtäväjaottelu] = case when sektori='amk' and d4.koodi != -1 then 'AMK: '+d4.selite_fi when sektori='yo' and d26.koodi != -1 then 'YO: '+d26.selite_fi else coalesce(d4.selite_fi,d26.selite_fi) end
	,[Nimitystapa] = case when sektori='yo' then d27.selite_fi else d5.selite_fi end
	,[Työnimike] = d2.selite_fi
	,[Tutkijanuravaihe] = d25.selite_fi
	,[Työsopimuksen pituus] =
		CASE
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 3 THEN 'alle 3 kk'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 7 THEN '3–6 kk'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 13 THEN '6–12 kk'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 25 THEN '1–2 v.'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 37 THEN '2–3 v.'
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) >= 37 THEN 'yli 3 v.'
			ELSE 'Tieto puuttuu'
		END
	,[Kelpoisuus tutkinto] = d6.selite_fi
	,[Kelpoisuus työkokemus] = d7.selite_fi
	,[Kelpoisuus opettajankoulutus] = d8.selite_fi
	,[Päätoiminen opettaja] = d10.selite_fi
	,[Tohtorintutkinnon suoritusmaa] = d13.maatjavaltiot2_fi
	,[Tohtorintutkinnon suoritusmaanosa] = d13.maanosa_fi
	,[Tohtorintutkinnon yliopisto] = d30.organisaatio_fi
	,[Tohtorintutkinnon suoritusvuosi] = COALESCE(NULLIF(NULLIF(CAST(tohtorintutkinnon_suoritusvuosi AS VARCHAR),'-1'),'0'),'Tieto puuttuu')
	,[ARVO kysymysryhmä] = d20.kysymysryhma_fi
	,[ARVO kysymys] = d20.kysymys_fi
	,[ARVO vastaus] = d21.vastaus_fi

	,[Sektori] = case when sektori='yo' then 'Yliopisto' when sektori='amk' then 'Ammattikorkeakoulu' end
	,[Koulutusnimike] = d11.koulutusluokitus_fi
	,[Koulutusala, taso 1] = d11.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d11.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d11.koulutusalataso3_fi
	,[Koulutusaste, taso 1] = d11.koulutusastetaso1_fi
	,[Koulutusaste, taso 2] = d11.koulutusastetaso2_fi
	,[OKM ohjauksen ala] = d11.okmohjauksenala_fi
	,[Tutkinnon taso] = d12.selite_fi

	,[Toimipiste] = case when sektori='amk' then d14.toimipisteen_nimi else d28.selite_fi end
	,[Toimipaikka] = d14.toimipaikan_nimi
	,[Alayksikkö] = d15.alayksikko_nimi

	,[Päätieteenala] = d9.paatieteenala_nimi_fi
	,[Tieteenala] = d9.tieteenala_nimi_fi
	/*
	--Ruotsi
	,[TilastovuosiSV] = f1.vuosi
	,[KorkeakouluSV] = d1.amk_nimi_sv

	,[SukupuoliSV] = d16.sukupuoli_sv
	,[KansalaisuusSV] = d17.maatjavaltiot2_sv
	,[ÄidinkieliSV] = d18.kieliryhma1_SV
	,[IkäSV] = d19.ika_sv
	,[IkäryhmäSV] = d19.ikaryhma2_sv
	,[TehtäväryhmäSV] = d3.selite_sv
	,[HenkilöstöryhmäSV] = d22.selite_sv
	,[Harjoittelukoulujen henkilöstöryhmäSV] = d24.selite_sv
	,[TehtäväjaotteluSV] = case when sektori='amk' then d4.selite_sv else d26.selite_sv end
	,[NimitystapaSV] = case when sektori='yo' then d5.selite_sv else d27.selite_sv end
	,[TyönimikeSV] = d2.selite_sv
	,[Kelpoisuus tutkintoSV] = d6.selite_sv
	,[Kelpoisuus työkokemusSV] = d7.selite_sv
	,[Kelpoisuus opettajankoulutusSV] = d8.selite_sv
	,[Päätoiminen opettajaSV] = d10.selite_sv
	,[Tohtorintutkinnon suoritusmaaSV] = d13.maatjavaltiot2_sv
	,[Tohtorintutkinnon suoritusmaanosaSV] = d13.maanosa_sv
	,[Tohtorintutkinnon yliopistoSV] = d23.yo_nimi_sv
	,[Tohtorintutkinnon suoritusvuosiSV] = null
	,[ARVO kysymysryhmäSV] = d20.kysymysryhma_sv
	,[ARVO kysymysSV] = d20.kysymys_sv
	,[ARVO vastausSV] = d21.vastaus_sv

	,[KoulutusnimikeSV] = d11.koulutusluokitus_sv
	,[Koulutusala, taso 1SV] = d11.koulutusalataso1_sv
	,[Koulutusala, taso 2SV] = d11.koulutusalataso2_sv
	,[Koulutusala, taso 3SV] = d11.koulutusalataso3_sv
	,[Koulutusaste, taso 1SV] = d11.koulutusastetaso1_sv
	,[Koulutusaste, taso 2SV] = d11.koulutusastetaso2_sv
	,[OKM ohjauksen alaSV] = d11.okmohjauksenala_sv
	,[Tutkinnon tasoSV] = d12.selite_sv

	,[ToimipisteSV] = case when sektori='amk' then d14.toimipisteen_nimi else d28.selite_sv end
	,[ToimipaikkaSV] = d14.toimipaikan_nimi
	,[AlayksikköSV] = d15.alayksikko_nimi

	,[PäätieteenalaSV] = d9.paatieteenala_nimi_sv
	,[TieteenalaSV] = d9.tieteenala_nimi_sv

	--Englanti
	,[TilastovuosiEN] = f1.vuosi
	,[KorkeakouluEN] = d1.amk_nimi_en

	,[SukupuoliEN] = d16.sukupuoli_en
	,[KansalaisuusEN] = d17.maatjavaltiot2_en
	,[ÄidinkieliEN] = d18.kieliryhma1_en
	,[IkäEN] = d19.ika_en
	,[IkäryhmäEN] = d19.ikaryhma2_en
	,[TehtäväryhmäEN] = d3.selite_en
	,[HenkilöstöryhmäEN] = d22.selite_en
	,[Harjoittelukoulujen henkilöstöryhmäEN] = d24.selite_en
	,[TehtäväjaotteluEN] = d4.selite_en
	,[NimitystapaEN] = d5.nimitystapa_en
	,[TyönimikeEN] = d2.selite_en
	,[Kelpoisuus tutkintoEN] = d6.selite_en
	,[Kelpoisuus työkokemusEN] = d7.selite_en
	,[Kelpoisuus opettajankoulutusEN] = d8.selite_en
	,[Päätoiminen opettajaEN] = d10.selite_en
	,[Tohtorintutkinnon suoritusmaaEN] = d13.maatjavaltiot2_en
	,[Tohtorintutkinnon suoritusmaanosaEN] = d13.maanosa_en
	,[Tohtorintutkinnon yliopistoEN] = d23.yo_nimi_en
	,[Tohtorintutkinnon suoritusvuosiEN] = null
	,[ARVO kysymysryhmäEN] = d20.kysymysryhma_en
	,[ARVO kysymysEN] = d20.kysymys_en
	,[ARVO vastausEN] = d21.vastaus_en

	,[KoulutusnimikeEN] = d11.koulutusluokitus_en
	,[Koulutusala, taso 1EN] = d11.koulutusalataso1_en
	,[Koulutusala, taso 2EN] = d11.koulutusalataso2_en
	,[Koulutusala, taso 3EN] = d11.koulutusalataso3_en
	,[Koulutusaste, taso 1EN] = d11.koulutusastetaso1_en
	,[Koulutusaste, taso 2EN] = d11.koulutusastetaso2_en
	,[OKM ohjauksen alaEN] = d11.okmohjauksenala_en
	,[Tutkinnon tasoEN] = d12.selite_en

	,[ToimipisteEN] = d14.toimipisteen_nimi
	,[ToimipaikkaEN] = d14.toimipaikan_nimi
	,[AlayksikköEN] = d15.alayksikko_nimi

	,[PäätieteenalaEN] = d9.paatieteenala_nimi_en
	,[TieteenalaEN] = d9.tieteenala_nimi_en
	*/
	--Koodimuuttujat
	,[Koodit Korkeakoulu] = d1.organisaatio_koodi
	,[Koodit Tohtorintutkinnon yliopisto] = d30.organisaatio_koodi
	,[Koodit Pääyksikkö] = d15.paayksikko_koodi
	,[Koodit Kansalaisuus] = d17.maatjavaltiot2_koodi
	,[Koodit Äidinkieli] = d18.jarjestys_kieliryhma1
	,[Koodit Koulutusnimike] = d11.koulutusluokitus_koodi
	,[Koodit Koulutusala, taso 1] = d11.koulutusalataso1_koodi
	,[Koodit Koulutusala, taso 2] = d11.koulutusalataso2_koodi
	,[Koodit Koulutusala, taso 3] = d11.koulutusalataso3_koodi
	,[Koodit Koulutusaste, taso 1] = d11.koulutusastetaso1_koodi
	,[Koodit Koulutusaste, taso 2] = d11.koulutusastetaso2_koodi
	,[Koodit OKM ohjauksen ala] = d11.okmohjauksenala_koodi

	--Järjestys
	,[jarj Sukupuoli] = d16.jarjestys_sukupuoli_koodi
	,[jarj Äidinkieli] = d18.jarjestys_kieliryhma1
	,[jarj Kansalaisuus] = d17.jarjestys_maatjavaltiot2_koodi
	,[jarj Kansalaisuus maanosa] =
		case
			when d17.maatjavaltiot2_koodi = '246' then '0'
			when d17.maanosa0_koodi = '1' then '1'
			else d17.jarjestys_maanosa0_koodi
		end
	,[jarj Ikäryhmä] = d19.jarjestys_ikaryhma2
	,[jarj Tehtäväryhmä] = d3.jarjestys_koodi
	,[jarj Henkilöstöryhmä] = d22.jarjestys_koodi
	,[jarj Tehtäväjaottelu] = case when sektori='amk' and d4.koodi != -1 then d4.jarjestys_koodi when sektori='yo' and d26.koodi != -1 then d26.jarjestys_koodi else 9 end
	,[jarj Nimitystapa] = d5.jarjestys_koodi
	,[jarj Työnimike] = d2.jarjestys_koodi
	,[jarj Tutkijanuravaihe] = d25.jarjestys_koodi
	,[jarj Toimikauden pituus] =
		CASE
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 3 THEN 1
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 7 THEN 2
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 13 THEN 3
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 25 THEN 4
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) < 37 THEN 5
			WHEN DATEDIFF(MONTH,f.sopimus_alkupvm,f.sopimus_loppupvm) >= 37 THEN 6
			ELSE 9
		END
	,[jarj Kelpoisuus tutkinto] = d6.jarjestys_koodi
	,[jarj Kelpoisuus työkokemus] = d7.jarjestys_koodi
	,[jarj Kelpoisuus opettajankoulutus] = d8.jarjestys_koodi
	,[jarj Päätoiminen opettaja] = d10.jarjestys_koodi
	,[jarj Tohtorintutkinnon suoritusmaa] = d13.jarjestys_maatjavaltiot2_koodi
	,[jarj Tohtorintutkinnon suoritusmaanosa] = d13.maanosa_fi
	,[jarj Koulutusala, taso 1] = d11.jarjestys_koulutusalataso1_koodi
	,[jarj Koulutusala, taso 2] = d11.jarjestys_koulutusalataso2_koodi
	,[jarj Koulutusala, taso 3] = d11.jarjestys_koulutusalataso3_koodi
	,[jarj Koulutusaste, taso 1] = d11.jarjestys_koulutusastetaso1_koodi
	,[jarj Koulutusaste, taso 2] = d11.jarjestys_koulutusastetaso2_koodi
	,[jarj OKM ohjauksen ala] = d11.jarjestys_okmohjauksenala_koodi
	,[jarj Tutkinnon taso] = d12.jarjestys_koodi
	,[jarj Päätieteenala] = d9.jarjestys_paatieteenala_koodi
	,[jarj Tieteenala] = d9.jarjestys_tieteenala_koodi

	,[Hakunumero] = hakunumero
	,[Hakuavain] = hakunumero+d1.organisaatio_koodi
	,[henkilonumero]

	--muu työkokemus
	,case when d20.kysymys_fi = 'Nykyisessä yliopistossa / ammattikorkeakoulussa:'																	and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_sama_yo_amk
	,case when d20.kysymys_fi = 'Muussa yliopistossa Suomessa:'																						and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_yo
	,case when d20.kysymys_fi = 'Muussa ammattikorkeakoulussa Suomessa:'																			and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_amk
	,case when d20.kysymys_fi = 'Tutkimuslaitoksessa Suomessa:'																						and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_tutklaitos
	,case when d20.kysymys_fi = 'Ulkomaisessa korkeakoulussa / tutkimuslaitoksessa:'																and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_ulk_kk_tutklaitos
	,case when d20.kysymys_fi = 'Vähintään yhdessä muussa oppilaitoksessa (ei korkeakoulu) Suomessa tai ulkomailla:'								and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_oppil
	,case when d20.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut Suomessa):'															and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_yritys
	,case when d20.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut ulkomailla):'															and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_yritys_ulk
	,case when d20.kysymys_fi = 'Julkinen hallinto (valtio, kunnat (ml. yliopistolliset keskussairaalat), Kela, yms.)  Suomessa tai ulkomailla:'	and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_julk_hallinto
	,case when d20.kysymys_fi = 'Muussa organisaatiossa (järjestöt jne.) (organisaation toimipaikka sijainnut Suomessa):'							and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_org
	,case when d20.kysymys_fi = 'Muussa organisaatiossa (järjestöt jne.) (organisaation toimipaikka sijainnut ulkomailla):'							and d21.vastaus_fi <> 'alle 0,5 vuotta tai ei lainkaan' and d21.vastaus_koodi <> '-1' then 1 else 0 end as kokemus_muu_org_ulk

	,[työkokemus_vastanneet] = case when d20.kysymysryhma_fi='Tiedot tehtävään valitun henkilön aiemmasta työskentelystä' and d21.vastaus_koodi <> '-1' then 1 else 0 end
	,[ed_tyopaikka_vastanneet] = case when d20.kysymysryhma_fi='Tiedot tehtävään valitun henkilön aiemmasta työskentelystä' and d21.vastaus_koodi <> '-1' then 1 else 0 end

	--edellinen työpaikka
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Nykyinen yliopisto / ammattikorkeakoulu' then 1 else 0 end as ed_sama_yo_amk
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Muu yliopisto Suomessa' then 1 else 0 end as ed_muu_yo
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Muu ammattikorkeakoulu Suomessa' then 1 else 0 end as ed_muu_amk
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Tutkimuslaitos Suomessa' then 1 else 0 end as ed_tutklaitos
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Ulkomainen korkeakoulu / tutkimuslaitos' then 1 else 0 end as ed_ulk_kk_tutklaitos
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Muu oppilaitos (ei korkeakoulu) Suomessa tai ulkomailla' then 1 else 0 end as ed_muu_oppil
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Yritys (yrityksen toimipakka sijainnut Suomessa)' then 1 else 0 end as ed_yritys
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Yritys (yrityksen toimipakka sijainnut ulkomailla)' then 1 else 0 end as ed_yritys_ulk
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Julkinen hallinto (valtio, kunnat (ml. yliopistolliset keskussairaalat), Kela, yms.) Suomessa tai ulkomailla' then 1 else 0 end as ed_julk_hallinto
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Muu organisaatio (järjestöt jne.) (organisaation toimipaikka sijainnut Suomessa)' then 1 else 0 end as ed_muu_org
	,case when d20.kysymys_fi = 'Mikä seuraavista oli viimeisin työpaikkasi?' and d21.vastaus_fi = 'Muu organisaatio (järjestöt jne.) (organisaation toimipaikka sijainnut ulkomailla)' then 1 else 0 end as ed_muu_org_ulk

	--tohtorintutkinnon organisaatio
	,case when d1.organisaatio_koodi = d30.organisaatio_koodi and d1.organisaatio_koodi != '-1' and tohtorintutkinnon_suoritusvuosi <= f.vuosi then 1 else 0 end as tohtori_sama_yo
	,case when d1.organisaatio_koodi != d30.organisaatio_koodi and d1.organisaatio_koodi != '-1' and d30.organisaatio_koodi!='-1' and tohtorintutkinnon_suoritusvuosi <= f.vuosi then 1 else 0 end as tohtori_eri_yo
	,case when d13.maatjavaltiot2_koodi not in ('-1','246') and tohtorintutkinnon_suoritusvuosi <= f.vuosi then 1 else 0 end as tohtori_ulk_yo
	,case when (d_tohtorintutkinnon_suoritusmaa_id != -1 or d30.organisaatio_koodi != -1 or d11.koulutusastetaso2_koodi = 82) and tohtorintutkinnon_suoritusvuosi <= f.vuosi then 1 else 0 end as tohtori_tutkinto

	--aika ulkomaisessa korkeakoulussa
	,case when d20.kysymys_fi = 'Ulkomaisessa korkeakoulussa / tutkimuslaitoksessa:' and d21.vastaus_fi = '0,5-3 vuotta' then 1 else 0 end as aika1_ulk_kk_tutklaitos
	,case when d20.kysymys_fi = 'Ulkomaisessa korkeakoulussa / tutkimuslaitoksessa:' and d21.vastaus_fi = '3-7 vuotta' then 1 else 0 end as aika2_ulk_kk_tutklaitos
	,case when d20.kysymys_fi = 'Ulkomaisessa korkeakoulussa / tutkimuslaitoksessa:' and d21.vastaus_fi = 'yli 7 vuotta' then 1 else 0 end as aika3_ulk_kk_tutklaitos

	--aika yrityksessä (toimipaikka Suomessa)
	,case when d20.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut Suomessa):' and d21.vastaus_fi = '0,5-3 vuotta' then 1 else 0 end as aika1_yritys_suomi
	,case when d20.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut Suomessa):' and d21.vastaus_fi = '3-7 vuotta' then 1 else 0 end as aika2_yritys_suomi
	,case when d20.kysymys_fi = 'Yrityksessä (yrityksen toimipaikka sijainnut Suomessa):' and d21.vastaus_fi = 'yli 7 vuotta' then 1 else 0 end as aika3_yritys_suomi

	,q.vast_pros

 FROM (

	select
		vuosi
		,'amk' as sektori
		,d1.amk_nykyinen_tunnus as organisaatiotunnus
		,d_ek_nimike_id
		,d_amk_tehtavaryhma_id
		,d_amk_tehtavanjaottelu_id
		,d_nimitystapa_id
		,'-1' as d_yo_nimitystapa_id
		,sopimus_alkupvm
		,sopimus_loppupvm
		,d_amk_kelpoisuus_tutkinto_id
		,d_amk_kelpoisuus_tyokokemus_id
		,d_amk_kelpoisuus_opettajankoulutus_d
		,'-1' as d_yo_tutkijanuravaihe_id
		,'-1' as d_yo_henkilostoryhma_id
		,'-1' as d_yo_harjoittelukoulujen_henkilostoryhma_id
		,'-1' as d_yo_tehtavajaottelu_id
		,d_tieteenala_id
		,d_amk_paatoimiset_opettajat_id
		,d_koulutusluokitus_id
		,d_tutkinnon_taso_id
		,d_tohtorintutkinnon_suoritusmaa_id
		,d2.yo_tunnus as tohtorintutkinnon_organisaatiotunnus
		,d_amk_toimipisteen_toimipaikka_id
		,tohtorintutkinnon_suoritusvuosi
		,d_organisaation_alayksikko_id
		,'-1' as d_yo_toimipisteen_toimipaikka_id

		,d_sukupuoli_id
		,d_kansalaisuus_id
		,d_aidinkieli_id
		,d_ika_id

		,d_arvokysymys_id
		,d_arvovastaus_id

		,[Hakunumero] = f1.hakunumero
		,[Hakuavain] = f1.hakunumero+d1.amk_tunnus

		,henkilonumero

	from  dw.f_amk_rekrytointi_valitut f1
	LEFT JOIN dw.d_amk d1 ON d1.id=f1.d_amk_id
	LEFT JOIN dw.d_yo d2 ON d2.id=f1.d_tohtorintutkinnon_suoritusyliopisto_id

	UNION ALL

	select
		vuosi
		,'yo' as sektori
		,d1.yo_nykyinen_tunnus as organisaatiotunnus
		,d_ek_nimike_id
		,'-1'
		,'-1'
		,'-1'
		,d_yo_nimitystapa_id
		,sopimus_alkupvm
		,sopimus_loppupvm
		,'-1'
		,'-1'
		,'-1'
		,d_yo_tutkijanuravaihe_id
		,d_yo_henkilostoryhma_id
		,d_yo_harjoittelukoulujen_henkilostoryhma_id
		,d_yo_tehtavajaottelu_id
		,d_tieteenala_id
		,'-1'
		,d_koulutusluokitus_id
		,'-1'
		,d_tohtorintutkinnon_suoritusmaa_id
		--taklataan fuusioituneiden yliopistojen tohtoriyliopistopaattelyt
		,CASE WHEN d2.yo_tunnus = d2.yo_nykyinen_tunnus THEN d2.yo_tunnus
		      WHEN d2.yo_tunnus != d2.yo_nykyinen_tunnus THEN d2.yo_nykyinen_tunnus
	     END AS tohtorintutkinnon_organisaatiotunnus
		--vanha rivi
		--d2.yo_tunnus as tohtorintutkinnon_organisaatiotunnus
		,'-1'
		,tohtorintutkinnon_suoritusvuosi
		,d_organisaation_alayksikko_id
		,d_yo_toimipisteen_toimipaikka_id

		,d_sukupuoli_id
		,d_kansalaisuus_id
		,d_aidinkieli_id
		,d_ika_id

		,d_arvokysymys_id
		,d_arvovastaus_id

		,[Hakunumero] = f1.hakunumero
		,[Hakuavain] = f1.hakunumero+d1.yo_tunnus

		,henkilonumero

	from  dw.f_yo_rekrytointi_valitut f1
	LEFT JOIN dw.d_yo d1 ON d1.id=f1.d_yliopisto_id
	LEFT JOIN dw.d_yo d2 ON d2.id=f1.d_tohtorintutkinnon_yliopisto_id

 ) f

 LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi=f.organisaatiotunnus
 LEFT JOIN dw.d_ek_nimike d2 ON d2.id=f.d_ek_nimike_id
 LEFT JOIN dw.d_amk_tehtavaryhma d3 ON d3.id=f.d_amk_tehtavaryhma_id
 LEFT JOIN dw.d_amk_tehtavanjaottelu d4 ON d4.id=f.d_amk_tehtavanjaottelu_id
 LEFT JOIN dw.d_nimitystapa d5 ON d5.id=f.d_nimitystapa_id
 LEFT JOIN dw.d_amk_kelpoisuus d6 ON d6.id=f.d_amk_kelpoisuus_tutkinto_id
 LEFT JOIN dw.d_amk_kelpoisuus d7 ON d7.id=f.d_amk_kelpoisuus_tyokokemus_id
 LEFT JOIN dw.d_amk_kelpoisuus d8 ON d8.id=f.d_amk_kelpoisuus_opettajankoulutus_d
 LEFT JOIN dw.d_tieteenala d9 ON d9.id=f.d_tieteenala_id
 LEFT JOIN dw.d_amk_paatoimiset_opettajat d10 ON d10.id=f.d_amk_paatoimiset_opettajat_id
 LEFT JOIN dw.d_koulutusluokitus d11 ON d11.id=f.d_koulutusluokitus_id
 LEFT JOIN dw.d_tutkinnon_taso d12 ON d12.id=f.d_tutkinnon_taso_id
 LEFT JOIN dw.d_maatjavaltiot2 d13 on d13.id=f.d_tohtorintutkinnon_suoritusmaa_id
 LEFT JOIN dw.d_amk_toimipisteen_toimipaikka d14 ON d14.id=f.d_amk_toimipisteen_toimipaikka_id
 LEFT JOIN dw.d_organisaation_alayksikot d15 ON d15.id=f.d_organisaation_alayksikko_id
 LEFT JOIN dw.d_sukupuoli d16 ON d16.id=f.d_sukupuoli_id
 LEFT JOIN dw.d_maatjavaltiot2 d17 ON d17.id=f.d_kansalaisuus_id
 LEFT JOIN dw.d_kieli d18 ON d18.id=f.d_aidinkieli_id
 LEFT JOIN dw.d_ika d19 ON d19.id=f.d_ika_id
 LEFT JOIN dw.d_arvokysymys d20 ON d20.id=f.d_arvokysymys_id
 LEFT JOIN dw.d_arvovastaus d21 ON d21.id=f.d_arvovastaus_id
 LEFT JOIN dw.d_yo_henkilostoryhma d22 ON d22.id=d_yo_henkilostoryhma_id
 LEFT JOIN dw.d_yo_harjoittelukoulujen_henkilostoryhma d24 ON d24.id=d_yo_harjoittelukoulujen_henkilostoryhma_id
 LEFT JOIN dw.d_yo_tutkijanuravaihe d25 on d25.id=d_yo_tutkijanuravaihe_id
 LEFT JOIN dw.d_yo_tehtavanjaottelu d26 ON d26.id=f.d_yo_tehtavajaottelu_id
 LEFT JOIN dw.d_yo_nimitystapa d27 ON d27.id=f.d_yo_nimitystapa_id
 LEFT JOIN dw.d_yo_toimipisteen_toimipaikka d28 ON d28.id=f.d_yo_toimipisteen_toimipaikka_id
 LEFT JOIN dw.d_organisaatioluokitus d30 ON d30.organisaatio_koodi=f.tohtorintutkinnon_organisaatiotunnus

 --Lasketaan korkeakoululle vuosittainen vastausprosentti. Jos yli 25% niin saa arvon 1, muuten 0 (jolloin ei oteta työkokemusraporteille).
 LEFT JOIN (
	select
		 vuosi
		,d.amk_nykyinen_tunnus as tunn
		,case
			when cast(count(distinct case when d_arvovastaus_id  != '-1' then henkilonumero else null end) as float) / cast(count(distinct henkilonumero) as float) >= 0.25 then 1
			else 0
		 end as vast_pros
	from dw.f_amk_rekrytointi_valitut f
	join dw.d_amk d on d.id = f.d_amk_id
	group by vuosi,d.amk_nykyinen_tunnus

	union all

	select
		 vuosi
		,d.yo_nykyinen_tunnus as tunn
		,case
			when cast(count(distinct case when d_arvovastaus_id  != '-1' then henkilonumero else null end) as float) / cast(count(distinct henkilonumero) as float) >= 0.25 then 1
			else 0
		 end as vast_pros
	from dw.f_yo_rekrytointi_valitut f
	join dw.d_yo d on d.id = f.d_yliopisto_id
	group by vuosi,d.yo_nykyinen_tunnus
  ) q on q.tunn=d1.organisaatio_koodi and q.vuosi=f.vuosi


GO
