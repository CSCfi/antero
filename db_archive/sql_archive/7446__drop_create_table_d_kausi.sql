USE [ANTERO]
GO

ALTER TABLE [dw].[d_kausi] DROP CONSTRAINT [DF_d_kausi_username]
GO

ALTER TABLE [dw].[d_kausi] DROP CONSTRAINT [DF_d_kausi_loadtime]
GO

/****** Object:  Table [dw].[d_kausi]    Script Date: 7.3.2023 10:22:17 ******/
DROP TABLE [dw].[d_kausi]
GO

/****** Object:  Table [dw].[d_kausi]    Script Date: 7.3.2023 10:22:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_kausi](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](10) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NOT NULL,
	[selite_en] [varchar](255) NOT NULL,
	[jarjestys]  AS (case when [koodi]='K' then '1' when [koodi]='S' then '2' else CONVERT([varchar](100),[koodi]) end),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys2]  AS (case when [koodi]='K' then '2' when [koodi]='S' then '1' else '9' end),
	[jarjestys3]  AS (case when [koodi]='K' then '1' when [koodi]='S' then '2' else '9' end),
 CONSTRAINT [PK__d_kausi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_kausi] ADD  CONSTRAINT [DF_d_kausi_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_kausi] ADD  CONSTRAINT [DF_d_kausi_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]