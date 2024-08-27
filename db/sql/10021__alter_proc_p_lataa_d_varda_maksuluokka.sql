USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_maksuluokka]    Script Date: 27.8.2024 9:21:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dw].[p_lataa_d_varda_maksuluokka] AS

DECLARE @i as int
DECLARE @vuosi as int
SET @vuosi = 2020
DECLARE @iMax as int

TRUNCATE TABLE dw.d_varda_maksuluokka

INSERT INTO [dw].[d_varda_maksuluokka] (
		[koodi],
		[tilastovuosi],
		[yritystyyppi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarjestys,
		[source]
	)
	VALUES (
		-1,
		NULL,
		NULL,
		'Tieto puuttuu',
		'Information saknas',
		'Missing data',
		999,
		'p_lataa_d_varda_maksuluokka'
	)

WHILE @vuosi <= YEAR(getdate())

BEGIN

	SET @iMax = (SELECT max(cast(round(s.asiakasmaksu,0) as int)) FROM varda_sa.sa.sa_varda_maksutieto s where alkamis_pvm <= cast(concat(@vuosi, '-12-31') as date) and (paattymis_pvm >= cast(concat(@vuosi, '-12-31') as date) or paattymis_pvm < '1900-12-30') and s.action <> 'DELETED') 

	SET @i = 0

	WHILE @i <= @iMax

	BEGIN

		INSERT INTO [dw].[d_varda_maksuluokka] (
			[koodi],
			[tilastovuosi],
			[yritystyyppi],
			[nimi_fi],
			[nimi_sv],
			[nimi_en],
			jarjestys,
			[source]
		)
		VALUES 
		(
			@i,
			@vuosi,
			'Kunta',
			CASE WHEN @i < 27 THEN 'Maksu 0 €' WHEN @i < 288 THEN 'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä' ELSE 'Enimmäismaksu' END,
			CASE WHEN @i < 27 THEN 'Avgift 0 €' WHEN @i < 288 THEN 'Klientavgift mellan den lägsta debiterade och den maximala avgiften' ELSE 'Högsta avgift' END,
			CASE WHEN @i < 27 THEN 'Maksu 0 €' WHEN @i < 288 THEN 'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä' ELSE 'Enimmäismaksu' END,
			CASE WHEN @i < 27 THEN 1 WHEN @i < 288 THEN 2 ELSE 3 END,
			'p_lataa_d_varda_maksuluokka'
		),
		(
			@i,
			@vuosi,
			'Yksityinen',
			CASE WHEN @i < 291 THEN '0-290 €' WHEN @i < 401 THEN '291-400 €' WHEN @i < 501 THEN '401-500 €' ELSE 'Yli 500 €' END,
			CASE WHEN @i < 291 THEN '0-290 €' WHEN @i < 401 THEN '291-400 €' WHEN @i < 501 THEN '401-500 €' ELSE 'Över 500 €' END,
			CASE WHEN @i < 291 THEN '0-290 €' WHEN @i < 401 THEN '291-400 €' WHEN @i < 501 THEN '401-500 €' ELSE 'Over 500 €' END,
			CASE WHEN @i < 291 THEN 4 WHEN @i < 401 THEN 5 WHEN @i < 501 THEN 6 ELSE 7 END,
			'p_lataa_d_varda_maksuluokka'
		)

		SET @i = @i + 1
	
	END

	SET @vuosi = @vuosi + 1

END










GO


