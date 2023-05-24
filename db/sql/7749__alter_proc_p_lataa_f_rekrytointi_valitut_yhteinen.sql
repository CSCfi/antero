USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_rekrytointi_valitut_yhteinen]    Script Date: 24.5.2023 16:14:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_rekrytointi_valitut_yhteinen]
AS
TRUNCATE TABLE dw.f_rekrytointi_valitut_yhteinen
INSERT INTO dw.f_rekrytointi_valitut_yhteinen
	(
	   [Tilastovuosi]
      ,[d_korkeakoulu_id]
      ,[hakunumero]
      ,[henkilonumero]
      ,[sopimusnumero]
      ,[d_nimitystapa_id]
      ,[d_tehtavaryhma_id]
      ,[d_arvo_kysymys_id]
      ,[d_arvo_vastaus_id]
      ,[d_sukupuoli_id]
      ,[d_kansalaisuus_id]
      ,[d_aidinkieli_id]
      ,[d_tieteenala_id]
      ,[d_amk_tehtavajaottelu_id]
      ,[d_yo_tehtavajaottelu_id]
      ,[d_paatoimiset_opettajat_id]
      ,[d_amk_toimipaikka_id]
      ,[d_yo_toimipaikka_id]
      ,[d_amk_merkittavimmän_tutkinnon_taso_id]
      ,[d_tutkinnon_suoritusmaa_amk_id]
      ,[Tohtorintutkinnon suoritusvuosi]
      ,[d_tohtorintutkinnon_yliopisto_id]
      ,[d_tohtorintutkinnon_suoritusmaa_id]
	  ,[d_tohtorintutkinnon_koulutusluokitus_id]
	  ,[d_ylemman_kk_tutkinnon_koulutusluokitus_id]
	  ,[d_ylemman_kk_tutkinnon_organisaatioluokitus_id] 
	  ,[Ylemmän korkeakoulututkinnon suoritusvuosi]
      ,[d_kelpoisuus_tutkinto_id]
      ,[d_kelpoisuus_tyokokemus_id]
      ,[d_kelpoisuus_opettajankoulutus_id]
      ,[d_alayksikko_id]
      ,[sop_alk_pvm]
      ,[sop_lop_pvm]
      ,[d_ika_id]
      ,[d_kansainvalinen_haku_id]
      ,[d_kutsuhaku_id]
	  ,[d_yhteisprofessuuri_id]
      ,[d_merkittavin_tutkinto_id]
      ,[d_tutkijanuravaihe_id]
      ,[d_henkilostoryhma_id]
      ,[d_harjoittelukoulujen_henkilostoryhma_id]
      ,[d_nimike_id]
      ,[tunnus_sektori]
	  ,[loadtime]
	  ,[source]
	  ,[username]
		)
