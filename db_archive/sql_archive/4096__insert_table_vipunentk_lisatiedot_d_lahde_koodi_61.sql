/****** Script for SelectTopNRows command from SSMS  ******/
USE VipunenTK_lisatiedot
GO

IF NOT EXISTS (SELECT * FROM [VipunenTK_lisatiedot].[dbo].[lahde] WHERE lahde_koodi = '61')

BEGIN

	INSERT [dbo].[lahde] ([id], [luotu], [alkaa], [paattyy], [lahde_koodi], [lahde], [lahde_SV], [lahde_EN], [jarjestys], [virhetilanne], [poistettu], [tietolahde], [kommentti]) 
	VALUES (13, CAST(N'2020-11-02' AS Date)
		, CAST(N'1900-01-01' AS Date)
		, CAST(N'9999-01-01' AS Date)
		, N'61', N'Ammatilliset perustutkinnot, ei oppisopimuskoulutus'
		, N'Yrkesinriktade grundexamina, ej läroavtalsutbildning'
		, N'Vocational qualifications, not apprenticeship training'
		, N'1030'
		, N'E'
		, N' '
		, N'Tilastokeskus'
		, N'CSC Juha')

END

GO
USE [ANTERO]