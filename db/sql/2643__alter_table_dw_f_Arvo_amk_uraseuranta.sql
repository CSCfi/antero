USE [ANTERO]

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_arvo_amk_uraseuranta'
  and COLUMN_NAME ='tilastovuosi'
) BEGIN

ALTER TABLE dw.f_arvo_amk_uraseuranta ADD "tilastovuosi" int
END