SELECT DISTINCT
	   s.[Tilastovuosi]
	  ,COALESCE(d.id, '-1') as d_korkeakoulu_id
      ,COALESCE(s.[Hakunumero], '-1') as hakunumero
      ,COALESCE(s.[Henkilönumero], '-1') as henkilonumero
      ,COALESCE([Sopimusnumero], '-1') as sopimusnumero
	  ,COALESCE(d3.id, '-1') as d_nimitystapa_id
      ,COALESCE(d4.id, '-1') as d_tehtavaryhma_id
      ,COALESCE(d19.id,'-1') as d_arvo_kysymys_id
      ,COALESCE(d20.id,'-1') as d_arvo_vastaus_id
      ,COALESCE(d2.id, '-1') as d_sukupuoli_id
      ,COALESCE(d5.id, '-1') as d_kansalaisuus_id
      ,COALESCE(d6.id, '-1') as d_aidinkieli_id
      ,COALESCE(d7.id, '-1') as d_tieteenala_id
      ,COALESCE(d8.id, '-1') as d_amk_tehtavajaottelu_id
	  ,'-1' as d_yo_tehtavajaottelu_id
      ,COALESCE(d9.id, '-1') as d_paatoimiset_opettajat_id
      ,COALESCE(d10.id, '-1') as d_amk_toimipaikka_id
	  ,'-1' as d_yo_toimipaikka_id
      ,COALESCE(d11.id, '-1') as d_amk_merkittavimmän_tutkinnon_taso_id
      ,COALESCE(d12.id, '-1') as d_tutkinnon_suoritusmaa_amk_id
      ,NULLIF(NULLIF([Tohtorintutkinnon suoritusvuosi],'0'),'-1') as 'Tohtorintutkinnon suoritusvuosi'
      ,COALESCE(d13.id, '-1') as d_tohtorintutkinnon_yliopisto_id
      ,COALESCE(d14.id, '-1') as d_tohtorintutkinnon_suoritusmaa_id
	  ,COALESCE(d28.id, '-1') as d_tohtorintutkinnon_koulutusluokitus_id
	  ,COALESCE(d27.id, '-1') as d_ylemman_kk_tutkinnon_koulutusluokitus_id
	  ,COALESCE(d26.id, '-1') as d_ylemman_kk_tutkinnon_organisaatioluokitus_id
	  ,NULLIF(NULLIF([Maisterintutkintosuoritusvuosi],'0'),'-1') as 'Ylemmän korkeakoulututkinnon suoritusvuosi'
      ,COALESCE(d15.id, '-1') as d_kelpoisuus_tutkinto_id
      ,COALESCE(d16.id, '-1') as d_kelpoisuus_tyokokemus_id
      ,COALESCE(d17.id, '-1') as d_kelpoisuus_opettajankoulutus_id
      ,COALESCE(d18.id, '-1') as d_alayksikko_id
      ,COALESCE([Sopimuksen alkupäivämäärä], '-1') as sop_alk_pvm
      ,COALESCE([Sopimuksen loppupäivämäärä], '-1') as sop_lop_pvm
      ,COALESCE(d21.id, '-1') as d_ika_id
	  ,COALESCE(d22a.id, COALESCE(d22b.id, '-1')) as d_kansainvalinen_haku_id
	  ,'-1' as d_kutsuhaku_id
	  ,'-1' as d_yhteisprofessuuri_id
	  ,COALESCE(d23.id, '-1') as d_merkittavin_tutkinto_id
	  ,'-1' as d_tutkijanuravaihe_id
	  ,'-1' as d_henkilostoryhma_id
	  ,'-1' as d_harjoittelukoulujen_henkilostoryhma_id
	  ,COALESCE(d24.id, '-1') as d_nimike_id
	  ,'amk' as tunnus_sektori 
	  ,getdate() as loadtime
	  ,'etl: p_lataa_f_yo_rekrytointi_valitut - sa.sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot' as source
	  ,suser_sname() as username
FROM (
  SELECT s2.* FROM (SELECT [Korkeakoulu], [Hakunumero], [Henkilönumero], MIN([Tilastovuosi]) AS Tilastovuosi
  FROM [ANTERO].[sa].[sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot]
  GROUP BY [Korkeakoulu], [Hakunumero], [Henkilönumero]) s
LEFT JOIN [ANTERO].[sa].[sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot] s2 on s.Hakunumero = s2.Hakunumero and s.Henkilönumero = s2.Henkilönumero and 
																			 s.Korkeakoulu = s2.Korkeakoulu and s.Tilastovuosi = s2.Tilastovuosi
	 ) s
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = s.Korkeakoulu
LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.sukupuoli_koodi = s.Sukupuoli
LEFT JOIN ANTERO.dw.d_nimitystapa d3 on d3.koodi = 
		(SELECT CASE
				WHEN s.Nimitystapa = '1' and s.Tilastovuosi <= 2016
					THEN '5'
        WHEN s.Nimitystapa = '2' and s.Tilastovuosi <= 2016
  				THEN '6'
        WHEN s.Tilastovuosi >= 2017
            THEN s.Nimitystapa
				ELSE '-1'
				END AS Nimitystapa)
