IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='tabularprocess'
  and COLUMN_NAME='ready'
  and DATA_TYPE='bit'
) BEGIN
--nb! remenber to drop constraint first
ALTER TABLE dbo.tabularprocess DROP CONSTRAINT DF__tabularprocess__ready
ALTER TABLE dbo.tabularprocess ALTER COLUMN ready int not null
ALTER TABLE dbo.tabularprocess ADD CONSTRAINT DF__tabularprocess__ready  DEFAULT ((0)) FOR ready
END
