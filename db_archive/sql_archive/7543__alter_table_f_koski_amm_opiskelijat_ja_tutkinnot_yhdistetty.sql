USE [ANTERO]
GO


IF COL_LENGTH('ANTERO.dw.f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty', 'kotikunta_manner_suomessa') IS NULL
BEGIN
	ALTER TABLE [ANTERO].[dw].[f_koski_amm_opiskelijat_ja_tutkinnot_yhdistetty]
	ADD
		[kotikunta_manner_suomessa] INT NULL,
		[oppivelvollinen] INT NULL;
END
GO
USE [ANTERO]