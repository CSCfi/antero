USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_OTV_f_2_1_R2_22]    Script Date: 14.9.2021 15:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[p_lataa_OTV_f_2_1_R2_22] AS

--EXECUTE p_lataa_OTV_f_2_1_R2_22
 
TRUNCATE TABLE VipunenTK.dbo.f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk;


INSERT INTO [VipunenTK].[dbo].[f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk]
           ([tilastointivuosi]
           ,[tilv_date]
           ,[sukupuoli]
           ,[sukupuoli_id]
           ,[koulutusluokitus]
           ,[koulutusluokitus_id]
           ,[koulutusluokitus_historia_id]
           ,[oppilaitos]
           ,[oppilaitos_id]
           ,[oppilaitos_historia_id]
           ,[oppilaitoksen_sijaintikunta]
           ,[oppilaitoksen_sijaintikunta_id]
           ,[oppilaitoksen_sijaintikunta_historia_id]
           ,[yllapitajan_sijaintikunta]
           ,[yllapitajan_sijaintikunta_id]
           ,[yllapitajan_sijaintikunta_historia_id]
           ,[koulutuksenjarjestajan_sijaintikunta]
           ,[koulutuksenjarjestajan_sijaintikunta_id]
           ,[koulutuksenjarjestajan_sijaintikunta_historia_id]
           ,[koulutussektori]
           ,[koulutussektori_id]
           ,[opetushallinnon_koulutus]
           ,[opetushallinnon_koulutus_id]
           ,[aidinkieli_versio1x]
           ,[aidinkieli_versio1x_id]
           ,[ov1]
           ,[ov2]
           ,[ov3]
           ,[ov4]
           ,[ov5]
           ,[ov6]
           ,[ov7]
           ,[ov8]
           ,[ov9]
           ,[ov10]
           ,[aloittaneet]
           ,[opiskelijat]
           ,[tutkinnot]
           ,[ovy]
           ,[tod]
		   ,[ilmtod]
		   ,[kelaim]
           ,[tutkt]
           ,[suor10]
           ,[opiskelijat_1_9_luokka]
           ,[opiskelijat_1_10_luokka]
           ,[tutkinnot_9_luokka]
		   ,[luok1]
		   ,[luok2]
		   ,[luok3]
		   ,[luok4]
		   ,[luok5]
		   ,[luok6]
		   ,[luok7]
		   ,[luok8]
		   ,[luok9]
           ,[opksu]
           ,[opkru]
           ,[opksaa]
           ,[opkmuu]
           ,[ove]
           ,[tietolahde]
           ,[rivinumero]
           ,[aineistotunnus]
		   ,aineisto_OTV_id 
		   ,aineisto_id
		   ,koulutuslaji_OKM_id 
		   )
		   

