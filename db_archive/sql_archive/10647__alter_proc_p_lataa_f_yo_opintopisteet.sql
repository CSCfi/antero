USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_opintopisteet]    Script Date: 10.3.2025 9.32.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_yo_opintopisteet] AS


TRUNCATE TABLE dw.f_yo_opintopisteet;

INSERT INTO dw.f_yo_opintopisteet (
  d_yo_id,
  d_opintoala95_id,
  d_ohjauksenala_id,
  d_tilannepvm_id, -- d_kalenteri
  vuosi,

  kaikki_tutk_op_lkm,
  vierkielper_op_lkm,
  erillisilla_oik_op_lkm,
  erillisilla_oik_opkoul_op_lkm,
  joo_op_lkm,
  kv_vaihtoopiskelijat_op_lkm,
  erikoul_suor_op_lkm,
  ulkom_hyv_luetut_op_lkm,
  ulkom_harj_op_lkm,

  avoinop_lkm,
  avoinop_yliop_lkm,
  avoinop_amk_lkm,
  avoinop_kesa_lkm,
  avoinop_kansan_lkm,
  avoinop_kansal_lkm,
  avoinop_muut_lkm,
  muu_kuin_kk_yhteistyo_op_lkm,
  kv_suomi_vieraana_op_lkm,
  kv_ruotsi_vieraana_op_lkm,
  
  source
)
SELECT * FROM (

SELECT
 coalesce(d1.id,-1) as d_yo_id
,-1 as d_opintoala95_id
,coalesce(d2.id,-1) as d_ohjauksenala_id
,coalesce(d3.id,-1) as d_tilannepvm_id
,s.vuosi

,coalesce(s.perustutkinto,0) as kaikki_tutk_op_lkm
,coalesce(s.vieraskielinen,0) as vierkielper_op_lkm
,coalesce(s.erillinenOO,0) as erillisilla_oik_op_lkm
,coalesce(s.erillinenopettaja,0) as erillisilla_oik_opkoul_op_lkm
,coalesce(s.joo,0) as joo_op_lkm
,coalesce(s.kvVaihto,0) as kv_vaihtoopiskelijat_op_lkm
,coalesce(s.erikoistumisopinnot,0) as erikoul_suor_op_lkm
,coalesce(s.hyvaksiluetut,0) as ulkom_hyv_luetut_op_lkm
,coalesce(s.ulkomaaHarjoittelu,0) as ulkom_harj_op_lkm

,coalesce(s.avoinKK,0) as avoinop_lkm
--avoimen järjestävät
-- regarding dataset combining with SUORAT and VIRTA-OTP
-- transponate measures (map some values from multiple rows to one row)
,coalesce((select sum(b.opintopisteet)  from sa.sa_virta_otp_yoavoimenopintopisteetjarj b
  where b.db=s.db and b.koodi=s.koodi and b.vuosi=s.vuosi and cast(b.loadtime as date)=cast(s.loadtime as date)
  and b.oppilaitostyyppi='Yliopistot'
),0) as avoinop_yliop_lkm
,coalesce((select sum(b.opintopisteet)  from sa.sa_virta_otp_yoavoimenopintopisteetjarj b
  where b.db=s.db and b.koodi=s.koodi and b.vuosi=s.vuosi and cast(b.loadtime as date)=cast(s.loadtime as date)
  and b.oppilaitostyyppi='Ammattikorkeakoulut'
),0) as avoinop_amk_lkm
,coalesce((select sum(b.opintopisteet)  from sa.sa_virta_otp_yoavoimenopintopisteetjarj b
  where b.db=s.db and b.koodi=s.koodi and b.vuosi=s.vuosi and cast(b.loadtime as date)=cast(s.loadtime as date)
  and b.oppilaitostyyppi='Kesäyliopistot'
),0) as avoinop_kesa_lkm
,coalesce((select sum(b.opintopisteet)  from sa.sa_virta_otp_yoavoimenopintopisteetjarj b
  where b.db=s.db and b.koodi=s.koodi and b.vuosi=s.vuosi and cast(b.loadtime as date)=cast(s.loadtime as date)
  and b.oppilaitostyyppi='Kansanopistot'
),0) as avoinop_kansan_lkm
,coalesce((select sum(b.opintopisteet)  from sa.sa_virta_otp_yoavoimenopintopisteetjarj b
  where b.db=s.db and b.koodi=s.koodi and b.vuosi=s.vuosi and cast(b.loadtime as date)=cast(s.loadtime as date)
  and b.oppilaitostyyppi='Kansalaisopistot'
),0) as avoinop_kansal_lkm
,coalesce((select sum(b.opintopisteet)  from sa.sa_virta_otp_yoavoimenopintopisteetjarj b
  where b.db=s.db and b.koodi=s.koodi and b.vuosi=s.vuosi and cast(b.loadtime as date)=cast(s.loadtime as date)
  and b.oppilaitostyyppi not in (
    'Yliopistot','Ammattikorkeakoulut','Kesäyliopistot','Kansanopistot','Kansalaisopistot'
  )
),0) as avoinop_muut_lkm
,coalesce(s.muunkuinkorkeakoulun,0) as muu_kuin_kk_yhteistyo_op_lkm
,coalesce(s.kvsuomivieraana,0) as kv_suomi_vieraana_op_lkm
,coalesce(s.kvruotsivieraana,0) as kv_ruotsi_vieraana_op_lkm

,s.source

FROM sa.sa_virta_otp_yoopintopiste s
-- hack! koodisto as a map (from "db" (kk-tunnus) to oppilaitosnumero)
LEFT JOIN sa.sa_koodistot sk ON sk.koodi=s.db and sk.koodisto='virtakorkeakoulutunnus'
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
LEFT JOIN dw.d_ohjauksenala d2 ON d2.ohjauksenala_koodi=s.koodi
LEFT JOIN dw.d_kalenteri as d3 ON d3.kalenteri_avain=(select d from dbo.BigintToDate(s.luontipaivamaara))
WHERE s.vuosi>=2016


UNION

SELECT
 coalesce(d1.id,-1) as d_yo_id
,-1 as d_opintoala95_id
,coalesce(d2.id,-1) as d_ohjauksenala_id
,coalesce(d3.id,-1) as d_tilannepvm_id
,s.vuosi

,null as kaikki_tutk_op_lkm
,null as vierkielper_op_lkm
,null as erillisilla_oik_op_lkm
,null as erillisilla_oik_opkoul_op_lkm
,null as joo_op_lkm
,null as kv_vaihtoopiskelijat_op_lkm
,null as erikoul_suor_op_lkm
,coalesce(s.hyvaksiluetut,0) as ulkom_hyv_luetut_op_lkm
,null as ulkom_harj_op_lkm

,null as avoinop_lkm
--avoimen järjestävät
-- regarding dataset combining with SUORAT and VIRTA-OTP
-- transponate measures (map some values from multiple rows to one row)
,null as avoinop_yliop_lkm
,null as avoinop_amk_lkm
,null as avoinop_kesa_lkm
,null as avoinop_kansan_lkm
,null as avoinop_kansal_lkm
,null as avoinop_muut_lkm
,null as muu_kuin_kk_yhteistyo_op_lkm
,null as kv_suomi_vieraana_op_lkm
,null as kv_ruotsi_vieraana_op_lkm

,s.source

FROM sa.sa_virta_otp_yoopintopiste s
-- hack! koodisto as a map (from "db" (kk-tunnus) to oppilaitosnumero)
LEFT JOIN sa.sa_koodistot sk ON sk.koodi=s.db and sk.koodisto='virtakorkeakoulutunnus'
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
LEFT JOIN dw.d_ohjauksenala d2 ON d2.ohjauksenala_koodi=s.koodi
LEFT JOIN dw.d_kalenteri as d3 ON d3.kalenteri_avain=(select d from dbo.BigintToDate(s.luontipaivamaara))
WHERE s.vuosi=2015

UNION 

SELECT
 coalesce(d1.id,-1) as d_yo_id
,coalesce(d2.id,-1) as d_opintoala95_id
,-1 as d_ohjauksenala_id
,coalesce(d3.id,-1) as d_tilannepvm_id
,s.vuosi

,coalesce(kaikperop_lkm,0) as kaikki_tutk_op_lkm
,coalesce(vierkielper_op_lkm,0)
,coalesce(erillisilla_oik_op_lkm,0)
,coalesce(erillisilla_oik_opkoul_op_lkm,0)
,coalesce(joo_op_lkm,0)
,coalesce(kvvaihtop_lkm,0) as kv_vaihtoopiskelijat_op_lkm
,coalesce(erikoul_suor_op_lkm,0)
,coalesce(ulkom_hyv_luetut_op_lkm,0)
,0 as ulkom_harj_op_lkm --TODO: ok?

-- avoimen järjestävät:
,coalesce(s.avoinop_lkm,0)
,coalesce(s.avoinop_yliop_lkm,0)
,coalesce(s.avoinop_amk_lkm,0)
,coalesce(s.avoinop_kesa_lkm,0)
,coalesce(s.avoinop_kansan_lkm,0)
,coalesce(s.avoinop_kansal_lkm,0)
,coalesce(s.avoinop_muut_lkm,0)

-- CSCVIPUNEN-3369
,0
,0
,0

,'etl: sa_suorat_hist_yo2_opintopisteet' as source
FROM sa.sa_suorat_hist_yo2_opintopisteet s
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi=s.yliopisto_tunnus
LEFT JOIN dw.d_opintoala95 d2 ON d2.opintoala95_koodi=s.koulutusalakoodi
LEFT JOIN dw.d_kalenteri as d3 ON d3.kalenteri_avain=cast(s.LATAUSAIKA as date)
) f
WHERE cast(concat(cast(f.vuosi as nvarchar), '-03-01') as date) <= DATEADD(year, -1, GETDATE())


GO

USE [ANTERO]