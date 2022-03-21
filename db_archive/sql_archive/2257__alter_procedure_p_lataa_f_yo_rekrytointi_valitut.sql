USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_rekrytointi_valitut]    Script Date: 17.5.2019 9:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_f_yo_rekrytointi_valitut]
AS
TRUNCATE TABLE [dw].[f_yo_rekrytointi_valitut]

INSERT INTO dw.f_yo_rekrytointi_valitut
	(
	 [vuosi]
	,[d_yliopisto_id] -- avaimen yliopisto+hakunumero 1. osa
	,[d_ek_nimike_id]
	--,[d_tutkijanuraporras_id] --sama kuin d_tutkijanuravaihe_id
	,[d_yo_nimitystapa_id]
	,[d_koulutusluokitus_id]
	,[d_tohtorintutkinnon_suoritusmaa_id]
	,[d_tohtorintutkinnon_yliopisto_id]
	,[tohtorintutkinnon_suoritusvuosi]
	,[d_kansalaisuus_id]
	,[d_sukupuoli_id]
	,[d_aidinkieli_id]
	,[d_organisaation_alayksikko_id]
	,[d_yo_toimipisteen_toimipaikka_id]
	,[d_tieteenala_id]
	,[d_yo_tutkijanuravaihe_id]  --käsikirjassa tutkijanuraporras
	,[d_yo_henkilostoryhma_id]
	,[d_yo_harjoittelukoulujen_henkilostoryhma_id]
	,[d_yo_tehtavajaottelu_id]
	,[d_arvokysymys_id]
	,[d_arvovastaus_id]
	,[d_ika_id]
	,[hakunumero] -- avaimen yliopisto+hakunumero 2. osa
	,[sopimusnumero]
	,[henkilonumero] -- avaimen 3. osa
	,[sopimus_alkupvm]
	,[sopimus_loppupvm]
	,[loadtime]
	,[source]
	,[username]
	)

SELECT
	 COALESCE(s1.tilastovuosi, - 1) AS [vuosi]
	,COALESCE(s3.id, - 1) AS [d_yliopisto_id]
	,COALESCE(s4.id, - 1) AS [d_ek_nimike_id]
	--,COALESCE(s5.id, - 1) AS [d_yo_tutkijanuraporras_id]
	,COALESCE(s6.id, - 1) AS [d_yo_nimitystapa_id]
	,COALESCE(s22.id, -1) AS [d_koulutusluokitus_id]
	,COALESCE(s7.id, - 1) AS [d_tohtorintutkinnon_suoritusmaa_id]
	,COALESCE(s8.id, - 1) AS [d_tohtorintutkinnon_yliopisto_id]
	,COALESCE(s1.[tohtorintutkinnon suoritusvuosi], -1) AS tohtorintutkinnon_suoritusvuosi
	,COALESCE(s9.id, - 1) AS [d_kansalaisuus_id]
	,COALESCE(s10.id, - 1) AS [d_sukupuoli_id]
	,COALESCE(s11.id, - 1) AS [d_aidinkieli_id]
	,COALESCE(s12.id, - 1) AS [d_organisaation_alayksikko_id]
	,COALESCE(s13.id, - 1) AS [d_yo_toimipisteen_toimipaikka_id]
	,COALESCE(s14.id, - 1) AS [d_tieteenala_id]
	,COALESCE(s15.id, - 1) AS [d_yo_tutkijanuravaihe_id]
	,COALESCE(s16.id, - 1) AS [d_yo_henkilostoryhma_id]
	,COALESCE(s17.id, - 1) AS [d_yo_harjoittelukoulujen_henkilostoryhma_id]
	,COALESCE(s18.id, - 1) AS [d_yo_tehtavajaottelu_id]
	,COALESCE(s19.id, - 1) AS [d_arvokysymys_id]
	,COALESCE(s20.id, - 1) AS [d_arvovastaus_id]
	,COALESCE(s21.id, - 1) AS [d_ika_id]
	,COALESCE(s1.hakunumero, '- 1') AS [hakunumero]
	,COALESCE(s1.sopimusnumero, '- 1') AS [sopimusnumero]
	,COALESCE(s1.henkilönumero, '- 1') AS [henkilonumero]
	,COALESCE(s1.[sopimuksen alkupäivämäärä], -1) AS [sopimus_alkupvm]
	,COALESCE(s1.[sopimuksen loppupäivämäärä], -1) AS [sopimus_loppupvm]
	,getdate() as loadtime
	,'etl: p_lataa_f_yo_rekrytointi_valitut - sa.sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot' AS source
	,suser_sname() as username   --select *