SELECT 
	 tilastointivuosi = f.tilv
	,f.tilv_date
	,sukupuoli = f.sukupuoli
	,sukupuoli_id = coalesce(d1.id,-2)
	,koulutusluokitus   
	,koulutusluokitus_id = coalesce(d3.id,-2)
	,koulutusluokitus_historia_id = coalesce(d3h.id,-2)
           ,oppilaitos = f.[oppilaitoskoodi]
           ,[oppilaitos_id] = coalesce(d5.id,-1)
           ,[oppilaitos_historia_id] = coalesce(d5h.id,-1)
           ,[oppilaitoksen_sijaintikunta] = d5.sijaintikuntakoodi
           ,[oppilaitoksen_sijaintikunta_id] = coalesce(d6.id, -1)
           ,[oppilaitoksen_sijaintikunta_historia_id] = coalesce(d6h.id, -1)
           ,[yllapitajan_sijaintikunta] = d5.koulutuksen_jarjestajan_ksijaintikuntakoodi
           ,[yllapitajan_sijaintikunta_id] = coalesce(d7.id, -1)
           ,[yllapitajan_sijaintikunta_historia_id] = coalesce(d7h.id, -1)
           ,[koulutuksenjarjestajan_sijaintikunta] = d5.koulutuksen_jarjestajan_ksijaintikuntakoodi
           ,[koulutuksenjarjestajan_sijaintikunta_id] = coalesce(d7.id, -1)
           ,[koulutuksenjarjestajan_sijaintikunta_historia_id] = coalesce(d7h.id, -1)
           ,f.[koulutussektori]
           ,[koulutussektori_id] = coalesce(d2.id, -1)
           ,[opetushallinnon_koulutus] = CAST('1' as nvarchar(2))
           ,[opetushallinnon_koulutus_id] = coalesce(d9.id, -1)
           ,[aidinkieli_versio1x] = CAST('-1' as nvarchar(2))
           ,[aidinkieli_versio1x_id] = -1
			,[ov1] = Case when f.[ov1]=0 then NULL else f.[ov1] end
			,[ov2] = Case when f.[ov2]=0 then NULL else f.[ov2] end
			,[ov3] = Case when f.[ov3]=0 then NULL else f.[ov3] end
			,[ov4] = Case when f.[ov4]=0 then NULL else f.[ov4] end
			,[ov5] = Case when f.[ov5]=0 then NULL else f.[ov5] end
			,[ov6] = Case when f.[ov6]=0 then NULL else f.[ov6] end
			,[ov7] = Case when f.[ov7]=0 then NULL else f.[ov7] end
			,[ov8] = Case when f.[ov8]=0 then NULL else f.[ov8] end
			,[ov9] = Case when f.[ov9]=0 then NULL else f.[ov9] end
			,[ov10] = Case when f.[ov10]=0 then NULL else f.[ov10] end
			,[aloittaneet] = Case when f.[aloittaneet]=0 then NULL else f.[aloittaneet] end
			,[opiskelijat] = Case when f.[opiskelijat]=0 then NULL else f.[opiskelijat] end
			,[tutkinnot] = Case when f.[tutkinnot]=0 then NULL else f.[tutkinnot] end
			,[ovy] = Case when f.[ovy]=0 then NULL else f.[ovy] end
			,[tod] = Case when f.[tod]=0 then NULL else f.[tod] end
			,[ilmtod] = Case when f.[ilmtod]=0 then NULL else f.[ilmtod] end
			,[ilmtod] = Case when f.[kelaim]=0 then NULL else f.[kelaim] end
			,[tutkt] = Case when f.[tutkt]=0 then NULL else f.[tutkt] end
			,[suor10] = Case when f.[suor10]=0 then NULL else f.[suor10] end
			,[opiskelijat_1_9_luokka] = Case when f.[opiskelijat_1_9_luokka]=0 then NULL else f.[opiskelijat_1_9_luokka] end
			,[opiskelijat_1_10_luokka] = Case when f.[opiskelijat_1_10_luokka]=0 then NULL else f.[opiskelijat_1_10_luokka] end
			,[tutkinnot_9_luokka] = Case when f.[tutkinnot_9_luokka]=0 then NULL else f.[tutkinnot_9_luokka] end
			,[luok1] = Case when f.[luok1]=0 then NULL else f.[luok1] end
			,[luok2] = Case when f.[luok2]=0 then NULL else f.[luok2] end
			,[luok3] = Case when f.[luok3]=0 then NULL else f.[luok3] end
			,[luok4] = Case when f.[luok4]=0 then NULL else f.[luok4] end
			,[luok5] = Case when f.[luok5]=0 then NULL else f.[luok5] end
			,[luok6] = Case when f.[luok6]=0 then NULL else f.[luok6] end
			,[luok7] = Case when f.[luok7]=0 then NULL else f.[luok7] end
			,[luok8] = Case when f.[luok8]=0 then NULL else f.[luok8] end
			,[luok9] = Case when f.[luok9]=0 then NULL else f.[luok9] end
			,[opksu] = Case when f.[opksu]=0 then NULL else f.[opksu] end
			,[opkru] = Case when f.[opkru]=0 then NULL else f.[opkru] end
			,[opksaa] = Case when f.[opksaa]=0 then NULL else f.[opksaa] end
			,[opkmuu] = Case when f.[opkmuu]=0 then NULL else f.[opkmuu] end
			,[ove] = Case when f.[ove]=0 then NULL else f.[ove] end
       	,f.tietolahde
	,f.rivinumero
	,aineistotunnus = f.aineisto
	,aineisto_OTV_id =  coalesce(d8.id, -1)
	,aineisto_id = -1    -- TK-aineisto tuntemattomaksi
	,koulutuslaji_OKM_id	   =
				CASE 
					WHEN d3.koulutusaste2002_koodi = '00' THEN 1
					WHEN d3.koulutusaste2002_koodi = '20' THEN 2
					ELSE -1
				END

