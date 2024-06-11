USE [ANTERO]
GO

ALTER TABLE [sa].[sa_esco_ammatit] DROP CONSTRAINT [DF__sa_esco_ammatit__username]
GO

ALTER TABLE [sa].[sa_esco_ammatit] DROP CONSTRAINT [DF__sa_esco_ammatit__loadtime]
GO

/****** Object:  Table [sa].[sa_esco_ammatit]    Script Date: 11.6.2024 12:26:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_esco_ammatit]') AND type in (N'U'))
DROP TABLE [sa].[sa_esco_ammatit]
GO

/****** Object:  Table [sa].[sa_esco_ammatit]    Script Date: 11.6.2024 12:26:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_esco_ammatit](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[ammatti_fi] [nvarchar](200) NULL,
	[ammatti_sv] [nvarchar](200) NULL,
	[ammatti_en] [nvarchar](200) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_esco_ammatit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_esco_ammatit] ADD  CONSTRAINT [DF__sa_esco_ammatit__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_esco_ammatit] ADD  CONSTRAINT [DF__sa_esco_ammatit__username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]