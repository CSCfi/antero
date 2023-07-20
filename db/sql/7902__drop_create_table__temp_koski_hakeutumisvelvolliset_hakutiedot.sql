USE [ANTERO]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 20.7.2023 17:27:11 ******/
DROP TABLE [dw].[_temp_koski_hakeutumisvelvolliset_hakutiedot]
GO

/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 20.7.2023 17:27:11 ******/
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
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [nchar](10) NULL,
	[koulutustyyppi_koodi] [varchar](max) NULL,
	[ammatillinen_perustutkinto_erityisopetuksena] [int] NULL,
	[hakutapa_fi] [nvarchar](255) NULL,
	[hakutyyppi_fi] [nvarchar](255) NULL,
	[koulutustyyppi_hakukohde_fi] [nvarchar](255) NULL,
	[hakutapa_sv] [nvarchar](255) NULL,
	[hakutyyppi_sv] [nvarchar](255) NULL,
	[koulutustyyppi_hakukohde_sv] [nvarchar](255) NULL,
	[jarjestys_hakutapa] [int] NULL,
	[jarjestys_hakutyyppi] [int] NULL,
	[jarjestys_koulutustyyppi_hakukohde] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


