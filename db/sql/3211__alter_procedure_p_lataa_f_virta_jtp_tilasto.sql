USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_jtp_tilasto]    Script Date: 18.8.2020 11:17:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dw].[p_lataa_f_virta_jtp_tilasto] AS

TRUNCATE TABLE dw.f_virta_jtp_tilasto

INSERT INTO dw.f_virta_jtp_tilasto (
  tilastovuosi,
  ilmoitusvuosi,
  julkaisunTunnus,
  yhteisjulkaisunTunnus,
  yhteisjulkaisuId, 
  d_virtajtpsektori_id,
  d_organisaatio_id,
  d_julkaisufoorumitaso_id,
  d_julkaisutyyppi_id,
  d_julkaisun_kansainvalisyys_id,
  d_kansainvalinen_yhteisjulkaisu_id,
  d_tieteenala_id,
  d_taiteenala_id,
  d_taidealantyyppikategoria_id,    
  lkm,                              
  d_ohjauksenala_id,
  d_koulutusala95_id,
  d_koulutusala02_id,
  d_yhteisjulkaisuSHPKytkin_id,
  d_yhteisjulkaisuTutkimuslaitosKytkin_id,
  d_yhteisjulkaisuMuuKytkin_id,
  d_yhteisjulkaisuYritysKytkin_id,
  d_rinnakkaistallennusKytkin_id,
  d_avoinSaatavuus_id,
  lukumaara,
  d_julkaisufoorumitaso_vanha_id,
  d_julkaisufoorumitaso_uusi_id,
  jufoid,
  source
)


SELECT 
  tilastovuosi,
  ilmoitusvuosi,
  julkaisunTunnus,
  yhteisjulkaisunTunnus,
  yhteisjulkaisuId, 
  d_virtajtpsektori_id,
  d_organisaatio_id,
  d_julkaisufoorumitaso_id,
  d_julkaisutyyppi_id,
  d_julkaisun_kansainvalisyys_id,
  d_kansainvalinen_yhteisjulkaisu_id,
  d_tieteenala_id,
  d_taiteenala_id,
  d_taidealantyyppikategoria_id,     
  lkm,                               
  coalesce(d8.id,-1) as d_ohjauksenala_id,
  d_koulutusala95_id,
  d_koulutusala02_id,
  d_yhteisjulkaisuSHPKytkin_id,
  d_yhteisjulkaisuTutkimuslaitosKytkin_id,
  d_yhteisjulkaisuMuuKytkin_id,
  d_yhteisjulkaisuYritysKytkin_id,
  d_rinnakkaistallennusKytkin_id,
  d_avoinSaatavuus_id,
  cast(lukumaara as decimal(6,5)) as lukumaara,   
  d_julkaisufoorumitaso_vanha_id,
  d_julkaisufoorumitaso_uusi_id, 
  jufoid,
  'ETL: p_lataa_f_virta_jtp_tilasto' AS source
  
  FROM

