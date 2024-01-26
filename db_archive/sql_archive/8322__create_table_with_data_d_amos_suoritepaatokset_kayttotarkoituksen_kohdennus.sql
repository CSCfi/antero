USE [ANTERO]
GO
/****** Object:  Table [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus]    Script Date: 24.11.2023 15:55:30 ******/
DROP TABLE IF EXISTS [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus]
GO
/****** Object:  Table [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus]    Script Date: 24.11.2023 15:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NULL,
	[selite_fi] [varchar](255) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ON 

GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (1, N'1', N'Lähihoitajakoulutuksen lisääminen', 1, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (2, N'2', N'Hoiva-avustajakoulutuksen lisääminen työvoimakoulutuksena', 2, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (3, N'3', N'Ukrainasta tulleille pakolaisille järjestettävä ammatillinen koulutus ja TUVA-koulutus', 3, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (4, N'4', N'Koronavirusepidemian johdosta tarvittaviin tukitoimiin', 4, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (5, N'5', N'Erityisen kalliin koulutuksen järjestämisen turvaaminen', 5, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (6, N'6', N'Yksittäisen koulutuksen järjestämisen turvaaminen', 6, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (7, N'7', N'Työpaikkaohjaajien koulutuksen lisääminen ja kehittäminen', 7, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (8, N'8', N'Urheilijoiden ammatillisen koulutuksen tukeminen', 8, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (9, N'9', N'Oppivelvollisuuslain mukaisten majoitus- ja matkakorvausten vuoksi aiheutuvien kustannusten kattaminen', 9, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (10, N'10', N'Muu syy, joka ei ollut ennakoitavissa varsinaista suoritepäätöstä tehtäessä', 10, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (11, N'12', N'Rahoituksen määräytymisperusteiden muutoksista aiheutuvien kohtuuttoman suurten kertamuutosten kompensointi', 12, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (12, N'13', N'Opettajien ja ohjaajien palkkaaminen sekä opetuksen ja ohjauksen tukitoimet', 13, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (13, N'14', N'Oppisopimuskoulutuksen koulutuskorvauksen uudistamisen kokeilu', 14, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ([id], [koodi], [selite_fi], [jarjestys], [loadtime], [source], [username]) VALUES (14, N'99', N'Kohdentamaton', 99, CAST(N'2023-11-24T15:51:29.680' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2')
GO
SET IDENTITY_INSERT [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] OFF
GO
ALTER TABLE [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ADD  CONSTRAINT [DF_d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus] ADD  CONSTRAINT [DF_d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus_username]  DEFAULT (suser_sname()) FOR [username]
GO
