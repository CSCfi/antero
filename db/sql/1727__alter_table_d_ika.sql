IF NOT EXISTS(SELECT *
          FROM   INFORMATION_SCHEMA.COLUMNS
          WHERE  TABLE_NAME = 'd_ika'
                 AND COLUMN_NAME = 'ikaryhma3_fi')
BEGIN
alter table ANTERO.[dw].[d_ika]
add ikaryhma3_fi varchar(100)
END

IF NOT EXISTS(SELECT *
          FROM   INFORMATION_SCHEMA.COLUMNS
          WHERE  TABLE_NAME = 'd_ika'
                 AND COLUMN_NAME = 'ikaryhma3_sv')
BEGIN
alter table ANTERO.[dw].[d_ika]
add ikaryhma3_sv varchar(100)
END

IF NOT EXISTS(SELECT *
          FROM   INFORMATION_SCHEMA.COLUMNS
          WHERE  TABLE_NAME = 'd_ika'
                 AND COLUMN_NAME = 'ikaryhma3_en')
BEGIN
alter table ANTERO.[dw].[d_ika]
add ikaryhma3_en varchar(100)
END

IF NOT EXISTS(SELECT *
          FROM   INFORMATION_SCHEMA.COLUMNS
          WHERE  TABLE_NAME = 'd_ika'
                 AND COLUMN_NAME = 'jarjestys_ikaryhma3')
BEGIN
alter table ANTERO.[dw].[d_ika]
add jarjestys_ikaryhma3 varchar(100)
END
