USE [ANTERO]
GO

/****** Object:  Table [dw].[d_amos_tase_ja_tunnusluvut]    Script Date: 22.12.2025 8.11.13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_tase_ja_tunnusluvut]') AND type in (N'U'))
DROP TABLE [dw].[d_amos_tase_ja_tunnusluvut]
GO

/****** Object:  Table [dw].[d_amos_tase_ja_tunnusluvut]    Script Date: 22.12.2025 8.11.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_amos_tase_ja_tunnusluvut](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](50) NOT NULL,
	[sarake] [varchar](250) NOT NULL,
	[lomake] [varchar](250) NOT NULL,
	[taso0] [varchar](250) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](250) NOT NULL,
	[username] [varchar](250) NULL
) ON [PRIMARY]