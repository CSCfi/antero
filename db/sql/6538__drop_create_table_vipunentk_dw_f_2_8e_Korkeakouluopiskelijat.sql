USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_2_8e_Korkeakouluopiskelijat]    Script Date: 7.10.2022 22:15:07 ******/
DROP TABLE [dbo].[f_2_8e_Korkeakouluopiskelijat]
GO

/****** Object:  Table [dbo].[f_2_8e_Korkeakouluopiskelijat]    Script Date: 7.10.2022 22:15:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_2_8e_Korkeakouluopiskelijat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutustyyppi] [nvarchar](1) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymakuukausi] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulokausi] [nvarchar](1) NULL,
	[opiskelijan_olo_tamm] [nvarchar](1) NULL,
	[opiskelijan_olo_syys] [varchar](1) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[patevyys_amk] [nvarchar](1) NULL,
	[erikoislaakari] [nvarchar](1) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kansalaisuus_versio2] [nvarchar](1) NULL,
	[kvopisk] [varchar](1) NULL,
	[opoikv] [nvarchar](4) NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [varchar](3) NOT NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[aloitusika] [decimal](18, 6) NULL,
	[jarjestys_aloitusika] [int] NULL,
	[aloittaneet] [int] NULL,
	[aloittaneet_korkeakoulusektori] [int] NULL,
	[koulutuslaji_OKM_avain] [int] NOT NULL
) ON [PRIMARY]

GO


