USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tyoelamapalaute]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_tyoelamapalaute]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_tyoelamapalaute](
	[generoitu] [int] NOT NULL,
	[rahoituskausi_amm] [nvarchar](50) NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[kyselypohja_tarkenne_fi] [nvarchar](500) NULL,
	[ytunnus] [varchar](20) NULL,
	[oppilaitos_koodi] [varchar](20) NULL,
	[toimipiste_oid] [varchar](200) NULL,
	[koulutusluokitus_koodi] [varchar](6) NULL,
	[kohteet] [float] NULL,
	[vastanneet] [float] NULL,
	[pisteet] [decimal](12, 4) NULL,
	[keskiarvo] [int] NULL,
	[vastausosuus] [decimal](15, 14) NULL,
	[katokorjauskerroin] [decimal](15, 14) NULL
) ON [PRIMARY]
GO
