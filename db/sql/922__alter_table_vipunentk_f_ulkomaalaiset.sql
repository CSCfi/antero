USE [VipunenTK]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15' AND COLUMN_NAME='hallinnonala2_id')

BEGIN
ALTER TABLE [dbo].[f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15]
ADD hallinnonala2_id int
END

GO
USE [ANTERO]