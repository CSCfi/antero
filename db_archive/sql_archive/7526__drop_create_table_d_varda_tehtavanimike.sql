USE [ANTERO]
GO
ALTER TABLE [dw].[d_varda_tehtavanimike] DROP CONSTRAINT [DF__d_varda_tehtavanimike__username]
GO
ALTER TABLE [dw].[d_varda_tehtavanimike] DROP CONSTRAINT [DF__d_varda_tehtavanimike__loadtime]
GO
/****** Object:  Table [dw].[d_varda_tehtavanimike]    Script Date: 30.3.2023 14:37:28 ******/
DROP TABLE [dw].[d_varda_tehtavanimike]
GO
/****** Object:  Table [dw].[d_varda_tehtavanimike]    Script Date: 30.3.2023 14:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_tehtavanimike](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_tehtavanimike] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_varda_tehtavanimike] ON 

GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (1, N'39407', N'Perhepäivähoitaja', N'Familjedagvårdare', NULL, N'Perhepäivähoitaja', N'Familjedagvårdare', NULL, CAST(N'2019-08-28' AS Date), NULL, 6, CAST(N'2023-03-30T02:49:30.8000000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (2, N'41712', N'Steinerpedagoginen varhaiskasvattaja', N'Steinerpedagog inom småbarnspedagogik', NULL, N'Steinerpedagoginen varhaiskasvattaja', N'Steinerpedagog inom småbarnspedagogik', NULL, CAST(N'2020-01-01' AS Date), NULL, 7, CAST(N'2023-03-30T02:49:30.8000000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (3, N'43525', N'Päiväkodin johtaja', N'Daghemsföreståndare', NULL, N'Päiväkodin johtaja', N'Daghemsföreståndare', NULL, CAST(N'2019-08-28' AS Date), NULL, 1, CAST(N'2023-03-30T02:49:30.8000000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (4, N'64212', N'Varhaiskasvatuksen opettaja', N'Lärare inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen opettaja', N'Lärare inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, 2, CAST(N'2023-03-30T02:49:30.8000000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (5, N'77826', N'Varhaiskasvatuksen erityisopettaja', N'Speciallärare inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen erityisopettaja', N'Speciallärare inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, 3, CAST(N'2023-03-30T02:49:30.8000000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (6, N'81787', N'Varhaiskasvatuksen avustaja', N'Assistent inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen avustaja', N'Assistent inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, 8, CAST(N'2023-03-30T02:49:30.8000000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (7, N'84053', N'Varhaiskasvatuksen sosionomi', N'Socionom inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen sosionomi', N'Socionom inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, 4, CAST(N'2023-03-30T02:49:30.8000000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (8, N'84724', N'Varhaiskasvatuksen lastenhoitaja', N'Barnskötare inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen lastenhoitaja', N'Barnskötare inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, 5, CAST(N'2023-03-30T02:49:30.8000000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_tehtavanimike] OFF
GO
ALTER TABLE [dw].[d_varda_tehtavanimike] ADD  CONSTRAINT [DF__d_varda_tehtavanimike__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_tehtavanimike] ADD  CONSTRAINT [DF__d_varda_tehtavanimike__username]  DEFAULT (suser_name()) FOR [username]
GO
