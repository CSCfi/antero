USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [dw].[api_suorittanut55]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_suorittanut55](
	[defaultorder] [bigint] NOT NULL,
	[oppilaitos_koodi] [varchar](20) NULL,
	[oppilaitos] [nvarchar](255) NULL,
	[okm_ohjauksen_ala_koodi] [varchar](2) NULL,
	[okm_ohjauksen_ala] [nvarchar](200) NULL,
	[koulutusaste(taso2)_koodi] [varchar](2) NULL,
	[koulutusaste(taso2)] [nvarchar](200) NULL,
	[koulutusala(taso1)_koodi] [varchar](2) NULL,
	[koulutusala(taso1)] [nvarchar](200) NULL,
	[koulutusala(taso2)_koodi] [varchar](3) NULL,
	[koulutusala(taso2)] [nvarchar](200) NULL,
	[koulutusala(taso3)_koodi] [varchar](4) NULL,
	[koulutusala(taso3)] [nvarchar](200) NULL,
	[koulutus_koodi] [varchar](6) NULL,
	[koulutusnimike] [nvarchar](200) NULL,
	[vuosi] [int] NULL,
	[suorittanut_55] [int] NULL,
	[suorittanut_55ilman_pankkia] [int] NULL,
	[suorittanut_55pankin_avulla] [int] NULL,
	[suorittanut_27] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]
