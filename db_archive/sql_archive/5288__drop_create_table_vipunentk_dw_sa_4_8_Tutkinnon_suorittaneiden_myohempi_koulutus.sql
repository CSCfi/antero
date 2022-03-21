USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 30.12.2021 16:36:12 ******/
DROP TABLE [dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
GO

/****** Object:  Table [dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 30.12.2021 16:36:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[koulk] [nvarchar](6) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[oppis] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tutktav] [nvarchar](2) NULL,
	[aikoul] [nvarchar](2) NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[ika] [nvarchar](10) NULL,
	[lulkm] [int] NULL,
	[lukoulk] [varchar](6) NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[ammlkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[amm_sopimusjaksot] [varchar](1) NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutktav] [varchar](1) NULL,
	[opistlkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opistsuorv] [varchar](4) NULL,
	[ammkalkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammkasuorv] [varchar](4) NULL,
	[amklkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[akklkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akksuorv] [varchar](4) NULL,
	[ylamklkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ykklkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykksuorv] [varchar](4) NULL,
	[laakerlkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laakersuorv] [varchar](4) NULL,
	[lislkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lissuorv] [varchar](4) NULL,
	[tohtlkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[tohtsuorv] [varchar](4) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


