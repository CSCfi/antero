USE [ANTERO]
GO

ALTER TABLE [dw].[f_varda_vakasuhteet_vakapaatokset] DROP CONSTRAINT [DF__varda_vakasuhteet_vakapaatokset__usern__49AEE81E]
GO

ALTER TABLE [dw].[f_varda_vakasuhteet_vakapaatokset] DROP CONSTRAINT [DF__f_varda_vakasuhteet_vakapaatokset__loadt__48BAC3E5]
GO

/****** Object:  Table [dw].[f_varda_vakasuhteet_vakapaatokset]    Script Date: 19.8.2024 12:33:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_varda_vakasuhteet_vakapaatokset]') AND type in (N'U'))
DROP TABLE [dw].[f_varda_vakasuhteet_vakapaatokset]
GO

/****** Object:  Table [dw].[f_varda_vakasuhteet_vakapaatokset]    Script Date: 19.8.2024 12:33:04 ******/
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
	[vakajarjestaja_id] [varchar](100) NULL,
	[d_varda_yritysluokitus_id] [int] NULL,
	[vakapaatos_alkamis_pvm] [date] NOT NULL,
	[vakapaatos_hakemus_pvm] [date] NOT NULL,
	[vakapaatos_paattymis_pvm] [date] NULL,
	[d_jarjestamismuoto_id_vakapaatos] [int] NOT NULL,
	[d_kytkin_vakapaatos_vuorohoito] [varchar](10) NOT NULL,
	[d_varda_kytkin_vakapaatos_kokopaivainen_vaka] [varchar](10) NULL,
	[d_varda_kytkin_vakapaatos_paivittainen_vaka] [varchar](10) NULL,
	[d_kytkin_vakapaatos_pikakasittely] [varchar](10) NULL,
	[vakapaatos_tuntimaara_viikossa] [float] NOT NULL,
	[d_tuntimaara_asteikko_id] [int] NULL,
	[vakasuhde_id] [int] NULL,
	[vakasuhde_alkamis_pvm] [date] NOT NULL,
	[vakasuhde_paattymis_pvm] [date] NULL,
	[vakasuhde_toimipaikka_id] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_varda_vakasuhteet_vakapaatokset] ADD  CONSTRAINT [DF__f_varda_vakasuhteet_vakapaatokset__loadt__48BAC3E5]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_varda_vakasuhteet_vakapaatokset] ADD  CONSTRAINT [DF__varda_vakasuhteet_vakapaatokset__usern__49AEE81E]  DEFAULT (suser_sname()) FOR [username]
GO


