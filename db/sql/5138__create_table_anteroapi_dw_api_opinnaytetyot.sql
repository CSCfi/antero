USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [dw].[api_opinnaytetyot]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_opinnaytetyot](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[okm_ohjauksen_ala] [varchar](100) NULL,
	[koulutusala_02] [varchar](255) NULL,
	[koulutustyyppi] [varchar](55) NULL,
	[koulutusaste] [varchar](33) NULL,
	[ammattikorkeakoulu] [varchar](100) NULL,
	[hankkeistetut_opinnaytetyot] [int] NULL,
	[opinnaytetyot_ei_hankkeistetut] [int] NULL,
	[koodit_koulutusala_2002] [int] NULL,
	[koodit_okm_ohjauksen_ala] [int] NULL,
	[koodit_ammattikorkeakoulu] [varchar](5) NULL,
	[koodit_koulutustyyppi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]
