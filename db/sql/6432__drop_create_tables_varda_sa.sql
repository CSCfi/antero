USE [Varda_SA]
GO
/****** Object:  Table [sa].[sa_varda_varhaiskasvatussuhde]    Script Date: 14.9.2022 13:47:28 ******/
DROP TABLE [sa].[sa_varda_varhaiskasvatussuhde]
GO
/****** Object:  Table [sa].[sa_varda_varhaiskasvatuspaatos]    Script Date: 14.9.2022 13:47:28 ******/
DROP TABLE [sa].[sa_varda_varhaiskasvatuspaatos]
GO
/****** Object:  Table [sa].[sa_varda_vakajarjestaja]    Script Date: 14.9.2022 13:47:28 ******/
DROP TABLE [sa].[sa_varda_vakajarjestaja]
GO
/****** Object:  Table [sa].[sa_varda_toimipaikka]    Script Date: 14.9.2022 13:47:28 ******/
DROP TABLE [sa].[sa_varda_toimipaikka]
GO
/****** Object:  Table [sa].[sa_varda_toimintapainotus]    Script Date: 14.9.2022 13:47:28 ******/
DROP TABLE [sa].[sa_varda_toimintapainotus]
GO
/****** Object:  Table [sa].[sa_varda_maksutieto]    Script Date: 14.9.2022 13:47:28 ******/
DROP TABLE [sa].[sa_varda_maksutieto]
GO
/****** Object:  Table [sa].[sa_varda_lapsi]    Script Date: 14.9.2022 13:47:28 ******/
DROP TABLE [sa].[sa_varda_lapsi]
GO
/****** Object:  Table [sa].[sa_varda_kielipainotus]    Script Date: 14.9.2022 13:47:28 ******/
DROP TABLE [sa].[sa_varda_kielipainotus]
GO
/****** Object:  Table [sa].[sa_varda_henkilo]    Script Date: 14.9.2022 13:47:28 ******/
DROP TABLE [sa].[sa_varda_henkilo]
GO
/****** Object:  Table [sa].[sa_varda_henkilo]    Script Date: 14.9.2022 13:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_varda_henkilo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[henkilo_id] [bigint] NULL,
	[henkilo_oid] [nvarchar](100) NULL,
	[kotikunta_koodi] [nvarchar](100) NULL,
	[syntyma_pvm] [nvarchar](200) NULL,
	[aidinkieli_koodi] [nvarchar](20) NULL,
	[sukupuoli_koodi] [nvarchar](20) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_varda_henkilo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[sa_varda_kielipainotus]    Script Date: 14.9.2022 13:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_varda_kielipainotus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[kielipainotus_id] [int] NOT NULL,
	[kielipainotus_koodi] [nvarchar](100) NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [date] NULL,
	[toimipaikka_id] [int] NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_varda_kielipainotus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[sa_varda_lapsi]    Script Date: 14.9.2022 13:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_varda_lapsi](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[lapsi_id] [bigint] NULL,
	[henkilo_id] [nvarchar](100) NULL,
	[vakatoimija_id] [nvarchar](100) NULL,
	[oma_organisaatio_id] [nvarchar](100) NULL,
	[paos_organisaatio_id] [nvarchar](100) NULL,
	[paos_kytkin] [nvarchar](10) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_varda_lapsi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[sa_varda_maksutieto]    Script Date: 14.9.2022 13:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_varda_maksutieto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[maksutieto_id] [bigint] NULL,
	[lapsi_id] [bigint] NULL,
	[yksityinen_jarjestaja] [nvarchar](10) NULL,
	[maksun_peruste_koodi] [nvarchar](10) NULL,
	[palveluseteli_arvo] [nvarchar](10) NULL,
	[asiakasmaksu] [nvarchar](10) NULL,
	[perheen_koko] [nvarchar](10) NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_varda_maksutieto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[sa_varda_toimintapainotus]    Script Date: 14.9.2022 13:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_varda_toimintapainotus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[toimintapainotus_id] [int] NOT NULL,
	[toimintapainotus_koodi] [nvarchar](100) NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [date] NULL,
	[toimipaikka_id] [int] NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_varda_toimintapainotus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[sa_varda_toimipaikka]    Script Date: 14.9.2022 13:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_varda_toimipaikka](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[toimipaikka_id] [bigint] NULL,
	[organisaatio_oid] [nvarchar](255) NULL,
	[kunta_koodi] [nvarchar](255) NULL,
	[kasvatusopillinen_jarjestelma_koodi] [nvarchar](255) NULL,
	[toimintamuoto_koodi] [nvarchar](255) NULL,
	[asiointikieli_koodi] [nvarchar](255) NULL,
	[jarjestamismuoto_koodi] [nvarchar](255) NULL,
	[varhaiskasvatuspaikat] [bigint] NULL,
	[toiminnallinenpainotus_kytkin] [nvarchar](255) NULL,
	[kielipainotus_kytkin] [nvarchar](255) NULL,
	[vakajarjestaja_id] [nvarchar](255) NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_varda_toimipaikka] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[sa_varda_vakajarjestaja]    Script Date: 14.9.2022 13:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_varda_vakajarjestaja](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[vakajarjestaja_id] [bigint] NULL,
	[nimi] [nvarchar](500) NULL,
	[y_tunnus] [nvarchar](255) NULL,
	[organisaatio_oid] [nvarchar](255) NULL,
	[kunta_koodi] [nvarchar](255) NULL,
	[ytjkieli] [nvarchar](255) NULL,
	[yritysmuoto] [nvarchar](255) NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_varda_vakajarjestaja] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[sa_varda_varhaiskasvatuspaatos]    Script Date: 14.9.2022 13:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_varda_varhaiskasvatuspaatos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[varhaiskasvatuspaatos_id] [bigint] NULL,
	[vuorohoito_kytkin] [nvarchar](100) NULL,
	[pikakasittely_kytkin] [nvarchar](100) NULL,
	[tuntimaara_viikossa] [nvarchar](20) NULL,
	[paivittainen_vaka_kytkin] [nvarchar](100) NULL,
	[kokopaivainen_vaka_kytkin] [nvarchar](100) NULL,
	[jarjestamismuoto_koodi] [nvarchar](100) NULL,
	[tilapainen_vaka_kytkin] [nvarchar](100) NULL,
	[hakemus_pvm] [date] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [date] NULL,
	[lapsi_id] [bigint] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_varda_varhaiskasvatuspaatos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[sa_varda_varhaiskasvatussuhde]    Script Date: 14.9.2022 13:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_varda_varhaiskasvatussuhde](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[varhaiskasvatussuhde_id] [bigint] NULL,
	[toimipaikka_id] [bigint] NULL,
	[varhaiskasvatuspaatos_id] [bigint] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_varda_varhaiskasvatussuhde] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [sa].[sa_varda_henkilo] ADD  CONSTRAINT [DF__sa_varda_henkilo__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_varda_henkilo] ADD  CONSTRAINT [DF__sa_varda_henkilo__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [sa].[sa_varda_kielipainotus] ADD  CONSTRAINT [DF__sa_sa_varda_kielipainotus_default_paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm]
GO
ALTER TABLE [sa].[sa_varda_kielipainotus] ADD  CONSTRAINT [DF__sa_varda_kielipainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_varda_kielipainotus] ADD  CONSTRAINT [DF__sa_varda_kielipainotus__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [sa].[sa_varda_lapsi] ADD  CONSTRAINT [DF__sa_varda_lapsi__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_varda_lapsi] ADD  CONSTRAINT [DF__sa_varda_lapsi__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [sa].[sa_varda_maksutieto] ADD  CONSTRAINT [DF__sa_varda_maksutieto__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm]
GO
ALTER TABLE [sa].[sa_varda_maksutieto] ADD  CONSTRAINT [DF__sa_varda_maksutieto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_varda_maksutieto] ADD  CONSTRAINT [DF__sa_varda_maksutieto__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [sa].[sa_varda_toimintapainotus] ADD  CONSTRAINT [DF__sa_varda_toimintapainotus__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm]
GO
ALTER TABLE [sa].[sa_varda_toimintapainotus] ADD  CONSTRAINT [DF__sa_varda_toimintapainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_varda_toimintapainotus] ADD  CONSTRAINT [DF__sa_varda_toimintapainotus__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [sa].[sa_varda_toimipaikka] ADD  CONSTRAINT [DF__sa_varda_toimipaikka__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm]
GO
ALTER TABLE [sa].[sa_varda_toimipaikka] ADD  CONSTRAINT [DF__sa_varda_toimipaikka__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_varda_toimipaikka] ADD  CONSTRAINT [DF__sa_varda_toimipaikka__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [sa].[sa_varda_vakajarjestaja] ADD  CONSTRAINT [DF__sa_varda_vakajarjestaja__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm]
GO
ALTER TABLE [sa].[sa_varda_vakajarjestaja] ADD  CONSTRAINT [DF__sa_varda_vakajarjestaja__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_varda_vakajarjestaja] ADD  CONSTRAINT [DF__sa_varda_vakajarjestaja__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [sa].[sa_varda_varhaiskasvatuspaatos] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatuspaatos__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm]
GO
ALTER TABLE [sa].[sa_varda_varhaiskasvatuspaatos] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatuspaatos__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_varda_varhaiskasvatuspaatos] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatuspaatos__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [sa].[sa_varda_varhaiskasvatussuhde] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatussuhde__paattymis_pvm]  DEFAULT (CONVERT([date],'9999-01-01')) FOR [paattymis_pvm]
GO
ALTER TABLE [sa].[sa_varda_varhaiskasvatussuhde] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatussuhde__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_varda_varhaiskasvatussuhde] ADD  CONSTRAINT [DF__sa_varda_varhaiskasvatussuhde__username]  DEFAULT (suser_name()) FOR [username]
GO
