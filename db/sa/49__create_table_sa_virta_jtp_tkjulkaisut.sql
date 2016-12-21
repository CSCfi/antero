IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_jtp_tkjulkaisut') BEGIN

CREATE TABLE dbo.sa_virta_jtp_tkjulkaisut(
 id bigint IDENTITY(1,1) NOT NULL,

  organisaatioTunnus nvarchar(50) null,
  ilmoitusVuosi int null,
  julkaisunTunnus nvarchar(30) null,
  julkaisunTilakoodi int null,
  julkaisunOrgTunnus nvarchar(50) null,
  julkaisuVuosi int null,
  julkaisunNimi nvarchar(max) null,
  tekijatiedotTeksti nvarchar(max) null,
  tekijoidenLkm int null,
  sivunumeroTeksti nvarchar(max) null,
  artikkelinumero nvarchar(max) null,
  isbn nvarchar(20) null,
  jufoTunnus nvarchar(max) null,
  jufoLuokkaKoodi nvarchar(max) null,
  julkaisumaaKoodi varchar(3) null,
  lehdenNimi nvarchar(max) null,
  issn nvarchar(20) null,
  volyymiTeksti nvarchar(max) null,
  lehdenNumeroTeksti nvarchar(max) null,
  konferenssinNimi nvarchar(max) null,
  kustantajanNimi nvarchar(max) null,
  kustannuspaikkaTeksti nvarchar(max) null,
  emojulkaisunNimi nvarchar(max) null,
  emojulkaisunToimittajatTeksti nvarchar(max) null,
  julkaisuntyyppiKoodi nvarchar(10) null,
  yhteisjulkaisuKVKytkin varchar(2) null,
  yhteisjulkaisuSHPKytkin varchar(2) null,
  yhteisjulkaisuTutkimuslaitosKytkin varchar(2) null,
  yhteisjulkaisuMuuKytkin varchar(2) null,
  julkaisunKansainvalisyysKytkin varchar(2) null,
  julkaisunKieliKoodi nvarchar(max) null,
  avoinSaatavuusKoodi nvarchar(max) null,
  evoJulkaisunKytkin varchar(2) null,
  doi nvarchar(max) null,
  pysyvaOsoiteTeksti nvarchar(max) null,
  lahdetietokannanTunnus nvarchar(max) null,
  latausId nvarchar(max) null,
  yhteisjulkaisuId nvarchar(max) null,
  rinnakkaistallennusKytkin varchar(2) null,
  yhteisjulkaisunTunnus nvarchar(20) null,
  juuliOsoiteTeksti nvarchar(max) null,
  yhteisjulkaisuYritysKytkin varchar(2) null,
  jufoId nvarchar(max) null,
  hankeTKs nvarchar(max) null,
  avainsanaTKs nvarchar(max) null,
  isbnTKs nvarchar(max) null,
  issnTKs nvarchar(max) null,
  koulutusalaTKs nvarchar(max) null,
  orgYksikkoTKs nvarchar(max) null,
  tekijaTKs nvarchar(max) null,
  tieteenalaTKs nvarchar(max) null,

  loadtime datetime2(4) NOT NULL,
 source nvarchar(255) NULL,
 username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_virta_jtp_tkjulkaisut PRIMARY KEY CLUSTERED
(
 id ASC
)
)
;

ALTER TABLE dbo.sa_virta_jtp_tkjulkaisut ADD  CONSTRAINT DF__sa_virta_jtp_tkjulkaisut__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_jtp_tkjulkaisut ADD  CONSTRAINT DF__sa_virta_jtp_tkjulkaisut__username  DEFAULT (suser_name()) FOR username
;

END
