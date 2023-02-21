USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_opintopisteet]    Script Date: 21.2.2023 14:55:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amk_opintopisteet] AS


TRUNCATE TABLE dw.f_amk_opintopisteet;

INSERT INTO dw.f_amk_opintopisteet (
  d_amk_id,
  d_koulutusala_2002_id,
  d_ohjauksenala_id,
  d_amk_koulutustyyppi_id,
  d_tilannepvm_id, -- d_kalenteri
  vuosi,

  kaikki_tutk_lkm,
  tki_pisteet_lkm,
  tki_harj_pisteet_lkm,
  tki_muu_pisteet_lkm,
  vierkiel_pisteet_lkm,
  ulkom_hyv_op_lkm,
  ulkom_harj_op_lkm,

  avoinamk_op_lkm,
  avoinamk_op_amk_lkm,
  avoinamk_op_yliop_lkm,
  avoinamk_op_kesa_lkm,
  avoinamk_op_kansan_lkm,
  avoinamk_op_kansal_lkm,
  avoinamk_op_muut_lkm,
  kv_vaihtoopiskelijat_op_lkm,
  kk_yhteistyo_op_lkm,
  erilopintooik_op_lkm,
  mamu_op_lkm,
  erikoul_suor_op_lkm,
  muu_kuin_kk_yhteistyo_op_lkm,
  kv_suomi_vieraana_op_lkm,
  kv_ruotsi_vieraana_op_lkm,


  source
)
SELECT * FROM (

SELECT
 coalesce(d1.id,-1) as d_amk_id
,-1 as d_koulutusala_2002_id
,coalesce(d2.id,-1) as d_ohjauksenala_id
,coalesce(d3.id,-1) as d_amk_koulutustyyppi_id
,coalesce(d4.id,-1) as d_tilannepvm_id
,s.vuosi

,coalesce(s.perustutkinto,0) as kaikki_tutk_lkm

,coalesce(s.tkiToiminnanLaajuus,0) as tki_pisteet_lkm
,coalesce(s.tkiHarjoittelunLaajuus,0) as tki_harj_pisteet_lkm
,coalesce(s.tkiMuutLaajuus,0) as tki_muu_pisteet_lkm

,coalesce(s.vieraskielinen,0) as vierkiel_pisteet_lkm
,coalesce(s.hyvaksiluetut,0) as ulkom_hyv_op_lkm

,coalesce(s.ulkomaaHarjoittelu,0) as ulkom_harj_op_lkm

,coalesce(s.avoinKK,0) as avoinamk_op_lkm

,0 as avoinamk_op_amk_lkm
,0 as avoinamk_op_yliop_lkm
,0 as avoinamk_op_kesa_lkm
,0 as avoinamk_op_kansan_lkm
,0 as avoinamk_op_kansal_lkm
,0 as avoinamk_op_muut_lkm

,coalesce(s.kvVaihto,0) as kv_vaihtoopiskelijat_op_lkm
,coalesce(s.joo,0) as kk_yhteistyo_op_lkm
,coalesce(s.erillinenOO,0) as erilopintooik_op_lkm
,coalesce(s.mValKo,0) as mamu_op_lkm
,coalesce(s.erikoistumisopinnot,0) as erikoul_suor_op_lkm
,coalesce(s.muunkuinkorkeakoulun,0) as muu_kuin_kk_yhteistyo_op_lkm
,coalesce(s.kvsuomivieraana,0) as kv_suomi_vieraana_op_lkm
,coalesce(s.kvruotsivieraana,0) as kv_ruotsi_vieraana_op_lkm

,s.source

FROM sa.sa_virta_otp_amkopintopiste s
-- hack! koodisto as a map (from "db" (kk-tunnus) to oppilaitosnumero)
LEFT JOIN sa.sa_koodistot sk ON sk.koodi=s.db and sk.koodisto='virtakorkeakoulutunnus'
LEFT JOIN dw.d_amk d1 ON d1.amk_tunnus=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
LEFT JOIN dw.d_ohjauksenala d2 ON d2.ohjauksenala_koodi=s.koodi
LEFT JOIN dw.d_amk_koulutustyyppi d3 ON d3.koodi=s.koulutustyyppi
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=(select d from dbo.BigintToDate(s.luontipaivamaara))


WHERE s.koulutustyyppi<>'-1' --just so we don't get duplicates. -1's are picked up in a separate select
AND s.vuosi>=2016

UNION

-- NB! last get data from two tables so we rely on UNION to drop duplicates!
-- first from sa_virta_otp_amkavoimenopintopisteetjarj
--  then from sa_virta_otp_amkopintopiste (with koulutustyyppi='-1')
SELECT
 coalesce((
  select d.id
  -- hack! koodisto as a map (from "db" (kk-tunnus) to oppilaitosnumero)
  from sa.sa_koodistot sk
  LEFT JOIN dw.d_amk d ON d.amk_tunnus=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
  where sk.koodisto='virtakorkeakoulutunnus'
  and(sk.koodi=s.db)
),-1) as d_amk_id
,-1 as d_koulutusala_2002_id
,coalesce((
  select d.id
  from dw.d_ohjauksenala d
  where(d.ohjauksenala_koodi=s.koodi)
),-1) as d_ohjauksenala_id
,coalesce((
  select d.id
  from dw.d_amk_koulutustyyppi d
  where d.koodi='-1' -- fixed!
),-1) as d_amk_koulutustyyppi_id
,coalesce((select d.id
  from dw.d_kalenteri as d
  where(d.kalenteri_avain=(select d from dbo.BigintToDate(s.luontipaivamaara)))
),-1) as d_tilannepvm_id
,s.vuosi

,coalesce(a.perustutkinto,0) as kaikki_tutk_lkm
,coalesce(a.tkiToiminnanLaajuus,0) as tki_pisteet_lkm
,coalesce(a.tkiHarjoittelunLaajuus,0) as tki_harj_pisteet_lkm
,coalesce(a.tkiMuutLaajuus,0) as tki_muu_pisteet_lkm
,coalesce(a.vieraskielinen,0) as vierkiel_pisteet_lkm
,coalesce(a.hyvaksiluetut,0) as ulkom_hyv_op_lkm
,coalesce(a.ulkomaaHarjoittelu,0) as ulkom_harj_op_lkm

,coalesce(a.avoinKK,0) as avoinamk_op_lkm

,coalesce(s.opintopisteet,0) as avoinamk_op_amk_lkm
-- transponate measures (map values from multiple rows to one row)
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi='Yliopistot'
),0) as avoinamk_op_yliop_lkm
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi='Kesäyliopistot'
),0) as avoinamk_op_kesa_lkm
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi='Kansanopistot'
),0) as avoinamk_op_kansan_lkm
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi='Kansalaisopistot'
),0) as avoinamk_op_kansal_lkm
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi not in (
   'Ammattikorkeakoulut','Yliopistot','Kesäyliopistot','Kansaopistot','Kansalaisopistot'
  )
),0) as avoinamk_op_muut_lkm

