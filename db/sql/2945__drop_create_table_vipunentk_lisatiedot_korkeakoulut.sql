USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[korkeakoulut]    Script Date: 31.3.2020 9:41:20 ******/
DROP TABLE [dbo].[korkeakoulut]
GO
/****** Object:  Table [dbo].[korkeakoulut]    Script Date: 31.3.2020 9:41:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[korkeakoulut](
	[oppilaitoskoodi] [nvarchar](10) NULL,
	[oppilaitos] [nvarchar](255) NULL,
	[oppilaitos_SV] [nvarchar](255) NULL,
	[oppilaitos_EN] [nvarchar](255) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01710', N'Poliisiammattikorkeakoulu', N'Poliisiammattikorkeakoulu', N'Police University College')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02466', N'Tampereen ammattikorkeakoulu', N'Tampereen ammattikorkeakoulu', N'Tampere University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02467', N'Hämeen ammattikorkeakoulu', N'Hämeen ammattikorkeakoulu', N'HAMK University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02468', N'Haaga-Helia ammattikorkeakoulu', N'Haaga-Helia ammattikorkeakoulu', N'Haaga-Helia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02469', N'Karelia-ammattikorkeakoulu', N'Karelia-ammattikorkeakoulu', N'Karelia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02470', N'Lahden ammattikorkeakoulu', N'Lahden ammattikorkeakoulu', N'Lahti University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02471', N'Oulun ammattikorkeakoulu', N'Oulun ammattikorkeakoulu', N'Oulu University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02472', N'Seinäjoen ammattikorkeakoulu', N'Seinäjoen ammattikorkeakoulu', N'Seinäjoki University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02473', N'Kajaanin ammattikorkeakoulu', N'Kajaanin ammattikorkeakoulu', N'Kajaani University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02474', N'Metropolia Ammattikorkeakoulu', N'Metropolia Ammattikorkeakoulu', N'Helsinki Metropolia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02503', N'Haaga-Helia ammattikorkeakoulu', N'Haaga-Helia ammattikorkeakoulu', N'Haaga-Helia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02504', N'Jyväskylän ammattikorkeakoulu', N'Jyväskylän ammattikorkeakoulu', N'JAMK University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02505', N'Lapin ammattikorkeakoulu', N'Lapin ammattikorkeakoulu', N'Lapland University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02506', N'Mikkelin ammattikorkeakoulu', N'Mikkelin ammattikorkeakoulu', N'Mikkeli University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02507', N'Satakunnan ammattikorkeakoulu', N'Satakunnan ammattikorkeakoulu', N'Satakunta University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02508', N'Yrkeshögskolan Novia', N'Yrkeshögskolan Novia', N'Novia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02509', N'Turun ammattikorkeakoulu', N'Turun ammattikorkeakoulu', N'Turku University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02535', N'Yrkeshögskolan Arcada', N'Yrkeshögskolan Arcada', N'Arcada University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02536', N'Centria-ammattikorkeakoulu', N'Centria-ammattikorkeakoulu', N'Centria University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02537', N'Savonia-ammattikorkeakoulu', N'Savonia-ammattikorkeakoulu', N'Savonia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02538', N'Lapin ammattikorkeakoulu', N'Lapin ammattikorkeakoulu', N'Lapland University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02557', N'Poliisiammattikorkeakoulu', N'Poliisiammattikorkeakoulu', N'Police University College')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02608', N'Kymenlaakson ammattikorkeak.', N'Kymenlaakson ammattikorkeak.', N'Kymenlaakso University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02609', N'Saimaan ammattikorkeakoulu', N'Saimaan ammattikorkeakoulu', N'Saimaa University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02623', N'Diakonia-ammattikorkeakoulu', N'Diakonia-ammattikorkeakoulu', N'Diaconia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02624', N'Metropolia Ammattikorkeakoulu', N'Metropolia Ammattikorkeakoulu', N'Helsinki Metropolia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02625', N'Yrkeshögskolan Novia', N'Yrkeshögskolan Novia', N'Novia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02627', N'Vaasan ammattikorkeakoulu', N'Vaasan ammattikorkeakoulu', N'Vaasa University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02629', N'Laurea-ammattikorkeakoulu', N'Laurea-ammattikorkeakoulu', N'Laurea University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02630', N'Tampereen ammattikorkeakoulu', N'Tampereen ammattikorkeakoulu', N'Tampere University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'02631', N'Humanistinen ammattikorkeak.', N'Humanistinen ammattikorkeak.', N'HUMAK University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10031', N'Högskolan på Åland', N'Högskolan på Åland', N'Åland University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10056', N'Haaga-Helia ammattikorkeakoulu', N'Haaga-Helia ammattikorkeakoulu', N'Haaga-Helia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10065', N'Metropolia Ammattikorkeakoulu', N'Metropolia Ammattikorkeakoulu', N'Helsinki Metropolia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10066', N'Yrkeshögskolan Novia', N'Yrkeshögskolan Novia', N'Novia University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10108', N'Lapin ammattikorkeakoulu', N'Lapin ammattikorkeakoulu', N'Lapland University of Applied Sciences')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01741', N'Aalto-yliopisto', N'Aalto-universitetet', N'​Aalto University')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01907', N'Aalto-yliopisto', N'Aalto-universitetet', N'​Aalto University')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01909', N'Aalto-yliopisto', N'Aalto-universitetet', N'​Aalto University')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10076', N'Aalto-yliopisto', N'Aalto-universitetet', N'​Aalto University')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01901', N'Helsingin yliopisto', N'Helsingfors universitet', N'University of Helsinki')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01916', N'Itä-Suomen yliopisto', N'Östra Finlands universitet', N'University of Eastern Finland')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01917', N'Itä-Suomen yliopisto', N'Östra Finlands universitet', N'University of Eastern Finland')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10088', N'Itä-Suomen yliopisto', N'Östra Finlands universitet', N'University of Eastern Finland')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01906', N'Jyväskylän yliopisto', N'Jyväskylä universitet', N'University of Jyväskylä')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01918', N'Lapin yliopisto', N'Lapplands universitet', N'University of Lapland')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01914', N'Lappeenrannan–Lahden teknillinen yliopisto', N'Villmanstrand–Lahtis tekniska universitet', N'Lappeenranta–Lahti University of Technology')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01904', N'Oulun yliopisto', N'Uleåborgs universitet', N'University of Oulu')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01910', N'Svenska handelshögskolan', N'Svenska handelsh​​​​​​ögskolan', N'​Hanken School of Economics')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01717', N'Taideyliopisto', N'Konstuniversitetet', N'University of the Arts Helsinki')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01740', N'Taideyliopisto', N'Konstuniversitetet', N'University of the Arts Helsinki')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01742', N'Taideyliopisto', N'Konstuniversitetet', N'University of the Arts Helsinki')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10103', N'Taideyliopisto', N'Konstuniversitetet', N'University of the Arts Helsinki')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01915', N'Tampereen tekn. yliopisto', N'Tammerfors tekniska universitet ', N'Tampere University of Technology')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01905', N'Tampereen yliopisto', N'Tammerfors universitet ', N'University of Tampere')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01902', N'Turun yliopisto', N'Åbo universitet ', N'University of Turku')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01911', N'Turun yliopisto', N'Åbo universitet ', N'University of Turku')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10089', N'Turun yliopisto', N'Åbo universitet ', N'University of Turku')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01913', N'Vaasan yliopisto', N'Vasa universitet ', N'University of Vaasa')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'01903', N'Åbo Akademi', N'Åbo Akademi ', N'Åbo Akademi University')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10122', N'Tampereen yliopisto', N'Tammerfors universitet', N'University of Tampere')
GO
INSERT [dbo].[korkeakoulut] ([oppilaitoskoodi], [oppilaitos], [oppilaitos_SV], [oppilaitos_EN]) VALUES (N'10118', N'Kaakkois-Suomen ammattikorkeakoulu', N'Kaakkois-Suomen ammattikorkeakoulu', N'South-Eastern Finland University of Applied Sciences')
GO

USE [ANTERO]