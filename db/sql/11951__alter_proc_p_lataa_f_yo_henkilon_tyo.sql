USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_henkilon_tyo]    Script Date: 8.4.2026 13.01.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_yo_henkilon_tyo]
AS

UPDATE 
	s1
SET
	pedagogiset_opinnot_koodi = s2.opettajapatevyyskoodi,
	pedagogiset_opinnot_korkeakoulu = s2.opettajapatevyyskorkeakoulu,
	pedagogiset_opinnot_vuosi = s2.opettajapatevyyssuoritusvuosi
FROM ANTERO.sa.sa_suorat_yo1_henkilon_tyo s1
LEFT JOIN  [VirtaSiirto].[sa].[sa_virta_otp_rekrytohtorit] s2 on s1.YO_HENKILONRO = s2.henkilonumero and s1.VUOSI = s2.tilastovuosi and s1.YLIOPISTO_TUNNUS = s2.rekrykorkeakoulu
WHERE s1.VUOSI >= 2021

TRUNCATE TABLE dw.f_yo_henkilon_tyo;

INSERT INTO dw.f_yo_henkilon_tyo (
	[d_yliopisto_id]
	,[d_toimipaikka_id]
	,[d_nimike_id]
	,[d_tutkinnon_suoritusmaa_id]
	,[d_kansalaisuus_id]
	,[d_sukupuoli_id]
	,[d_tutkijanuravaihe_id]
	,[d_henkilostoryhma_id]
	,[d_tehtavanjaottelu_id]
	,[d_harjoittelukoulujen_henkilostoryhma_id]
	,[d_valinta_kutsumenettelylla_id]
	,[d_nimitystapa_id]
	,[d_kieli_id]
	,[d_tieteenala_id]
	,[d_laitos_id]
	,[d_tiedekunta_id]
	,[d_koulutusala_id]
	,[d_ohjauksenala_id]
	,[d_ika_id]
	,[d_tutkinnon_taso_id]
	,[vuosi]
	,[henkilotyovuosi]
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
	,COALESCE(s5.id,-1)
	,COALESCE(s6.id,-1)
	,COALESCE(s7.id,-1)
	,COALESCE(s8.id,-1) -- s8.id
	,COALESCE(s9.id,-1) -- s9.id
	,COALESCE(s10.id,-1) -- s10.id
	,COALESCE(s11.id,-1) -- s11.id
	,COALESCE(s12.id,-1) -- s12.id
	,COALESCE(s13.id,-1)
	,COALESCE(s14.id,-1)
	,COALESCE(s15.id,-1)
	,COALESCE(s16.id,-1)
	,COALESCE(s17.id,-1)
	,COALESCE(s18.id,-1)
	,COALESCE(s19.id,-1)
	,COALESCE(s20.id,-1)
	,COALESCE(s21.id,-1)
	,[s1].VUOSI
	,HENKILOTYOVUOSI_LKM
	,COALESCE(TRY_CONVERT(Datetime, LTRIM(RTRIM(s1.[Sopimus_alkupvm])), 104), -1) AS [sopimus_alkupvm]
	-- vakituisien työsuhteiden (nimitystapa) sopimuksen loppupvm:ksi  asetetaan
	-- suorien käsikirjan ohjeen mukainen  '9999-12-31 00:00:00.000'
	,CASE
		WHEN s1.NIMITYSTAPA_KOODI in ('1','2')
			THEN COALESCE(TRY_CONVERT(Datetime, LTRIM(RTRIM(s1.[Sopimus_loppupvm])), 104), '9999-12-31 00:00:00.000')
		ELSE COALESCE(TRY_CONVERT(Datetime, LTRIM(RTRIM(s1.[Sopimus_loppupvm])), 104), -1)
	 END AS [sopimus_loppupvm]
	-- CSCVIPUNEN-4844: vuodesta 2021 alkaen, vain opetus- ja tutkimushenkilökunta
	,CASE
		WHEN s1.vuosi < 2021 or s10.koodi <> 1 THEN NULL
		WHEN s1.pedagogiset_opinnot_vuosi <= s1.vuosi THEN 1 
		ELSE 0
	END as suorittanut_pedagogiset_opinnot
	,CASE
		WHEN s1.vuosi < 2021 or s10.koodi <> 1 THEN NULL
		WHEN s1.pedagogiset_opinnot_vuosi <= s1.vuosi THEN s1.pedagogiset_opinnot_vuosi
		ELSE NULL
	END as pedagogisten_opintojen_vuosi
	,CASE
		WHEN s1.vuosi < 2021 or s10.koodi <> 1 THEN -1
		WHEN s1.pedagogiset_opinnot_vuosi <= s1.vuosi THEN s22.id
		ELSE null
	END as d_virta_patevyydet_pedagogiset_opinnot_id
	,CASE
		WHEN s1.vuosi < 2021 or s10.koodi <> 1 THEN -1	
		WHEN s1.pedagogiset_opinnot_vuosi <= s1.vuosi THEN s23.id
		ELSE null
	END as d_organisaatioluokitus_pedagogiset_opinnot_id
	,CASE
		WHEN s1.vuosi < 2021 or s10.koodi <> 1 THEN NULL
		WHEN s1.tohtorintutkinto_vuosi <= s1.vuosi THEN 1 
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN 1 
		ELSE 0
	END as suorittanut_tohtorintutkinnon
	,CASE
		WHEN s1.vuosi < 2021 or s10.koodi <> 1 THEN -1
		WHEN tohtorintutkinto_vuosi <= s1.vuosi THEN s1.tohtorintutkinto_vuosi
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN -1 
		ELSE NULL
	END as tohtorintutkinnon_vuosi
	,CASE
		WHEN s1.vuosi < 2021 or s10.koodi <> 1 THEN -1
		WHEN s1.tohtorintutkinto_vuosi <= s1.vuosi THEN coalesce(s24.id,-1)
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN coalesce(s24.id,-1)
		ELSE null
	END as d_koulutusluokitus_tohtorintutkinto_id
	,CASE
		WHEN s1.vuosi < 2021 or s10.koodi <> 1 THEN -1 
		WHEN s1.tohtorintutkinto_vuosi <= s1.vuosi THEN s25.id
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN coalesce(s25.id,-1)
		ELSE null
	END as d_organisaatioluokitus_tohtorintutkinto_id
	,CASE
		WHEN s1.vuosi < 2021 or s10.koodi <> 1 THEN '-1' 
		WHEN s1.tohtorintutkinto_vuosi <= s1.vuosi THEN s1.tohtorintutkinnon_lahde
		WHEN s1.tohtorintutkinto_vuosi is null and (s1.tohtorintutkinto_koodi is not null or s1.tohtorintutkinto_korkeakoulu is not null) THEN s1.tohtorintutkinnon_lahde
		ELSE null
	END as tohtorintutkinnon_lahde
	,getdate()
	,'etl: p_lataa_f_yo_henkilokunta'
	,suser_sname()
FROM [sa].[sa_suorat_yo1_henkilon_tyo] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.YLIOPISTO_TUNNUS = s2.organisaatio_koodi -- 460
LEFT JOIN [dw].[d_yo_toimipisteen_toimipaikka] s3 ON s1.vuosi = s3.vuosi AND s1.YLIOPISTO_TUNNUS = s3.koodi_yliopisto --added vuosi
	AND s1.TOIMIPAIKKA_KOODI = s3.koodi_toimipaikka
LEFT JOIN [dw].[d_ek_nimike] s4 ON COALESCE(s1.AMMATTINIMIKE_KOODI, '-1') = s4.koodi -- 474' tippuu jonnin verran
LEFT JOIN [dw].[d_maatjavaltiot2] s5 ON COALESCE(s1.TUTKINNON_SUORITUSMAA_KOODI, -1) = s5.maatjavaltiot2_koodi -- 440
LEFT JOIN [dw].[d_maatjavaltiot2] s6 ON COALESCE(s1.KANSALAISUUS_KOODI, -1) = s6.maatjavaltiot2_koodi -- 440
LEFT JOIN [dw].[d_sukupuoli] s7 ON s1.Sukupuoli = s7.sukupuoli_koodi -- 440
LEFT JOIN [dw].[d_yo_tutkijanuravaihe] s8 ON COALESCE(s1.TUTKIJANURAVAIHE_KOODI, -1) = s8.koodi --  tarvitaan tuntematon
LEFT JOIN [dw].[d_yo_henkilostoryhma] s9 ON COALESCE(s1.HENKILOSTORYHMA_KOODI,-1) = s9.koodi -- 440 -- tulossa
LEFT JOIN [dw].[d_yo_tehtavanjaottelu] s10 ON COALESCE(s1.TEHTAVANJAOTTELU_KOODI, -1) = s10.koodi -- tulossa
LEFT JOIN [dw].[d_yo_harjoittelukoulujen_henkilostoryhma] s11 ON COALESCE(s1.HARJOITTELUKOULUJEN_KOODI,-1) = s11.koodi
LEFT JOIN [dw].[d_yo_valinta_kutsumenettelylla] s12 ON COALESCE(s1.VALINTA_KUTSUMENETTELYLLA_KOODI,-1) = s12.koodi
LEFT JOIN [dw].[d_nimitystapa] s13 ON COALESCE(s1.NIMITYSTAPA_KOODI,-1) = s13.koodi
LEFT JOIN [dw].[d_kieli] s14 ON s1.AIDINKIELI_KOODI = s14.kieli_koodi
LEFT JOIN [dw].[d_tieteenala] s15 ON COALESCE(s1.TIETEENALA_KOODI_10,'-1') = s15.tieteenala_koodi -- tämä
LEFT JOIN [dw].[d_organisaation_alayksikot] s16 ON s1.LAITOS_KOODI = s16.alayksikko_koodi -- tuplaa
	AND s1.YLIOPISTO_TUNNUS = s16.korkeakoulu_koodi
	AND s1.VUOSI = s16.vuosi
LEFT JOIN [dw].[d_yo_tiedekunta] s17 ON coalesce(s1.TIEDEKUNTA_KOODI,'-1') = s17.tiedekuntakoodi -- ongelmallinen
	AND s1.YLIOPISTO_TUNNUS = s17.yliopistokoodi
LEFT JOIN [dw].[d_koulutusala_1995] s18 ON s1.KOULUTUSALAKOODI = s18.koodi -- myös tässä kohtaa tippuu, kohdistamattomien koodit
LEFT JOIN [dw].[d_ohjauksenala] s19 ON COALESCE(s1.OHJAUKSENALA_KOODI,-1) = s19.ohjauksenala_koodi
LEFT JOIN [dw].[d_ika] s20 ON (CASE WHEN NULLIF(s1.SYNTYMAVUOSI,'Tuntematon') IS NULL THEN '-1' ELSE CAST(CAST(s1.VUOSI AS int)-CAST(s1.SYNTYMAVUOSI AS int) AS varchar) END) = s20.ika_avain
LEFT JOIN [dw].[d_tutkinnon_taso] s21 ON COALESCE(LEFT(NULLIF(NULLIF(TUTKINTO_KOODI,' '),'-1'),1),'-1') = s21.koodi
LEFT JOIN [dw].[d_virta_patevyydet] s22 on s22.patevyys_koodi = s1.pedagogiset_opinnot_koodi
LEFT JOIN [dw].[d_organisaatioluokitus] s23 on s23.organisaatio_koodi = s1.pedagogiset_opinnot_korkeakoulu
LEFT JOIN [dw].[d_koulutusluokitus] s24 on s24.koulutusluokitus_koodi = s1.tohtorintutkinto_koodi
LEFT JOIN [dw].[d_organisaatioluokitus] s25 on s25.organisaatio_koodi = s1.tohtorintutkinto_korkeakoulu

EXEC dw.p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto