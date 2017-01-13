IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_julkaisut') BEGIN

CREATE TABLE sa.sa_virta_jtp_julkaisut(
  id bigint IDENTITY(1,1) NOT NULL,
  julkaisunTunnus nvarchar(30) NULL,
  julkaisunNimi nvarchar(500) NULL,
  tekijat nvarchar(1000) NULL,
  julkaisuVuosi int NULL,
  julkaisuTyyppi nvarchar(10) NULL,
  lehdenNimi nvarchar(300) NULL,
  kustantajanNimi nvarchar(300) NULL,
  isbn nvarchar(100) NULL,
  issn nvarchar(100) NULL,
  julkaisunTila int NULL,
  doi nvarchar(200) NULL,
  julkaisunOrgTunnus nvarchar(50) NULL,
  yhteisJulkaisunTunnus nvarchar(20) NULL,
  jufoTunnus nvarchar(10) NULL,
  organisaatioTunnus nvarchar(10) NULL,
  ilmoitusVuosi int NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_virta_jtp_julkaisut PRIMARY KEY CLUSTERED 
(
  id ASC
)
)
;

ALTER TABLE sa.sa_virta_jtp_julkaisut ADD  CONSTRAINT DF__sa_virta_jtp_julkaisut__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_jtp_julkaisut ADD  CONSTRAINT DF__sa_virta_jtp_julkaisut__username  DEFAULT (suser_name()) FOR username
;

END
