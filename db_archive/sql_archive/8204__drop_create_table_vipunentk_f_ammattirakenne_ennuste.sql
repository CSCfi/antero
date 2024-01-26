USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_ammattirakenne_ennuste]    Script Date: 17.10.2023 9:13:08 ******/
DROP TABLE [dbo].[f_ammattirakenne_ennuste]
GO

/****** Object:  Table [dbo].[f_ammattirakenne_ennuste]    Script Date: 17.10.2023 9:13:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_ammattirakenne_ennuste](
	[tilv] [nvarchar](4) NULL,
	[ika] [bigint] NULL,
	[mitenna_ammatti_id] [int] NULL,
	[mitenna_toimiala_id] [int] NULL,
	[lkm] [int] NULL,
	[vieraskieliset_lkm] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]