--frm
 
FROM (


SELECT data.* FROM (

/*
--Aineisto 2.1
--OSA 1 sukupuoliton
SELECT
		  [tilv]
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('-1' as [nvarchar](2))
		  ,koulutusluokitus = '201101'
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'
		  		  
		  ,opksu
		  ,opkru
		  ,opksaa
		  ,opkmuu
      ,ov1 = NULL
      ,ov2 = NULL
      ,ov3 = NULL
      ,ov4 = NULL
      ,ov5 = NULL
      ,ov6 = NULL
      ,ov7 = NULL
      ,ov8 = NULL
      ,ov9 = NULL
      ,ov10 = NULL
      ,aloittaneet = NULL
      ,opiskelijat = NULL
      ,tutkinnot = NULL
      ,ovy = NULL
      ,tod = NULL
	  ,ilmtod = NULL
	  ,kelaim = NULL
      ,tutkt = NULL
      ,suor10 = NULL
      ,opiskelijat_1_9_luokka = NULL
      ,opiskelijat_1_10_luokka = NULL
      ,tutkinnot_9_luokka = NULL
	  ,luok1 = NULL
      ,luok2 = NULL
      ,luok3 = NULL
      ,luok4 = NULL
      ,luok5 = NULL
      ,luok6 = NULL
      ,luok7 = NULL
      ,luok8 = NULL
      ,luok9 = NULL
      ,ove = NULL
FROM VipunenTK_DW.dbo.f_2_1_Peruskoulutiedosto
--WHERE tilv > isnull((select MAX(tilastointivuosi) from vipunen_tk.[f_2_1_Peruskoulutiedosto]),'1900')

UNION ALL
--Aineisto 2.1
--OSA 2 miehet-perus
SELECT -- Select top 0
		  [tilv] AS [tilastointivuosi] --tilv
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('1' as [nvarchar](2))
		  ,koulutusluokitus = '201101'		  
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'
		  	      
	      ,opksu = NULL
	      ,opkru = NULL
	      ,opksaa = NULL
	      ,opkmuu = NULL

		  ,CAST(ov1 AS int) - CAST(ov1n AS int) AS ov1
      ,CAST(ov2 AS int) - CAST(ov2n AS int) AS ov2
      ,CAST(ov3 AS int) - CAST(ov3n AS int) AS ov3
      ,CAST(ov4 AS int) - CAST(ov4n AS int) AS ov4
      ,CAST(ov5 AS int) - CAST(ov5n AS int) AS ov5
      ,CAST(ov6 AS int) - CAST(ov6n AS int) AS ov6
      ,CAST(ov7 AS int) - CAST(ov7n AS int) AS ov7
      ,CAST(ov8 AS int) - CAST(ov8n AS int) AS ov8
      ,CAST(ov9 AS int) - CAST(ov9n AS int) AS ov9
      ,CAST(ov10 AS int) - CAST(ov10n AS int) AS ov10
      ,CAST(ov1 AS int) - CAST(ov1n AS int) AS [aloittaneet]
      ,((CAST(ovy AS int)-CAST(ovyn AS int))-(CAST(ove AS int)-CAST(oven AS int))) AS [opiskelijat]
      ,((CAST(tod AS int)-CAST(todn AS int))+(CAST(tutkt AS int)-CAST(tutktn AS int))) AS [tutkinnot]
      ,CAST(ovy AS int) - CAST(ovyn AS int) AS [ovy]
      ,CAST(tod AS int) - CAST(todn AS int) AS [tod]
	  ,[ilmtod] = NULL
	  ,[kelaim] = NULL
      ,CAST(tutkt AS int) - CAST(tutktn AS int) AS [tutkt]
      ,CAST(suor10 AS int) - CAST(suor10n AS int) AS [suor10]
      ,((CAST(ovy AS int)-CAST(ovyn AS int))-(CAST(ove AS int)-CAST(oven AS int))-(CAST(ov10 AS int)-CAST(ov10n AS int))) AS [opiskelijat_1_9_luokka]
      ,((CAST(ovy AS int)-CAST(ovyn AS int))-(CAST(ove AS int)-CAST(oven AS int))) AS [opiskelijat_1_10_luokka]
      ,((CAST(tod AS int)-CAST(todn AS int))) AS [tutkinnot_9_luokka]
	  ,CAST(luok1 AS int) - CAST(luok1n AS int) AS luok1
      ,CAST(luok2 AS int) - CAST(luok2n AS int) AS luok2
      ,CAST(luok3 AS int) - CAST(luok3n AS int) AS luok3
      ,CAST(luok4 AS int) - CAST(luok4n AS int) AS luok4
      ,CAST(luok5 AS int) - CAST(luok5n AS int) AS luok5
      ,CAST(luok6 AS int) - CAST(luok6n AS int) AS luok6
      ,CAST(luok7 AS int) - CAST(luok7n AS int) AS luok7
      ,CAST(luok8 AS int) - CAST(luok8n AS int) AS luok8
      ,CAST(luok9 AS int) - CAST(luok9n AS int) AS luok9

      ,ove = NULL
FROM VipunenTK_DW.dbo.f_2_1_Peruskoulutiedosto
--WHERE tilv > isnull((select MAX(tilastointivuosi) from vipunen_tk.[f_2_1_Peruskoulutiedosto]),'1900')


UNION ALL
--Aineisto 2.1
--OSA 3 naiset-perus
SELECT
		  [tilv] AS [tilastointivuosi] --tilv
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('2' as [nvarchar](2))
		  ,koulutusluokitus = '201101'		  
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'

	      ,opksu = NULL
	      ,opkru = NULL
	      ,opksaa = NULL
	      ,opkmuu = NULL
	      
		  ,ov1n AS ov1
      ,ov2n AS ov2
      ,ov3n AS ov3
      ,ov4n AS ov4
      ,ov5n AS ov5
      ,ov6n AS ov6
      ,ov7n AS ov7
      ,ov8n AS ov8
      ,ov9n AS ov9
      ,ov10n AS ov10
      ,ov1n AS [aloittaneet]
      ,(CAST(ovyn AS int)-CAST(oven AS int)) AS [opiskelijat]
      ,(CAST(todn AS int)+CAST(tutktn AS int)) AS [tutkinnot]
      ,ovyn AS [ovy]
      ,todn AS [tod]
	  ,ilmtod = NULL
	  ,kelaim = NULL
      ,tutktn AS [tutkt]
      ,suor10n AS [suor10]
      ,(CAST(ovyn AS int)-CAST(oven AS int)-CAST(ov10n AS int)) AS [opiskelijat_1_9_luokka]
      ,(CAST(ovyn AS int)-CAST(oven AS int)) AS [opiskelijat_1_10_luokka]
      ,CAST(todn AS int) AS [tutkinnot_9_luokka]
      ,luok1n AS luok1
	  ,luok2n AS luok2
      ,luok3n AS luok3
      ,luok4n AS luok4
      ,luok5n AS luok5
      ,luok6n AS luok6
      ,luok7n AS luok7
      ,luok8n AS luok8
      ,luok9n AS luok9
      ,ove = NULL
      
FROM VipunenTK_DW.dbo.f_2_1_Peruskoulutiedosto
--WHERE tilv > isnull((select MAX(tilastointivuosi) from vipunen_tk.[f_2_1_Peruskoulutiedosto]),'1900')

UNION ALL
--Aineisto 2.1
--OSA 4 miehet-esi
SELECT
		  [tilv] AS [tilastointivuosi] --tilv
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('1' as [nvarchar](2))
		  ,koulutusluokitus = '001101'		  
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'
	      
	      ,opksu = NULL
	      ,opkru = NULL
	      ,opksaa = NULL
	      ,opkmuu = NULL

      ,ov1 = NULL
      ,ov2 = NULL
      ,ov3 = NULL
      ,ov4 = NULL
      ,ov5 = NULL
      ,ov6 = NULL
      ,ov7 = NULL
      ,ov8 = NULL
      ,ov9 = NULL
      ,ov10 = NULL
      ,aloittaneet = NULL
      ,opiskelijat = (CAST(ove AS int) - CAST(oven AS int))
      ,tutkinnot = NULL
      ,ovy = NULL
      ,tod = NULL
	  ,ilmtod = NULL
	  ,kelaim = NULL
      ,tutkt = NULL
      ,suor10 = NULL
      ,opiskelijat_1_9_luokka = NULL
      ,opiskelijat_1_10_luokka = NULL
      ,tutkinnot_9_luokka = NULL
	  ,luok1 = NULL
      ,luok2 = NULL
      ,luok3 = NULL
      ,luok4 = NULL
      ,luok5 = NULL
      ,luok6 = NULL
      ,luok7 = NULL
      ,luok8 = NULL
      ,luok9 = NULL
      ,CAST(ove AS int) - CAST(oven AS int) AS [ove]
FROM VipunenTK_DW.dbo.f_2_1_Peruskoulutiedosto
--WHERE tilv > isnull((select MAX(tilastointivuosi) from vipunen_tk.[f_2_1_Peruskoulutiedosto]),'1900')


UNION ALL
--Aineisto 2.1
--OSA 5 naiset-esi
SELECT
		  [tilv] AS [tilastointivuosi] --tilv
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('2' as [nvarchar](2))
		  ,koulutusluokitus = '001101'		  		  
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'

	      ,opksu = NULL
	      ,opkru = NULL
	      ,opksaa = NULL
	      ,opkmuu = NULL
      ,ov1 = NULL
      ,ov2 = NULL
      ,ov3 = NULL
      ,ov4 = NULL
      ,ov5 = NULL
      ,ov6 = NULL
      ,ov7 = NULL
      ,ov8 = NULL
      ,ov9 = NULL
      ,ov10 = NULL
      ,aloittaneet = NULL
      ,opiskelijat = CAST(oven AS int)
      ,tutkinnot = NULL
      ,ovy = NULL
      ,tod = NULL
	  ,ilmtod = NULL
	  ,kelaim = NULL
      ,tutkt = NULL
      ,suor10 = NULL
      ,opiskelijat_1_9_luokka = NULL
      ,opiskelijat_1_10_luokka = NULL
      ,tutkinnot_9_luokka = NULL
	  ,luok1 = NULL
      ,luok2 = NULL
      ,luok3 = NULL
      ,luok4 = NULL
      ,luok5 = NULL
      ,luok6 = NULL
      ,luok7 = NULL
      ,luok8 = NULL
      ,luok9 = NULL
	      
      ,[oven] AS [ove]
     
FROM VipunenTK_DW.dbo.f_2_1_Peruskoulutiedosto

UNION ALL
*/

--Aineisto 2.22
--OSA 1 sukupuoliton
SELECT
		  [tilv]
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('-1' as [nvarchar](2))
		  ,koulutusluokitus = '201101'
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'
		  		  
-- Oheiset 4 puuttuvat 2.22-aineistosta. Tiedolle pitää etsiä toinen lähdekenttä	  		  
-- Jarmo CSC 13.4.2014
		  ,opksu = NULL
		  ,opkru = NULL
		  ,opksaa = NULL
		  ,opkmuu = NULL
		  
      ,ov1 = NULL
      ,ov2 = NULL
      ,ov3 = NULL
      ,ov4 = NULL
      ,ov5 = NULL
      ,ov6 = NULL
      ,ov7 = NULL
      ,ov8 = NULL
      ,ov9 = NULL
      ,ov10 = NULL
      ,aloittaneet = NULL
      ,opiskelijat = NULL
      ,tutkinnot = NULL
      ,ovy = NULL
      ,tod = NULL
	  ,ilmtod = NULL
	  ,kelaim = NULL
      ,tutkt = NULL
      ,suor10 = NULL
      ,opiskelijat_1_9_luokka = NULL
      ,opiskelijat_1_10_luokka = NULL
      ,tutkinnot_9_luokka = NULL
	  ,luok1 = NULL
      ,luok2 = NULL
      ,luok3 = NULL
      ,luok4 = NULL
      ,luok5 = NULL
      ,luok6 = NULL
      ,luok7 = NULL
      ,luok8 = NULL
      ,luok9 = NULL

      ,ove = NULL
FROM VipunenTK_DW.dbo.f_R2_22_Oppilaitostason_oppil_ja_opisk
--WHERE tilv > isnull((select MAX(tilastointivuosi) from vipunen_tk.[f_2_1_Peruskoulutiedosto]),'1900')

UNION ALL
--Aineisto 2.22
--OSA 2 miehet-perus
SELECT -- Select top 0
		  [tilv] AS [tilastointivuosi] --tilv
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('1' as [nvarchar](2))
		  ,koulutusluokitus = '201101'		  
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'
		  	      
	      ,opksu = NULL
	      ,opkru = NULL
	      ,opksaa = NULL
	      ,opkmuu = NULL

		  ,CAST(ov1 AS int) - CAST(ov1n AS int) AS ov1
      ,CAST(ov2 AS int) - CAST(ov2n AS int) AS ov2
      ,CAST(ov3 AS int) - CAST(ov3n AS int) AS ov3
      ,CAST(ov4 AS int) - CAST(ov4n AS int) AS ov4
      ,CAST(ov5 AS int) - CAST(ov5n AS int) AS ov5
      ,CAST(ov6 AS int) - CAST(ov6n AS int) AS ov6
      ,CAST(ov7 AS int) - CAST(ov7n AS int) AS ov7
      ,CAST(ov8 AS int) - CAST(ov8n AS int) AS ov8
      ,CAST(ov9 AS int) - CAST(ov9n AS int) AS ov9
      ,CAST(ov10 AS int) - CAST(ov10n AS int) AS ov10
      ,CAST(ov1 AS int) - CAST(ov1n AS int) AS [aloittaneet]
      ,((CAST(ovy AS int)-CAST(ovyn AS int))-(CAST(ove AS int)-CAST(oven AS int))) AS [opiskelijat]
      ,((CAST(tod AS int)-CAST(todn AS int))+(CAST(coalesce(tutkt,0) AS int)-CAST(coalesce(tutktn,0) AS int))) AS [tutkinnot]
      ,CAST(ovy AS int) - CAST(ovyn AS int) AS [ovy]
      ,CAST(tod AS int) - CAST(todn AS int) AS [tod]
	  ,CAST(ilmtod AS int) - CAST(ilmtodn AS int) AS [ilmtod]
	  ,CAST(kelaim AS int) - CAST(kelaimn AS int) AS [kelaim]
      ,CAST(tutkt AS int) - CAST(tutktn AS int) AS [tutkt]
      ,CAST(suor10 AS int) - CAST(suor10n AS int) AS [suor10]
      ,((CAST(ovy AS int)-CAST(ovyn AS int))-(CAST(ove AS int)-CAST(oven AS int))-(CAST(ov10 AS int)-CAST(ov10n AS int))) AS [opiskelijat_1_9_luokka]
      ,((CAST(ovy AS int)-CAST(ovyn AS int))-(CAST(ove AS int)-CAST(oven AS int))) AS [opiskelijat_1_10_luokka]
      ,((CAST(tod AS int)-CAST(todn AS int))) AS [tutkinnot_9_luokka]
	  ,CAST(luok1 AS int) - CAST(luok1n AS int) AS luok1
      ,CAST(luok2 AS int) - CAST(luok2n AS int) AS luok2
      ,CAST(luok3 AS int) - CAST(luok3n AS int) AS luok3
      ,CAST(luok4 AS int) - CAST(luok4n AS int) AS luok4
      ,CAST(luok5 AS int) - CAST(luok5n AS int) AS luok5
      ,CAST(luok6 AS int) - CAST(luok6n AS int) AS luok6
      ,CAST(luok7 AS int) - CAST(luok7n AS int) AS luok7
      ,CAST(luok8 AS int) - CAST(luok8n AS int) AS luok8
      ,CAST(luok9 AS int) - CAST(luok9n AS int) AS luok9

      ,ove = NULL
FROM VipunenTK_DW.dbo.f_R2_22_Oppilaitostason_oppil_ja_opisk
--WHERE tilv > isnull((select MAX(tilastointivuosi) from vipunen_tk.[f_2_1_Peruskoulutiedosto]),'1900')


UNION ALL
--Aineisto 2.22
--OSA 3 naiset-perus
SELECT
		  [tilv] AS [tilastointivuosi] --tilv
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('2' as [nvarchar](2))
		  ,koulutusluokitus = '201101'		  
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'

	      ,opksu = NULL
	      ,opkru = NULL
	      ,opksaa = NULL
	      ,opkmuu = NULL
	      
		  ,ov1n AS ov1
      ,ov2n AS ov2
      ,ov3n AS ov3
      ,ov4n AS ov4
      ,ov5n AS ov5
      ,ov6n AS ov6
      ,ov7n AS ov7
      ,ov8n AS ov8
      ,ov9n AS ov9
      ,ov10n AS ov10
      ,ov1n AS [aloittaneet]
      ,(CAST(ovyn AS int)-CAST(oven AS int)) AS [opiskelijat]
      ,(CAST(todn AS int)+CAST(coalesce(tutktn,0) AS int)) AS [tutkinnot]
      ,ovyn AS [ovy]
      ,todn AS [tod]
	  ,ilmtodn as [ilmtod]
	  ,kelaimn as [kelaim]
      ,tutktn AS [tutkt]
      ,suor10n AS [suor10]
      ,(CAST(ovyn AS int)-CAST(oven AS int)-CAST(ov10n AS int)) AS [opiskelijat_1_9_luokka]
      ,(CAST(ovyn AS int)-CAST(oven AS int)) AS [opiskelijat_1_10_luokka]
      ,CAST(todn AS int) AS [tutkinnot_9_luokka]
      ,luok1n AS luok1
      ,luok2n AS luok2
      ,luok3n AS luok3
      ,luok4n AS luok4
      ,luok5n AS luok5
      ,luok6n AS luok6
      ,luok7n AS luok7
      ,luok8n AS luok8
      ,luok9n AS luok9
      ,ove = NULL
      
FROM VipunenTK_DW.dbo.f_R2_22_Oppilaitostason_oppil_ja_opisk
--WHERE tilv > isnull((select MAX(tilastointivuosi) from vipunen_tk.[f_2_1_Peruskoulutiedosto]),'1900')

UNION ALL
--Aineisto 2.22
--OSA 4 miehet-esi
SELECT
		  [tilv] AS [tilastointivuosi] --tilv
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('1' as [nvarchar](2))
		  ,koulutusluokitus = '001101'
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'
	      
	      ,opksu = NULL
	      ,opkru = NULL
	      ,opksaa = NULL
	      ,opkmuu = NULL

      ,ov1 = NULL
      ,ov2 = NULL
      ,ov3 = NULL
      ,ov4 = NULL
      ,ov5 = NULL
      ,ov6 = NULL
      ,ov7 = NULL
      ,ov8 = NULL
      ,ov9 = NULL
      ,ov10 = NULL
      ,aloittaneet = NULL
      ,opiskelijat = (CAST(ove AS int) - CAST(oven AS int))
      ,tutkinnot = NULL
      ,ovy = NULL
      ,tod = NULL
	  ,ilmtod = NULL
	  ,kelaim = NULL
      ,tutkt = NULL
      ,suor10 = NULL
      ,opiskelijat_1_9_luokka = NULL
      ,opiskelijat_1_10_luokka = NULL
      ,tutkinnot_9_luokka = NULL
	  ,luok1 = NULL
      ,luok2 = NULL
      ,luok3 = NULL
      ,luok4 = NULL
      ,luok5 = NULL
      ,luok6 = NULL
      ,luok7 = NULL
      ,luok8 = NULL
      ,luok9 = NULL

      ,CAST(ove AS int) - CAST(oven AS int) AS [ove]
FROM VipunenTK_DW.dbo.f_R2_22_Oppilaitostason_oppil_ja_opisk
--WHERE tilv > isnull((select MAX(tilastointivuosi) from vipunen_tk.[f_2_1_Peruskoulutiedosto]),'1900')


UNION ALL
--Aineisto 2.22
--OSA 5 naiset-esi
SELECT
		  [tilv] AS [tilastointivuosi] --tilv
		  ,[tilv_date]
		  ,[tietolahde]
		  ,[rivinumero]
		  ,sukupuoli=Cast('2' as [nvarchar](2))
		  ,koulutusluokitus = '001101'		  
		  ,[aidinkielikoodi]='99'
		  ,[aidinkieli_versio1koodi]='-1'
		  ,[oppilaitoskoodi]=[tunn]
		  ,koulutuksen_jarjestajakoodi=jarj -- tämäkin on turha, se sadan tunn-kentän kautta
		  -- alla olevat saadaan tunn-kentän kautta oppilaitokselta
		  --,sijaintikuntakoodi
		  --,opetuskielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,koulutuksen_jarjestajan_kielikoodi
		  --,jarjestajan_sijaintikuntakoodi
		  --,oppilaitoksen_sijaintikuntakoodi
		  ,(case when tietolahde like '%2.1%' then '2.1' when tietolahde like '%2.22%' then '2.22' end) AS [aineisto]
		  ,koulutussektori='1'

	      ,opksu = NULL
	      ,opkru = NULL
	      ,opksaa = NULL
	      ,opkmuu = NULL
      ,ov1 = NULL
      ,ov2 = NULL
      ,ov3 = NULL
      ,ov4 = NULL
      ,ov5 = NULL
      ,ov6 = NULL
      ,ov7 = NULL
      ,ov8 = NULL
      ,ov9 = NULL
      ,ov10 = NULL
      ,aloittaneet = NULL
      ,opiskelijat = CAST(oven AS int)
      ,tutkinnot = NULL
      ,ovy = NULL
      ,tod = NULL
	  ,ilmtod = NULL
	  ,kelaim = NULL
      ,tutkt = NULL
      ,suor10 = NULL
      ,opiskelijat_1_9_luokka = NULL
      ,opiskelijat_1_10_luokka = NULL
      ,tutkinnot_9_luokka = NULL
	  ,luok1 = NULL
      ,luok2 = NULL
      ,luok3 = NULL
      ,luok4 = NULL
      ,luok5 = NULL
      ,luok6 = NULL
      ,luok7 = NULL
      ,luok8 = NULL
      ,luok9 = NULL 
      ,[oven] AS [ove]
     
FROM VipunenTK_DW.dbo.f_R2_22_Oppilaitostason_oppil_ja_opisk

) data
--WHERE data.tilastointivuosi > isnull((select MAX(tilastointivuosi) from vipunen_tk.[f_2_1_Peruskoulutiedosto]),'1900')

) f
LEFT JOIN VipunenTK..d_sukupuoli AS d1 ON d1.sukupuoli_koodi=f.sukupuoli AND f.tilv_date between d1.alkaa and d1.paattyy

