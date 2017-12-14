IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_nimitystapa') BEGIN

CREATE TABLE dw.d_nimitystapa(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  nimitystapa_koodi varchar(5) not null,
  nimitystapa_fi nvarchar(100) not null,
  nimitystapa_sv nvarchar(100) not null,
  nimitystapa_en nvarchar(100) not null,
 CONSTRAINT PK__d_nimitystapa PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dw.d_nimitystapa ADD  CONSTRAINT DF__d_nimitystapa__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_nimitystapa ADD  CONSTRAINT DF__d_nimitystapa__username  DEFAULT (suser_sname()) FOR username
;
END
