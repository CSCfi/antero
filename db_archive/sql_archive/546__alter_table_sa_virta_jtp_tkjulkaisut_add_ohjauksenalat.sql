IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_tkjulkaisut'
  and COLUMN_NAME='kasvatusalat_1'
) BEGIN

ALTER TABLE sa.sa_virta_jtp_tkjulkaisut ADD
  kasvatusalat_1 varchar(20) NULL,
  taiteet_ja_kulttuurialat_2 varchar(20) NULL,
  humanistiset_alat_3 varchar(20) NULL,
  yhteiskunnalliset_alat_4 varchar(20) NULL,
  kauppa_hallinto_ja_oikeustieteet_5 varchar(20) NULL,
  luonnontieteet_6 varchar(20) NULL,
  tietojenkasittely_ja_tietoliikenne_7 varchar(20) NULL,
  tekniikan_alat_8 varchar(20) NULL,
  maa_ja_metsatalousalat_9 varchar(20) NULL,
  laaketieteet_10 varchar(20) NULL,
  terveys_ja_hyvinvointialat_11 varchar(20) NULL,
  palvelualat_12 varchar(20) NULL

END
/* revert
ALTER TABLE sa.sa_virta_jtp_tkjulkaisut DROP COLUMN
  kasvatusalat_1,
  taiteet_ja_kulttuurialat_2,
  humanistiset_alat_3,
  yhteiskunnalliset_alat_4,
  kauppa_hallinto_ja_oikeustieteet_5,
  luonnontieteet_6,
  tietojenkasittely_ja_tietoliikenne_7,
  tekniikan_alat_8,
  maa_ja_metsatalousalat_9,
  laaketieteet_10,
  terveys_ja_hyvinvointialat_11,
  palvelualat_12
--*/
