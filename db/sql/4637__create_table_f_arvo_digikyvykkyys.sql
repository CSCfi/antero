USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_digikyvykkyys]    Script Date: 9.6.2021 12:09:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_digikyvykkyys]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[f_arvo_digikyvykkyys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_kalenteri_vastaus_id] [int] NULL,
	[d_arvokysymys_id] [int] NOT NULL,
	[d_arvokyselykerta_id] [int] NOT NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[vastaajaid] [nvarchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[numerovalinta] [nvarchar](50) NULL,
 ) ON [PRIMARY]

 END



