USE [AnteroAPI]
GO


DROP TABLE IF EXISTS  [api].[toimipisteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[toimipisteet](
	[defaultorder] [bigint] NOT NULL,
	[Tilastovuosi] [int]  NULL,
	[Yliopisto] [nvarchar](100) NULL,
	[Ammattikorkeakoulu] [nvarchar](100) NULL,
	[Toimipiste] [nvarchar](500) NULL,
	[Toimipaikka] [nvarchar](500) NULL,
	[Toiminta: tutkintoon johtava koulutus] [nvarchar](100) NULL,
	[Toiminta: tutkimustoiminta] [nvarchar](100) NULL,
	[Toiminta: muu] [nvarchar](100) NULL,
	[Toiminta: TKI] [nvarchar](100) NULL,
	[Toiminta: palvelutoiminta] [nvarchar](100) NULL,
	[Toiminta: nuorten koulutus] [nvarchar](100) NULL,
	[Toiminta: aikuiskoulutus] [nvarchar](100) NULL,
	[Toiminta: ylempään amk-tutkintoon johtava koulutus] [nvarchar](100) NULL,
	[toimipaikan_henkilokunnan_henkilotyovuodet] [float] NULL,
	[tutkimusaseman_henkilokunnan_maksimimäärä] [int]  NULL,
	[tutkimusaseman_henkilokunnan_minimäärä] [int]  NULL,
	[tutkimusaseman_yopymisvuorokaudet] [int] NULL,
	[Koodit Yliopisto] [varchar](5) NULL,
	[Koodit Ammattikorkeakoulu] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

USE [ANTERO]
