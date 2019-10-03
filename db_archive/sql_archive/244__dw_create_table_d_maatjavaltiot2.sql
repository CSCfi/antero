IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_maatjavaltiot2') BEGIN

CREATE TABLE dw.d_maatjavaltiot2(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  maatjavaltiot2_koodi varchar(5) not null,
  maatjavaltiot2_fi nvarchar(100) not null,
  maatjavaltiot2_sv nvarchar(100) not null,
  maatjavaltiot2_en nvarchar(100) not null,
 CONSTRAINT PK__d_maatjavaltiot2 PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dw.d_maatjavaltiot2 ADD  CONSTRAINT DF__d_maatjavaltiot2__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_maatjavaltiot2 ADD  CONSTRAINT DF__d_maatjavaltiot2__username  DEFAULT (suser_sname()) FOR username
;
END
