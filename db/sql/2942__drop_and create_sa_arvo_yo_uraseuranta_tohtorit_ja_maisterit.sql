USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit]    Script Date: 31.3.2020 8:07:58 ******/
DROP TABLE [sa].[sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit]
GO

/****** Object:  Table [sa].[sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit]    Script Date: 31.3.2020 8:07:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit](
	[Index_vastaajaid] [bigint] NULL,
	[Organisaatio_id] [varchar](20) NULL,
	[Vastaajatunnus] [varchar](10) NULL,
	[Vastaustapa] [varchar](9) NULL,
	[Kysymys_arvo] [varchar](500) NULL,
	[Kysymysnumero] [bigint] NULL,
	[Vastaus_alkuperäinen] [bigint] NULL,
	[Kyselypohja] [varchar](30) NULL,
	[Vastaus_arvo] [varchar](3000) NULL,
	[Kyselyvuosi] [bigint] NULL,
	[Yliopisto_arvo] [varchar](52) NULL,
	[Kysymys_en] [varchar](500) NULL,
	[Vastaus_en] [varchar](3000) NULL,
	[Kysymys_sv] [varchar](500) NULL,
	[Vastaus_sv] [varchar](3000) NULL,
	[y_tunnus] [nchar](10) NULL,
	[organisaatio_koodi] [nvarchar](50) NULL
) ON [PRIMARY]

GO

