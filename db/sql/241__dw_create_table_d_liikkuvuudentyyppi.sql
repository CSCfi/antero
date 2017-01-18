IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_liikkuvuudentyyppi') BEGIN

CREATE TABLE dw.d_liikkuvuudentyyppi(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  liikkuvuudentyyppi_koodi varchar(5) not null,
  liikkuvuudentyyppi_fi nvarchar(100) not null,
  liikkuvuudentyyppi_sv nvarchar(100) not null,
  liikkuvuudentyyppi_en nvarchar(100) not null,
 CONSTRAINT PK__d_liikkuvuudentyyppi PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dw.d_liikkuvuudentyyppi ADD  CONSTRAINT DF__d_liikkuvuudentyyppi__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_liikkuvuudentyyppi ADD  CONSTRAINT DF__d_liikkuvuudentyyppi__username  DEFAULT (suser_sname()) FOR username
;
END
