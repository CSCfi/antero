USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[oef_ammattit_palkat]    Script Date: 26.1.2026 8.37.25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oef_ammatit_palkat]') AND type in (N'U'))
DROP TABLE [dbo].[oef_ammatit_palkat]
GO

/****** Object:  Table [dbo].[oef_ammattit_palkat]    Script Date: 26.1.2026 8.37.25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[oef_ammatit_palkat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oef_ammattiryhma2_koodi] [nvarchar](20) NULL,
	[palkka] [float] NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]