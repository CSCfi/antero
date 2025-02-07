USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_ammatillinen_oppiaine]    Script Date: 7.2.2025 11.56.16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER   PROCEDURE [dw].[p_lataa_d_ammatillinen_oppiaine]
AS
IF NOT EXISTS (SELECT * FROM dw.d_ammatillinen_oppiaine WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_ammatillinen_oppiaine ON;

	  INSERT INTO dw.d_ammatillinen_oppiaine (
		id,koodi, nimi, nimi_sv, nimi_en, source, loadtime, username
	  )
	SELECT
		-1, koodi,
		nimi,nimi_sv,nimi_en,
		'ETL: p_lataa_d_ammatillinen_oppiaine',
		loadtime =getdate(),
		username = suser_name()
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_ammatillinen_oppiaine OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			koodi = s.koodi,
			nimi=s.nimi,
			nimi_sv=s.nimi_sv,
			nimi_en=s.nimi_en,
			loadtime =getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_ammatillinen_oppiaine'
		FROM dw.d_ammatillinen_oppiaine d
			JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1'
		;
	END

MERGE dw.d_ammatillinen_oppiaine AS target
USING (
	SELECT
		koodi,
		COALESCE(nimi, nimi_sv, nimi_en) as nimi,
		COALESCE(nimi_sv, nimi, nimi_en) as nimi_sv,
		COALESCE(nimi_en,nimi,nimi_sv) as nimi_en,
		source = 'ETL: p_lataa_d_ammatillinen_oppiaine'
	FROM ANTERO.sa.sa_koodistot s
	WHERE koodisto = 'ammatillisenoppiaineet'

	-- VVAI22 kielikoodien kanssa: CSCVIPUNEN-3705
	UNION ALL

	SELECT
		REPLACE(CONCAT('VVAI22_', s.koodi),'XX','OOAM') as koodi,
		CASE
			WHEN s.koodi = 'XX' THEN concat(s2.nimi, ', äidinkieli (muu)')
			WHEN s.koodi = 'FI' THEN concat(s2.nimi, ', suomi (sis. saame)')
			ELSE concat(s2.nimi, ', ', s.nimi)
		END as nimi,
		CASE
			WHEN s.koodi = 'XX' THEN concat(s2.nimi_sv, ', modersmål (annat)')
			WHEN s.koodi = 'FI' THEN concat(s2.nimi_sv, ', finska (inkl. samiska)')
			ELSE concat(s2.nimi_sv, ', ', s.nimi_sv)
		END as nimi_sv,
		CASE
			WHEN s.koodi = 'XX' THEN concat(s2.nimi_en, ', mother tongue (other)')
			WHEN s.koodi = 'FI' THEN concat(s2.nimi_en, ', Finnish (incl. Sámi)')
			ELSE concat(s2.nimi_en, ', ', s.nimi_en)
		END as nimi_en,
		source = 'ETL: p_lataa_d_ammatillinen_oppiaine'
	FROM ANTERO.sa.sa_koodistot s
	LEFT JOIN ANTERO.sa.sa_koodistot s2 on s2.koodisto = 'ammatillisenoppiaineet' and s2.koodi = 'VVAI22'
	WHERE s.koodisto = 'kielivalikoima' and s.koodi in ('RI', 'SV', 'XAI8', 'XAI12', 'FI', 'XAI7', 'XAI11', 'VK', 'XX')
		
) AS src
ON target.koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET  koodi = src.koodi
			,nimi = src.nimi
			,nimi_sv = src.nimi_sv
			,nimi_en = src.nimi_en
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				koodi, nimi, nimi_sv, nimi_en, source
				)
		VALUES (
				src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source
				);

GO

USE [ANTERO]