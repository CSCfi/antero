USE [Vipunen_koodisto]
GO

/****** Object:  View [dbo].[v_koulutuksen_jarjestaja_koko]    Script Date: 12.1.2021 6:16:45 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuksen_jarjestaja_koko]
GO

USE [VipunenTK_SA]
GO

DROP VIEW IF EXISTS [dbo].[v_sa_6_3_Koulutuksen_jarjestajan_koko]
GO

/****** Object:  View [dbo].[v_koulutuksen_jarjestaja_koko]    Script Date: 12.1.2021 6:16:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_sa_6_3_Koulutuksen_jarjestajan_koko] AS

--truncate table [ANTERO].[dw].[d_jarjestajankoko]
--insert into [ANTERO].[dw].[d_jarjestajankoko] 
--select * from dbo.v_sa_6_3_Koulutuksen_jarjestajan_koko 

--drop table if exists [ANTERO].[dw].[d_jarjestajankoko]
--select * into [ANTERO].[dw].[d_jarjestajankoko] 
--from dbo.v_sa_6_3_Koulutuksen_jarjestajan_koko

SELECT id = ROW_NUMBER() over(order by tilv, jarj)
	  ,[tilv] = cast(tilv as varchar(4))
	  ,[jarj] = cast(jarj as varchar(10))
      ,[yopp01] = cast(coalesce(yopp01,0) as int) 
      ,[yopp02] = cast(coalesce(yopp02,0) as int) 
      ,[yopp19] = cast(coalesce(yopp19,0) as int) 
      ,[yopp10] = cast(coalesce(yopp10,0) as int) 
      ,[yopp21] = cast(coalesce(yopp21,0) as int) 
      ,[yopp22] = cast(coalesce(yopp22,0) as int) 
      ,[yopp31] = cast(coalesce(yopp31,0) as int) 
      ,[yopp32] = cast(coalesce(yopp32,0) as int) 
      ,[yopp33] = cast(coalesce(yopp33,0) as int) 
      ,[yopp34] = cast(coalesce(yopp34,0) as int) 
      ,[yopp35] = cast(coalesce(yopp35,0) as int) 
      ,[yopp36] = cast(coalesce(yopp36,0) as int) 
      ,[yopp37] = cast(coalesce(yopp37,0) as int) 
      ,[yopp38] = cast(coalesce(yopp38,0) as int) 
      ,[yopp91] = cast(coalesce(yopp91,0) as int) 
      ,[yopp31ophal] = cast(coalesce(yopp31ophal,0) as int) 
      ,[yopp32ophal] = cast(coalesce(yopp32ophal,0) as int) 
      ,[yopp33ophal] = cast(coalesce(yopp33ophal,0) as int) 
      ,[yopp34ophal] = cast(coalesce(yopp34ophal,0) as int) 
      ,[yopp35ophal] = cast(coalesce(yopp35ophal,0) as int)
      ,[yopp36ophal] = cast(coalesce(yopp36ophal,0) as int) 
      ,[yopp37ophal] = cast(coalesce(yopp37ophal,0) as int) 
      ,[yopp38ophal] = cast(coalesce(yopp38ophal,0) as int)
	  ,[source] = 'Tilastokeskus 6.3'
	  
FROM (

--lisää uusi sopv tähän
  
  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_20

  UNION ALL

  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_19

  UNION ALL

  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_18

  UNION ALL

  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_17

  UNION ALL

  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_16

  UNION ALL

  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_15

  UNION ALL

  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_14

  UNION ALL

  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_13

  UNION ALL

  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_12

  UNION ALL

  SELECT DISTINCT [tilv]
	  ,[jarj]
      ,[yopp01]
      ,[yopp02]
      ,[yopp19]
      ,[yopp10]
      ,[yopp21]
      ,[yopp22]
      ,[yopp31]
      ,[yopp32]
      ,[yopp33]
      ,[yopp34]
      ,[yopp35]
      ,[yopp36]
      ,[yopp37]
      ,[yopp38]
      ,[yopp91]
      ,[yopp31ophal]
      ,[yopp32ophal]
      ,[yopp33ophal]
      ,[yopp34ophal]
      ,[yopp35ophal]
      ,[yopp36ophal]
      ,[yopp37ophal]
      ,[yopp38ophal]
  FROM TK_H9098_CSC.dbo.TK_6_3_sopv_11
                
) KaikkiVuodet

--päivitä tarvittaessa
where 0 < [yopp01]+[yopp02]+[yopp19]+[yopp10]+[yopp21]+[yopp22]+[yopp31]+[yopp32]+[yopp33]+[yopp34]+[yopp35]+[yopp36]+[yopp37]+[yopp38]+[yopp91]+[yopp31ophal]+[yopp32ophal]+[yopp33ophal]+[yopp34ophal]+[yopp35ophal]+[yopp36ophal]+[yopp37ophal]+[yopp38ophal]



GO
use antero

