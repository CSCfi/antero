USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 4.2.2026 10.51.09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_hakeutumisvelvolliset_hakutiedot]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_hakeutumisvelvolliset_hakutiedot]
GO

/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 4.2.2026 10.51.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_hakeutumisvelvolliset_hakutiedot](
	[master_oid] [varchar](100) NULL,
	[HakuOid] [varchar](100) NULL,
	[HakukohdeOID] [varchar](100) NULL,
	[HakutoiveNumero] [int] NULL,
	[valittu] [int] NOT NULL,
	[vastaanottanut_paikan] [int] NOT NULL,
	[ilmoittautunut] [int] NOT NULL,
	[OppilaitosOID] [varchar](200) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [varchar](1) NULL,
	[koulutustyyppi_koodi] [varchar](255) NULL,
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
) ON [PRIMARY]