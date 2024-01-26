USE [AnteroAPI]
GO

/****** Object:  Table [api].[yamk_tutkinnot]    Script Date: 31.1.2023 11:34:04 ******/
DROP TABLE [api].[yamk_tutkinnot]
GO

/****** Object:  Table [api].[yamk_tutkinnot]    Script Date: 31.1.2023 11:34:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[yamk_tutkinnot](
	[defaultorder] [bigint] IDENTITY(1,1) NOT NULL,
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
	[Rahoitusmallialat amk 2021-2024] [nvarchar](255) NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO




USE [ANTERO]