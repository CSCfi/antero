USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_27b_perusopetuksen_katsomusaineet_jarjestaja]    Script Date: 16.1.2026 16.53.17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















CREATE OR ALTER VIEW [dbo].[v_sa_2_27b_perusopetuksen_katsomusaineet_jarjestaja] AS

SELECT [tilv] = CAST(tilv as nvarchar(4))
	,[tilv_date] = CAST(tilv+'0101' as date)
	,[kmaak] = CAST(kmaak as nvarchar(2))
	,[jarj] = CAST(jarj as nvarchar(10))

    ,[ov16] = CAST(ov16 as int)
    ,[ov79] = CAST(ov79 as int)
    ,[ovaik] = CAST(ovaik as int)

	,[aev] = CAST(aev as int)
	,[aor] = CAST(aor as int)
	,[aka] = CAST(aka as int)
	,[ais] = CAST(ais as int)
	,[aju] = CAST(aju as int)
	,[aad] = CAST(aad as int)
	,[aba] = CAST(aba as int)
	,[abu] = CAST(abu as int)
	,[ahe] = CAST(ahe as int)
	,[akr] = CAST(akr as int)
	,[amu] = CAST(amu as int)
	,[aet] = CAST(aet as int)
	,[aem] = CAST(aem as int)
	,[amo] = CAST(amo as int)
	,[atp] = CAST(atp as int)
	,[aky] = CAST(aky as int)

	,[yev] = CAST(yev as int)
	,[yor] = CAST(yor as int)
	,[yka] = CAST(yka as int)
	,[yis] = CAST(yis as int)
	,[yju] = CAST(yju as int)
	,[yad] = CAST(yad as int)
	,[yba] = CAST(yba as int)
	,[ybu] = CAST(ybu as int)
	,[yhe] = CAST(yhe as int)
	,[ykr] = CAST(ykr as int)
	,[ymu] = CAST(ymu as int)
	,[yet] = CAST(yet as int)
	,[yem] = CAST(yem as int)
	,[ymo] = CAST(ymo as int)
	,[ytp] = CAST(ytp as int)
	,[yky] = CAST(yky as int)

	,[uev] = CAST(uev as int)
	,[uor] = CAST(uor as int)
	,[uka] = CAST(uka as int)
	,[uis] = CAST(uis as int)
	,[uju] = CAST(uju as int)
	,[uad] = CAST(uad as int)
	,[uba] = CAST(uba as int)
	,[ubu] = CAST(ubu as int)
	,[uhe] = CAST(uhe as int)
	,[ukr] = CAST(ukr as int)
	,[umu] = CAST(umu as int)
	,[uet] = CAST(uet as int)
	,[uem] = CAST(uem as int)
	,[umo] = CAST(umo as int)
	,[utp] = CAST(utp as int)
	,[uky] = CAST(uky as int)

	,[luontipvm] = CAST(luontipvm as date)
	,[tietolahde] = CAST(tietolahde as nvarchar(20))

FROM (

SELECT [tilv]
      ,[kmaak]
	  ,[jarj]
      ,[ov16]
      ,[ov79]
      ,[ovaik]
      ,[aev]
      ,[aor]
      ,[aka]
      ,[ais]
      ,[aju]
      ,[aad]
      ,[aba]
      ,[abu]
      ,[ahe]
      ,[akr]
      ,[amu]
      ,[aet]
      ,[aem]
      ,[amo]
      ,[atp]
      ,[aky]

      ,[yev]
      ,[yor]
      ,[yka]
      ,[yis]
      ,[yju]
      ,[yad]
      ,[yba]
      ,[ybu]
      ,[yhe]
      ,[ykr]
      ,[ymu]
      ,[yet]
      ,[yem]
      ,[ymo]
      ,[ytp]
      ,[yky]

      ,[uev]
      ,[uor]
      ,[uka]
      ,[uis]
      ,[uju]
      ,[uad]
      ,[uba]
      ,[ubu]
      ,[uhe]
      ,[ukr]
      ,[umu]
      ,[uet]
      ,[uem]
      ,[umo]
      ,[utp]
      ,[uky]

      ,[luontipvm]
	  ,[tietolahde] = 'TK_2_27b_sopv_25'
  FROM [TK_H9098_CSC].[dbo].[TK_K2_27b_sopv_25]

) kaikkiVuodet


GO


