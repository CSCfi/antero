USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amm_sopimusjaksot]    Script Date: 13.7.2021 10:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_amm_sopimusjaksot] AS

TRUNCATE TABLE dw.d_amm_sopimusjaksot

IF (
		SELECT count(1)
		FROM dw.d_amm_sopimusjaksot
		WHERE koodi = '-1'
		) = 0
BEGIN
	SET IDENTITY_INSERT dw.d_amm_sopimusjaksot ON;
	INSERT INTO dw.d_amm_sopimusjaksot (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en
		,jarjestys_koodi
		,source
		)
	SELECT
		-1,
		koodi,nimi,nimi_sv,nimi_en,9,
		'sa.sa_koodistot'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  AND koodi='-1'
	  ;
	SET IDENTITY_INSERT dw.d_amm_sopimusjaksot OFF;
	END
ELSE
	BEGIN
		UPDATE d
		SET
			koodi = s.koodi,
			selite_fi=s.nimi,
			selite_sv=s.nimi_sv,
			selite_en=s.nimi_en,
			jarjestys_koodi = 9,
			loadtime = GETDATE(),
			username = SUSER_NAME(),
			source = 'sa.sa_koodistot'
		FROM dw.d_amm_sopimusjaksot d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END


INSERT INTO dw.d_amm_sopimusjaksot (
	koodi,
	selite_fi,
	selite_sv,
	selite_en,
	jarjestys_koodi,
	source
	)

VALUES
	('1','Oppisopimus','Läroavtal','Apprenticeship agreement',1,'etl: p_lataa_d_amm_sopimusjaksot'),
	('2','Koulutussopimus','Utbildningsavtal','Training agreement',1,'etl: p_lataa_d_amm_sopimusjaksot'),
	('1_1','Oppisopimus ja koulutussopimus','Läroavtal och utbildningsavtal','Apprenticeship agreement and training agreement',1,'etl: p_lataa_d_amm_sopimusjaksot'),
	('1_2','Oppisopimus, ei koulutussopimusta','Läroavtal, ej utbildningsavtal','Apprenticeship agreement, no training agreement',2,'etl: p_lataa_d_amm_sopimusjaksot'),
	('2_1','Koulutussopimus, ei oppisopimusta','Utbildningsavtal, ej läroavtal','Training agreement, no apprenticeship agreement',3,'etl: p_lataa_d_amm_sopimusjaksot'),
	('2_2','Ei oppisopimusta, ei koulutussopimusta','Ej läroavtal, ej utbildningsavtal','No apprenticeship agreement, no training agreement',4,'etl: p_lataa_d_amm_sopimusjaksot')

