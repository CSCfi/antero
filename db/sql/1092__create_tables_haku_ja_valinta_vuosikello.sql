USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 19.12.2017 17:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste](
	[haku] [varchar](255) NOT NULL,
	[haku_oid] [varchar](255) NULL,
	[koulutuksen_alkamiskausi] [varchar](255) NULL,
	[aloituspaikat] [date] NULL,
	[hakijat] [date] NULL,
	[valitut] [date] NULL,
	[vastaanottaneet] [date] NULL,
	[aloittaneet] [date] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]    Script Date: 19.12.2017 17:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_haku_ja_valinta_vuosikello_toinen_aste](
	[haku] [varchar](255) NOT NULL,
	[haku_oid] [varchar](255) NULL,
	[koulutuksen_alkamiskausi] [varchar](255) NULL,
	[aloituspaikat] [date] NULL,
	[hakijat] [date] NULL,
	[valitut] [date] NULL,
	[vastaanottaneet] [date] NULL,
	[aloittaneet] [date] NULL,
	[pisterajat] [date] NULL
) ON [PRIMARY]
END
