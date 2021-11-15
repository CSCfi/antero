USE [AnteroAPI]
GO


DROP TABLE IF EXISTS [dw].[api_lukio_opiskelijat_kuukausi_maakunta]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_lukio_opiskelijat_kuukausi_maakunta](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[oppilaitoksenMaakunta] [nvarchar](100) NULL,
	[sukupuoli] [nvarchar](30) NULL,
	[aidinkieli] [nvarchar](30) NULL,
	[ika] [nvarchar](30) NULL,
	[kansalaisuus] [nvarchar](30) NULL,
	[uudetOpiskelijatLkm] [int] NULL,
	[opiskelijatLkm] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

