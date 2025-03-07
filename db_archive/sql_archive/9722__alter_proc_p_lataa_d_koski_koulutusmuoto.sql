USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_koski_koulutusmuoto]    Script Date: 28.3.2024 12:20:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_d_koski_koulutusmuoto]
AS
IF NOT EXISTS (SELECT * FROM dw.d_koski_koulutusmuoto WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_koski_koulutusmuoto ON;

	  INSERT INTO dw.d_koski_koulutusmuoto (
		id
		,koodi, selite_fi, selite_sv, selite_en, jarjestys
		,source, loadtime, username
	  )
	SELECT
		-1,
		koodi,nimi,nimi_sv,nimi_en, 9999,
		'ETL: p_lataa_d_koski_koulutusmuoto',
		loadtime =getdate(),
		username = suser_name()
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_koski_koulutusmuoto OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			koodi=s.koodiarvo,
			selite_fi= s.nimi,
			selite_sv= coalesce(s.nimi_sv, s.nimi),
			selite_en='*EN',
			loadtime =getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_koski_koulutusmuoto'
		FROM dw.d_koski_koulutusmuoto d
		JOIN [Koski_SA].[sa].[sa_koski_koodisto_koodi] s ON s.koodiarvo = d.koodi
		WHERE s.koodisto_uri = 'opiskeluoikeudentyyppi'
		;
	END

IF NOT EXISTS (SELECT * FROM dw.d_koski_koulutusmuoto WHERE id=-2)

	BEGIN

	  SET IDENTITY_INSERT dw.d_koski_koulutusmuoto ON;

	  INSERT INTO dw.d_koski_koulutusmuoto (
		id
		,koodi, selite_fi, selite_sv, selite_en, jarjestys
		,source, loadtime, username
	  )
	SELECT
		-2,
		'-2','Ei muita opiskeluoikeuksia','Inga andra studierätter','Ei muita opiskeluoikeuksia*EN', 9998,
		'ETL: p_lataa_d_koski_koulutusmuoto',
		loadtime =getdate(),
		username = suser_name()
	  ;

	  SET IDENTITY_INSERT dw.d_koski_koulutusmuoto OFF;

	END

ELSE

	BEGIN
		UPDATE dw.d_koski_koulutusmuoto
		SET
			koodi ='-2',
			selite_fi= 'Ei muita opiskeluoikeuksia',
			selite_sv= 'Inga andra studierätter',
			selite_en='Ei muita opiskeluoikeuksia*EN',
			loadtime =getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_koski_koulutusmuoto'
		WHERE id = -2
		
		;
	END


MERGE dw.d_koski_koulutusmuoto AS target
USING (
	SELECT koodiarvo as koodi
		,nimi as selite_fi
		,coalesce(nimi_sv,nimi) AS selite_sv
		,'*EN' AS selite_en
		, row_number() over (order by koodiarvo) AS jarjestys
		,'ETL: p_lataa_d_koski_koulutusmuoto' AS source
	FROM [Koski_SA].[sa].[sa_koski_koodisto_koodi]
	WHERE koodisto_uri = 'opiskeluoikeudentyyppi'
	) AS src
	ON target.koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
			,jarjestys = src.jarjestys
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
				koodi, selite_fi, selite_sv, selite_en, jarjestys
				,source
				)
		VALUES (
				src.koodi, src.selite_fi, src.selite_sv, src.selite_en, src.jarjestys
				,src.source
				);


GO

USE [ANTERO]