USE [AnteroAPI]
GO

/****** Object:  Table [api].[perusopetus_oppilaat_lukuvuosi_oppilaitos]    Script Date: 18.11.2024 11:47:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[api].[perusopetus_oppilaat_lukuvuosi_oppilaitos]') AND type in (N'U'))
DROP TABLE [api].[perusopetus_oppilaat_lukuvuosi_oppilaitos]
GO

/****** Object:  Table [api].[perusopetus_oppilaat_lukuvuosi_oppilaitos]    Script Date: 18.11.2024 11:47:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[perusopetus_oppilaat_lukuvuosi_oppilaitos](
	[defaultorder] [bigint] NOT NULL,
	[lukuvuosi] [nvarchar](20) NOT NULL,
	[opetuksen_jarjestajan_maakunta] [nvarchar](200) NOT NULL,
	[opetuksen_jarjestaja] [nvarchar](500) NOT NULL,
	[oppilaitos] [nvarchar](500) NULL,
	[koodit_opetuksen_jarjestajan_maakunta] [varchar](2) NOT NULL,
	[koodit_opetuksen_jarjestaja] [varchar](20) NOT NULL,
	[koodit_oppilaitos] [varchar](20) NOT NULL,
	[oppilaat_lukuvuosi_lkm] [int] NULL,
	[oppilaat_syyslukukausi_lkm] [int] NULL,
	[oppilaat_kevatlukukausi_lkm] [int] NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


