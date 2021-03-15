USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvo_teema]    Script Date: 15.3.2021 15:21:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_arvo_teema] AS

--TARKISTUS ONKO DIMENSIOSSA TIETO PUUTTUU -RIVI. JOS EI, NIIN LISÄTÄÄN. MUUTEN PÄIVITETÄÄN RIVI.
IF NOT EXISTS (SELECT * FROM dw.d_arvo_teema WHERE id=-1)

	BEGIN

	  SET identity_INSERT dw.d_arvo_teema on;

	  INSERT INTO dw.d_arvo_teema (
		id,
		koodi,
		teema_fi,
		teema_sv,
		teema_en,
		hierarkiataso,
		jarjestys,
		source
	  )


	  SELECT
		-1,
		-1,
		nimi,
		nimi_sv,
		nimi_en,
		-1,
		-1,
		'ETL: p_lataa_d_arvo_teema'
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET identity_INSERT dw.d_arvo_teema off;

	END

ELSE

	BEGIN

	  UPDATE d SET
		koodi = s.koodi,
		teema_fi = s.nimi,
		teema_sv = s.nimi_sv,
		teema_en = s.nimi_en,
		hierarkiataso = s.koodi,
		jarjestys = s.koodi,
		source = 'ETL: p_lataa_d_arvo_teema'
	  FROM dw.d_arvo_teema d
	  join sa.sa_koodistot s on s.koodi=d.koodi
	  WHERE s.koodisto='vipunenmeta'
	  and s.koodi='-1'
	  ;
	END
--TARKISTUS PÄÄTTYY

--NYKYISTEN TIETOJEN PÄIVITYS TAI UUSIEN LISÄÄMINEN
MERGE dw.d_arvo_teema AS TARGET

	USING (

	  SELECT DISTINCT
		  koodi AS koodi,
		 COALESCE(nimi_fi,nimi_sv,nimi_en) AS nimi_fi,
		 COALESCE(nimi_sv,nimi_fi,nimi_en) AS nimi_sv,
		 COALESCE(nimi_en,nimi_fi,nimi_sv) AS nimi_en,
		 COALESCE(hierarkiataso,'-1') as hierarkiataso,
		  COALESCE(jarjestys,-1) as jarjestys,
		  'ETL: p_lataa_d_arvo_teema' AS source
	   FROM  Arvo_SA.sa.sa_arvo_teemat v

	 ) AS src

ON TARGET.koodi = src.koodi

WHEN MATCHED THEN

	UPDATE SET
		koodi = src.koodi,
		teema_fi = src.nimi_fi,
		teema_sv = src.nimi_sv,
		teema_en = src.nimi_en,
		hierarkiataso = src.hierarkiataso,
		jarjestys = src.jarjestys,
		TARGET.source = src.source

WHEN NOT MATCHED THEN

	INSERT (
	koodi,
	teema_fi,
	teema_sv,
	teema_en,
	hierarkiataso,
	jarjestys,
	source
	)

	VALUES (
	src.koodi,
	src.nimi_fi,
	src.nimi_sv,
	src.nimi_en,
	src.hierarkiataso,
	src.jarjestys,
	src.source
	);

GO