,coalesce(a.kvVaihto,0) as kv_vaihtoopiskelijat_op_lkm
,coalesce(a.joo,0) as kk_yhteistyo_op_lkm
,coalesce(a.erillinenOO,0) as erilopintooik_op_lkm
,coalesce(a.mValKo,0) as mamu_op_lkm
,coalesce(a.erikoistumisopinnot,0) as erikoul_suor_op_lkm
,coalesce(a.muunkuinkorkeakoulun,0) as muu_kuin_kk_yhteistyo_op_lkm
,coalesce(a.kvsuomivieraana,0) as kv_suomi_vieraana_op_lkm
,coalesce(a.kvruotsivieraana,0) as kv_ruotsi_vieraana_op_lkm

,a.source

FROM
 sa.sa_virta_otp_amkavoimenopintopisteetjarj s
  JOIN  -- Korjaus 23.2.2017 FF LEFT pois
 sa.sa_virta_otp_amkopintopiste a
  ON a.db=s.db and a.koodi=s.koodi and a.vuosi=s.vuosi
  and cast(a.loadtime as date)=cast(s.loadtime as date) -- as we're getting and collecting data every day make sure the data is from same original set
  and a.koulutustyyppi='-1' --just so we don't get too many duplicates. this should be ok but not verified from anywhere!
  and a.avoinKK=s.opintopisteet --just another sanity check...

