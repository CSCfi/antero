USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_maaraaikaisuuden_kesto_luokitus]    Script Date: 27.8.2024 9:16:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER   PROCEDURE [dw].[p_lataa_d_varda_maaraaikaisuuden_kesto_luokitus] AS

DECLARE @i as int
SET @i = 0

DECLARE @iMax as int
SET @iMax = (
	SELECT MAX(
		DATEDIFF(
			DAY
			,s.alkamis_pvm 
			,coalesce(s.paattymis_pvm, GetDate())
		)
	)
	FROM [Varda_SA].[sa].[sa_varda_palvelussuhde] s
	WHERE s.tyosuhde_koodi = '2'
)


TRUNCATE TABLE dw.d_varda_maaraaikaisuuden_kesto_luokitus

set identity_insert dw.d_varda_maaraaikaisuuden_kesto_luokitus on;

INSERT INTO [dw].[d_varda_maaraaikaisuuden_kesto_luokitus] (
		[id],
		[koodi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarjestys,
		[source]
	)
	VALUES (
		-1,
		'-1',
		'Tieto puuttuu',
		'Information saknas',
		'Missing data',
		9999,
		'p_lataa_d_varda_maaraaikaisuuden_kesto_luokitus'
	)
;

set identity_insert dw.d_varda_maaraaikaisuuden_kesto_luokitus off;

WHILE @i <= @iMax

BEGIN

	INSERT INTO [dw].[d_varda_maaraaikaisuuden_kesto_luokitus] (
		[koodi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarjestys,
		[source]
	)
	VALUES (
		@i,
		CASE WHEN @i < 7 THEN '1-7 pv' WHEN @i < 30 THEN '7-30 pv' WHEN @i < 60 THEN '31-60 pv' ELSE 'yli 60 pv' END,
		CASE WHEN @i < 7 THEN '1-7 dagar'  WHEN @i < 30 THEN '7-30 dagar' WHEN @i < 60 THEN '31-60 dagar' ELSE 'över 60 dagar' END,
		CASE WHEN @i < 7 THEN '1-7 days' WHEN @i < 30 THEN '7-30 days' WHEN @i < 60 THEN '31-60 days' ELSE 'over 60 days' END,
		CASE WHEN @i < 7 THEN 1 WHEN @i < 30 THEN 2 WHEN @i < 60 THEN 3 ELSE 4 END,
		'p_lataa_d_varda_maaraaikaisuuden_kesto_luokitus'
	)

SET @i = @i + 1

END
     











GO


