IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_virtajtpsektori') BEGIN

CREATE TABLE dw.d_virtajtpsektori(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,

  virtajtpsektori_koodi varchar(4) NOT NULL,
  virtajtpsektori_fi nvarchar(200) NOT NULL,
  virtajtpsektori_sv nvarchar(200) NOT NULL,
  virtajtpsektori_en nvarchar(200) NOT NULL,
)
;
ALTER TABLE dw.d_virtajtpsektori ADD  CONSTRAINT PK__d_virtajtpsektori PRIMARY KEY CLUSTERED (id ASC)

ALTER TABLE dw.d_virtajtpsektori ADD  CONSTRAINT DF__d_virtajtpsektori__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_virtajtpsektori ADD  CONSTRAINT DF__d_virtajtpsektori__username  DEFAULT (suser_sname()) FOR username
;

END
