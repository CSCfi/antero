USE [ANTERO]
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_uraseuranta')

BEGIN
CREATE TABLE sa.sa_uraseuranta
  (
    kyselyid INT
  , koulutustoimija VARCHAR(15)
  , kysely_fi VARCHAR(200)
  , kysely_sv VARCHAR(200)
  , kysely_en VARCHAR(200)
  , kyselykertaid INT
  , kyselykerta VARCHAR(50)
  , kysymysryhmaid INT
  , kysymysryhma_fi VARCHAR(100)
  , kysymysryhma_sv VARCHAR(100)
  , kysymysryhma_en VARCHAR(100)
  , valtakunnallinen BIT
  , kysymysryhma_jarjestys INT
  , kysymysid INT
  , jarjestys varchar(10)
  , vastaustyyppi VARCHAR(16)
  , kysymys_fi VARCHAR(500)
  , kysymys_sv VARCHAR(500)
  , kysymys_en VARCHAR(500)
  , jatkokysymys BIT
  , jatkokysymys_kysymysid VARCHAR(100)
  , vastausid INT
  , numerovalinta INT
  , vapaateksti VARCHAR(4000)
  , monivalintavaihtoehto_fi VARCHAR(200)
  , monivalintavaihtoehto_sv VARCHAR(200)
  , monivalintavaihtoehto_en VARCHAR(200)
  , vaihtoehto BIT
  , vastaajaid INT
  , vastaajatunnus VARCHAR(10)
  , valmistavan_koulutuksen_jarjestaja VARCHAR(10)
  , valmistavan_koulutuksen_oppilaitos VARCHAR(15)
  , tutkintotunnus VARCHAR(15)
  , "taustatiedot.laajuus" VARCHAR(15)
  , "taustatiedot.paaaine" VARCHAR(200)
  , "taustatiedot.arvosana" VARCHAR(20)
  , "taustatiedot.asteikko" VARCHAR(45)
  , "taustatiedot.sukupuoli" INT
  , "taustatiedot.aidinkieli" VARCHAR(10)
  , "taustatiedot.kansalaisuus" VARCHAR(15)
  , "taustatiedot.valintavuosi" INT
  , "taustatiedot.tutkinnon_taso" INT
  , "taustatiedot.asuinkunta_koodi" VARCHAR(15)
  , "taustatiedot.ika_valmistuessa" INT
  , "taustatiedot.koulutusalakoodi" VARCHAR(15)
  , "taustatiedot.valmistumisvuosi" INT
  , "taustatiedot.lasnaolo_lukukausia" VARCHAR(15)
  , "taustatiedot.valmistumisajankohta" DATETIME
  , "taustatiedot.kirjoilla_olo_kuukausia" INT
  , loadtime DATETIME
  , username VARCHAR(100)
  , source VARCHAR(100)
  )

ALTER TABLE sa.sa_uraseuranta ADD  CONSTRAINT DF__sa_uraseuranta__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_uraseuranta ADD  CONSTRAINT DF__sa_uraseuranta__username  DEFAULT (suser_name()) FOR username
;

END
