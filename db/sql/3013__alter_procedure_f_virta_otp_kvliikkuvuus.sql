USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_kvliikkuvuus]    Script Date: 23.4.2020 11:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* muutosloki:
	28.2.2019 AP: Lisätty selecteihin cimolyhytlahteva, cimolyhytsaapuva, cimopitkalahteva, cimopitkasaapuva rajaus että otetaan vain uusin tilannepvm
*/

ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_kvliikkuvuus] AS

TRUNCATE TABLE dw.f_virta_otp_kvliikkuvuus

INSERT INTO dw.f_virta_otp_kvliikkuvuus (
  d_organisaatio_id,
  d_ohjauksenala_id,
  d_koulutusluokitus_id,
  d_koulutusala_2002_id,
  d_koulutusala_1995_id,
  d_sukupuoli_id,
  d_ika_id,
  d_liikkuvuudentyyppi_id,
  d_lahtomaa_id, --maatjavaltiot2
  d_kohdemaa_id, --maatjavaltiot2
  d_kansalaisuus_id, --maatjavaltiot2
  d_liikkuvuusohjelma_id,
  d_liikkuvuudensuunta_id,
  d_liikkuvuudenkesto_id,
  cimo_opintoaste,
  opiskelijaavain,
  opiskeluoikeusavain,
  liikkuvuusjaksoavain,
  jaksoAlkupvm,
  jaksoLoppupvm,
  kesto,
  tilannepvm,
  tilastovuosi,
  opintojen_aloitusvuosi,
  lukumaara,

  source
)

