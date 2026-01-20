USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_opintopiste_pvm_amk]    Script Date: 27.2.2025 11.02.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_opintopiste_pvm_amk] 
AS 

DECLARE @maxLoadtime date = (SELECT max(cast(loadtime as date)) FROM sa.sa_virta_otp_opintopistepvmamk)
DECLARE @paivitysPvm nvarchar(10) = right('0'+cast(day(@maxLoadtime) as nvarchar(2)), 2) + '.' + right('0'+cast(month(@maxLoadtime) as nvarchar(2)), 2) + '.' + cast(year(@maxLoadtime) as nvarchar(4))

-- Poistetaan sa-taulusta yli viisi vuotta vanhat tiedot ja välipäivät
DELETE [ANTERO].[sa].[sa_virta_otp_opintopistepvmamk] 
WHERE YEAR(loadtime) < YEAR(@maxLoadtime) - 5 

DELETE [ANTERO].[sa].[sa_virta_otp_opintopistepvmamk]
WHERE YEAR(loadtime) >= YEAR(@maxLoadtime) - 1 AND DAY(loadtime) NOT IN (2,16) and CAST(loadtime as date) <> @maxLoadtime

TRUNCATE TABLE dw.f_virta_otp_opintopiste_pvm_amk

INSERT INTO dw.f_virta_otp_opintopiste_pvm_amk (
  tilastovuosi,
  suorituspaiva,
  d_ohjauksenala_id,
  d_amk_koulutustyyppi_id,
  d_amk_id,
  lukumaara_int,
  perustutk_opiskelijat_lkm,
  vierask_suoritukset_lkm,
  kansainv_vaihto_lkm,
  kk_yhteistyo_lkm,
  avoin_kk_lkm,
  erillinen_opinto_oikeus_lkm,
  ulkomailta_hyv_luet_lkm,
  maahanm_val_koulutus_lkm,
  TKI_toiminnan_laajuus_lkm,
  TKI_muut_laajuus_lkm,
  TKI_harjoittelun_laajuus_lkm,
  ulkomaaharjoittelu_lkm,
  erikoistumiskoulutus_lkm,
  kvsuomivieraana_lkm,
  kvruotsivieraana_lkm,
  muunkuinkorkeakoulun_lkm,
  paivitys_ajankohta,
  tietojen_ajankohta,
  jarjestys_tietojen_ajankohta,
  source,
  username
)

SELECT
  sa.vuosi,
  convert(date, dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00'))),
  coalesce(d1.id,-1) AS d_ohjauksenala_id,
  coalesce(d2.id,-1) AS d_amk_koulutustyyppi_id,
  coalesce(d3.id,-1) AS d_amk_id,
  sa.lukumaara,
  sa.perustutkOpiskelijat,
  sa.vieraskSuoritukset,
  sa.kansainvVaihto,
  sa.kkYhteistyo,
  sa.avoinKK,
  sa.erillinenOpintoOikeus,
  sa.ulkomailtaHyvLuet,
  sa.maahanmValKoulutus,
  sa.tkiToiminnanLaajuus,
  sa.tkiMuutLaajuus,
  sa.tkiHarjoittelunLaajuus,
  sa.ulkomaaharjoittelu,
  sa.erikoistumiskoulutus,
  sa.kvsuomivieraana,
  sa.kvruotsivieraana,
  sa.muunkuinkorkeakoulun,
  @paivitysPvm,
  case when cast(sa.loadtime as date) = @maxLoadtime then 'Uusin' else right('0'+cast(day(sa.loadtime)-1 as nvarchar(2)), 2) + '.' + right('0'+cast(month(sa.loadtime) as nvarchar(2)), 2) + '.' + cast(year(sa.loadtime) as nvarchar(4)) end,
  99999999 - cast(cast(year(sa.loadtime) as nvarchar(4)) + right('0'+cast(month(sa.loadtime) as nvarchar(2)), 2) + right('0'+cast(day(sa.loadtime) as nvarchar(2)), 2) as int),
  sa.source,
  sa.username

FROM sa.sa_virta_otp_opintopistepvmamk as sa
LEFT JOIN dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi=sa.koodi
LEFT JOIN dw.d_amk_koulutustyyppi d2 ON d2.koodi = sa.koulutustyyppi
LEFT JOIN dw.d_amk d3 ON d3.amk_tunnus = sa.oppilaitostunnus


GO

USE [ANTERO]