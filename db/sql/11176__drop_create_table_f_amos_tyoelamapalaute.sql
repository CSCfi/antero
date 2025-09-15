USE [ANTERO]
GO

/****** Object:  Table [dw].[f_amos_tyoelamapalaute]    Script Date: 15.9.2025 17.33.54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tyoelamapalaute]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_tyoelamapalaute]
GO

/****** Object:  Table [dw].[f_amos_tyoelamapalaute]    Script Date: 15.9.2025 17.33.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_tyoelamapalaute](
	[generoitu] [int] NOT NULL,
	[rahoituskausi_amm] [nvarchar](50) NOT NULL,
	[vuosi] [int] NOT NULL,
	[kuukausi] [int] NOT NULL,
	[ytunnus] [varchar](20) NOT NULL,
	[koulutusluokitus_koodi] [varchar](6) NULL,
	[organisaatio_oppilaitos_koodi] [varchar](20) NULL,
	[kyselypohja_tarkenne_fi] [nvarchar](500) NULL,
	[kohteet] [float] NULL,
	[vastanneet] [float] NULL,
	[pisteet] [decimal](12, 4) NULL,
	[keskiarvo] [int] NULL,
	[vastausosuus] [decimal](15, 14) NULL,
	[katokorjauskerroin] [decimal](15, 14) NULL
) ON [PRIMARY]
GO
