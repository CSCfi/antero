USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_koskiyokokeet]    Script Date: 27.4.2026 14.15.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_koskiyokokeet]
AS

DELETE FROM dw.d_koskiyokokeet WHERE koodi = '-1'

SET IDENTITY_INSERT dw.d_koskiyokokeet ON;

INSERT INTO dw.d_koskiyokokeet (
	id, koodi, aine_selite_fi, aine_selite_sv, aine_selite_en, laajuus_fi, laajuus_sv, laajuus_en, 
	aineryhma_selite_fi, aineryhma_selite_sv, aineryhma_selite_en, source, loadtime, username 
)
SELECT
	-1,
	koodi,
	nimi,
	nimi_sv,
	nimi_en, 
	nimi,
	nimi_sv,
	nimi_en, 
	nimi,
	nimi_sv,
	nimi_en,
	'ETL: p_lataa_d_koskiyokokeet',
	loadtime =getdate(),
	username = suser_name()
FROM sa.sa_koodistot
WHERE koodisto='vipunenmeta' and koodi='-1';

SET IDENTITY_INSERT dw.d_koskiyokokeet OFF;

MERGE dw.d_koskiyokokeet AS target
USING (
	SELECT
		f.koodi,
		CASE
			WHEN aine_selite_fi = 'Koltan saame' THEN 'Koltansaame'
			ELSE UPPER(LEFT(aine_selite_fi, 1)) + LOWER(SUBSTRING(aine_selite_fi, 2, LEN(aine_selite_fi))) 
		END as aine_selite_fi,
		f.aine_selite_sv,
		f.aine_selite_en,
		f.laajuus_fi,
		f.laajuus_sv,
		f.laajuus_en,
		f.aineryhma_selite_fi,
		f.aineryhma_selite_sv,
		f.aineryhma_selite_en,
		f.source,
		f.loadtime,
		f.username
	FROM (
		SELECT DISTINCT
			koodi,
			CASE
				WHEN nimi like '%Matematii%' THEN 'Matematiikka'
				WHEN nimi like '%oppim‰‰r‰%' THEN LEFT(replace(nimi,' erivapaudella',''), CHARINDEX(',', replace(nimi,' erivapaudella','')) - 1)
				WHEN nimi like '%‰idinkiel%' THEN SUBSTRING(replace(nimi,' erivapaudella',''), CHARINDEX(', ', replace(nimi,' erivapaudella','')) + 2, LEN(replace(nimi,' erivapaudella','')))
				WHEN nimi like '%toisena kielen‰%' THEN replace(nimi, ' toisena kielen‰','') 
				WHEN koodi = 'S9' THEN 'Saksa'
				WHEN koodi = 'J' THEN 'Englanti'
				ELSE replace(nimi,' erivapaudella','') 
			END as aine_selite_fi,
			NULL as aine_selite_sv,
			NULL as aine_selite_en,
			CASE
				WHEN nimi like '%‰idinkiel%' THEN '‰idinkieli'
				WHEN nimi like '%keskipitk‰%' THEN 'keskipitk‰'
				WHEN nimi like '%pitk‰%' THEN 'pitk‰'
				WHEN nimi like '%lyhyt%' THEN 'lyhyt'
				WHEN nimi like '%laajempi%' THEN 'laajempi'
				WHEN nimi like '%toisena%' THEN 'toisena kielen‰'
				ELSE NULL 
			END laajuus_fi,
			NULL as laajuus_sv,
			NULL as laajuus_en,
			CASE
				WHEN nimi like '%Matema%' THEN 'Matematiikka'
				WHEN koodi = 'S9' THEN 'Kieli'
				WHEN CHARINDEX(' ',nimi) = 0 THEN 'Reaali'
				WHEN nimi like '%oppim‰‰r‰%' or nimi like '%kiel%' THEN 'Kieli'
				ELSE 'Reaali'
			END as aineryhma_selite_fi,
			NULL as aineryhma_selite_sv,
			NULL as aineryhma_selite_en,
			'ETL: p_lataa_d_koskiyokokeet' as source,
			getdate() as loadtime,
			SUSER_NAME() as username
		FROM ANTERO.sa.sa_koodistot k WHERE k.koodisto = 'koskiyokokeet'
	) f

	) AS src
	ON target.koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET aine_selite_fi = src.aine_selite_fi
			,aine_selite_sv = src.aine_selite_sv
			,aine_selite_en = src.aine_selite_en
			,laajuus_fi = src.laajuus_fi
			,laajuus_sv = src.laajuus_sv
			,laajuus_en = src.laajuus_en
			,aineryhma_selite_fi = src.aine_selite_fi
			,aineryhma_selite_sv = src.aine_selite_sv
			,aineryhma_selite_en = src.aine_selite_en
			,target.source = src.source
			,target.loadtime = src.loadtime
			,target.username = src.username
WHEN NOT MATCHED
	THEN
		INSERT (
				koodi, aine_selite_fi, aine_selite_sv, aine_selite_en,
				laajuus_fi, laajuus_sv, laajuus_en,
				aineryhma_selite_fi, aineryhma_selite_sv, aineryhma_selite_en,
				source,loadtime, username
				)
		VALUES (
				src.koodi, src.aine_selite_fi, src.aine_selite_sv, src.aine_selite_en,
				src.laajuus_fi, src.laajuus_sv, src.laajuus_en,
				src.aineryhma_selite_fi, src.aineryhma_selite_sv, src.aineryhma_selite_en,
				src.source,src.loadtime, src.username
				);