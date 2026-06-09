USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_kuntatalous_taksonomiat_aputaulu]    Script Date: 19.11.2025 10.49.50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_kuntatalous_taksonomiat_aputaulu]') AND type in (N'U'))
DROP TABLE [sa].[sa_kuntatalous_taksonomiat_aputaulu]
GO
/****** Object:  Table [sa].[sa_kuntatalous_taksonomiat_aputaulu]    Script Date: 19.11.2025 10.49.50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_kuntatalous_taksonomiat_aputaulu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tunnusluku] [varchar](250) NULL,
	[sarake] [varchar](250) NULL,
	[source] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ON 
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (1, N'2000-2099 Oma pääoma', N'oma_paaoma', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (2, N'Vastattavaa', N'vastattavaa', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (3, N'2050-2050 Tilikauden ylijäämä (alijäämä)', N'ylialijaama', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (4, N'Vastaavaa', N'vastaavaa', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (5, N'2100-2119 Poistoero ja vapaaehtoiset varaukset', N'poistoero', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (6, N'2040-2040 Edellisten tilikausien ylijäämä (alijäämä)', N'edel_ylialijaama', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (7, N'2400-2999 Vieras pääoma', N'vieras_paaoma', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (8, N'1720-1829 Lyhytaikaiset saamiset', N'rahoitusomaisuus', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (9, N'1830-1899 Rahoitusarvopaperit', N'rahoitusomaisuus', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (10, N'1900-1900 Rahat ja pankkisaamiset (Rahavarat tai Rahoitusomaisuus)', N'rahoitusomaisuus', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (11, N'2500-2999 Lyhytaikainen vieras pääoma', N'lyhyt_vieras_paaoma', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (12, N'2010-2010 Arvonkorotusrahasto', N'arvonkorotusrahastot', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] ([id], [tunnusluku], [sarake], [source], [loadtime], [username]) VALUES (13, N'2015-2015 Muut omat rahastot', N'muut_rahastot', NULL, CAST(N'2025-10-20T13:31:33.317' AS DateTime), N'DWI\kohojoha')
GO
SET IDENTITY_INSERT [sa].[sa_kuntatalous_taksonomiat_aputaulu] OFF