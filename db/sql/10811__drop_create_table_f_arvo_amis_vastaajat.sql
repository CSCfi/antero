USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_amis_vastaajat]    Script Date: 12.6.2025 22.33.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amis_vastaajat]') AND type in (N'U'))
DROP TABLE [dw].[f_arvo_amis_vastaajat]
GO

/****** Object:  Table [dw].[f_arvo_amis_vastaajat]    Script Date: 12.6.2025 22.33.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_amis_vastaajat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vastaajaid] [nvarchar](50) NULL,
	[d_kalenteri_tunnus_luotu_id] [int] NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_arvokyselykerta_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_arvovastaus_taustakysymys_sukupuoli_id] [nvarchar](50) NOT NULL,
	[d_arvovastaus_taustakysymys_aidinkieli_id] [int] NOT NULL,
	[d_suoritus_kieli_id] [int] NULL,
	[d_arvovastaus_taustakysymys_hakeutumisvayla_id] [int] NULL,
	[d_arvovastaus_taustakysymys_ika_id] [int] NULL,
	[d_arvovastaus_taustakysymys_arvio_tilanteesta_id] [int] NULL,
	[osaamisalat_avain] [varchar](100) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_arvo_amis_vastaajat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_arvo_amis_vastaajat] ADD  CONSTRAINT [DF__f_arvo_amis_vastaajat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_amis_vastaajat] ADD  CONSTRAINT [DF__f_arvo_amis_vastaajat__username]  DEFAULT (suser_sname()) FOR [username]
GO
