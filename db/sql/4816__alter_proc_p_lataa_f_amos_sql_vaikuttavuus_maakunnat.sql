USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_spl_vaikuttavuus_maakunnat]    Script Date: 30.8.2021 13:03:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dw].[p_lataa_f_amos_spl_vaikuttavuus_maakunnat] AS


/* 
KOLME SELECTIÄ:
1. Yhdistetään TK 4.2 aineistot
2. Välitaulu maakuntakertoimen laskentaan
3. Varsinainen faktalataus
*/

-- VÄLIAIKAINEN TAULU
-- Yhdistetään TK K4.2 a, b ja c -aineistot. Käytetään maakuntakertoimen laskemiseen

DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K4_2abc


SELECT 
  *, 'a' AS toimitus, 'pääasiallinen toiminta, lopullinen (toimitus: joulukuu)' AS toimitus_kuvaus
INTO ANTERO.sa.z_tmp_TK_K4_2abc
FROM 
  [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_18]
UNION
SELECT 
  *, 'a' AS toimitus, 'pääasiallinen toiminta, lopullinen (toimitus: joulukuu)' AS toimitus_kuvaus
FROM 
  [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_19] 
UNION
SELECT 
  *, 'a' AS toimitus, 'pääasiallinen toiminta, lopullinen (toimitus: joulukuu)' AS toimitus_kuvaus
FROM 
  [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_20] 
UNION 
SELECT
[tilv]    ,[aineisto]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[suorv]
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,NULL AS [ptoim1r6]
      ,NULL AS [amm2010]
      ,NULL AS [tsekt]
      ,[lkm]
      ,[luontipvm],
  'b' as toimitus, 
  'koulutusrakenne (toimitus: joulukuu)' as toimitus_kuvaus 
FROM 
  [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_18] 
UNION
SELECT 
[tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[suorv]
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,NULL AS [ptoim1r6]
      ,NULL AS [amm2010]
      ,NULL AS [tsekt]
      ,[lkm]
      ,[luontipvm],
  'b' as toimitus, 
  'koulutusrakenne (toimitus: joulukuu)' as toimitus_kuvaus
  
FROM 
  [TK_H9098_CSC].[dbo].[TK_K4_2b_sopv_19]

UNION
SELECT 
[tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[suorv]
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,NULL AS [ptoim1r6]
      ,NULL AS [amm2010]
      ,NULL AS [tsekt]
      ,[lkm]
      ,[luontipvm],
  'b' as toimitus, 
  'koulutusrakenne (toimitus: joulukuu)' as toimitus_kuvaus
FROM 
  [TK_H9098_CSC].[dbo].[TK_K4_2b_sopv_20]

UNION
SELECT 
[tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[suorv]
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,NULL AS [amm2010]
      ,NULL AS [tsekt]
      ,[lkm]
      ,[luontipvm],
  'c' as toimitus, 
  'pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu)' as toimitus_kuvaus
FROM 
  [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_18]
UNION
SELECT 
[tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[suorv]
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,NULL AS [amm2010]
      ,NULL AS [tsekt]
      ,[lkm]
      ,[luontipvm],
  'c' as toimitus, 
  'pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu)' as toimitus_kuvaus
FROM 
  [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_19]
UNION
SELECT 
[tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[suorv]
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,NULL AS [amm2010]
      ,NULL AS [tsekt]
      ,[lkm]
      ,[luontipvm],
  'c' as toimitus, 
  'pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu)' as toimitus_kuvaus
FROM 
  [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_20]
UNION
SELECT 
[tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[suorv]
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,NULL AS [amm2010]
      ,NULL AS [tsekt]
      ,[lkm]
      ,[luontipvm],
  'c' as toimitus, 
  'pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu)' as toimitus_kuvaus
FROM 
  [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_21]


-- VÄLIAIKAINEN TAULU
-- Käytetään maakuntakertoimen laskentaan

DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K4_2abc_maakuntakerroin

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
INTO ANTERO.sa.z_tmp_TK_K4_2abc_maakuntakerroin
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
              Sum(lkm) AS lkm 
            FROM 
              (
                SELECT 
                  tk_4_2.tilv, 
                  tk_4_2.tilvasmaak, 
                  tk_4_2.ptoim1r6, 
                  tk_4_2.lkm 
                FROM 
                  sa.z_tmp_TK_K4_2abc AS tk_4_2  
                WHERE 
                  (toimitus = 'a')  
                  AND 
                    tk_4_2.ptoim1r6 IN (10, 12, 13)
          
                  AND (tk_4_2.tilvasmaak <> '')
              ) AS t 
            GROUP BY
			tilv, 
              tilvasmaak, 
              ptoim1r6 
          ) AS t2 
        GROUP BY
		tilv, 
          tilvasmaak
      ) AS t3
	  LEFT JOIN ANTERO.[dw].[d_alueluokitus] al 
	  on t3.tilvasmaak=al.maakunta_koodi
  ) AS t4



-- VARSINAINEN FAKTALATAUS

DROP TABLE IF EXISTS ANTERO.dw.f_amos_spl_vaikuttavuus_maakunnat

SELECT 
t3.tilv,
  t3.tilvasmaak, 
  t3.maakunta,
  t3.paatoiminen_tyollinen, 
  t3.tyoton, 
  t3.tyollinen_opiskelija, 
  t3.tyolliset, 
  t3.yhteensa, 
  t3.tyolliset_per_yhteensa, 
  t2.indeksi_jakaja, 
  t2.indeksi_jakaja / t3.tyolliset_per_yhteensa AS aluekerroin
INTO ANTERO.dw.f_amos_spl_vaikuttavuus_maakunnat
FROM 
  (
    SELECT 
      DISTINCT tilv, 
      CAST(
        SUM(tyolliset) AS float
      ) / CAST(
        SUM(yhteensa) AS float
      ) AS indeksi_jakaja 
    FROM 
      ANTERO.sa.z_tmp_TK_K4_2abc_maakuntakerroin AS t1 
    GROUP BY 
      tilv
  ) AS t2 
  INNER JOIN ANTERO.sa.z_tmp_TK_K4_2abc_maakuntakerroin AS t3 ON t2.tilv = t3.tilv
ORDER BY tilvasmaak, tilv



-- POISTETAAN VÄLIAIKAISET TAULUT

DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K4_2abc_maakuntakerroin
DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K4_2abc




GO


USE ANTERO