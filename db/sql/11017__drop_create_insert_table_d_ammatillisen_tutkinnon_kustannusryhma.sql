USE [ANTERO]
GO
/****** Object:  Table [dw].[d_ammatillisen_tutkinnon_kustannusryhma]    Script Date: 20.8.2025 15.05.37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_ammatillisen_tutkinnon_kustannusryhma]') AND type in (N'U'))
DROP TABLE [dw].[d_ammatillisen_tutkinnon_kustannusryhma]
GO
/****** Object:  Table [dw].[d_ammatillisen_tutkinnon_kustannusryhma]    Script Date: 20.8.2025 15.05.37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_ammatillisen_tutkinnon_kustannusryhma](
	[id] [int] NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[selite_fi] [nvarchar](100) NOT NULL,
	[selite_sv] [nvarchar](100) NOT NULL,
	[selite_en] [nvarchar](100) NOT NULL,
	[jarjestys_koodi] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_d_ammatillisen_tutkinnon_kustannusryhma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ADD  CONSTRAINT [DF__d_ammatillisen_tutkinnon_kustannusryhma__username]  DEFAULT (suser_sname()) FOR [username]
GO

INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (-1, N'-1', N'Tieto puuttuu', N'Information saknas', N'Missing data', 99, CAST(N'2018-10-17T00:00:00.000' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (2, N'1', N'Ryhmä 1', N'Grupp 1', N'Group 1', 1, CAST(N'2018-10-16T00:00:00.000' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (3, N'2', N'Ryhmä 2', N'Grupp 2', N'Group 2', 2, CAST(N'2018-10-16T00:00:00.000' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (4, N'3', N'Ryhmä 3', N'Grupp 3', N'Group 3', 3, CAST(N'2018-10-16T00:00:00.000' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (5, N'4', N'Ryhmä 4', N'Grupp 4', N'Group 4', 4, CAST(N'2018-10-16T00:00:00.000' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (6, N'5', N'Ryhmä 5', N'Grupp 5', N'Group 5', 5, CAST(N'2018-10-16T00:00:00.000' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (7, N'vt', N'Ryhmä VALMA&TUVA&TELMA', N'Grupp VALMA&TUVA&TELMA', N'Group VALMA&TUVA&TELMA', 8, CAST(N'2018-10-16T00:00:00.000' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (8, N'muu', N'Ryhmä Muu amm. koulutus', N'Grupp Annan yrkesutbildning', N'Group Other vocational education', 9, CAST(N'2018-10-16T00:00:00.000' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (9, N'ot', N'Ryhmä Opiskeluvalmiuksia tukevat', N'Grupp Stöd till studiefärdigheterna', N'Group Support for study skills', 10, CAST(N'2018-10-16T00:00:00.000' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (10, N'6', N'Ryhmä 6', N'Grupp 6', N'Group 6', 6, CAST(N'2024-06-28T12:47:37.963' AS DateTime), N'manuaali')
GO
INSERT [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys_koodi], [loadtime], [source]) VALUES (11, N'7', N'Ryhmä 7', N'Grupp 7', N'Group 7', 7, CAST(N'2024-06-28T12:48:37.687' AS DateTime), N'manuaali')
GO

ALTER TABLE [dw].[d_ammatillisen_tutkinnon_kustannusryhma] ADD  CONSTRAINT [DF__d_ammatillisen_tutkinnon_kustannusryhma__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
