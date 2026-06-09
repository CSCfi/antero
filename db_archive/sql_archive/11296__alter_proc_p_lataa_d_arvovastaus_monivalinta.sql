USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus_monivalinta]    Script Date: 16.10.2025 13.27.51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_arvovastaus_monivalinta] AS

--TARKISTUS ONKO DIMENSIOSSA TIETO PUUTTUU -RIVI. JOS EI, NIIN LISÄTÄÄN. MUUTEN PÄIVITETÄÄN RIVI.
IF NOT EXISTS (SELECT * FROM dw.d_arvovastaus_monivalinta WHERE id=-1)

	BEGIN

	  SET identity_INSERT dw.d_arvovastaus_monivalinta on;

	  INSERT INTO dw.d_arvovastaus_monivalinta (
		id,
		koodi,
		vastaus_fi,
		vastaus_sv,
		vastaus_en,
		kysymysid,
		jarjestys,
		source,
		kysymysversio
	  )


	  SELECT
		-1,
		-1,
		nimi,
		nimi_sv,
		nimi_en,
		-1,
		99,
		'ETL: p_lataa_d_arvovastaus_monivalinta',
		1
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET identity_INSERT dw.d_arvovastaus_monivalinta off;

	END

ELSE

	BEGIN

	  UPDATE d SET
		koodi = s.koodi,
		vastaus_fi = s.nimi,
		vastaus_sv = s.nimi_sv,
		vastaus_en = s.nimi_en,
		kysymysid = s.koodi,
		jarjestys = 99,
		source = 'ETL: p_lataa_d_arvovastaus_monivalinta',
		kysymysversio = 1
	  FROM dw.d_arvovastaus_monivalinta d
	  join sa.sa_koodistot s on s.koodi=d.koodi
	  WHERE s.koodisto='vipunenmeta'
	  and s.koodi='-1'
	  ;
	END
--TARKISTUS PÄÄTTYY

--NYKYISTEN TIETOJEN PÄIVITYS TAI UUSIEN LISÄÄMINEN
MERGE dw.d_arvovastaus_monivalinta AS TARGET

	USING (

		SELECT DISTINCT
			jarjestys AS koodi,
			COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en) AS selite_fi,
			COALESCE(monivalintavaihtoehto_sv,monivalintavaihtoehto_fi,monivalintavaihtoehto_en) AS selite_sv,
			COALESCE(monivalintavaihtoehto_en,monivalintavaihtoehto_fi,monivalintavaihtoehto_sv) AS selite_en,
			v.kysymysid,
			jarjestys,
			'ETL: p_lataa_d_arvovastaus_monivalinta' AS source,
			kysymysversio
		FROM  Arvo_SA.sa.sa_arvo_monivalintavaihtoehdot v
		-- lähteen SA-taulu muuttunut 2/2021

		-- INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid=v.kysymysid
		-- WHERE COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en) IS NOT NULL
		-- and taustakysymyksen_tyyppi IS NULL
		-- and k.valtakunnallinen = 1
		-- and k.vastaustyyppi = 'monivalinta'
		
		-- Lisätty union alasvetovalikko-kysymyksille
		
		UNION ALL

		SELECT DISTINCT
			k.koodi,
			k.nimi,
			coalesce(k.nimi_sv, k.nimi),
			coalesce(k.nimi_en, k.nimi),
			s.kysymysid,
			k.koodi,
			'ETL: p_lataa_d_arvovastaus_monivalinta' AS source,
			s.kysymysversio
		FROM (
			SELECT
				k.kysymysid, 
				k.kysymysversio, 	
				JSON_VALUE(REPLACE(k.kategoria, '''', '"'), '$.koodisto') AS koodisto
			FROM Arvo_SA.sa.sa_arvo_kysymykset k
			WHERE vastaustyyppi = 'alasvetovalikko'
		) s
		LEFT JOIN ANTERO.sa.sa_koodistot k on k.koodisto = LEFT(s.koodisto, CASE CHARINDEX('_', s.koodisto) WHEN 0 THEN LEN(s.koodisto) ELSE CHARINDEX('_', s.koodisto) - 1 END)

	 ) AS src

ON TARGET.koodi = src.koodi 
and TARGET.kysymysid = src.kysymysid
and TARGET.kysymysversio = src.kysymysversio

WHEN MATCHED THEN

	UPDATE SET
		koodi = src.koodi,
		vastaus_fi = src.selite_fi,
		vastaus_sv = src.selite_sv,
		vastaus_en = src.selite_en,
		kysymysid = src.kysymysid,
		jarjestys = src.jarjestys,
		TARGET.source = src.source,
		kysymysversio = src.kysymysversio

WHEN NOT MATCHED THEN

	INSERT (
	koodi,
	vastaus_fi,
	vastaus_sv,
	vastaus_en,
	kysymysid,
	jarjestys,
	source,
	kysymysversio
	)

	VALUES (
	src.koodi,
	src.selite_fi,
	src.selite_sv,
	src.selite_en,
	src.kysymysid,
	src.jarjestys,
	src.source,
	src.kysymysversio
	);

GO


