USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_jtp_tilasto]    Script Date: 25.7.2025 10.58.29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dw].[p_lataa_f_virta_jtp_tilasto] AS

--------------------------------------------------------------------------------------------
-- the following lines, containing tempFirst, tempTwo and tempRoolit tables, are added because of the Rooli field
-- TODO:there are some publications that have multiple authors with Rooli data. 
--     currently only first Rooli value is parsed. -> tune JSON parsing below
--------------------------------------------------------------------------------------------

IF OBJECT_ID('tempdb.dbo.#tempTieteenala', 'U') IS NOT NULL
  DROP TABLE #tempTieteenala; 

IF OBJECT_ID('tempdb.dbo.#tempTieteenala2', 'U') IS NOT NULL
  DROP TABLE #tempTieteenala2; 

IF OBJECT_ID('tempdb.dbo.#tempFirst', 'U') IS NOT NULL
  DROP TABLE #tempFirst; 

IF OBJECT_ID('tempdb.dbo.#tempTwo', 'U') IS NOT NULL
  DROP TABLE #tempTwo; 

IF OBJECT_ID('tempdb.dbo.#tempRoolit', 'U') IS NOT NULL
  DROP TABLE #tempRoolit; 

select *
into #tempTieteenala
from (
SELECT
    f.julkaisunTunnus,
	(
		select tieteenala, jNro
		FROM OPENJSON(f.tieteenalaTKs) WITH (tieteenala varchar(5) '$.tieteenala', jnro int '$.jNro')
		where tieteenala is not null
		for json path, root('tieteenalat')
	) as tieteenalat
	FROM sa.sa_virta_jtp_tkjulkaisut f
) as tt
OPTION (MAXDOP 1);

SELECT 
	julkaisunTunnus, 
	SUBSTRING(koodi, 0, CHARINDEX('_', koodi)) as tieteenala_koodi,
	ROW_NUMBER() OVER(PARTITION BY julkaisunTunnus ORDER BY CAST(RIGHT(koodi,1) as int), koodi ASC) as minNro
