ALTER PROCEDURE dw.p_lataa_f_amk_opintopisteet
AS
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

  source
)

SELECT
 coalesce(d1.id,-1) as d_amk_id
,coalesce(d2.id,-1) as d_koulutusala_2002_id
,-1 as d_ohjauksenala_id
,coalesce(d3.id,-1) as d_amk_koulutustyyppi_id
,coalesce(d4.id,-1) as d_tilannepvm_id
,s.vuosi

,kaikki_tutk_lkm

,tki_pisteet_lkm
,tki_harj_pisteet_lkm
,tki_muu_pisteet_lkm

,vierkiel_pisteet_lkm
,ulkom_hyv_op_lkm

,0 as ulkom_harj_op_lkm

--amk2b
,sb.avoinamk_op_lkm
,sb.avoinamk_op_amk_lkm
,sb.avoinamk_op_yliop_lkm
,sb.avoinamk_op_kesa_lkm
,sb.avoinamk_op_kansan_lkm
,sb.avoinamk_op_kansal_lkm
,sb.avoinamk_op_muut_lkm

,sb.kv_vaihtoopiskelijat_op_lkm
,sb.kk_yhteistyo_op_lkm
,sb.erilopintooik_op_lkm
,sb.mamu_op_lkm
,sb.erikoul_suor_op_lkm

,'etl: sa_suorat_hist_amk2*_opintopisteet' as source
FROM sa.sa_suorat_hist_amk2a_opintopisteet s
LEFT JOIN dw.d_amk d1 ON d1.amk_tunnus=s.amk_tunnus
LEFT JOIN dw.d_koulutusala_2002 d2 ON d2.koodi=s.koulutusala_koodi
LEFT JOIN dw.d_amk_koulutustyyppi d3 ON d3.koodi=s.koulutustyyppi_koodi
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=cast(s.LATAUSAIKA as date)

-- TODO: should this be full outer join?
LEFT JOIN sa.sa_suorat_hist_amk2b_opintopisteet sb ON sb.korkeakoulu_tunnus=s.amk_tunnus and sb.vuosi=s.vuosi and sb.koulutusala_koodi=s.koulutusala_koodi

UNION

SELECT
 coalesce(d1.id,-1) as d_amk_id
,-1 as d_koulutusala_2002_id
,coalesce(d2.id,-1) as d_ohjauksenala_id
,coalesce(d3.id,-1) as d_amk_koulutustyyppi_id
,coalesce(d4.id,-1) as d_tilannepvm_id
,s.vuosi

,s.perustutkinto as kaikki_tutk_lkm

,s.tkiToiminnanLaajuus as tki_pisteet_lkm
,s.tkiHarjoittelunLaajuus as tki_harj_pisteet_lkm
,s.tkiMuutLaajuus as tki_muu_pisteet_lkm

,s.vieraskielinen as vierkiel_pisteet_lkm
,s.hyvaksiluetut as ulkom_hyv_op_lkm

,s.ulkomaaHarjoittelu as ulkom_harj_op_lkm

,s.avoinKK as avoinamk_op_lkm

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

,s.source

FROM sa.sa_virta_otp_amkopintopiste s
-- hack! koodisto as a map (from "db" (kk-tunnus) to oppilaitosnumero)
LEFT JOIN sa.sa_koodistot sk ON sk.koodi=s.db and sk.koodisto='virtakorkeakoulutunnus'
LEFT JOIN dw.d_amk d1 ON d1.amk_tunnus=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
LEFT JOIN dw.d_ohjauksenala d2 ON d2.ohjauksenala_koodi=s.koodi
LEFT JOIN dw.d_amk_koulutustyyppi d3 ON d3.koodi=s.koulutustyyppi
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=cast(s.loadtime as date)

WHERE s.koulutustyyppi<>'-1' --just so we don't get duplicates. -1's are picked up in a separate select
--debug: and cast(s.loadtime as date)>=(select max(cast(loadtime as date)) from sa.sa_virta_otp_amkopintopiste)

UNION

-- NB! get data from two tables (full outer join so either table with a row is sufficient)
--     this has some impact in getting dimension data, however. see below or-conditions
SELECT
 coalesce((
  select d.id
  -- hack! koodisto as a map (from "db" (kk-tunnus) to oppilaitosnumero)
  from sa.sa_koodistot sk
  LEFT JOIN dw.d_amk d ON d.amk_tunnus=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
  where sk.koodisto='virtakorkeakoulutunnus'
  and(sk.koodi=s.db or sk.koodi=a.db)
),-1) as d_amk_id
,-1 as d_koulutusala_2002_id
,coalesce((
  select d.id
  from dw.d_ohjauksenala d
  where(d.ohjauksenala_koodi=s.koodi or d.ohjauksenala_koodi=a.koodi)
),-1) as d_ohjauksenala_id
,coalesce((
  select d.id
  from dw.d_amk_koulutustyyppi d
  where d.koodi='-1' -- fixed!
),-1) as d_amk_koulutustyyppi_id
,coalesce((select d.id
  from dw.d_kalenteri as d
  where(d.kalenteri_avain=cast(s.loadtime as date) or d.kalenteri_avain=cast(a.loadtime as date))
),-1) as d_tilannepvm_id
,coalesce(s.vuosi,a.vuosi) as vuosi

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

-- NB! add from another source! (sa_virta_otp_amkopintopiste):
,coalesce(a.kvVaihto,0) as kv_vaihtoopiskelijat_op_lkm
,coalesce(a.joo,0) as kk_yhteistyo_op_lkm
,coalesce(a.erillinenOO,0) as erilopintooik_op_lkm
,coalesce(a.mValKo,0) as mamu_op_lkm
,coalesce(a.erikoistumisopinnot,0) as erikoul_suor_op_lkm

,s.source

-- NB! full outer join so either table is sufficient
FROM
 sa.sa_virta_otp_amkavoimenopintopisteetjarj s
FULL OUTER JOIN
 sa.sa_virta_otp_amkopintopiste a
  ON a.db=s.db and a.koodi=s.koodi and a.vuosi=s.vuosi
  and cast(a.loadtime as date)=cast(s.loadtime as date) -- as we're getting and collecting data every day make sure the data is from same original set
  and a.koulutustyyppi='-1' --just so we don't get too many duplicates. this should be ok but not verified from anywhere!
  and a.avoinKK=s.opintopisteet --just another sanity check...
  -- nb! is this limit risky?
  and s.oppilaitostyyppi='Ammattikorkeakoulut'

--debug: where cast(s.loadtime as date)>=(select max(cast(loadtime as date)) from sa.sa_virta_otp_amkavoimenopintopisteetjarj)
