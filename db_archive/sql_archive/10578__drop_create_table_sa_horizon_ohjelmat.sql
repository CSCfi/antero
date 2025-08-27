USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_horizon_ohjelmat]    Script Date: 17.2.2025 15.34.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_horizon_ohjelmat]') AND type in (N'U'))
DROP TABLE [sa].[sa_horizon_ohjelmat]
GO

/****** Object:  Table [sa].[sa_horizon_ohjelmat]    Script Date: 17.2.2025 15.34.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_horizon_ohjelmat](
	[programme_id] [varchar](50) NULL,
	[title] [varchar](max) NULL,
	[shortTitle] [varchar](max) NULL,
	[rcn] [varchar](2000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE [ANTERO]