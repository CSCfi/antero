USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [api].[muu_henkilosto_amk]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[muu_henkilosto_amk](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[henkilöstöryhmä] [varchar](55) NULL,
	[koulutusala] [varchar](255) NULL,
	[okm_ohjauksen_ala] [varchar](100) NULL,
	[ammattikorkeakoulu] [varchar](100) NULL,
	[sivutoimisten_tuntiopettajien_opetustunnit] [decimal](7, 1) NULL,
	[ostopalveluna_hankittu_tuntiopetus] [decimal](7, 1) NULL,
	[henkilostoryhman_tunnit_lkm] [int] NULL,
	[koodit_koulutusala] [int] NULL,
	[koodit_okm_ohjauksen_ala] [varchar](3) NULL,
	[koodit_ammattikorkeakoulu] [varchar](5) NULL,
	[koodit_henkilöstöryhmä] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

