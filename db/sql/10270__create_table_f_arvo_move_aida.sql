USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_move_aida]    Script Date: 21.10.2024 14:54:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_move_aida]') AND type in (N'U'))
DROP TABLE [dw].[f_arvo_move_aida]
GO

/****** Object:  Table [dw].[f_arvo_move_aida]    Script Date: 21.10.2024 14:54:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_move_aida](
	[tilastovuosi] [int] NULL,
	[vastaajaid] [bigint] NOT NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_alueluokitus_id] [int] NULL,
	[luokka] [varchar](10) NULL,
	[sukupuoli] [varchar](10) NULL,
	[suoritettu_soveltavasti] [int] NOT NULL,
	[etunojapunnerrus] [int] NULL,
	[heitto_kiinniotto] [int] NULL,
	[vauhditon_5_loikka] [float] NULL,
	[viivajuoksu] [int] NULL,
	[ylavartalon_kohotus] [int] NULL,
	[kyykistys] [int] NULL,
	[olkapaiden_liikkuvuus_oikea] [int] NULL,
	[olkapaiden_liikkuvuus_vasen] [int] NULL,
	[alaselan_ojennus] [int] NULL,
	[viivajuoksu_pisteet] [int] NULL,
	[etunojapunnerrus_pisteet] [int] NULL,
	[ylavartalon_kohotus_pisteet] [int] NULL,
	[heitto_kiinniotto_pisteet] [int] NULL,
	[vauhditon_5_loikka_pisteet] [int] NULL,
	[kyykistys_pisteet] [int] NULL,
	[olkapaiden_liikkuvuus_oikea_pisteet] [int] NULL,
	[olkapaiden_liikkuvuus_vasen_pisteet] [int] NULL,
	[alaselan_ojennus_pisteet] [int] NULL,
	[loadtime] [date] NULL,
	[username] [varchar](20) NULL,
	[source] [varchar](100) NULL
) 
GO

ALTER TABLE [dw].[f_arvo_move_aida] ADD  CONSTRAINT [DF__f_arvo_move_aida__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_move_aida] ADD  CONSTRAINT [DF__f_arvo_move_aida__username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]