WHERE s.oppilaitostyyppi='Ammattikorkeakoulut'
AND s.vuosi>=2016

UNION --this will and should! drop duplicates

SELECT
 coalesce((
  select d.id
  -- hack! koodisto as a map (from "db" (kk-tunnus) to oppilaitosnumero)
  from sa.sa_koodistot sk
  LEFT JOIN dw.d_amk d ON d.amk_tunnus=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
  where sk.koodisto='virtakorkeakoulutunnus'
  and(sk.koodi=a.db)
),-1) as d_amk_id
,-1 as d_koulutusala_2002_id
,coalesce((
  select d.id
  from dw.d_ohjauksenala d
  where(d.ohjauksenala_koodi=a.koodi)
),-1) as d_ohjauksenala_id
,coalesce((
  select d.id
  from dw.d_amk_koulutustyyppi d
  where d.koodi='-1' -- fixed!
),-1) as d_amk_koulutustyyppi_id
,coalesce((select d.id
  from dw.d_kalenteri as d
  where(d.kalenteri_avain=(select d from dbo.BigintToDate(s.luontipaivamaara)))
),-1) as d_tilannepvm_id
,a.vuosi

,coalesce(a.perustutkinto,0) as kaikki_tutk_lkm
,coalesce(a.tkiToiminnanLaajuus,0) as tki_pisteet_lkm
,coalesce(a.tkiHarjoittelunLaajuus,0) as tki_harj_pisteet_lkm
,coalesce(a.tkiMuutLaajuus,0) as tki_muu_pisteet_lkm
,coalesce(a.vieraskielinen,0) as vierkiel_pisteet_lkm
,coalesce(a.hyvaksiluetut,0) as ulkom_hyv_op_lkm
,coalesce(a.ulkomaaHarjoittelu,0) as ulkom_harj_op_lkm

,coalesce(a.avoinKK,0) as avoinamk_op_lkm

,coalesce(s.opintopisteet,0) as avoinamk_op_amk_lkm
-- transponate measures (map values from multiple rows to one row)
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi='Yliopistot'
),0) as avoinamk_op_yliop_lkm
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi='Kesäyliopistot'
),0) as avoinamk_op_kesa_lkm
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi='Kansanopistot'
),0) as avoinamk_op_kansan_lkm
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi='Kansalaisopistot'
),0) as avoinamk_op_kansal_lkm
,coalesce((
  select sum(sb.opintopisteet) from sa.sa_virta_otp_amkavoimenopintopisteetjarj sb
  where sb.db=s.db and sb.koodi=s.koodi and sb.vuosi=s.vuosi
  -- as we're getting and collecting data every day make sure the data is from same original set
  and cast(sb.loadtime as date)=cast(s.loadtime as date)
  and sb.oppilaitostyyppi not in (
   'Ammattikorkeakoulut','Yliopistot','Kesäyliopistot','Kansaopistot','Kansalaisopistot'
  )
),0) as avoinamk_op_muut_lkm

,coalesce(a.kvVaihto,0) as kv_vaihtoopiskelijat_op_lkm
,coalesce(a.joo,0) as kk_yhteistyo_op_lkm
,coalesce(a.erillinenOO,0) as erilopintooik_op_lkm
,coalesce(a.mValKo,0) as mamu_op_lkm
,coalesce(a.erikoistumisopinnot,0) as erikoul_suor_op_lkm
,coalesce(a.muunkuinkorkeakoulun,0) as muu_kuin_kk_yhteistyo_op_lkm
,coalesce(a.kvsuomivieraana,0) as kv_suomi_vieraana_op_lkm
,coalesce(a.kvruotsivieraana,0) as kv_ruotsi_vieraana_op_lkm

,a.source

FROM
 sa.sa_virta_otp_amkopintopiste a
  JOIN -- Korjaus 23.2.2017 FF LEFT pois
 sa.sa_virta_otp_amkavoimenopintopisteetjarj s
  ON a.db=s.db and a.koodi=s.koodi and a.vuosi=s.vuosi
  and cast(a.loadtime as date)=cast(s.loadtime as date) -- as we're getting and collecting data every day make sure the data is from same original set
  and a.avoinKK=s.opintopisteet --just another sanity check...
  -- nb! is this limit risky? not too bad, i think
  and s.oppilaitostyyppi='Ammattikorkeakoulut'

