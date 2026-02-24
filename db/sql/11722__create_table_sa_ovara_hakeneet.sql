USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_ovara_hakeneet]    Script Date: 4.2.2026 9.53.59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_hakeneet]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_hakeneet]
GO

/****** Object:  Table [sa].[sa_ovara_hakeneet]    Script Date: 4.2.2026 9.53.59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_hakeneet](
	[hakemus_oid] [varchar](100) NULL,
	[master_oid] [varchar](100) NULL,
	[haku_oid] [varchar](100) NULL,
	[hakemus_luotu] [datetime] NULL,
	[hakemus_muokattu] [datetime] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [varchar](1) NULL,
	[hakukohde_oid] [varchar](100) NULL,
	[hakutoive] [int] NULL,
	[ensikertalainen] [int] NULL,
	[aidosti_ensikertainen] [int] NOT NULL,
	[kotikunta] [varchar](100) NULL,
	[sukupuoli] [int] NULL,
	[aidinkieli] [varchar](100) NULL,
	[ika] [int] NULL,
	[kansalaisuus] [varchar](3) NULL,
	[kk_haku] [int] NULL,
	[koulutuskoodi] [varchar](100) NULL,
	[hakukohteen_tutkinnon_taso_kk_sykli] [int] NULL,
	[hakukohteen_tutkinnon_taso_kk] [int] NULL,
	[jatkotutkintohaku] [int] NOT NULL,
	[koulutusaste] [int] NULL,
	[koulutustoimija_oid] [varchar](200) NULL,
	[oppilaitos_oid] [varchar](200) NULL,
	[toimipiste_oid] [varchar](200) NULL,
	[organisaatio_oid] [varchar](200) NULL,
	[laajuus] [decimal](18, 0) NULL,
	[opetuksen_kieli] [varchar](8000) NULL,
	[valittu] [int] NOT NULL,
	[vastaanottanut_paikan] [int] NOT NULL,
	[ilmoittautunut] [int] NOT NULL,
	[pisteet] [float] NULL,
	[alinhyvaksyttypistemaara] [float] NULL,
	[ylinhyvaksyttypistemaara] [float] NULL,
	[pohjakoulutus] [int] NULL,
	[pohjakoulutuksen_vuosi] [int] NULL,
	[luokkataso] [varchar](100) NULL,
	[lahtokoulu] [varchar](100) NULL,
	[valintatapajonon_tyyppi] [varchar](100) NULL,
	[valintatapajono_oid] [varchar](100) NULL,
	[Yo_Amk_YoAmk] [int] NULL,
	[pohjakoulutusvaatimus_koodi] [varchar](max) NULL,
	[kiinnostunut_oppisopimuksesta] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](5) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]