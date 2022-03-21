USE ANTERO
GO

ALTER PROCEDURE dw.p_lataa_f_virta_otp_opintopiste_pvm_amk 
AS 

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
  loadtime,
  source,
  username
  
)
SELECT
  sa.vuosi,
  convert(date,dateadd(s, convert(bigint, sa.suorituspaiva) / 1000, convert(datetime, '1-1-1970 3:00:00'))),
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
  dateadd(d,-1,sa.loadtime),
  sa.source,
  sa.username

FROM sa.sa_virta_otp_opintopistepvmamk as sa
LEFT JOIN dw.d_ohjauksenala d1 ON d1.ohjauksenala_koodi=sa.koodi
LEFT JOIN dw.d_amk_koulutustyyppi d2 ON d2.koodi = sa.koulutustyyppi
LEFT JOIN dw.d_amk d3 ON d3.amk_tunnus = sa.oppilaitostunnus



