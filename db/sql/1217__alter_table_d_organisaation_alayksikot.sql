USE [ANTERO]
IF EXISTS (
 SELECT * FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_paayksikko_koodi')

BEGIN
 ALTER TABLE dw.d_organisaation_alayksikot drop column jarjestys_paayksikko_koodi
END

IF  EXISTS (
 SELECT * FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_alayksikko_koodi')

BEGIN
 ALTER TABLE dw.d_organisaation_alayksikot drop column jarjestys_alayksikko_koodi
END
IF  EXISTS (
 SELECT * FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_korkeakoulu_koodi')

BEGIN
 ALTER TABLE dw.d_organisaation_alayksikot drop column jarjestys_korkeakoulu_koodi
END
IF  EXISTS (
 SELECT * FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='korkeakoulu_koodi')

BEGIN
 ALTER TABLE dw.d_organisaation_alayksikot ALTER COLUMN [Korkeakoulu_koodi] [nvarchar](10) NULL
END
IF  EXISTS (
 SELECT * FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='Paayksikko_koodi')

BEGIN
 ALTER TABLE dw.d_organisaation_alayksikot ALTER COLUMN [Paayksikko_koodi] [nvarchar](100) NULL
END


IF  EXISTS (
 SELECT * FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='Alayksikko_koodi')

BEGIN
 ALTER TABLE dw.d_organisaation_alayksikot ALTER COLUMN   	[Alayksikko_koodi] [nvarchar](100) NULL
END


IF  EXISTS (
 SELECT * FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='Alayksikko_nimi')

BEGIN
 ALTER TABLE dw.d_organisaation_alayksikot ALTER COLUMN   	[Alayksikko_nimi] [nvarchar](100) NULL
END
