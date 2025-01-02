USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_osaamisen_hankkimistavat]    Script Date: 27.12.2024 16.44.59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_d_osaamisen_hankkimistavat] AS


IF (
	SELECT count(1)
	FROM dw.d_osaamisen_hankkimistavat
	WHERE koodi = '-1'
) = 0

BEGIN

	SET IDENTITY_INSERT dw.d_osaamisen_hankkimistavat ON;
	INSERT INTO dw.d_osaamisen_hankkimistavat (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys,
		source
	)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		999999,
		'etl: p_lataa_d_osaamisen_hankkimistavat'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	AND koodi='-1';

	SET IDENTITY_INSERT dw.d_osaamisen_hankkimistavat OFF;

END

ELSE
BEGIN
		
	UPDATE d
	SET
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = 999999,
		loadtime = getdate(),
		username = suser_name(),
		source = 'etl: p_lataa_d_osaamisen_hankkimistavat'
	FROM dw.d_osaamisen_hankkimistavat d
	JOIN sa.sa_koodistot s ON s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
END;


/* Osaamisen hankkimistapojen eri kombinaatioiden muodostaminen taulun dw.d_osaamisen_hankkimistapa pohjalta. 
Huom. Hankkimistapojen järjestys on kovakoodattu osaamisen hankkimistapa tauluun ja tämän rekursion toiminta
perustuu järjestyksen hyödyntämiseen. Otettava huomioon muutoksia tehdessä.*/
WITH comb_cte AS(
  SELECT 
		koodi= cast(koodi as varchar(250))
      ,selite_fi = cast(concat('Vain ', LOWER(selite_fi)) as varchar(250))
	  ,comb_fi = cast(selite_fi as varchar(250))
      ,selite_sv = cast(concat('Endast ', LOWER(selite_sv)) as varchar(250))
	  ,comb_sv = cast(selite_sv as varchar(250))
      ,selite_en = cast(concat('Only ', LOWER(selite_en)) as varchar(250))
	  ,comb_en= cast(selite_en as varchar(250))
      ,jarjestys = cast(jarjestys as varchar(3))
	  ,j_viim = jarjestys
  FROM [ANTERO].[dw].[d_osaamisen_hankkimistapa]
  WHERE koodi != '-1'
  UNION ALL
   SELECT
        koodi = cast(concat(c.koodi, '_', oh.koodi) as varchar(250))
	   ,selite_fi = cast(concat(c.comb_fi, ' ja ', LOWER(oh.selite_fi)) as varchar(250))
	   ,comb_fi = cast(concat(c.comb_fi, ', ', LOWER(oh.selite_fi)) as varchar(250))
	   ,selite_sv = cast(concat(c.comb_sv, ' och ', LOWER(oh.selite_sv)) as varchar(250))
	   ,comb_sv = cast( concat(c.comb_sv, ', ', LOWER(oh.selite_sv)) as varchar(250)) 
       ,selite_en = cast(concat(c.comb_en, ' and ', LOWER(oh.selite_en)) as varchar(250))
	   ,comp_en= cast(concat(c.comb_en, ', ', LOWER(oh.selite_en)) as varchar(250))
       ,jarjestys = cast(concat( c.jarjestys, cast(oh.jarjestys as varchar(3))) as varchar(3))
	   ,j_viim = oh.jarjestys
   FROM [ANTERO].[dw].[d_osaamisen_hankkimistapa] oh
   INNER JOIN comb_cte c on oh.jarjestys > c.j_viim
  WHERE oh.koodi != '-1'
)

SELECT *
INTO #temp_oht
FROM comb_cte;

/*  */

MERGE dw.d_osaamisen_hankkimistavat AS target

USING (
	SELECT 
		koodi = koodi
		,jarjestys = cast(jarjestys as int)
		,selite_fi = selite_fi
		,selite_sv = selite_sv
		,selite_en = selite_en
		,'etl: p_lataa_d_osaamisen_hankkimistavat' AS source
	FROM #temp_oht
) AS src ON target.koodi = src.koodi

WHEN MATCHED THEN
	UPDATE SET 
		koodi = src.koodi
		,jarjestys = src.jarjestys
		,selite_fi = src.selite_fi
		,selite_sv = src.selite_sv
		,selite_en = src.selite_en
		,target.source = src.source
		,target.loadtime = GETDATE()
		,target.username = SUSER_NAME()

WHEN NOT MATCHED THEN
	INSERT (
		koodi
		,jarjestys
		,selite_fi
		,selite_sv
		,selite_en
		,source
	)
	VALUES (
		src.koodi
		,src.jarjestys
		,src.selite_fi
		,src.selite_sv
		,src.selite_en
		,src.source
);


DROP TABLE IF EXISTS #temp_oht