IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.f_amk_talous_6_liiketoiminnan_tuloslaskelma') AND type in (N'U'))
BEGIN
CREATE TABLE dw.f_amk_talous_6_liiketoiminnan_tuloslaskelma(
  id int IDENTITY(1,1) NOT NULL,
  d_amk_id int NOT NULL,
  tilikausi int NOT NULL,
  aineistotyyppi varchar(20) NULL,
  liikevaihto bigint NULL,
  puol_tai_valmiit_varastojen_lisays_tai_vahennys bigint NULL,
  valmistus_omaan_kayttoon bigint NULL,
  liiketoiminnan_muut_tuotot bigint NULL,
  materiaalit_ja_palvelut bigint NULL,
  aineet_tarvikkeet_ja_tavarat bigint NULL,
  ostot_tilikauden_aikana bigint NULL,
  varastojen_lisays_tai_vahennys bigint NULL,
  ulkopuoliset_palvelut bigint NULL,
  henkilostokulut bigint NULL,
  palkat_ja_palkkiot bigint NULL,
  henkilostosivukulut bigint NULL,
  elakekulut bigint NULL,
  muut_henkilostosivukulut bigint NULL,
  poistot_ja_arvonalennukset bigint NULL,
  suunnitelman_mukaiset_poistot bigint NULL,
  arvonalentumiset_pysyvat_vastaavat_hyödyke bigint NULL,
  arvonalentumiset_vaihtuvat_vastaavat_poikkeukset bigint NULL,
  liiketoiminnan_muut_kulut bigint NULL,
  liikevoitto bigint NULL,
  rahoitustuotot_ja_kulut bigint NULL,
  tuotot_osuuksista_konserni bigint NULL,
  tuotot_osuuksista_omistusyhteistyoyrityksissa bigint NULL,
  tuotot_muista bigint NULL,
  tuotot_sama_konserni bigint NULL,
  tuotot_muilta bigint NULL,
  muut_korkotuotot bigint NULL,
  muut_korkotuotot_sama_konserni bigint NULL,
  muut_korkotuotot_muilta bigint NULL,
  arvonalentumiset_pysyvat_vastaavat bigint NULL,
  arvonalentumiset_vaihtuvat_vastaavat bigint NULL,
  korkokulut_ja_muut_rahoituskulut bigint NULL,
  korkokulut_sama_konserni bigint NULL,
  korkokulut_muille bigint NULL,
  voitto_ennen_satunnaisia_eria bigint NULL,
  satunnaiset_erat bigint NULL,
  satunnaiset_tuotot bigint NULL,
  satunnaiset_kulut bigint NULL,
  voitot_ennen_tilinpaatossiirtoja bigint NULL,
  tilinpaatossiirrot bigint NULL,
  poistoeron_lisays bigint NULL,
  vapaaehtoisten_varausten_lisays bigint NULL,
  tuloverot bigint NULL,
  muut_valittomat_verot bigint NULL,
  tilkauden_voitto bigint NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL
)
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__loadt__3493CFA7') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_6_liiketoiminnan_tuloslaskelma ADD  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__usern__3587F3E0') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_6_liiketoiminnan_tuloslaskelma ADD  DEFAULT (suser_sname()) FOR username
END