FROM [sa].[sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot] s1

LEFT JOIN [dw].[d_yo] s3 ON [s3].[yo_tunnus] = [s1].[korkeakoulu]
LEFT JOIN [dw].[d_ek_nimike] s4 ON [s4].[koodi] = [s1].[nimike]
--LEFT JOIN [dw].[d_yo_tutkijanuravaihe] s5 ON [s5].[koodi] = [s1].[tutkijanuraporras]
LEFT JOIN [dw].[d_yo_nimitystapa] s6 ON [s6].[koodi] = [s1].[nimitystapa]
LEFT JOIN [dw].[d_maatjavaltiot2] s7 ON [s7].[maatjavaltiot2_koodi] = [s1].[Tohtorintutkinnon suoritusmaa]
LEFT JOIN [dw].[d_yo] s8 ON [s8].[yo_tunnus] = [s1].[Tohtorintutkinnon yliopisto]
LEFT JOIN [dw].[d_maatjavaltiot2] s9 ON [s9].[maatjavaltiot2_koodi] = [s1].[kansalaisuus]
LEFT JOIN [dw].[d_sukupuoli] s10 ON [s10].[sukupuoli_koodi] = [s1].[sukupuoli]
LEFT JOIN [dw].[d_kieli] s11 ON [s11].[kieli_koodi] = [s1].[äidinkieli]
LEFT JOIN [dw].[d_organisaation_alayksikot] s12 ON  (select s12.[alayksikko_koodi]  where vuosi = (select max(vuosi) from dw.d_organisaation_alayksikot)) = [s1].[Laitos tai vastaava] AND [s12].[korkeakoulu_koodi] = [s1].[korkeakoulu]
LEFT JOIN [dw].[d_yo_toimipisteen_toimipaikka] s13 ON [s13].[koodi_toimipaikka] = [s1].[toimipaikka] AND s13.koodi_yliopisto = [s1].[korkeakoulu]
LEFT JOIN [dw].[d_tieteenala] s14 ON [s14].[tieteenala_koodi] = [s1].[pääasiallinen tieteenala]
LEFT JOIN [dw].[d_yo_tutkijanuravaihe] s15 ON [s15].[koodi] = [s1].[tutkijanuraporras]
LEFT JOIN [dw].[d_yo_henkilostoryhma] s16 ON [s16].[koodi] = [s1].[henkilöstöryhmä]
LEFT JOIN [dw].[d_yo_harjoittelukoulujen_henkilostoryhma] s17 ON [s17].[koodi] = [s1].[harjoittelukoulujen henkilöstöryhmä]
LEFT JOIN [dw].[d_yo_tehtavanjaottelu] s18 ON [s18].[koodi] = [s1].[tehtäväjaottelu]
--
--eliminate double rows with manually updated CASE statement
LEFT JOIN [dw].[d_arvokysymys] s19 ON [s19].[kysymys_fi] = [s1].[Kysymys]
										AND (SELECT CASE
														WHEN [s1].[tilastovuosi] = 2017 THEN 243
														WHEN [s1].[tilastovuosi] = 2018 THEN 274
													ELSE -1
													END AS kysymysryhmä_id) = [s19].[kysymysryhmaid]
LEFT JOIN [dw].[d_arvovastaus] s20 ON [s20].[vastaus_fi] = [s1].[vastaus]
LEFT JOIN [dw].[d_ika] s21 ON [s21].[ika_avain] = [s1].[ikä]
LEFT JOIN [dw].[d_koulutusluokitus] s22 ON [s22].[koulutusluokitus_koodi] = [s1].[Merkittävin tutkinto]