LEFT JOIN ANTERO.dw.d_amk_tehtavaryhma d4 ON d4.koodi = s.Tehtäväryhmä
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d5 on d5.maatjavaltiot2_koodi = s.Kansalaisuus
LEFT JOIN ANTERO.dw.d_kieli d6 on d6.kieli_koodi = s.Äidinkieli
LEFT JOIN ANTERO.dw.d_tieteenala d7 on d7.tieteenala_koodi = s.[Pääasiallinen tieteenala]
LEFT JOIN ANTERO.dw.d_amk_tehtavanjaottelu d8 on d8.koodi= s.Tehtävänjaottelu
LEFT JOIN ANTERO.dw.d_amk_paatoimiset_opettajat d9 ON d9.koodi = s.[Päätoimiset opettajat]
LEFT JOIN ANTERO.dw.d_amk_toimipisteen_toimipaikka d10 on d10.koodi_toimipaikka = s.toimipaikka AND d10.koodi_amk = s.Korkeakoulu AND d10.vuosi = Tilastovuosi
LEFT JOIN ANTERO.dw.d_tutkinnon_taso d11 on d11.koodi = s.[Merkittävimmän tutkinnon taso]
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d12 on d12.maatjavaltiot2_koodi = s.[Tutkinnon suoritusmaa]
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d13 on d13.organisaatio_koodi = s.[Tohtorintutkinnon yliopisto]
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d14 on d14.maatjavaltiot2_koodi = s.[Tohtorintutkinnon suoritusmaa]
LEFT JOIN ANTERO.dw.d_amk_kelpoisuus d15 on d15.koodi = s.[Kelpoisuus, tutkinto]
LEFT JOIN ANTERO.dw.d_amk_kelpoisuus d16 on d16.koodi = s.[Kelpoisuus, työkokemus]
LEFT JOIN ANTERO.dw.d_amk_kelpoisuus d17 on d17.koodi = s.[Kelpoisuus, opettajankoulutus]
LEFT JOIN ANTERO.dw.d_organisaation_alayksikot d18 ON d18.alayksikko_koodi = s.alayksikkö AND d18.korkeakoulu_koodi= s.Korkeakoulu AND d18.vuosi=s.Tilastovuosi
LEFT JOIN [dw].[d_arvokysymys] d19 ON
--
--eliminate double rows (dublicate kysymysryhma for kysymys) when  kysymysryhmaid might vary
--  WHEN Finnish question
	(d19.kysymys_fi = s.Kysymys AND (select top 1 kysymysryhmaid from [dw].[d_arvokysymys] d1 where s.Kysymys= d1.kysymys_fi) = d19.kysymysryhmaid)
	 OR
--  WHEN Swedish question
	(d19.kysymys_sv = s.Kysymys AND (select top 1 kysymysryhmaid from [dw].[d_arvokysymys] d1 where s.Kysymys= d1.kysymys_sv) = d19.kysymysryhmaid)
--
LEFT JOIN [dw].[d_arvovastaus] d20 ON
--     WHEN Finnish question            OR    WHEN Swedish question
	d20.vastaus_fi = s.vastaus OR d20.vastaus_sv = s.Vastaus
LEFT JOIN ANTERO.dw.d_ika d21 on d21.ika_avain = s.Ikä
LEFT JOIN (SELECT Tilastovuosi, Korkeakoulu, Hakunumero, MAX([Haun kansainvälisyys]) as id FROM ANTERO.sa.sa_suorat_amk7a_rekrytointihaut
GROUP BY Tilastovuosi, Korkeakoulu, Hakunumero) d22a
on d22a.Hakunumero = s.Hakunumero AND d22a.Korkeakoulu = s.Korkeakoulu AND d22a.Tilastovuosi = s.Tilastovuosi
LEFT JOIN (SELECT Tilastovuosi, Korkeakoulu, Hakunumero, MAX([Haun kansainvälisyys]) as id FROM ANTERO.sa.sa_suorat_amk7a_rekrytointihaut
GROUP BY Tilastovuosi, Korkeakoulu, Hakunumero) d22b
on d22b.Hakunumero = s.Hakunumero AND d22b.Korkeakoulu = s.Korkeakoulu AND (d22b.Tilastovuosi+1) = s.Tilastovuosi
LEFT JOIN ANTERO.dw.d_koulutusluokitus d23 ON d23.koulutusluokitus_koodi = s.[Henkilön suorittama merkittävin tutkinto]
LEFT JOIN ANTERO.dw.d_ek_nimike d24 ON d24.selite_fi = s.Nimike
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d26 on d26.organisaatio_koodi = s.[Maisterintutkintokorkeakoulu]
LEFT JOIN ANTERO.dw.d_koulutusluokitus d27 on d27.koulutusluokitus_koodi = s.[Maisterintutkintokoulutuskoodi]
LEFT JOIN ANTERO.dw.d_koulutusluokitus d28 on d28.koulutusluokitus_koodi = s.[Tohtoritutkintokoulutuskoodi]

UNION ALL

