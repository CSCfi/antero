USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijapalaute_vastausosuudet_kertoimet]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_opiskelijapalaute_vastausosuudet_kertoimet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_opiskelijapalaute_vastausosuudet_kertoimet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[avain] [varchar](10) NULL,
	[generoitu] [int] NULL,
	[ytunnus] [varchar](50) NULL,
	[jarj] [varchar](250) NULL,
	[rahoituskausi] [nvarchar](50) NULL,
	[kysely] [nvarchar](250) NULL,
	[kysely_tarkenne] [nvarchar](250) NULL,
	[kyselyn_kohteet_arvo] [int] NULL,
	[kyselyn_kohteet_vahvistettu] [int] NULL,
	[kyselyn_kohteet_rahoitus] [int] NULL,
	[vastanneet_arvo] [int] NULL,
	[vastanneet_vahvistettu] [int] NULL,
	[vastanneet_rahoitus] [int] NULL,
	[vastaajamaaran_lahde] [varchar](20) NOT NULL,
	[vastausosuus_arvo] [decimal](22, 20) NULL,
	[vastausosuus_rahoitus] [decimal](22, 20) NULL,
	[katokorjauskerroin_arvo] [decimal](22, 20) NULL,
	[katokorjauskerroin_rahoitus] [decimal](22, 20) NULL
) ON [PRIMARY]
GO
