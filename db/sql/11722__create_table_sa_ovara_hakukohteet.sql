USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_ovara_hakukohteet]    Script Date: 4.2.2026 9.54.57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_hakukohteet]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_hakukohteet]
GO

/****** Object:  Table [sa].[sa_ovara_hakukohteet]    Script Date: 4.2.2026 9.54.57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_hakukohteet](
	[hakukohde_oid] [nvarchar](max) NULL,
	[haku_oid] [nvarchar](max) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [nvarchar](max) NULL,
	[toimipiste_oid] [varchar](200) NULL,
	[oppilaitos_oid] [varchar](200) NULL,
	[koulutustoimija_oid] [varchar](200) NULL,
	[organisaatio_oid] [varchar](200) NULL,
	[koulutuskoodi] [varchar](100) NULL,
	[koulutustyyppi] [nvarchar](max) NULL,
	[hakukohteen_tutkinnon_taso_kk_sykli] [int] NULL,
	[hakukohteen_tutkinnon_taso_kk] [int] NULL,
	[kk_haku] [int] NULL,
	[opetuksen_kieli] [varchar](8000) NULL,
	[laajuus] [decimal](18, 0) NULL,
	[pohjakoulutusvaatimus_koodi] [varchar](max) NULL,
	[ammatillinenperustutkintoerityisopetuksena] [int] NULL,
	[jarjestetaanerityisopetuksena] [int] NULL,
	[alinhyvaksyttypistemaara] [float] NULL,
	[aloituspaikat] [int] NULL,
	[aloituspaikat_ensikertalaisille] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]