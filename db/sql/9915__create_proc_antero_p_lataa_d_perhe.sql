USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_perhe]    Script Date: 7.6.2024 14:34:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER   PROC [dw].[p_lataa_d_perhe] AS

TRUNCATE TABLE [dw].[d_perhe]

SET IDENTITY_INSERT dw.d_perhe ON

IF NOT EXISTS (SELECT * FROM dw.d_perhe WHERE perhe_koodi = '-1')
BEGIN
	INSERT dw.d_perhe (
		id
		,perhe_koodi
		,perhe_fi
		,perhe_sv
		,perhe_en
		,jarjestys_perhe
		,source
	)
	select
		id = -1
		,perhe_koodi = s.koodi
		,perhe_fi = lower(s.nimi)
		,perhe_sv = lower(s.nimi_sv)
		,perhe_en = lower(s.nimi_en)
		,jarjestys_perhe = 99
		,source = 'etl: p_lataa_d_perhe'
	from sa.sa_koodistot s
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
END
ELSE BEGIN
	update d
	set 
		perhe_koodi = s.koodi
		,perhe_fi = lower(s.nimi)
		,perhe_sv = lower(s.nimi_sv)
		,perhe_en = lower(s.nimi_en)
		,jarjestys_perhe = 99
		,source = 'ETL: p_lataa_d_perhe'
	from dw.d_perhe d
	join sa.sa_koodistot s on s.koodi=d.id
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
END

--skriptaa ANTERO -> tasks -> generate scripts -> drop create table -> with data ... advanced --> schema only

SET IDENTITY_INSERT dw.d_perhe ON


INSERT [dw].[d_perhe] ([id], [perhe_koodi], [perhe_fi], [perhe_sv], [perhe_en], [jarjestys_perhe], [loadtime], [source], [username], [kommentti]) VALUES (4, N'1', N'Ydinperhe (vain yhteisiä lapsia)', N'Ydinperhe (vain yhteisiä lapsia)_SV', N'Ydinperhe (vain yhteisiä lapsia)_EN', 1, CAST(N'2024-05-14T13:56:01.693' AS DateTime), N'ETL: p_lataa_d_perhe', N'DWI\akoskini', NULL)

INSERT [dw].[d_perhe] ([id], [perhe_koodi], [perhe_fi], [perhe_sv], [perhe_en], [jarjestys_perhe], [loadtime], [source], [username], [kommentti]) VALUES (5, N'2', N'Uusperhe, vähintään 1 ei-yhteinen lapsi', N'Uusperhe, vähintään 1 ei-yhteinen lapsi_SV', N'Uusperhe, vähintään 1 ei-yhteinen lapsi_EN', 2, CAST(N'2024-05-14T13:56:52.657' AS DateTime), N'ETL: p_lataa_d_perhe', N'DWI\akoskini', NULL)

INSERT [dw].[d_perhe] ([id], [perhe_koodi], [perhe_fi], [perhe_sv], [perhe_en], [jarjestys_perhe], [loadtime], [source], [username], [kommentti]) VALUES (6, N'3', N'Yhden vanhemman perhe', N'Yhden vanhemman perhe_SV', N'Yhden vanhemman perhe_EN', 3, CAST(N'2024-05-14T13:57:30.050' AS DateTime), N'ETL: p_lataa_d_perhe', N'DWI\akoskini', NULL)

INSERT [dw].[d_perhe] ([id], [perhe_koodi], [perhe_fi], [perhe_sv], [perhe_en], [jarjestys_perhe], [loadtime], [source], [username], [kommentti]) VALUES (7, N'4', N'Muut eli perheisiin kuulumattomat', N'Muut eli perheisiin kuulumattomat_SV', N'Muut eli perheisiin kuulumattomat_EN', 4, CAST(N'2024-05-14T13:58:32.397' AS DateTime), N'ETL: p_lataa_d_perhe', N'DWI\akoskini', NULL)




SET IDENTITY_INSERT dw.d_perhe OFF

GO