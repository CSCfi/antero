USE [AnteroAPI]
GO

/****** Object:  Table [api].[lukio_opiskelijat_vuosi_tutkinto]    Script Date: 31.1.2023 11:27:48 ******/
DROP TABLE [api].[lukio_opiskelijat_vuosi_tutkinto]
GO

/****** Object:  Table [api].[lukio_opiskelijat_vuosi_tutkinto]    Script Date: 31.1.2023 11:27:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[lukio_opiskelijat_vuosi_tutkinto](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[tutkinto] [nvarchar](200) NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NULL,
	[uudet_opiskelijat_lkm] [int] NULL,
	[opiskelijat_lkm] [int] NULL,
	[koodi_koulutuksen_jarjestaja] [varchar](50) NULL,
	[koodi_tutkinto] [varchar](50) NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]