(

SELECT
  f.julkaisuVuosi AS tilastovuosi,
  f.ilmoitusVuosi AS ilmoitusvuosi, 
  f.julkaisunTunnus,
  yhteisjulkaisunTunnus,
  yhteisjulkaisuId, 
  coalesce(d1.id,-1) AS d_virtajtpsektori_id,
  coalesce(d2_1.id,d2_2.id,d2_3.id,d2_4.id,-1) AS d_organisaatio_id,
  coalesce(d3.id,-1) AS d_julkaisufoorumitaso_id,
  coalesce(d4.id,-1) AS d_julkaisutyyppi_id,
  coalesce(d5.id,-1) AS d_julkaisun_kansainvalisyys_id,
  coalesce(d6.id,-1) AS d_kansainvalinen_yhteisjulkaisu_id,
  coalesce(d7.id,-1) AS d_tieteenala_id,
  coalesce(d20.id,-1) AS d_taiteenala_id,
  coalesce(d21.taidealanTyyppiKategoria,-1) AS d_taidealantyyppikategoria_id,     
  coalesce(d21.lkm,1) AS lkm,                                       
  coalesce(d9.id,-1) AS d_koulutusala95_id,
  coalesce(d10.id,-1) AS d_koulutusala02_id,
  coalesce([kasvatusalat_1],'0') as kasvatusalat_1,
  coalesce([taiteet_ja_kulttuurialat_2],'0') as taiteet_ja_kulttuurialat_2,
  coalesce([humanistiset_alat_3],'0') as humanistiset_alat_3,
  coalesce([yhteiskunnalliset_alat_4],'0') as yhteiskunnalliset_alat_4,
  coalesce([kauppa_hallinto_ja_oikeustieteet_5],'0') as kauppa_hallinto_ja_oikeustieteet_5,
  coalesce([luonnontieteet_6],'0') as luonnontieteet_6,
  coalesce([tietojenkasittely_ja_tietoliikenne_7],'0') as tietojenkasittely_ja_tietoliikenne_7,
  coalesce([tekniikan_alat_8],'0') as tekniikan_alat_8,
  coalesce([maa_ja_metsatalousalat_9],'0') as maa_ja_metsatalousalat_9,
  coalesce([laaketieteet_10],'0') as laaketieteet_10,
  coalesce([terveys_ja_hyvinvointialat_11],'0') as terveys_ja_hyvinvointialat_11,
  coalesce([palvelualat_12],'0') as palvelualat_12,
  coalesce(d12.id,-1) AS d_yhteisjulkaisuSHPKytkin_id,
  coalesce(d13.id,-1) AS d_yhteisjulkaisuTutkimuslaitosKytkin_id,
  coalesce(d14.id,-1) AS d_yhteisjulkaisuMuuKytkin_id,
  coalesce(d15.id,-1) AS d_yhteisjulkaisuYritysKytkin_id,
  coalesce(d16.id,-1) AS d_rinnakkaistallennusKytkin_id,
  coalesce(d17.id,-1) AS d_avoinSaatavuus_id,
  coalesce(d18.id,-1) AS d_julkaisufoorumitaso_vanha_id,
  coalesce(d19.id,-1) AS d_julkaisufoorumitaso_uusi_id,
  f.JufoTunnus as jufoid

  
FROM sa.sa_virta_jtp_tkjulkaisut f

LEFT JOIN dw.d_virtajtpsektori d1 ON d1.virtajtpsektori_koodi = f.orgSektori
LEFT JOIN dw.d_organisaatioluokitus d2_1 ON d2_1.organisaatio_avain like 'oppilaitosnumero_%' and d2_1.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dw.d_organisaatioluokitus d2_2 ON d2_2.organisaatio_avain like 'koulutustoimija_%' and d2_2.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dw.d_organisaatioluokitus d2_3 ON d2_3.organisaatio_avain like 'tutkimusorganisaatio_%' and d2_3.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dw.d_organisaatioluokitus d2_4 ON d2_4.organisaatio_avain like 'oppilaitos_%' and d2_4.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dw.d_julkaisufoorumitaso d3 ON d3.julkaisufoorumitaso_koodi = coalesce(f.jufoLuokkaKoodi,'-') --nb! puuttuva arvo on -=Arvioitavana (pitäisi olla tyhjä, mutta koodistopalvelu ei salli)

left join dw.d_julkaisufoorumitaso d18 ON d18.julkaisufoorumitaso_koodi = coalesce(f.jufoLuokkaVanha,'-') --new --nb! puuttuva arvo on -=Arvioitavana (pitäisi olla tyhjä, mutta koodistopalvelu ei salli)
left join dw.d_julkaisufoorumitaso d19 ON d19.julkaisufoorumitaso_koodi = coalesce(f.jufoLuokkaUusi,'-') --new --nb! puuttuva arvo on -=Arvioitavana (pitäisi olla tyhjä, mutta koodistopalvelu ei salli)

left join sa.sa_virta_jtp_taidealantyyppikategoria d21 on d21.julkaisunTunnus = f.julkaisunTunnus    

LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi = f.julkaisutyyppiKoodi
LEFT JOIN dw.d_julkaisun_kansainvalisyys d5 ON d5.julkaisun_kansainvalisyys_koodi = f.julkaisunKansainvalisyysKytkin
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d6 ON d6.kansainvalinen_yhteisjulkaisu_koodi = f.yhteisjulkaisuKVKytkin
LEFT JOIN dw.d_tieteenala d7 ON d7.tieteenala_koodi = -- f.tieteenalaTKs --nb! korvertoitu lista lennossa yhdeksi koodiarvoksi
  case when ISJSON(f.tieteenalaTKs)=1
  then (
    SELECT TOP 1 tieteenala
    FROM OPENJSON(f.tieteenalaTKs) WITH (tieteenala varchar(5) '$.tieteenala', jnro int '$.jNro')
    WHERE jnro=1
  ) end
LEFT JOIN dw.d_taiteenala d20 ON d20.taiteenala_koodi = --taiteenalaTKs
  case when ISJSON(f.taiteenalaTKs)=1
  then (
    SELECT TOP 1 taiteenala
	FROM OPENJSON(f.taiteenalaTKs) WITH (taiteenala varchar(5) '$.taiteenala', jnro int '$.jNro')
	WHERE jnro=1
  ) end
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.koodi = --koulutusalaTKs
  case when ISJSON(f.koulutusalaTKs)=1
  then (
    SELECT TOP 1 koulutusala
    FROM OPENJSON(f.koulutusalaTKs) WITH (koulutusala varchar(5) '$.koulutusala', jnro int '$.jNro')
    WHERE jnro=1
  ) end
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.koodi = --koulutusalaTKs
  case when ISJSON(f.koulutusalaTKs)=1
  then (
    SELECT TOP 1 koulutusala
    FROM OPENJSON(f.koulutusalaTKs) WITH (koulutusala varchar(5) '$.koulutusala', jnro int '$.jNro')
    WHERE jnro=1
  ) end
LEFT JOIN dw.d_kytkin d12 on d12.kytkin_koodi = nullif(yhteisjulkaisuSHPKytkin,'')
LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = nullif(yhteisjulkaisuTutkimuslaitosKytkin,'')
LEFT JOIN dw.d_kytkin d14 on d14.kytkin_koodi = nullif(yhteisjulkaisuMuuKytkin,'')
LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = nullif(yhteisjulkaisuYritysKytkin,'')
LEFT JOIN dw.d_kytkin d16 on d16.kytkin_koodi = nullif(rinnakkaistallennusKytkin,'')
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.avoinsaatavuus_koodi = f.avoinSaatavuusKoodi

) f2

