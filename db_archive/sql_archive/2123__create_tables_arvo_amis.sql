USE [ANTERO]
GO
/****** Object:  Table [dw].[d_arvovastaus_koulutustausta]    Script Date: 26.2.2019 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_arvovastaus_koulutustausta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_arvovastaus_koulutustausta](
	[vastaajaid] [nvarchar](50) NULL,
	[koulutustausta_fi] [nvarchar](500) NULL,
	[koulutustausta_sv] [nvarchar](500) NULL,
	[koulutustausta_en] [nvarchar](500) NULL,
	[korkein_koulutustausta_fi] [nvarchar](500) NULL,
	[korkein_koulutustausta_sv] [nvarchar](500) NULL,
	[korkein_koulutustausta_en] [nvarchar](500) NULL,
	[jarjestys_koulutustausta] [int] NULL,
	[jarjestys_korkein_koulutustausta] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
	[priorisointi] [int] NULL,
	[priorisointi_vastaajaid] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_arvovastaus_monivalinta]    Script Date: 26.2.2019 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_arvovastaus_monivalinta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_arvovastaus_monivalinta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [int] NULL,
	[vastaus_fi] [nvarchar](500) NULL,
	[vastaus_sv] [nvarchar](500) NULL,
	[vastaus_en] [nvarchar](500) NULL,
	[kysymysid] [nvarchar](500) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__d_arvovastaus_testi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_arvovastaus_taustakysymys]    Script Date: 26.2.2019 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_arvovastaus_taustakysymys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_arvovastaus_taustakysymys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](50) NULL,
	[vastaus_fi] [nvarchar](500) NULL,
	[vastaus_sv] [nvarchar](500) NULL,
	[vastaus_en] [nvarchar](500) NULL,
	[tyyppi] [nvarchar](500) NULL,
	[kysymysid] [nvarchar](500) NULL,
	[jarjestys_koodi] [varchar](10) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__d_arvovastaus_taustakysymys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_arvo_amis]    Script Date: 26.2.2019 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_arvo_amis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_organisaatio_oppilaitos_id] [int] NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_arvovastaus_taustakysymys_sukupuoli_id] [nvarchar](50) NOT NULL,
	[d_arvovastaus_taustakysymys_aidinkieli_id] [int] NOT NULL,
	[d_arvovastaus_taustakysymys_ika_id] [int] NULL,
	[d_arvovastaus_taustakysymys_hakeutumisvayla_id] [int] NULL,
	[d_arvovastaus_taustakysymys_oppisopimus_id] [int] NULL,
	[d_arvovastaus_taustakysymys_arvio_tilanteesta_id] [int] NULL,
	[d_alueluokitus_henkilon_kotikunta_id] [int] NOT NULL,
	[d_kalenteri_tunnus_luotu_id] [int] NOT NULL,
	[d_kalenteri_vastaus_id] [int] NULL,
	[d_arvokysymys_id] [int] NOT NULL,
	[d_arvokyselykerta_id] [int] NOT NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[vastaajaid] [nvarchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[numerovalinta] [nvarchar](50) NULL,
	[d_suoritus_kieli_id] [int] NULL,
 CONSTRAINT [PK__f_arvo_amis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_arvovastaus_koulutustausta__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_arvovastaus_koulutustausta] ADD  CONSTRAINT [DF__d_arvovastaus_koulutustausta__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_arvovastaus_koulutustausta__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_arvovastaus_koulutustausta] ADD  CONSTRAINT [DF__d_arvovastaus_koulutustausta__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_arvovastaus_testi__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_arvovastaus_monivalinta] ADD  CONSTRAINT [DF__d_arvovastaus_testi__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_arvovastaus_testi__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_arvovastaus_monivalinta] ADD  CONSTRAINT [DF__d_arvovastaus_testi__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_arvovastaus_taustakysymys__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_arvovastaus_taustakysymys] ADD  CONSTRAINT [DF__d_arvovastaus_taustakysymys__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_arvovastaus_taustakysymys__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_arvovastaus_taustakysymys] ADD  CONSTRAINT [DF__d_arvovastaus_taustakysymys__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_amis__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_amis] ADD  CONSTRAINT [DF__f_arvo_amis__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_amis__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_amis] ADD  CONSTRAINT [DF__f_arvo_amis__username]  DEFAULT (suser_sname()) FOR [username]
END