INTO #tempTieteenala2
FROM   
   (select 
		julkaisunTunnus, 
		CONCAT(JSON_VALUE(tieteenalat,'$.tieteenalat[0].tieteenala'), '_', JSON_VALUE(tieteenalat,'$.tieteenalat[0].jNro')) AS tieteenala1,
		CONCAT(JSON_VALUE(tieteenalat,'$.tieteenalat[1].tieteenala'), '_', JSON_VALUE(tieteenalat,'$.tieteenalat[1].jNro')) AS tieteenala2,
		CONCAT(JSON_VALUE(tieteenalat,'$.tieteenalat[2].tieteenala'), '_', JSON_VALUE(tieteenalat,'$.tieteenalat[2].jNro')) AS tieteenala3,
		CONCAT(JSON_VALUE(tieteenalat,'$.tieteenalat[3].tieteenala'), '_', JSON_VALUE(tieteenalat,'$.tieteenalat[3].jNro')) AS tieteenala4,
		CONCAT(JSON_VALUE(tieteenalat,'$.tieteenalat[4].tieteenala'), '_', JSON_VALUE(tieteenalat,'$.tieteenalat[4].jNro')) AS tieteenala5,
		CONCAT(JSON_VALUE(tieteenalat,'$.tieteenalat[5].tieteenala'), '_', JSON_VALUE(tieteenalat,'$.tieteenalat[5].jNro')) AS tieteenala6
	from #tempTieteenala) p  
UNPIVOT  
   (koodi FOR tieteenala IN   
      (tieteenala1, tieteenala2, tieteenala3, tieteenala4, tieteenala5, tieteenala6)  
)AS unpvt
WHERE LEFT(koodi,1) <> ('_')
OPTION (MAXDOP 1)

DROP TABLE #tempTieteenala

select *
into #tempFirst
from (
	SELECT
    f.julkaisunTunnus,
    (
	select rooli
    FROM OPENJSON(f.tekijaTKs) WITH (rooli varchar(5) '$.rooli')
    where rooli is not null
    for json path, root('roolit')
	) as roolit
	FROM sa.sa_virta_jtp_tkjulkaisut f
	where f.ilmoitusVuosi >= 2018
) as x
OPTION (MAXDOP 1);

select *
into #tempTwo
from (
	select 
    t.julkaisunTunnus, 
	JSON_VALUE(t.roolit,'$.roolit[0].rooli') AS rooli
	from #tempFirst as t
	where t.roolit is not null
) as y
OPTION (MAXDOP 1);

select *
into #tempRoolit
from (
    select tt.julkaisunTunnus,
	tt.rooli,
	jt.id
	from #tempTwo as tt
	inner join dw.d_julkaisun_tekijan_rooli as jt on tt.rooli = jt.rooli_koodi
) as z
OPTION (MAXDOP 1);

----------------------------------------------------------------------------
----------------------------------------------------------------------------



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
  d_rooli_id,
  tieteenala_lkm,
  paatieteenala_lkm,
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
  d_rooli_id,
  tieteenala_lkm,
  paatieteenala_lkm,
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
  f.JufoTunnus as jufoid,
  coalesce(d22.id,-1) AS d_rooli_id,
  tt2.tieteenala_lkm,
  tt2.paatieteenala_lkm
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
LEFT JOIN #tempTieteenala2 t on t.julkaisunTunnus = f.julkaisunTunnus and t.minNro = 1
LEFT JOIN dw.d_tieteenala d7 ON d7.tieteenala_koodi = t.tieteenala_koodi
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
LEFT JOIN dw.d_kytkin d16 on d16.kytkin_koodi = nullif(rinnakkaistallenettuKytkin,'')
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.avoinsaatavuus_koodi = f.avoinSaatavuusKoodi
OUTER APPLY (
	SELECT 
		t.julkaisunTunnus,
		COUNT(DISTINCT t.tieteenala_koodi) as tieteenala_lkm,
		COUNT(DISTINCT LEFT(t.tieteenala_koodi, 1)) as paatieteenala_lkm
	FROM #tempTieteenala2 t
	WHERE t.julkaisunTunnus = f.julkaisunTunnus
	GROUP BY t.julkaisunTunnus
) tt2 
left join #tempRoolit as d22 on d22.julkaisunTunnus = f.julkaisunTunnus    -- added 2020-08-30

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
  f3.julkaisunTunnus,
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
  coalesce(d15.id,-1) AS d_yhteisjulkaisuYritysKytkin_id,
  coalesce(d16.id,-1) AS d_rinnakkaistallennusKytkin_id,
  coalesce(d17.id,-1) AS d_avoinSaatavuus_id,   -- changed 2020-08-18. Old row: -1 AS d_avoinSaatavuus_id, 
  cast(1 as decimal(6,5)) AS lukumaara,
  coalesce(d18.id,-1) AS d_julkaisufoorumitaso_vanha_id, 
  coalesce(d19.id,-1) AS d_julkaisufoorumitaso_uusi_id,
  f3.JufoTunnus as jufoid, 
  -1 as d_rooli_id,
  tt2.tieteenala_lkm,
  tt2.paatieteenala_lkm,
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
LEFT JOIN #tempTieteenala2 t on t.julkaisunTunnus = f3.julkaisunTunnus and t.minNro = 1
LEFT JOIN dw.d_tieteenala d7 ON d7.tieteenala_koodi = t.tieteenala_koodi
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
LEFT JOIN dw.d_kytkin d16 on d16.kytkin_koodi = nullif(rinnakkaistallenettuKytkin,'')
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.avoinsaatavuus_koodi = f3.avoinSaatavuusKoodi   -- this join added 2020-08-18
OUTER APPLY (
	SELECT 
		t.julkaisunTunnus,
		COUNT(DISTINCT t.tieteenala_koodi) as tieteenala_lkm,
		COUNT(DISTINCT LEFT(t.tieteenala_koodi, 1)) as paatieteenala_lkm
	FROM #tempTieteenala2 t
	WHERE t.julkaisunTunnus = f3.julkaisunTunnus
	GROUP BY t.julkaisunTunnus
) tt2 

WHERE (f3.julkaisuVuosi<2016 or d1.virtajtpsektori_koodi in ('3','4')
-- this OR clause is for MPKK and PolAMK because they are in reports as higer education instituions but they don't have field of sciences
or d2_4.organisaatio_koodi in ('02358','02557'))

EXEC ANTERO.dw.p_lataa_f_virta_jtp_yhteisjulkaisut

EXEC ANTERO.dw.p_lataa_f_indikaattorit_kk_julkaisutiedot

GO

USE [ANTERO]