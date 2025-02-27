USE [ANTERO]
GO

ALTER TABLE [dw].[f_varda_vuokrattu_henkilosto] DROP CONSTRAINT [DF__varda_vuokrattu_henkilosto__usern__49AEE81E]
GO

ALTER TABLE [dw].[f_varda_vuokrattu_henkilosto] DROP CONSTRAINT [DF__f_varda_vuokrattu_henkilosto__loadt__48BAC3E5]
GO

/****** Object:  Table [dw].[f_varda_vuokrattu_henkilosto]    Script Date: 19.8.2024 12:42:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_varda_vuokrattu_henkilosto]') AND type in (N'U'))
DROP TABLE [dw].[f_varda_vuokrattu_henkilosto]
GO

/****** Object:  Table [dw].[f_varda_vuokrattu_henkilosto]    Script Date: 19.8.2024 12:42:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_varda_vuokrattu_henkilosto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_kalenteri_id] [varchar](100) NULL,
	[tyontekijamaara_id] [int] NOT NULL,
	[tyontekijamaara] [int] NOT NULL,
	[tuntimaara] [decimal](10, 1) NOT NULL,
	[vakajarjestaja_id] [varchar](100) NULL,
	[d_varda_yritysmuoto_id] [int] NULL,
	[d_alueluokitus_id] [int] NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[d_varda_toimipaikkaluokitus_id] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](1000) NOT NULL,
	[username] [varchar](100) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_varda_vuokrattu_henkilosto] ADD  CONSTRAINT [DF__f_varda_vuokrattu_henkilosto__loadt__48BAC3E5]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_varda_vuokrattu_henkilosto] ADD  CONSTRAINT [DF__varda_vuokrattu_henkilosto__usern__49AEE81E]  DEFAULT (suser_sname()) FOR [username]
GO


