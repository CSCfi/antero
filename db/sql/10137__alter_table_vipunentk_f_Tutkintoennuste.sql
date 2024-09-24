USE [VipunenTK]

GO

ALTER TABLE [VipunenTK].[dbo].[f_Tutkintoennuste]
ADD lapaisseet INT NULL
ALTER TABLE [VipunenTK].[dbo].[f_Tutkintoennuste]
ADD lapaisseet_ja_keskeyttaneet INT NULL
ALTER TABLE [VipunenTK].[dbo].[f_Tutkintoennuste]
ADD laskentalogiikka VARCHAR(50) NULL

GO

USE [ANTERO]