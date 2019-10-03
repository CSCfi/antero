IF EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA='dw' and TABLE_NAME='d_julkaisufoorumitaso' and COLUMN_NAME='julkaisufoorumitaso') BEGIN
EXECUTE sp_rename N'dw.d_julkaisufoorumitaso.julkaisufoorumitaso', N'julkaisufoorumitaso_fi', 'COLUMN'
END

IF EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA='dw' and TABLE_NAME='d_julkaisun_kansainvalisyys' and COLUMN_NAME='julkaisun_kansainvalisyys') BEGIN
EXECUTE sp_rename N'dw.d_julkaisun_kansainvalisyys.julkaisun_kansainvalisyys', N'julkaisun_kansainvalisyys_fi', 'COLUMN'
END

IF EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA='dw' and TABLE_NAME='d_kansainvalinen_yhteisjulkaisu' and COLUMN_NAME='kansainvalinen_yhteisjulkaisu') BEGIN
EXECUTE sp_rename N'dw.d_kansainvalinen_yhteisjulkaisu.kansainvalinen_yhteisjulkaisu', N'kansainvalinen_yhteisjulkaisu_fi', 'COLUMN'
END

IF EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA='dw' and TABLE_NAME='d_organisaatio' and COLUMN_NAME='organisaatio') BEGIN
EXECUTE sp_rename N'dw.d_organisaatio.organisaatio', N'organisaatio_fi', 'COLUMN'
END
