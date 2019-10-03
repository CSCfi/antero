IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_kieli') BEGIN

CREATE TABLE dw.d_kieli(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,

  kieli_koodi varchar(2) NULL,
  kieli_fi nvarchar(100) NULL,
  kieli_sv nvarchar(100) NULL,
  kieli_en nvarchar(100) NULL,
)
;

ALTER TABLE dw.d_kieli ADD  CONSTRAINT PK__d_kieli PRIMARY KEY CLUSTERED (id ASC)
;

ALTER TABLE dw.d_kieli ADD  CONSTRAINT DF__d_kieli__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_kieli ADD  CONSTRAINT DF__d_kieli__username  DEFAULT (suser_name()) FOR username
;

END
