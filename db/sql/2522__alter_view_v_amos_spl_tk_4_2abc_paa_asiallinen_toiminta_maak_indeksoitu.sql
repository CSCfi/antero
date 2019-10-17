USE [ANTERO]
GO 

/****** Object:  View [dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak_indeksoitu]    Script Date: 17.10.2019 15:04:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak_indeksoitu] 
AS 
SELECT 
  t3.tilvasmaak, 
  t3.paatoiminen_tyollinen, 
  t3.tyoton, 
  t3.tyollinen_opiskelija, 
  t3.tyolliset, 
  t3.yhteensa, 
  t3.tyolliset_per_yhteensa, 
  t2.indeksi_jakaja, 
  t2.indeksi_jakaja / t3.tyolliset_per_yhteensa AS aluekerroin 
FROM 
  (
    SELECT 
      DISTINCT fixed_key, 
      CAST(
        SUM(tyolliset) AS float
      ) / CAST(
        SUM(yhteensa) AS float
      ) AS indeksi_jakaja 
    FROM 
      dw.v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak AS t1 
    GROUP BY 
      fixed_key
  ) AS t2 
  INNER JOIN dw.v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak AS t3 ON t2.fixed_key = t3.fixed_key

GO