SELECT DISTINCT
       s.[Tilastovuosi]
	  ,COALESCE(d.id, '-1') as d_korkeakoulu_id
      ,COALESCE(s.[Hakunumero], '-1') as hakunumero
      ,COALESCE(s.[Henkilönumero], '-1') as henkilonumero
      ,COALESCE([Sopimusnumero], '-1') as sopimusnumero
	  ,COALESCE(d3.id, '-1') as d_nimitystapa_id
      ,'-1' as d_tehtavaryhma_id
      ,COALESCE(d19.id,'-1') as d_arvo_kysymys_id
      ,COALESCE(d20.id,'-1') as d_arvo_vastaus_id
      ,COALESCE(d2.id, '-1') as d_sukupuoli_id
      ,COALESCE(d5.id, '-1') as d_kansalaisuus_id
      ,COALESCE(d6.id, '-1') as d_aidinkieli_id
      ,COALESCE(d7.id, '-1') as d_tieteenala_id
      ,'-1' as d_amk_tehtavajaottelu_id
	  ,COALESCE(d8.id, '-1') as d_yo_tehtavajaottelu_id
      ,'-1' as d_paatoimiset_opettajat_id
      ,'-1' as d_amk_toimipaikka_id
	  ,COALESCE(d10.id, '-1') as d_yo_toimipaikka_id
      ,'-1' as d_amk_merkittavimmän_tutkinnon_taso_id
      ,'-1' as d_tutkinnon_suoritusmaa_amk_id
      ,NULLIF(NULLIF([Tohtorintutkinnon suoritusvuosi],'0'),'-1') as 'Tohtorintutkinnon suoritusvuosi'
      ,COALESCE(d13.id, '-1') as d_tohtorintutkinnon_yliopisto_id
      ,COALESCE(d14.id, '-1') as d_tohtorintutkinnon_suoritusmaa_id
	  ,COALESCE(d28.id, '-1') as d_tohtorintutkinnon_koulutusluokitus_id
	  ,COALESCE(d27.id, '-1') as d_ylemman_kk_tutkinnon_koulutusluokitus_id
	  ,COALESCE(d26.id, '-1') as d_ylemman_kk_tutkinnon_organisaatioluokitus_id
	  ,NULLIF(NULLIF([Maisterintutkintosuoritusvuosi],'0'),'-1') as 'Ylemmän korkeakoulututkinnon suoritusvuosi'
      ,'-1' as d_kelpoisuus_tutkinto_id
      ,'-1' as d_kelpoisuus_tyokokemus_id
      ,'-1' as d_kelpoisuus_opettajankoulutus_id
      ,COALESCE(d12.id, '-1') as d_alayksikko_id
      ,COALESCE([Sopimuksen alkupäivämäärä], '-1') as sop_alk_pvm
      ,COALESCE([Sopimuksen loppupäivämäärä], '-1') as sop_lop_pvm
      ,COALESCE(d21.id, '-1') as d_ika_id
	  ,COALESCE(d22a.id1, COALESCE(d22b.id1, '-1')) as d_kansainvalinen_haku_id
	  ,COALESCE(d22a.id3, COALESCE(d22b.id3, COALESCE([Valinta kutsumenettelyllä], '-1'))) as d_kutsuhaku_id
	  ,COALESCE(d22a.id2, COALESCE(d22b.id2,'-1')) as d_yhteisprofessuuri_id
	  ,COALESCE(d9.id, '-1') as d_merkittavin_tutkinto_id
	  ,COALESCE(d11.id, '-1') as d_tutkijanuravaihe_id
	  ,COALESCE(d23.id, '-1') as d_henkilostoryhma_id
	  ,COALESCE(d24.id, '-1') as d_harjoittelukoulujen_henkilostoryhma_id
	  ,COALESCE(d25.id, '-1') as d_nimike_id
	  ,'yo' as tunnus_sektori 
	  ,getdate() as loadtime
	  ,'etl: p_lataa_f_yo_rekrytointi_valitut - sa.sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot' as source
	  ,suser_sname() as username
