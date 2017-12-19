USE [ANTERO]
GO
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_arvovastaus') BEGIN

CREATE TABLE dw.d_arvovastaus (
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source nvarchar(100) NOT NULL,
  username nvarchar(30) NOT NULL,
  vuosi   nvarchar(5) NOT NULL,
  vastaus_koodi nvarchar(5) NOT NULL,
  vastaus_fi nvarchar(100) NOT NULL,
  vastaus_sv nvarchar(100) NOT NULL,
  vastaus_en nvarchar(100) NOT NULL,
  kysymysryhmaid nvarchar(100) NOT NULL,
  vastaustyyppi nvarchar(100) NOT NULL,

 CONSTRAINT PK__d_arvovastaus PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dw.d_arvovastaus ADD  CONSTRAINT DF__d_arvovastaus__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_arvovastaus ADD  CONSTRAINT DF__d_arvovastaus__username  DEFAULT (suser_sname()) FOR username
;
END
