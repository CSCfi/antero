IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_liikkuvuusohjelma') BEGIN

CREATE TABLE dw.d_liikkuvuusohjelma(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  liikkuvuusohjelma_koodi varchar(5) not null,
  liikkuvuusohjelma_fi nvarchar(100) not null,
  liikkuvuusohjelma_sv nvarchar(100) not null,
  liikkuvuusohjelma_en nvarchar(100) not null,
 CONSTRAINT PK__d_liikkuvuusohjelma PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dw.d_liikkuvuusohjelma ADD  CONSTRAINT DF__d_liikkuvuusohjelma__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_liikkuvuusohjelma ADD  CONSTRAINT DF__d_liikkuvuusohjelma__username  DEFAULT (suser_sname()) FOR username
;
END
