IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_latausraportit_duplikaatit'
) BEGIN

CREATE TABLE sa.sa_virta_jtp_latausraportit_duplikaatit(
  id bigint IDENTITY(1,1) NOT NULL,

  duplikaattiID int null,
  organisaatiotunnus nvarchar(50) null,
  organisaationimi nvarchar(max) null,
  kuvaus nvarchar(max) null,
  julkaisunorgtunnus nvarchar(50) null,
  duplikaattijulkaisunorgtunnus nvarchar(50) null,
  julkaisunnimi nvarchar(max) null,
  duplikaattijulkaisunnimi nvarchar(max) null,
  julkaisutyyppikoodi varchar(4) null,
  tila int null,
  tarkistusID int null,
  luontipaivamaara varchar(50) null,
  ilmoitusvuosi int null,
  julkaisuvuosi int null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_jtp_latausraportit_duplikaatit PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_jtp_latausraportit_duplikaatit ADD  CONSTRAINT DF__sa_virta_jtp_latausraportit_duplikaatit__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_jtp_latausraportit_duplikaatit ADD  CONSTRAINT DF__sa_virta_jtp_latausraportit_duplikaatit__username  DEFAULT (suser_name()) FOR username
;

END