WHERE a.koulutustyyppi='-1'
AND a.vuosi>=2016


UNION -- switch to ulkom.hyv.luet 2015

SELECT
 coalesce(d1.id,-1) as d_amk_id
,-1 as d_koulutusala_2002_id
,coalesce(d2.id,-1) as d_ohjauksenala_id
,coalesce(d3.id,-1) as d_amk_koulutustyyppi_id
,coalesce(d4.id,-1) as d_tilannepvm_id
,s.vuosi

,null as kaikki_tutk_lkm
,null as tki_pisteet_lkm
,null as tki_harj_pisteet_lkm
,null as tki_muu_pisteet_lkm
,null as vierkiel_pisteet_lkm
,coalesce(s.hyvaksiluetut,0) as ulkom_hyv_op_lkm
,null as ulkom_harj_op_lkm

,null as avoinamk_op_lkm

,null as avoinamk_op_amk_lkm
-- transponate measures (map values from multiple rows to one row)
,null as avoinamk_op_yliop_lkm
,null as avoinamk_op_kesa_lkm
,null as avoinamk_op_kansan_lkm
,null as avoinamk_op_kansal_lkm
,null as avoinamk_op_muut_lkm

,null as kv_vaihtoopiskelijat_op_lkm
,null as kk_yhteistyo_op_lkm
,null as erilopintooik_op_lkm
,null as mamu_op_lkm
,null as erikoul_suor_op_lkm
,null as muu_kuin_kk_yhteistyo_op_lkm
,null as kv_suomi_vieraana_op_lkm
,null as kv_ruotsi_vieraana_op_lkm

,s.source

FROM sa.sa_virta_otp_amkopintopiste s
-- hack! koodisto as a map (from "db" (kk-tunnus) to oppilaitosnumero)
LEFT JOIN sa.sa_koodistot sk ON sk.koodi=s.db and sk.koodisto='virtakorkeakoulutunnus'
LEFT JOIN dw.d_amk d1 ON d1.amk_tunnus=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
LEFT JOIN dw.d_ohjauksenala d2 ON d2.ohjauksenala_koodi=s.koodi
LEFT JOIN dw.d_amk_koulutustyyppi d3 ON d3.koodi=s.koulutustyyppi
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=(select d from dbo.BigintToDate(s.luontipaivamaara))

WHERE s.koulutustyyppi<>'-1' --just so we don't get duplicates. -1's are picked up in a separate select
AND s.vuosi=2015

UNION

SELECT
 coalesce((
  select d.id
  -- hack! koodisto as a map (from "db" (kk-tunnus) to oppilaitosnumero)
  from sa.sa_koodistot sk
  LEFT JOIN dw.d_amk d ON d.amk_tunnus=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
  where sk.koodisto='virtakorkeakoulutunnus'
  and(sk.koodi=a.db)
),-1) as d_amk_id
,-1 as d_koulutusala_2002_id
,coalesce((
  select d.id
  from dw.d_ohjauksenala d
  where(d.ohjauksenala_koodi=a.koodi)
),-1) as d_ohjauksenala_id
,coalesce((
  select d.id
  from dw.d_amk_koulutustyyppi d
  where d.koodi='-1' -- fixed!
),-1) as d_amk_koulutustyyppi_id
,coalesce((select d.id
  from dw.d_kalenteri as d
  where(d.kalenteri_avain=(select d from dbo.BigintToDate(a.luontipaivamaara)))
),-1) as d_tilannepvm_id
,a.vuosi

,null as kaikki_tutk_lkm
,null as tki_pisteet_lkm
,null as tki_harj_pisteet_lkm
,null as tki_muu_pisteet_lkm
,null as vierkiel_pisteet_lkm
,coalesce(a.hyvaksiluetut,0) as ulkom_hyv_op_lkm
,null as ulkom_harj_op_lkm

,null as avoinamk_op_lkm

