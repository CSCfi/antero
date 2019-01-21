USE [ANTERO]
GO

ALTER TABLE [dw].[d_arvokyselykerta] DROP CONSTRAINT [DF__d_arvokyselykerta__username]
GO

ALTER TABLE [dw].[d_arvokyselykerta] DROP CONSTRAINT [DF__d_arvokyselykerta__loadtime]
GO

/****** Object:  Table [dw].[d_arvokyselykerta]    Script Date: 9.1.2019 13:16:31 ******/
DROP TABLE [dw].[d_arvokyselykerta]
GO

/****** Object:  Table [dw].[d_arvokyselykerta]    Script Date: 9.1.2019 13:16:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_arvokyselykerta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kyselykertaid] [int] NOT NULL,
	[kyselykerta] [nvarchar](max) NOT NULL,
	[kyselyid] [int] NOT NULL,
	[kysely_fi] [nvarchar](500) NOT NULL,
	[kysely_sv] [nvarchar](500) NULL,
	[kysely_en] [nvarchar](500) NULL,
	[kyselypohja] [nvarchar](500) NULL,
	[kyselypohja_tarkenne] [nvarchar](500) NULL,
	[vuosi] [int] NULL,
	[jarjestys_aineistotyyppi_kyselykertaid]  AS (case when [kyselykertaid]=(-1) then '99999' else CONVERT([varchar](10),[kyselykertaid]) end),
	[jarjestys_aineistotyyppi_kyselyid]  AS (case when [kyselyid]=(-1) then '99999' else CONVERT([varchar](10),[kyselyid]) end),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_arvokyselykerta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dw].[d_arvokyselykerta] ADD  CONSTRAINT [DF__d_arvokyselykerta__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_arvokyselykerta] ADD  CONSTRAINT [DF__d_arvokyselykerta__username]  DEFAULT (suser_sname()) FOR [username]



