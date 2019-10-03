
USE [ANTERO]
IF EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_paayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaation_alayksikot drop column jarjestys_paayksikko_koodi
END

IF  EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='paayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaation_alayksikot drop column paayksikko_koodi
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='paayksikko_koodi')

BEGIN
ALTER TABLE [dw].[d_organisaation_alayksikot]
ADD paayksikko_koodi varchar(100) null
END


IF  EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_alayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaation_alayksikot drop column jarjestys_alayksikko_koodi
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_alayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaation_alayksikot ADD jarjestys_alayksikko_koodi AS case when alayksikko_koodi = '-1' then 'ZZZ' else cast(alayksikko_koodi as varchar(10))
  END
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_paayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaation_alayksikot ADD jarjestys_paayksikko_koodi AS case when paayksikko_koodi = '-1' then 'ZZZ' else cast(paayksikko_koodi as varchar(10))
  END
END
