USE [ANTERO]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 14.3.2023 22:39:00 ******/
DROP TABLE IF EXISTS [dw].[_temp_koski_hakeutumisvelvolliset_hakutiedot]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 14.3.2023 22:39:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[_temp_koski_hakeutumisvelvolliset_hakutiedot](
	[HenkiloOID] [varchar](255) NULL,
	[HakuOid] [varchar](255) NULL,
	[HakukohdeOID] [varchar](255) NULL,
	[HakutoiveNumero] [int] NULL,
	[ValinnanTila] [varchar](255) NULL,
	[VastaanotonTila] [varchar](255) NULL,
	[IlmoittautumisenTila] [varchar](255) NULL,
	[OppilaitosOID] [varchar](255) NULL,
	[Hakutapa] [nvarchar](255) NULL,
	[Hakutyyppi] [nvarchar](255) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [nchar](10) NULL,
	[koodit_koulutusnimike_hv_hakutiedot] [varchar](6) NULL,
	[koulutustyyppi_koodi] [varchar](max) NULL,
	[Koulutustyyppi (hakukohde)] [nvarchar](255) NULL,
	[ammatillinen_perustutkinto_erityisopetuksena] [int] NULL,
	[jarjestys_hakutapa] [int] NULL,
	[jarjestys_hakutyyppi] [int] NULL,
	[jarjestys_koulutustyyppi_hakukohde] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


