USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_koulutusryhma]    Script Date: 31.12.2020 14:26:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/


ALTER view [dbo].[v_koulutusryhma] as

SELECT [id]
      ,[koulutusryhma_koodi]
      ,[koulutusryhma]
      ,[koulutusryhma_SV]
      ,[koulutusryhma_EN]
      ,[koulutusryhma2]
      ,[koulutusryhma2_SV]
      ,[koulutusryhma2_EN]
      ,[jarjestys]
	  ,[jarjestys2]
  FROM [VipunenTK_dw].[dbo].[d_koulutusryhma]

  union all

SELECT [id]
      ,[koulutusryhma_koodi]
      ,[koulutusryhma]
      ,[koulutusryhma_SV]
      ,[koulutusryhma_EN]
      ,[koulutusryhma2]
      ,[koulutusryhma2_SV]
      ,[koulutusryhma2_EN]
      ,[jarjestys]
	  ,[jarjestys2]
  FROM [VipunenTK_lisatiedot].[dbo].[koulutusryhma]
  where virhetilanne = 'K'



GO



USE [ANTERO]