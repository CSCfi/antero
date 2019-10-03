IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='koulutustarjonta_koulutus'
  and COLUMN_NAME='koulutuskoodi_arvo'
) BEGIN

ALTER TABLE sa.koulutustarjonta_koulutus ADD  koulutuskoodi_arvo nvarchar(max) null
;

--;
END

IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='koulutustarjonta_koulutus'
  and  COLUMN_NAME='koulutuskoodi_nimi'
) BEGIN

ALTER TABLE sa.koulutustarjonta_koulutus ADD  koulutuskoodi_nimi nvarchar(max) null
;

--;
END
