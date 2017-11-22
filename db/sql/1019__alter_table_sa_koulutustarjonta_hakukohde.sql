IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='koulutustarjonta_hakukohde'
  and COLUMN_NAME='hakukohteenNimet'
) BEGIN


ALTER TABLE sa.koulutustarjonta_hakukohde ADD  hakukohteenNimet nvarchar(max) null
;

--;
END
