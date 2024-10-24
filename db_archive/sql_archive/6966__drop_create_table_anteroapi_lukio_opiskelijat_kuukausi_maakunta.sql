USE [AnteroAPI]
GO

/****** Object:  Table [api].[lukio_opiskelijat_kuukausi_maakunta]    Script Date: 31.1.2023 11:27:13 ******/
DROP TABLE [api].[lukio_opiskelijat_kuukausi_maakunta]
GO

/****** Object:  Table [api].[lukio_opiskelijat_kuukausi_maakunta]    Script Date: 31.1.2023 11:27:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[lukio_opiskelijat_kuukausi_maakunta](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[oppilaitoksen_maakunta] [nvarchar](100) NULL,
	[sukupuoli] [nvarchar](30) NULL,
	[aidinkieli] [nvarchar](30) NULL,
	[ika] [nvarchar](30) NULL,
	[kansalaisuus] [nvarchar](30) NULL,
	[uudet_opiskelijat_lkm] [int] NULL,
	[opiskelijat_lkm] [int] NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]