IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_yhteisjulkaisut_ristiriitaiset') BEGIN

CREATE TABLE sa.sa_virta_jtp_yhteisjulkaisut_ristiriitaiset(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,

  rrID bigint null,
  yhteisjulkaisunTunnus nvarchar(max) null,
  julkaisunTunnus nvarchar(max) null,
  organisaatioNimi nvarchar(max) null,
  organisaatioTunnus nvarchar(max) null,
  julkaisuVuosi int null,
  ilmoitusVuosi int null,
  julkaisunNimi nvarchar(max) null,
  julkaisutyyppi nvarchar(max) null,
  julkaisunOrgTunnus nvarchar(max) null,

 CONSTRAINT PK__sa_virta_jtp_yhteisjulkaisut_ristiriitaiset PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_jtp_yhteisjulkaisut_ristiriitaiset ADD  CONSTRAINT DF__sa_virta_jtp_yhteisjulkaisut_ristiriitaiset__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_jtp_yhteisjulkaisut_ristiriitaiset ADD  CONSTRAINT DF__sa_virta_jtp_yhteisjulkaisut_ristiriitaiset__username  DEFAULT (suser_name()) FOR username
;

END
