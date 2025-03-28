USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_2_9_Korkeakoulututkinnot]    Script Date: 25.11.2022 16:34:04 ******/
DROP TABLE [dbo].[f_2_9_Korkeakoulututkinnot]
GO

/****** Object:  Table [dbo].[f_2_9_Korkeakoulututkinnot]    Script Date: 25.11.2022 16:34:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_2_9_Korkeakoulututkinnot](
	[tilastointivuosi] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [varchar](1) NULL,
	[lahde] [varchar](2) NULL,
	[oppilaitos] [varchar](5) NULL,
	[koulutuksen_jarjestaja] [varchar](10) NULL,
	[koulutusluokitus] [varchar](6) NULL,
	[opintoala1995] [varchar](2) NULL,
	[koulutuksen_kunta] [varchar](3) NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli_versio1x] [varchar](2) NULL,
	[syntymavuosi] [varchar](4) NULL,
	[kotikunta] [varchar](3) NULL,
	[kotikunta1x] [varchar](3) NULL,
	[kansalaisuus_versio2] [varchar](1) NULL,
	[kvopisk] [varchar](1) NULL,
	[kirjoihintulovuosi] [varchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulokausi] [varchar](1) NULL,
	[tutkinnon_suoritusvuosi] [varchar](4) NULL,
	[tutkinnon_suorituslukukausi] [varchar](1) NULL,
	[rahoituslahde] [varchar](1) NULL,
	[kirjoihintulovuosi_korkeakoulusektori] [varchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva] [varchar](4) NULL,
	[kirjoihintulovuosi_sektori] [varchar](4) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva] [varchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu] [varchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva] [varchar](4) NULL,
	[kirjoihintulovuosi_opintoala] [varchar](4) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva] [varchar](4) NULL,
	[lukumaara] [int] NULL,
	[tutkinto_amk] [varchar](3) NULL,
	[koulutusohjelma_amk] [varchar](4) NULL,
	[suuntautumisvaihtoehto_amk] [varchar](5) NULL,
	[koulutustyyppi] [varchar](1) NULL,
	[koulutuksen_kieli] [varchar](2) NULL,
	[lkm_lasnalk] [int] NULL,
	[lkm_poissalk] [int] NULL,
	[op_suoritettavien_laajuus] [int] NULL,
	[kirjoihintulovuosi_tutkinto] [varchar](4) NULL,
	[kirjoihintulokausi_tutkinto] [varchar](1) NULL,
	[op_amk_yhteensa] [int] NULL,
	[op_amk_yleissiv_amm_opplait] [int] NULL,
	[op_amk_muualla] [int] NULL,
	[op_amk_oma_amk] [int] NULL,
	[op_amk_muu_amk] [int] NULL,
	[op_amk_yliopistoissa] [int] NULL,
	[op_amk_ulkomailla] [int] NULL,
	[tilauskoulutuksen_sijaintimaa] [varchar](1) NULL,
	[tutkinto_yo] [varchar](3) NULL,
	[koulutusohjelma_yo] [varchar](4) NULL,
	[paaaine_yo] [varchar](4) NULL,
	[tiedekunta_yo] [varchar](2) NULL,
	[opiskelumuoto] [varchar](1) NULL,
	[opettajankelpoisuus] [varchar](1) NULL,
	[op_yo_yhteensa] [int] NULL,
	[op_yo_ulkomailla] [int] NULL,
	[op_yo_muualla] [int] NULL,
	[op_yo_oma_yo] [int] NULL,
	[op_yo_avoimessa] [int] NULL,
	[op_yo_muu_yo] [int] NULL,
	[op_yo_ammattikorkeakouluissa] [int] NULL,
	[liikkuvuuden_kesto] [varchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [varchar](6) NOT NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[tutkinnot] [int] NULL,
	[koulutuslaji_OKM_avain] [int] NOT NULL,
	[koulutusryhma_avain] [int] NULL,
	[ikaryhma1_avain] [varchar](10) NULL,
	[ikaryhma2_avain] [varchar](10) NOT NULL,
	[laak] [int] NULL,
	[ltop] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]

