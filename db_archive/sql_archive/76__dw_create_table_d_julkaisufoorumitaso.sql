IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_julkaisufoorumitaso') BEGIN

CREATE TABLE dw.d_julkaisufoorumitaso(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  username nvarchar(128) NOT NULL,
  source nvarchar(255) NULL,

  julkaisufoorumitaso_koodi varchar(100) NULL,
  julkaisufoorumitaso nvarchar(255) NULL,
  julkaisufoorumitaso_sv nvarchar(255) NULL,
  julkaisufoorumitaso_en nvarchar(255) NULL,
)
;

ALTER TABLE dw.d_julkaisufoorumitaso ADD  CONSTRAINT PK__d_julkaisufoorumitaso PRIMARY KEY CLUSTERED (id ASC)
;

ALTER TABLE dw.d_julkaisufoorumitaso ADD  CONSTRAINT DF__d_julkaisufoorumitaso__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_julkaisufoorumitaso ADD  CONSTRAINT DF__d_julkaisufoorumitaso__username  DEFAULT (suser_name()) FOR username
;

END
