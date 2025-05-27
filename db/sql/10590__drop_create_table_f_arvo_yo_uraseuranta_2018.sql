USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_yo_uraseuranta_2018_testi]    Script Date: 20.2.2025 12.25.42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_yo_uraseuranta_2018]') AND type in (N'U'))
DROP TABLE [dw].[f_arvo_yo_uraseuranta_2018]
GO

/****** Object:  Table [dw].[f_arvo_yo_uraseuranta_2018_testi]    Script Date: 20.2.2025 12.25.42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_yo_uraseuranta_2018](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_ika_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_arvokysymys_id] [int] NULL,
	[kyselypohja] [varchar](30) NULL,
	[kyselyvuosi] [bigint] NULL,
	[rahoitusmallikysymys] [int] NOT NULL,
	[rahoituskysymys_paino] [numeric](8, 6) NULL,
	[Monivalintavaihtoehto] [varchar](3000) NULL,
	[numerovalinta] [bigint] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[vastaajaid] [varchar](50) NULL,
	[flervalsalternativ] [varchar](3000) NULL,
	[multiple_choice_option] [varchar](3000) NULL,
	[ura_maisteri] [int] NOT NULL,
	[ura_tohtori] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_arvo_yo_uraseuranta_2018] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_arvo_yo_uraseuranta_2018] ADD  CONSTRAINT [DF__f_arvo_yo_uraseuranta_2018_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_yo_uraseuranta_2018] ADD  CONSTRAINT [DF__f_arvo_yo_uraseuranta_2018_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]