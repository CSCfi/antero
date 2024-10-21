USE [Arvo_SA]
GO

/****** Object:  Table [sa].[sa_move_historia]    Script Date: 21.10.2024 15:15:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_move_historia]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[sa_move_historia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[vuosi] [int] NULL,
	[hyvinvointialue] [varchar](500) NULL,
	[hyvinvointialuenumero] [varchar](100) NULL,
	[maakunta] [varchar](255) NULL,
	[maakuntanumero] [varchar](100) NULL,
	[kunta] [varchar](100) NULL,
	[kuntanumero] [varchar](100) NULL,
	[luokka] [varchar](10) NULL,
	[sukupuoli] [varchar](10) NULL,
	[koulu] [varchar](500) NULL,
	[koulunumero] [varchar](100) NULL,
	[suoritti_sovelletusti] [varchar](25) NULL,
	[viivajuoksu_lkm] [int] NULL,
	[viivajuoksu_s] [int] NULL,
	[vauhditon_5_loikka] [varchar](10) NULL,
	[ylavartalon_kohotus] [int] NULL,
	[etunojapunnerrus] [int] NULL,
	[heitto_kiinniotto_yhdistelma] [int] NULL,
	[kyykistys] [varchar](100) NULL,
	[alaselan_ojennus_taysistunnassa] [varchar](10) NULL,
	[olkapaanliikkuvuus_oikea_ylhaalla] [varchar](10) NULL,
	[olkapaanliikkuvuus_vasen_ylhaalla] [varchar](10) NULL,
	[title_viivajuoksu_s] [varchar](10) NULL,
	[title_vauhditon_5_loikka] [varchar](10) NULL,
	[title_ylavartalon_kohotus] [varchar](10) NULL,
	[title_etunojapunnerrus] [varchar](10) NULL,
	[title_heitto_kiinniotto_yhdistelma] [varchar](10) NULL,
	[taso_viivajuoksu_s] [int] NULL,
	[taso_vauhditon_5_loikka] [int] NULL,
	[taso_ylavartalon_kohotus] [int] NULL,
	[taso_etunojapunnerrus] [int] NULL,
	[taso_heitto_kiinniotto_yhdistelma] [int] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_move_historia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [sa].[sa_move_historia] ADD  CONSTRAINT [DF__sa_move_historia__username]  DEFAULT (suser_name()) FOR [username]

ALTER TABLE [sa].[sa_move_historia] ADD  CONSTRAINT [DF__sa_move_historia__loadtime]  DEFAULT (getdate()) FOR [loadtime]

END

GO

