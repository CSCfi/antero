IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo4_toimipisteet_fakta') BEGIN

create table sa.sa_suorat_yo4_toimipisteet_fakta
(
  yliopisto_tunnus varchar(5)
, vuosi int
, toimipiste_koodi varchar(3)
, toimipaikka_koodi varchar(10)
, toimipaikan_htv_lkm decimal(10,4)
, tutkaseman_henk_max_maara int
, tutkaseman_henk_min_maara int
, tutkaseman_yopymisvuorokaudet_lkm int
, imp_created_by varchar(100)
, imp_created_date datetime
)
;

END
