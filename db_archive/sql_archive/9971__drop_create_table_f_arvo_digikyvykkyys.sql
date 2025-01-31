USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_digikyvykkyys]    Script Date: 26.7.2024 9:11:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_digikyvykkyys]') AND type in (N'U'))
DROP TABLE [dw].[f_arvo_digikyvykkyys]
GO

/****** Object:  Table [dw].[f_arvo_digikyvykkyys]    Script Date: 26.7.2024 9:11:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_digikyvykkyys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_kalenteri_vastaus_id] [int] NULL,
	[d_arvokysymys_id] [int] NOT NULL,
	[d_arvokyselykerta_id] [int] NOT NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[vastaajaid] [nvarchar](50) NOT NULL,
	[sektori] [nvarchar](20) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[numerovalinta] [nvarchar](50) NULL,
 CONSTRAINT [PK__f_arvo_digikyvykkyys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_arvo_digikyvykkyys] ADD  CONSTRAINT [DF__f_arvo_digikyvykkyys__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_digikyvykkyys] ADD  CONSTRAINT [DF__f_arvo_digikyvykkyys__username]  DEFAULT (suser_sname()) FOR [username]
GO


