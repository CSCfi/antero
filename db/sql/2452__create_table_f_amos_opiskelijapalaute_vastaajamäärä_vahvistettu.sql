USE [ANTERO]
GO
/****** Object:  Table [dw].[f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu]    Script Date: 25.9.2019 14:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu](
	[Rahoituskausi] [varchar](21) NULL,
	[Koulutuksen järjestäjän Y-tunnus] [varchar](9) NULL,
	[Koulutuksen järjestäjän nimi] [varchar](27) NULL,
	[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)] [bigint] NULL,
	[Vastanneet (Aloitusvaiheenkysely)] [bigint] NULL,
	[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)] [bigint] NULL,
	[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)] [bigint] NULL,
	[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)] [bigint] NULL,
	[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)] [bigint] NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
	[Username] [varchar](100) NULL
) ON [PRIMARY]
END
