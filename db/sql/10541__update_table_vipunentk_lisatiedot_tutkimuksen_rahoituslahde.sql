USE [VipunenTK_lisatiedot]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DECLARE @lkm int;

SET @lkm = (SELECT count(*) FROM [dbo].[tutkimuksen_rahoituslahde] where id = '34');

IF @lkm = 0
  INSERT [dbo].[tutkimuksen_rahoituslahde] ([id], [luotu], [rahoituslahde_avain], [rahoituslahdetarkennus], [rahoituslahdetarkennus_SV], [rahoituslahdetarkennus_EN], [jarjestys_rahoituslahdetarkennus], [rahoituslahde], [rahoituslahde_SV], [rahoituslahde_EN], [jarjestys_rahoituslahde], [ulkopuolisen_rahoituksen_kansainvalisyys], [ulkopuolisen_rahoituksen_kansainvalisyys_SV], [ulkopuolisen_rahoituksen_kansainvalisyys_EN], [jarjestys_ulkopuolisen_rahoituksen_kansainvalisyys], [rahoituslahteen_tyyppi], [rahoituslahteen_tyyppi_SV], [rahoituslahteen_tyyppi_EN], [jarjestys_rahoituslahteen_tyyppi], [rahoituksen_laatu], [rahoituksen_laatu_SV], [rahoituksen_laatu_EN], [jarjestys_rahoituksen_laatu], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (34, CAST(N'2025-01-28' AS Date), N'HALUEET', N'Hyvinvointialueet', N'Välfärdsområdena', N'Wellbeing services counties', N'245', N'Hyvinvointialueet', N'Välfärdsområdena', N'Wellbeing services counties', N'245', N'kotimainen', N'inhemsk', N'national', N'200', N'ulkopuolinen rahoitus', N'extern finansiering', N'external financing', N'200', N'muu tutkimusrahoitus', N'annan forskarfinansiering', N'other research funding', N'200', N'E', N'0', N'Jukka 28.1.2025', N'CSC Mika')

GO