SELECT
  coalesce(d2.id,-1) AS d_organisaatioluokitus_id,
  coalesce(d3.id,-1) AS d_ohjauksenala_id,
  coalesce(case when opintoaste = 1 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi = '699999')
		       when opintoaste = 2 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='799999')
			   when opintoaste = 3 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi = '899999')
			   when koultyp = 1 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='691999')
			   when koultyp = 3 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999)  then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='791999')
		  else NULL end,d4.id, -1) AS d_koulutusluokitus_id,
  '-1' as d_koulutusala_2002_id,
  '-1' as d_koulutusala_1995_id,
  coalesce(d5.id,-1) AS d_sukupuoli_id,
  coalesce(d12.id,-1) AS d_ika_id,
  coalesce(d6.id,-1) AS d_liikkuvuudentyyppi_id,
  coalesce(d7.id,-1) AS d_lahtomaa_id,
  coalesce(d8.id,-1) AS d_kohdemaa_id,
  coalesce(d9.id,-1) AS d_kansalaisuus_id,
  coalesce(d10.id,-1) AS d_liikkuvuusohjelma_id,
  coalesce(d11.id,-1) AS d_liikkuvuudensuunta_id,
  coalesce((select id from antero.dw.d_liikkuvuudenkesto where liikkuvuudenkesto_koodi = '1'),'-1') as d_liikkuvuudenkesto_id, -- taulussa valmiiksi vain lyhyet, laskutapa: kesto >5 and <87

  f.opintoaste as cimo_opintoaste,
  f.opiskelijaavain,
  f.opiskeluoikeusavain,
  f.liikkuvuusjaksoavain,

  cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  as jaksoAlkupvm,

  case when jaksoLoppupvm/1000<POWER(cast(2 as bigint),31) then
  cast(dateadd(ss,cast(jaksoLoppupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  end as jaksoLoppupvm,

  case when isnumeric(f.kesto)=1 then cast(f.kesto as int) end as kesto,

  cast(dateadd(second,cast(f.luontipaivamaara/1000 as int),'1970-1-1') as date) as tilannepvm,
  YEAR(cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date)) as tilastovuosi,
  xxaloitusvuosi,
  cast(1 as int) AS lukumaara,

  f.source
FROM sa.sa_virta_otp_cimolyhytlahteva as f
LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.organisaatio_avain like 'oppilaitos_%' and d2.organisaatio_koodi = f.oppilaitos
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
LEFT JOIN dw.d_ika d12 on d12.ika_avain = f.xika
WHERE CAST(f.loadtime AS date) = (SELECT MAX(CAST(loadtime AS date)) FROM sa.sa_virta_otp_cimolyhytlahteva)

UNION ALL

SELECT
  coalesce(d2.id,-1) AS d_organisaatioluokitus_id,
  coalesce(d3.id,-1) AS d_ohjauksenala_id,
  coalesce(case when opintoaste = 1 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi = '699999')
		       when opintoaste = 2 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='799999')
			   when opintoaste = 3 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi = '899999')
			   when koultyp = 1 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='691999')
			   when koultyp = 3 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999)  then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='791999')
		  else NULL end,d4.id,-1) AS d_koulutusluokitus_id,
  '-1' as d_koulutusala_2002_id,
  '-1' as d_koulutusala_1995_id,
  coalesce(d5.id,-1) AS d_sukupuoli_id,
  coalesce(d12.id,-1) AS d_ika_id,
  coalesce(d6.id,-1) AS d_liikkuvuudentyyppi_id,
  coalesce(d7.id,-1) AS d_lahtomaa_id,
  coalesce(d8.id,-1) AS d_kohdemaa_id,
  coalesce(d9.id,-1) AS d_kansalaisuus_id,
  coalesce(d10.id,-1) AS d_liikkuvuusohjelma_id,
  coalesce(d11.id,-1) AS d_liikkuvuudensuunta_id,
  coalesce((select id from antero.dw.d_liikkuvuudenkesto where liikkuvuudenkesto_koodi = '1'),'-1') as d_liikkuvuudenkesto_id, -- taulussa valmiiksi vain lyhyet, laskutapa: kesto >5 and <87

  f.opintoaste as cimo_opintoaste,
  f.opiskelijaavain,
  f.opiskeluoikeusavain,
  f.liikkuvuusjaksoavain,

  cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  as jaksoAlkupvm,

  case when jaksoLoppupvm/1000<POWER(cast(2 as bigint),31) then
  cast(dateadd(ss,cast(jaksoLoppupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  end as jaksoLoppupvm,

  case when isnumeric(f.kesto)=1 then cast(f.kesto as int) end as kesto,

  cast(dateadd(second,cast(f.luontipaivamaara/1000 as int),'1970-1-1') as date) as tilannepvm,
  YEAR(cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date)) as tilastopvm,
  xxaloitusvuosi,
  cast(1 as int) AS lukumaara,

  f.source
FROM sa.sa_virta_otp_cimolyhytsaapuva as f
LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.organisaatio_avain like 'oppilaitos_%' and d2.organisaatio_koodi = f.oppilaitos
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
LEFT JOIN dw.d_ika d12 on d12.ika_avain = f.xika
WHERE CAST(f.loadtime AS date) = (SELECT MAX(CAST(loadtime AS date)) FROM sa.sa_virta_otp_cimolyhytsaapuva)

UNION ALL

SELECT
  coalesce(d2.id,-1) AS d_organisaatioluokitus_id,
  coalesce(d3.id,-1) AS d_ohjauksenala_id,
  coalesce(case when opintoaste = 1 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi = '699999')
		       when opintoaste = 2 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='799999')
			   when opintoaste = 3 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi = '899999')
			   when koultyp = 1 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='691999')
			   when koultyp = 3 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999)  then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='791999')
		  else NULL end,d4.id,-1) AS d_koulutusluokitus_id,
  '-1' as d_koulutusala_2002_id,
  '-1' as d_koulutusala_1995_id,
  coalesce(d5.id,-1) AS d_sukupuoli_id,
  coalesce(d12.id,-1) AS d_ika_id,
  coalesce(d6.id,-1) AS d_liikkuvuudentyyppi_id,
  coalesce(d7.id,-1) AS d_lahtomaa_id,
  coalesce(d8.id,-1) AS d_kohdemaa_id,
  coalesce(d9.id,-1) AS d_kansalaisuus_id,
  coalesce(d10.id,-1) AS d_liikkuvuusohjelma_id,
  coalesce(d11.id,-1) AS d_liikkuvuudensuunta_id,
  coalesce((select id from antero.dw.d_liikkuvuudenkesto where liikkuvuudenkesto_koodi = '2'),'-1') as d_liikkuvuudenkesto_id, -- taulussa valmiiksi vain pitkät, laskutapa: kesto >=87


  f.opintoaste as cimo_opintoaste,
  f.opiskelijaavain,
  f.opiskeluoikeusavain,
  f.liikkuvuusjaksoavain,

  cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  as jaksoAlkupvm,

  case when jaksoLoppupvm/1000<POWER(cast(2 as bigint),31) then
  cast(dateadd(ss,cast(jaksoLoppupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  end as jaksoLoppupvm,

  case when isnumeric(f.kesto)=1 then cast(f.kesto as int) end as kesto,

  cast(dateadd(second,cast(f.luontipaivamaara/1000 as int),'1970-1-1') as date) as tilannepvm,
  year(cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date)) as tilastovuosi,
  xxaloitusvuosi,
  cast(1 as int) AS lukumaara,

  f.source
FROM sa.sa_virta_otp_cimopitkalahteva as f
LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.organisaatio_avain like 'oppilaitos_%' and d2.organisaatio_koodi = f.oppilaitos
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
LEFT JOIN dw.d_ika d12 on d12.ika_avain = f.xika
WHERE CAST(f.loadtime AS date) = (SELECT MAX(CAST(loadtime AS date)) FROM sa.sa_virta_otp_cimopitkalahteva)

UNION ALL

SELECT
  coalesce(d2.id,-1) AS d_organisaatioluokitus_id,
  coalesce(d3.id,-1) AS d_ohjauksenala_id,
  coalesce(case when opintoaste = 1 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi = '699999')
		       when opintoaste = 2 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='799999')
			   when opintoaste = 3 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi = '899999')
			   when koultyp = 1 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999) then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='691999')
			   when koultyp = 3 and (f.Koulutuskoodi IS NULL or f.koulutuskoodi = 999999)  then (select id from dw.d_koulutusluokitus where koulutusluokitus_koodi ='791999')
		  else NULL end,d4.id, -1) AS d_koulutusluokitus_id,
  '-1' as d_koulutusala_2002_id,
  '-1' as d_koulutusala_1995_id,
  coalesce(d5.id,-1) AS d_sukupuoli_id,
  coalesce(d12.id,-1) AS d_ika_id,
  coalesce(d6.id,-1) AS d_liikkuvuudentyyppi_id,
  coalesce(d7.id,-1) AS d_lahtomaa_id,
  coalesce(d8.id,-1) AS d_kohdemaa_id,
  coalesce(d9.id,-1) AS d_kansalaisuus_id,
  coalesce(d10.id,-1) AS d_liikkuvuusohjelma_id,
  coalesce(d11.id,-1) AS d_liikkuvuudensuunta_id,
  coalesce((select id from antero.dw.d_liikkuvuudenkesto where liikkuvuudenkesto_koodi = '2'),'-1') as d_liikkuvuudenkesto_id, -- taulussa valmiiksi vain pitkät, laskutapa: kesto >=87


  f.opintoaste as cimo_opintoaste,
  f.opiskelijaavain,
  f.opiskeluoikeusavain,
  f.liikkuvuusjaksoavain,

  cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  as jaksoAlkupvm,

  case when jaksoLoppupvm/1000<POWER(cast(2 as bigint),31) then
  cast(dateadd(ss,cast(jaksoLoppupvm/1000 as int)+(2*3600),'19700101') as date) -- epoch (=kutsuaika per 1000) + 2h (gmt => suomen talvi)
  end as jaksoLoppupvm,

  case when isnumeric(f.kesto)=1 then cast(f.kesto as int) end as kesto,

  cast(dateadd(second,cast(f.luontipaivamaara/1000 as int),'1970-1-1') as date) as tilannepvm,
  YEAR(cast(dateadd(ss,cast(jaksoAlkupvm/1000 as int)+(2*3600),'19700101') as date)) as tilastovuosi,
  xxaloitusvuosi,
  cast(1 as int) AS lukumaara,

  f.source
