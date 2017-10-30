USE [VipunenTK]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]' AND COLUMN_NAME='hallinnonala2_id')

BEGIN
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]
ADD hallinnonala2_id int
END
GO
USE [VipunenTK_DW]
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]' AND COLUMN_NAME='hallinnonala2')

BEGIN
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]
ADD hallinnonala2 nvarchar(2)
END
GO
USE [ANTERO]