FROM (
  SELECT s2.* FROM (SELECT [Korkeakoulu], [Hakunumero], [Henkilönumero], MIN([Tilastovuosi]) AS Tilastovuosi
  FROM [ANTERO].[sa].[sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot]
  GROUP BY [Korkeakoulu], [Hakunumero], [Henkilönumero]) s
LEFT JOIN [ANTERO].[sa].[sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot] s2 on s.Hakunumero = s2.Hakunumero and s.Henkilönumero = s2.Henkilönumero and 
																				 s.Korkeakoulu = s2.Korkeakoulu and s.Tilastovuosi = s2.Tilastovuosi
	 ) s
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = s.Korkeakoulu
LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.sukupuoli_koodi = s.Sukupuoli
LEFT JOIN ANTERO.dw.d_nimitystapa d3 on d3.koodi = s.Nimitystapa
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d5 on d5.maatjavaltiot2_koodi = s.Kansalaisuus
LEFT JOIN ANTERO.dw.d_kieli d6 on d6.kieli_koodi = s.Äidinkieli
LEFT JOIN ANTERO.dw.d_tieteenala d7 on d7.tieteenala_koodi = s.[Pääasiallinen tieteenala]
LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d8 ON d8.koodi = s.Tehtäväjaottelu
LEFT JOIN ANTERO.dw.d_koulutusluokitus d9 ON d9.koulutusluokitus_koodi = s.[Merkittävin tutkinto]
LEFT JOIN ANTERO.dw.d_yo_toimipisteen_toimipaikka d10 on d10.koodi_toimipaikka = s.toimipaikka AND d10.koodi_yliopisto = s.Korkeakoulu AND d10.vuosi = Tilastovuosi
LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d11 ON d11.koodi = s.Tutkijanuraporras
LEFT JOIN ANTERO.dw.d_organisaation_alayksikot d12 ON (select d12.[alayksikko_koodi]  where d12.vuosi = (select max(vuosi) from dw.d_organisaation_alayksikot)) = s.[Laitos tai vastaava] AND d12.korkeakoulu_koodi = s.Korkeakoulu
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d13 on d13.organisaatio_koodi = s.[Tohtorintutkinnon yliopisto]
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d14 on d14.maatjavaltiot2_koodi = s.[Tohtorintutkinnon suoritusmaa]
LEFT JOIN [dw].[d_arvokysymys] d19 ON
--
--eliminate double rows (dublicate kysymysryhma for kysymys) when  kysymysryhmaid might vary
--  WHEN Finnish question
	(d19.kysymys_fi = s.Kysymys AND (select top 1 kysymysryhmaid from [dw].[d_arvokysymys] d1 where s.Kysymys= d1.kysymys_fi) = d19.kysymysryhmaid)
	 OR
--  WHEN Swedish question
	(d19.kysymys_sv = s.Kysymys AND (select top 1 kysymysryhmaid from [dw].[d_arvokysymys] d1 where s.Kysymys= d1.kysymys_sv) = d19.kysymysryhmaid)
--
LEFT JOIN [dw].[d_arvovastaus] d20 ON
--     WHEN Finnish question            OR    WHEN Swedish question
	d20.vastaus_fi = s.vastaus OR d20.vastaus_sv = s.Vastaus
LEFT JOIN ANTERO.dw.d_ika d21 on d21.ika_avain = s.Ikä
LEFT JOIN (SELECT Tilastovuosi, Korkeakoulu, Hakunumero, MAX([Haun kansainvälisyys]) as id1, MAX(Yhteisprofessuuri) as id2, MAX(Kutsuhaku) as id3 FROM ANTERO.sa.sa_suorat_yo8a_rekrytointihaut
GROUP BY Tilastovuosi, Korkeakoulu, Hakunumero) d22a
on d22a.Hakunumero = s.Hakunumero AND d22a.Korkeakoulu = s.Korkeakoulu AND d22a.Tilastovuosi = s.Tilastovuosi
LEFT JOIN (SELECT Tilastovuosi, Korkeakoulu, Hakunumero, MAX([Haun kansainvälisyys]) as id1, MAX(Yhteisprofessuuri) as id2, MAX(Kutsuhaku) as id3 FROM ANTERO.sa.sa_suorat_yo8a_rekrytointihaut
GROUP BY Tilastovuosi, Korkeakoulu, Hakunumero) d22b
on d22b.Hakunumero = s.Hakunumero AND d22b.Korkeakoulu = s.Korkeakoulu AND (d22b.Tilastovuosi+1) = s.Tilastovuosi
LEFT JOIN ANTERO.dw.d_yo_henkilostoryhma d23 ON d23.koodi= s.Henkilöstöryhmä
LEFT JOIN ANTERO.dw.d_yo_harjoittelukoulujen_henkilostoryhma d24 ON d24.koodi = s.[Harjoittelukoulujen henkilöstöryhmä]
LEFT JOIN ANTERO.dw.d_ek_nimike d25 ON d25.koodi = s.Nimike
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d26 on d26.organisaatio_koodi = s.[Maisterintutkintokorkeakoulu]
LEFT JOIN ANTERO.dw.d_koulutusluokitus d27 on d27.koulutusluokitus_koodi = s.[Maisterintutkintokoulutuskoodi]
LEFT JOIN ANTERO.dw.d_koulutusluokitus d28 on d28.koulutusluokitus_koodi = s.[Tohtoritutkintokoulutuskoodi]


GO

USE [ANTERO]