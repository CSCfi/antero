USE [AnteroAPI]
GO


DROP TABLE IF EXISTS [api].[lukio_opiskelijat_vuosi_tutkinto]
GO

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
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

