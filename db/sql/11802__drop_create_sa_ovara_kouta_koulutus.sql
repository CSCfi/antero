USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_ovara_kouta_koulutus]    Script Date: 17.3.2026 9.09.47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_kouta_koulutus]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_kouta_koulutus]
GO

/****** Object:  Table [sa].[sa_ovara_kouta_koulutus]    Script Date: 17.3.2026 9.09.47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_kouta_koulutus](
	[koulutus_oid] [varchar](50) NULL,
	[koulutuksen_nimi_fi] [varchar](500) NULL,
	[koulutuksen_nimi_sv] [varchar](500) NULL,
	[koulutuksen_nimi_en] [varchar](500) NULL,
	[organisaatio_oid] [varchar](50) NULL,
	[externalid] [varchar](500) NULL,
	[johtaatutkintoon] [int] NULL,
	[koulutustyyppi] [varchar](100) NULL,
	[koulutuksetkoodiuri] [varchar](4000) NULL,
	[koulutuskoodi] [varchar](100) NULL,
	[jarjestysnro] [int] NULL,
	[tila] [varchar](100) NULL,
	[esikatselu] [int] NULL,
	[tarjoajat] [varchar](max) NULL,
	[julkinen] [int] NULL,
	[kielivalinta] [varchar](100) NULL,
	[sorakuvausid] [varchar](100) NULL,
	[tyyppi] [varchar](100) NULL,
	[kuvaus] [varchar](max) NULL,
	[lisatiedot] [varchar](max) NULL,
	[tutkinnonosat] [varchar](4000) NULL,
	[koulutusalakoodiurit] [varchar](1000) NULL,
	[tutkintonimikekoodiurit] [varchar](1000) NULL,
	[opintojenlaajuusyksikkokoodiuri] [varchar](100) NULL,
	[opintojenlaajuusnumero] [decimal](18, 0) NULL,
	[opintojenlaajuusnumeromin] [decimal](18, 0) NULL,
	[opintojenlaajuusnumeromax] [decimal](18, 0) NULL,
	[isavoinkorkeakoulutus] [varchar](100) NULL,
	[tunniste] [varchar](1000) NULL,
	[opinnontyyppikoodiuri] [varchar](100) NULL,
	[korkeakoulutustyypit] [varchar](1000) NULL,
	[ismuokkaajaophvirkailija] [int] NULL,
	[osaamisalakoodiuri] [varchar](1000) NULL,
	[erikoistumiskoulutuskoodiuri] [varchar](1000) NULL,
	[linkkieperusteisiin] [varchar](1000) NULL,
	[muokkaaja] [varchar](100) NULL,
	[teemakuva] [varchar](1000) NULL,
	[eperusteid] [int] NULL,
	[muokattu] [varchar](100) NULL,
	[luokittelutermit] [varchar](2000) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
