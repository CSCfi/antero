IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut') BEGIN

create table sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut
(
  tilik varchar(255)
, yliop varchar(255)
, yliop_koodi varchar(255)
, harjkoul int
, opetusy int
, esiope int
, perusope int
, lukioope int
, opekouly int
, harjhkou int
, harjulko int
, opekehit int
, kirjyht int
, ylakiyht int
, kultper int
, kanpakir int
, yototteh int
, imp_created_date datetime
, imp_created_by varchar(100)
)
;

END