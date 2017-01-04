IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_arvo_kaikki'
  and COLUMN_NAME='taustakysymykset'
) BEGIN
ALTER TABLE dbo.sa_arvo_kaikki ADD
  taustakysymykset bit NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_arvo_kaikki'
  and COLUMN_NAME='taustakysymys_ika'
) BEGIN
ALTER TABLE dbo.sa_arvo_kaikki DROP COLUMN
  taustakysymys_ika
END
IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_arvo_kaikki'
  and COLUMN_NAME='taustakysymys_sukupuoli'
) BEGIN
ALTER TABLE dbo.sa_arvo_kaikki DROP COLUMN
  taustakysymys_sukupuoli
END
IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_arvo_kaikki'
  and COLUMN_NAME='taustakysymys_pohjakoulutus'
) BEGIN
ALTER TABLE dbo.sa_arvo_kaikki DROP COLUMN
  taustakysymys_pohjakoulutus
END
