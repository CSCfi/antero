USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_1_24_Jatkuva_oppiminen_tutk_joht_tai_kurssikoul_osallistuneet]    Script Date: 5.5.2025 15.14.37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










/*
Huom. 
- Sis. aineistot 1.24a-g.
- Aineistojen luokitukset hiukan kustomoituja, ks. dimensioviite näkymässä vipunentk.dbo.v_f_tab_jatkuva_oppiminen_tutk_joht_tai_kurssikoul_osallistuneet_1_24_cultures 
- Kuution mittareissa näkyvyyssääntöjä, pohjustetaan osin näkymässä.
*/
ALTER VIEW [dbo].[v_sa_1_24_Jatkuva_oppiminen_tutk_joht_tai_kurssikoul_osallistuneet] AS

  --a: sp, ikar6
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'sp'
	  ,[taustamuuttujan_arvo] = [sp]
	  ,[taustamuuttuja_2] = 'ikar6'
	  ,[taustamuuttujan_2_arvo] = [ikar6]
      ,[sp]
      ,[ikar6] 
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24a'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24a_sopv_22]

  UNION ALL

  --a: ikar6, sp
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'ikar6'
	  ,[taustamuuttujan_arvo] = [ikar6]
	  ,[taustamuuttuja_2] = 'sp'
	  ,[taustamuuttujan_2_arvo] = [sp]
      ,[sp]
      ,[ikar6]
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24a'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24a_sopv_22]

  UNION ALL

  --b: sp, kaste_t0
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'sp'
	  ,[taustamuuttujan_arvo] = [sp]
	  ,[taustamuuttuja_2] = 'kaste_t0'
	  ,[taustamuuttujan_2_arvo] = [kaste_t0]
      ,[sp]
      ,[ikar6] = 'SS'
      ,[kaste_t0]
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24b'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24b_sopv_22]

  UNION ALL
  
  --b: kaste_t0, sp
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'kaste_t0'
	  ,[taustamuuttujan_arvo] = [kaste_t0]
	  ,[taustamuuttuja_2] = 'sp'
	  ,[taustamuuttujan_2_arvo] = [sp]
      ,[sp]
      ,[ikar6] = 'SS'
      ,[kaste_t0]
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24b'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24b_sopv_22]

  UNION ALL
  
  --c
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'syntyp'
	  ,[taustamuuttujan_arvo] = [syntyp]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp]
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24c'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24c_sopv_22]

  UNION ALL
  
  --d
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'avi'
	  ,[taustamuuttujan_arvo] = [avi]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi]
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24d'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24d_sopv_22]

  UNION ALL

  --e
  SELECT [tilv]
	  ,[perusjoukko] = 'tyolliset'
	  ,[taustamuuttuja] = 'tol2008_1_v3'
	  ,[taustamuuttujan_arvo] = [tol2008_1_v3]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3]
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_tyol]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_tyol]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_tyol]
      ,[aineisto] = '1.24e'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24e_sopv_22]

  UNION ALL

  --f
  SELECT [tilv]
	  ,[perusjoukko] = 'tyolliset'
	  ,[taustamuuttuja] = 'tsekt_v2'
	  ,[taustamuuttujan_arvo] = [tsekt_v2]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2]
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_tyol]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_tyol]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_tyol]
      ,[aineisto] = '1.24f'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24f_sopv_22]

  UNION ALL

  --g
  SELECT [tilv]
	  ,[perusjoukko] = 'palkansaajat'
	  ,[taustamuuttuja] = 'sose_v2'
	  ,[taustamuuttujan_arvo] = [sose_v2]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2]
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_palks]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_palks]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_palks]
      ,[aineisto] = '1.24g'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24g_sopv_22]

  -- SOPV_23:

  UNION ALL

    --a: sp, ikar6
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'sp'
	  ,[taustamuuttujan_arvo] = [sp]
	  ,[taustamuuttuja_2] = 'ikar6'
	  ,[taustamuuttujan_2_arvo] = [ikar6]
      ,[sp]
      ,[ikar6] 
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24a'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24a_sopv_23]

  UNION ALL

  --a: ikar6, sp
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'ikar6'
	  ,[taustamuuttujan_arvo] = [ikar6]
	  ,[taustamuuttuja_2] = 'sp'
	  ,[taustamuuttujan_2_arvo] = [sp]
      ,[sp]
      ,[ikar6]
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24a'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24a_sopv_23]

  UNION ALL

  --b: sp, kaste_t0
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'sp'
	  ,[taustamuuttujan_arvo] = [sp]
	  ,[taustamuuttuja_2] = 'kaste_t0'
	  ,[taustamuuttujan_2_arvo] = [kaste_t0]
      ,[sp]
      ,[ikar6] = 'SS'
      ,[kaste_t0]
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24b'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24b_sopv_23]

  UNION ALL
  
  --b: kaste_t0, sp
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'kaste_t0'
	  ,[taustamuuttujan_arvo] = [kaste_t0]
	  ,[taustamuuttuja_2] = 'sp'
	  ,[taustamuuttujan_2_arvo] = [sp]
      ,[sp]
      ,[ikar6] = 'SS'
      ,[kaste_t0]
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24b'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24b_sopv_23]

  UNION ALL
  
  --c
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'syntyp'
	  ,[taustamuuttujan_arvo] = [syntyp]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp]
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24c'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24c_sopv_23]

  UNION ALL
  
  --d
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'avi'
	  ,[taustamuuttujan_arvo] = [avi]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi]
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24d'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24d_sopv_23]

  UNION ALL

  --e
  SELECT [tilv]
	  ,[perusjoukko] = 'tyolliset'
	  ,[taustamuuttuja] = 'tol2008_1_v3'
	  ,[taustamuuttujan_arvo] = [tol2008_1_v3]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3]
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_tyol]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_tyol]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_tyol]
      ,[aineisto] = '1.24e'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24e_sopv_23]

  UNION ALL

  --f
  SELECT [tilv]
	  ,[perusjoukko] = 'tyolliset'
	  ,[taustamuuttuja] = 'tsekt_v2'
	  ,[taustamuuttujan_arvo] = [tsekt_v2]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2]
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_tyol]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_tyol]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_tyol]
      ,[aineisto] = '1.24f'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24f_sopv_23]

  UNION ALL

  --g
  SELECT [tilv]
	  ,[perusjoukko] = 'palkansaajat'
	  ,[taustamuuttuja] = 'sose_v2'
	  ,[taustamuuttujan_arvo] = [sose_v2]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2]
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_palks]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_palks]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_palks]
      ,[aineisto] = '1.24g'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24g_sopv_23]

    -- SOPV_24:

  UNION ALL

    --a: sp, ikar6
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'sp'
	  ,[taustamuuttujan_arvo] = [sp]
	  ,[taustamuuttuja_2] = 'ikar6'
	  ,[taustamuuttujan_2_arvo] = [ikar6]
      ,[sp]
      ,[ikar6] 
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24a'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24a_sopv_24]

  UNION ALL

  --a: ikar6, sp
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'ikar6'
	  ,[taustamuuttujan_arvo] = [ikar6]
	  ,[taustamuuttuja_2] = 'sp'
	  ,[taustamuuttujan_2_arvo] = [sp]
      ,[sp]
      ,[ikar6]
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24a'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24a_sopv_24]

  UNION ALL

  --b: sp, kaste_t0
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'sp'
	  ,[taustamuuttujan_arvo] = [sp]
	  ,[taustamuuttuja_2] = 'kaste_t0'
	  ,[taustamuuttujan_2_arvo] = [kaste_t0]
      ,[sp]
      ,[ikar6] = 'SS'
      ,[kaste_t0]
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24b'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24b_sopv_24]

  UNION ALL
  
  --b: kaste_t0, sp
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'kaste_t0'
	  ,[taustamuuttujan_arvo] = [kaste_t0]
	  ,[taustamuuttuja_2] = 'sp'
	  ,[taustamuuttujan_2_arvo] = [sp]
      ,[sp]
      ,[ikar6] = 'SS'
      ,[kaste_t0]
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24b'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24b_sopv_24]

  UNION ALL
  
  --c
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'syntyp'
	  ,[taustamuuttujan_arvo] = [syntyp]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp]
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24c'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24c_sopv_24]

  UNION ALL
  
  --d
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'avi'
	  ,[taustamuuttujan_arvo] = [avi]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi]
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24d'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24d_sopv_24]

  UNION ALL

  --e
  SELECT [tilv]
	  ,[perusjoukko] = 'tyolliset'
	  ,[taustamuuttuja] = 'tol2008_1_v3'
	  ,[taustamuuttujan_arvo] = [tol2008_1_v3]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3]
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_tyol]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_tyol]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_tyol]
      ,[aineisto] = '1.24e'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24e_sopv_24]

  UNION ALL

  --f
  SELECT [tilv]
	  ,[perusjoukko] = 'tyolliset'
	  ,[taustamuuttuja] = 'tsekt_v2'
	  ,[taustamuuttujan_arvo] = [tsekt_v2]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2]
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_tyol]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_tyol]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_tyol]
      ,[aineisto] = '1.24f'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24f_sopv_24]

  UNION ALL

  --g
  SELECT [tilv]
	  ,[perusjoukko] = 'palkansaajat'
	  ,[taustamuuttuja] = 'sose_v2'
	  ,[taustamuuttujan_arvo] = [sose_v2]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2]
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_palks]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_palks]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_palks]
      ,[aineisto] = '1.24g'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24g_sopv_24]


  -- SOPV_25:

  UNION ALL

    --a: sp, ikar6
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'sp'
	  ,[taustamuuttujan_arvo] = [sp]
	  ,[taustamuuttuja_2] = 'ikar6'
	  ,[taustamuuttujan_2_arvo] = [ikar6]
      ,[sp]
      ,[ikar6] 
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24a'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24a_sopv_25]

  UNION ALL

  --a: ikar6, sp
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'ikar6'
	  ,[taustamuuttujan_arvo] = [ikar6]
	  ,[taustamuuttuja_2] = 'sp'
	  ,[taustamuuttujan_2_arvo] = [sp]
      ,[sp]
      ,[ikar6]
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24a'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24a_sopv_25]

  UNION ALL

  --b: sp, kaste_t0
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'sp'
	  ,[taustamuuttujan_arvo] = [sp]
	  ,[taustamuuttuja_2] = 'kaste_t0'
	  ,[taustamuuttujan_2_arvo] = [kaste_t0]
      ,[sp]
      ,[ikar6] = 'SS'
      ,[kaste_t0]
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24b'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24b_sopv_25]

  UNION ALL
  
  --b: kaste_t0, sp
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'kaste_t0'
	  ,[taustamuuttujan_arvo] = [kaste_t0]
	  ,[taustamuuttuja_2] = 'sp'
	  ,[taustamuuttujan_2_arvo] = [sp]
      ,[sp]
      ,[ikar6] = 'SS'
      ,[kaste_t0]
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24b'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24b_sopv_25]

  UNION ALL
  
  --c
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'syntyp'
	  ,[taustamuuttujan_arvo] = [syntyp]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp]
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24c'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24c_sopv_25]

  UNION ALL
  
  --d
  SELECT [tilv]
	  ,[perusjoukko] = 'vaesto'
	  ,[taustamuuttuja] = 'avi'
	  ,[taustamuuttujan_arvo] = [avi]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi]
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_vaesto]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_vaesto]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_vaesto]
      ,[aineisto] = '1.24d'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24d_sopv_25]

  UNION ALL

  --e
  SELECT [tilv]
	  ,[perusjoukko] = 'tyolliset'
	  ,[taustamuuttuja] = 'tol2008_1_v3'
	  ,[taustamuuttujan_arvo] = [tol2008_1_v3]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3]
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_tyol]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_tyol]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_tyol]
      ,[aineisto] = '1.24e'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24e_sopv_25]

  UNION ALL

  --f
  SELECT [tilv]
	  ,[perusjoukko] = 'tyolliset'
	  ,[taustamuuttuja] = 'tsekt_v2'
	  ,[taustamuuttujan_arvo] = [tsekt_v2]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2]
	  ,[sose_v2] = 'S'
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_tyol]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_tyol]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_tyol]
      ,[aineisto] = '1.24f'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24f_sopv_25]

  UNION ALL

  --g
  SELECT [tilv]
	  ,[perusjoukko] = 'palkansaajat'
	  ,[taustamuuttuja] = 'sose_v2'
	  ,[taustamuuttujan_arvo] = [sose_v2]
	  ,[taustamuuttuja_2] = ''
	  ,[taustamuuttujan_2_arvo] = ''
      ,[sp] = 'S'
      ,[ikar6] = 'SS'
      ,[kaste_t0] = 'S'
	  ,[syntyp] = 'S'
	  ,[avi] = 'S'
	  ,[tol2008_1_v3] = 'SS'
	  ,[tsekt_v2] = 'S'
	  ,[sose_v2]
      ,[Opisk_laaja_osuus] = [Opisk_laaja_osuus_palks]
      ,[Opisk_tutko_osuus] = [Opisk_tutko_osuus_palks]
      ,[Opisk_kurssi_osuus] = [Opisk_kurssi_osuus_palks]
      ,[aineisto] = '1.24g'
  FROM [TK_H9098_CSC].[dbo].[TK_1_24g_sopv_25]

GO


