USE [AnteroAPI]
GO


DROP TABLE IF EXISTS  [dw].[api_toimipisteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_toimipisteet](
	[defaultorder] [bigint] NOT NULL,
	[Tilastovuosi] [int] NULL,
	[Yliopisto] [varchar](100) NULL,
	[Ammattikorkeakoulu] [varchar](100) NULL,
	[Toimipiste] [varchar](255) NULL,
	[Toimipaikka] [varchar](500) NULL,
	[harjoittelukoulujen_tilat] [int] NULL,
	[muut_vuokratilat] [int] NULL,
	[yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy] [int] NULL,
	[yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy] [int] NULL,
	[yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy] [int] NULL,
	[toimipaikan_henkilokunnan_henkilotyovuodet] [float] NULL,
	[tutkimusaseman_henkilokunnan_maksimimäärä] [int] NULL,
	[tutkimusaseman_henkilokunnan_minimäärä] [int] NULL,
	[tutkimusaseman_yopymisvuorokaudet] [int] NULL,
	[Koodit Yliopisto] [varchar](5) NULL,
	[Koodit Ammattikorkeakoulu] [varchar](5) NULL,
PRIMARY KEY CLUSTERED
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

USE [ANTERO]
