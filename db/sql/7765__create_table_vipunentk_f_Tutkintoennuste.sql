USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_Tutkintoennuste]    Script Date: 6.6.2023 10:43:07 ******/
DROP TABLE IF EXISTS [dbo].[f_Tutkintoennuste]
GO

/****** Object:  Table [dbo].[f_Tutkintoennuste]    Script Date: 6.6.2023 10:43:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Tutkintoennuste](
	[Tilastovuosi] [nvarchar](4) NULL,
	[Lukuvuosi] [nvarchar](20) NULL,
	[Koulutusala, taso 3] [nvarchar](255) NULL,
	[koulutusala_koodi] [nvarchar](10) NULL,
	[koulutustyyppi] [nvarchar](250) NULL,
	[Koulutusaste_taso2] [nvarchar](255) NULL,
	[Myöhempi tutkinto] [nvarchar](128) NULL,
	[Alkuperäinen/muu tutkintolaji] [nvarchar](128) NULL,
	[Pääasiallinen toiminta] [nvarchar](250) NULL,
	[Ikä] [varchar](5) NULL,
	[Aloit2] [int] NULL,
	[tutkinnon_suorittaneet] [int] NULL,
	[tyovoima_yhteensa] [int] NULL,
	[alkuperaisen_tutkinnon_suorittaneet] [int] NULL,
	[myohemman_tutkinnon_suorittaneet] [int] NULL,
	[suoritetut_tutkinnot] [int] NULL,
	[alkuperaisen_tutkinnon_aloittaneet] [int] NULL,
	[Ennusteen koulutusaste] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]