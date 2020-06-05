USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_erityisopetus]    Script Date: 4.6.2020 18:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_erityisopetus]
AS
IF (
		SELECT count(1)
		FROM dw.d_erityisopetus
		WHERE erityisopetus_koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_erityisopetus

	set identity_insert dw.d_erityisopetus on
	INSERT dw.d_erityisopetus (
		id
		,erityisopetus_koodi
		,erityisopetus_nimi_fi
		,erityisopetus_nimi_sv
		,erityisopetus_nimi_en
		,erityisopetus_ryhma_fi
		,erityisopetus_ryhma_sv
		,erityisopetus_ryhma_en
		,jarjestys_erityisopetus_ryhma
		,alkupvm
		,loppupvm
		,source
		)
	select 
		-1
		,koodi
		,nimi
		,nimi_sv
		,nimi_en
		,nimi
		,nimi_sv
		,nimi_en
		,99999
		,'1900-01-01'
		,'2099-12-31'
		,'etl: p_lataa_d_erityisopetus'
	from sa.sa_koodistot
	where koodisto='vipunenmeta' and koodi='-1'

	set identity_insert dw.d_erityisopetus off

END
ELSE
	BEGIN
	  update d
	  set
		erityisopetus_koodi = s.koodi,
		erityisopetus_nimi_fi = s.nimi,
		erityisopetus_nimi_sv = s.nimi_sv,
		erityisopetus_nimi_en = s.nimi_en,
		erityisopetus_ryhma_fi = s.nimi,
		erityisopetus_ryhma_sv = s.nimi_sv,
		erityisopetus_ryhma_en = s.nimi_en,
		jarjestys_erityisopetus_ryhma = 99999,
		alkupvm = '1900-01-01',
		loppupvm = '2099-12-31',
		d.source=s.source
	  from dw.d_erityisopetus  d
	  join sa.sa_koodistot s on s.koodi=d.erityisopetus_koodi
	  where s.koodisto='vipunenmeta' and s.koodi='-1'
	END


MERGE dw.d_erityisopetus AS target
USING (
	SELECT TOP 100 PERCENT  koodi as koodi
		,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
		,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
		,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
		,CASE
			WHEN koodi in (1) THEN 'Ei erityisen tuen opiskelija'
			WHEN koodi in (2,3) THEN 'Erityisen tuen opiskelija'
			WHEN koodi in (4,5,6,7,8,9) THEN 'Vaativan erityisen tuen opiskelija'
			ELSE 'Tieto puuttuu'
		END as ryhma
		,'SV*' AS ryhma_sv
		,'EN*' AS ryhma_en
		,CASE
			WHEN koodi in (1) THEN 1
			WHEN koodi in (2,3) THEN 2
			WHEN koodi in (4,5,6,7,8,9) THEN 3
			ELSE 9
		END as jarjestys_erityisopetus_ryhma
		,CAST(alkupvm AS DATE) AS alkupvm
		,CAST(loppupvm AS DATE) AS loppupvm
		,'ETL: p_lataa_d_erityisopetus' AS source
	FROM sa.sa_koodistot
	WHERE koodisto = 'erityisopetusammatillisenkoulutuksenrahoitus'
	order by koodi

	) AS src
	ON target.erityisopetus_koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET erityisopetus_nimi_fi = src.nimi
			,erityisopetus_nimi_sv = src.nimi_sv
			,erityisopetus_nimi_en = src.nimi_en
			,erityisopetus_ryhma_fi = src.ryhma
			,erityisopetus_ryhma_sv = src.ryhma_sv
			,erityisopetus_ryhma_en = src.ryhma_en
			,jarjestys_erityisopetus_ryhma = src.jarjestys_erityisopetus_ryhma
			,alkupvm=src.alkupvm
			,loppupvm=src.loppupvm
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				erityisopetus_koodi, 
				erityisopetus_nimi_fi, erityisopetus_nimi_sv, erityisopetus_nimi_en,
				erityisopetus_ryhma_fi, erityisopetus_ryhma_sv, erityisopetus_ryhma_en,
				jarjestys_erityisopetus_ryhma,
				alkupvm, loppupvm ,source
				)
		VALUES (
				src.koodi, 
				src.nimi, src.nimi_sv, src.nimi_en,
				src.ryhma, src.ryhma_sv, src.ryhma_en,
				src.jarjestys_erityisopetus_ryhma,
				src.alkupvm, src.loppupvm,src.source
				);
