USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_rekrytointi_valitut]    Script Date: 16.5.2019 18:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_f_amk_rekrytointi_valitut]
AS
TRUNCATE TABLE dw.f_amk_rekrytointi_valitut
INSERT INTO dw.f_amk_rekrytointi_valitut
	(
		[d_amk_id]
		,[d_ek_nimike_id]
		,[d_amk_tehtavaryhma_id]
		,[d_amk_tehtavanjaottelu_id]
		,[d_nimitystapa_id]
		,[d_amk_kelpoisuus_tutkinto_id]
		,[d_amk_kelpoisuus_tyokokemus_id]
		,[d_amk_kelpoisuus_opettajankoulutus_d]
		,[d_tieteenala_id]
		,[d_amk_paatoimiset_opettajat_id]
		,[d_koulutusluokitus_id]
		,[d_tutkinnon_taso_id]
		,[d_tohtorintutkinnon_suoritusyliopisto_id]
		,[d_tohtorintutkinnon_suoritusmaa_id]
		,[d_korkeimman_tutkinnon_suoritusmaa_id]
		,[d_amk_toimipisteen_toimipaikka_id]
		,[d_organisaation_alayksikko_id]
		,[d_sukupuoli_id]
		,[d_kansalaisuus_id]
		,[d_aidinkieli_id]
		,[d_ika_id]
		,[d_arvokysymys_id]
		,[d_arvovastaus_id]
		,[vuosi]
		,[hakunumero]
		,[sopimusnumero]
		,[henkilonumero]
		,[sopimus_alkupvm]
		,[sopimus_loppupvm]
		,[tohtorintutkinnon_suoritusvuosi]
		,[loadtime]
		,[source]
		,[username]
		)

SELECT
		COALESCE(s2.id, -1) AS [d_amk_id]
		,COALESCE(s3.id, -1) AS [d_ek_nimike_id]
		,COALESCE(s4.id, -1) AS [d_amk_tehtavaryhma_id]
		,COALESCE(s5.id, -1) AS [d_amk_tehtavanjaottelu_id]
		,COALESCE(s6.id, -1) AS [d_nimitystapa_id]
		,COALESCE(s7.id, -1) AS [d_amk_kelpoisuus_tutkinto_id]
		,COALESCE(s8.id, -1) AS [d_amk_kelpoisuus_tyokokemus_id]
		,COALESCE(s9.id, -1) AS [d_amk_kelpoisuus_opettajankoulutusi_d]
		,COALESCE(s10.id, -1) AS [d_tieteenala_id]
		,COALESCE(s11.id, -1) AS [d_amk_paatoimiset_opettajat_id]
		,COALESCE(s12.id, -1) AS [d_koulutusluokitus_id]
		,COALESCE(s13.id, -1) AS [d_tutkinnon_taso_id]
		,COALESCE(s14.id, -1) AS [d_tohtorintutkinnon_suoritusyliopisto_id]
		,COALESCE(s15.id, -1) AS [d_tohtorintutkinnon_suoritusmaa_id]
		,COALESCE(s16.id, -1) AS [d_korkeimman_tutkinnon_suoritusmaa_id]
		,COALESCE(s17.id, -1) AS [d_amk_toimipisteen_toimipaikka_id]
		,COALESCE(s18.id, -1) AS [d_organisaation_alayksikko_id]
		,COALESCE(s19.id, -1) AS [d_sukupuoli_id]
		,COALESCE(s20.id, -1) AS [d_kansalaisuus_id]
		,COALESCE(s21.id, -1) AS [d_aidinkieli_id]
		,COALESCE(s22.id, -1) AS [d_ika_id]
		,COALESCE(s23.id, -1) AS [d_arvokysymys_id]
		,COALESCE(s24.id, -1) AS [d_arvovastaus_id]
		,COALESCE(s1.[Tilastovuosi], -1) AS vuosi
		,COALESCE(s1.hakunumero, '- 1') AS [hakunumero]
		,COALESCE(s1.sopimusnumero, '- 1') AS [sopimusnumero]
		,COALESCE(s1.henkilönumero, '- 1') AS [henkilonumero]
		,COALESCE(s1.[sopimuksen alkupäivämäärä], - 1) AS [sopimus_alkupvm]
		,COALESCE(s1.[sopimuksen loppupäivämäärä], - 1) AS [sopimus_loppupvm]
		,COALESCE(s1.[tohtorintutkinnon suoritusvuosi], '-1') AS [tohtorintutkinnon_suoritusvuosi]
		,getdate() as loadtime
		,'etl: p_lataa_f_amk_rekrytointi_valitut - sa.sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot' AS source
		,suser_sname() as username

