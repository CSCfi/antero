USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat]    Script Date: 31.10.2025 10.55.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat]') AND type in (N'U'))
  DROP TABLE [dbo].[f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat]
GO

CREATE TABLE [dbo].[f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[lahde_id] [int] NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[oppilaitos_id] [int] NULL,
	[oppilaitos_historia_id] [int] NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_id] [int] NULL,
	[koulutuksen_jarjestaja_historia_id] [int] NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[koulutustyyppi] [nvarchar](1) NULL,
	[koulutustyyppi_id] [int] NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymavuosi_id] [nvarchar](10) NULL,
	[syntymakuukausi] [nvarchar](2) NULL,
	[syntymakuukausi_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NULL,
	[kirjoihintulokausi] [nvarchar](1) NULL,
	[kirjoihintulokausi_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_id] [nvarchar](10) NULL,
	[opiskelijan_olo_tamm] [nvarchar](1) NULL,
	[opiskelijan_olo_tamm_id] [int] NULL,
	[opiskelijan_olo_syys] [nvarchar](1) NULL,
	[opiskelijan_olo_syys_id] [int] NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kieli_id] [int] NULL,
	[patevyyteen_tahtaavat_opinnot_amk] [nvarchar](1) NULL,
	[patevyyteen_tahtaavat_opinnot_amk_id] [int] NULL,
	[erikoislaakarikoulutus] [nvarchar](1) NULL,
	[erikoislaakarikoulutus_id] [int] NULL,
	[kansalaisuus_versio2] [nvarchar](1) NULL,
	[kansalaisuus_versio2_id] [int] NULL,
	[kvopisk] [nvarchar](1) NULL,
	[kvopisk_id] [int] NULL,
	[suormaa] [nvarchar](1) NULL,
	[suormaa_id] [int] NULL,
	[opoikv] [nvarchar](4) NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [varchar](3) NOT NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[koulutussektori_id] [int] NULL,
	[ika_1v] [nvarchar](4) NULL,
	[ika_1v_id] [int] NULL,
	[aloitusika] [decimal](18, 6) NULL,
	[jarjestys_aloitusika] [int] NULL,
	[aloittaneet] [int] NULL,
	[aloittaneet_korkeakoulusektori] [int] NULL,
	[koulutuslaji_OKM_id] [int] NULL
) ON [PRIMARY]
GO


