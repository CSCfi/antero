USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit]    Script Date: 24.2.2025 12.07.36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit]') AND type in (N'U'))
DROP TABLE [sa].[sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit]
GO

/****** Object:  Table [sa].[sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit]    Script Date: 24.2.2025 12.07.36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit](
	[Index_vastaajaid] [varchar](50) NULL,
	[Organisaatio_id] [varchar](20) NULL,
	[Vastaajatunnus] [varchar](10) NULL,
	[Kysymysnumero] [bigint] NULL,
	[Vastaus_alkuperäinen] [bigint] NULL,
	[Kyselypohja] [varchar](30) NULL,
	[Vastaus_arvo] [varchar](3000) NULL,
	[Kyselyvuosi] [bigint] NULL,
	[Vastaus_en] [varchar](3000) NULL,
	[Vastaus_sv] [varchar](3000) NULL,
	[organisaatio_koodi] [nvarchar](50) NULL
) ON [PRIMARY]
GO


USE [ANTERO]