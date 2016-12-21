IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_arvo_valtakunnallinen') BEGIN

CREATE TABLE dbo.sa_arvo_valtakunnallinen(
	id bigint IDENTITY(1,1) NOT NULL,
	koulutustoimija nvarchar(max) NULL,
	vastausid int NULL,
	kyselykertaid int NULL,
	suorituskieli nvarchar(max) NULL,
	tutkinto_fi nvarchar(max) NULL,
	tutkintotunnus nvarchar(max) NULL,
	taustakysymys_ika nvarchar(max) NULL,
	valmistavan_koulutuksen_oppilaitos_sv nvarchar(max) NULL,
	kysymys_sv nvarchar(max) NULL,
	opintoala_sv nvarchar(max) NULL,
	monivalintavaihtoehto nvarchar(max) NULL,
	kysymysid int NULL,
	valmistavan_koulutuksen_oppilaitos_fi nvarchar(max) NULL,
	vastaustyyppi nvarchar(max) NULL,
	tutkinto_sv nvarchar(max) NULL,
	kysymysryhmaid int NULL,
	vaihtoehto nvarchar(max) NULL,
	opintoala_fi nvarchar(max) NULL,
	kysymys_fi nvarchar(max) NULL,
	vastaajaid int NULL,
	numerovalinta int NULL,
	kyselyid int NULL,
	valmistavan_koulutuksen_jarjestaja_fi nvarchar(max) NULL,
	kysely_sv nvarchar(max) NULL,
	kysymysryhma_fi nvarchar(max) NULL,
	opintoalatunnus nvarchar(max) NULL,
	valmistavan_koulutuksen_jarjestaja_sv nvarchar(max) NULL,
	vastausaika nvarchar(max) NULL,
	taustakysymys_pohjakoulutus nvarchar(max) NULL,
	valmistavan_koulutuksen_jarjestaja nvarchar(max) NULL,
	koulutustoimija_fi nvarchar(max) NULL,
	kyselykerta nvarchar(max) NULL,
	taustakysymys_sukupuoli nvarchar(max) NULL,
	valtakunnallinen bit NULL,
	rahoitusmuoto nvarchar(max) NULL,
	kysymysryhma_sv nvarchar(max) NULL,
	valmistavan_koulutuksen_oppilaitos nvarchar(max) NULL,
	kysely_fi nvarchar(max) NULL,
	koulutustoimija_sv nvarchar(max) NULL,
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_arvo_valtakunnallinen PRIMARY KEY CLUSTERED 
(
	id ASC
)
)
;

ALTER TABLE dbo.sa_arvo_valtakunnallinen ADD  CONSTRAINT DF__sa_arvo_valtakunnallinen__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_arvo_valtakunnallinen ADD  CONSTRAINT DF__sa_arvo_valtakunnallinen__username  DEFAULT (suser_name()) FOR username
;

END
