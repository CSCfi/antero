USE [ANTERO]
GO

ALTER TABLE [sa].[sa_odw_lampi] DROP CONSTRAINT [DF__sa_odw_lampi__username]
GO

ALTER TABLE [sa].[sa_odw_lampi] DROP CONSTRAINT [DF__sa_odw_lampi__loadtime]
GO

/****** Object:  Table [sa].[sa_odw_lampi]    Script Date: 21.8.2026 9.14.05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_odw_lampi]') AND type in (N'U'))
DROP TABLE [sa].[sa_odw_lampi]
GO

/****** Object:  Table [sa].[sa_odw_lampi]    Script Date: 21.8.2026 9.14.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_odw_lampi](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[HenkiloID] [bigint] NULL,
	[HenkiloOID] [varchar](255) NULL,
	[KotikuntaKoodi] [varchar](255) NULL,
	[SukupuoliKoodi] [varchar](255) NULL,
	[AidinkieliKoodi] [varchar](255) NULL,
	[Ika] [int] NULL,
	[Ensikertalainen] [int] NULL,
	[KansalaisuusKoodi] [int] NULL,
	[OrganisaatioOID] [varchar](255) NULL,
	[KoulutusToimijaOID] [varchar](255) NULL,
	[OppilaitosOID] [varchar](255) NULL,
	[ToimipisteOID] [varchar](255) NULL,
	[OrganisaationKuntaKoodi] [varchar](255) NULL,
	[Luokkataso] [varchar](255) NULL,
	[PohjakoulutuksenSuoritusvuosi] [int] NULL,
	[ToisenAsteenKoulutuksenSuoritusvuosi] [int] NULL,
	[HakukohdeOID] [varchar](255) NULL,
	[HakutoiveNumero] [int] NULL,
	[hakukohteen_tutkinnon_taso_kk_sykli] [varchar](255) NULL,
	[hakukohteen_tutkinnon_taso_kk] [varchar](255) NULL,
	[PohjakoulutusKoodi] [varchar](255) NULL,
	[PohjakoulutusKKLomakeKoodi] [varchar](255) NULL,
	[ValinnanTila] [varchar](255) NULL,
	[VastaanotonTila] [varchar](255) NULL,
	[IlmoittautumisenTila] [varchar](255) NULL,
	[PohjakoulutusvaatimusKoodi] [varchar](255) NULL,
	[HakuOid] [varchar](255) NULL,
	[HakuaikaId] [varchar](255) NULL,
	[HakuaikaAlku] [varchar](255) NULL,
	[HakuaikaLoppu] [varchar](255) NULL,
	[HakemusOid] [varchar](255) NULL,
	[Hakukelpoisuus] [varchar](255) NULL,
	[KiinnostunutOppisopimuksesta] [int] NULL,
	[PohjakoulutusKKUlkomaat] [varchar](255) NULL,
	[Jatkotutkintohaku] [varchar](255) NULL,
	[koulutusaste] [varchar](255) NULL,
	[Yo_Amk_YoAmk] [varchar](30) NULL,
	[LahtokouluOid] [varchar](255) NULL,
	[LahtokoulunKuntaKoodi] [varchar](255) NULL,
	[AlinLaskettuValintapistemaara] [decimal](18, 2) NULL,
	[YlinLaskettuValintapistemaara] [decimal](18, 2) NULL,
	[hakemus_luotu] [datetime] NULL,
	[hakemus_paivitetty] [datetime] NULL,
	[KT_ID_TO_PREVENT_DISTINCT_FILTERING] [varchar](255) NULL,
	[poistettu] [int] NULL,
	[tila] [varchar](255) NULL,
	[haku_amk_yo2] [varchar](10) NULL,
	[TietojenPaivitysleima] [datetime] NULL,
	[VALINTA_TULOS_VALINTAPAJONO_oid] [varchar](255) NULL,
 CONSTRAINT [PK__sa_odw_lampi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_odw_lampi] ADD  CONSTRAINT [DF__sa_odw_lampi__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_odw_lampi] ADD  CONSTRAINT [DF__sa_odw_lampi__username]  DEFAULT (suser_name()) FOR [username]
GO




ALTER TABLE [sa].[sa_odw_lampi_jono] DROP CONSTRAINT [DF__sa_odw_lampi_jono__username]
GO

ALTER TABLE [sa].[sa_odw_lampi_jono] DROP CONSTRAINT [DF__sa_odw_lampi_jono__loadtime]
GO

/****** Object:  Table [sa].[sa_odw_lampi_jono]    Script Date: 21.8.2026 9.14.15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_odw_lampi_jono]') AND type in (N'U'))
DROP TABLE [sa].[sa_odw_lampi_jono]
GO

/****** Object:  Table [sa].[sa_odw_lampi_jono]    Script Date: 21.8.2026 9.14.15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_odw_lampi_jono](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[HenkiloOID] [nvarchar](255) NULL,
	[HakuOID] [nvarchar](255) NULL,
	[HakukohdeOID] [nvarchar](255) NULL,
	[JonoNimi] [nvarchar](255) NULL,
	[Kokonaispisteet] [decimal](12, 2) NULL,
	[JonoTyyppi] [nvarchar](255) NULL,
	[HakukohdeAlinLaskettuValintapistemaara] [decimal](12, 2) NULL,
	[ValintatapaJononAlinHyvaksyttyPistemaara] [decimal](12, 2) NULL,
 CONSTRAINT [PK__sa_odw_lampi_jono] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_odw_lampi_jono] ADD  CONSTRAINT [DF__sa_odw_lampi_jono__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_odw_lampi_jono] ADD  CONSTRAINT [DF__sa_odw_lampi_jono__username]  DEFAULT (suser_name()) FOR [username]
GO
