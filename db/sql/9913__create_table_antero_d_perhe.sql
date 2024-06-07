USE [ANTERO]
GO

ALTER TABLE [dw].[d_perhe] DROP CONSTRAINT [DF__d_perhe__loadtime]
GO

/****** Object:  Table [dw].[d_perhe]    Script Date: 7.6.2024 13:12:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_perhe]') AND type in (N'U'))
DROP TABLE [dw].[d_perhe]
GO

/****** Object:  Table [dw].[d_perhe]    Script Date: 7.6.2024 13:12:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_perhe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[perhe_koodi] [varchar](10) NOT NULL,
	[perhe_fi] [varchar](100) NOT NULL,
	[perhe_sv] [varchar](100) NOT NULL,
	[perhe_en] [varchar](100) NOT NULL,
	[jarjestys_perhe] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[kommentti] [varchar](100) NULL,
 CONSTRAINT [PK_d_perhe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_perhe] ADD  CONSTRAINT [DF__d_perhe__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO


