USE [ANTERO]
GO
/****** Object:  Table [dw].[d_opintojenlaajuusyksikko]    Script Date: 9.2.2022 10:26:24 ******/
DROP TABLE [dw].[d_opintojenlaajuusyksikko]
GO
/****** Object:  Table [dw].[d_opintojenlaajuusyksikko]    Script Date: 9.2.2022 10:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_opintojenlaajuusyksikko](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodiarvo] [varchar](10) NULL,
	[nimi] [varchar](100) NULL,
	[nimi_sv] [varchar](100) NULL,
	[nimi_en] [varchar](100) NULL,
	[koodisto_uri] [varchar](100) NULL,
 CONSTRAINT [PK__d_opintojenlaajuusyksikko] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_opintojenlaajuusyksikko] ON 

GO
INSERT [dw].[d_opintojenlaajuusyksikko] ([id], [koodiarvo], [nimi], [nimi_sv], [nimi_en], [koodisto_uri]) VALUES (1, N'1', N'opintoviikkoa', N'studieveckor', NULL, N'opintojenlaajuusyksikko')
GO
INSERT [dw].[d_opintojenlaajuusyksikko] ([id], [koodiarvo], [nimi], [nimi_sv], [nimi_en], [koodisto_uri]) VALUES (2, N'2', N'opintopistettä', N'studiepoäng', NULL, N'opintojenlaajuusyksikko')
GO
INSERT [dw].[d_opintojenlaajuusyksikko] ([id], [koodiarvo], [nimi], [nimi_sv], [nimi_en], [koodisto_uri]) VALUES (3, N'3', N'vuosiviikkotuntia', N'årsveckotimmar', NULL, N'opintojenlaajuusyksikko')
GO
INSERT [dw].[d_opintojenlaajuusyksikko] ([id], [koodiarvo], [nimi], [nimi_sv], [nimi_en], [koodisto_uri]) VALUES (4, N'4', N'kurssia', N'kurser', NULL, N'opintojenlaajuusyksikko')
GO
INSERT [dw].[d_opintojenlaajuusyksikko] ([id], [koodiarvo], [nimi], [nimi_sv], [nimi_en], [koodisto_uri]) VALUES (5, N'5', N'tuntia', N'timmar', NULL, N'opintojenlaajuusyksikko')
GO
INSERT [dw].[d_opintojenlaajuusyksikko] ([id], [koodiarvo], [nimi], [nimi_sv], [nimi_en], [koodisto_uri]) VALUES (6, N'6', N'osaamispistettä', N'kompetenspoäng', NULL, N'opintojenlaajuusyksikko')
GO
INSERT [dw].[d_opintojenlaajuusyksikko] ([id], [koodiarvo], [nimi], [nimi_sv], [nimi_en], [koodisto_uri]) VALUES (7, N'7', N'vuotta', N'år', NULL, N'opintojenlaajuusyksikko')
GO
SET IDENTITY_INSERT [dw].[d_opintojenlaajuusyksikko] OFF
GO
