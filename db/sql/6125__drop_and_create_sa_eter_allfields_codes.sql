USE [ANTERO]
GO

ALTER TABLE [sa].[sa_eter_allfields_codes] DROP CONSTRAINT [DF__sa_eter_allfields_codes]
GO

/****** Object:  Table [sa].[sa_eter_allfields_codes]    Script Date: 27.4.2022 10:41:54 ******/
DROP TABLE [sa].[sa_eter_allfields_codes]
GO

/****** Object:  Table [sa].[sa_eter_allfields_codes]    Script Date: 27.4.2022 10:41:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_eter_allfields_codes](
	[_id] [int] NOT NULL,
	[name] [varchar](40) NULL,
	[code] [varchar](2) NULL,
	[value] [varchar](86) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_eter_allfields_codes] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_eter_allfields_codes] ADD  CONSTRAINT [DF__sa_eter_allfields_codes]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]