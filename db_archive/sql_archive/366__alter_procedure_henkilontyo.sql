ALTER PROCEDURE [dw].[p_lataa_f_amk_henkilon_tyo]
AS
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
	,[vuosi]
	,[henkilotyovuosi]
	,[tyoajan_kayttotiedot_opetus]
	,[tyoajan_kayttotiedot_tki_toiminta]
	,[tyoajan_kayttotiedot_tki_hallinto]
	,[kelpoisuus_tutkinto]
	,[kelpoisuus_tyokokemus]
	,[kelpoisuus_opettajankoulutus]
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
	,COALESCE(s14.id,-1)
	,[Vuosi]
	,Henkilotyovuosi
	,[Työajan käyttötiedot, opetus]
	,[Työajan käyttötiedot, TKI-toiminta]
	,[Työajan käyttötiedot, hallinto]
	,COALESCE(CASE WHEN [Kelpoisuus, tutkinto] = -1 THEN  2 ELSE [Kelpoisuus, tutkinto] END,2)
	,COALESCE(CASE WHEN [Kelpoisuus, työkokemus] = -1 THEN 2 ELSE [Kelpoisuus, työkokemus] END,2)
	,COALESCE(CASE WHEN [Kelpoisuus, opettajankoulutus] = -1 THEN 2 ELSE [Kelpoisuus, opettajankoulutus] END,2)
	,getdate()
	,'etl: p_lataa_f_amk_henkilosto'
	,suser_sname()
FROM [sa].sa_suorat_amk1_henkilokunta s1
LEFT JOIN [dw].d_amk s2 ON s1.Ammattikorkeakoulu = s2.amk_tunnus
LEFT JOIN [dw].d_tieteenala s3 ON s1.[Pääasiallinen tieteenala] = s3.tieteenala_koodi
LEFT JOIN [dw].[d_amk_toimipisteen_toimipaikka] s4 on s1.ammattikorkeakoulu = s4.koodi_amk
	AND s1.toimipaikka = s4.koodi_toimipaikka -- toimipaikka löytyy muttei toimipiste, voi heitellä
LEFT JOIN [dw].[d_ek_nimike] s5 ON s1.Nimike = s5.koodi -- nimike on selkokielisenä
LEFT JOIN [dw].[d_tutkinnon_taso] s6 ON s1.[Henkilön suorittaman merkittävin tutkinto] = s6.koodi
JOIN [dw].[d_maatjavaltiot2] s7 ON s1.[Tutkinnon suoritusmaa] = s7.maatjavaltiot2_koodi
JOIN [dw].[d_sukupuoli] s8 ON s1.Sukupuoli = s8.sukupuoli_koodi
LEFT JOIN [dw].[d_koulutusala_2002] s9 ON s1.[Pääasiallinen koulutusala 2002] = s9.koodi
JOIN [dw].[d_amk_muun_henkilokunnan_henkilostoryhma] s10 ON s1.[Muun henkilökunnan henkilöstöryhmä] = s10.koodi
JOIN [dw].[d_amk_tehtavanjaottelu] s11 ON s1.Tehtävänjaottelu = s11.koodi
JOIN [dw].[d_yo_nimitystapa] s12 ON s1.[Nimitystapa (työsuhteen vakituisuus / määräaikaisuus)] = s12.koodi
LEFT JOIN [dw].[d_kieli] s13 ON s1.Äidinkieli = s13.kieli_koodi
JOIN [dw].[d_amk_paatoimiset_opettajat] s14 ON s1.[Päätoimiset opettajat] = s14.koodi
JOIN [dw].[d_ohjauksenala] s15 ON COALESCE(s1.ohjauksenala_koodi,-1) = s15.ohjauksenala_koodi -- tulee 2016
;