,null as avoinamk_op_amk_lkm
-- transponate measures (map values from multiple rows to one row)
,null as avoinamk_op_yliop_lkm
,null as avoinamk_op_kesa_lkm
,null as avoinamk_op_kansan_lkm
,null as avoinamk_op_kansal_lkm
,null as avoinamk_op_muut_lkm

,null as kv_vaihtoopiskelijat_op_lkm
,null as kk_yhteistyo_op_lkm
,null as erilopintooik_op_lkm
,null as mamu_op_lkm
,null as erikoul_suor_op_lkm
,null as muu_kuin_kk_yhteistyo_op_lkm
,null as kv_suomi_vieraana_op_lkm
,null as kv_ruotsi_vieraana_op_lkm

,a.source

FROM
 sa.sa_virta_otp_amkopintopiste a

WHERE a.koulutustyyppi='-1'
AND a.vuosi=2015

UNION

SELECT
 coalesce(d1.id,-1) as d_amk_id
,coalesce(d2.id,-1) as d_koulutusala_2002_id
,-1 as d_ohjauksenala_id
,coalesce(d3.id,-1) as d_amk_koulutustyyppi_id
,coalesce(d4.id,-1) as d_tilannepvm_id
,s.vuosi

,coalesce(kaikki_tutk_lkm,0)

,coalesce(tki_pisteet_lkm,0)
,coalesce(tki_harj_pisteet_lkm,0)
,coalesce(tki_muu_pisteet_lkm,0)

,coalesce(vierkiel_pisteet_lkm,0)
,coalesce(ulkom_hyv_op_lkm,0)

,0 as ulkom_harj_op_lkm

--amk2b
,0
,0
,0
,0
,0
,0
,0

,0
,0
,0
,0
,0
,0
,0
,0

,'etl: sa_suorat_hist_amk2a_opintopisteet' as source
FROM sa.sa_suorat_hist_amk2a_opintopisteet s
LEFT JOIN dw.d_amk d1 ON d1.amk_tunnus=s.amk_tunnus
LEFT JOIN dw.d_koulutusala_2002 d2 ON d2.koodi=s.koulutusala_koodi
LEFT JOIN dw.d_amk_koulutustyyppi d3 ON d3.koodi=s.koulutustyyppi_koodi
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=cast(s.LATAUSAIKA as date)


UNION

SELECT
 coalesce(d1.id,-1) as d_amk_id
,coalesce(d2.id,-1) as d_koulutusala_2002_id
,-1 as d_ohjauksenala_id
,coalesce(d3.id,-1) as d_amk_koulutustyyppi_id
,coalesce(d4.id,-1) as d_tilannepvm_id
,sb.vuosi

,0

,0
,0
,0

,0
,0

,0 as ulkom_harj_op_lkm

--amk2b
,coalesce(sb.avoinamk_op_lkm,0)
,coalesce(sb.avoinamk_op_amk_lkm,0)
,coalesce(sb.avoinamk_op_yliop_lkm,0)
,coalesce(sb.avoinamk_op_kesa_lkm,0)
,coalesce(sb.avoinamk_op_kansan_lkm,0)
,coalesce(sb.avoinamk_op_kansal_lkm,0)
,coalesce(sb.avoinamk_op_muut_lkm,0)

,coalesce(sb.kv_vaihtoopiskelijat_op_lkm,0)
,coalesce(sb.kk_yhteistyo_op_lkm,0)
,coalesce(sb.erilopintooik_op_lkm,0)
,coalesce(sb.mamu_op_lkm,0)
,coalesce(sb.erikoul_suor_op_lkm,0)
,0
,0
,0

,'etl: sa_suorat_hist_amk2b_opintopisteet' as source
FROM sa.sa_suorat_hist_amk2b_opintopisteet sb
LEFT JOIN dw.d_amk d1 ON d1.amk_tunnus=sb.korkeakoulu_tunnus
LEFT JOIN dw.d_koulutusala_2002 d2 ON d2.koodi=sb.koulutusala_koodi
LEFT JOIN dw.d_amk_koulutustyyppi d3 ON d3.koodi='-1' --fixed!
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=cast(sb.LATAUSAIKA as date)
) f
WHERE cast(concat(cast(f.vuosi as nvarchar), '-03-01') as date) <= DATEADD(year, -1, GETDATE())


GO

USE [ANTERO]