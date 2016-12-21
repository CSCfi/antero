IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_alueluokitus') BEGIN

CREATE TABLE dbo.sa_alueluokitus(
	id bigint IDENTITY(1,1) NOT NULL,
	koodi nvarchar(3) NOT NULL,
	nimi nvarchar(200) NULL,
	nimi_sv nvarchar(200) NULL,
	nimi_en nvarchar(200) NULL,
	alkupvm date NULL,
	loppupvm date NULL,
	maakuntakoodi nvarchar(3) NULL,
	maakuntanimi nvarchar(200) NULL,
	maakuntanimi_sv nvarchar(200) NULL,
	maakuntanimi_en nvarchar(200) NULL,
	avikoodi nvarchar(2) NULL,
	avinimi nvarchar(200) NULL,
	avinimi_sv nvarchar(200) NULL,
	avinimi_en nvarchar(200) NULL,
	elykoodi nvarchar(2) NULL,
	elynimi nvarchar(200) NULL,
	elynimi_sv nvarchar(200) NULL,
	elynimi_en nvarchar(200) NULL,
	kielisuhdekoodi nvarchar(2) NULL,
	kielisuhdenimi nvarchar(200) NULL,
	kielisuhdenimi_sv nvarchar(200) NULL,
	kielisuhdenimi_en nvarchar(200) NULL,
	seutukuntakoodi nvarchar(3) NULL,
	seutukuntanimi nvarchar(200) NULL,
	seutukuntanimi_sv nvarchar(200) NULL,
	seutukuntanimi_en nvarchar(200) NULL,
	laanikoodi nvarchar(2) NULL,
	laaninimi nvarchar(200) NULL,
	laaninimi_sv nvarchar(200) NULL,
	laaninimi_en nvarchar(200) NULL,
	kuntaryhmakoodi nvarchar(2) NULL,
	kuntaryhmanimi nvarchar(200) NULL,
	kuntaryhmanimi_sv nvarchar(200) NULL,
	kuntaryhmanimi_en nvarchar(200) NULL,
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_alueluokitus PRIMARY KEY CLUSTERED 
(
	id ASC
)
)
;

ALTER TABLE dbo.sa_alueluokitus ADD  CONSTRAINT DF__sa_alueluokitus__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_alueluokitus ADD  CONSTRAINT DF__sa_alueluokitus__username  DEFAULT (suser_name()) FOR username
;

END
