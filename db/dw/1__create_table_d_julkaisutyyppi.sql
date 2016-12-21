IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='d_julkaisutyyppi') BEGIN

CREATE TABLE dbo.d_julkaisutyyppi(
	id int IDENTITY(0,1) NOT NULL,

  julkaisutyyppi_koodi varchar(4) NOT NULL,
	julkaisutyyppi_nimi_fi nvarchar(200) NOT NULL,
	julkaisutyyppi_nimi_sv nvarchar(200) NOT NULL,
	julkaisutyyppi_nimi_en nvarchar(200) NOT NULL,
  julkaisunpaaluokka_koodi varchar(2) NOT NULL,
	julkaisunpaaluokka_nimi_fi nvarchar(200) NOT NULL,
	julkaisunpaaluokka_nimi_sv nvarchar(200) NOT NULL,
	julkaisunpaaluokka_nimi_en nvarchar(200) NOT NULL,

  startdate date NULL,
	enddate date NULL,

	loadtime datetime NOT NULL,
	source varchar(100) NOT NULL,
	username varchar(30) NOT NULL,
 CONSTRAINT PK__d_julkaisutyyppi PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.d_julkaisutyyppi ADD  CONSTRAINT DF__d_julkaisutyyppi__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.d_julkaisutyyppi ADD  CONSTRAINT DF__d_julkaisutyyppi__username  DEFAULT (suser_sname()) FOR username
;

END
