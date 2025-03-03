USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[ika]    Script Date: 9.3.2018 8:47:09 ******/
DROP TABLE [dbo].[ika]
GO
/****** Object:  Table [dbo].[ika]    Script Date: 9.3.2018 8:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ika](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[ika_avain] [nvarchar](10) NOT NULL,
	[ika_int] [int] NULL,
	[ika] [nvarchar](50) NULL,
	[ika_SV] [nvarchar](50) NULL,
	[ika_EN] [nvarchar](50) NULL,
	[ika5v_int] [int] NULL,
	[ika5v] [nvarchar](50) NULL,
	[ika5v_SV] [nvarchar](50) NULL,
	[ika5v_EN] [nvarchar](50) NULL,
	[jarjestys_ika] [nvarchar](50) NULL,
	[jarjestys_ika5v] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](255) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2013-11-11' AS Date), N'-1', -1, N'Tuntematon', N'Okänt', N'Unknown', -1, N'Tuntematon', N'Okänt', N'Unknown', N'98', N'98', N'K', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2013-11-11' AS Date), N'-2', -2, N'Virhetilanne', N'Felsituation', N'Error', -2, N'Virhetilanne', N'Felsituation', N'Error', N'99', N'99', N'K', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2013-11-11' AS Date), N'0', 0, N'0', N'0', N'0', 0, N'alle 5-vuotiaat', N'under 5 år', N'Under 5', N'1v00', N'5v00', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2013-11-11' AS Date), N'1', 1, N'1', N'1', N'1', 0, N'alle 5-vuotiaat', N'under 5 år', N'Under 5', N'1v01', N'5v00', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2013-11-11' AS Date), N'2', 2, N'2', N'2', N'2', 0, N'alle 5-vuotiaat', N'under 5 år', N'Under 5', N'1v02', N'5v00', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2013-11-11' AS Date), N'3', 3, N'3', N'3', N'3', 0, N'alle 5-vuotiaat', N'under 5 år', N'Under 5', N'1v03', N'5v00', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2013-11-11' AS Date), N'4', 4, N'4', N'4', N'4', 0, N'alle 5-vuotiaat', N'under 5 år', N'Under 5', N'1v04', N'5v00', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2013-11-11' AS Date), N'5', 5, N'5', N'5', N'5', 5, N'5–9-vuotiaat', N'5–9 år', N'5–9', N'1v05', N'5v05', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2013-11-11' AS Date), N'6', 6, N'6', N'6', N'6', 5, N'5–9-vuotiaat', N'5–9 år', N'5–9', N'1v06', N'5v05', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2013-11-11' AS Date), N'7', 7, N'7', N'7', N'7', 5, N'5–9-vuotiaat', N'5–9 år', N'5–9', N'1v07', N'5v05', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (9, CAST(N'2013-11-11' AS Date), N'8', 8, N'8', N'8', N'8', 5, N'5–9-vuotiaat', N'5–9 år', N'5–9', N'1v08', N'5v05', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (10, CAST(N'2013-11-11' AS Date), N'9', 9, N'9', N'9', N'9', 5, N'5–9-vuotiaat', N'5–9 år', N'5–9', N'1v09', N'5v05', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (11, CAST(N'2013-11-11' AS Date), N'10', 10, N'10', N'10', N'10', 10, N'10–14-vuotiaat', N'10–14 år', N'Aged 10–14', N'1v10', N'5v10', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (12, CAST(N'2013-11-11' AS Date), N'11', 11, N'11', N'11', N'11', 10, N'10–14-vuotiaat', N'10–14 år', N'Aged 10–14', N'1v11', N'5v10', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (13, CAST(N'2013-11-11' AS Date), N'12', 12, N'12', N'12', N'12', 10, N'10–14-vuotiaat', N'10–14 år', N'Aged 10–14', N'1v12', N'5v10', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (14, CAST(N'2013-11-11' AS Date), N'13', 13, N'13', N'13', N'13', 10, N'10–14-vuotiaat', N'10–14 år', N'Aged 10–14', N'1v13', N'5v10', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (15, CAST(N'2013-11-11' AS Date), N'14', 14, N'14', N'14', N'14', 10, N'10–14-vuotiaat', N'10–14 år', N'Aged 10–14', N'1v14', N'5v10', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (16, CAST(N'2013-11-11' AS Date), N'15', 15, N'15', N'15', N'15', 15, N'15–19-vuotiaat', N'15–19 år', N'Aged 15–19', N'1v15', N'5v15', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (17, CAST(N'2013-11-11' AS Date), N'16', 16, N'16', N'16', N'16', 15, N'15–19-vuotiaat', N'15–19 år', N'Aged 15–19', N'1v16', N'5v15', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (18, CAST(N'2013-11-11' AS Date), N'17', 17, N'17', N'17', N'17', 15, N'15–19-vuotiaat', N'15–19 år', N'Aged 15–19', N'1v17', N'5v15', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (19, CAST(N'2013-11-11' AS Date), N'18', 18, N'18', N'18', N'18', 15, N'15–19-vuotiaat', N'15–19 år', N'Aged 15–19', N'1v18', N'5v15', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (20, CAST(N'2013-11-11' AS Date), N'19', 19, N'19', N'19', N'19', 15, N'15–19-vuotiaat', N'15–19 år', N'Aged 15–19', N'1v19', N'5v15', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (21, CAST(N'2013-11-11' AS Date), N'20', 20, N'20', N'20', N'20', 20, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', N'1v20', N'5v20', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (22, CAST(N'2013-11-11' AS Date), N'21', 21, N'21', N'21', N'21', 20, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', N'1v21', N'5v20', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (23, CAST(N'2013-11-11' AS Date), N'22', 22, N'22', N'22', N'22', 20, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', N'1v22', N'5v20', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (24, CAST(N'2013-11-11' AS Date), N'23', 23, N'23', N'23', N'23', 20, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', N'1v23', N'5v20', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (25, CAST(N'2013-11-11' AS Date), N'24', 24, N'24', N'24', N'24', 20, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', N'1v24', N'5v20', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (26, CAST(N'2013-11-11' AS Date), N'25', 25, N'25', N'25', N'25', 25, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', N'1v25', N'5v25', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (27, CAST(N'2013-11-11' AS Date), N'26', 26, N'26', N'26', N'26', 25, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', N'1v26', N'5v25', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (28, CAST(N'2013-11-11' AS Date), N'27', 27, N'27', N'27', N'27', 25, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', N'1v27', N'5v25', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (29, CAST(N'2013-11-11' AS Date), N'28', 28, N'28', N'28', N'28', 25, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', N'1v28', N'5v25', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (30, CAST(N'2013-11-11' AS Date), N'29', 29, N'29', N'29', N'29', 25, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', N'1v29', N'5v25', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (31, CAST(N'2013-11-11' AS Date), N'30', 30, N'30', N'30', N'30', 30, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', N'1v30', N'5v30', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (32, CAST(N'2013-11-11' AS Date), N'31', 31, N'31', N'31', N'31', 30, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', N'1v31', N'5v30', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (33, CAST(N'2013-11-11' AS Date), N'32', 32, N'32', N'32', N'32', 30, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', N'1v32', N'5v30', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (34, CAST(N'2013-11-11' AS Date), N'33', 33, N'33', N'33', N'33', 30, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', N'1v33', N'5v30', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (35, CAST(N'2013-11-11' AS Date), N'34', 34, N'34', N'34', N'34', 30, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', N'1v34', N'5v30', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (36, CAST(N'2013-11-11' AS Date), N'35', 35, N'35', N'35', N'35', 35, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', N'1v35', N'5v35', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (37, CAST(N'2013-11-11' AS Date), N'36', 36, N'36', N'36', N'36', 35, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', N'1v36', N'5v35', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (38, CAST(N'2013-11-11' AS Date), N'37', 37, N'37', N'37', N'37', 35, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', N'1v37', N'5v35', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (39, CAST(N'2013-11-11' AS Date), N'38', 38, N'38', N'38', N'38', 35, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', N'1v38', N'5v35', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (40, CAST(N'2013-11-11' AS Date), N'39', 39, N'39', N'39', N'39', 35, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', N'1v39', N'5v35', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (41, CAST(N'2013-11-11' AS Date), N'40', 40, N'40', N'40', N'40', 40, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', N'1v40', N'5v40', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (42, CAST(N'2013-11-11' AS Date), N'41', 41, N'41', N'41', N'41', 40, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', N'1v41', N'5v40', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (43, CAST(N'2013-11-11' AS Date), N'42', 42, N'42', N'42', N'42', 40, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', N'1v42', N'5v40', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (44, CAST(N'2013-11-11' AS Date), N'43', 43, N'43', N'43', N'43', 40, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', N'1v43', N'5v40', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (45, CAST(N'2013-11-11' AS Date), N'44', 44, N'44', N'44', N'44', 40, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', N'1v44', N'5v40', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (46, CAST(N'2013-11-11' AS Date), N'45', 45, N'45', N'45', N'45', 45, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', N'1v45', N'5v45', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (47, CAST(N'2013-11-11' AS Date), N'46', 46, N'46', N'46', N'46', 45, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', N'1v46', N'5v45', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (48, CAST(N'2013-11-11' AS Date), N'47', 47, N'47', N'47', N'47', 45, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', N'1v47', N'5v45', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (49, CAST(N'2013-11-11' AS Date), N'48', 48, N'48', N'48', N'48', 45, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', N'1v48', N'5v45', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (50, CAST(N'2013-11-11' AS Date), N'49', 49, N'49', N'49', N'49', 45, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', N'1v49', N'5v45', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (51, CAST(N'2013-11-11' AS Date), N'50', 50, N'50', N'50', N'50', 50, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', N'1v50', N'5v50', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (52, CAST(N'2013-11-11' AS Date), N'51', 51, N'51', N'51', N'51', 50, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', N'1v51', N'5v50', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (53, CAST(N'2013-11-11' AS Date), N'52', 52, N'52', N'52', N'52', 50, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', N'1v52', N'5v50', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (54, CAST(N'2013-11-11' AS Date), N'53', 53, N'53', N'53', N'53', 50, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', N'1v53', N'5v50', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (55, CAST(N'2013-11-11' AS Date), N'54', 54, N'54', N'54', N'54', 50, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', N'1v54', N'5v50', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (56, CAST(N'2013-11-11' AS Date), N'55', 55, N'55', N'55', N'55', 55, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', N'1v55', N'5v55', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (57, CAST(N'2013-11-11' AS Date), N'56', 56, N'56', N'56', N'56', 55, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', N'1v56', N'5v55', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (58, CAST(N'2013-11-11' AS Date), N'57', 57, N'57', N'57', N'57', 55, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', N'1v57', N'5v55', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (59, CAST(N'2013-11-11' AS Date), N'58', 58, N'58', N'58', N'58', 55, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', N'1v58', N'5v55', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (60, CAST(N'2013-11-11' AS Date), N'59', 59, N'59', N'59', N'59', 55, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', N'1v59', N'5v55', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (61, CAST(N'2013-11-11' AS Date), N'60', 60, N'60', N'60', N'60', 60, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', N'1v60', N'5v60', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (62, CAST(N'2013-11-11' AS Date), N'61', 61, N'61', N'61', N'61', 60, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', N'1v61', N'5v60', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (63, CAST(N'2013-11-11' AS Date), N'62', 62, N'62', N'62', N'62', 60, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', N'1v62', N'5v60', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (64, CAST(N'2013-11-11' AS Date), N'63', 63, N'63', N'63', N'63', 60, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', N'1v63', N'5v60', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (65, CAST(N'2013-11-11' AS Date), N'64', 64, N'64', N'64', N'64', 60, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', N'1v64', N'5v60', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (66, CAST(N'2013-11-11' AS Date), N'65', 65, N'65', N'65', N'65', 65, N'65–69-vuotiaat', N'65–69 år', N'Aged 65–69', N'1v65', N'5v65', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (67, CAST(N'2013-11-11' AS Date), N'66', 66, N'66', N'66', N'66', 65, N'65–69-vuotiaat', N'65–69 år', N'Aged 65–69', N'1v66', N'5v65', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (68, CAST(N'2013-11-11' AS Date), N'67', 67, N'67', N'67', N'67', 65, N'65–69-vuotiaat', N'65–69 år', N'Aged 65–69', N'1v67', N'5v65', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (69, CAST(N'2013-11-11' AS Date), N'68', 68, N'68', N'68', N'68', 65, N'65–69-vuotiaat', N'65–69 år', N'Aged 65–69', N'1v68', N'5v65', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (70, CAST(N'2013-11-11' AS Date), N'69', 69, N'69', N'69', N'69', 65, N'65–69-vuotiaat', N'65–69 år', N'Aged 65–69', N'1v69', N'5v65', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (71, CAST(N'2013-11-11' AS Date), N'70', 70, N'70', N'70', N'70', 70, N'70–74-vuotiaat', N'70–74 år', N'Aged 70–74', N'1v70', N'5v70', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (72, CAST(N'2013-11-11' AS Date), N'71', 71, N'71', N'71', N'71', 70, N'70–74-vuotiaat', N'70–74 år', N'Aged 70–74', N'1v71', N'5v70', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (73, CAST(N'2013-11-11' AS Date), N'72', 72, N'72', N'72', N'72', 70, N'70–74-vuotiaat', N'70–74 år', N'Aged 70–74', N'1v72', N'5v70', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (74, CAST(N'2013-11-11' AS Date), N'73', 73, N'73', N'73', N'73', 70, N'70–74-vuotiaat', N'70–74 år', N'Aged 70–74', N'1v73', N'5v70', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (75, CAST(N'2013-11-11' AS Date), N'74', 74, N'74', N'74', N'74', 70, N'70–74-vuotiaat', N'70–74 år', N'Aged 70–74', N'1v74', N'5v70', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (76, CAST(N'2013-11-11' AS Date), N'75', 75, N'75', N'75', N'75', 75, N'75–79-vuotiaat', N'75–79 år', N'Aged 75–79', N'1v75', N'5v75', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (77, CAST(N'2013-11-11' AS Date), N'76', 76, N'76', N'76', N'76', 75, N'75–79-vuotiaat', N'75–79 år', N'Aged 75–79', N'1v76', N'5v75', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (78, CAST(N'2013-11-11' AS Date), N'77', 77, N'77', N'77', N'77', 75, N'75–79-vuotiaat', N'75–79 år', N'Aged 75–79', N'1v77', N'5v75', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (79, CAST(N'2013-11-11' AS Date), N'78', 78, N'78', N'78', N'78', 75, N'75–79-vuotiaat', N'75–79 år', N'Aged 75–79', N'1v78', N'5v75', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (80, CAST(N'2013-11-11' AS Date), N'79', 79, N'79', N'79', N'79', 75, N'75–79-vuotiaat', N'75–79 år', N'Aged 75–79', N'1v79', N'5v75', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (81, CAST(N'2013-11-11' AS Date), N'80', 80, N'80', N'80', N'80', 80, N'80–84-vuotiaat', N'80–84 år', N'Aged 80–84', N'1v80', N'5v80', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (82, CAST(N'2013-11-11' AS Date), N'81', 81, N'81', N'81', N'81', 80, N'80–84-vuotiaat', N'80–84 år', N'Aged 80–84', N'1v81', N'5v80', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (83, CAST(N'2013-11-11' AS Date), N'82', 82, N'82', N'82', N'82', 80, N'80–84-vuotiaat', N'80–84 år', N'Aged 80–84', N'1v82', N'5v80', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (84, CAST(N'2013-11-11' AS Date), N'83', 83, N'83', N'83', N'83', 80, N'80–84-vuotiaat', N'80–84 år', N'Aged 80–84', N'1v83', N'5v80', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (85, CAST(N'2013-11-11' AS Date), N'84', 84, N'84', N'84', N'84', 80, N'80–84-vuotiaat', N'80–84 år', N'Aged 80–84', N'1v84', N'5v80', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (86, CAST(N'2013-11-11' AS Date), N'85', 85, N'85', N'85', N'85', 85, N'85–89-vuotiaat', N'85–89 år', N'Aged 85–89', N'1v85', N'5v85', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (87, CAST(N'2013-11-11' AS Date), N'86', 86, N'86', N'86', N'86', 85, N'85–89-vuotiaat', N'85–89 år', N'Aged 85–89', N'1v86', N'5v85', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (88, CAST(N'2013-11-11' AS Date), N'87', 87, N'87', N'87', N'87', 85, N'85–89-vuotiaat', N'85–89 år', N'Aged 85–89', N'1v87', N'5v85', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (89, CAST(N'2013-11-11' AS Date), N'88', 88, N'88', N'88', N'88', 85, N'85–89-vuotiaat', N'85–89 år', N'Aged 85–89', N'1v88', N'5v85', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (90, CAST(N'2013-11-11' AS Date), N'89', 89, N'89', N'89', N'89', 85, N'85–89-vuotiaat', N'85–89 år', N'Aged 85–89', N'1v89', N'5v85', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (91, CAST(N'2013-11-11' AS Date), N'90', 90, N'90', N'90', N'90', 90, N'90–94-vuotiaat', N'90–94 år', N'Aged 90–94', N'1v90', N'5v90', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (92, CAST(N'2013-11-11' AS Date), N'91', 91, N'91', N'91', N'91', 90, N'90–94-vuotiaat', N'90–94 år', N'Aged 90–94', N'1v91', N'5v90', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (93, CAST(N'2013-11-11' AS Date), N'92', 92, N'92', N'92', N'92', 90, N'90–94-vuotiaat', N'90–94 år', N'Aged 90–94', N'1v92', N'5v90', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (94, CAST(N'2013-11-11' AS Date), N'93', 93, N'93', N'93', N'93', 90, N'90–94-vuotiaat', N'90–94 år', N'Aged 90–94', N'1v93', N'5v90', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (95, CAST(N'2013-11-11' AS Date), N'94', 94, N'94', N'94', N'94', 90, N'90–94-vuotiaat', N'90–94 år', N'Aged 90–94', N'1v94', N'5v90', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (96, CAST(N'2013-11-11' AS Date), N'95', 95, N'95', N'95', N'95', 95, N'yli 95-vuotiaat', N'över 95 år', N'Over 95', N'1v95', N'5v95', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (97, CAST(N'2013-11-11' AS Date), N'96', 96, N'96', N'96', N'96', 95, N'yli 95-vuotiaat', N'över 95 år', N'Over 95', N'1v96', N'5v95', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (98, CAST(N'2013-11-11' AS Date), N'97', 97, N'97', N'97', N'97', 95, N'yli 95-vuotiaat', N'över 95 år', N'Over 95', N'1v97', N'5v95', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (99, CAST(N'2013-11-11' AS Date), N'98', 98, N'98', N'98', N'98', 95, N'yli 95-vuotiaat', N'över 95 år', N'Over 95', N'1v98', N'5v95', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (100, CAST(N'2013-11-11' AS Date), N'99', 99, N'99', N'99', N'99', 95, N'yli 95-vuotiaat', N'över 95 år', N'Over 95', N'1v99', N'5v95', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (101, CAST(N'2015-12-28' AS Date), N'100', 100, N'100', N'100', N'100', 100, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v990', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (102, CAST(N'2015-12-28' AS Date), N'101', 101, N'101', N'101', N'101', 100, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v991', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (103, CAST(N'2015-12-28' AS Date), N'102', 102, N'102', N'102', N'102', 100, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v992', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (104, CAST(N'2015-12-28' AS Date), N'103', 103, N'103', N'103', N'103', 100, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v993', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (105, CAST(N'2015-12-28' AS Date), N'104', 104, N'104', N'104', N'104', 100, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v994', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (106, CAST(N'2015-12-28' AS Date), N'105', 105, N'105', N'105', N'105', 105, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v995', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (107, CAST(N'2015-12-28' AS Date), N'106', 106, N'106', N'106', N'106', 105, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v996', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (108, CAST(N'2015-12-28' AS Date), N'107', 107, N'107', N'107', N'107', 105, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v997', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (109, CAST(N'2015-12-28' AS Date), N'108', 108, N'108', N'108', N'108', 105, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v998', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (110, CAST(N'2015-12-28' AS Date), N'109', 109, N'109', N'109', N'109', 105, N'100-vuotiaat ja vanhemmat', N'100 år eller äldre', N'Aged 100 or older', N'1v999', N'5v99', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (111, CAST(N'2013-11-11' AS Date), N'5v0', -1, N'alle 5-vuotiaat', N'under 5 år', N'Under 5', 0, N'alle 5-vuotiaat', N'under 5 år', N'Under 5', N'1v00', N'5v00', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (112, CAST(N'2013-11-11' AS Date), N'5v5', -1, N'5–9-vuotiaat', N'5–9 år', N'5–9', 5, N'5–9-vuotiaat', N'5–9 år', N'5–9', N'1v05', N'5v05', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (113, CAST(N'2013-11-11' AS Date), N'5v10', -1, N'10–14-vuotiaat', N'10–14 år', N'Aged 10–14', 10, N'10–14-vuotiaat', N'10–14 år', N'Aged 10–14', N'1v10', N'5v10', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (114, CAST(N'2013-11-11' AS Date), N'5v15', -1, N'15–19-vuotiaat', N'15–19 år', N'Aged 15–19', 15, N'15–19-vuotiaat', N'15–19 år', N'Aged 15–19', N'1v15', N'5v15', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (115, CAST(N'2013-11-11' AS Date), N'5v20', -1, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', 20, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', N'1v20', N'5v20', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (116, CAST(N'2013-11-11' AS Date), N'5v25', -1, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', 25, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', N'1v25', N'5v25', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (117, CAST(N'2013-11-11' AS Date), N'5v30', -1, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', 30, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', N'1v30', N'5v30', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (118, CAST(N'2013-11-11' AS Date), N'5v35', -1, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', 35, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', N'1v35', N'5v35', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (119, CAST(N'2013-11-11' AS Date), N'5v40', -1, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', 40, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', N'1v40', N'5v40', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (120, CAST(N'2013-11-11' AS Date), N'5v45', -1, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', 45, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', N'1v45', N'5v45', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (121, CAST(N'2013-11-11' AS Date), N'5v50', -1, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', 50, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', N'1v50', N'5v50', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (122, CAST(N'2013-11-11' AS Date), N'5v55', -1, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', 55, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', N'1v55', N'5v55', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (123, CAST(N'2013-11-11' AS Date), N'5v60', -1, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', 60, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', N'1v60', N'5v60', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (124, CAST(N'2013-11-11' AS Date), N'5v65', -1, N'65–69-vuotiaat', N'65–69 år', N'Aged 65–69', 65, N'65–69-vuotiaat', N'65–69 år', N'Aged 65–69', N'1v65', N'5v65', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (125, CAST(N'2013-11-11' AS Date), N'5v70', -1, N'70–74-vuotiaat', N'70–74 år', N'Aged 70–74', 70, N'70–74-vuotiaat', N'70–74 år', N'Aged 70–74', N'1v70', N'5v70', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (126, CAST(N'2013-11-11' AS Date), N'5v75', -1, N'75–79-vuotiaat', N'75–79 år', N'Aged 75–79', 75, N'75–79-vuotiaat', N'75–79 år', N'Aged 75–79', N'1v75', N'5v75', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (127, CAST(N'2013-11-11' AS Date), N'5v80', -1, N'80–84-vuotiaat', N'80–84 år', N'Aged 80–84', 80, N'80–84-vuotiaat', N'80–84 år', N'Aged 80–84', N'1v80', N'5v80', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (128, CAST(N'2013-11-11' AS Date), N'5v85', -1, N'85–89-vuotiaat', N'85–89 år', N'Aged 85–89', 85, N'85–89-vuotiaat', N'85–89 år', N'Aged 85–89', N'1v85', N'5v85', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (129, CAST(N'2013-11-11' AS Date), N'5v90', -1, N'90–94-vuotiaat', N'90–94 år', N'Aged 90–94', 90, N'90–94-vuotiaat', N'90–94 år', N'Aged 90–94', N'1v90', N'5v90', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (130, CAST(N'2013-11-11' AS Date), N'5v95', -1, N'yli 95-vuotiaat', N'över 95 år', N'Over 95', 95, N'yli 95-vuotiaat', N'över 95 år', N'Over 95', N'1v95', N'5v95', N'E', N' ', N'Manuaalinen', N'')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (131, CAST(N'2014-02-03' AS Date), N'kirikar115', -1, N'15–19-vuotiaat', N'15–19 år', N'Aged 15–19', 15, N'15–19-vuotiaat', N'15–19 år', N'Aged 15–19', N'1v15', N'5v15', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (132, CAST(N'2014-02-03' AS Date), N'kirikar120', -1, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', 20, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', N'1v20', N'5v20', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (133, CAST(N'2014-02-03' AS Date), N'kirikar125', -1, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', 25, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', N'1v25', N'5v25', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (134, CAST(N'2014-02-03' AS Date), N'kirikar130', -1, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', 30, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', N'1v30', N'5v30', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (135, CAST(N'2014-02-03' AS Date), N'kirikar135', -1, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', 35, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', N'1v35', N'5v35', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (136, CAST(N'2014-02-03' AS Date), N'kirikar140', -1, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', 40, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', N'1v40', N'5v40', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (137, CAST(N'2014-02-03' AS Date), N'kirikar145', -1, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', 45, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', N'1v45', N'5v45', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (138, CAST(N'2014-02-03' AS Date), N'kirikar150', -1, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', 50, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', N'1v50', N'5v50', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (139, CAST(N'2014-02-03' AS Date), N'kirikar155', -1, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', 55, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', N'1v55', N'5v55', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (140, CAST(N'2014-02-03' AS Date), N'kirikar160', -1, N'60-vuotiaat ja sitä vanhemmat', N'60 år eller äldre', N'Aged 60 or older', 60, N'60-vuotiaat ja sitä vanhemmat', N'60 år eller äldre', N'Aged 60 or older', N'1v60', N'5v60', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (141, CAST(N'2014-02-03' AS Date), N'kirikar1XX', -1, N'ei tietoa', N'Okänt', N'Unknown', -1, N'ei tietoa', N'Okänt', N'Unknown', N'99', N'99', N'E', N'0', N'Tilastokeskus', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (142, CAST(N'2014-09-22' AS Date), N'19655v19', -1, N'19-vuotiaat ja sitä nuoremmat', N'19 år eller yngre', N'Aged 19 or under', 19, N'19-vuotiaat ja sitä nuoremmat', N'19 år eller yngre', N'Aged 19 or under', N'1v19', N'5v19', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (143, CAST(N'2014-09-22' AS Date), N'19655v20', -1, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', 20, N'20–24-vuotiaat', N'20–24 år', N'Aged 20–24', N'1v20', N'5v20', N'E', N' ', N'Manuaalinen ', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (144, CAST(N'2014-09-22' AS Date), N'19655v25', -1, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', 25, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', N'1v25', N'5v25', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (145, CAST(N'2014-09-22' AS Date), N'19655v30', -1, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', 30, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', N'1v30', N'5v30', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (146, CAST(N'2014-09-22' AS Date), N'19655v35', -1, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', 35, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', N'1v35', N'5v35', N'E', N' ', N'Manuaalinen ', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (147, CAST(N'2014-09-22' AS Date), N'19655v40', -1, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', 40, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', N'1v40', N'5v40', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (148, CAST(N'2014-09-22' AS Date), N'19655v45', -1, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', 45, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', N'1v45', N'5v45', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (149, CAST(N'2014-09-22' AS Date), N'19655v50', -1, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', 50, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', N'1v50', N'5v50', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (150, CAST(N'2014-09-22' AS Date), N'19655v55', -1, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', 55, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', N'1v55', N'5v55', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (151, CAST(N'2014-09-22' AS Date), N'19655v60', -1, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', 60, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', N'1v60', N'5v60', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (152, CAST(N'2014-09-22' AS Date), N'19655v65', -1, N'65-vuotiaat ja sitä vanhemmat', N'65 år eller äldre', N'Aged 65 or older', 65, N'65-vuotiaat ja sitä vanhemmat', N'65 år eller äldre', N'Aged 65 or older', N'1v65', N'5v65', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (153, CAST(N'2014-09-22' AS Date), N'1141', 14, N'14-vuotiaat ja sitä nuoremmat', N'14 år eller yngre', N'Aged 14 or under', 14, N'14-vuotiaat ja sitä nuoremmat', N'14 år eller yngre', N'Aged 14 or under', N'1v14', N'5v14', N'E', N' ', N'Manuaalinen', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (154, CAST(N'2015-01-26' AS Date), N'ikar41', -1, N'15–24-vuotiaat', N'15–24 år', N'Aged 15–24', 15, N'15–24-vuotiaat', N'15–24 år', N'Aged 15–24', N'1v15', N'5v15', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (155, CAST(N'2015-01-26' AS Date), N'ikar42', -1, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', 25, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', N'1v25', N'5v25', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (156, CAST(N'2015-01-26' AS Date), N'ikar43', -1, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', 30, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', N'1v30', N'5v30', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (157, CAST(N'2015-01-26' AS Date), N'ikar44', -1, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', 35, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', N'1v35', N'5v35', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (158, CAST(N'2015-01-26' AS Date), N'ikar45', -1, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', 40, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', N'1v40', N'5v40', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (159, CAST(N'2015-01-26' AS Date), N'ikar46', -1, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', 45, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', N'1v45', N'5v45', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (160, CAST(N'2015-01-26' AS Date), N'ikar47', -1, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', 50, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', N'1v50', N'5v50', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (161, CAST(N'2015-01-26' AS Date), N'ikar48', -1, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', 55, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', N'1v55', N'5v55', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (162, CAST(N'2015-01-26' AS Date), N'ikar49', -1, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', 60, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', N'1v60', N'5v60', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (163, CAST(N'2015-01-26' AS Date), N'ikar40', -1, N'65-vuotiaat ja sitä vanhemmat', N'65 år eller äldre', N'Aged 65 or older', 65, N'65-vuotiaat ja sitä vanhemmat', N'65 år eller äldre', N'Aged 65 or older', N'1v65', N'5v65', N'E', N'0', N'Tilastokeskus 5-aineistot', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (164, CAST(N'2015-03-12' AS Date), N'18655v18', -1, N'18-vuotiaat ja sitä nuoremmat', N'18 år eller yngre', N'Aged 18 or under', 18, N'18-vuotiaat ja sitä nuoremmat', N'18 år eller yngre', N'Aged 18 or under', N'1v18', N'5v18', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (165, CAST(N'2015-05-11' AS Date), N'30655v30', -1, N'alle 30-vuotiaat', N'under 30 år', N'Under 30', 30, N'alle 30-vuotiaat', N'under 30 år', N'Under 30', N'1v29', N'5v29', N'E', N' ', N'Tilastokeskus 7-aineistot', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (166, CAST(N'2015-11-30' AS Date), N'ikar224', -1, N'0–24-vuotiaat', N'0–24 år', N'Aged 0–24', 24, N'0–24-vuotiaat', N'0–24 år', N'Aged 0–24', N'1v24', N'5v24', N'E', N' ', N'Tilastokeskus', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (167, CAST(N'2015-11-30' AS Date), N'ikar225', -1, N'25-vuotiaat ja sitä vanhemmat', N'25 år eller äldre', N'Aged 25 or older', 25, N'25-vuotiaat ja sitä vanhemmat', N'25 år eller äldre', N'Aged 25 or older', N'1v25', N'5v25', N'E', N' ', N'Tilastokeskus', N'CSC Kati')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (168, CAST(N'2015-12-28' AS Date), N'95v2', 95, N'95', N'95', N'95', 95, N'95–99-vuotiaat', N'95–99 år', N'Aged 95–99', N'1v95', N'5v95', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (169, CAST(N'2015-12-28' AS Date), N'96v2', 96, N'96', N'96', N'96', 95, N'95–99-vuotiaat', N'95–99 år', N'Aged 95–99', N'1v96', N'5v95', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (170, CAST(N'2015-12-28' AS Date), N'97v2', 97, N'97', N'97', N'97', 95, N'95–99-vuotiaat', N'95–99 år', N'Aged 95–99', N'1v97', N'5v95', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (171, CAST(N'2015-12-28' AS Date), N'98v2', 98, N'98', N'98', N'98', 95, N'95–99-vuotiaat', N'95–99 år', N'Aged 95–99', N'1v98', N'5v95', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (172, CAST(N'2015-12-28' AS Date), N'99v2', 99, N'99', N'99', N'99', 95, N'95–99-vuotiaat', N'95–99 år', N'Aged 95–99', N'1v99', N'5v95', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (173, CAST(N'2016-04-05' AS Date), N'ikar5_1', -1, N'24-vuotiaat ja sitä nuoremmat', N'24 år eller yngre', N'Aged 24 or under', -1, N'Tuntematon', N'Okänt', N'Unknown', N'1v24', N'ikar5_1', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (174, CAST(N'2016-04-05' AS Date), N'ikar5_2', -1, N'25–34-vuotiaat', N'25–34 år', N'Aged 25–34', -1, N'Tuntematon', N'Okänt', N'Unknown', N'1v25', N'ikar5_2', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (175, CAST(N'2016-04-05' AS Date), N'ikar5_3', -1, N'35–44-vuotiaat', N'35–44 år', N'Aged 35–44', -1, N'Tuntematon', N'Okänt', N'Unknown', N'1v34', N'ikar5_3', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (176, CAST(N'2016-04-05' AS Date), N'ikar5_4', -1, N'45–54-vuotiaat', N'45–54 år', N'Aged 45–54', -1, N'Tuntematon', N'Okänt', N'Unknown', N'1v44', N'ikar5_4', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (177, CAST(N'2016-04-05' AS Date), N'ikar5_5', -1, N'55–64-vuotiaat', N'55–64 år', N'Aged 55–64', -1, N'Tuntematon', N'Okänt', N'Unknown', N'1v54', N'ikar5_5', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (178, CAST(N'2016-04-05' AS Date), N'ikar5_6', -1, N'65-vuotiaat ja sitä vanhemmat', N'65 år eller äldre', N'Aged 65 or older', -1, N'Tuntematon', N'Okänt', N'Unknown', N'1v64', N'ikar5_6', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (179, CAST(N'2016-04-05' AS Date), N'ikaryh2_2', -1, N'0–2-vuotiaat', N'0–2 år', N'Aged 0–2', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_02', N'ikaryh2_02', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (180, CAST(N'2016-04-05' AS Date), N'ikaryh2_5', -1, N'3–5-vuotiaat', N'3–5 år', N'Aged 3–5', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_05', N'ikaryh2_05', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (181, CAST(N'2016-04-05' AS Date), N'ikaryh2_6', -1, N'6-vuotiaat', N'6 år', N'Aged 6', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_06', N'ikaryh2_06', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (182, CAST(N'2016-04-05' AS Date), N'ikaryh2_12', -1, N'7–12-vuotiaat', N'7–12 år', N'Aged 7–12', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_12', N'ikaryh2_12', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (183, CAST(N'2016-04-05' AS Date), N'ikaryh2_15', -1, N'13–15-vuotiaat', N'13–15 år', N'Aged 13–15', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_15', N'ikaryh2_15', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (184, CAST(N'2016-04-05' AS Date), N'ikaryh2_18', -1, N'16–18-vuotiaat', N'16–18 år', N'Aged 16–18', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_18', N'ikaryh2_18', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (185, CAST(N'2016-04-05' AS Date), N'ikaryh2_21', -1, N'19–21-vuotiaat', N'19–21 år', N'Aged 19–21', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_21', N'ikaryh2_21', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (186, CAST(N'2016-04-05' AS Date), N'ikaryh2_24', -1, N'22–24-vuotiaat', N'22–24 år', N'Aged 22–24', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_24', N'ikaryh2_24', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (187, CAST(N'2016-04-05' AS Date), N'ikaryh2_29', -1, N'25–29-vuotiaat', N'25–29 år', N'Aged 25–29', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_29', N'ikaryh2_29', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (188, CAST(N'2016-04-05' AS Date), N'ikaryh2_34', -1, N'30–34-vuotiaat', N'30–34 år', N'Aged 30–34', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_34', N'ikaryh2_34', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (189, CAST(N'2016-04-05' AS Date), N'ikaryh2_39', -1, N'35–39-vuotiaat', N'35–39 år', N'Aged 35–39', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_39', N'ikaryh2_39', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (190, CAST(N'2016-04-05' AS Date), N'ikaryh2_44', -1, N'40–44-vuotiaat', N'40–44 år', N'Aged 40–44', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_44', N'ikaryh2_44', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (191, CAST(N'2016-04-05' AS Date), N'ikaryh2_49', -1, N'45–49-vuotiaat', N'45–49 år', N'Aged 45–49', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_49', N'ikaryh2_49', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (192, CAST(N'2016-04-05' AS Date), N'ikaryh2_54', -1, N'50–54-vuotiaat', N'50–54 år', N'Aged 50–54', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_54', N'ikaryh2_54', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (193, CAST(N'2016-04-05' AS Date), N'ikaryh2_59', -1, N'55–59-vuotiaat', N'55–59 år', N'Aged 55–59', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_59', N'ikaryh2_59', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (194, CAST(N'2016-04-05' AS Date), N'ikaryh2_64', -1, N'60–64-vuotiaat', N'60–64 år', N'Aged 60–64', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_64', N'ikaryh2_64', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (195, CAST(N'2016-04-05' AS Date), N'ikaryh2_65', -1, N'65-vuotiaat ja sitä vanhemmat', N'65 år eller äldre', N'Aged 65 or older', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikaryh2_65', N'ikaryh2_65', N'E', N' ', N'Manuaalinen', N'CSC Lasse')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (196, CAST(N'2016-07-20' AS Date), N'ikar2b_2', -1, N'0–2-vuotiaat', N'0–2 år', N'Aged 0–2', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_02', N'ikar2b_02', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (197, CAST(N'2016-07-20' AS Date), N'ikar2b_5', -1, N'3–5-vuotiaat', N'3–5 år', N'Aged 3–5', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_05', N'ikar2b_05', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (198, CAST(N'2016-07-20' AS Date), N'ikar2b_6', -1, N'6-vuotiaat', N'6 år', N'Aged 6', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_06', N'ikar2b_06', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (199, CAST(N'2016-07-20' AS Date), N'ikar2b_12', -1, N'7–12-vuotiaat', N'7–12 år', N'Aged 7–12', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_12', N'ikar2b_12', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (200, CAST(N'2016-07-20' AS Date), N'ikar2b_15', -1, N'13–15-vuotiaat', N'13–15 år', N'Aged 13–15', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_15', N'ikar2b_15', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (201, CAST(N'2016-07-20' AS Date), N'ikar2b_18', -1, N'16–18-vuotiaat', N'16–18 år', N'Aged 16–18', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_18', N'ikar2b_18', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (202, CAST(N'2016-07-20' AS Date), N'ikar2b_21', -1, N'19–21-vuotiaat', N'19–21 år', N'Aged 19–21', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_21', N'ikar2b_21', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (203, CAST(N'2016-07-20' AS Date), N'ikar2b_24', -1, N'22–24-vuotiaat', N'22–24 år', N'Aged 22–24', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_24', N'ikar2b_24', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (204, CAST(N'2016-07-20' AS Date), N'ikar2b_64', -1, N'25–64-vuotiaat', N'25–64 år', N'Aged 25–64', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_64', N'ikar2b_64', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (205, CAST(N'2016-07-20' AS Date), N'ikar2b_65', -1, N'65-vuotiaat ja sitä vanhemmat', N'65 år eller äldre', N'Aged 65 or older', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar2b_65', N'ikar2b_65', N'E', N' ', N'Manuaalinen', N'CSC Jarmo')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (206, CAST(N'2018-03-06' AS Date), N'ikar6_15', -1, N'15–24-vuotiaat', N'15–24 år', N'Aged 15–24', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar6_15', N'ikar6_15', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (207, CAST(N'2018-03-06' AS Date), N'ikar6_25', -1, N'25–34-vuotiaat', N'25–34 år', N'Aged 25–34', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar6_25', N'ikar6_25', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (208, CAST(N'2018-03-06' AS Date), N'ikar6_35', -1, N'35–44-vuotiaat', N'35–44 år', N'Aged 35–44', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar6_35', N'ikar6_35', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (209, CAST(N'2018-03-06' AS Date), N'ikar6_45', -1, N'45–54-vuotiaat', N'45–54 år', N'Aged 45–54', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar6_45', N'ikar6_45', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (210, CAST(N'2018-03-06' AS Date), N'ikar6_55', -1, N'55–64-vuotiaat', N'55–64 år', N'Aged 55–64', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar6_55', N'ikar6_55', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
INSERT [dbo].[ika] ([id], [luotu], [ika_avain], [ika_int], [ika], [ika_SV], [ika_EN], [ika5v_int], [ika5v], [ika5v_SV], [ika5v_EN], [jarjestys_ika], [jarjestys_ika5v], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (211, CAST(N'2018-03-06' AS Date), N'ikar6_65', -1, N'65–74-vuotiaat', N'65–74 år', N'Aged 65–74', -1, N'Tuntematon', N'Okänt', N'Unknown', N'ikar6_65', N'ikar6_65', N'E', N' ', N'Manuaalinen', N'CSC Anssi')
GO
USE [ANTERO]