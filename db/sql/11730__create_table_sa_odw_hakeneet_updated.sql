USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_odw_hakeneet_updated]    Script Date: 4.2.2026 8.31.47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_odw_hakeneet_updated]') AND type in (N'U'))
DROP TABLE [sa].[sa_odw_hakeneet_updated]
GO

/****** Object:  Table [sa].[sa_odw_hakeneet_updated]    Script Date: 4.2.2026 8.31.47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_odw_hakeneet_updated](
	[hakemus_oid] [varchar](255) NULL,
	[master_oid] [varchar](100) NULL,
	[haku_oid] [varchar](255) NULL,
	[hakemus_luotu] [datetime] NULL,
	[hakemus_muokattu] [datetime] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [nvarchar](max) NULL,
	[hakukohde_oid] [varchar](255) NULL,
	[hakutoive] [int] NULL,
	[ensikertalainen] [int] NULL,
	[kotikunta] [varchar](255) NULL,
	[sukupuoli] [varchar](255) NULL,
	[aidinkieli] [varchar](255) NULL,
	[kansalaisuus] [int] NULL,
	[Ika] [int] NULL,
	[kk_haku] [int] NULL,
	[koulutuskoodi] [nvarchar](max) NULL,
	[hakukohteen_tutkinnon_taso_kk_sykli] [varchar](255) NULL,
	[hakukohteen_tutkinnon_taso_kk] [varchar](255) NULL,
	[jatkotutkintohaku] [varchar](255) NULL,
	[koulutusaste] [varchar](255) NULL,
	[koulutustoimija_oid] [varchar](255) NULL,
	[oppilaitos_oid] [varchar](255) NULL,
	[toimipiste_oid] [varchar](255) NULL,
	[laajuus] [int] NULL,
	[opetuksen_kieli] [nvarchar](4000) NULL,
	[valintatapajonon_tyyppi] [nvarchar](255) NULL,
	[valintatapajono_oid] [varchar](28) NULL,
	[valittu] [int] NOT NULL,
	[vastaanottanut_paikan] [int] NOT NULL,
	[ilmoittautunut] [int] NOT NULL,
	[pisteet] [decimal](12, 2) NULL,
	[alinhyvaksyttypistemaara] [decimal](12, 2) NULL,
	[ylinhyvaksyttypistemaara] [decimal](12, 2) NULL,
	[pohjakoulutus] [varchar](255) NULL,
	[pohjakoulutuksen_vuosi] [int] NULL,
	[luokkataso] [varchar](255) NULL,
	[lahtokoulu] [varchar](255) NULL,
	[Yo_Amk_YoAmk] [varchar](30) NULL,
	[pohjakoulutusvaatimus_koodi] [varchar](8000) NULL,
	[PohjakoulutusKKLomakeKoodi] [varchar](255) NULL,
	[kiinnostunut_oppisopimuksesta] [int] NULL,
	[ToisenAsteenKoulutuksenSuoritusvuosi] [int] NULL,
	[rnk] [bigint] NULL,
	[loadtime] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]