USE [AnteroAPI]
GO


DROP TABLE IF EXISTS [dw].[api_lukio_opiskelijat_vuosi_tutkinto]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_lukio_opiskelijat_vuosi_tutkinto](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[tutkinto] [nvarchar](200) NULL,
	[koulutuksenJarjestaja] [nvarchar](255) NULL,
	[uudetOpiskelijatLkm] [int] NULL,
	[opiskelijatLkm] [int] NULL,
	[koodiKoulutuksenJarjestaja] [varchar](50) NULL,
	[koodiTutkinto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

