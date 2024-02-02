USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot]    Script Date: 2.2.2024 13:56:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER  PROCEDURE [dw].[p_lataa_d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot]
AS
IF (
		SELECT count(1)
		FROM dw.d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot
		WHERE koodi = '-1'
		) = 0
BEGIN

	set identity_insert dw.d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot on

	INSERT dw.d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys
		,source
		)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		'999',
		'etl: p_lataa_d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	and koodi='-1'
  
	set identity_insert dw.d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot off
END


ELSE 

	BEGIN

	UPDATE d SET
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = '999',
		source = 'etl: p_lataa_d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot'
	FROM dw.d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot d
	join sa.sa_koodistot s on s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'
	
	END


MERGE dw.d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot AS target
USING (
	SELECT koodi
		,nimi
		,nimi_sv =coalesce(nimi_sv, nimi, nimi_en)
		,nimi_en =coalesce(nimi_en, nimi, nimi_sv)
		,jarjestys = koodi--lower(left(nimi,3))
		,'etl: p_lataa_d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot' AS source
	FROM sa.sa_koodistot
	where koodisto = 'lukiomuutkoulutuksenjarjestamiseenliittyvatehdot'
	
) AS src
ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.nimi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,jarjestys = src.jarjestys
			,target.source = src.source
WHEN NOT MATCHED
	THEN
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
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.jarjestys
			,src.source
			);


GO


