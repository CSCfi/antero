
USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus_taustakysymys]    Script Date: 10.5.2024 15:16:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


TRUNCATE TABLE dw.d_arvovastaus_taustakysymys

GO

ALTER PROCEDURE [dw].[p_lataa_d_arvovastaus_taustakysymys] AS

--TARKISTUS ONKO DIMENSIOSSA TIETO PUUTTUU -RIVI. JOS EI, NIIN LISÄTÄÄN. MUUTEN PÄIVITETÄÄN RIVI.
IF NOT EXISTS (SELECT * FROM dw.d_arvovastaus_taustakysymys WHERE id=-1) 

	BEGIN

	  SET identity_INSERT dw.d_arvovastaus_taustakysymys on;

	  INSERT INTO dw.d_arvovastaus_taustakysymys (
		id, 
		koodi,
		vastaus_fi,
		vastaus_sv,
		vastaus_en,
		tyyppi,
		kysymysid,
		jarjestys_koodi,
		source,
		kysymysversio
	  )

	  SELECT
		-1,
		-1,
		nimi,
		nimi_sv,
		nimi_en,
		nimi,
		-1,
		99,
		'ETL: p_lataa_d_arvovastaus_taustakysymys',
		1
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;
 
	SET identity_INSERT dw.d_arvovastaus_taustakysymys off
	END 

ELSE 

	BEGIN

	  UPDATE d SET
		koodi = s.koodi,
		vastaus_fi = s.nimi,
		vastaus_sv = s.nimi_sv,
		vastaus_en = s.nimi_en,
		tyyppi = s.nimi,
		kysymysid = s.koodi,
		jarjestys_koodi = '99',
		source = 'ETL: p_lataa_d_arvovastaus_taustakysymys',
		kysymysversio = 1
	  FROM dw.d_arvovastaus_taustakysymys d
	  join sa.sa_koodistot s on s.koodi=d.koodi
	  WHERE s.koodisto='vipunenmeta'
	  and s.koodi='-1'
	  ;
	END


--TARKISTUS PÄÄTTYY

