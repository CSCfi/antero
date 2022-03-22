USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_osaamisen_hankkimistapa]    Script Date: 15.3.2022 10:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_osaamisen_hankkimistapa] AS

IF (
	SELECT count(1)
	FROM dw.d_osaamisen_hankkimistapa
	WHERE koodi = '-1'
) = 0

	BEGIN

		SET IDENTITY_INSERT dw.d_osaamisen_hankkimistapa ON;
		INSERT INTO dw.d_osaamisen_hankkimistapa (
			id,
			koodi,
			selite_fi,
			selite_sv,
			selite_en,
			jarjestys,
			source
		)
		SELECT
			-1,
			koodi,
			nimi,
			nimi_sv,
			nimi_en,
			9,
			'etl: p_lataa_d_osaamisen_hankkimistapa'
		FROM sa.sa_koodistot
		WHERE koodisto='vipunenmeta'
		AND koodi='-1';

		SET IDENTITY_INSERT dw.d_osaamisen_hankkimistapa OFF;

	END

ELSE

	BEGIN
			
		UPDATE d
		SET
			koodi = s.koodi,
			selite_fi = s.nimi,
			selite_sv = s.nimi_sv,
			selite_en = s.nimi_en,
			jarjestys = 9,
			loadtime = getdate(),
			username = suser_name(),
			source = 'etl: p_lataa_d_osaamisen_hankkimistapa'
		FROM dw.d_osaamisen_hankkimistapa d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE dw.d_osaamisen_hankkimistapa AS target
USING (
	SELECT 
		koodi
		,selite_fi = case when koodi = 'oppilaitosmuotoinenkoulutus' then 'Koulutuksen järjestäjän oppimisympäristö' else nimi end
		,selite_sv = nimi_sv
		,selite_en = coalesce(nimi_en, case koodi 
											when 'oppilaitosmuotoinenkoulutus' then 'Education provider''s learning environment'
											when 'oppisopimus' then 'Apprenticeship agreement'
											when 'koulutussopimus' then 'Training agreement'
										end)
		,jarjestys = case when koodi like 'oppil%' then 1 when koodi like 'koul%' then 2 else 3 end
		,'etl: p_lataa_d_osaamisen_hankkimistapa' AS source
	FROM sa.sa_koodistot
	WHERE koodisto = 'osaamisenhankkimistapa'
) AS src ON target.koodi = src.koodi

WHEN MATCHED THEN
	UPDATE
	SET selite_fi = src.selite_fi
		,selite_sv = src.selite_sv
		,selite_en = src.selite_en
		,jarjestys = src.jarjestys
		,target.source = src.source
		,target.loadtime = GETDATE()
		,target.username = SUSER_NAME()

WHEN NOT MATCHED THEN
	INSERT (
		koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys
		,source
	)
	VALUES (
		src.koodi
		,src.selite_fi
		,src.selite_sv
		,src.selite_en
		,src.jarjestys
		,src.source
);


