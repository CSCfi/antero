USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_osaamisala]    Script Date: 15.1.2025 16.13.10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_osaamisala] AS

IF (
		SELECT count(1)
		FROM dw.d_osaamisala
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_osaamisala
	set identity_insert dw.d_osaamisala on
	INSERT dw.d_osaamisala (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys
		,alkupvm
		,loppupvm
		,source
		)
	SELECT
		-1,
		-1,
		nimi,
		nimi_sv,
		nimi_en,
		'9999',
		'1900-01-01',
		'9999-12-31',
		source
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  
	set identity_insert dw.d_osaamisala off
END

ELSE 

BEGIN

	  UPDATE d SET
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = '9999',
		alkupvm = '1900-01-01',
		loppupvm = '9999-12-31',
		source = s.source
	  FROM dw.d_osaamisala d
	  join sa.sa_koodistot s on s.koodi=d.koodi
	  WHERE s.koodisto='vipunenmeta'
	  and s.koodi='-1'
END


MERGE dw.d_osaamisala AS target

USING (

	SELECT distinct
		   koodi = osaamisala_koodi
		  ,selite_fi = epo.nimi_fi
		  ,selite_sv = min(epo.nimi_sv)
		  ,selite_en = min(epo.nimi_en)
		  ,jarjestys = '1'
		  ,alkupvm = min(ep.voimassaoloalkaa)
		  ,loppupvm = nullif(max(coalesce(ep.voimassaololoppuu,'9999-12-31')),'9999-12-31')
          ,source = 'Koski_SA.sa.sa_eperusteet_osaamisalat'
	  FROM [Koski_SA].[sa].[sa_eperusteet_osaamisalat] epo
	  LEFT JOIN Koski_SA.sa.sa_eperusteet ep on ep.eperusteid=epo.eperusteid
	  GROUP BY epo.osaamisala_koodi,epo.nimi_fi--,epo.nimi_sv,epo.nimi_en


) AS src
ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
			,jarjestys = src.jarjestys
			,alkupvm = src.alkupvm
			,loppupvm = src.loppupvm
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
			koodi
			,selite_fi
			,selite_sv
			,selite_en
			,jarjestys
			,alkupvm
			,loppupvm
			,source
			)
		VALUES (
			src.koodi
			,src.selite_fi
			,src.selite_sv
			,src.selite_en
			,src.jarjestys
			,src.alkupvm
			,src.loppupvm
			,src.source
		);

GO
