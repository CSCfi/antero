IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_kansainvalinen_yhteisjulkaisu') BEGIN

CREATE TABLE dw.d_kansainvalinen_yhteisjulkaisu(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  username nvarchar(128) NOT NULL,
  source nvarchar(255) NULL,

  kansainvalinen_yhteisjulkaisu_koodi varchar(100) NULL,
  kansainvalinen_yhteisjulkaisu nvarchar(255) NULL,
  kansainvalinen_yhteisjulkaisu_sv nvarchar(255) NULL,
  kansainvalinen_yhteisjulkaisu_en nvarchar(255) NULL,
)
;

ALTER TABLE dw.d_kansainvalinen_yhteisjulkaisu ADD  CONSTRAINT PK__d_kansainvalinen_yhteisjulkaisu PRIMARY KEY CLUSTERED (id ASC)
;

ALTER TABLE dw.d_kansainvalinen_yhteisjulkaisu ADD  CONSTRAINT DF__d_kansainvalinen_yhteisjulkaisu__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_kansainvalinen_yhteisjulkaisu ADD  CONSTRAINT DF__d_kansainvalinen_yhteisjulkaisu__username  DEFAULT (suser_name()) FOR username
;

END
