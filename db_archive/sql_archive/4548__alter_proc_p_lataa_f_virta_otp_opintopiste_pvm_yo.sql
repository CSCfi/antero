USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_opintopiste_pvm_yo]    Script Date: 21.4.2021 20:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_opintopiste_pvm_yo] AS 

DECLARE @maxLoadtime date = (SELECT max(cast(loadtime as date)) FROM sa.sa_virta_otp_opintopistepvmyo)
DECLARE @paivitysPvm nvarchar(10) = right('0'+cast(day(@maxLoadtime) as nvarchar(2)), 2) + '.' + right('0'+cast(month(@maxLoadtime) as nvarchar(2)), 2) + '.' + cast(year(@maxLoadtime) as nvarchar(4))

TRUNCATE TABLE dw.f_virta_otp_opintopiste_pvm_yo

INSERT INTO dw.f_virta_otp_opintopiste_pvm_yo (
  tilastovuosi,
  suorituspaiva,
  d_ohjauksenala_id,
  d_yo_id,
  lukumaara_int,
  perustutk_opiskelijat_lkm,
  vierask_suoritukset_lkm,
  kansainv_vaihto_lkm,
  kk_yhteistyo_lkm,
  avoin_kk_lkm,
  erillinen_opinto_oikeus_lkm,
  ulkomailta_hyv_luet_lkm,
  erillinen_opinto_opettaja_lkm,
  ulkomaaharjoittelu_lkm,
  erikoistumiskoulutus_lkm,
  paivitys_ajankohta,
  tietojen_ajankohta,
  jarjestys_tietojen_ajankohta,
  source,
  username
)

SELECT
  sa.vuosi,
  convert(date,dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00'))) AS suorituspaiva,
  coalesce(d1.id,-1) AS d_ohjauksenala_id,
  coalesce(d2.id,-1) AS d_yo_id,
  sa.lukumaara,
  sa.perustutkOpiskelijat,
  sa.vieraskSuoritukset,
  sa.kansainvVaihto,
  sa.kkYhteistyo,
  sa.avoinKK,
  sa.erillinenOpintoOikeus,
  sa.ulkomailtaHyvLuet,
  sa.erillinenOpintoOpettaja,
  sa.ulkomaaharjoittelu,
  sa.erikoistumiskoulutus, 
  @paivitysPvm,
  case when cast(sa.loadtime as date) = @maxLoadtime then 'Uusin' else right('0'+cast(day(sa.loadtime)-1 as nvarchar(2)), 2) + '.' + right('0'+cast(month(sa.loadtime) as nvarchar(2)), 2) + '.' + cast(year(sa.loadtime) as nvarchar(4)) end,
  99999999 - cast(cast(year(sa.loadtime) as nvarchar(4)) + right('0'+cast(month(sa.loadtime) as nvarchar(2)), 2) + right('0'+cast(day(sa.loadtime) as nvarchar(2)), 2) as int),
  sa.source,
  sa.username

FROM sa.sa_virta_otp_opintopistepvmyo as sa
LEFT JOIN dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi=sa.koodi
LEFT JOIN dw.d_yo d2 ON d2.yo_tunnus = sa.oppilaitostunnus

WHERE day(sa.loadtime) in (2, 16) OR cast(sa.loadtime as date) = @maxLoadtime


