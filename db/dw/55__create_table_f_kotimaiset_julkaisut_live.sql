IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='f_kotimaiset_julkaisut_live') BEGIN

CREATE TABLE dbo.f_kotimaiset_julkaisut_live(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  username varchar(30) NOT NULL,
  source varchar(100) NOT NULL,

  tilastovuosi int not null,
  d_organisaatio_id int not null,
  d_julkaisutyyppi_id int not null,

  julkaisunTunnus nvarchar(30) NULL,
	julkaisunNimi nvarchar(500) NULL,
	tekijat nvarchar(1000) NULL,
	lehdenNimi nvarchar(300) NULL,
	kustantajanNimi nvarchar(300) NULL,
	isbn nvarchar(100) NULL,
	issn nvarchar(100) NULL,
	julkaisunTila int NULL,
	doi nvarchar(200) NULL,
	julkaisunOrgTunnus nvarchar(50) NULL,
	yhteisJulkaisunTunnus nvarchar(20) NULL,
	jufoTunnus nvarchar(10) NULL,
	ilmoitusVuosi int NULL,
	muutospvm varchar(50) NULL,
	luontipvm varchar(50) NULL,

  lukumaara int not null
)
;

ALTER TABLE dbo.f_kotimaiset_julkaisut_live ADD  CONSTRAINT PK__f_kotimaiset_julkaisut_live PRIMARY KEY CLUSTERED (id ASC)
;

ALTER TABLE dbo.f_kotimaiset_julkaisut_live ADD  CONSTRAINT DF__f_kotimaiset_julkaisut_live__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.f_kotimaiset_julkaisut_live ADD  CONSTRAINT DF__f_kotimaiset_julkaisut_live__username  DEFAULT (suser_sname()) FOR username
;

-- foreign keys
-- TODO

END
