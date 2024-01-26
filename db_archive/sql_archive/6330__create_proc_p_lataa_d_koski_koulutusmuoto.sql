USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_koski_koulutusmuoto]    Script Date: 2.8.2022 15:50:22 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_koski_koulutusmuoto]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_koski_koulutusmuoto]    Script Date: 2.8.2022 15:50:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_d_koski_koulutusmuoto]
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
			selite_fi=s.nimi,
			selite_sv='*SV',
			selite_en='*EN',
			loadtime =getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_koski_koulutusmuoto'
		FROM dw.d_koski_koulutusmuoto d
		JOIN [Koski_SA].[sa].[sa_koski_koodisto_koodi] s ON s.koodiarvo = d.koodi
		WHERE s.koodisto_uri = 'opiskeluoikeudentyyppi'
		;
	END



MERGE dw.d_koski_koulutusmuoto AS target
USING (
	SELECT koodiarvo as koodi
		,nimi as selite_fi
		,'*SV' AS selite_sv
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