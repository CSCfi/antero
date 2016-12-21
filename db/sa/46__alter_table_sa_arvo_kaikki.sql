IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_arvo_kaikki'
  and COLUMN_NAME='kysely_en'
) BEGIN
ALTER TABLE dbo.sa_arvo_kaikki ADD
	kysely_en nvarchar(MAX) NULL,
	kysymysryhma_en nvarchar(MAX) NULL,
	kysymys_en nvarchar(MAX) NULL,
	kunta nchar(10) NULL,
	tunnus nchar(10) NULL,
	koulutusmuoto nchar(10) NULL,
	opintoala_en nvarchar(MAX) NULL,
	valmistavan_koulutuksen_oppilaitos_en nvarchar(MAX) NULL,
	koulutustoimija_en nvarchar(MAX) NULL,
	valmistavan_koulutuksen_jarjestaja_en nvarchar(MAX) NULL,
	tutkinto_en nvarchar(MAX) NULL
END
