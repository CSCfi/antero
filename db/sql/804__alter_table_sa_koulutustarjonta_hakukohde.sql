IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='koulutustarjonta_hakukohde'
  and COLUMN_NAME='hakukohdeKoulutusOids'
) BEGIN


ALTER TABLE sa.koulutustarjonta_hakukohde ADD  hakukohdeKoulutusOids nvarchar(max) null
;

--;
END
