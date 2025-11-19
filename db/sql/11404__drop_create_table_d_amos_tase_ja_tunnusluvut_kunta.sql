USE [ANTERO]
GO

/****** Object:  Table [dw].[d_amos_tase_ja_tunnusluvut_kunta]    Script Date: 19.11.2025 11.03.32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_tase_ja_tunnusluvut_kunta]') AND type in (N'U'))
DROP TABLE [dw].[d_amos_tase_ja_tunnusluvut_kunta]
GO

/****** Object:  Table [dw].[d_amos_tase_ja_tunnusluvut_kunta]    Script Date: 19.11.2025 11.03.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_amos_tase_ja_tunnusluvut_kunta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [varchar](100) NOT NULL,
	[tunnusluku] [varchar](250) NOT NULL,
	[sarake] [varchar](250) NOT NULL,
	[versio] [varchar](250) NOT NULL,
	[vuosi] [nvarchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](250) NOT NULL,
	[username] [varchar](250) NULL
) ON [PRIMARY]