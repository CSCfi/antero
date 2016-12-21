IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_oiva_valos') BEGIN

CREATE TABLE dbo.sa_oiva_valos(
	id bigint IDENTITY(1,1) NOT NULL,
	erit_valma bit NULL,
	jarjestaja nvarchar(255) NULL,
	sisaoppilaitos bit NULL,
	koulutusala6 bit NULL,
	koulutusala7 bit NULL,
	koulutusala4 bit NULL,
	koulutusala5 bit NULL,
	koulutusala2 bit NULL,
	koulutusala3 bit NULL,
	koulutusala1 bit NULL,
	erit_tutkinto bit NULL,
	vuosiopiskelijamaara_kuluvav int NULL,
	erit_telma bit NULL,
	koulutusala8 bit NULL,
	sisaoppilaitos_vuosiopiskelijamaara_kuluvav int NULL,
	sisaoppilaitos_vuosiopiskelijamaara_tulevav int NULL,
	erit_vuosiopiskelijamaara_kuluvav int NULL,
	valma bit NULL,
	kotipaikka nvarchar(255) NULL,
	erit_vuosiopiskelijamaara_tulevav int NULL,
	ytunnus nvarchar(255) NULL,
	vuosiopiskelijamaara_tulevav int NULL,
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_oiva_valos PRIMARY KEY CLUSTERED 
(
	id ASC
)
)
;

ALTER TABLE dbo.sa_oiva_valos ADD  CONSTRAINT DF__sa_oiva_valos__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_oiva_valos ADD  CONSTRAINT DF__sa_oiva_valos__username  DEFAULT (suser_name()) FOR username
;

END
