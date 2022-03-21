USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_spl_vaikuttavuus_maakunnat]    Script Date: 28.10.2020 23:16:00 ******/
DROP VIEW IF EXISTS [dw].[v_amos_spl_vaikuttavuus_maakunnat]
GO

/****** Object:  View [dw].[v_amos_spl_vaikuttavuus_maakunnat]    Script Date: 28.10.2020 23:16:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dw].[v_amos_spl_vaikuttavuus_maakunnat] AS
SELECT DISTINCT tilv + 1 AS Tilastovuosi
      ,[tilvasmaak] as [Koodi Maakunta]
      ,d1.maakunta_fi AS Maakunta
      ,[paatoiminen_tyollinen] AS [v Päätoiminen työllinen]
      ,[tyoton] AS [v Työtön]
      ,[tyollinen_opiskelija] [v Työllinen opiskelija]
      ,[tyolliset] AS [v Työllinen]
      ,[yhteensa] AS [v Yhteensä]
      ,[tyolliset_per_yhteensa] 
      ,[indeksi_jakaja]
      ,[aluekerroin] AS [v Aluekerroin]
  FROM [ANTERO].[dw].[f_amos_spl_vaikuttavuus_maakunnat] f
  LEFT JOIN ANTERO.dw.d_alueluokitus d1 ON d1.maakunta_koodi = f.tilvasmaak 

GO

USE ANTERO
