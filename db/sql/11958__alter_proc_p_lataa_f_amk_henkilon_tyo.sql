USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_henkilon_tyo]    Script Date: 10.4.2026 10.20.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER   PROCEDURE [dw].[p_lataa_f_amk_henkilon_tyo] AS

TRUNCATE TABLE dw.f_amk_henkilon_tyo;

INSERT INTO dw.f_amk_henkilon_tyo (
	[d_amk_id]
	,[d_tieteenala_id]
	,[d_toimipaikka_id]
	,[d_nimike_id]
	,[d_tutkinnon_taso]
	,[d_maa_id]
	,[d_sukupuoli_id]
	,[d_koulutusala02_id]
	,[d_muun_henkiloston_henkilostoryhma_id]
	,[d_tehtavanjaottelu]
	,[d_nimitystapa_id]
	,[d_kieli_id]
	,[d_paatoimiset_opettajat]
	,[d_ohjauksenala_id]
	,[d_ika_id]
	,[vuosi]
	,[henkilotyovuosi]
	,[tyoajan_kayttotiedot_opetus]
	,[tyoajan_kayttotiedot_tki_toiminta]
	,[tyoajan_kayttotiedot_tki_hallinto]
	,[kelpoisuus_tutkinto]
	,[kelpoisuus_tyokokemus]
	,[kelpoisuus_opettajankoulutus]
	,[sopimus_alkupvm]
	,[sopimus_loppupvm]
	,[suorittanut_pedagogiset_opinnot]
	,[pedagogisten_opintojen_vuosi]
	,[d_virta_patevyydet_pedagogiset_opinnot_id]
	,[d_organisaatioluokitus_pedagogiset_opinnot_id]
	,[suorittanut_tohtorintutkinnon]
	,[tohtorintutkinto_vuosi]
	,[d_koulutusluokitus_tohtorintutkinto_id]
	,[d_organisaatioluokitus_tohtorintutkinto_id]
	,[tohtorintutkinnon_lahde]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT COALESCE(s2.id,-1)
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,COALESCE(s5.id,-1) -- s5.id nimike selvitettävä
	,COALESCE(s6.id,-1)
	,COALESCE(s7.id,-1)
	,COALESCE(s8.id,-1)
	,COALESCE(s9.id,-1)
	,COALESCE(s10.id,-1)
	,COALESCE(s11.id,-1)
	,COALESCE(s12.id,-1)
	,COALESCE(s13.id,-1)
	,COALESCE(s14.id,-1)
	,COALESCE(s15.id,-1)
	,COALESCE(s20.id,-1)
	,s1.Vuosi
	,COALESCE(s1.Henkilotyovuosi, 0)
	,COALESCE(s1.[Työajan käyttötiedot, opetus], 0)
	,COALESCE(s1.[Työajan käyttötiedot, TKI-toiminta], 0)
	,COALESCE(s1.[Työajan käyttötiedot, hallinto], 0)
	,COALESCE(CASE WHEN s1.[Kelpoisuus, tutkinto] = -1 THEN  2 ELSE s1.[Kelpoisuus, tutkinto] END,2)
	,COALESCE(CASE WHEN s1.[Kelpoisuus, työkokemus] = -1 THEN 2 ELSE s1.[Kelpoisuus, työkokemus] END,2)
	,COALESCE(CASE WHEN s1.[Kelpoisuus, opettajankoulutus] = -1 THEN 2 ELSE s1.[Kelpoisuus, opettajankoulutus] END,2)
	,COALESCE(TRY_CONVERT(Datetime, LTRIM(RTRIM([s1].[Sopimus_alkupvm])), 104), -1) AS [sopimus_alkupvm]
	-- vakituisien työsuhteiden (nimitystapa) sopimuksen loppupvm:ksi  asetetaan
	-- suorien käsikirjan ohjeen mukainen  '9999-12-31 00:00:00.000'
	,CASE
		WHEN s1.[Nimitystapa (työsuhteen vakituisuus / määräaikaisuus)] = '2' and s1.vuosi < '2017'
			THEN COALESCE(TRY_CONVERT(Datetime, LTRIM(RTRIM(s1.[Sopimus_loppupvm])), 104), '9999-12-31 00:00:00.000')
		WHEN s1.[Nimitystapa (työsuhteen vakituisuus / määräaikaisuus)] in ('1', '2') and s1.vuosi > '2016'
  			THEN COALESCE(TRY_CONVERT(Datetime, LTRIM(RTRIM(s1.[Sopimus_loppupvm])), 104), '9999-12-31 00:00:00.000')
  		ELSE COALESCE(TRY_CONVERT(Datetime, LTRIM(RTRIM(s1.[Sopimus_loppupvm])), 104), -1)
	 END AS [sopimus_loppupvm]
	-- CSCVIPUNEN-4844: 2021 alkaen, vain  opetushenkilökunta sekä TKI-toiminnan henkilökunta
	,CASE
		WHEN s1.vuosi < 2021 or s11.koodi not in (1,2) THEN NULL
		WHEN s1.pedagogiset_opinnot_vuosi <= s1.vuosi THEN 1
		ELSE 0
	END as suorittanut_pedagogiset_opinnot
	,CASE
		WHEN s1.vuosi < 2021 or s11.koodi not in (1,2) THEN NULL
		WHEN s1.pedagogiset_opinnot_vuosi <= s1.vuosi THEN s1.pedagogiset_opinnot_vuosi
		ELSE NULL
	END as pedagogisten_opintojen_vuosi
	,CASE
		WHEN s1.vuosi < 2021 or s11.koodi not in (1,2) THEN -1
		WHEN s1.pedagogiset_opinnot_vuosi <= s1.vuosi THEN s22.id
		ELSE null
	END as d_virta_patevyydet_pedagogiset_opinnot_id
	,CASE
		WHEN s1.vuosi < 2021 or s11.koodi not in (1,2) THEN -1	
		WHEN s1.pedagogiset_opinnot_vuosi <= s1.vuosi THEN s23.id
		ELSE null
	END as d_organisaatioluokitus_pedagogiset_opinnot_id
	,CASE
		WHEN s1.vuosi < 2021 or s11.koodi not in (1,2) THEN NULL
		WHEN s1.tohtorintutkinto_vuosi <= s1.vuosi THEN 1 
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN 1 
		ELSE 0
	END as suorittanut_tohtorintutkinnon
	,CASE
		WHEN s1.vuosi < 2021 or s11.koodi not in (1,2) THEN -1
		WHEN tohtorintutkinto_vuosi <= s1.vuosi THEN s1.tohtorintutkinto_vuosi
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN -1 
		ELSE NULL
	END as tohtorintutkinnon_vuosi
	,CASE
		WHEN s1.vuosi < 2021 or s11.koodi not in (1,2) THEN -1
		WHEN s1.tohtorintutkinto_vuosi <= s1.vuosi THEN coalesce(s24.id,-1)
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN coalesce(s24.id,-1)
		ELSE null
	END as d_koulutusluokitus_tohtorintutkinto_id
	,CASE
		WHEN s1.vuosi < 2021 or s11.koodi not in (1,2) THEN -1 
		WHEN s1.tohtorintutkinto_vuosi <= s1.vuosi THEN coalesce(s25.id,-1)
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN coalesce(s25.id,-1)
		ELSE null
	END as d_organisaatioluokitus_tohtorintutkinto_id,
	CASE
		WHEN s1.vuosi < 2021 or s11.koodi not in (1,2) THEN '-1'
		WHEN s1.tohtorintutkinto_vuosi <= s1.vuosi THEN s1.tohtorintutkinnon_lahde
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN s1.tohtorintutkinnon_lahde
		ELSE null
	END as tohtorintutkinnon_lahde
	,getdate()
	,'etl: p_lataa_f_amk_henkilosto'
	,suser_sname()
FROM [sa].sa_suorat_amk1_henkilokunta s1
LEFT JOIN [dw].d_organisaatioluokitus s2 ON s1.Ammattikorkeakoulu = s2.organisaatio_koodi
LEFT JOIN [dw].d_tieteenala s3 ON s1.[Pääasiallinen tieteenala] = s3.tieteenala_koodi
-- eri vuosina voi olla sama toimipaikka, vaikka toimipistekoodi on eri, mutta ko. kenttä puuttuu sa.sa_suorat_amk1_henkilokunta-taulusta
LEFT JOIN [dw].[d_amk_toimipisteen_toimipaikka] s4 on s1.vuosi = s4.vuosi AND s1.ammattikorkeakoulu = s4.koodi_amk
	AND s1.toimipaikka = s4.koodi_toimipaikka -- toimipaikka löytyy muttei toimipiste, voi heitellä
LEFT JOIN [dw].[d_ek_nimike] s5 ON s1.Nimike = s5.koodi -- nimike on selkokielisenä
LEFT JOIN [dw].[d_tutkinnon_taso] s6 ON s1.[Merkittävimmän tutkinnon taso] = s6.koodi
LEFT JOIN [dw].[d_maatjavaltiot2] s7 ON s1.[kansalaisuus] = s7.maatjavaltiot2_koodi
LEFT JOIN [dw].[d_sukupuoli] s8 ON s1.Sukupuoli = s8.sukupuoli_koodi
LEFT JOIN [dw].[d_koulutusala_2002] s9 ON s1.[Pääasiallinen koulutusala 2002] = s9.koodi
LEFT JOIN [dw].[d_amk_muun_henkilokunnan_henkilostoryhma] s10 ON s1.[Muun henkilökunnan henkilöstöryhmä] = s10.koodi
LEFT JOIN [dw].[d_amk_tehtavanjaottelu] s11 ON s1.Tehtävänjaottelu = s11.koodi
LEFT JOIN [dw].[d_nimitystapa] s12 ON (
		SELECT CASE
				WHEN s1.[Nimitystapa (työsuhteen vakituisuus / määräaikaisuus)] = '1' and s1.vuosi <= 2016
					THEN '5'
				WHEN s1.[Nimitystapa (työsuhteen vakituisuus / määräaikaisuus)] = '2' and s1.vuosi <= 2016
  					THEN '6'
				WHEN s1.vuosi >= 2017
					THEN s1.[Nimitystapa (työsuhteen vakituisuus / määräaikaisuus)]
				ELSE '-1'
		END AS [Nimitystapa (työsuhteen vakituisuus / määräaikaisuus)]) = s12.koodi
LEFT JOIN [dw].[d_kieli] s13 ON s1.Äidinkieli = s13.kieli_koodi
LEFT JOIN [dw].[d_amk_paatoimiset_opettajat] s14 ON s1.[Päätoimiset opettajat] = s14.koodi
LEFT JOIN [dw].[d_ohjauksenala] s15 ON COALESCE(s1.ohjauksenala_koodi,-1) = s15.ohjauksenala_koodi -- tulee 2016
LEFT JOIN [dw].[d_ika] s20 ON (CASE WHEN NULLIF(s1.Syntymävuosi,'Tuntematon') IS NULL THEN '-1' ELSE CAST(CAST(s1.Vuosi AS int)-CAST(s1.Syntymävuosi AS int) AS varchar) END) = s20.ika_avain
LEFT JOIN [dw].[d_virta_patevyydet] s22 on s22.patevyys_koodi = s1.pedagogiset_opinnot_koodi
LEFT JOIN [dw].[d_organisaatioluokitus] s23 on s23.organisaatio_koodi = s1.pedagogiset_opinnot_korkeakoulu
LEFT JOIN [dw].[d_koulutusluokitus] s24 on s24.koulutusluokitus_koodi = s1.tohtorintutkinto_koodi
LEFT JOIN [dw].[d_organisaatioluokitus] s25 on s25.organisaatio_koodi = s1.tohtorintutkinto_korkeakoulu

EXEC dw.p_lataa_f_indikaattorit_kk_henkilostotiedot_amk