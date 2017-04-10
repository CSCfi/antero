IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_yo3b_julkaisut_keksintoilmoitukset') BEGIN

create table sa_yo3b_julkaisut_keksintoilmoitukset
(
  yliopisto varchar(4000)
, vuosi varchar(4000)
, "i tieteenala" varchar(4000)
, "ii tieteenala" varchar(4000)
, "iii tieteenala" varchar(4000)
, "iv tieteenala" varchar(4000)
, "v tieteenala" varchar(4000)
, "vi tieteenala" varchar(4000)
, "i koulutusala" varchar(4000)
, "ii koulutusala" varchar(4000)
, "iii koulutusala" varchar(4000)
, "iv koulutusala" varchar(4000)
, "v koulutusala" varchar(4000)
, "vi koulutusala" varchar(4000)
, "julkaisumaa (julkaistu suomessa   julkaistu ulkomailla)" varchar(4000)
, h21 int
, h22 int
, h23 int
, h24 int
, imp_created_date datetime
, imp_created_by varchar(100)
)
;

END