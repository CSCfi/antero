IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sa.SA_SUORAT_AMK_TALOUS_6_liiketoiminnan_tuloslaskelma') AND type in (N'U'))
BEGIN
CREATE TABLE sa.SA_SUORAT_AMK_TALOUS_6_liiketoiminnan_tuloslaskelma(
  TILIK int NULL,
  LIIKEVAIHTO bigint NULL,
  VARASTOJEN_LISAYS_TAI_VAHENNYS bigint NULL,
  VALMISTUS_OMAAN_KAYTTOON bigint NULL,
  LIIKETOIMINNAN_MUUT_TUOTOT bigint NULL,
  MATERIAALIT_JA_PALVELUT bigint NULL,
  AINEET_TARVIKKEET_JA_TAVARAT bigint NULL,
  OSTOT_TILIKAUDEN_AIKANA bigint NULL,
  TUOTTEET_VARASTOJEN_LISAYS_TAI_VAHENNYS bigint NULL,
  ULKOPUOLISET_PALVELUT bigint NULL,
  HENKILOSTOKULUT bigint NULL,
  PALKAT_JA_PALKKIOT bigint NULL,
  HENKILOSTOSIVUKULUT bigint NULL,
  ELAKEKULUT bigint NULL,
  MUUT_HENKILOSTOSIVUKULUT bigint NULL,
  POISTOT_JA_ARVONALENNUKSET bigint NULL,
  SUUNNITELMAN_MUKAISET_POISTOT bigint NULL,
  SIJOITUKSET_ARVONALENTUMISET_PYSYVAT_VASTAAVAT bigint NULL,
  SIJOITUKSET_ARVONALENTUMISET_VAIHTUVAT_VASTAAVAT bigint NULL,
  LIIKETOIMINNAN_MUUT_KULUT bigint NULL,
  LIIKEVOITTO bigint NULL,
  RAHOITUSTUOTOT_JA_KULUT bigint NULL,
  TUOTOT_OSUUKSISTA_KONSERNI bigint NULL,
  TUOTOT_OSUUKSISTA_OMISTUSYHTEISTYOYRITYKSISSA bigint NULL,
  TUOTOT_MUISTA bigint NULL,
  TUOTOT_SAMA_KONSERNI bigint NULL,
  TUOTOT_MUILTA bigint NULL,
  MUUT_KORKOTUOTOT bigint NULL,
  MUUT_KORKOTUOTOT_SAMA_KONSERNI bigint NULL,
  MUUT_KORKOTUOTOT_MUILTA bigint NULL,
  ARVONALENTUMISET_PYSYVAT_VASTAAVAT bigint NULL,
  ARVONALENTUMISET_VAIHTUVAT_VASTAAVAT bigint NULL,
  KORKOKULUT_JA_MUUT_RAHOITUSKULUT bigint NULL,
  KORKOKULUT_SAMA_KONSERNI bigint NULL,
  KORKOKULUT_MUILLE bigint NULL,
  VOITTO_ENNEN_SATUNNAISIA_ERIA bigint NULL,
  SATUNNAISET_ERAT bigint NULL,
  SATUNNAISET_TUOTOT bigint NULL,
  SATUNNAISET_KULUT bigint NULL,
  VOITOT_ENNEN_TILINPAATOSSIIRTOJA bigint NULL,
  TILINPAATOSSIIRROT bigint NULL,
  POISTOERON_LISAYS bigint NULL,
  VAPAAEHTOISTEN_VARAUSTEN_LISAYS bigint NULL,
  TULOVEROT bigint NULL,
  MUUT_VALITTOMAT_VEROT bigint NULL,
  TILKAUDEN_VOITTO bigint NULL,
  OSA2 nvarchar(max) NULL,
  AMK nvarchar(50) NULL,
  AMK_koodi nvarchar(50) NULL,
  Aineistotyyppi nvarchar(50) NULL,
  CHECKSUM_AMK_TALOUS_6_LIIKETOIMINNAN_TULOSLASKELMA int NULL,
  IMP_CREATED_DATE datetime NULL,
  IMP_UPDATED_DATE datetime NULL,
  IMP_CREATED_BY nvarchar(100) NULL,
  IMP_DELETED_DATE datetime NULL
)
END
