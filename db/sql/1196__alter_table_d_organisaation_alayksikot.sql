
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
