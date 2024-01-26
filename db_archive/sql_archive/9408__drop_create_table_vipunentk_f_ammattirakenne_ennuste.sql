USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_ammattirakenne_ennuste]    Script Date: 15.12.2023 10:47:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_ammattirakenne_ennuste]') AND type in (N'U'))
DROP TABLE [dbo].[f_ammattirakenne_ennuste]
GO

/****** Object:  Table [dbo].[f_ammattirakenne_ennuste]    Script Date: 15.12.2023 10:47:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_ammattirakenne_ennuste](
	[tilv] [nvarchar](4) NULL,
	[ika] [bigint] NULL,
	[oef_ammatti_id] [int] NULL,
	[oef_toimiala_id] [int] NULL,
	[lkm] [int] NULL,
	[vieraskieliset_lkm] [int] NULL
) ON [PRIMARY]
GO

USE [ANTERO]