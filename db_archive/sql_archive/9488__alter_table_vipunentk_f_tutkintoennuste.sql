USE [VipunenTK]

GO

ALTER TABLE [VipunenTK].[dbo].[f_Tutkintoennuste]
ADD tutkinnot int
ALTER TABLE [VipunenTK].[dbo].[f_Tutkintoennuste]
ADD ika2 int

GO

USE [ANTERO]