LEFT JOIN VipunenTK..d_koulutussektori AS d2 ON d2.koulutussektori_koodi=f.koulutussektori AND f.tilv_date between d1.alkaa and d1.paattyy

LEFT JOIN VipunenTK..d_koulutusluokitus AS d3 ON d3.koulutusluokitus_avain=f.koulutusluokitus
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d3h ON d3h.koulutusluokitus_avain=f.koulutusluokitus AND f.tilv_date between d3h.alkaa and d3h.paattyy

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d5 ON d5.oppilaitos_avain=f.[oppilaitoskoodi]
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d5h ON d5h.oppilaitos_avain=f.[oppilaitoskoodi] AND f.tilv_date between d5h.alkaa and d5h.paattyy

LEFT JOIN VipunenTK..d_alueluokitus AS d6 ON d6.alueluokitus_avain=d5.sijaintikuntakoodi
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d6h ON d6h.alueluokitus_avain=d5.sijaintikuntakoodi AND f.tilv_date between d6h.alkaa and d6h.paattyy

LEFT JOIN VipunenTK..d_alueluokitus AS d7 ON d7.alueluokitus_avain=d5.koulutuksen_jarjestajan_ksijaintikuntakoodi
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d7h ON d7h.alueluokitus_avain=d5.koulutuksen_jarjestajan_ksijaintikuntakoodi AND f.tilv_date between d7h.alkaa and d7h.paattyy

LEFT JOIN VipunenTK..d_aineisto_OTV AS d8 ON d8.aineisto_koodi = f.aineisto AND f.tilv_date between d8.alkaa and d8.paattyy

LEFT JOIN VipunenTK..d_opetushallinnon_koulutus d9 ON d9.opetushallinnon_koulutus_koodi = 1



