IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_oppilaitosluokitus') BEGIN

CREATE TABLE dbo.sa_oppilaitosluokitus(
	id bigint IDENTITY(1,1) NOT NULL,
	oid nvarchar(200) NULL,
	koodi nvarchar(200) NULL,
	nimi nvarchar(200) NULL,
	nimi_sv nvarchar(200) NULL,
	nimi_en nvarchar(200) NULL,
	alkupvm nvarchar(200) NULL,
	loppupvm nvarchar(200) NULL,
	kuntakoodi nvarchar(200) NULL,
	oppilaitostyyppikoodi nvarchar(200) NULL,
	jarjestajaoid nvarchar(200) NULL,
	jarjestajakoodi nvarchar(200) NULL,
	jarjestajanimi nvarchar(200) NULL,
	jarjestajanimi_sv nvarchar(200) NULL,
	jarjestajanimi_en nvarchar(200) NULL,
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_oppilaitosluokitus PRIMARY KEY CLUSTERED 
(
	id ASC
)
)
;

ALTER TABLE dbo.sa_oppilaitosluokitus ADD  CONSTRAINT DF__sa_oppilaitosluokitus__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_oppilaitosluokitus ADD  CONSTRAINT DF__sa_oppilaitosluokitus__username  DEFAULT (suser_name()) FOR username
;

END
