USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_opintopisteet]    Script Date: 10.3.2025 9.06.46 ******/
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
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
LEFT JOIN dw.d_ohjauksenala d2 ON d2.ohjauksenala_koodi=s.koodi
LEFT JOIN dw.d_amk_koulutustyyppi d3 ON d3.koodi=s.koulutustyyppi
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=(select d from dbo.BigintToDate(s.luontipaivamaara))


WHERE s.vuosi>=2016

UNION

SELECT
	coalesce(d1.id, -1) as d_amk_id,
	-1 as d_koulutusala_2002_id,
	coalesce(d2.id, -1) as d_ohjauksenala_id,
	coalesce(d3.id,-1) as d_amk_koulutustyyppi_id,
	coalesce(d4.id,-1) as d_tilannepvm_id,
	s.vuosi,

	0 as kaikki_tutk_lkm,
	0 as tki_pisteet_lkm,
	0 as tki_harj_pisteet_lkm,
	0 as tki_muu_pisteet_lkm,
	0 as vierkiel_pisteet_lkm,
	0 as ulkom_hyv_op_lkm,
	0 as ulkom_harj_op_lkm,

	0 as avoinamk_op_lkm,

	case 
		when s.oppilaitostyyppi = 'Ammattikorkeakoulut' then coalesce(s.opintopisteet ,0)
		else 0
	end as avoinamk_op_amk_lkm,
	case 
		when s.oppilaitostyyppi = 'Yliopistot' then coalesce(s.opintopisteet ,0)
		else 0
	end as avoinamk_op_yliop_lkm,
	case 
		when s.oppilaitostyyppi = 'Kesäyliopistot' then coalesce(s.opintopisteet ,0)
		else 0
	end as avoinamk_op_kesa_lkm,
	case 
		when s.oppilaitostyyppi = 'Kansanopistot' then coalesce(s.opintopisteet ,0)
		else 0
	end as avoinamk_op_kansan_lkm,
	case 
		when s.oppilaitostyyppi = 'Kansalaisopistot' then coalesce(s.opintopisteet ,0)
		else 0
	end as avoinamk_op_kansal_lkm,
	case 
		when s.oppilaitostyyppi not in ('Ammattikorkeakoulut','Yliopistot','Kesäyliopistot','Kansaopistot','Kansalaisopistot') then s.opintopisteet 
		else 0
	end as avoinamk_op_muut_lkm,

	0 as kv_vaihtoopiskelijat_op_lkm,
	0 as kk_yhteistyo_op_lkm,
	0 as erilopintooik_op_lkm,
	0 as mamu_op_lkm,
	0 as erikoul_suor_op_lkm,
	0 as muu_kuin_kk_yhteistyo_op_lkm,
	0 as kv_suomi_vieraana_op_lkm,
	0 as kv_ruotsi_vieraana_op_lkm,

	s.source
FROM sa.sa_virta_otp_amkavoimenopintopisteetjarj s
LEFT JOIN sa.sa_koodistot sa on sa.koodi = s.db and sa.koodisto = 'virtakorkeakoulutunnus'
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi=sa.nimi 
LEFT JOIN dw.d_ohjauksenala d2 on d2.ohjauksenala_koodi = s.koodi
LEFT JOIN dw.d_amk_koulutustyyppi d3 on d3.koodi = -1
LEFT JOIN dw.d_kalenteri d4 on d4.kalenteri_avain = (select d from dbo.BigintToDate(s.luontipaivamaara))
WHERE s.vuosi>=2016

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
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
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
  LEFT JOIN dw.d_organisaatioluokitus d ON d.organisaatio_koodi=sk.nimi -- hack! koodisto as a map (using nimi for mapping!)
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
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi=s.amk_tunnus
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
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi=sb.korkeakoulu_tunnus
LEFT JOIN dw.d_koulutusala_2002 d2 ON d2.koodi=sb.koulutusala_koodi
LEFT JOIN dw.d_amk_koulutustyyppi d3 ON d3.koodi='-1' --fixed!
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=cast(sb.LATAUSAIKA as date)
) f
WHERE cast(concat(cast(f.vuosi as nvarchar), '-03-01') as date) <= DATEADD(year, -1, GETDATE())

GO

USE [ANTERO]