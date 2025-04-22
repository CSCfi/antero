USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma]    Script Date: 22.4.2025 7.49.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE  [dw].[p_lataa_d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma] AS

IF NOT EXISTS (select * from dw.d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma where id=-1) 
BEGIN
	SET IDENTITY_INSERT dw.d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma ON;
	INSERT INTO dw.d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma (
		id
		,organisaatio_koodi
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,source
	)
	SELECT
		-1
		,koodi
		,koodi
		,nimi
		,nimi_sv
		,nimi_en
		,'ETL: p_lataa_d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta' and koodi='-1'
END

ELSE BEGIN
	UPDATE d SET
		organisaatio_koodi = s.koodi
		,koodi = s.koodi
		,selite_fi = s.nimi
		,selite_sv = s.nimi_sv
		,selite_en = s.nimi_en
		,source = 'etl: p_lataa_d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma'
	FROM dw.d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma d
	join sa.sa_koodistot s on s.koodi=d.organisaatio_koodi
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'

END
SET IDENTITY_INSERT dw.d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma OFF;


MERGE dw.d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma AS target
USING (
	SELECT 
		l.jarjestajaYtunnus as organisaatio_koodi, 
		m.koodiarvo as koodi, 
		s.nimi as selite_fi, 
		s.nimi_sv as selite_sv, 
		s.nimi_en as selite_en,
		'ETL: p_lataa_d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma' as source
	FROM [ANTERO].[sa].[sa_oiva_luvat] l
	INNER JOIN [ANTERO].[sa].[sa_oiva_maaraykset] m on l.lupaId = m.lupaId and m.koodisto = 'poerityinenkoulutustehtava'
	LEFT JOIN ANTERO.sa.sa_koodistot s on s.koodisto = 'poerityinenkoulutustehtava' and s.koodi = m.koodiarvo
	LEFT JOIN (
		SELECT jarjestajaYtunnus, max(paatospvm) AS max_paatospvm
		FROM [ANTERO].[sa].[sa_oiva_luvat]
		WHERE coalesce(loppupvm,'9999-12-31') > alkupvm
		GROUP BY jarjestajaYtunnus
	) d1 ON l.jarjestajaYtunnus = d1.jarjestajaYtunnus
	WHERE coalesce(l.loppupvm,'9999-12-31') > l.alkupvm and 
	-- Opetuksen järjestäjän viimeisimmän luvan tilanne
	l.paatospvm = d1.max_paatospvm and
	-- Erityinen maailmankatsomus tai kasvatusopillinen järjestelmä
	m.koodiarvo BETWEEN 3 and 10
) AS src ON target.organisaatio_koodi  = src.organisaatio_koodi

WHEN MATCHED
	THEN
		UPDATE SET 
			target.organisaatio_koodi = src.organisaatio_koodi
			,target.koodi = src.koodi
			,target.selite_fi = src.selite_fi
			,target.selite_sv = src.selite_sv
			,target.selite_en = src.selite_en
			,target.source = src.source

WHEN NOT MATCHED
	THEN 
		INSERT (
			organisaatio_koodi
			,koodi
			,selite_fi
			,selite_sv
			,selite_en
			,source
		)
		VALUES (
			src.organisaatio_koodi
			,src.koodi
			,src.selite_fi
			,src.selite_sv
			,src.selite_en
			,src.source
		);


GO

USE [ANTERO]