IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.f_amk_talous_3_kulut_ja_tuotot') AND type in (N'U'))
BEGIN
CREATE TABLE dw.f_amk_talous_3_kulut_ja_tuotot(
  id int IDENTITY(1,1) NOT NULL,
  d_amk_id int NOT NULL,
  d_toiminto_id int NOT NULL,
  tilikausi int NOT NULL,
  tuotot_yhteensa bigint NULL,
  perusrahoitus_yhteensa bigint NULL,
  tuet_ja_avustukset_yhteensa bigint NULL,
  maksut_ja_korvaukset_yhteensa bigint NULL,
  muu_liikevaihto_yhteensa bigint NULL,
  toiminnan_muut_tuotot_yhteensa bigint NULL,
  kulut_yhteensa_yhteensa bigint NULL,
  materiaalit_ja_palvelut_yhteensa bigint NULL,
  henkilostokulut_yhteensa bigint NULL,
  poistot_yhteensa bigint NULL,
  muut_toimintakulut_yhteensa bigint NULL,
  osuus_yhteisista_kuluista bigint NULL,
  tuotot_liiketoiminta bigint NULL,
  perusrahoitus_liiketoiminta bigint NULL,
  tuet_ja_avustukset_liiketoiminta bigint NULL,
  maksut_ja_korvaukset_liiketoiminta bigint NULL,
  muu_liikevaihto_liiketoiminta bigint NULL,
  toiminnan_muut_tuotot_liiketoiminta bigint NULL,
  kulut_liiketoiminta bigint NULL,
  materiaalit_ja_palvelut_liiketoiminta bigint NULL,
  henkilostokulut_liiketoiminta bigint NULL,
  poistot_liiketoiminta bigint NULL,
  muut_toimintakulut_liiketoiminta bigint NULL,
  osuus_yhteisista_kuluista_liiketoiminta bigint NULL,
  tuotot_perustehtava bigint NULL,
  perusrahoitus_perustehtava bigint NULL,
  tuet_ja_avustukset_perustehtava bigint NULL,
  maksut_ja_korvaukset_perustehtava bigint NULL,
  muu_liikevaihto_perustehtava bigint NULL,
  toiminnan_muut_tuotot_perustehtava bigint NULL,
  kulut_perustehtava bigint NULL,
  materiaalit_ja_palvelut_perustehtava bigint NULL,
  henkilostokulut_perustehtava bigint NULL,
  poistot_perustehtava bigint NULL,
  muut_toimintakulut_perustehtava bigint NULL,
  osuus_yhteisista_kuluista_perustehtava bigint NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL
)
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__loadt__2BFE89A6') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_3_kulut_ja_tuotot ADD  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__usern__2CF2ADDF') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_3_kulut_ja_tuotot ADD  DEFAULT (suser_sname()) FOR username
END