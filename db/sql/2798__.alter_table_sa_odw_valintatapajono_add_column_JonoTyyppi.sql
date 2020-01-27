USE ANTERO
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_odw_valintatapajono'
  and COLUMN_NAME ='JonoTyyppi'
) BEGIN

ALTER TABLE [ANTERO].[sa].[sa_odw_valintatapajono] ADD [JonoTyyppi] [nvarchar](255) NULL

END