--NYKYISTEN TIETOJEN PÄIVITYS TAI UUSIEN LISÄÄMINEN
MERGE dw.d_arvovastaus_taustakysymys AS TARGET

	USING (

	  --amis
	  SELECT
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS koodi,
		  COALESCE(monivalintavaihtoehto_fi,(CASE vaihtoehto WHEN 'ei' THEN 'Ei' WHEN 'kylla' THEN 'Kyllä' END)) AS selite_fi,
		  COALESCE(monivalintavaihtoehto_sv,(CASE vaihtoehto WHEN 'ei' THEN 'Nej' WHEN 'kylla' THEN 'Ja' END)) AS selite_sv,
		  COALESCE(monivalintavaihtoehto_en,(CASE vaihtoehto WHEN 'ei' THEN 'No' WHEN 'kylla' THEN 'Yes' END)) AS selite_en,
		  taustakysymyksen_tyyppi AS tyyppi,
		  v.kysymysid,
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS jarjestys_koodi,
		  'ETL: p_lataa_d_arvovastaus_taustakysymys' AS source,
		  v.kysymysversio
	   FROM Arvo_SA.sa.sa_arvo_vastaukset_amis v
	   INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = v.kysymysid and k.kysymysversio = v.kysymysversio
	   WHERE COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en,vaihtoehto) IS NOT NULL
	   and k.valtakunnallinen = 1
	   and v.numerovalinta <> '-1'
	   and k.taustakysymyksen_tyyppi is not null
	   
	   UNION
	   
	   --amk_uraseuranta
	   SELECT
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS koodi,
		  COALESCE(monivalintavaihtoehto_fi,(CASE vaihtoehto WHEN 'ei' THEN 'Ei' WHEN 'kylla' THEN 'Kyllä' END)) AS selite_fi,
		  COALESCE(monivalintavaihtoehto_sv,(CASE vaihtoehto WHEN 'ei' THEN 'Nej' WHEN 'kylla' THEN 'Ja' END)) AS selite_sv,
		  COALESCE(monivalintavaihtoehto_en,(CASE vaihtoehto WHEN 'ei' THEN 'No' WHEN 'kylla' THEN 'Yes' END)) AS selite_en,
		  taustakysymyksen_tyyppi AS tyyppi,
		  v.kysymysid,
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS jarjestys_koodi,
		  'ETL: p_lataa_d_arvovastaus_taustakysymys' AS source,
		  v.kysymysversio
	   FROM Arvo_SA.sa.sa_arvo_vastaukset_amk_uraseuranta v
	   INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = v.kysymysid and k.kysymysversio = v.kysymysversio
	   WHERE COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en,vaihtoehto) IS NOT NULL
	   and k.valtakunnallinen = 1
	   and v.numerovalinta <> '-1'
	   and k.taustakysymyksen_tyyppi is not null
	   
	   UNION
	   
	   --avop
	   SELECT
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS koodi,
		  COALESCE(monivalintavaihtoehto_fi,(CASE vaihtoehto WHEN 'ei' THEN 'Ei' WHEN 'kylla' THEN 'Kyllä' END)) AS selite_fi,
		  COALESCE(monivalintavaihtoehto_sv,(CASE vaihtoehto WHEN 'ei' THEN 'Nej' WHEN 'kylla' THEN 'Ja' END)) AS selite_sv,
		  COALESCE(monivalintavaihtoehto_en,(CASE vaihtoehto WHEN 'ei' THEN 'No' WHEN 'kylla' THEN 'Yes' END)) AS selite_en,
		  taustakysymyksen_tyyppi AS tyyppi,
		  v.kysymysid,
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS jarjestys_koodi,
		  'ETL: p_lataa_d_arvovastaus_taustakysymys' AS source,
		  v.kysymysversio
	   FROM Arvo_SA.sa.sa_arvo_vastaukset_avop v
	   INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = v.kysymysid and k.kysymysversio = v.kysymysversio
	   WHERE COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en,vaihtoehto) IS NOT NULL
	   and k.valtakunnallinen = 1
	   and v.numerovalinta <> '-1'
	   and k.taustakysymyksen_tyyppi is not null
	   
	   UNION
	   
	   --kandi
	   SELECT
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS koodi,
		  COALESCE(monivalintavaihtoehto_fi,(CASE vaihtoehto WHEN 'ei' THEN 'Ei' WHEN 'kylla' THEN 'Kyllä' END)) AS selite_fi,
		  COALESCE(monivalintavaihtoehto_sv,(CASE vaihtoehto WHEN 'ei' THEN 'Nej' WHEN 'kylla' THEN 'Ja' END)) AS selite_sv,
		  COALESCE(monivalintavaihtoehto_en,(CASE vaihtoehto WHEN 'ei' THEN 'No' WHEN 'kylla' THEN 'Yes' END)) AS selite_en,
		  taustakysymyksen_tyyppi AS tyyppi,
		  v.kysymysid,
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS jarjestys_koodi,
		  'ETL: p_lataa_d_arvovastaus_taustakysymys' AS source,
		  v.kysymysversio
	   FROM Arvo_SA.sa.sa_arvo_vastaukset_kandi v
	   INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = v.kysymysid and k.kysymysversio = v.kysymysversio
	   WHERE COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en,vaihtoehto) IS NOT NULL
	   and k.valtakunnallinen = 1
	   and v.numerovalinta <> '-1'
	   and k.taustakysymyksen_tyyppi is not null
	   
	   UNION
	   
	   --tep
	   SELECT
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS koodi,
		  COALESCE(monivalintavaihtoehto_fi,(CASE vaihtoehto WHEN 'ei' THEN 'Ei' WHEN 'kylla' THEN 'Kyllä' END)) AS selite_fi,
		  COALESCE(monivalintavaihtoehto_sv,(CASE vaihtoehto WHEN 'ei' THEN 'Nej' WHEN 'kylla' THEN 'Ja' END)) AS selite_sv,
		  COALESCE(monivalintavaihtoehto_en,(CASE vaihtoehto WHEN 'ei' THEN 'No' WHEN 'kylla' THEN 'Yes' END)) AS selite_en,
		  taustakysymyksen_tyyppi AS tyyppi,
		  v.kysymysid,
		  COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) AS jarjestys_koodi,
		  'ETL: p_lataa_d_arvovastaus_taustakysymys' AS source,
		  v.kysymysversio
	   FROM Arvo_SA.sa.sa_arvo_vastaukset_tep v
	   INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = v.kysymysid and k.kysymysversio = v.kysymysversio
	   WHERE COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en,vaihtoehto) IS NOT NULL
	   and k.valtakunnallinen = 1
	   and v.numerovalinta <> '-1'
	   and k.taustakysymyksen_tyyppi is not null
	   
	   UNION
	   
	   --muut
	   SELECT
		  CAST(COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) as int) AS koodi,
		  COALESCE(monivalintavaihtoehto_fi,(CASE vaihtoehto WHEN 'ei' THEN 'Ei' WHEN 'kylla' THEN 'Kyllä' END)) AS selite_fi,
		  COALESCE(monivalintavaihtoehto_sv,(CASE vaihtoehto WHEN 'ei' THEN 'Nej' WHEN 'kylla' THEN 'Ja' END)) AS selite_sv,
		  COALESCE(monivalintavaihtoehto_en,(CASE vaihtoehto WHEN 'ei' THEN 'No' WHEN 'kylla' THEN 'Yes' END)) AS selite_en,
		  taustakysymyksen_tyyppi AS tyyppi,
		  v.kysymysid,
		  CAST(COALESCE(numerovalinta,(CASE vaihtoehto WHEN 'ei' THEN 0 WHEN 'kylla' THEN 1 END)) as int) AS jarjestys_koodi,
		  'ETL: p_lataa_d_arvovastaus_taustakysymys' AS source,
		  v.kysymysversio
	   FROM Arvo_SA.sa.sa_arvo_vastaukset_muut v
	   LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid = v.kyselykertaid
	   INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = v.kysymysid and k.kysymysversio = v.kysymysversio
	   WHERE COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en,vaihtoehto) IS NOT NULL
	   and k.valtakunnallinen = 1
	   and v.numerovalinta <> '-1'
	   and k.taustakysymyksen_tyyppi is not null
	   and kk.tyyppi <> 'move'
	   
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
		tyyppi = src.tyyppi,
		kysymysid = src.kysymysid,
		jarjestys_koodi = src.jarjestys_koodi,
		TARGET.source = src.source,
		kysymysversio = src.kysymysversio

WHEN NOT MATCHED THEN
	
	INSERT (
		koodi,
		vastaus_fi,
		vastaus_sv,
		vastaus_en,
		tyyppi,
		kysymysid,
		jarjestys_koodi,
		source,
		kysymysversio
	)

	VALUES (
		src.koodi, 
		src.selite_fi, 
		src.selite_sv, 
		src.selite_en,
		src.tyyppi,
		src.kysymysid,
		src.jarjestys_koodi,
		src.source,
		src.kysymysversio
	);

GO