FROM sa.sa_virta_otp_cimopitkasaapuva as f
LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.organisaatio_avain like 'oppilaitos_%' and d2.organisaatio_koodi = f.oppilaitos
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
LEFT JOIN dw.d_ika d12 on d12.ika_avain = f.xika
WHERE CAST(f.loadtime AS date) = (SELECT MAX(CAST(loadtime AS date)) FROM sa.sa_virta_otp_cimopitkasaapuva)

UNION ALL

select

           case when  AMK like 'Arcada%' then (select id from [ANTERO].[dw].[d_organisaatioluokitus] where organisaatio_koodi = '02535')
		         when amk like '%Pohjois-Karjalan ammattikorkea%' then (select id from [ANTERO].[dw].[d_organisaatioluokitus] where organisaatio_koodi = '02469')
				 when amk like '%Keski-Pohjanmaan ammattikorkea%' then (select id from [ANTERO].[dw].[d_organisaatioluokitus] where organisaatio_koodi ='02536')
				 when amk like '%Oulun seudun ammattikorkea%' then (select id from [ANTERO].[dw].[d_organisaatioluokitus] where organisaatio_koodi = '02471')
				 when amk like '%centria%' then (select id from [ANTERO].[dw].[d_organisaatioluokitus] where organisaatio_koodi = '02536')
				 when amk like 'tampereen ammattikorkeakoulu' then (select id from [ANTERO].[dw].[d_organisaatioluokitus] where organisaatio_koodi = '02630')
		         when  not exists (select id from [ANTERO].[dw].[d_organisaatioluokitus] where amk = organisaatio_vanha_fi and oppilaitostyyppi_koodi = '41') then '-1'
		         else (select id from [ANTERO].[dw].[d_organisaatioluokitus] where amk = organisaatio_vanha_fi and oppilaitostyyppi_koodi = '41')
		   end as d_organisaatio_id
           ,'-1' as d_ohjauksenala_id
		   ,case when koulutustyyppi = 'Nuorten koulutus' or koulutustyyppi = 'Aikuisten koulutus' then (select id from antero.dw.d_koulutusluokitus where koulutusluokitus_koodi = '691999')
				 when koulutustyyppi = 'Ylempi ammattikorkeakoulututkinto' then (select id from antero.dw.d_koulutusluokitus where koulutusluokitus_koodi = '791999')
				 when koulutustyyppi = 'Tuntematon' then -1
				 else '-1'
		   end as d_koulutusluokitus_id
           ,coalesce ((select id from antero.[dw].d_koulutusala_2002 where koulutusala_02 = selite_fi), -1) as d_koulutusala_2002_id --
           ,'-1' as d_koulutusala_1995_id
		   ,'-1' as d_sukupuoli_id
		   ,'-1' as d_ika_id
           ,case  when up.monip like '%harj%' then (select id from antero.dw.d_liikkuvuudentyyppi where liikkuvuudentyyppi_koodi =  '2')
		          when up.monip like '%opisk%' then (select id from antero.dw.d_liikkuvuudentyyppi where liikkuvuudentyyppi_koodi =  '1')
			      else '-1'
				  end as d_liikkuvuudentyyppi_id
           ,case when up.monip in ('Laht_lyhyt_opisk_lkm', 'Laht_pitka_harj_lkm', 'Laht_pitka_opisk_lkm') then '-1'
                 else (select id from antero.dw.d_maatjavaltiot2 where maatjavaltiot2_fi = 'suomi')
				 end as d_lahtomaa_id -- suomi,<d_lahtomaa_id, int,>
           ,coalesce ((select id from antero.dw.d_maatjavaltiot2 where maatjavaltiot2_fi = Kohdemaa),'-1') as d_kohdemaa_id--,<d_kohdemaa_id, int,>
           ,'-1' as d_kansalaisuus_id
           ,'-1' as d_liikkuvuusohjelma_id
		   ,case when up.monip in ('Laht_lyhyt_opisk_lkm', 'Laht_pitka_harj_lkm', 'Laht_pitka_opisk_lkm') then (select id from antero.dw.d_liikkuvuudensuunta where liikkuvuudensuunta_koodi = 1)
		         when up.monip in ('Saap_lyhyt_opisk_lkm', 'Saap_pitka_harj_lkm', 'Saap_pitka_opisk_lkm') then (select id from antero.dw.d_liikkuvuudensuunta where liikkuvuudensuunta_koodi = 2)
				 else '-1'
				 end  as d_liikkuvuudensuunta_id
		   ,case when up.monip in ('Laht_lyhyt_opisk_lkm', 'Saap_lyhyt_opisk_lkm') then (select id from antero.dw.d_liikkuvuudenkesto where liikkuvuudenkesto_koodi = 1)
		         when up.monip in ('Laht_pitka_harj_lkm', 'Laht_pitka_opisk_lkm','Saap_pitka_harj_lkm', 'Saap_pitka_opisk_lkm') then (select id from antero.dw.d_liikkuvuudenkesto where liikkuvuudenkesto_koodi = 2)
				 else '-1'
				 end as d_liikkuvuudenkesto_id
		   ,'-1' as cimo_opintoaste
           ,'-1' as opiskelijaavain
           ,'-1' as opiskeluoikeusavain
           ,'-1' as liikkuvuusjaksoavain
           ,NULL as jaksoAlkupvm -- ???
           ,NULL as jaksoLoppupvm -- ???
           ,NULL as kesto --,<kesto, int,>

           ,NULL as tilannepvm -- ???
		   ,Tilastovuosi as tilastovuosi
		   ,NULL as opintojen_aloitusvuosi
		   ,up.lkm as lukumaara--,<lukumaara, int,>
		   ,'sa_cimo_hist_kvliikkuvuus_AMK_10_15' as [source]
