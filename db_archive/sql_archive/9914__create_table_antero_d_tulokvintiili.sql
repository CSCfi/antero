USE [ANTERO]
GO

ALTER TABLE [dw].[d_tulokvintiili] DROP CONSTRAINT [DF__d_tulokvintiili__loadtime]
GO

/****** Object:  Table [dw].[d_tulokvintiili]    Script Date: 7.6.2024 14:20:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_tulokvintiili]') AND type in (N'U'))
DROP TABLE [dw].[d_tulokvintiili]
GO

/****** Object:  Table [dw].[d_tulokvintiili]    Script Date: 7.6.2024 14:20:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_tulokvintiili](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tulokvintiili_koodi] [varchar](10) NOT NULL,
	[tulokvintiili_fi] [varchar](100) NOT NULL,
	[tulokvintiili_sv] [varchar](100) NOT NULL,
	[tulokvintiili_en] [varchar](100) NOT NULL,
	[jarjestys_tulokvintiili] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[kommentti] [varchar](100) NULL,
 CONSTRAINT [PK_d_tulokvintiili] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_tulokvintiili] ADD  CONSTRAINT [DF__d_tulokvintiili__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO


