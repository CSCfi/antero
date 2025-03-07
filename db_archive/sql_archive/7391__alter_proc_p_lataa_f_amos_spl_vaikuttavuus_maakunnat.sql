USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_spl_vaikuttavuus_maakunnat]    Script Date: 21.2.2023 13:36:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dw].[p_lataa_f_amos_spl_vaikuttavuus_maakunnat] AS

--Jatkossa lisätään vain 4.2c, koska aluekerroin 1.13-raporttien tilastovuodelta koulutuksen suoritusvuoden sijaan, ts. 4.2a (erona oleellisesti vain amm2010, tsekt) ei ehtisi. JS 21.10.2022
--Lisätty rajaus ammatillisen tutkinnon suorittaneisiin. JS 21.10.2022

/* 
KOLME SELECTIÄ:
1. Yhdistetään TK 4.2 aineistot
	a. pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)
	b. koulutusrakenne (toimitus: joulukuu tilv+1)
	c. pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu tilv+2)
2. Välitaulu maakuntakertoimen laskentaan
3. Varsinainen faktalataus
*/

-- VÄLIAIKAINEN TAULU
-- Yhdistetään TK:n 4.2-aineistot. Käytetään maakuntakertoimen laskemiseen

DROP TABLE IF EXISTS sa.z_tmp_TK_K4_2abc

--c. pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu tilv+2)
--lisää uusi union alle

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
	,[amm2010] = null
	,[tsekt] = null
	,[lkm]
	,[luontipvm]
	,'c' as toimitus
	,'pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu tilv+2)' as toimitus_kuvaus
INTO sa.z_tmp_TK_K4_2abc --huom. vanhasta poistetaan into
FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_23_2021] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

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
	,[amm2010] = null
	,[tsekt] = null
	,[lkm]
	,[luontipvm]
	,'c' as toimitus
	,'pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu tilv+2)' as toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_22] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

UNION

--a. pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)
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
    ,[amm2010]
    ,[tsekt]
    ,[lkm]
    ,[luontipvm]
	,'a' AS toimitus
	,'pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)' AS toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_21] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

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
    ,[amm2010]
    ,[tsekt]
    ,[lkm]
    ,[luontipvm]
	,'a' AS toimitus
	,'pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)' AS toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_20] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

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
    ,[amm2010]
    ,[tsekt]
    ,[lkm]
    ,[luontipvm]
	,'a' AS toimitus
	,'pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)' AS toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_19] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

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
    ,[amm2010]
    ,[tsekt]
    ,[lkm]
    ,[luontipvm]
	,'a' AS toimitus
	,'pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)' AS toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_18] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')


-- VÄLIAIKAINEN TAULU
-- Käytetään maakuntakertoimen laskentaan

DROP TABLE IF EXISTS sa.z_tmp_TK_K4_2abc_maakuntakerroin

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
INTO sa.z_tmp_TK_K4_2abc_maakuntakerroin
FROM (
    
	SELECT distinct
		'key' AS fixed_key,
		tilv, 
		tilvasmaak,
		(select top 1 maakunta_fi from [dw].[d_alueluokitus] where maakunta_koodi = t3.tilvasmaak and maakunta_fi != 'Ulkomaat') as maakunta, 
		paatoiminen_tyollinen, 
		tyoton, 
		tyollinen_opiskelija, 
		paatoiminen_tyollinen + tyollinen_opiskelija AS tyolliset, 
		tyoton + paatoiminen_tyollinen + tyollinen_opiskelija AS yhteensa 
    FROM (
		SELECT 
		tilv,
		tilvasmaak, 
		Sum(CASE WHEN ptoim1r6 = 10 THEN lkm ELSE 0 END) AS paatoiminen_tyollinen, 
		Sum(CASE WHEN ptoim1r6 = 12 THEN lkm ELSE 0 END) AS tyoton, 
		Sum(CASE WHEN ptoim1r6 = 13 THEN lkm ELSE 0 END) AS tyollinen_opiskelija, 
		Sum(lkm) AS lkm 
        FROM (
            SELECT 
				tilv,
				tilvasmaak, 
				ptoim1r6,  
				Sum(lkm) AS lkm 
            FROM (
				SELECT 
					tk_4_2.tilv, 
					tk_4_2.tilvasmaak, 
					tk_4_2.ptoim1r6, 
					tk_4_2.lkm 
                FROM sa.z_tmp_TK_K4_2abc AS tk_4_2  
                WHERE (toimitus = 'a' or (toimitus = 'c' and tilv > (select max(tilv) from sa.z_tmp_TK_K4_2abc where toimitus = 'a')))
                AND tk_4_2.ptoim1r6 IN (10, 12, 13)
                AND tk_4_2.tilvasmaak <> ''
			) AS t1 
            GROUP BY tilv, tilvasmaak, ptoim1r6 

		) AS t2 
        GROUP BY tilv, tilvasmaak

	) AS t3

) AS t4


-- VARSINAINEN FAKTALATAUS

DROP TABLE IF EXISTS dw.f_amos_spl_vaikuttavuus_maakunnat

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
INTO dw.f_amos_spl_vaikuttavuus_maakunnat
FROM (
	SELECT DISTINCT 
		tilv, 
		CAST(SUM(tyolliset) AS float) / CAST(SUM(yhteensa) AS float) AS indeksi_jakaja 
    FROM sa.z_tmp_TK_K4_2abc_maakuntakerroin AS t1 
    GROUP BY tilv
) AS t2 
INNER JOIN sa.z_tmp_TK_K4_2abc_maakuntakerroin AS t3 ON t2.tilv = t3.tilv
ORDER BY tilvasmaak, tilv


-- POISTETAAN VÄLIAIKAISET TAULUT

DROP TABLE IF EXISTS sa.z_tmp_TK_K4_2abc_maakuntakerroin
DROP TABLE IF EXISTS sa.z_tmp_TK_K4_2abc

