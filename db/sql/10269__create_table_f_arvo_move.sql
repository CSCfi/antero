USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_move]    Script Date: 21.10.2024 14:48:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_move]') AND type in (N'U'))
DROP TABLE [dw].[f_arvo_move]
GO

/****** Object:  Table [dw].[f_arvo_move]    Script Date: 21.10.2024 14:48:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_move](
	[tilastovuosi] [nvarchar](max) NULL,
	[vastaajaid] [int] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_arvovastaus_monivalinta_luokka_id] [int] NULL,
	[d_arvovastaus_monivalinta_sukupuoli_id] [int] NULL,
	[suoritettu_soveltavasti] [decimal](12, 2) NULL,
	[etunojapunnerrus] [decimal](12, 2) NULL,
	[heitto_kiinniotto] [decimal](12, 2) NULL,
	[vauhditon_5_loikka] [decimal](12, 2) NULL,
	[viivajuoksu] [int] NULL,
	[ylavartalon_kohotus] [decimal](12, 2) NULL,
	[kyykistys] [decimal](12, 2) NULL,
	[olkapaiden_liikkuvuus_oikea] [decimal](12, 2) NULL,
	[olkapaiden_liikkuvuus_vasen] [decimal](12, 2) NULL,
	[alaselan_ojennus] [decimal](12, 2) NULL,
	[viivajuoksu_pisteet] [int] NULL,
	[etunojapunnerrus_pisteet] [int] NULL,
	[ylavartalon_kohotus_pisteet] [int] NULL,
	[heitto_kiinniotto_pisteet] [int] NULL,
	[vauhditon_5_loikka_pisteet] [int] NULL,
	[kyykistys_pisteet] [decimal](12, 2) NULL,
	[olkapaiden_liikkuvuus_oikea_pisteet] [decimal](12, 2) NULL,
	[olkapaiden_liikkuvuus_vasen_pisteet] [decimal](12, 2) NULL,
	[alaselan_ojennus_pisteet] [decimal](12, 2) NULL,
	[loadtime] [date] NULL,
	[username] [varchar](20) NULL,
	[source] [varchar](100) NULL,
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dw].[f_arvo_move] ADD  CONSTRAINT [DF__f_arvo_move__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_move] ADD  CONSTRAINT [DF__f_arvo_move__username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]