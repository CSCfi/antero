USE [VipunenTK_DW]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='f_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan' AND COLUMN_NAME='hallinnonala2')

BEGIN
ALTER TABLE [dbo].[f_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]
ADD hallinnonala2 nvarchar(2)
END


USE [VipunenTK]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan' AND COLUMN_NAME='hallinnonala2_id')

BEGIN
ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]
ADD hallinnonala2_id int
END
GO
USE [ANTERO]