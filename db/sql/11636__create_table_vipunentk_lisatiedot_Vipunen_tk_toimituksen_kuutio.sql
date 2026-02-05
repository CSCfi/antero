USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[Vipunen_tk_toimituksen_kuutio]    Script Date: 5.2.2026 13.42.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_tk_toimituksen_kuutio]') AND type in (N'U'))
CREATE TABLE [dbo].[Vipunen_tk_toimituksen_kuutio](
	[Kuutio] [nvarchar](250) NULL
) ON [PRIMARY]
GO

