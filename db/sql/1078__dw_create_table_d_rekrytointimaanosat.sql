IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_rekrytointi_maanosat') BEGIN

CREATE TABLE dw.d_rekrytointi_maanosat(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  rekrytointi_maanosat_koodi varchar(5) not null,
  rekrytointi_maanosat_fi nvarchar(100) not null,
  rekrytointi_maanosat_sv nvarchar(100) not null,
  rekrytointi_maanosat_en nvarchar(100) not null,
  maanosat0_koodi nvarchar(100) not null,
  maanosat0_fi,nvarchar(100) not null,
  maanosat0_sv nvarchar(100) not null,
  maanosat0_en nvarchar(100) not null,
  maanosat_koodi nvarchar(100) not null,
  maanosat_fi,nvarchar(100) not null,
  maanosat_sv nvarchar(100) not null,
  maanosat_en nvarchar(100) not null,

 CONSTRAINT PK__d_rekrytointi_maanosat PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dw.d_rekrytointi_maanosat ADD  CONSTRAINT DF__d_rekrytointi_maanosat__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_rekrytointi_maanosat ADD  CONSTRAINT DF__d_rekrytointi_maanosat__username  DEFAULT (suser_sname()) FOR username
;
END
