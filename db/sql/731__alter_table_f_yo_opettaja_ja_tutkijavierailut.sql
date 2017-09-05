IF EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_opettaja_ja_tutkijavierailut'
and COLUMN_NAME='vierailut_ulkomaille_lkm'
) BEGIN

ALTER TABLE dw.f_yo_opettaja_ja_tutkijavierailut ALTER COLUMN vierailut_ulkomaille_lkm FLOAT;
ALTER TABLE dw.f_yo_opettaja_ja_tutkijavierailut ALTER COLUMN vierailut_ulkomailta_lkm FLOAT;
  
END