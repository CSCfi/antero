IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='d_organisaatio') BEGIN

CREATE TABLE dbo.d_organisaatio(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  username nvarchar(128) NOT NULL,
  source nvarchar(255) NULL,

  organisaatio_avain varchar(50) NOT NULL,
  organisaatio_koodi varchar(20) NULL,
  organisaatio nvarchar(255) NULL,
  organisaatio_sv nvarchar(255) NULL,
  organisaatio_en nvarchar(255) NULL,
)
;

ALTER TABLE dbo.d_organisaatio ADD  CONSTRAINT PK__d_organisaatio PRIMARY KEY CLUSTERED (id ASC)
;

ALTER TABLE dbo.d_organisaatio ADD  CONSTRAINT DF__d_organisaatio__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.d_organisaatio ADD  CONSTRAINT DF__d_organisaatio__username  DEFAULT (suser_name()) FOR username
;

ALTER TABLE dbo.d_organisaatio ADD  CONSTRAINT AK__organisaatio_avain UNIQUE (organisaatio_avain);
;

END
