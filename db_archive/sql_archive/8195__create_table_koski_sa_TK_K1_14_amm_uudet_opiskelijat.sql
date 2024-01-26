USE [Koski_SA]
GO

/****** Object:  Table [dbo].[TK_K1_14_amm_uudet_opiskelijat]    Script Date: 12.10.2023 15:05:00 ******/
DROP TABLE IF EXISTS [dbo].[TK_K1_14_amm_uudet_opiskelijat]
GO

/****** Object:  Table [dbo].[TK_K1_14_amm_uudet_opiskelijat]    Script Date: 12.10.2023 15:05:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TK_K1_14_amm_uudet_opiskelijat](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[master_oppija] [varchar](50) NULL,
	[organisaatio_koodi] [varchar](20) NULL,
	[organisaatio_fi] [nvarchar](255) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL
) ON [PRIMARY]

GO