from sa.sa_cimo_hist_kvliikkuvuus_AMK_10_15 hist
--left join ANTERO.dw.d_organisaatioluokitus d1 on hist.amk = d1.organisaatio_fi

unpivot (
lkm for
monip in (Laht_lyhyt_opisk_lkm, Laht_pitka_harj_lkm,Laht_pitka_opisk_lkm,Saap_lyhyt_opisk_lkm, Saap_pitka_harj_lkm,Saap_pitka_opisk_lkm) ) as up
where up.lkm <> 0

Union all

select

		case when Yliopisto like 'Aalto yli%' then (select id from antero.dw.d_organisaatioluokitus where organisaatio_koodi = '10076')
		  when yliopisto like 'Tampereen yli%' then (select id from antero.dw.d_organisaatioluokitus where organisaatio_koodi = '01905')
		  when yliopisto like 'Taideyliopisto' then (select id from antero.dw.d_organisaatioluokitus where organisaatio_koodi = '10103')
		  when yliopisto like 'Lappeenran%' then (select id from antero.dw.d_organisaatioluokitus where organisaatio_koodi = '01914')
		  when  not exists  (select id from [ANTERO].[dw].[d_organisaatioluokitus] where yliopisto = organisaatio_vanha_fi and oppilaitostyyppi_koodi = '42') then '-1'
		  else	(select id from [ANTERO].[dw].[d_organisaatioluokitus] where yliopisto = organisaatio_vanha_fi and oppilaitostyyppi_koodi = '42')
		end as d_organisaatio_id --case when?
		,'-1' as d_ohjauksenala_id
		,case when Koulutusaste = 'Alempi korkeakoulututkinto' then (select id from antero.dw.d_koulutusluokitus where koulutusluokitus_koodi = '699999')
		         when Koulutusaste = 'Ylempi korkeakoulututkinto' then (select id from antero.dw.d_koulutusluokitus where koulutusluokitus_koodi = '799999')
				 when Koulutusaste = 'Jatkotutkintokoulutus' or koulutusaste like 'lisensiaatintutkinto%' then (select id from antero.dw.d_koulutusluokitus where koulutusluokitus_koodi = '899999') --Koodinumero tähän
				 when koulutusaste like 'Tuntematon%' then '-1'
		         else '-1'
		end as d_koulutusluokitus_id
		,'-1' as d_koulutusala_2002_id
		,coalesce((select top 1 id from antero.dw.d_koulutusala_1995 where f.koulutusala_95 = selite_fi),'-1') as d_koulutusala_1995_id
		,coalesce (d3.id, '-1') as d_sukupuoli_id
		,'-1' as d_ika_id
		,case when Liikkuvuuden_tyyppi = 'Kansainvälinen harjoittelu' then (select id from antero.dw.d_liikkuvuudentyyppi where liikkuvuudentyyppi_koodi =  '2')
		      when Liikkuvuuden_tyyppi = 'Opiskelijavaihto' then (select id from antero.dw.d_liikkuvuudentyyppi where liikkuvuudentyyppi_koodi =  '1')
			  else '-1'
			  end as d_liikkuvuudentyyppi_id
		,case when Suunta = 'Suomesta' then '-1'
		      else (select id from antero.dw.d_maatjavaltiot2 where maatjavaltiot2_fi = 'suomi')
			  end as d_lahtomaa_id
		,coalesce(d4.id,'-1') as d_kohdemaa_id
		,'-1' as d_kansalaisuus_id
		,case when Liikkuvuusohjelma = 'ASLA/Fulbright' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '104')
		      when Liikkuvuusohjelma = 'CIMO:n ohjelmat ja stipendit%' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '105' )
			  when Liikkuvuusohjelma = 'CIMOn harjoittelijavaihto-ohjelmat' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '105' )
			  when Liikkuvuusohjelma = 'Erasmus' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '101' )
			  when Liikkuvuusohjelma = 'Free mover –opiskelu tai harjoittelu' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '107' )
			  when Liikkuvuusohjelma = 'IAESTE' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '104' )
			  when Liikkuvuusohjelma = 'ISEP' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '104' )
			  when Liikkuvuusohjelma = 'Korkeakoulun oma%' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '106' )
			  when Liikkuvuusohjelma = 'Leonardo da Vinci' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '101' )
			  when Liikkuvuusohjelma = 'Muu harjoittelijavaihto-ohjelma' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '108' )
			  when Liikkuvuusohjelma = 'Muu opiskelijavaihto-ohjelma' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '108' )
			  when Liikkuvuusohjelma = 'Muut EU-ohjelmat%' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '101' )
			  when Liikkuvuusohjelma = 'Nordplus' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '103' )
			  when Liikkuvuusohjelma = 'Opiskelija- ja kansalaisjärjestöjen%' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '108' )
			  when Liikkuvuusohjelma = 'Pohjoismaiden Ministerineuvoston apurahaohjelma%' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '103' )
			  when Liikkuvuusohjelma = 'Tempus' then (select id from dw.d_liikkuvuusohjelma where liikkuvuusohjelma_koodi = '101' )
			  when Liikkuvuusohjelma = 'Tuntematon' then '-1'
			  else '-1'
		end as d_liikkuvuusohjelma_id -- vanhat koodit käännetty uusiin
		,case when Suunta = 'Suomeen' then (select id from antero.dw.d_liikkuvuudensuunta where liikkuvuudensuunta_koodi = '2')
		      when Suunta = 'Suomesta' then (select id from antero.dw.d_liikkuvuudensuunta where liikkuvuudensuunta_koodi = '1')
			  else '-1'
		end as d_liikkuvuudensuunta_id
		,case when kesto_kk = 'lyhyt' then (select id from antero.dw.d_liikkuvuudenkesto where liikkuvuudenkesto_koodi = '1')
		      when try_parse(kesto_kk as int) * 30 <87 then (select id from antero.dw.d_liikkuvuudenkesto where liikkuvuudenkesto_koodi = '1')
		      when try_parse(kesto_kk as int) * 30 >=87 then (select id from antero.dw.d_liikkuvuudenkesto where liikkuvuudenkesto_koodi = '2')
			  else '-1'
		      end as d_liikkuvuudenkesto_id
		,'-1' as cimo_opintoaste
		,'-1' as opiskelijaavain
		,'-1' as opiskeluoikeusavain
		,'-1' as liikkuuvuusjaksoavain
		,NULL as jaksoAlkupvm --- ??
		,NULL as jaksoLoppupvm --- ??
		,case when kesto_kk = 'lyhyt' then NULL
		else kesto_kk * 30
		end as kesto

		,NULL as tilannepvm --- ??
		,Tilastovuosi as tilastovuosi
		,NULL as opintojen_aloitusvuosi

		,lkm as lukumaara


		,'sa_cimo_hist_kvliikkuvuus_YO_04_15' as [source]

from antero.sa.sa_cimo_hist_kvliikkuvuus_yo_04_15 f
--left join antero.dw.d_koulutusala_1995 d2 on f.Koulutusala_95 = d2.selite_fi
left join antero.dw.d_sukupuoli d3 on f.Sukupuoli = d3.sukupuoli_fi
left join antero.dw.d_maatjavaltiot2 d4 on f.Maa = d4.maatjavaltiot2_fi



