USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_tulokvintiili]    Script Date: 7.6.2024 14:34:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER   PROC [dw].[p_lataa_d_tulokvintiili] AS

TRUNCATE TABLE [dw].[d_tulokvintiili]

SET IDENTITY_INSERT dw.d_tulokvintiili ON

IF NOT EXISTS (SELECT * FROM dw.d_tulokvintiili WHERE tulokvintiili_koodi = '-1')
BEGIN
	INSERT dw.d_tulokvintiili (
		id
		,tulokvintiili_koodi
		,tulokvintiili_fi
		,tulokvintiili_sv
		,tulokvintiili_en
		,jarjestys_tulokvintiili
		,source
	)
	select
		id = -1
		,tulokvintiili_koodi = s.koodi
		,tulokvintiili_fi = lower(s.nimi)
		,tulokvintiili_sv = lower(s.nimi_sv)
		,tulokvintiili_en = lower(s.nimi_en)
		,jarjestys_tulokvintiili = 99
		,source = 'etl: p_lataa_d_tulokvintiili'
	from sa.sa_koodistot s
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
END
ELSE BEGIN
	update d
	set 
		tulokvintiili_koodi = s.koodi
		,tulokvintiili_fi = lower(s.nimi)
		,tulokvintiili_sv = lower(s.nimi_sv)
		,tulokvintiili_en = lower(s.nimi_en)
		,jarjestys_tulokvintiili = 99
		,source = 'ETL: p_lataa_d_tulokvintiili'
	from dw.d_tulokvintiili d
	join sa.sa_koodistot s on s.koodi=d.id
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
END

--skriptaa ANTERO -> tasks -> generate scripts -> drop create table -> with data ...´advanced --> schema only


INSERT [dw].[d_tulokvintiili] ([id], [tulokvintiili_koodi], [tulokvintiili_fi], [tulokvintiili_sv], [tulokvintiili_en], [jarjestys_tulokvintiili], [loadtime], [source], [username], [kommentti]) VALUES (2, N'1', N'1. viidennes (pienituloisin)', N'1. viidennes (pienituloisin)_SV', N'1. viidennes (pienituloisin)_EN', 1, CAST(N'2024-05-14T14:01:47.747' AS DateTime), N'ETL: p_lataa_d_perhe', N'DWI\akoskini', NULL)

INSERT [dw].[d_tulokvintiili] ([id], [tulokvintiili_koodi], [tulokvintiili_fi], [tulokvintiili_sv], [tulokvintiili_en], [jarjestys_tulokvintiili], [loadtime], [source], [username], [kommentti]) VALUES (3, N'2', N'2. viidennes', N'2. viidennes_SV', N'2. viidennes_EN', 2, CAST(N'2024-05-14T14:02:29.950' AS DateTime), N'ETL: p_lataa_d_perhe', N'DWI\akoskini', NULL)

INSERT [dw].[d_tulokvintiili] ([id], [tulokvintiili_koodi], [tulokvintiili_fi], [tulokvintiili_sv], [tulokvintiili_en], [jarjestys_tulokvintiili], [loadtime], [source], [username], [kommentti]) VALUES (4, N'3', N'3. viidennes', N'3. viidennes_SV', N'3. viidennes_EN', 3, CAST(N'2024-05-14T14:03:03.343' AS DateTime), N'ETL: p_lataa_d_perhe', N'DWI\akoskini', NULL)

INSERT [dw].[d_tulokvintiili] ([id], [tulokvintiili_koodi], [tulokvintiili_fi], [tulokvintiili_sv], [tulokvintiili_en], [jarjestys_tulokvintiili], [loadtime], [source], [username], [kommentti]) VALUES (5, N'4', N'4. viidennes', N'4. viidennes_SV', N'4. viidennes_EN', 4, CAST(N'2024-05-14T14:03:29.327' AS DateTime), N'ETL: p_lataa_d_perhe', N'DWI\akoskini', NULL)

INSERT [dw].[d_tulokvintiili] ([id], [tulokvintiili_koodi], [tulokvintiili_fi], [tulokvintiili_sv], [tulokvintiili_en], [jarjestys_tulokvintiili], [loadtime], [source], [username], [kommentti]) VALUES (6, N'5', N'5. viidennes (suurituloisin)', N'5. viidennes (suurituloisin)_SV', N'5. viidennes (suurituloisin)_EN', 5, CAST(N'2024-05-14T14:04:01.617' AS DateTime), N'ETL: p_lataa_d_perhe', N'DWI\akoskini', NULL)



SET IDENTITY_INSERT dw.d_tulokvintiili OFF

GO