UNPIVOT
(
  lukumaara
  for ohjauksen_ala in (
     [kasvatusalat_1]
      ,[taiteet_ja_kulttuurialat_2]
      ,[humanistiset_alat_3]
      ,[yhteiskunnalliset_alat_4]
      ,[kauppa_hallinto_ja_oikeustieteet_5]
      ,[luonnontieteet_6]
      ,[tietojenkasittely_ja_tietoliikenne_7]
      ,[tekniikan_alat_8]
      ,[maa_ja_metsatalousalat_9]
      ,[laaketieteet_10]
      ,[terveys_ja_hyvinvointialat_11]
      ,[palvelualat_12])
) unpiv

LEFT JOIN dw.d_ohjauksenala d8 on d8.ohjauksenala_koodi = LTRIM(REPLACE(RIGHT(ohjauksen_ala,2),'_',''))

WHERE tilastovuosi>=2016 and d_virtajtpsektori_id not in (1,4) and cast(lukumaara as decimal(6,5))>0.00000


UNION ALL


SELECT
  f3.julkaisuVuosi AS tilastovuosi,
  f3.ilmoitusVuosi AS ilmoitusvuosi,
  julkaisunTunnus,
  yhteisjulkaisunTunnus,
  yhteisjulkaisuId, 
  coalesce(d1.id,-1) AS d_virtajtpsektori_id,
  coalesce(d2_1.id,d2_2.id,d2_3.id,d2_4.id,-1) AS d_organisaatio_id,
  coalesce(d3.id,-1) AS d_julkaisufoorumitaso_id,
  coalesce(d4.id,-1) AS d_julkaisutyyppi_id,
  coalesce(d5.id,-1) AS d_julkaisun_kansainvalisyys_id,
  coalesce(d6.id,-1) AS d_kansainvalinen_yhteisjulkaisu_id,
  coalesce(d7.id,-1) AS d_tieteenala_id,
  -1 as d_taiteenala_id,
  -1 as d_taidealantyyppikategoria_id,   
  1 as lkm,                              
  -1 as d_ohjauksenala_id,
  coalesce(d9.id,-1) AS d_koulutusala95_id,
  coalesce(d10.id,-1) AS d_koulutusala02_id,
  coalesce(d12.id,-1) AS d_yhteisjulkaisuSHPKytkin_id,
  coalesce(d13.id,-1) AS d_yhteisjulkaisuTutkimuslaitosKytkin_id,
  coalesce(d14.id,-1) AS d_yhteisjulkaisuMuuKytkin_id,
  -1 AS d_yhteisjulkaisuYritysKytkin_id,
  coalesce(d16.id,-1) AS d_rinnakkaistallennusKytkin_id,
  coalesce(d17.id,-1) AS d_avoinSaatavuus_id,   -- changed 2020-08-18. Old row: -1 AS d_avoinSaatavuus_id, 
  cast(1 as decimal(6,5)) AS lukumaara,
  coalesce(d18.id,-1) AS d_julkaisufoorumitaso_vanha_id, 
  coalesce(d19.id,-1) AS d_julkaisufoorumitaso_uusi_id,
  f3.JufoTunnus as jufoid,  
  'ETL: p_lataa_f_virta_jtp_tilasto' AS source

  
