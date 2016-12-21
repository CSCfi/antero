IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='d_julkaisun_kansainvalisyys') BEGIN

CREATE TABLE dbo.d_julkaisun_kansainvalisyys(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  username nvarchar(128) NOT NULL,
  source nvarchar(255) NULL,

  julkaisun_kansainvalisyys_koodi varchar(100) NULL,
  julkaisun_kansainvalisyys nvarchar(255) NULL,
  julkaisun_kansainvalisyys_sv nvarchar(255) NULL,
  julkaisun_kansainvalisyys_en nvarchar(255) NULL,
)
;

ALTER TABLE dbo.d_julkaisun_kansainvalisyys ADD  CONSTRAINT PK__d_julkaisun_kansainvalisyys PRIMARY KEY CLUSTERED (id ASC)
;

ALTER TABLE dbo.d_julkaisun_kansainvalisyys ADD  CONSTRAINT DF__d_julkaisun_kansainvalisyys__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.d_julkaisun_kansainvalisyys ADD  CONSTRAINT DF__d_julkaisun_kansainvalisyys__username  DEFAULT (suser_name()) FOR username
;

END
