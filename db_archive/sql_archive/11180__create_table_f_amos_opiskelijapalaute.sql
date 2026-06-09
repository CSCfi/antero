USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijapalaute]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_opiskelijapalaute]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_opiskelijapalaute](
	[generoitu] [int] NOT NULL,
	[rahoituskausi_amm] [nvarchar](50) NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[ytunnus] [varchar](20) NULL,
	[organisaatio_oppilaitos_koodi] [varchar](20) NULL,
	[kyselyid] [int] NULL,
	[koulutusluokitus_koodi] [varchar](6) NULL,
	[kohteet] [int] NULL,
	[vastanneet] [int] NULL,
	[pisteet] [decimal](38, 1) NULL,
	[vastausosuus] [decimal](15, 14) NULL,
	[katokorjauskerroin] [decimal](15, 14) NULL
) ON [PRIMARY]
GO