FROM [sa].[sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot] s1
LEFT JOIN [dw].[d_amk] s2 ON [s2].[amk_tunnus] = [s1].[Korkeakoulu]
LEFT JOIN [dw].[d_ek_nimike] s3 ON [s3].[selite_fi] = [s1].[Nimike]
LEFT JOIN [dw].[d_amk_tehtavaryhma] s4 ON [s4].[koodi] = [s1].[Tehtäväryhmä]
LEFT JOIN [dw].[d_amk_tehtavanjaottelu] s5 ON [s5].[koodi] = [s1].[Tehtävänjaottelu]
--!!!!!
--AMK has different NIMITYSAPA KOODI  before 2017
LEFT JOIN [dw].[d_nimitystapa] s6 ON (
		SELECT CASE
				WHEN s1.[Nimitystapa] = '1' and s1.Tilastovuosi <= 2016
					THEN '5'
        WHEN s1.[Nimitystapa] = '2' and s1.Tilastovuosi <= 2016
  				THEN '6'
        WHEN s1.Tilastovuosi >= 2017
            THEN s1.[Nimitystapa]
				ELSE '-1'
				END AS [Nimitystapa]) = s6.koodi
LEFT JOIN [dw].[d_amk_kelpoisuus] s7 ON [s7].[koodi] = [s1].[Kelpoisuus, tutkinto] --
LEFT JOIN [dw].[d_amk_kelpoisuus] s8 ON [s8].[koodi] = [s1].[Kelpoisuus, työkokemus] --
LEFT JOIN [dw].[d_amk_kelpoisuus] s9 ON [s9].[koodi] = [s1].[Kelpoisuus, opettajankoulutus] --
LEFT JOIN [dw].[d_tieteenala] s10 ON [s10].[tieteenala_koodi] = [s1].[Pääasiallinen tieteenala]
LEFT JOIN [dw].[d_amk_paatoimiset_opettajat] s11 ON [s11].[koodi] = [s1].[Päätoimiset opettajat]
LEFT JOIN [dw].[d_koulutusluokitus] s12 ON [s12].[koulutusluokitus_koodi] = [s1].[Henkilön suorittama merkittävin tutkinto]
LEFT JOIN [dw].[d_tutkinnon_taso] s13 ON [s13].[koodi] = [s1].[Merkittävimmän tutkinnon taso]
LEFT JOIN [dw].[d_yo] s14 ON [s14].[yo_tunnus] = [s1].[Tohtorintutkinnon yliopisto]
LEFT JOIN [dw].[d_maatjavaltiot2] s15 ON [s15].[maatjavaltiot2_koodi] = [s1].[Tohtorintutkinnon suoritusmaa]
LEFT JOIN [dw].[d_maatjavaltiot2] s16 ON [s16].[maatjavaltiot2_koodi] =  [s1].[Tutkinnon suoritusmaa]
LEFT JOIN [dw].[d_amk_toimipisteen_toimipaikka] s17 ON [s17].[koodi_toimipaikka] = [s1].[toimipaikka] AND [s17].[koodi_amk] = [s1].[korkeakoulu]
LEFT JOIN [dw].[d_organisaation_alayksikot] s18 ON [s18].[alayksikko_koodi] = [s1].[alayksikkö] AND [s18].[korkeakoulu_koodi]=[s1].[Korkeakoulu] AND [s18].[vuosi]=[s1].[tilastovuosi]
LEFT JOIN [dw].[d_sukupuoli] s19 ON [s19].[sukupuoli_koodi] = [s1].[sukupuoli]
LEFT JOIN [dw].[d_maatjavaltiot2] s20 ON [s20].[maatjavaltiot2_koodi] = [s1].[kansalaisuus]
LEFT JOIN [dw].[d_kieli] s21 ON [s21].[kieli_koodi] = [s1].[äidinkieli]
LEFT JOIN [dw].[d_ika] s22 ON [s22].[ika_avain] = [s1].[ikä]
--
--eliminate double rows with manually updated CASE statement
LEFT JOIN [dw].[d_arvokysymys] s23 ON [s23].[kysymys_fi] = [s1].[Kysymys]
										AND (SELECT CASE
														WHEN [s1].[tilastovuosi] = 2017 THEN 243
														WHEN [s1].[tilastovuosi] = 2018 THEN 274
													ELSE -1
													END AS kysymysryhmä_id) = [s23].[kysymysryhmaid]
LEFT JOIN [dw].[d_arvovastaus] s24 ON [s24].[vastaus_fi] = [s1].[vastaus]
