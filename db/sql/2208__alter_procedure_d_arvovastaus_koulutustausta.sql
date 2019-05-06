USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus_koulutustausta]    Script Date: 1.5.2019 17:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_arvovastaus_koulutustausta] AS

--TARKISTUS ONKO DIMENSIOSSA TIETO PUUTTUU -RIVI. JOS EI, NIIN LISÄTÄÄN. MUUTEN PÄIVITETÄÄN RIVI.
IF NOT EXISTS (SELECT * FROM dw.d_arvovastaus_koulutustausta WHERE vastaajaid=-1) 

	BEGIN

	  --SET identity_INSERT dw.d_arvovastaus_koulutustausta on;

	  INSERT INTO dw.d_arvovastaus_koulutustausta (
		vastaajaid,
		koulutustausta_fi,
        koulutustausta_sv,
        koulutustausta_en,
        korkein_koulutustausta_fi,
        korkein_koulutustausta_sv,
        korkein_koulutustausta_en,
		jarjestys_koulutustausta,
		jarjestys_korkein_koulutustausta,
		source
	  )


	  SELECT
		-1,
		nimi,
		nimi_sv,
		nimi_en,
		nimi,
		nimi_sv,
		nimi_en,
		99,
		99,
		'ETL: p_lataa_d_arvovastaus_koulutustausta'
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;
  
	  --SET identity_INSERT dw.d_arvovastaus_koulutustausta off;

	END 

ELSE 

	BEGIN

	  UPDATE d SET
		vastaajaid = s.koodi,
		koulutustausta_fi = s.nimi,
        koulutustausta_sv = s.nimi_sv,
        koulutustausta_en = s.nimi_en,
        korkein_koulutustausta_fi = s.nimi,
        korkein_koulutustausta_sv = s.nimi_sv,
        korkein_koulutustausta_en = s.nimi_en,
		jarjestys_koulutustausta = 99,
		jarjestys_korkein_koulutustausta = 99,
		source = 'ETL: p_lataa_d_arvovastaus_koulutustausta'
	  FROM dw.d_arvovastaus_koulutustausta d
	  join sa.sa_koodistot s on s.koodi=d.vastaajaid
	  WHERE s.koodisto='vipunenmeta'
	  and s.koodi='-1'
	  ;
	END
--TARKISTUS PÄÄTTYY

--NYKYISTEN TIETOJEN PÄIVITYS TAI UUSIEN LISÄÄMINEN
MERGE dw.d_arvovastaus_koulutustausta AS TARGET

	USING (
		SELECT DISTINCT
			 v.vastaajaid
			,v.monivalintavaihtoehto_fi AS koulutustausta_fi
			,v.monivalintavaihtoehto_sv AS koulutustausta_sv
			,v.monivalintavaihtoehto_en AS koulutustausta_en
			,q3.korkein_koulutustausta_fi
			,q3.korkein_koulutustausta_sv
			,q3.korkein_koulutustausta_en
			,v.numerovalinta AS jarjestys_koulutustausta
			,q3.numerovalinta AS jarjestys_korkein_koulutustausta
			,'ETL: p_lataa_d_arvovastaus_koulutustausta' AS Source
		FROM Arvo_SA.sa.sa_arvo_vastaukset v
		LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset k ON k.kysymysid = v.kysymysid
		LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk ON kk.kyselykertaid = v.kyselykertaid
		LEFT JOIN ( --korkein koulutustausta

			SELECT 
				q2.vastaajaid
				,q2.koulutustausta_fi AS korkein_koulutustausta_fi
				,q2.koulutustausta_sv AS korkein_koulutustausta_sv
				,q2.koulutustausta_en AS korkein_koulutustausta_en
				,numerovalinta
			FROM (

				SELECT
					vastaajaid
					,koulutustausta_fi
					,koulutustausta_sv
					,koulutustausta_en
					,numerovalinta
					,RANK() OVER (PARTITION BY vastaajaid ORDER BY koulutustausta_koodi) AS rnk
				FROM (

					SELECT DISTINCT
						vastaajaid
						,v.monivalintavaihtoehto_fi AS koulutustausta_fi
						,v.monivalintavaihtoehto_sv AS koulutustausta_sv
						,v.monivalintavaihtoehto_en AS koulutustausta_en
						,CASE v.monivalintavaihtoehto_fi
							WHEN 'Yliopistotutkinto' THEN 1
							WHEN 'Ammattikorkeakoulututkinto' THEN 2
							WHEN 'Ammatillinen tutkinto tai opistoasteen tutkinto' THEN 3
							WHEN 'Lukio / ylioppilastutkinto' THEN 4
							WHEN 'Ulkomailla suoritettu tutkinto' THEN 5
							WHEN 'Olen käynyt valmentavan koulutuksen ennen hakeutumista tähän koulutukseen' THEN 6
							WHEN 'Peruskoulu, keskikoulu tai vastaava' THEN 7
							WHEN 'Ei tutkintoa' THEN 8
							ELSE 9
						 END AS koulutustausta_koodi
						,numerovalinta
					FROM Arvo_SA.sa.sa_arvo_vastaukset v
					LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset k ON k.kysymysid = v.kysymysid
					WHERE k.taustakysymyksen_tyyppi = 'pohjakoulutus'
				) q1 

			) q2 WHERE rnk = 1

		) q3 ON q3.vastaajaid = v.vastaajaid

		WHERE k.taustakysymyksen_tyyppi = 'pohjakoulutus'
	   
	 ) AS src

ON TARGET.vastaajaid = src.vastaajaid AND TARGET.koulutustausta_fi = src.koulutustausta_fi
  
WHEN MATCHED THEN
  
	UPDATE SET  
		koulutustausta_fi = src.koulutustausta_fi,
        koulutustausta_sv = src.koulutustausta_sv,
        koulutustausta_en = src.koulutustausta_en,
        korkein_koulutustausta_fi = src.korkein_koulutustausta_fi,
        korkein_koulutustausta_sv = src.korkein_koulutustausta_sv,
        korkein_koulutustausta_en = src.korkein_koulutustausta_fi,
		jarjestys_koulutustausta = src.jarjestys_koulutustausta,
		jarjestys_korkein_koulutustausta = src.jarjestys_korkein_koulutustausta,
		TARGET.source = src.source

WHEN NOT MATCHED THEN
	
	INSERT (
	vastaajaid,
	koulutustausta_fi,
    koulutustausta_sv,
    koulutustausta_en,
    korkein_koulutustausta_fi,
    korkein_koulutustausta_sv,
    korkein_koulutustausta_en,
	source
	)

	VALUES (
	src.vastaajaid,
	src.koulutustausta_fi,
    src.koulutustausta_sv,
    src.koulutustausta_en,
    src.korkein_koulutustausta_fi,
    src.korkein_koulutustausta_sv,
    src.korkein_koulutustausta_en,
	src.source
	);


