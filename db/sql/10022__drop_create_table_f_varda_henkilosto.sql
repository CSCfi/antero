USE [ANTERO]
GO

ALTER TABLE [dw].[f_varda_henkilosto] DROP CONSTRAINT [DF__varda_henkilosto__usern__49AEE81E]
GO

ALTER TABLE [dw].[f_varda_henkilosto] DROP CONSTRAINT [DF__f_varda_henkilosto__loadt__48BAC3E5]
GO

/****** Object:  Table [dw].[f_varda_henkilosto]    Script Date: 16.8.2024 16:37:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_varda_henkilosto]') AND type in (N'U'))
DROP TABLE [dw].[f_varda_henkilosto]
GO

/****** Object:  Table [dw].[f_varda_henkilosto]    Script Date: 16.8.2024 16:37:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_varda_henkilosto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[tyontekija_id] [int] NULL,
	[henkilo_id] [int] NULL,
	[taydennyskoulutus_id] [int] NULL,
	[koulutuspaivat] [decimal](10, 1) NULL,
	[d_ikaryhma_id] [int] NULL,
	[d_varda_tehtavanimike_id] [int] NOT NULL,
	[d_kelpoisuus_id] [int] NOT NULL,
	[d_varda_tyosuhde_id] [int] NULL,
	[d_varda_tyoaika_id] [int] NULL,
	[toimipaikka_oid] [varchar](100) NULL,
	[vakajarjestaja_id] [varchar](100) NULL,
	[d_varda_toimintamuoto_id] [int] NULL,
	[f_varda_kielipainotus_id] [int] NULL,
	[d_varda_kielikoodisto] [int] NULL,
	[d_varda_yritysmuoto_id] [int] NULL,
	[d_alueluokitus_toimipaikka_id] [int] NULL,
	[d_alueluokitus_vakajarjestaja_id] [int] NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[d_sukupuoli] [int] NOT NULL,
	[d_varda_toimipaikkaluokitus_id] [int] NULL,
	[d_varda_maaraaikaisuuden_kesto_id] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](1000) NOT NULL,
	[username] [varchar](100) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_varda_henkilosto] ADD  CONSTRAINT [DF__f_varda_henkilosto__loadt__48BAC3E5]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_varda_henkilosto] ADD  CONSTRAINT [DF__varda_henkilosto__usern__49AEE81E]  DEFAULT (suser_sname()) FOR [username]
GO


