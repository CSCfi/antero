IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='d_alueluokitus') BEGIN

CREATE TABLE dbo.d_alueluokitus(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,

  alueluokitus_avain varchar(50) NOT NULL,
  kunta_koodi varchar(3) NOT NULL,
  kunta_fi nvarchar(200) NOT NULL,
  kunta_sv nvarchar(200) NOT NULL,
  kunta_en nvarchar(200) NOT NULL,
  maakunta_koodi varchar(2) NULL,
  maakunta_fi nvarchar(200) NULL,
  maakunta_sv nvarchar(200) NULL,
  maakunta_en nvarchar(200) NULL,
)
;
ALTER TABLE dbo.d_alueluokitus ADD  CONSTRAINT PK__d_alueluokitus PRIMARY KEY CLUSTERED (id ASC)

ALTER TABLE dbo.d_alueluokitus ADD  CONSTRAINT DF__d_alueluokitus__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.d_alueluokitus ADD  CONSTRAINT DF__d_alueluokitus__username  DEFAULT (suser_sname()) FOR username
;

END