FROM sa.sa_virta_jtp_tkjulkaisut f3

LEFT JOIN dw.d_virtajtpsektori d1 ON d1.virtajtpsektori_koodi = f3.orgSektori
LEFT JOIN dw.d_organisaatioluokitus d2_1 ON d2_1.organisaatio_avain like 'oppilaitosnumero_%' and d2_1.organisaatio_koodi = f3.organisaatioTunnus
LEFT JOIN dw.d_organisaatioluokitus d2_2 ON d2_2.organisaatio_avain like 'koulutustoimija_%' and d2_2.organisaatio_koodi = f3.organisaatioTunnus
LEFT JOIN dw.d_organisaatioluokitus d2_3 ON d2_3.organisaatio_avain like 'tutkimusorganisaatio_%' and d2_3.organisaatio_koodi = f3.organisaatioTunnus
LEFT JOIN dw.d_organisaatioluokitus d2_4 ON d2_4.organisaatio_avain like 'oppilaitos_%' and d2_4.organisaatio_koodi = f3.organisaatioTunnus
LEFT JOIN dw.d_julkaisufoorumitaso d3 ON d3.julkaisufoorumitaso_koodi = coalesce(f3.jufoLuokkaKoodi,'-') --nb! puuttuva arvo on -=Arvioitavana (pitäisi olla tyhjä, mutta koodistopalvelu ei salli)

left join dw.d_julkaisufoorumitaso d18 ON d18.julkaisufoorumitaso_koodi = coalesce(f3.jufoLuokkaVanha,'-') --new --nb! puuttuva arvo on -=Arvioitavana (pitäisi olla tyhjä, mutta koodistopalvelu ei salli)
left join dw.d_julkaisufoorumitaso d19 ON d19.julkaisufoorumitaso_koodi = coalesce(f3.jufoLuokkaUusi,'-') --new --nb! puuttuva arvo on -=Arvioitavana (pitäisi olla tyhjä, mutta koodistopalvelu ei salli)

LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi = f3.julkaisutyyppiKoodi
LEFT JOIN dw.d_julkaisun_kansainvalisyys d5 ON d5.julkaisun_kansainvalisyys_koodi = f3.julkaisunKansainvalisyysKytkin
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d6 ON d6.kansainvalinen_yhteisjulkaisu_koodi = f3.yhteisjulkaisuKVKytkin
LEFT JOIN dw.d_tieteenala d7 ON d7.tieteenala_koodi = --f3.tieteenalaTKs --nb! korvertoitu lista lennossa yhdeksi koodiarvoksi
  case when ISJSON(f3.tieteenalaTKs)=1
  then (
    SELECT TOP 1 tieteenala
    FROM OPENJSON(f3.tieteenalaTKs) WITH (tieteenala varchar(5) '$.tieteenala', jnro int '$.jNro')
    WHERE jnro=1
  ) end
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.koodi = --f3.koulutusalaTKs
  case when ISJSON(f3.koulutusalaTKs)=1
  then (
    SELECT TOP 1 koulutusala
    FROM OPENJSON(f3.koulutusalaTKs) WITH (koulutusala varchar(5) '$.koulutusala', jnro int '$.jNro')
    WHERE jnro=1
  ) end
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.koodi = --f3.koulutusalaTKs
  case when ISJSON(f3.koulutusalaTKs)=1
  then (
    SELECT TOP 1 koulutusala
    FROM OPENJSON(f3.koulutusalaTKs) WITH (koulutusala varchar(5) '$.koulutusala', jnro int '$.jNro')
    WHERE jnro=1
  ) end
LEFT JOIN dw.d_kytkin d12 on d12.kytkin_koodi = nullif(yhteisjulkaisuSHPKytkin,'')
LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = nullif(yhteisjulkaisuTutkimuslaitosKytkin,'')
LEFT JOIN dw.d_kytkin d14 on d14.kytkin_koodi = nullif(yhteisjulkaisuMuuKytkin,'')
LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = nullif(yhteisjulkaisuYritysKytkin,'')
LEFT JOIN dw.d_kytkin d16 on d16.kytkin_koodi = nullif(rinnakkaistallennusKytkin,'')
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.avoinsaatavuus_koodi = f3.avoinSaatavuusKoodi   -- this join added 2020-08-18

WHERE f3.julkaisuVuosi<2016 or d1.virtajtpsektori_koodi in ('3','4')






GO


