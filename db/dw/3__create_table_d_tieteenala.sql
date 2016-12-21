IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='d_tieteenala') BEGIN

CREATE TABLE dbo.d_tieteenala(
	id int IDENTITY(0,1) NOT NULL,

  tieteenala_koodi varchar(4) NOT NULL,
	tieteenala_nimi_fi nvarchar(200) NOT NULL,
	tieteenala_nimi_sv nvarchar(200) NOT NULL,
	tieteenala_nimi_en nvarchar(200) NOT NULL,
  paatieteenala_koodi varchar(2) NOT NULL,
	paatieteenala_nimi_fi nvarchar(200) NOT NULL,
	paatieteenala_nimi_sv nvarchar(200) NOT NULL,
	paatieteenala_nimi_en nvarchar(200) NOT NULL,

  startdate date NULL,
	enddate date NULL,

	loadtime datetime NOT NULL,
	source varchar(100) NOT NULL,
	username varchar(30) NOT NULL,
 CONSTRAINT PK__d_tieteenala PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.d_tieteenala ADD  CONSTRAINT DF__d_tieteenala__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.d_tieteenala ADD  CONSTRAINT DF__d_tieteenala__username  DEFAULT (suser_sname()) FOR username
;

END
