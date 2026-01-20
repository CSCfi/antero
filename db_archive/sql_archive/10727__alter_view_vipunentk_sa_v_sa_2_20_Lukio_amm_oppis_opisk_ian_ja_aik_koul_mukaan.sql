USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]    Script Date: 25.3.2025 16.45.31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













ALTER VIEW [dbo].[v_sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] AS

SELECT
	[tilv]= cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = DATEFROMPARTS(tilv,1,1)
	,[lahde] = CAST(kaikkivuodet.lahde as nvarchar (2))
	,[oltyp] = CAST(kaikkivuodet.oltyp as nvarchar (2))
	,[koulk] = CAST(kaikkivuodet.koulk as nvarchar (6))
	,[koulk_opintoala] = CAST(kaikkivuodet.koulk_opintoala as nvarchar (6))
	,[koulk_koulutusala] = CAST(kaikkivuodet.koulk_koulutusala as nvarchar (6))
	,[koulk_koulutusaste] = CAST(kaikkivuodet.koulk_koulutusaste as nvarchar (6))
	,[koulk_koulutusala_taso2] = CAST(kaikkivuodet.koulk_koulutusala_taso2 as nvarchar (6))
	,[koulk_koulutusala_taso1] = CAST(kaikkivuodet.koulk_koulutusala_taso1 as nvarchar (6))
	,[koulk_koulutusaste_taso2] = CAST(kaikkivuodet.koulk_koulutusaste_taso2 as nvarchar (6))
	,[koulk_koulutusaste_taso1] = CAST(kaikkivuodet.koulk_koulutusaste_taso1 as nvarchar (6))
    ,[aikoul] = CAST(kaikkivuodet.aikoul as nvarchar (1))
    ,[tutktav] = CAST(kaikkivuodet.tutktav as nvarchar (1))
    ,[tutklaja] = CAST(kaikkivuodet.tutklaja as nvarchar (1))
    ,[halla] = CAST(
		case 
			--lukio
			when lahde < 30 then
				case
					when d1.maakunta_koodi = '21' then '3' --Muiden hallinnonalojen alainen koulutus
					else '1' --Opetushallinto, pl. työvoimakoulutus
				end
			--amm
			when ophal = '1' then '1'
			when ophal = '3' then '2' --Opetushallinto, työvoimakoulutus
			when ophal = '2'
				and tilv < 2021
				and (
					rahoitus = '10'
					or (
						d1.maakunta_koodi != '21'
						and d2.opintoala2002_koodi not in ('902','903','904') 
					)
				)
				then '2' --Opetushallinto, työvoimakoulutus
			when ophal = '2' then '3'
			else '-1'
		end
		as nvarchar(2)
	)
    ,[kkun]= CAST(kaikkivuodet.kkun as nvarchar (3))
    ,[rahoitus]= CAST(cast(kaikkivuodet.rahoitus as int) as nvarchar (2))
	,[tavoite]= CAST(cast(kaikkivuodet.tavoite as int) as nvarchar (1))
    ,[sp]= CAST(kaikkivuodet.sp as nvarchar (1))
    ,[aikielir1]= CAST(kaikkivuodet.aikielir1 as nvarchar (2))
    ,[alvv]= CAST(kaikkivuodet.alvv as nvarchar (4))
    ,[allk]= CAST(kaikkivuodet.allk as nvarchar (1))
    ,[olosyys]= CAST(kaikkivuodet.olosyys as nvarchar (1))
    ,[ylsivx]= CAST(kaikkivuodet.ylsivx as nvarchar (1))
    ,[peruskx]= CAST(kaikkivuodet.peruskx as nvarchar (1))
    ,[oalapex]= CAST(kaikkivuodet.oalapex as nvarchar (2))
    ,[oastepex]= CAST(kaikkivuodet.oastepex as nvarchar (1))
    ,[oalapeux]= CAST(kaikkivuodet.oalapeux as nvarchar (3))
    ,[oalapeux_koulutusala]= CAST(kaikkivuodet.oalapeux_koulutusala as nvarchar (3))
    ,[oastpeux]= CAST(kaikkivuodet.oastpeux  as nvarchar (2))
	,[iscfinarrow_pex] = CAST(kaikkivuodet.iscfinarrow_pex  as nvarchar (3))
	,[kaste_t2_pex] = CAST(kaikkivuodet.kaste_t2_pex  as nvarchar (2))
    ,[ammvupe]= CAST(kaikkivuodet.ammvupe as nvarchar (4))
    ,[nayttox]= CAST(kaikkivuodet.nayttox as nvarchar (1))
    ,[oppispex]= CAST(kaikkivuodet.oppispex as nvarchar (1))
    ,[lisakx]= CAST(kaikkivuodet.lisakx as nvarchar (1))
    ,[oalalix]= CAST(kaikkivuodet.oalalix as nvarchar (2))
    ,[oastelix]= CAST(kaikkivuodet.oastelix as nvarchar (1))
    ,[oalaliux]= CAST(kaikkivuodet.oalaliux as nvarchar (3))
    ,[oalaliux_koulutusala]= CAST(kaikkivuodet.oalaliux_koulutusala as nvarchar (3))
    ,[oastliux]= CAST(kaikkivuodet.oastliux as nvarchar (2))
	,[iscfinarrow_lix] = CAST(kaikkivuodet.iscfinarrow_lix  as nvarchar (3))
	,[kaste_t2_lix] = CAST(kaikkivuodet.kaste_t2_lix  as nvarchar (2))
    ,[ammvuli]= CAST(kaikkivuodet.ammvuli as nvarchar (4))
    ,[oppislix]= CAST(kaikkivuodet.oppislix as nvarchar (1))
    ,[alempikax]= CAST(kaikkivuodet.alempikax as nvarchar (1))
    ,[oalaakx]= CAST(kaikkivuodet.oalaakx as nvarchar (2))
    ,[oasteakx]= CAST(kaikkivuodet.oasteakx as nvarchar (1))
    ,[oalauakx]= CAST(kaikkivuodet.oalauakx as nvarchar (3))
    ,[oalauakx_koulutusala]= CAST(kaikkivuodet.oalauakx_koulutusala as nvarchar (3))
    ,[oasteuakx]= CAST(kaikkivuodet.oasteuakx as nvarchar (2))
	,[iscfinarrow_akx] = CAST(kaikkivuodet.iscfinarrow_akx  as nvarchar (3))
	,[kaste_t2_akx] = CAST(kaikkivuodet.kaste_t2_akx  as nvarchar (2))
    ,[svuosiak]= CAST(kaikkivuodet.svuosiak as nvarchar (4))
    ,[ylempikax]= CAST(kaikkivuodet.ylempikax as nvarchar (1))
    ,[oalaykx]= CAST(kaikkivuodet.oalaykx as nvarchar (2))
    ,[oasteykx]= CAST(kaikkivuodet.oasteykx as nvarchar (1))
    ,[oalauykx]= CAST(kaikkivuodet.oalauykx as nvarchar (3))
    ,[oalauykx_koulutusala]= CAST(kaikkivuodet.oalauykx_koulutusala as nvarchar (3))
    ,[oasteuykx]= CAST(kaikkivuodet.oasteuykx as nvarchar (2))
	,[iscfinarrow_ykx] = CAST(kaikkivuodet.iscfinarrow_ykx  as nvarchar (3))
	,[kaste_t2_ykx] = CAST(kaikkivuodet.kaste_t2_ykx  as nvarchar (2))
    ,[svuosiyk]= CAST(kaikkivuodet.svuosiyk as nvarchar (4))
    ,[askun]= CAST(kaikkivuodet.askun as nvarchar (3))
    ,[syntv]= CAST(nullif(kaikkivuodet.syntv, '   .') as nvarchar (4))
    ,[lkm]
   	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi   from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex]
      ,[oastepex]
      ,[oalapeux]
      ,[oalapeux_koulutusala] = LEFT ([oalapeux],1)
      ,[oastpeux]
	  ,[iscfinarrow_pex] = null
	  ,[kaste_t2_pex] = null
      ,[ammvupe]
      ,[nayttox]
      ,[oppispex]
      ,[lisakx]
      ,[oalalix]
      ,[oastelix]
      ,[oalaliux]
      ,[oalaliux_koulutusala] = LEFT([oalaliux],1)
      ,[oastliux]
	  ,[iscfinarrow_lix] = null
	  ,[kaste_t2_lix] = null
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx]
      ,[oasteakx]
      ,[oalauakx]
       ,[oalauakx_koulutusala] = left([oalauakx],1)
      ,[oasteuakx]
	  ,[iscfinarrow_akx] = null
	  ,[kaste_t2_akx] = null
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx]
      ,[oasteykx]
      ,[oalauykx]
      ,[oalauykx_koulutusala] = left([oalauykx],1)
      ,[oasteuykx]
	  ,[iscfinarrow_ykx] = null
	  ,[kaste_t2_ykx] = null
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_20_sopv_13]
  UNION ALL
  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi   from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex]
      ,[oastepex]
      ,[oalapeux]
      ,[oalapeux_koulutusala] = LEFT ([oalapeux],1)
      ,[oastpeux]
	  ,[iscfinarrow_pex] = null
	  ,[kaste_t2_pex] = null
      ,[ammvupe]
      ,[nayttox]
      ,[oppispex]
      ,[lisakx]
      ,[oalalix]
      ,[oastelix]
      ,[oalaliux]
      ,[oalaliux_koulutusala] = LEFT([oalaliux],1)
      ,[oastliux]
	  ,[iscfinarrow_lix] = null
	  ,[kaste_t2_lix] = null
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx]
      ,[oasteakx]
      ,[oalauakx]
       ,[oalauakx_koulutusala] = left([oalauakx],1)
      ,[oasteuakx]
	  ,[iscfinarrow_akx] = null
	  ,[kaste_t2_akx] = null
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx]
      ,[oasteykx]
      ,[oalauykx]
      ,[oalauykx_koulutusala] = left([oalauykx],1)
      ,[oasteuykx]
	  ,[iscfinarrow_ykx] = null
	  ,[kaste_t2_ykx] = null
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_20_sopv_14]
   UNION ALL
  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi   from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex]
      ,[oastepex]
      ,[oalapeux]
      ,[oalapeux_koulutusala] = LEFT ([oalapeux],1)
      ,[oastpeux]
	  ,[iscfinarrow_pex] = null
	  ,[kaste_t2_pex] = null
      ,[ammvupe]
      ,[nayttox]
      ,[oppispex]
      ,[lisakx]
      ,[oalalix]
      ,[oastelix]
      ,[oalaliux]
      ,[oalaliux_koulutusala] = LEFT([oalaliux],1)
      ,[oastliux]
	  ,[iscfinarrow_lix] = null
	  ,[kaste_t2_lix] = null
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx]
      ,[oasteakx]
      ,[oalauakx]
       ,[oalauakx_koulutusala] = left([oalauakx],1)
      ,[oasteuakx]
	  ,[iscfinarrow_akx] = null
	  ,[kaste_t2_akx] = null
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx]
      ,[oasteykx]
      ,[oalauykx]
      ,[oalauykx_koulutusala] = left([oalauykx],1)
      ,[oasteuykx]
	  ,[iscfinarrow_ykx] = null
	  ,[kaste_t2_ykx] = null
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_20_sopv_15]
   UNION ALL
  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi   from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex]
      ,[oastepex]
      ,[oalapeux]
      ,[oalapeux_koulutusala] = LEFT ([oalapeux],1)
      ,[oastpeux]
	  ,[iscfinarrow_pex] = null
	  ,[kaste_t2_pex] = null
      ,[ammvupe]
      ,[nayttox]
      ,[oppispex]
      ,[lisakx]
      ,[oalalix]
      ,[oastelix]
      ,[oalaliux]
      ,[oalaliux_koulutusala] = LEFT([oalaliux],1)
      ,[oastliux]
	  ,[iscfinarrow_lix] = null
	  ,[kaste_t2_lix] = null
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx]
      ,[oasteakx]
      ,[oalauakx]
       ,[oalauakx_koulutusala] = left([oalauakx],1)
      ,[oasteuakx]
	  ,[iscfinarrow_akx] = null
	  ,[kaste_t2_akx] = null
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx]
      ,[oasteykx]
      ,[oalauykx]
      ,[oalauykx_koulutusala] = left([oalauykx],1)
      ,[oasteuykx]
	  ,[iscfinarrow_ykx] = null
	  ,[kaste_t2_ykx] = null
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_20_sopv_16]
   UNION ALL
  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi   from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex]
      ,[oastepex]
      ,[oalapeux]
      ,[oalapeux_koulutusala] = LEFT ([oalapeux],1)
      ,[oastpeux]
	  ,[iscfinarrow_pex] = null
	  ,[kaste_t2_pex] = null
      ,[ammvupe]
      ,[nayttox]
      ,[oppispex]
      ,[lisakx]
      ,[oalalix]
      ,[oastelix]
      ,[oalaliux]
      ,[oalaliux_koulutusala] = LEFT([oalaliux],1)
      ,[oastliux]
	  ,[iscfinarrow_lix] = null
	  ,[kaste_t2_lix] = null
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx]
      ,[oasteakx]
      ,[oalauakx]
       ,[oalauakx_koulutusala] = left([oalauakx],1)
      ,[oasteuakx]
	  ,[iscfinarrow_akx] = null
	  ,[kaste_t2_akx] = null
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx]
      ,[oasteykx]
      ,[oalauykx]
      ,[oalauykx_koulutusala] = left([oalauykx],1)
      ,[oasteuykx]
	  ,[iscfinarrow_ykx] = null
	  ,[kaste_t2_ykx] = null
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_20_sopv_17]

UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi   from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex] = NULL
      ,[oastepex] = NULL
      ,[oalapeux] = NULL
      ,[oalapeux_koulutusala] = NULL
      ,[oastpeux] = NULL
	  ,[iscfinarrow_pex]
	  ,[kaste_t2_pex]
      ,[ammvupe]
      ,[nayttox]
      ,[oppispex]
      ,[lisakx]
      ,[oalalix] = NULL
      ,[oastelix] = NULL
      ,[oalaliux] = NULL
      ,[oalaliux_koulutusala] = NULL
      ,[oastliux] = NULL
	  ,[iscfinarrow_lix]
	  ,[kaste_t2_lix]
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx] = NULL
      ,[oasteakx] = NULL
      ,[oalauakx] = NULL
      ,[oalauakx_koulutusala] = NULL
      ,[oasteuakx] = NULL
	  ,[iscfinarrow_akx]
	  ,[kaste_t2_akx]
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx] = NULL
      ,[oasteykx] = NULL
      ,[oalauykx] = NULL
      ,[oalauykx_koulutusala] = NULL
      ,[oasteuykx] = NULL
	  ,[iscfinarrow_ykx]
	  ,[kaste_t2_ykx]
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_20_sopv_18]

UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi   from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav]
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex] = NULL
      ,[oastepex] = NULL
      ,[oalapeux] = NULL
      ,[oalapeux_koulutusala] = NULL
      ,[oastpeux] = NULL
	  ,[iscfinarrow_pex]
	  ,[kaste_t2_pex]
      ,[ammvupe]
      ,[nayttox]
      ,[oppispex]
      ,[lisakx]
      ,[oalalix] = NULL
      ,[oastelix] = NULL
      ,[oalaliux] = NULL
      ,[oalaliux_koulutusala] = NULL
      ,[oastliux] = NULL
	  ,[iscfinarrow_lix]
	  ,[kaste_t2_lix]
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx] = NULL
      ,[oasteakx] = NULL
      ,[oalauakx] = NULL
      ,[oalauakx_koulutusala] = NULL
      ,[oasteuakx] = NULL
	  ,[iscfinarrow_akx]
	  ,[kaste_t2_akx]
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx] = NULL
      ,[oasteykx] = NULL
      ,[oalauykx] = NULL
      ,[oalauykx_koulutusala] = NULL
      ,[oasteuykx] = NULL
	  ,[iscfinarrow_ykx]
	  ,[kaste_t2_ykx]
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_20_sopv_19]

UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi   from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex] = NULL
      ,[oastepex] = NULL
      ,[oalapeux] = NULL
      ,[oalapeux_koulutusala] = NULL
      ,[oastpeux] = NULL
	  ,[iscfinarrow_pex]
	  ,[kaste_t2_pex]
      ,[ammvupe]
      ,[nayttox] = NULL
      ,[oppispex]
      ,[lisakx]
      ,[oalalix] = NULL
      ,[oastelix] = NULL
      ,[oalaliux] = NULL
      ,[oalaliux_koulutusala] = NULL
      ,[oastliux] = NULL
	  ,[iscfinarrow_lix]
	  ,[kaste_t2_lix]
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx] = NULL
      ,[oasteakx] = NULL
      ,[oalauakx] = NULL
      ,[oalauakx_koulutusala] = NULL
      ,[oasteuakx] = NULL
	  ,[iscfinarrow_akx]
	  ,[kaste_t2_akx]
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx] = NULL
      ,[oasteykx] = NULL
      ,[oalauykx] = NULL
      ,[oalauykx_koulutusala] = NULL
      ,[oasteuykx] = NULL
	  ,[iscfinarrow_ykx]
	  ,[kaste_t2_ykx]
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_20_sopv_20]

UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi	from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi  from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex] = NULL
      ,[oastepex] = NULL
      ,[oalapeux] = NULL
      ,[oalapeux_koulutusala] = NULL
      ,[oastpeux] = NULL
	  ,[iscfinarrow_pex]
	  ,[kaste_t2_pex]
      ,[ammvupe]
      ,[nayttox] = NULL
      ,[oppispex]
      ,[lisakx]
      ,[oalalix] = NULL
      ,[oastelix] = NULL
      ,[oalaliux] = NULL
      ,[oalaliux_koulutusala] = NULL
      ,[oastliux] = NULL
	  ,[iscfinarrow_lix]
	  ,[kaste_t2_lix]
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx] = NULL
      ,[oasteakx] = NULL
      ,[oalauakx] = NULL
      ,[oalauakx_koulutusala] = NULL
      ,[oasteuakx] = NULL
	  ,[iscfinarrow_akx]
	  ,[kaste_t2_akx]
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx] = NULL
      ,[oasteykx] = NULL
      ,[oalauykx] = NULL
      ,[oalauykx_koulutusala] = NULL
      ,[oasteuykx] = NULL
	  ,[iscfinarrow_ykx]
	  ,[kaste_t2_ykx]
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_20_sopv_21]

UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi	from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi  from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex] = NULL
      ,[oastepex] = NULL
      ,[oalapeux] = NULL
      ,[oalapeux_koulutusala] = NULL
      ,[oastpeux] = NULL
	  ,[iscfinarrow_pex]
	  ,[kaste_t2_pex]
      ,[ammvupe]
      ,[nayttox] = NULL
      ,[oppispex]
      ,[lisakx]
      ,[oalalix] = NULL
      ,[oastelix] = NULL
      ,[oalaliux] = NULL
      ,[oalaliux_koulutusala] = NULL
      ,[oastliux] = NULL
	  ,[iscfinarrow_lix]
	  ,[kaste_t2_lix]
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx] = NULL
      ,[oasteakx] = NULL
      ,[oalauakx] = NULL
      ,[oalauakx_koulutusala] = NULL
      ,[oasteuakx] = NULL
	  ,[iscfinarrow_akx]
	  ,[kaste_t2_akx]
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx] = NULL
      ,[oasteykx] = NULL
      ,[oalauykx] = NULL
      ,[oalauykx_koulutusala] = NULL
      ,[oasteuykx] = NULL
	  ,[iscfinarrow_ykx]
	  ,[kaste_t2_ykx]
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_20_sopv_22]

UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi	from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi  from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex] = NULL
      ,[oastepex] = NULL
      ,[oalapeux] = NULL
      ,[oalapeux_koulutusala] = NULL
      ,[oastpeux] = NULL
	  ,[iscfinarrow_pex]
	  ,[kaste_t2_pex]
      ,[ammvupe]
      ,[nayttox] = NULL
      ,[oppispex]
      ,[lisakx]
      ,[oalalix] = NULL
      ,[oastelix] = NULL
      ,[oalaliux] = NULL
      ,[oalaliux_koulutusala] = NULL
      ,[oastliux] = NULL
	  ,[iscfinarrow_lix]
	  ,[kaste_t2_lix]
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx] = NULL
      ,[oasteakx] = NULL
      ,[oalauakx] = NULL
      ,[oalauakx_koulutusala] = NULL
      ,[oasteuakx] = NULL
	  ,[iscfinarrow_akx]
	  ,[kaste_t2_akx]
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx] = NULL
      ,[oasteykx] = NULL
      ,[oalauykx] = NULL
      ,[oalauykx_koulutusala] = NULL
      ,[oasteuykx] = NULL
	  ,[iscfinarrow_ykx]
	  ,[kaste_t2_ykx]
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_20_sopv_23]

UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi	from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi  from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite] = null
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex] = NULL
      ,[oastepex] = NULL
      ,[oalapeux] = NULL
      ,[oalapeux_koulutusala] = NULL
      ,[oastpeux] = NULL
	  ,[iscfinarrow_pex]
	  ,[kaste_t2_pex]
      ,[ammvupe]
      ,[nayttox] = NULL
      ,[oppispex]
      ,[lisakx]
      ,[oalalix] = NULL
      ,[oastelix] = NULL
      ,[oalaliux] = NULL
      ,[oalaliux_koulutusala] = NULL
      ,[oastliux] = NULL
	  ,[iscfinarrow_lix]
	  ,[kaste_t2_lix]
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx] = NULL
      ,[oasteakx] = NULL
      ,[oalauakx] = NULL
      ,[oalauakx_koulutusala] = NULL
      ,[oasteuakx] = NULL
	  ,[iscfinarrow_akx]
	  ,[kaste_t2_akx]
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx] = NULL
      ,[oasteykx] = NULL
      ,[oalauykx] = NULL
      ,[oalauykx_koulutusala] = NULL
      ,[oasteuykx] = NULL
	  ,[iscfinarrow_ykx]
	  ,[kaste_t2_ykx]
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_20_sopv_24]

/***  
UNION ALL

  SELECT [tilv]
      ,[lahde]
      ,[oltyp]
      ,[koulk]
      ,[koulk_opintoala]			=	(select top 1 opintoala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusala]			=	(select top 1 koulutusala2002_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[koulk_koulutusaste]			=	(select top 1 koulutusaste2002_koodi	from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso2]	=	(select top 1 iscfinarrow2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala_taso1]	=	(select top 1 iscfibroad2013_koodi		from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso2]	=	(select top 1 Koulutusaste_taso2_koodi  from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste_taso1]	=	(select top 1 iscle2011_koodi			from [VipunenTK].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[aikoul]
      ,[tutktav] = NULL
      ,[tutklaja]
      ,[ophal]
      ,[kkun]
      ,[rahoitus]
	  ,[tavoite]
      ,[sp]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[olosyys]
      ,[ylsivx]
      ,[peruskx]
      ,[oalapex] = NULL
      ,[oastepex] = NULL
      ,[oalapeux] = NULL
      ,[oalapeux_koulutusala] = NULL
      ,[oastpeux] = NULL
	  ,[iscfinarrow_pex]
	  ,[kaste_t2_pex]
      ,[ammvupe]
      ,[nayttox] = NULL
      ,[oppispex]
      ,[lisakx]
      ,[oalalix] = NULL
      ,[oastelix] = NULL
      ,[oalaliux] = NULL
      ,[oalaliux_koulutusala] = NULL
      ,[oastliux] = NULL
	  ,[iscfinarrow_lix]
	  ,[kaste_t2_lix]
      ,[ammvuli]
      ,[oppislix]
      ,[alempikax]
      ,[oalaakx] = NULL
      ,[oasteakx] = NULL
      ,[oalauakx] = NULL
      ,[oalauakx_koulutusala] = NULL
      ,[oasteuakx] = NULL
	  ,[iscfinarrow_akx]
	  ,[kaste_t2_akx]
      ,[svuosiak]
      ,[ylempikax]
      ,[oalaykx] = NULL
      ,[oasteykx] = NULL
      ,[oalauykx] = NULL
      ,[oalauykx_koulutusala] = NULL
      ,[oasteuykx] = NULL
	  ,[iscfinarrow_ykx]
	  ,[kaste_t2_ykx]
      ,[svuosiyk]
      ,[askun]
      ,[syntv]
      ,[lkm]
      ,[tietolahde]='TK_2_20_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_20_sopv_25]
  WHERE lahde != '91'
  ***/

) as kaikkivuodet
--halla
left join VipunenTK.dbo.d_alueluokitus d1 on d1.alueluokitus_avain = kaikkivuodet.kkun
left join VipunenTK.dbo.d_koulutusluokitus d2 on d2.koulutusluokitus_avain = kaikkivuodet.koulk

GO


