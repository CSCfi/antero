USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_yamk_tutkinnot]    Script Date: 15.11.2021 14:10:45 ******/
DROP TABLE IF EXISTS [dw].[api_yamk_tutkinnot]
GO

/****** Object:  Table [dw].[api_yamk_tutkinnot]    Script Date: 15.11.2021 14:10:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_yamk_tutkinnot](
	[Tutkinnon suorittamisvuosi] [int] NOT NULL,
	[Suorituskuukausi] [int] NULL,
	[Koodit korkeakoulu] [varchar](6) NOT NULL,
	[Korkeakoulu] [nvarchar](255) NULL,
	[Tutkintokoodi] [varchar](6) NULL,
	[Tutkinto] [nvarchar](200) NULL,
	[Tutkinnon laajuus op] [int] NULL,
	[Rahoituslahde] [varchar](150) NULL,
	[Tutkinnot lkm] [int] NULL,
	[Koulutusaste taso 1] [nvarchar](200) NULL,
	[Koulutusaste taso 2] [nvarchar](200) NULL,
	[Koulutusala taso 1] [nvarchar](200) NULL,
	[Koulutusala taso 2] [nvarchar](200) NULL,
	[Koulutusala taso 3] [nvarchar](200) NULL,
	[OKM ohjauksen ala] [nvarchar](200) NULL,
	[Rahoitusmallialat amk 2021-2024] [nvarchar](255) NULL
) ON [PRIMARY]

GO


