USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]    Script Date: 2.9.2024 13:18:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki] AS

SELECT [tilv] = CAST(tilv as nvarchar(4))
	,[tilv_date] = CAST(tilv+'0101' as date)
	,[jarj] = CAST(jarj as nvarchar(10))
	,[tunn] = CAST(tunn as nvarchar(5))
    ,[ove] = CAST(ove as int)
    ,[ov16] = CAST(ov16 as int)
    ,[ov79] = CAST(ov79 as int)
    ,[ovlisa] = CAST(ovlisa as int)
    ,[oerim] = CAST(oerim as int)
    ,[oerin] = CAST(oerin as int)
    ,[oeriy] = CAST(oeriy as int)
    ,[tehoesi] = CAST(tehoesi as int)
    ,[teho16] = CAST(teho16 as int)
    ,[teho79] = CAST(teho79 as int)
    ,[teholisa] = CAST(teholisa as int)
    ,[tehoy] = CAST(tehoy as int)
    ,[tehoesim] = CAST(tehoesim as int)
    ,[tehoesin] = CAST(tehoesin as int)
    ,[teho16m] = CAST(teho16m as int)
    ,[teho16n] = CAST(teho16n as int)
    ,[teho79m] = CAST(teho79m as int)
    ,[teho79n] = CAST(teho79n as int)
    ,[teholisam] = CAST(teholisam as int)
    ,[teholisan] = CAST(teholisan as int)
    ,[tehoosa] = CAST(tehoosa as int)
    ,[tehotuki] = CAST(tehotuki as int)
    ,[tehoavus] = CAST(tehoavus as int)
    ,[tehotulk] = CAST(tehotulk as int)
    ,[tehoapuv] = CAST(tehoapuv as int)
    ,[ertuesi] = CAST(ertuesi as int)
    ,[ertu16] = CAST(ertu16 as int)
    ,[ertu79] = CAST(ertu79 as int)
    ,[ertulisa] = CAST(ertulisa as int)
    ,[ertuy] = CAST(ertuy as int)
    ,[totesi1] = CAST(totesi1 as int)
    ,[totesi2] = CAST(totesi2 as int)
    ,[totesi3] = CAST(totesi3 as int)
    ,[totesi4] = CAST(totesi4 as int)
    ,[totesi5] = CAST(totesi5 as int)
	,[totesi6] = CAST(totesi6 as int)
    ,[tot161] = CAST(tot161 as int)
    ,[tot162] = CAST(tot162 as int)
    ,[tot163] = CAST(tot163 as int)
    ,[tot164] = CAST(tot164 as int)
    ,[tot165] = CAST(tot165 as int)
	,[tot166] = CAST(tot166 as int)
    ,[tot791] = CAST(tot791 as int)
    ,[tot792] = CAST(tot792 as int)
    ,[tot793] = CAST(tot793 as int)
    ,[tot794] = CAST(tot794 as int)
    ,[tot795] = CAST(tot795 as int)
	,[tot796] = CAST(tot796 as int)
    ,[totlisa1] = CAST(totlisa1 as int)
    ,[totlisa2] = CAST(totlisa2 as int)
    ,[totlisa3] = CAST(totlisa3 as int)
    ,[totlisa4] = CAST(totlisa4 as int)
    ,[totlisa5] = CAST(totlisa5 as int)
    ,[ertuosa] = CAST(ertuosa as int)
    ,[ertutuki] = CAST(ertutuki as int)
    ,[ertuavus] = CAST(ertuavus as int)
    ,[ertutulk] = CAST(ertutulk as int)
    ,[ertuapuv] = CAST(ertuapuv as int)
	,[luontipvm] = CAST(luontipvm as date)
	,[tietolahde] = CAST(tietolahde as nvarchar(20))

