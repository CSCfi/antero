USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_cwts_leiden_ranking]    Script Date: 23.8.2024 8:11:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_cwts_leiden_ranking]') AND type in (N'U'))
DROP TABLE [sa].[sa_cwts_leiden_ranking]
GO

/****** Object:  Table [sa].[sa_cwts_leiden_ranking]    Script Date: 23.8.2024 8:11:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_cwts_leiden_ranking](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[university] [nvarchar](100) NOT NULL,
	[year] [int] NOT NULL,
	[pp_industry_collab] [float] NOT NULL,
	[p_industry_collab] [float] NOT NULL,
	[collab_p] [float] NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_cwts_leiden_ranking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_cwts_leiden_ranking] ADD  CONSTRAINT [DF__sa_cwts_leiden_ranking__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_cwts_leiden_ranking] ADD  CONSTRAINT [DF__sa_cwts_leiden_ranking__username]  DEFAULT (suser_name()) FOR [username]

GO

USE [ANTERO]


