IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_jtp_latausraportit_virheet') BEGIN

CREATE TABLE dbo.sa_virta_jtp_latausraportit_virheet(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,

  organisaatioTunnus nvarchar(max) null,
  getnimi nvarchar(max) null,
  kuvaus nvarchar(max) null,
  julkaisunOrgTunnus nvarchar(max) null,
  julkaisunNimi nvarchar(max) null,
  julkaisutyyppikoodi nvarchar(max) null,
  koodi nvarchar(max) null,
  virheviesti nvarchar(max) null,
  virheraporttiID bigint null,
  tila int null,
  tarkistusID int null,

 CONSTRAINT PK__sa_virta_jtp_latausraportit_virheet PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.sa_virta_jtp_latausraportit_virheet ADD  CONSTRAINT DF__sa_virta_jtp_latausraportit_virheet__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_jtp_latausraportit_virheet ADD  CONSTRAINT DF__sa_virta_jtp_latausraportit_virheet__username  DEFAULT (suser_name()) FOR username
;

END
