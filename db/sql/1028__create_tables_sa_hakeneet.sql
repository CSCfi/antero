USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_hakeneet_kk_hakutoiveet]    Script Date: 7.12.2017 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_hakeneet_kk_hakutoiveet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_hakeneet_kk_hakutoiveet](
	[hakemusoid] [varchar](255) NULL,
	[hakukohdeOID1] [varchar](255) NULL,
	[hakukohdeOID2] [varchar](255) NULL,
	[hakukohdeOID3] [varchar](255) NULL,
	[hakukohdeOID4] [varchar](255) NULL,
	[hakukohdeOID5] [varchar](255) NULL,
	[hakukohdeOID6] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[sa_hakeneet_kk_pohjakoulutus]    Script Date: 7.12.2017 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_hakeneet_kk_pohjakoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_hakeneet_kk_pohjakoulutus](
	[hakemusoid] [varchar](255) NULL,
	[max_ToisenAsteenKoulutuksenSuoritusvuosi] [varchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[sa_hakukohde_kielet]    Script Date: 7.12.2017 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_hakukohde_kielet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_hakukohde_kielet](
	[hakukohde_oid] [nvarchar](100) NULL,
	[kieli1_koodi] [nvarchar](5) NULL,
	[kieli2_koodi] [nvarchar](5) NULL,
	[kieli3_koodi] [nvarchar](5) NULL,
	[kieli_avain] [nvarchar](30) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[sa_hakukohde_koulutus]    Script Date: 7.12.2017 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_hakukohde_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_hakukohde_koulutus](
	[hakukohde_oid] [nvarchar](max) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [nchar](10) NULL,
	[hakukohdekoulutus_oid] [varchar](max) NULL,
	[hakukohdekoulutus_koodi] [varchar](max) NULL,
	[koulutustyyppi_koodi] [varchar](max) NULL,
	[laajuus_koodi] [varchar](max) NULL,
	[pohjakoulutusvaatimus_koodi] [varchar](max) NULL,
	[organisaatio_oid] [varchar](max) NULL,
	[hakukohdekoulutus_nro] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
