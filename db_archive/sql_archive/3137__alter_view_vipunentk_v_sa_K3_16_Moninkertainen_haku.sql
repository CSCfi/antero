USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K3_16_Moninkertainen_haku]    Script Date: 15.6.2020 23:58:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













ALTER VIEW [dbo].[v_sa_K3_16_Moninkertainen_haku] AS

-- truncate table vipunentk_dw.dbo.sa_K3_16_Moninkertainen_haku
-- insert into vipunentk_dw.dbo.sa_K3_16_Moninkertainen_haku select * from [VipunenTK_SA].dbo.v_sa_K3_16_Moninkertainen_haku

-- Drop table vipunentk_dw.dbo.sa_K3_16_Moninkertainen_haku
-- Select * into vipunentk_dw.dbo.sa_K3_16_Moninkertainen_haku from [VipunenTK_SA].dbo.v_sa_K3_16_Moninkertainen_haku

SELECT [tilv]
	  ,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2]
	  ,[luammhaku2_kaste_t2] 
	  ,[luammhaku3_kaste_t2] 
	  ,[luammhaku4_kaste_t2] 
	  ,[luammhaku5_kaste_t2]
	  ,[luammhaku1_iscfibroad2013] 
	  ,[luammhaku2_iscfibroad2013] 
	  ,[luammhaku3_iscfibroad2013] 
	  ,[luammhaku4_iscfibroad2013] 
	  ,[luammhaku5_iscfibroad2013] 
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv] = Case when luammhaku1_hyv='1' then 'K' when luammhaku1_hyv='2' then 'E' else NULL end
      ,[luammhaku2_hyv] = Case when luammhaku2_hyv='1' then 'K' when luammhaku2_hyv='2' then 'E' else NULL end
      ,[luammhaku3_hyv] = Case when luammhaku3_hyv='1' then 'K' when luammhaku3_hyv='2' then 'E' else NULL end
      ,[luammhaku4_hyv] = Case when luammhaku4_hyv='1' then 'K' when luammhaku4_hyv='2' then 'E' else NULL end
      ,[luammhaku5_hyv] = Case when luammhaku5_hyv='1' then 'K' when luammhaku5_hyv='2' then 'E' else NULL end
      ,[luammhaku1_vastotto] = Case when luammhaku1_vastotto='1' then 'K' when luammhaku1_vastotto='2' then 'E' else NULL end
      ,[luammhaku2_vastotto] = Case when luammhaku2_vastotto='1' then 'K' when luammhaku2_vastotto='2' then 'E' else NULL end
      ,[luammhaku3_vastotto] = Case when luammhaku3_vastotto='1' then 'K' when luammhaku3_vastotto='2' then 'E' else NULL end
      ,[luammhaku4_vastotto] = Case when luammhaku4_vastotto='1' then 'K' when luammhaku4_vastotto='2' then 'E' else NULL end
      ,[luammhaku5_vastotto] = Case when luammhaku5_vastotto='1' then 'K' when luammhaku5_vastotto='2' then 'E' else NULL end
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn]
	  ,[amkhaku5_tunn]
	  ,[amkhaku6_tunn]
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast]
	  ,[amkhaku5_opmast]
	  ,[amkhaku6_opmast]
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa]
	  ,[amkhaku5_opmopa]
	  ,[amkhaku6_opmopa]
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa]
	  ,[amkhaku5_opm95opa]
	  ,[amkhaku6_opm95opa]
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli]
	  ,[amkhaku5_okieli]
	  ,[amkhaku6_okieli]
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv] = Case when amkhaku1_hyv='1' then 'K' when amkhaku1_hyv='2' then 'E' else NULL end
      ,[amkhaku2_hyv] = Case when amkhaku2_hyv='1' then 'K' when amkhaku2_hyv='2' then 'E' else NULL end
      ,[amkhaku3_hyv] = Case when amkhaku3_hyv='1' then 'K' when amkhaku3_hyv='2' then 'E' else NULL end
      ,[amkhaku4_hyv] = Case when amkhaku4_hyv='1' then 'K' when amkhaku4_hyv='2' then 'E' else NULL end
	  ,[amkhaku5_hyv] = Case when amkhaku5_hyv='1' then 'K' when amkhaku5_hyv='2' then 'E' else NULL end
	  ,[amkhaku6_hyv] = Case when amkhaku6_hyv='1' then 'K' when amkhaku6_hyv='2' then 'E' else NULL end
      ,[amkhakum_hyv] = Case when amkhakum_hyv='1' then 'K' when amkhakum_hyv='2' then 'E' else NULL end
      ,[amkhaku1_vastotto] = Case when amkhaku1_vastotto='1' then 'K' when amkhaku1_vastotto='2' then 'E' else NULL end
      ,[amkhaku2_vastotto] = Case when amkhaku2_vastotto='1' then 'K' when amkhaku2_vastotto='2' then 'E' else NULL end
      ,[amkhaku3_vastotto] = Case when amkhaku3_vastotto='1' then 'K' when amkhaku3_vastotto='2' then 'E' else NULL end
      ,[amkhaku4_vastotto] = Case when amkhaku4_vastotto='1' then 'K' when amkhaku4_vastotto='2' then 'E' else NULL end
	  ,[amkhaku5_vastotto] = Case when amkhaku5_vastotto='1' then 'K' when amkhaku5_vastotto='2' then 'E' else NULL end
	  ,[amkhaku6_vastotto] = Case when amkhaku6_vastotto='1' then 'K' when amkhaku6_vastotto='2' then 'E' else NULL end
      ,[amkhakum_vastotto] = Case when amkhakum_vastotto='1' then 'K' when amkhakum_vastotto='2' then 'E' else NULL end
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv] = Case when yohakua_hyv='1' then 'K' when yohakua_hyv='2' then 'E' else NULL end
      ,[yohakub_hyv] = Case when yohakub_hyv='1' then 'K' when yohakub_hyv='2' then 'E' else NULL end
      ,[yohakuc_hyv] = Case when yohakuc_hyv='1' then 'K' when yohakuc_hyv='2' then 'E' else NULL end
      ,[yohakud_hyv] = Case when yohakud_hyv='1' then 'K' when yohakud_hyv='2' then 'E' else NULL end
      ,[yohakue_hyv] = Case when yohakue_hyv='1' then 'K' when yohakue_hyv='2' then 'E' else NULL end
      ,[yohakuf_hyv] = Case when yohakuf_hyv='1' then 'K' when yohakuf_hyv='2' then 'E' else NULL end
      ,[yohakug_hyv] = Case when yohakug_hyv='1' then 'K' when yohakug_hyv='2' then 'E' else NULL end
      ,[yohakuh_hyv] = Case when yohakuh_hyv='1' then 'K' when yohakuh_hyv='2' then 'E' else NULL end
      ,[yohakui_hyv] = Case when yohakui_hyv='1' then 'K' when yohakui_hyv='2' then 'E' else NULL end
      ,[yohakua_vastotto] = Case when yohakua_vastotto='1' then 'K' when yohakua_vastotto='2' then 'E' else NULL end
      ,[yohakub_vastotto] = Case when yohakub_vastotto='1' then 'K' when yohakub_vastotto='2' then 'E' else NULL end
      ,[yohakuc_vastotto] = Case when yohakuc_vastotto='1' then 'K' when yohakuc_vastotto='2' then 'E' else NULL end
      ,[yohakud_vastotto] = Case when yohakud_vastotto='1' then 'K' when yohakud_vastotto='2' then 'E' else NULL end
      ,[yohakue_vastotto] = Case when yohakue_vastotto='1' then 'K' when yohakue_vastotto='2' then 'E' else NULL end
      ,[yohakuf_vastotto] = Case when yohakuf_vastotto='1' then 'K' when yohakuf_vastotto='2' then 'E' else NULL end
      ,[yohakug_vastotto] = Case when yohakug_vastotto='1' then 'K' when yohakug_vastotto='2' then 'E' else NULL end
      ,[yohakuh_vastotto] = Case when yohakuh_vastotto='1' then 'K' when yohakuh_vastotto='2' then 'E' else NULL end
      ,[yohakui_vastotto] = Case when yohakui_vastotto='1' then 'K' when yohakui_vastotto='2' then 'E' else NULL end
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2]
	  ,[kkhaku2_kaste_t2] 
	  ,[kkhaku3_kaste_t2]
	  ,[kkhaku4_kaste_t2] 
	  ,[kkhaku5_kaste_t2] 
	  ,[kkhaku6_kaste_t2] 
	  ,[kkhaku1_iscfibroad2013] 
	  ,[kkhaku2_iscfibroad2013] 
	  ,[kkhaku3_iscfibroad2013] 
	  ,[kkhaku4_iscfibroad2013] 
	  ,[kkhaku5_iscfibroad2013] 
	  ,[kkhaku6_iscfibroad2013]
      ,[luhakux] = Case when luhakux='1' then 'K' when luhakux='2' then 'E' else NULL end
      ,[luhaku2x] = Case when luhaku2x='1' then 'K' when luhaku2x='2' then 'E' else NULL end
      ,[luhaku3x] = Case when luhaku3x='1' then 'K' when luhaku3x='2' then 'E' else NULL end
      ,[ammhakux] = Case when ammhakux='1' then 'K' when ammhakux='2' then 'E' else NULL end
      ,[ammhaku2x] = Case when ammhaku2x='1' then 'K' when ammhaku2x='2' then 'E' else NULL end
      ,[ammhaku3x] = Case when ammhaku3x='1' then 'K' when ammhaku3x='2' then 'E' else NULL end
      ,[amkhakux] = Case when amkhakux='1' then 'K' when amkhakux='2' then 'E' else NULL end
      ,[amkhaku2x] = Case when amkhaku2x='1' then 'K' when amkhaku2x='2' then 'E' else NULL end
      ,[amkhaku3x] = Case when amkhaku3x='1' then 'K' when amkhaku3x='2' then 'E' else NULL end
      ,[yohakux] = Case when yohakux='1' then 'K' when yohakux='2' then 'E' else NULL end
      ,[yohaku2x] = Case when yohaku2x='1' then 'K' when yohaku2x='2' then 'E' else NULL end
      ,[yohaku3x] = Case when yohaku3x='1' then 'K' when yohaku3x='2' then 'E' else NULL end
      ,[sp]
      ,[aikielir1]
      ,[syntv] = Case when syntv='9999' then '' else syntv end
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk] = Case when aikyotutk='1' then 'K' when aikyotutk='0' then 'E' else 'E' end
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm] = Case when aikamm='1' then 'K' when aikamm='0' then 'E' else 'E' end
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk] = Case when aikamk='1' then 'K' when aikamk='0' then 'E' else 'E' end
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk] = Case when aikylamk='1' then 'K' when aikylamk='0' then 'E' else 'E' end
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk] = Case when aikalkk='1' then 'K' when aikalkk='0' then 'E' else 'E' end
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk] = Case when aikylkk='1' then 'K' when aikylkk='0' then 'E' else 'E' end
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri] = Case when aiklistri='1' then 'K' when aiklistri='0' then 'E' else 'E' end
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx] = Case when [yotutkopisx]='1' then 'K' when [yotutkopisx]='0' then 'E' else 'E' end
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx] = Case when [ammopisx]='1' then 'K' when [ammopisx]='0' then 'E' else 'E' end
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1] = Case when [amkopisx1]='1' then 'K' when [amkopisx1]='0' then 'E' else 'E' end
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2] = Case when [amkopisx2]='1' then 'K' when [amkopisx2]='0' then 'E' else 'E' end
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3] = Case when [amkopisx3]='1' then 'K' when [amkopisx3]='0' then 'E' else 'E' end
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1] = Case when [yoopisx1]='1' then 'K' when [yoopisx1]='0' then 'E' else 'E' end
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2] = Case when [yoopisx2]='1' then 'K' when [yoopisx2]='0' then 'E' else 'E' end
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3] = Case when [yoopisx3]='1' then 'K' when [yoopisx3]='0' then 'E' else 'E' end
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok] = Case when [htok]='1' then 'K' when [htok]='2' then 'E' else NULL end
      ,[lkm]
      ,[tietolahde]
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM (
  
SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]='TK_K3_16_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_12]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]='TK_K3_16_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_13]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]='TK_K3_16_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_14]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]='TK_K3_16_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_15]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]='TK_K3_16_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_16]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn] = case when kkhaku1_opmast in (62,71) then kkhaku1_tunn else null end
      ,[amkhaku2_tunn] = case when kkhaku2_opmast in (62,71) then kkhaku2_tunn else null end
      ,[amkhaku3_tunn] = case when kkhaku3_opmast in (62,71) then kkhaku3_tunn else null end
      ,[amkhaku4_tunn] = case when kkhaku4_opmast in (62,71) then kkhaku4_tunn else null end
	  ,[amkhaku5_tunn] = case when kkhaku5_opmast in (62,71) then kkhaku5_tunn else null end
	  ,[amkhaku6_tunn] = case when kkhaku6_opmast in (62,71) then kkhaku6_tunn else null end
      ,[amkhakum_tunn] =null
      ,[amkhaku1_opmast] = case when kkhaku1_opmast in (62,71) then kkhaku1_opmast else null end
      ,[amkhaku2_opmast] = case when kkhaku2_opmast in (62,71) then kkhaku2_opmast else null end
      ,[amkhaku3_opmast] = case when kkhaku3_opmast in (62,71) then kkhaku3_opmast else null end
      ,[amkhaku4_opmast] = case when kkhaku4_opmast in (62,71) then kkhaku4_opmast else null end
	  ,[amkhaku5_opmast] = case when kkhaku5_opmast in (62,71) then kkhaku5_opmast else null end
	  ,[amkhaku6_opmast] = case when kkhaku6_opmast in (62,71) then kkhaku6_opmast else null end
      ,[amkhakum_opmast] = null
      ,[amkhaku1_opmopa] = case when kkhaku1_opmast in (62,71) then kkhaku1_opmopa else null end
      ,[amkhaku2_opmopa] = case when kkhaku2_opmast in (62,71) then kkhaku2_opmopa else null end
      ,[amkhaku3_opmopa] = case when kkhaku3_opmast in (62,71) then kkhaku3_opmopa else null end
      ,[amkhaku4_opmopa] = case when kkhaku4_opmast in (62,71) then kkhaku4_opmopa else null end
	  ,[amkhaku5_opmopa] = case when kkhaku5_opmast in (62,71) then kkhaku5_opmopa else null end
	  ,[amkhaku6_opmopa] = case when kkhaku6_opmast in (62,71) then kkhaku6_opmopa else null end
      ,[amkhakum_opmopa] = null
      ,[amkhaku1_opm95opa] = case when kkhaku1_opmast in (62,71) then kkhaku1_opm95opa else null end
      ,[amkhaku2_opm95opa] = case when kkhaku2_opmast in (62,71) then kkhaku2_opm95opa else null end
      ,[amkhaku3_opm95opa] = case when kkhaku3_opmast in (62,71) then kkhaku3_opm95opa else null end
      ,[amkhaku4_opm95opa] = case when kkhaku4_opmast in (62,71) then kkhaku4_opm95opa else null end
	  ,[amkhaku5_opm95opa] = case when kkhaku5_opmast in (62,71) then kkhaku5_opm95opa else null end
	  ,[amkhaku6_opm95opa] = case when kkhaku6_opmast in (62,71) then kkhaku6_opm95opa else null end
      ,[amkhakum_opm95opa] = null
      ,[amkhaku1_koultyp] = null
      ,[amkhaku2_koultyp] = null
      ,[amkhaku3_koultyp] = null
      ,[amkhaku4_koultyp] = null
      ,[amkhakum_koultyp] = null
      ,[amkhaku1_okieli] = case when kkhaku1_opmast in (62,71) then kkhaku1_okieli else null end
      ,[amkhaku2_okieli] = case when kkhaku2_opmast in (62,71) then kkhaku2_okieli else null end
      ,[amkhaku3_okieli] = case when kkhaku3_opmast in (62,71) then kkhaku3_okieli else null end
      ,[amkhaku4_okieli] = case when kkhaku4_opmast in (62,71) then kkhaku4_okieli else null end
	  ,[amkhaku5_okieli] = case when kkhaku5_opmast in (62,71) then kkhaku5_okieli else null end
	  ,[amkhaku6_okieli] = case when kkhaku6_opmast in (62,71) then kkhaku6_okieli else null end
      ,[amkhakum_okieli] = null
      ,[amkhaku1_hyv] = case when kkhaku1_opmast in (62,71) then kkhaku1_hyv else null end
      ,[amkhaku2_hyv] = case when kkhaku2_opmast in (62,71) then kkhaku2_hyv else null end
      ,[amkhaku3_hyv] = case when kkhaku3_opmast in (62,71) then kkhaku3_hyv else null end
      ,[amkhaku4_hyv] = case when kkhaku4_opmast in (62,71) then kkhaku4_hyv else null end
	  ,[amkhaku5_hyv] = case when kkhaku5_opmast in (62,71) then kkhaku5_hyv else null end
	  ,[amkhaku6_hyv] = case when kkhaku6_opmast in (62,71) then kkhaku6_hyv else null end
      ,[amkhakum_hyv] = null
      ,[amkhaku1_vastotto] = case when kkhaku1_opmast in (62,71) then kkhaku1_vastotto else null end
      ,[amkhaku2_vastotto] = case when kkhaku2_opmast in (62,71) then kkhaku2_vastotto else null end
      ,[amkhaku3_vastotto] = case when kkhaku3_opmast in (62,71) then kkhaku3_vastotto else null end
      ,[amkhaku4_vastotto] = case when kkhaku4_opmast in (62,71) then kkhaku4_vastotto else null end
	  ,[amkhaku5_vastotto] = case when kkhaku5_opmast in (62,71) then kkhaku5_vastotto else null end
	  ,[amkhaku6_vastotto] = case when kkhaku6_opmast in (62,71) then kkhaku6_vastotto else null end
      ,[amkhakum_vastotto] = null
      ,[yohakua_tunn] = case when kkhaku1_opmast in (63,72) then kkhaku1_tunn else null end
      ,[yohakub_tunn] = case when kkhaku2_opmast in (63,72) then kkhaku2_tunn else null end
      ,[yohakuc_tunn] = case when kkhaku3_opmast in (63,72) then kkhaku3_tunn else null end
      ,[yohakud_tunn] = case when kkhaku4_opmast in (63,72) then kkhaku4_tunn else null end
      ,[yohakue_tunn] = case when kkhaku5_opmast in (63,72) then kkhaku5_tunn else null end
      ,[yohakuf_tunn] = case when kkhaku6_opmast in (63,72) then kkhaku6_tunn else null end
      ,[yohakug_tunn] = null
      ,[yohakuh_tunn] = null
      ,[yohakui_tunn] = null
      ,[yohakua_opmast] = case when kkhaku1_opmast in (63,72) then kkhaku1_opmast else null end
      ,[yohakub_opmast] = case when kkhaku2_opmast in (63,72) then kkhaku2_opmast else null end
      ,[yohakuc_opmast] = case when kkhaku3_opmast in (63,72) then kkhaku3_opmast else null end
      ,[yohakud_opmast] = case when kkhaku4_opmast in (63,72) then kkhaku4_opmast else null end
      ,[yohakue_opmast] = case when kkhaku5_opmast in (63,72) then kkhaku5_opmast else null end
      ,[yohakuf_opmast] = case when kkhaku6_opmast in (63,72) then kkhaku6_opmast else null end
      ,[yohakug_opmast] = null
      ,[yohakuh_opmast] = null
      ,[yohakui_opmast] = null
      ,[yohakua_opmopa] = case when kkhaku1_opmast in (63,72) then kkhaku1_opmopa else null end
      ,[yohakub_opmopa] = case when kkhaku2_opmast in (63,72) then kkhaku2_opmopa else null end
      ,[yohakuc_opmopa] = case when kkhaku3_opmast in (63,72) then kkhaku3_opmopa else null end
      ,[yohakud_opmopa] = case when kkhaku4_opmast in (63,72) then kkhaku4_opmopa else null end
      ,[yohakue_opmopa] = case when kkhaku5_opmast in (63,72) then kkhaku5_opmopa else null end
      ,[yohakuf_opmopa] = case when kkhaku6_opmast in (63,72) then kkhaku6_opmopa else null end
      ,[yohakug_opmopa] = null
      ,[yohakuh_opmopa] = null
      ,[yohakui_opmopa] = null
      ,[yohakua_opm95opa] = case when kkhaku1_opmast in (63,72) then kkhaku1_opm95opa else null end
      ,[yohakub_opm95opa] = case when kkhaku2_opmast in (63,72) then kkhaku2_opm95opa else null end
      ,[yohakuc_opm95opa] = case when kkhaku3_opmast in (63,72) then kkhaku3_opm95opa else null end
      ,[yohakud_opm95opa] = case when kkhaku4_opmast in (63,72) then kkhaku4_opm95opa else null end
      ,[yohakue_opm95opa] = case when kkhaku5_opmast in (63,72) then kkhaku5_opm95opa else null end
      ,[yohakuf_opm95opa] = case when kkhaku6_opmast in (63,72) then kkhaku6_opm95opa else null end
      ,[yohakug_opm95opa] = null
      ,[yohakuh_opm95opa] = null
      ,[yohakui_opm95opa] = null
      ,[yohakua_hyv] = case when kkhaku1_opmast in (63,72) then kkhaku1_hyv else null end
      ,[yohakub_hyv] = case when kkhaku2_opmast in (63,72) then kkhaku2_hyv else null end
      ,[yohakuc_hyv] = case when kkhaku3_opmast in (63,72) then kkhaku3_hyv else null end
      ,[yohakud_hyv] = case when kkhaku4_opmast in (63,72) then kkhaku4_hyv else null end
      ,[yohakue_hyv] = case when kkhaku5_opmast in (63,72) then kkhaku5_hyv else null end
      ,[yohakuf_hyv] = case when kkhaku6_opmast in (63,72) then kkhaku6_hyv else null end
      ,[yohakug_hyv] = null
      ,[yohakuh_hyv] = null
      ,[yohakui_hyv] = null
      ,[yohakua_vastotto] = case when kkhaku1_opmast in (63,72) then kkhaku1_vastotto else null end
      ,[yohakub_vastotto] = case when kkhaku2_opmast in (63,72) then kkhaku2_vastotto else null end
      ,[yohakuc_vastotto] = case when kkhaku3_opmast in (63,72) then kkhaku3_vastotto else null end
      ,[yohakud_vastotto] = case when kkhaku4_opmast in (63,72) then kkhaku4_vastotto else null end
      ,[yohakue_vastotto] = case when kkhaku5_opmast in (63,72) then kkhaku5_vastotto else null end
      ,[yohakuf_vastotto] = case when kkhaku6_opmast in (63,72) then kkhaku6_vastotto else null end
      ,[yohakug_vastotto] = null
      ,[yohakuh_vastotto] = null
      ,[yohakui_vastotto] = null
      ,[yohakua_harekast] = case when kkhaku1_opmast = 63 then '05' when kkhaku1_opmast = 72 then '06' else null end
      ,[yohakub_harekast] = case when kkhaku2_opmast = 63 then '05' when kkhaku2_opmast = 72 then '06' else null end
      ,[yohakuc_harekast] = case when kkhaku3_opmast = 63 then '05' when kkhaku3_opmast = 72 then '06' else null end
      ,[yohakud_harekast] = case when kkhaku4_opmast = 63 then '05' when kkhaku4_opmast = 72 then '06' else null end
      ,[yohakue_harekast] = case when kkhaku5_opmast = 63 then '05' when kkhaku5_opmast = 72 then '06' else null end
      ,[yohakuf_harekast] = case when kkhaku6_opmast = 63 then '05' when kkhaku6_opmast = 72 then '06' else null end
      ,[yohakug_harekast] = null
      ,[yohakuh_harekast] = null
      ,[yohakui_harekast] = null
      ,[yohakua_ylempi] = null
      ,[yohakub_ylempi] = null
      ,[yohakuc_ylempi] = null
      ,[yohakud_ylempi] = null
      ,[yohakue_ylempi] = null
      ,[yohakuf_ylempi] = null
      ,[yohakug_ylempi] = null
      ,[yohakuh_ylempi] = null
      ,[yohakui_ylempi] = null
      ,[yohakua_erval] = null
      ,[yohakub_erval] = null
      ,[yohakuc_erval] = null
      ,[yohakud_erval] = null
      ,[yohakue_erval] = null
      ,[yohakuf_erval] = null
      ,[yohakug_erval] = null
      ,[yohakuh_erval] = null
      ,[yohakui_erval] = null
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]='TK_K3_16_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_17]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast] = NULL
      ,[luammhaku2_opmast] = NULL
      ,[luammhaku3_opmast] = NULL
      ,[luammhaku4_opmast] = NULL
      ,[luammhaku5_opmast] = NULL
	  ,[luammhaku1_kaste_t2]
	  ,[luammhaku2_kaste_t2]
	  ,[luammhaku3_kaste_t2]
	  ,[luammhaku4_kaste_t2]
	  ,[luammhaku5_kaste_t2]
	  ,[luammhaku1_iscfibroad2013]
	  ,[luammhaku2_iscfibroad2013]
	  ,[luammhaku3_iscfibroad2013]
	  ,[luammhaku4_iscfibroad2013]
	  ,[luammhaku5_iscfibroad2013]
      ,[luammhaku1_opmopa] = NULL
      ,[luammhaku2_opmopa] = NULL
      ,[luammhaku3_opmopa] = NULL
      ,[luammhaku4_opmopa] = NULL
      ,[luammhaku5_opmopa] = NULL
      ,[luammhaku1_opm95opa] = NULL
      ,[luammhaku2_opm95opa] = NULL
      ,[luammhaku3_opm95opa] = NULL
      ,[luammhaku4_opm95opa] = NULL
      ,[luammhaku5_opm95opa] = NULL
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_tunn else null end
      ,[amkhaku2_tunn] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_tunn else null end
      ,[amkhaku3_tunn] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_tunn else null end
      ,[amkhaku4_tunn] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_tunn else null end
	  ,[amkhaku5_tunn] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_tunn else null end
	  ,[amkhaku6_tunn] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_tunn else null end
      ,[amkhakum_tunn] =null
      ,[amkhaku1_opmast] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_kaste_t2 else null end
      ,[amkhaku2_opmast] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_kaste_t2 else null end
      ,[amkhaku3_opmast] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_kaste_t2 else null end
      ,[amkhaku4_opmast] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_kaste_t2 else null end
	  ,[amkhaku5_opmast] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_kaste_t2 else null end
	  ,[amkhaku6_opmast] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_kaste_t2 else null end
      ,[amkhakum_opmast] = null
      ,[amkhaku1_opmopa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opmopa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opmopa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opmopa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opmopa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opmopa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opmopa] = null
      ,[amkhaku1_opm95opa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opm95opa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opm95opa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opm95opa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opm95opa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opm95opa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opm95opa] = null
      ,[amkhaku1_koultyp] = null
      ,[amkhaku2_koultyp] = null
      ,[amkhaku3_koultyp] = null
      ,[amkhaku4_koultyp] = null
      ,[amkhakum_koultyp] = null
      ,[amkhaku1_okieli] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_okieli else null end
      ,[amkhaku2_okieli] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_okieli else null end
      ,[amkhaku3_okieli] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_okieli else null end
      ,[amkhaku4_okieli] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_okieli else null end
	  ,[amkhaku5_okieli] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_okieli else null end
	  ,[amkhaku6_okieli] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_okieli else null end
      ,[amkhakum_okieli] = null
      ,[amkhaku1_hyv] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_hyv else null end
      ,[amkhaku2_hyv] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_hyv else null end
      ,[amkhaku3_hyv] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_hyv else null end
      ,[amkhaku4_hyv] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_hyv else null end
	  ,[amkhaku5_hyv] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_hyv else null end
	  ,[amkhaku6_hyv] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_hyv else null end
      ,[amkhakum_hyv] = null
      ,[amkhaku1_vastotto] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_vastotto else null end
      ,[amkhaku2_vastotto] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_vastotto else null end
      ,[amkhaku3_vastotto] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_vastotto else null end
      ,[amkhaku4_vastotto] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_vastotto else null end
	  ,[amkhaku5_vastotto] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_vastotto else null end
	  ,[amkhaku6_vastotto] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_vastotto else null end
      ,[amkhakum_vastotto] = null
      ,[yohakua_tunn] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_tunn else null end
      ,[yohakub_tunn] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_tunn else null end
      ,[yohakuc_tunn] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_tunn else null end
      ,[yohakud_tunn] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_tunn else null end
      ,[yohakue_tunn] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_tunn else null end
      ,[yohakuf_tunn] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_tunn else null end
      ,[yohakug_tunn] = null
      ,[yohakuh_tunn] = null
      ,[yohakui_tunn] = null
      ,[yohakua_opmast] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_kaste_t2 else null end
      ,[yohakub_opmast] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_kaste_t2 else null end
      ,[yohakuc_opmast] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_kaste_t2 else null end
      ,[yohakud_opmast] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_kaste_t2 else null end
      ,[yohakue_opmast] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_kaste_t2 else null end
      ,[yohakuf_opmast] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_kaste_t2 else null end
      ,[yohakug_opmast] = null
      ,[yohakuh_opmast] = null
      ,[yohakui_opmast] = null
      ,[yohakua_opmopa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opmopa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opmopa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opmopa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opmopa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opmopa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opmopa] = null
      ,[yohakuh_opmopa] = null
      ,[yohakui_opmopa] = null
      ,[yohakua_opm95opa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opm95opa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opm95opa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opm95opa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opm95opa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opm95opa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opm95opa] = null
      ,[yohakuh_opm95opa] = null
      ,[yohakui_opm95opa] = null
      ,[yohakua_hyv] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_hyv else null end
      ,[yohakub_hyv] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_hyv else null end
      ,[yohakuc_hyv] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_hyv else null end
      ,[yohakud_hyv] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_hyv else null end
      ,[yohakue_hyv] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_hyv else null end
      ,[yohakuf_hyv] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_hyv else null end
      ,[yohakug_hyv] = null
      ,[yohakuh_hyv] = null
      ,[yohakui_hyv] = null
      ,[yohakua_vastotto] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_vastotto else null end
      ,[yohakub_vastotto] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_vastotto else null end
      ,[yohakuc_vastotto] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_vastotto else null end
      ,[yohakud_vastotto] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_vastotto else null end
      ,[yohakue_vastotto] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_vastotto else null end
      ,[yohakuf_vastotto] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_vastotto else null end
      ,[yohakug_vastotto] = null
      ,[yohakuh_vastotto] = null
      ,[yohakui_vastotto] = null
      ,[yohakua_harekast] = case when kkhaku1_kaste_t2 = 63 then '05' when kkhaku1_kaste_t2 = 72 then '06' else null end
      ,[yohakub_harekast] = case when kkhaku2_kaste_t2 = 63 then '05' when kkhaku2_kaste_t2 = 72 then '06' else null end
      ,[yohakuc_harekast] = case when kkhaku3_kaste_t2 = 63 then '05' when kkhaku3_kaste_t2 = 72 then '06' else null end
      ,[yohakud_harekast] = case when kkhaku4_kaste_t2 = 63 then '05' when kkhaku4_kaste_t2 = 72 then '06' else null end
      ,[yohakue_harekast] = case when kkhaku5_kaste_t2 = 63 then '05' when kkhaku5_kaste_t2 = 72 then '06' else null end
      ,[yohakuf_harekast] = case when kkhaku6_kaste_t2 = 63 then '05' when kkhaku6_kaste_t2 = 72 then '06' else null end
      ,[yohakug_harekast] = null
      ,[yohakuh_harekast] = null
      ,[yohakui_harekast] = null
      ,[yohakua_ylempi] = null
      ,[yohakub_ylempi] = null
      ,[yohakuc_ylempi] = null
      ,[yohakud_ylempi] = null
      ,[yohakue_ylempi] = null
      ,[yohakuf_ylempi] = null
      ,[yohakug_ylempi] = null
      ,[yohakuh_ylempi] = null
      ,[yohakui_ylempi] = null
      ,[yohakua_erval] = null
      ,[yohakub_erval] = null
      ,[yohakuc_erval] = null
      ,[yohakud_erval] = null
      ,[yohakue_erval] = null
      ,[yohakuf_erval] = null
      ,[yohakug_erval] = null
      ,[yohakuh_erval] = null
      ,[yohakui_erval] = null
	  ,[kkhaku1_kaste_t2]
	  ,[kkhaku2_kaste_t2]
	  ,[kkhaku3_kaste_t2]
	  ,[kkhaku4_kaste_t2]
	  ,[kkhaku5_kaste_t2]
	  ,[kkhaku6_kaste_t2]
	  ,[kkhaku1_iscfibroad2013]
	  ,[kkhaku2_iscfibroad2013]
	  ,[kkhaku3_iscfibroad2013]
	  ,[kkhaku4_iscfibroad2013]
	  ,[kkhaku5_iscfibroad2013]
	  ,[kkhaku6_iscfibroad2013]
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]='TK_K3_16_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_18]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast] = NULL
      ,[luammhaku2_opmast] = NULL
      ,[luammhaku3_opmast] = NULL
      ,[luammhaku4_opmast] = NULL
      ,[luammhaku5_opmast] = NULL
	  ,[luammhaku1_kaste_t2]
	  ,[luammhaku2_kaste_t2]
	  ,[luammhaku3_kaste_t2]
	  ,[luammhaku4_kaste_t2]
	  ,[luammhaku5_kaste_t2]
	  ,[luammhaku1_iscfibroad2013]
	  ,[luammhaku2_iscfibroad2013]
	  ,[luammhaku3_iscfibroad2013]
	  ,[luammhaku4_iscfibroad2013]
	  ,[luammhaku5_iscfibroad2013]
      ,[luammhaku1_opmopa] = NULL
      ,[luammhaku2_opmopa] = NULL
      ,[luammhaku3_opmopa] = NULL
      ,[luammhaku4_opmopa] = NULL
      ,[luammhaku5_opmopa] = NULL
      ,[luammhaku1_opm95opa] = NULL
      ,[luammhaku2_opm95opa] = NULL
      ,[luammhaku3_opm95opa] = NULL
      ,[luammhaku4_opm95opa] = NULL
      ,[luammhaku5_opm95opa] = NULL
      ,[luammhaku1_kkieli]
      ,[luammhaku2_kkieli]
      ,[luammhaku3_kkieli]
      ,[luammhaku4_kkieli]
      ,[luammhaku5_kkieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_tunn else null end
      ,[amkhaku2_tunn] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_tunn else null end
      ,[amkhaku3_tunn] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_tunn else null end
      ,[amkhaku4_tunn] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_tunn else null end
	  ,[amkhaku5_tunn] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_tunn else null end
	  ,[amkhaku6_tunn] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_tunn else null end
      ,[amkhakum_tunn] =null
      ,[amkhaku1_opmast] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_kaste_t2 else null end
      ,[amkhaku2_opmast] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_kaste_t2 else null end
      ,[amkhaku3_opmast] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_kaste_t2 else null end
      ,[amkhaku4_opmast] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_kaste_t2 else null end
	  ,[amkhaku5_opmast] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_kaste_t2 else null end
	  ,[amkhaku6_opmast] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_kaste_t2 else null end
      ,[amkhakum_opmast] = null
      ,[amkhaku1_opmopa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opmopa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opmopa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opmopa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opmopa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opmopa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opmopa] = null
      ,[amkhaku1_opm95opa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opm95opa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opm95opa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opm95opa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opm95opa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opm95opa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opm95opa] = null
      ,[amkhaku1_koultyp] = null
      ,[amkhaku2_koultyp] = null
      ,[amkhaku3_koultyp] = null
      ,[amkhaku4_koultyp] = null
      ,[amkhakum_koultyp] = null
      ,[amkhaku1_okieli] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_kkieli else null end
      ,[amkhaku2_okieli] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_kkieli else null end
      ,[amkhaku3_okieli] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_kkieli else null end
      ,[amkhaku4_okieli] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_kkieli else null end
	  ,[amkhaku5_okieli] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_kkieli else null end
	  ,[amkhaku6_okieli] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_kkieli else null end
      ,[amkhakum_okieli] = null
      ,[amkhaku1_hyv] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_hyv else null end
      ,[amkhaku2_hyv] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_hyv else null end
      ,[amkhaku3_hyv] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_hyv else null end
      ,[amkhaku4_hyv] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_hyv else null end
	  ,[amkhaku5_hyv] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_hyv else null end
	  ,[amkhaku6_hyv] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_hyv else null end
      ,[amkhakum_hyv] = null
      ,[amkhaku1_vastotto] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_vastotto else null end
      ,[amkhaku2_vastotto] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_vastotto else null end
      ,[amkhaku3_vastotto] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_vastotto else null end
      ,[amkhaku4_vastotto] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_vastotto else null end
	  ,[amkhaku5_vastotto] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_vastotto else null end
	  ,[amkhaku6_vastotto] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_vastotto else null end
      ,[amkhakum_vastotto] = null
      ,[yohakua_tunn] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_tunn else null end
      ,[yohakub_tunn] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_tunn else null end
      ,[yohakuc_tunn] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_tunn else null end
      ,[yohakud_tunn] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_tunn else null end
      ,[yohakue_tunn] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_tunn else null end
      ,[yohakuf_tunn] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_tunn else null end
      ,[yohakug_tunn] = null
      ,[yohakuh_tunn] = null
      ,[yohakui_tunn] = null
      ,[yohakua_opmast] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_kaste_t2 else null end
      ,[yohakub_opmast] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_kaste_t2 else null end
      ,[yohakuc_opmast] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_kaste_t2 else null end
      ,[yohakud_opmast] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_kaste_t2 else null end
      ,[yohakue_opmast] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_kaste_t2 else null end
      ,[yohakuf_opmast] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_kaste_t2 else null end
      ,[yohakug_opmast] = null
      ,[yohakuh_opmast] = null
      ,[yohakui_opmast] = null
      ,[yohakua_opmopa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opmopa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opmopa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opmopa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opmopa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opmopa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opmopa] = null
      ,[yohakuh_opmopa] = null
      ,[yohakui_opmopa] = null
      ,[yohakua_opm95opa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opm95opa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opm95opa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opm95opa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opm95opa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opm95opa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opm95opa] = null
      ,[yohakuh_opm95opa] = null
      ,[yohakui_opm95opa] = null
      ,[yohakua_hyv] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_hyv else null end
      ,[yohakub_hyv] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_hyv else null end
      ,[yohakuc_hyv] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_hyv else null end
      ,[yohakud_hyv] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_hyv else null end
      ,[yohakue_hyv] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_hyv else null end
      ,[yohakuf_hyv] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_hyv else null end
      ,[yohakug_hyv] = null
      ,[yohakuh_hyv] = null
      ,[yohakui_hyv] = null
      ,[yohakua_vastotto] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_vastotto else null end
      ,[yohakub_vastotto] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_vastotto else null end
      ,[yohakuc_vastotto] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_vastotto else null end
      ,[yohakud_vastotto] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_vastotto else null end
      ,[yohakue_vastotto] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_vastotto else null end
      ,[yohakuf_vastotto] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_vastotto else null end
      ,[yohakug_vastotto] = null
      ,[yohakuh_vastotto] = null
      ,[yohakui_vastotto] = null
      ,[yohakua_harekast] = case when kkhaku1_kaste_t2 = 63 then '05' when kkhaku1_kaste_t2 = 72 then '06' else null end
      ,[yohakub_harekast] = case when kkhaku2_kaste_t2 = 63 then '05' when kkhaku2_kaste_t2 = 72 then '06' else null end
      ,[yohakuc_harekast] = case when kkhaku3_kaste_t2 = 63 then '05' when kkhaku3_kaste_t2 = 72 then '06' else null end
      ,[yohakud_harekast] = case when kkhaku4_kaste_t2 = 63 then '05' when kkhaku4_kaste_t2 = 72 then '06' else null end
      ,[yohakue_harekast] = case when kkhaku5_kaste_t2 = 63 then '05' when kkhaku5_kaste_t2 = 72 then '06' else null end
      ,[yohakuf_harekast] = case when kkhaku6_kaste_t2 = 63 then '05' when kkhaku6_kaste_t2 = 72 then '06' else null end
      ,[yohakug_harekast] = null
      ,[yohakuh_harekast] = null
      ,[yohakui_harekast] = null
      ,[yohakua_ylempi] = null
      ,[yohakub_ylempi] = null
      ,[yohakuc_ylempi] = null
      ,[yohakud_ylempi] = null
      ,[yohakue_ylempi] = null
      ,[yohakuf_ylempi] = null
      ,[yohakug_ylempi] = null
      ,[yohakuh_ylempi] = null
      ,[yohakui_ylempi] = null
      ,[yohakua_erval] = null
      ,[yohakub_erval] = null
      ,[yohakuc_erval] = null
      ,[yohakud_erval] = null
      ,[yohakue_erval] = null
      ,[yohakuf_erval] = null
      ,[yohakug_erval] = null
      ,[yohakuh_erval] = null
      ,[yohakui_erval] = null
	  ,[kkhaku1_kaste_t2]
	  ,[kkhaku2_kaste_t2]
	  ,[kkhaku3_kaste_t2]
	  ,[kkhaku4_kaste_t2]
	  ,[kkhaku5_kaste_t2]
	  ,[kkhaku6_kaste_t2]
	  ,[kkhaku1_iscfibroad2013]
	  ,[kkhaku2_iscfibroad2013]
	  ,[kkhaku3_iscfibroad2013]
	  ,[kkhaku4_iscfibroad2013]
	  ,[kkhaku5_iscfibroad2013]
	  ,[kkhaku6_iscfibroad2013]
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]='TK_K3_16_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_19]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast] = NULL
      ,[luammhaku2_opmast] = NULL
      ,[luammhaku3_opmast] = NULL
      ,[luammhaku4_opmast] = NULL
      ,[luammhaku5_opmast] = NULL
	  ,[luammhaku1_kaste_t2]
	  ,[luammhaku2_kaste_t2]
	  ,[luammhaku3_kaste_t2]
	  ,[luammhaku4_kaste_t2]
	  ,[luammhaku5_kaste_t2]
	  ,[luammhaku1_iscfibroad2013]
	  ,[luammhaku2_iscfibroad2013]
	  ,[luammhaku3_iscfibroad2013]
	  ,[luammhaku4_iscfibroad2013]
	  ,[luammhaku5_iscfibroad2013]
      ,[luammhaku1_opmopa] = NULL
      ,[luammhaku2_opmopa] = NULL
      ,[luammhaku3_opmopa] = NULL
      ,[luammhaku4_opmopa] = NULL
      ,[luammhaku5_opmopa] = NULL
      ,[luammhaku1_opm95opa] = NULL
      ,[luammhaku2_opm95opa] = NULL
      ,[luammhaku3_opm95opa] = NULL
      ,[luammhaku4_opm95opa] = NULL
      ,[luammhaku5_opm95opa] = NULL
      ,[luammhaku1_kkieli]
      ,[luammhaku2_kkieli]
      ,[luammhaku3_kkieli]
      ,[luammhaku4_kkieli]
      ,[luammhaku5_kkieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_tunn else null end
      ,[amkhaku2_tunn] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_tunn else null end
      ,[amkhaku3_tunn] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_tunn else null end
      ,[amkhaku4_tunn] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_tunn else null end
	  ,[amkhaku5_tunn] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_tunn else null end
	  ,[amkhaku6_tunn] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_tunn else null end
      ,[amkhakum_tunn] =null
      ,[amkhaku1_opmast] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_kaste_t2 else null end
      ,[amkhaku2_opmast] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_kaste_t2 else null end
      ,[amkhaku3_opmast] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_kaste_t2 else null end
      ,[amkhaku4_opmast] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_kaste_t2 else null end
	  ,[amkhaku5_opmast] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_kaste_t2 else null end
	  ,[amkhaku6_opmast] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_kaste_t2 else null end
      ,[amkhakum_opmast] = null
      ,[amkhaku1_opmopa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opmopa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opmopa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opmopa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opmopa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opmopa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opmopa] = null
      ,[amkhaku1_opm95opa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opm95opa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opm95opa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opm95opa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opm95opa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opm95opa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opm95opa] = null
      ,[amkhaku1_koultyp] = null
      ,[amkhaku2_koultyp] = null
      ,[amkhaku3_koultyp] = null
      ,[amkhaku4_koultyp] = null
      ,[amkhakum_koultyp] = null
      ,[amkhaku1_okieli] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_kkieli else null end
      ,[amkhaku2_okieli] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_kkieli else null end
      ,[amkhaku3_okieli] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_kkieli else null end
      ,[amkhaku4_okieli] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_kkieli else null end
	  ,[amkhaku5_okieli] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_kkieli else null end
	  ,[amkhaku6_okieli] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_kkieli else null end
      ,[amkhakum_okieli] = null
      ,[amkhaku1_hyv] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_hyv else null end
      ,[amkhaku2_hyv] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_hyv else null end
      ,[amkhaku3_hyv] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_hyv else null end
      ,[amkhaku4_hyv] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_hyv else null end
	  ,[amkhaku5_hyv] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_hyv else null end
	  ,[amkhaku6_hyv] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_hyv else null end
      ,[amkhakum_hyv] = null
      ,[amkhaku1_vastotto] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_vastotto else null end
      ,[amkhaku2_vastotto] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_vastotto else null end
      ,[amkhaku3_vastotto] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_vastotto else null end
      ,[amkhaku4_vastotto] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_vastotto else null end
	  ,[amkhaku5_vastotto] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_vastotto else null end
	  ,[amkhaku6_vastotto] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_vastotto else null end
      ,[amkhakum_vastotto] = null
      ,[yohakua_tunn] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_tunn else null end
      ,[yohakub_tunn] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_tunn else null end
      ,[yohakuc_tunn] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_tunn else null end
      ,[yohakud_tunn] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_tunn else null end
      ,[yohakue_tunn] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_tunn else null end
      ,[yohakuf_tunn] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_tunn else null end
      ,[yohakug_tunn] = null
      ,[yohakuh_tunn] = null
      ,[yohakui_tunn] = null
      ,[yohakua_opmast] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_kaste_t2 else null end
      ,[yohakub_opmast] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_kaste_t2 else null end
      ,[yohakuc_opmast] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_kaste_t2 else null end
      ,[yohakud_opmast] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_kaste_t2 else null end
      ,[yohakue_opmast] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_kaste_t2 else null end
      ,[yohakuf_opmast] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_kaste_t2 else null end
      ,[yohakug_opmast] = null
      ,[yohakuh_opmast] = null
      ,[yohakui_opmast] = null
      ,[yohakua_opmopa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opmopa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opmopa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opmopa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opmopa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opmopa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opmopa] = null
      ,[yohakuh_opmopa] = null
      ,[yohakui_opmopa] = null
      ,[yohakua_opm95opa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opm95opa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opm95opa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opm95opa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opm95opa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opm95opa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opm95opa] = null
      ,[yohakuh_opm95opa] = null
      ,[yohakui_opm95opa] = null
      ,[yohakua_hyv] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_hyv else null end
      ,[yohakub_hyv] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_hyv else null end
      ,[yohakuc_hyv] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_hyv else null end
      ,[yohakud_hyv] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_hyv else null end
      ,[yohakue_hyv] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_hyv else null end
      ,[yohakuf_hyv] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_hyv else null end
      ,[yohakug_hyv] = null
      ,[yohakuh_hyv] = null
      ,[yohakui_hyv] = null
      ,[yohakua_vastotto] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_vastotto else null end
      ,[yohakub_vastotto] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_vastotto else null end
      ,[yohakuc_vastotto] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_vastotto else null end
      ,[yohakud_vastotto] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_vastotto else null end
      ,[yohakue_vastotto] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_vastotto else null end
      ,[yohakuf_vastotto] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_vastotto else null end
      ,[yohakug_vastotto] = null
      ,[yohakuh_vastotto] = null
      ,[yohakui_vastotto] = null
      ,[yohakua_harekast] = case when kkhaku1_kaste_t2 = 63 then '05' when kkhaku1_kaste_t2 = 72 then '06' else null end
      ,[yohakub_harekast] = case when kkhaku2_kaste_t2 = 63 then '05' when kkhaku2_kaste_t2 = 72 then '06' else null end
      ,[yohakuc_harekast] = case when kkhaku3_kaste_t2 = 63 then '05' when kkhaku3_kaste_t2 = 72 then '06' else null end
      ,[yohakud_harekast] = case when kkhaku4_kaste_t2 = 63 then '05' when kkhaku4_kaste_t2 = 72 then '06' else null end
      ,[yohakue_harekast] = case when kkhaku5_kaste_t2 = 63 then '05' when kkhaku5_kaste_t2 = 72 then '06' else null end
      ,[yohakuf_harekast] = case when kkhaku6_kaste_t2 = 63 then '05' when kkhaku6_kaste_t2 = 72 then '06' else null end
      ,[yohakug_harekast] = null
      ,[yohakuh_harekast] = null
      ,[yohakui_harekast] = null
      ,[yohakua_ylempi] = null
      ,[yohakub_ylempi] = null
      ,[yohakuc_ylempi] = null
      ,[yohakud_ylempi] = null
      ,[yohakue_ylempi] = null
      ,[yohakuf_ylempi] = null
      ,[yohakug_ylempi] = null
      ,[yohakuh_ylempi] = null
      ,[yohakui_ylempi] = null
      ,[yohakua_erval] = null
      ,[yohakub_erval] = null
      ,[yohakuc_erval] = null
      ,[yohakud_erval] = null
      ,[yohakue_erval] = null
      ,[yohakuf_erval] = null
      ,[yohakug_erval] = null
      ,[yohakuh_erval] = null
      ,[yohakui_erval] = null
	  ,[kkhaku1_kaste_t2]
	  ,[kkhaku2_kaste_t2]
	  ,[kkhaku3_kaste_t2]
	  ,[kkhaku4_kaste_t2]
	  ,[kkhaku5_kaste_t2]
	  ,[kkhaku6_kaste_t2]
	  ,[kkhaku1_iscfibroad2013]
	  ,[kkhaku2_iscfibroad2013]
	  ,[kkhaku3_iscfibroad2013]
	  ,[kkhaku4_iscfibroad2013]
	  ,[kkhaku5_iscfibroad2013]
	  ,[kkhaku6_iscfibroad2013]
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]='TK_K3_16_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_20]

) kaikkivuodet









GO


USE [ANTERO]