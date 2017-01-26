ALTER PROCEDURE dw.p_lataa_f_virta_otp_kvliikkuvuus AS

TRUNCATE TABLE dw.f_virta_otp_kvliikkuvuus

INSERT INTO dw.f_virta_otp_kvliikkuvuus (
  d_opiskeluoikeudentyyppi_id, --dimension sisältö? cimo tiedonkeruu opintoaste ja koultyp?
  d_organisaatio_id,
  d_ohjauksenala_id,
  d_koulutusluokitus_id,
  d_sukupuoli_id,
  d_liikkuvuudentyyppi_id,
  d_lahtomaa_id, --maatjavaltiot2
  d_kohdemaa_id, --maatjavaltiot2
  d_kansalaisuus_id, --maatjavaltiot2
  d_liikkuvuusohjelma_id,
  d_liikkuvuudensuunta_id,
  opiskelijaavain,
  opiskeluoikeusavain,
  liikkuvuusjaksoavain,
  jaksoAlkupvm,
  jaksoLoppupvm,
  kesto,
  
  lukumaara,
  
  source
)
SELECT
  coalesce(d1.id,-1) AS d_opiskeluoikeudentyyppi_id,
  coalesce(d2.id,-1) AS d_organisaatio_id,
  coalesce(d3.id,-1) AS d_ohjauksenala_id,
  coalesce(d4.id,-1) AS d_koulutusluokitus_id,
  coalesce(d5.id,-1) AS d_sukupuoli_id,
  coalesce(d6.id,-1) AS d_liikkuvuudentyyppi_id,
  coalesce(d7.id,-1) AS d_lahtomaa_id,
  coalesce(d8.id,-1) AS d_kohdemaa_id,
  coalesce(d9.id,-1) AS d_kansalaisuus_id,
  coalesce(d10.id,-1) AS d_liikkuvuusohjelma_id,
  coalesce(d11.id,-1) AS d_liikkuvuudensuunta_id,
  
  f.opiskelijaavain,
  f.opiskeluoikeusavain,
  f.liikkuvuusjaksoavain,
  
  cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  as jaksoAlkupvm,

  case when jaksoLoppupvm/1000<POWER(cast(2 as bigint),31) then
  cast(dateadd(ss,cast(jaksoLoppupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  end as jaksoLoppupvm,
  
  case when isnumeric(f.kesto) then cast(f.kesto as int) end as kesto,
  
  cast(1 as int) AS lukumaara,
  
  f.source
FROM sa.sa_virta_otp_cimolyhytlahteva as f
--TODO: LEFT JOIN dw.opiskeluoikeudentyyppi d1...
CROSS JOIN (select -1 as id) as d1
LEFT JOIN dw.d_organisaatio d2 ON d2.organisaatio_avain like 'oppilaitosnumero_%' and d2.organisaatio_koodi = f.oppilaitos
LEFT JOIN dw.d_ohjauksenala d3 ON d3.ohjauksenala_koodi=f.koulutusala
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_avain like 'koulutus_%' and d4.koulutusluokitus_koodi = f.koulutuskoodi
LEFT JOIN dw.d_sukupuoli d5 ON d5.sukupuoli_koodi=f.sp
LEFT JOIN dw.d_liikkuvuudentyyppi d6 ON d6.liikkuvuudentyyppi_koodi=f.tyyppi
--LEFT JOIN dw.d_maatjavaltiot2 d7 ON d7.maatjavaltiot2_koodi=f.lahtomaa
CROSS JOIN (select -1 as id) as d7
LEFT JOIN dw.d_maatjavaltiot2 d8 ON d8.maatjavaltiot2_koodi=f.kohdemaa
--CROSS JOIN (select -1 as id) as d8
--LEFT JOIN dw.d_maatjavaltiot2 d9 ON d9.maatjavaltiot2_koodi=f.kansalaisuus
CROSS JOIN (select -1 as id) as d9
--LEFT JOIN dw.d_liikkuvuusohjelma d10 ON d10.liikkuvuusohjelma_koodi=f.liikkuvuusohjelma
CROSS JOIN (select -1 as id) as d10
LEFT JOIN dw.d_liikkuvuudensuunta d11 ON d11.liikkuvuudensuunta_koodi='1' --lähtevä

UNION ALL

SELECT
  coalesce(d1.id,-1) AS d_opiskeluoikeudentyyppi_id,
  coalesce(d2.id,-1) AS d_organisaatio_id,
  coalesce(d3.id,-1) AS d_ohjauksenala_id,
  coalesce(d4.id,-1) AS d_koulutusluokitus_id,
  coalesce(d5.id,-1) AS d_sukupuoli_id,
  coalesce(d6.id,-1) AS d_liikkuvuudentyyppi_id,
  coalesce(d7.id,-1) AS d_lahtomaa_id,
  coalesce(d8.id,-1) AS d_kohdemaa_id,
  coalesce(d9.id,-1) AS d_kansalaisuus_id,
  coalesce(d10.id,-1) AS d_liikkuvuusohjelma_id,
  coalesce(d11.id,-1) AS d_liikkuvuudensuunta_id,

  f.opiskelijaavain,
  f.opiskeluoikeusavain,
  f.liikkuvuusjaksoavain,
  
  cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  as jaksoAlkupvm,

  case when jaksoLoppupvm/1000<POWER(cast(2 as bigint),31) then
  cast(dateadd(ss,cast(jaksoLoppupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  end as jaksoLoppupvm,
  
  case when isnumeric(f.kesto) then cast(f.kesto as int) end as kesto,
  
  cast(1 as int) AS lukumaara,
  
  f.source
FROM sa.sa_virta_otp_cimolyhytsaapuva as f
--TODO: LEFT JOIN dw.opiskeluoikeudentyyppi d1...
CROSS JOIN (select -1 as id) as d1
LEFT JOIN dw.d_organisaatio d2 ON d2.organisaatio_avain like 'oppilaitosnumero_%' and d2.organisaatio_koodi = f.oppilaitos
LEFT JOIN dw.d_ohjauksenala d3 ON d3.ohjauksenala_koodi=f.koulutusala
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_avain like 'koulutus_%' and d4.koulutusluokitus_koodi = f.koulutuskoodi
LEFT JOIN dw.d_sukupuoli d5 ON d5.sukupuoli_koodi=f.sp
LEFT JOIN dw.d_liikkuvuudentyyppi d6 ON d6.liikkuvuudentyyppi_koodi=f.tyyppi
LEFT JOIN dw.d_maatjavaltiot2 d7 ON d7.maatjavaltiot2_koodi=f.lahtomaa
--CROSS JOIN (select -1 as id) as d7
--LEFT JOIN dw.d_maatjavaltiot2 d8 ON d8.maatjavaltiot2_koodi=f.kohdemaa
CROSS JOIN (select -1 as id) as d8
--LEFT JOIN dw.d_maatjavaltiot2 d9 ON d9.maatjavaltiot2_koodi=f.kansalaisuus
CROSS JOIN (select -1 as id) as d9
--LEFT JOIN dw.d_liikkuvuusohjelma d10 ON d10.liikkuvuusohjelma_koodi=f.liikkuvuusohjelma
CROSS JOIN (select -1 as id) as d10
LEFT JOIN dw.d_liikkuvuudensuunta d11 ON d11.liikkuvuudensuunta_koodi='2' --saapuva


UNION ALL

SELECT
  coalesce(d1.id,-1) AS d_opiskeluoikeudentyyppi_id,
  coalesce(d2.id,-1) AS d_organisaatio_id,
  coalesce(d3.id,-1) AS d_ohjauksenala_id,
  coalesce(d4.id,-1) AS d_koulutusluokitus_id,
  coalesce(d5.id,-1) AS d_sukupuoli_id,
  coalesce(d6.id,-1) AS d_liikkuvuudentyyppi_id,
  coalesce(d7.id,-1) AS d_lahtomaa_id,
  coalesce(d8.id,-1) AS d_kohdemaa_id,
  coalesce(d9.id,-1) AS d_kansalaisuus_id,
  coalesce(d10.id,-1) AS d_liikkuvuusohjelma_id,
  coalesce(d11.id,-1) AS d_liikkuvuudensuunta_id,

  f.opiskelijaavain,
  f.opiskeluoikeusavain,
  f.liikkuvuusjaksoavain,
  
  cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  as jaksoAlkupvm,

  case when jaksoLoppupvm/1000<POWER(cast(2 as bigint),31) then
  cast(dateadd(ss,cast(jaksoLoppupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  end as jaksoLoppupvm,
  
  case when isnumeric(f.kesto) then cast(f.kesto as int) end as kesto,
  
  cast(1 as int) AS lukumaara,
  
  f.source
FROM sa.sa_virta_otp_cimopitkalahteva as f
--TODO: LEFT JOIN dw.opiskeluoikeudentyyppi d1...
CROSS JOIN (select -1 as id) as d1
LEFT JOIN dw.d_organisaatio d2 ON d2.organisaatio_avain like 'oppilaitosnumero_%' and d2.organisaatio_koodi = f.oppilaitos
LEFT JOIN dw.d_ohjauksenala d3 ON d3.ohjauksenala_koodi=f.koulutusala
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_avain like 'koulutus_%' and d4.koulutusluokitus_koodi = f.koulutuskoodi
LEFT JOIN dw.d_sukupuoli d5 ON d5.sukupuoli_koodi=f.sp
LEFT JOIN dw.d_liikkuvuudentyyppi d6 ON d6.liikkuvuudentyyppi_koodi=f.tyyppi
--LEFT JOIN dw.d_maatjavaltiot2 d7 ON d7.maatjavaltiot2_koodi=f.lahtomaa
CROSS JOIN (select -1 as id) as d7
LEFT JOIN dw.d_maatjavaltiot2 d8 ON d8.maatjavaltiot2_koodi=f.kohdemaa
--CROSS JOIN (select -1 as id) as d8
--LEFT JOIN dw.d_maatjavaltiot2 d9 ON d9.maatjavaltiot2_koodi=f.kansalaisuus
CROSS JOIN (select -1 as id) as d9
LEFT JOIN dw.d_liikkuvuusohjelma d10 ON d10.liikkuvuusohjelma_koodi=f.liikkuvuusohjelma
--CROSS JOIN (select -1 as id) as d10
LEFT JOIN dw.d_liikkuvuudensuunta d11 ON d11.liikkuvuudensuunta_koodi='1' --lähtevä


UNION ALL

SELECT
  coalesce(d1.id,-1) AS d_opiskeluoikeudentyyppi_id,
  coalesce(d2.id,-1) AS d_organisaatio_id,
  coalesce(d3.id,-1) AS d_ohjauksenala_id,
  coalesce(d4.id,-1) AS d_koulutusluokitus_id,
  coalesce(d5.id,-1) AS d_sukupuoli_id,
  coalesce(d6.id,-1) AS d_liikkuvuudentyyppi_id,
  coalesce(d7.id,-1) AS d_lahtomaa_id,
  coalesce(d8.id,-1) AS d_kohdemaa_id,
  coalesce(d9.id,-1) AS d_kansalaisuus_id,
  coalesce(d10.id,-1) AS d_liikkuvuusohjelma_id,
  coalesce(d11.id,-1) AS d_liikkuvuudensuunta_id,

  f.opiskelijaavain,
  f.opiskeluoikeusavain,
  f.liikkuvuusjaksoavain,
  
  cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  as jaksoAlkupvm,

  case when jaksoLoppupvm/1000<POWER(cast(2 as bigint),31) then
  cast(dateadd(ss,cast(jaksoLoppupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  end as jaksoLoppupvm,
  
  case when isnumeric(f.kesto) then cast(f.kesto as int) end as kesto,
  
  cast(1 as int) AS lukumaara,
  
  f.source
FROM sa.sa_virta_otp_cimopitkasaapuva as f
--TODO: LEFT JOIN dw.opiskeluoikeudentyyppi d1...
CROSS JOIN (select -1 as id) as d1
LEFT JOIN dw.d_organisaatio d2 ON d2.organisaatio_avain like 'oppilaitosnumero_%' and d2.organisaatio_koodi = f.oppilaitos
LEFT JOIN dw.d_ohjauksenala d3 ON d3.ohjauksenala_koodi=f.koulutusala
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_avain like 'koulutus_%' and d4.koulutusluokitus_koodi = f.koulutuskoodi
LEFT JOIN dw.d_sukupuoli d5 ON d5.sukupuoli_koodi=f.sp
LEFT JOIN dw.d_liikkuvuudentyyppi d6 ON d6.liikkuvuudentyyppi_koodi=f.tyyppi
LEFT JOIN dw.d_maatjavaltiot2 d7 ON d7.maatjavaltiot2_koodi=f.lahtomaa
--CROSS JOIN (select -1 as id) as d7
--LEFT JOIN dw.d_maatjavaltiot2 d8 ON d8.maatjavaltiot2_koodi=f.kohdemaa
CROSS JOIN (select -1 as id) as d8
LEFT JOIN dw.d_maatjavaltiot2 d9 ON d9.maatjavaltiot2_koodi=f.kansalaisuus
--CROSS JOIN (select -1 as id) as d9
LEFT JOIN dw.d_liikkuvuusohjelma d10 ON d10.liikkuvuusohjelma_koodi=f.liikkuvuusohjelma
--CROSS JOIN (select -1 as id) as d10
LEFT JOIN dw.d_liikkuvuudensuunta d11 ON d11.liikkuvuudensuunta_koodi='2' --saapuva
