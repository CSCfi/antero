USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_jtp_tieteenalat]    Script Date: 25.7.2025 11.38.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dw].[p_lataa_f_virta_jtp_tieteenalat] AS

IF OBJECT_ID('tempdb.dbo.#tempTieteenala', 'U') IS NOT NULL
  DROP TABLE #tempTieteenala; 

IF OBJECT_ID('tempdb.dbo.#tempTieteenala2', 'U') IS NOT NULL
  DROP TABLE #tempTieteenala2; 

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

SELECT DISTINCT
	julkaisunTunnus, 
	d.id as d_tieteenala_id
INTO #tempTieteenala2
FROM   
   (select 
		julkaisunTunnus, 
		JSON_VALUE(tieteenalat,'$.tieteenalat[0].tieteenala') AS tieteenala1,
		JSON_VALUE(tieteenalat,'$.tieteenalat[1].tieteenala') AS tieteenala2,
		JSON_VALUE(tieteenalat,'$.tieteenalat[2].tieteenala') AS tieteenala3,
		JSON_VALUE(tieteenalat,'$.tieteenalat[3].tieteenala') AS tieteenala4,
		JSON_VALUE(tieteenalat,'$.tieteenalat[4].tieteenala') AS tieteenala5,
		JSON_VALUE(tieteenalat,'$.tieteenalat[5].tieteenala') AS tieteenala6
	from #tempTieteenala) p  
UNPIVOT  
   (koodi FOR tieteenala IN   
      (tieteenala1, tieteenala2, tieteenala3, tieteenala4, tieteenala5, tieteenala6)  
)AS unpvt
LEFT JOIN dw.d_tieteenala d on d.tieteenala_koodi = koodi
OPTION (MAXDOP 1)

DROP TABLE #tempTieteenala

TRUNCATE TABLE dw.f_virta_jtp_tieteenalat

INSERT INTO dw.f_virta_jtp_tieteenalat (
  tilastovuosi,
  julkaisunTunnus,
  d_organisaatio_id,
  d_virtajtpsektori_id,
  d_julkaisufoorumitaso_id,
  d_julkaisutyyppi_id,
  d_julkaisun_kansainvalisyys_id,
  d_tieteenala_1_id, 
  d_tieteenala_2_id,                             
  d_rinnakkaistallennusKytkin_id,
  d_avoinSaatavuus_id,
  d_julkaisufoorumitaso_vanha_id,
  d_julkaisufoorumitaso_uusi_id,
  jufoid,
  source
)

SELECT 
	tilastovuosi,
	julkaisunTunnus,
	d_organisaatio_id,
	d_virtajtpsektori_id,
	d_julkaisufoorumitaso_id,
	d_julkaisutyyppi_id,
	d_julkaisun_kansainvalisyys_id,
	d_tieteenala_1_id,
	d_tieteenala_2_id,
	d_rinnakkaistallennusKytkin_id,
	d_avoinSaatavuus_id, 
	d_julkaisufoorumitaso_vanha_id,
	d_julkaisufoorumitaso_uusi_id, 
	jufoid,
	'ETL: p_lataa_f_virta_jtp_tilasto' AS source
FROM (
	SELECT DISTINCT
	  f.julkaisuVuosi AS tilastovuosi,
	  f.julkaisunTunnus,
	  coalesce(d2_1.id,d2_2.id,d2_3.id,d2_4.id,-1) AS d_organisaatio_id,
	  coalesce(d1.id, -1) as d_virtajtpsektori_id,
	  coalesce(d3.id,-1) AS d_julkaisufoorumitaso_id,
	  coalesce(d4.id,-1) AS d_julkaisutyyppi_id,
	  coalesce(d5.id,-1) AS d_julkaisun_kansainvalisyys_id,
	  coalesce(d16.id,-1) AS d_rinnakkaistallennusKytkin_id,
	  coalesce(d17.id,-1) AS d_avoinSaatavuus_id,
	  coalesce(d18.id,-1) AS d_julkaisufoorumitaso_vanha_id,
	  coalesce(d19.id,-1) AS d_julkaisufoorumitaso_uusi_id,
	  f.JufoTunnus as jufoid,
	  coalesce(tt1.d_tieteenala_id, -1) as d_tieteenala_1_id,
	  coalesce(tt2.d_tieteenala_id, -1) as d_tieteenala_2_id
	FROM sa.sa_virta_jtp_tkjulkaisut f
	LEFT JOIN dw.d_virtajtpsektori d1 ON d1.virtajtpsektori_koodi = f.orgSektori
	LEFT JOIN dw.d_organisaatioluokitus d2_1 ON d2_1.organisaatio_avain like 'oppilaitosnumero_%' and d2_1.organisaatio_koodi = f.organisaatioTunnus
	LEFT JOIN dw.d_organisaatioluokitus d2_2 ON d2_2.organisaatio_avain like 'koulutustoimija_%' and d2_2.organisaatio_koodi = f.organisaatioTunnus
	LEFT JOIN dw.d_organisaatioluokitus d2_3 ON d2_3.organisaatio_avain like 'tutkimusorganisaatio_%' and d2_3.organisaatio_koodi = f.organisaatioTunnus
	LEFT JOIN dw.d_organisaatioluokitus d2_4 ON d2_4.organisaatio_avain like 'oppilaitos_%' and d2_4.organisaatio_koodi = f.organisaatioTunnus
	LEFT JOIN dw.d_julkaisufoorumitaso d3 ON d3.julkaisufoorumitaso_koodi = coalesce(f.jufoLuokkaKoodi,'-')
	LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi = f.julkaisutyyppiKoodi
	LEFT JOIN dw.d_julkaisufoorumitaso d18 ON d18.julkaisufoorumitaso_koodi = coalesce(f.jufoLuokkaVanha,'-')
	LEFT JOIN dw.d_julkaisufoorumitaso d19 ON d19.julkaisufoorumitaso_koodi = coalesce(f.jufoLuokkaUusi,'-') 
	LEFT JOIN dw.d_julkaisun_kansainvalisyys d5 ON d5.julkaisun_kansainvalisyys_koodi = f.julkaisunKansainvalisyysKytkin
	LEFT JOIN dw.d_kytkin d16 on d16.kytkin_koodi = nullif(rinnakkaistallenettuKytkin,'')
	LEFT JOIN dw.d_avoinsaatavuus d17 on d17.avoinsaatavuus_koodi = f.avoinSaatavuusKoodi
	LEFT JOIN #tempTieteenala2 tt1 on tt1.julkaisunTunnus = f.julkaisunTunnus
	LEFT JOIN #tempTieteenala2 tt2 on tt2.julkaisunTunnus = f.julkaisunTunnus
)f


GO

USE [ANTERO]