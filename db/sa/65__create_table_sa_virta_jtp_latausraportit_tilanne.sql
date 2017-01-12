IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_jtp_latausraportit_tilanne') BEGIN

CREATE TABLE dbo.sa_virta_jtp_latausraportit_tilanne(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,

  organisaatioNimi nvarchar(max) null,
  organisaatioTunnus nvarchar(max) null,
  julkaisunNimi nvarchar(max) null,
  julkaisuTyyppi nvarchar(max) null,
  julkaisunTunnus nvarchar(max) null,
  organisaationJulkaisuTunnus nvarchar(max) null,
  luontiPaivamaara date null,
  paivitysPaivamaara date null,
  tilanneraporttiID  bigint null,
  julkaisuVuosi  int null,
  ilmoitusVuosi int null,
  julkaisunTila  int null,

 CONSTRAINT PK__sa_virta_jtp_latausraportit_tilanne PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.sa_virta_jtp_latausraportit_tilanne ADD  CONSTRAINT DF__sa_virta_jtp_latausraportit_tilanne__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_jtp_latausraportit_tilanne ADD  CONSTRAINT DF__sa_virta_jtp_latausraportit_tilanne__username  DEFAULT (suser_name()) FOR username
;

END
