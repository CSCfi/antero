USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_pohjakoulutus]') AND type in (N'U'))
DROP TABLE [dw].[d_amos_pohjakoulutus]
;

CREATE TABLE [dw].[d_amos_pohjakoulutus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [varchar](50) NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NULL,
	[kommentti] [varchar](255) NULL,
	[selite2_fi] [varchar](255) NULL,
	[selite2_sv] [varchar](255) NULL,
	[selite2_en] [varchar](255) NULL,
 CONSTRAINT [PK__d_amos_pohjakoulutus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
;
SET IDENTITY_INSERT [dw].[d_amos_pohjakoulutus] ON 
;
INSERT [dw].[d_amos_pohjakoulutus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username], [kommentti], [selite2_fi], [selite2_sv], [selite2_en]) VALUES (-1, N'-1', N'Ei aikaisempaa tutkintoa', NULL, NULL, 0, CAST(N'2024-01-18T11:14:40.870' AS DateTime), NULL, N'DWI\jsyrjala2', NULL, N'Ei suoritettua tutkintoa', NULL, NULL)
;
INSERT [dw].[d_amos_pohjakoulutus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username], [kommentti], [selite2_fi], [selite2_sv], [selite2_en]) VALUES (1, N'amm', N'Aikaisempi tutkinto (ammatillinen)', NULL, NULL, 2, CAST(N'2024-01-18T11:09:10.350' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', NULL, N'Ammatillinen tutkinto: päättää maksuttomuuden', NULL, NULL)
;
INSERT [dw].[d_amos_pohjakoulutus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username], [kommentti], [selite2_fi], [selite2_sv], [selite2_en]) VALUES (2, N'yo', N'Aikaisempi tutkinto (yo)', NULL, NULL, 1, CAST(N'2024-01-18T11:09:21.663' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', NULL, N'Ylioppilastutkinto: ei päätä maksuttomuutta', NULL, NULL)
;
INSERT [dw].[d_amos_pohjakoulutus] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username], [kommentti], [selite2_fi], [selite2_sv], [selite2_en]) VALUES (3, N'ammyo', N'Aikaisempi tutkinto (yo ja ammatillinen)', NULL, NULL, 3, CAST(N'2024-01-18T11:09:49.980' AS DateTime), N'manuaalinen', N'DWI\jsyrjala2', NULL, N'Ammatillinen tutkinto ja yo-tutkinto: päättää maksuttomuuden', NULL, NULL)
;
SET IDENTITY_INSERT [dw].[d_amos_pohjakoulutus] OFF
;
ALTER TABLE [dw].[d_amos_pohjakoulutus] ADD  CONSTRAINT [DF_d_amos_pohjakoulutus_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;
ALTER TABLE [dw].[d_amos_pohjakoulutus] ADD  CONSTRAINT [DF_d_amos_pohjakoulutus_username]  DEFAULT (suser_sname()) FOR [username]
;