USE [VipunenTK]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat' AND COLUMN_NAME='hallinnonala2_id')

BEGIN
ALTER TABLE [dbo].[f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]
ADD hallinnonala2_id int
END
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot' AND COLUMN_NAME='hallinnonala2_id')

BEGIN
ALTER TABLE [dbo].[f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot]
ADD hallinnonala2_id int
END
GO
USE [ANTERO]
