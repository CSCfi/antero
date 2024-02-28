USE [ANTERO]
GO

DROP VIEW IF EXISTS [dw].[v_TK_K4_2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dw].[v_TK_K4_2] AS 

--lisää uusin 4.2c alle

SELECT 
	[tilv]
    ,[tilvasmaak]
	,[ptoim1r6]
    ,[lkm]
    ,[luontipvm]
	,'c' as toimitus
	,'pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: ~tammikuu tilv+2)' as toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_23_2022] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

UNION ALL

SELECT 
	[tilv]
    ,[tilvasmaak]
    ,[ptoim1r6]
    ,[lkm]
    ,[luontipvm]
	,'c' as toimitus
	,'pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu tilv+2)' as toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_23_2021] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

UNION ALL

SELECT 
	[tilv]
    ,[tilvasmaak]
    ,[ptoim1r6]
    ,[lkm]
    ,[luontipvm]
	,'c' as toimitus
	,'pääasiallinen toiminta, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu tilv+2)' as toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_22] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

UNION ALL

--a. pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)
SELECT 
	[tilv]
    ,[tilvasmaak]
    ,[ptoim1r6]
    ,[lkm]
    ,[luontipvm]
	,'a' AS toimitus
	,'pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)' AS toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_21] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

UNION ALL

SELECT 
	[tilv]
    ,[tilvasmaak]
    ,[ptoim1r6]
    ,[lkm]
    ,[luontipvm]
	,'a' AS toimitus
	,'pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)' AS toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_20] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

UNION ALL

SELECT 
	[tilv]
    ,[tilvasmaak]
    ,[ptoim1r6]
    ,[lkm]
    ,[luontipvm]
	,'a' AS toimitus
	,'pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)' AS toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_19] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

UNION ALL

SELECT 
	[tilv]
    ,[tilvasmaak]
    ,[ptoim1r6]
    ,[lkm]
    ,[luontipvm]
	,'a' AS toimitus
	,'pääasiallinen toiminta, lopullinen (toimitus: joulukuu tilv+2)' AS toimitus_kuvaus
FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_18] t 
LEFT JOIN dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = t.koulk
WHERE d.tutkintotyyppi_koodi in ('02','19','20')

GO
