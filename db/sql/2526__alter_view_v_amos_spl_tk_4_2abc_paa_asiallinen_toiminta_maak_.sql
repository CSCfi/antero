USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak]    Script Date: 7.10.2019 14:20:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*
select count(*) from
[dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak]
*/

ALTER VIEW [dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak] AS 
SELECT 
tilv,
  CAST(tilvasmaak AS INT) as tilvasmaak,
  maakunta,
  paatoiminen_tyollinen, 
  tyoton, 
  tyollinen_opiskelija, 
  tyolliset, 
  yhteensa, 
  Cast(tyolliset AS FLOAT) / Cast(yhteensa AS FLOAT) AS tyolliset_per_yhteensa, 
  fixed_key 
FROM 
  (
    SELECT distinct
      'key' AS fixed_key,
	  tilv, 
      tilvasmaak,
	  al.maakunta_fi as maakunta, 
      paatoiminen_tyollinen, 
      tyoton, 
      tyollinen_opiskelija, 
      paatoiminen_tyollinen + tyollinen_opiskelija AS tyolliset, 
      tyoton + paatoiminen_tyollinen + tyollinen_opiskelija AS yhteensa 
    FROM 
      (
        SELECT 
		tilv,
          tilvasmaak, 
          Sum(
            CASE WHEN ptoim1r6 = 10 THEN lkm ELSE 0 END
          ) AS paatoiminen_tyollinen, 
          Sum(
            CASE WHEN ptoim1r6 = 12 THEN lkm ELSE 0 END
          ) AS tyoton, 
          Sum(
            CASE WHEN ptoim1r6 = 13 THEN lkm ELSE 0 END
          ) AS tyollinen_opiskelija, 
          Sum(lkm) AS lkm 
        FROM 
          (
            SELECT 
              tilv,
			  tilvasmaak, 
              ptoim1r6, 
              selite, 
              Sum(lkm) AS lkm 
            FROM 
              (
                SELECT 
                  tk_4_2.tilv, 
                  tk_4_2.tilvasmaak, 
                  tk_4_2.ptoim1r6, 
                  attr.muuttuja, 
                  attr.selite, 
                  tk_4_2.lkm 
                FROM 
                  dw.d_amos_spl_tk_4_2abc_sopv_18 AS tk_4_2 
                  INNER JOIN sa.v_d_amos_tk_attribuutit AS attr ON tk_4_2.ptoim1r6 = attr.tieto 
                WHERE 
                  (toimitus = 'a') 
                  AND (attr.muuttuja = N'ptoim') 
                  AND (
                    tk_4_2.ptoim1r6 IN (10, 12, 13)
                  ) 
                  AND (tk_4_2.tilvasmaak <> '')
              ) AS t 
            GROUP BY
			tilv, 
              tilvasmaak, 
              ptoim1r6, 
              selite
          ) AS t2 
        GROUP BY
		tilv, 
          tilvasmaak
      ) AS t3
	  LEFT JOIN [dw].[d_alueluokitus] al 
	  on t3.tilvasmaak=al.maakunta_koodi
  ) AS t4






