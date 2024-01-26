USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_spl_vaikuttavuus_maakunnat]    Script Date: 11.10.2022 20:06:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_amos_spl_vaikuttavuus_maakunnat] AS

SELECT DISTINCT tilv + 1 AS Tilastovuosi
      ,[tilvasmaak] as [Koodi Maakunta]
      ,(select top 1 maakunta_fi from dw.d_alueluokitus where maakunta_koodi = f.tilvasmaak and maakunta_fi != 'Ulkomaat')
		AS Maakunta
      ,[paatoiminen_tyollinen] AS [v Päätoiminen työllinen]
      ,[tyoton] AS [v Työtön]
      ,[tyollinen_opiskelija] [v Työllinen opiskelija]
      ,[tyolliset] AS [v Työllinen]
      ,[yhteensa] AS [v Yhteensä]
      ,[tyolliset_per_yhteensa] 
      ,[indeksi_jakaja]
      ,[aluekerroin] AS [v Aluekerroin]
  FROM [dw].[f_amos_spl_vaikuttavuus_maakunnat] f

GO


