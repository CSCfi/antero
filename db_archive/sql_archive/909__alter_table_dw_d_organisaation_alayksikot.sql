USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_alayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaation_alayksikot ADD jarjestys_alayksikko_koodi AS case when alayksikko_koodi = '-1' then '99999' else cast(alayksikko_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_korkeakoulu_koodi')

BEGIN
	ALTER TABLE dw.d_organisaation_alayksikot ADD jarjestys_korkeakoulu_koodi AS case when korkeakoulu_koodi = '-1' then '99999' else cast(korkeakoulu_koodi as varchar(10))
  END
END
