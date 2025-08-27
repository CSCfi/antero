USE [ANTERO]
GO

/****** Object:  Table [dbo].[tabular_roles]    Script Date: 15.1.2025 13.13.47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tabular_roles]') AND type in (N'U'))
DROP TABLE [dbo].[tabular_roles]
GO

/****** Object:  Table [dbo].[tabular_roles]    Script Date: 15.1.2025 13.13.47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tabular_roles](
	[Tabular] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](255) NULL,
	[Member] [nvarchar](255) NULL
) ON [PRIMARY]
GO


