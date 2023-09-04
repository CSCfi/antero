USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_oiva_amm_jarjestaja_opetuskieli]    Script Date: 31.8.2023 18:24:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_oiva_amm_jarjestaja_opetuskieli] AS

IF NOT EXISTS (select * from dw.d_oiva_amm_jarjestaja_opetuskieli where id=-1) 
BEGIN
	SET IDENTITY_INSERT dw.d_oiva_amm_jarjestaja_opetuskieli ON;
	INSERT INTO dw.d_oiva_amm_jarjestaja_opetuskieli (
		id
		,organisaatio_koodi
		,opetuskieli_koodi
		,opetuskieli_fi
		,opetuskieli_sv
		,opetuskieli_en
		,source
	)
	SELECT
		-1
		,koodi
		,koodi
		,nimi
		,nimi_sv
		,nimi_en
		,'etl: p_lataa_d_oiva_amm_jarjestaja_opetuskieli'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta' and koodi='-1'
END

ELSE BEGIN
	UPDATE d SET
		organisaatio_koodi = s.koodi
		,opetuskieli_koodi = s.koodi
		,opetuskieli_fi = s.nimi
		,opetuskieli_sv = s.nimi_sv
		,opetuskieli_en = s.nimi_en
		,source = 'etl: p_lataa_d_oiva_amm_jarjestaja_opetuskieli'
	FROM dw.d_oiva_amm_jarjestaja_opetuskieli d
	join sa.sa_koodistot s on s.koodi=d.organisaatio_koodi
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'

END
SET IDENTITY_INSERT dw.d_oiva_amm_jarjestaja_opetuskieli OFF;

;WITH kysely AS (
	SELECT DISTINCT
		organisaatio_koodi = l.jarjestajaYtunnus,
		opetuskieli_koodi = stuff((SELECT '' + m.koodiarvo FROM [ANTERO].[sa].[sa_oiva_maaraykset] m WHERE l.lupaId = m.lupaId AND koodisto = 'oppilaitoksenopetuskieli' FOR XML PATH('')), 1, 0, ''),
		opetuskieli_fi = d2.selite_fi,
		opetuskieli_sv = d2.selite_sv,
		opetuskieli_en = d2.selite_en,
		source = 'etl: p_lataa_d_oiva_amm_jarjestaja_opetuskieli' 
	FROM [ANTERO].[sa].[sa_oiva_luvat] l
	LEFT JOIN [ANTERO].[sa].[sa_oiva_maaraykset] m ON l.lupaId = m.lupaId AND koodisto = 'oppilaitoksenopetuskieli'
	LEFT JOIN (
		SELECT jarjestajaYtunnus, max(paatospvm) AS max_paatospvm
		FROM [ANTERO].[sa].[sa_oiva_luvat]
		WHERE koulutustyyppi IS NULL AND coalesce(loppupvm,'9999-12-31') > alkupvm
		GROUP BY jarjestajaYtunnus
	) d1 ON l.jarjestajaYtunnus = d1.jarjestajaYtunnus
	LEFT JOIN [ANTERO].[dw].[d_oppilaitoksenopetuskieli] d2 ON d2.koodi=stuff((SELECT '' + m.koodiarvo FROM [ANTERO].[sa].[sa_oiva_maaraykset] m WHERE l.lupaId = m.lupaId AND koodisto = 'oppilaitoksenopetuskieli' FOR XML PATH('')), 1, 0, '')
	WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm AND l.koulutustyyppi IS NULL AND l.paatospvm = d1.max_paatospvm
	GROUP BY l.jarjestajaYtunnus, l.lupaId, d2.selite_fi, d2.selite_sv, d2.selite_en
)

MERGE dw.d_oiva_amm_jarjestaja_opetuskieli AS target
USING (
	
	SELECT distinct 
		organisaatio_koodi 
		,opetuskieli_koodi 
		,opetuskieli_fi 
		,opetuskieli_sv 
		,opetuskieli_en 
		,source
	FROM kysely

) AS src ON target.organisaatio_koodi  = src.organisaatio_koodi

WHEN MATCHED
	THEN
		UPDATE SET 
			target.organisaatio_koodi = src.organisaatio_koodi
			,target.opetuskieli_koodi = src.opetuskieli_koodi
			,target.opetuskieli_fi = src.opetuskieli_fi
			,target.opetuskieli_sv = src.opetuskieli_sv
			,target.opetuskieli_en = src.opetuskieli_en
			,target.source = src.source

WHEN NOT MATCHED
	THEN 
		INSERT (
			organisaatio_koodi
			,opetuskieli_koodi
			,opetuskieli_fi
			,opetuskieli_sv
			,opetuskieli_en
			,source
		)
		VALUES (
			src.organisaatio_koodi
			,src.opetuskieli_koodi
			,src.opetuskieli_fi
			,src.opetuskieli_sv
			,src.opetuskieli_en
			,src.source
		);


GO

