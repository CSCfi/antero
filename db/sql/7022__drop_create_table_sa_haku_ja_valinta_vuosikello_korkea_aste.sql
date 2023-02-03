USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 3.2.2023 13:15:19 ******/
DROP TABLE [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
GO

/****** Object:  Table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 3.2.2023 13:15:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[haku] [varchar](255) NOT NULL,
	[haku_oid] [varchar](255) NULL,
	[koulutuksen_alkamiskausi] [varchar](255) NULL,
	[aloituspaikat] [date] NULL,
	[hakijat] [date] NULL,
	[valitut] [date] NULL,
	[vastaanottaneet] [date] NULL,
	[aloittaneet] [date] NULL,
	[visualisoinnit] [date] NULL,
	[seuraava_kaynnistys] [date] NULL,
 CONSTRAINT [PK__sa_haku_ja_valinta_vuosikello_korkea_aste] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ANTERO]