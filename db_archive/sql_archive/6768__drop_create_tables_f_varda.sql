USE [ANTERO]
GO
/****** Object:  Table [dw].[f_varda_vakajarjestajat_toimipaikat]    Script Date: 20.12.2022 10:40:38 ******/
DROP TABLE IF EXISTS [dw].[f_varda_vakajarjestajat_toimipaikat]
GO
/****** Object:  Table [dw].[f_varda_huoltajatiedot]    Script Date: 20.12.2022 10:40:38 ******/
DROP TABLE IF EXISTS [dw].[f_varda_huoltajatiedot]
GO

/****** Object:  Table [dw].[f_varda_vakasuhteet_vakapaatokset]    Script Date: 20.12.2022 10:40:38 ******/
DROP TABLE IF EXISTS [dw].[f_varda_vakasuhteet_vakapaatokset]
GO
/****** Object:  Table [dw].[f_varda_toimintapainotus]    Script Date: 20.12.2022 10:40:38 ******/
DROP TABLE IF EXISTS [dw].[f_varda_toimintapainotus]
GO
/****** Object:  Table [dw].[f_varda_kielipainotus]    Script Date: 20.12.2022 10:40:38 ******/
DROP TABLE IF EXISTS [dw].[f_varda_kielipainotus]
GO
/****** Object:  Table [dw].[f_varda_jarjestamismuoto]    Script Date: 20.12.2022 10:40:38 ******/
DROP TABLE IF EXISTS [dw].[f_varda_jarjestamismuoto]
GO
/****** Object:  Table [dw].[f_varda_jarjestamismuoto]    Script Date: 20.12.2022 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_varda_jarjestamismuoto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm01] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm02] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm03] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm04] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm05] [int] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [nvarchar](200) NULL,
	[toimipaikka_id] [int] NOT NULL,
	[tilastovuosi_toimipaikka_oid] [nvarchar](100) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_varda_jarjestamismuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[f_varda_kielipainotus]    Script Date: 20.12.2022 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_varda_kielipainotus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_varda_kielikoodistoopetushallinto_id] [int] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [nvarchar](200) NULL,
	[toimipaikka_id] [int] NOT NULL,
	[tilastovuosi_toimipaikka_oid] [nvarchar](100) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_varda_kielipainotus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[f_varda_toimintapainotus]    Script Date: 20.12.2022 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_varda_toimintapainotus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_varda_toiminnallinenpainotus_id] [int] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [nvarchar](200) NULL,
	[toimipaikka_id] [int] NOT NULL,
	[tilastovuosi_toimipaikka_oid] [nvarchar](100) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_varda_toimintapainotus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[f_varda_vakasuhteet_vakapaatokset]    Script Date: 20.12.2022 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_varda_vakasuhteet_vakapaatokset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[henkilo_id] [int] NOT NULL,
	[lapsi_id] [int] NOT NULL,
	[d_alueluokitus_kotikunta] [int] NOT NULL,
	[henkilo_syntyma_pvm] [date] NOT NULL,
	[d_ikaryhma_id] [int] NULL,
	[d_kieli_aidinkieli] [int] NOT NULL,
	[d_sukupuoli] [int] NOT NULL,
	[vakajarjestaja_id] [int] NULL,
	[d_varda_yritysluokitus_id] [int] NULL,
	[vakapaatos_alkamis_pvm] [date] NOT NULL,
	[vakapaatos_hakemus_pvm] [date] NOT NULL,
	[vakapaatos_paattymis_pvm] [date] NOT NULL,
	[d_jarjestamismuoto_id_vakapaatos] [int] NOT NULL,
	[d_kytkin_vakapaatos_vuorohoito] [varchar](10) NOT NULL,
	[d_varda_kytkin_vakapaatos_kokopaivainen_vaka] [varchar](10) NULL,
	[d_varda_kytkin_vakapaatos_paivittainen_vaka] [varchar](10) NULL,
	[d_kytkin_vakapaatos_pikakasittely] [varchar](10) NULL,
	[vakapaatos_tuntimaara_viikossa] [float] NOT NULL,
	[d_tuntimaara_asteikko_id] [int] NULL,
	[vakasuhde_id] [int] NULL,
	[vakasuhde_alkamis_pvm] [date] NOT NULL,
	[vakasuhde_paattymis_pvm] [date] NOT NULL,
	[vakasuhde_toimipaikka_id] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dw].[f_varda_huoltajatiedot]    Script Date: 20.12.2022 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_varda_huoltajatiedot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[maksutieto_id] [nvarchar](200) NOT NULL,
	[lapsi_id] [int] NOT NULL,
	[henkilo_id] [int] NOT NULL,
	[yksityinen_jarjestaja] [varchar](10) NOT NULL,
	[d_maksun_peruste_id] [int] NOT NULL,
	[d_maksun_luokka_id] [int] NULL,
	[palveluseteli_arvo] [float] NOT NULL,
	[asiakasmaksu] [float] NULL,
	[perheen_koko] [int] NOT NULL,
	[alkamis_pvm] [date] NOT NULL,
	[paattymis_pvm] [date] NULL,
	[cum_sum] [float] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[f_varda_vakajarjestajat_toimipaikat]    Script Date: 20.12.2022 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[f_varda_vakajarjestajat_toimipaikat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[toimipaikka_id] [nvarchar](255) NOT NULL,
	[vakajarjestaja_oid] [nvarchar](255) NULL,
	[vakajarjestaja_id] [int] NULL,
	[d_alueluokitus_vakajarjestaja_kunta_id] [int] NULL,
	[toimipaikka_oid] [nvarchar](255) NULL,
	[d_alueluokitus_toimipaikka_kunta_id] [int] NOT NULL,
	[d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id] [int] NOT NULL,
	[d_varda_toimipaikka_toimintamuoto_id] [int] NOT NULL,
	[d_varda_yritysluokitus_id] [int] NOT NULL,
	[d_varda_toimipaikkaluokitus_id] [int] NULL,
	[d_varda_varhaiskasvatuspaikkaluokitus_id] [int] NULL,
	[d_organisaatioluokitus_vakajarjestaja_id] [int] NOT NULL,
	[varhaiskasvatuspaikat] [int] NULL,
	[d_yritysmuoto_id] [int] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_varda_vakajarjestajat_toimipaikat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dw].[f_varda_huoltajatiedot] ADD  CONSTRAINT [DF__f_varda_huoltajatiedot]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[f_varda_huoltajatiedot] ADD  CONSTRAINT [DF__varda_huoltajatiedot]  DEFAULT (suser_sname()) FOR [username]
GO
ALTER TABLE [dw].[f_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__f_varda_jarjestamismuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[f_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__f_varda_jarjestamismuoto__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[f_varda_kielipainotus] ADD  CONSTRAINT [DF__f_varda_kielipainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[f_varda_kielipainotus] ADD  CONSTRAINT [DF__f_varda_kielipainotus__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[f_varda_toimintapainotus] ADD  CONSTRAINT [DF__f_varda_toimintapainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[f_varda_toimintapainotus] ADD  CONSTRAINT [DF__f_varda_toimintapainotus__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[f_varda_vakajarjestajat_toimipaikat] ADD  CONSTRAINT [DF__f_varda_vakajarjestajat_toimipaikat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[f_varda_vakajarjestajat_toimipaikat] ADD  CONSTRAINT [DF__f_varda_vakajarjestajat_toimipaikat__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[f_varda_vakasuhteet_vakapaatokset] ADD  CONSTRAINT [DF__f_varda_vakasuhteet_vakapaatokset__loadt__48BAC3E5]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[f_varda_vakasuhteet_vakapaatokset] ADD  CONSTRAINT [DF__varda_vakasuhteet_vakapaatokset__usern__49AEE81E]  DEFAULT (suser_sname()) FOR [username]
GO