FROM (

  SELECT [tilv]
      ,[jarj]
      ,[tunn]
      ,[ove]
      ,[ov16]
      ,[ov79]
      ,[ovlisa]
      ,[oerim]
      ,[oerin]
      ,[oeriy]
      ,[tehoesi]
      ,[teho16]
      ,[teho79]
      ,[teholisa]
      ,[tehoy]
      ,[tehoesim] = null
      ,[tehoesin] = null
      ,[teho16m] = null
      ,[teho16n] = null
      ,[teho79m] = null
      ,[teho79n] = null
      ,[teholisam] = null
      ,[teholisan] = null
      ,[tehoosa]
      ,[tehotuki]
      ,[tehoavus]
      ,[tehotulk]
      ,[tehoapuv]
      ,[ertuesi]
      ,[ertu16]
      ,[ertu79]
      ,[ertulisa]
      ,[ertuy]
      ,[totesi1]
      ,[totesi2]
      ,[totesi3]
      ,[totesi4]
      ,[totesi5]
	  ,[totesi6] = null
      ,[tot161]
      ,[tot162]
      ,[tot163]
      ,[tot164]
      ,[tot165]
	  ,[tot166] = null
      ,[tot791]
      ,[tot792]
      ,[tot793]
      ,[tot794]
      ,[tot795]
	  ,[tot796] = null
      ,[totlisa1]
      ,[totlisa2]
      ,[totlisa3]
      ,[totlisa4]
      ,[totlisa5]
      ,[ertuosa]
      ,[ertutuki]
      ,[ertuavus]
      ,[ertutulk]
      ,[ertuapuv]
	  ,[luontipvm]
      ,[tietolahde] = 'TK_2_22c_sopv_21'
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]

  UNION ALL

  SELECT [tilv]
      ,[jarj]
      ,[tunn]
      ,[ove]
      ,[ov16]
      ,[ov79]
      ,[ovlisa]
      ,[oerim]
      ,[oerin]
      ,[oeriy]
      ,[tehoesi]
      ,[teho16]
      ,[teho79]
      ,[teholisa]
      ,[tehoy]
      ,[tehoesim]
      ,[tehoesin]
      ,[teho16m]
      ,[teho16n]
      ,[teho79m]
      ,[teho79n]
      ,[teholisam]
      ,[teholisan]
      ,[tehoosa]
      ,[tehotuki]
      ,[tehoavus]
      ,[tehotulk]
      ,[tehoapuv]
      ,[ertuesi]
      ,[ertu16]
      ,[ertu79]
      ,[ertulisa]
      ,[ertuy]
      ,[totesi1]
      ,[totesi2]
      ,[totesi3]
      ,[totesi4]
      ,[totesi5]
	  ,[totesi6] = null
      ,[tot161]
      ,[tot162]
      ,[tot163]
      ,[tot164]
      ,[tot165]
	  ,[tot166] = null
      ,[tot791]
      ,[tot792]
      ,[tot793]
      ,[tot794]
      ,[tot795]
	  ,[tot796] = null
      ,[totlisa1]
      ,[totlisa2]
      ,[totlisa3]
      ,[totlisa4]
      ,[totlisa5]
      ,[ertuosa]
      ,[ertutuki]
      ,[ertuavus]
      ,[ertutulk]
      ,[ertuapuv]
	  ,[luontipvm]
      ,[tietolahde] = 'TK_2_22c_sopv_22'
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_22]

  UNION ALL

  SELECT distinct [tilv]
      ,[jarj]
      ,[tunn]
      ,[ove]
      ,[ov16]
      ,[ov79]
      ,[ovlisa]
      ,[oerim]
      ,[oerin]
      ,[oeriy]
      ,[tehoesi]
      ,[teho16]
      ,[teho79]
      ,[teholisa]
      ,[tehoy]
      ,[tehoesim]
      ,[tehoesin]
      ,[teho16m]
      ,[teho16n]
      ,[teho79m]
      ,[teho79n]
      ,[teholisam]
      ,[teholisan]
      ,[tehoosa]
      ,[tehotuki]
      ,[tehoavus]
      ,[tehotulk]
      ,[tehoapuv]
      ,[ertuesi]
      ,[ertu16]
      ,[ertu79]
      ,[ertulisa]
      ,[ertuy]
      ,[totesi1]
      ,[totesi2]
      ,[totesi3]
      ,[totesi4]
      ,[totesi5]
	  ,[totesi6]
      ,[tot161]
      ,[tot162]
      ,[tot163]
      ,[tot164]
      ,[tot165]
	  ,[tot166]
      ,[tot791]
      ,[tot792]
      ,[tot793]
      ,[tot794]
      ,[tot795]
	  ,[tot796]
      ,[totlisa1]
      ,[totlisa2]
      ,[totlisa3]
      ,[totlisa4]
      ,[totlisa5]
      ,[ertuosa]
      ,[ertutuki]
      ,[ertuavus]
      ,[ertutulk]
      ,[ertuapuv]
	  ,[luontipvm]
      ,[tietolahde] = 'TK_2_22c_sopv_23'
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_23]

  UNION ALL

  SELECT distinct [tilv]
      ,[jarj]
      ,[tunn]
      ,[ove]
      ,[ov16]
      ,[ov79]
      ,[ovlisa]
      ,[oerim]
      ,[oerin]
      ,[oeriy]
      ,[tehoesi]
      ,[teho16]
      ,[teho79]
      ,[teholisa]
      ,[tehoy]
      ,[tehoesim]
      ,[tehoesin]
      ,[teho16m]
      ,[teho16n]
      ,[teho79m]
      ,[teho79n]
      ,[teholisam]
      ,[teholisan]
      ,[tehoosa]
      ,[tehotuki]
      ,[tehoavus]
      ,[tehotulk]
      ,[tehoapuv]
      ,[ertuesi]
      ,[ertu16]
      ,[ertu79]
      ,[ertulisa]
      ,[ertuy]
      ,[totesi1]
      ,[totesi2]
      ,[totesi3]
      ,[totesi4]
      ,[totesi5]
	  ,[totesi6]
      ,[tot161]
      ,[tot162]
      ,[tot163]
      ,[tot164]
      ,[tot165]
	  ,[tot166]
      ,[tot791]
      ,[tot792]
      ,[tot793]
      ,[tot794]
      ,[tot795]
	  ,[tot796]
      ,[totlisa1]
      ,[totlisa2]
      ,[totlisa3]
      ,[totlisa4]
      ,[totlisa5]
      ,[ertuosa]
      ,[ertutuki]
      ,[ertuavus]
      ,[ertutulk]
      ,[ertuapuv]
	  ,[luontipvm]
      ,[tietolahde] = 'TK_2_22c_sopv_24'
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_24]

) kaikkiVuodet


GO


