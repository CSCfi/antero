USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]    Script Date: 2.9.2022 9:44:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [dbo].[v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus] as

-- CSC JN 13.4.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus
-- Select * into VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus
-- Insert into VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus Select * from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus


SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,rahoituslahde_avain
	  ,tutkimusrahoitus
      ,[tietolahde]
      ,[rivinumero]

  FROM ( --kaikki
  
--Select 
--	 tilv
--	,[tilv_date]
--	,TK_koodi
--	,rahoituslahde_avain = 'OKM_PERUS'
--	,tutkimusrahoitus = [OKM_perusrahoitus]
--	,[tietolahde]
--    ,[rivinumero]
--From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
--Where [OKM_perusrahoitus] <> 0.0

--Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'TEKES'
	,tutkimusrahoitus = TEKES
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where TEKES <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'TEM_MUU'
	,tutkimusrahoitus = MTEM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where MTEM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'AKATEMIA'
	,tutkimusrahoitus = AKATEMIA
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where AKATEMIA <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'GRAD'
	,tutkimusrahoitus = GRAD
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where GRAD <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'OKM_MUU'
	,tutkimusrahoitus = MOPEM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where MOPEM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'LVM'
	,tutkimusrahoitus = LIIKM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where LIIKM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'MMM'
	,tutkimusrahoitus = MAAM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where MAAM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'OM'
	,tutkimusrahoitus = OM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where OM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'PM'
	,tutkimusrahoitus = PM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where PM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'SM'
	,tutkimusrahoitus = SISAM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where SISAM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'STM'
	,tutkimusrahoitus = SOSM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where SOSM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'UM'
	,tutkimusrahoitus = UM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where UM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'VN'
	,tutkimusrahoitus = VN
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where VN <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'VM'
	,tutkimusrahoitus = VM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where VM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'YM'
	,tutkimusrahoitus = YMP
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where YMP <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'JULK_MUU'
	,tutkimusrahoitus = MUUJU
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where MUUJU <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'RAHASTO_K'
	,tutkimusrahoitus = RAHAS
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where RAHAS <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'YRITYS_K'
	,tutkimusrahoitus = KOTIM
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where KOTIM <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'YRITYS_U'
	,tutkimusrahoitus = ULKOY
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where ULKOY <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'EU'
	,tutkimusrahoitus = UEU
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where UEU <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'EU_PUITE'
	,tutkimusrahoitus = EUPUITE
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where EUPUITE <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'EU_ALUE'
	,tutkimusrahoitus = EAKR
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where EAKR <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'EU_SOS'
	,tutkimusrahoitus = ESR
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where ESR <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'EU_MUU'
	,tutkimusrahoitus = MUUEU
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where MUUEU <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'MUU_U'
	,tutkimusrahoitus = MULKO
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where MULKO <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'KUNNAT'
	,tutkimusrahoitus = KUNNAT
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where KUNNAT <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'JARJESTO_U'
	,tutkimusrahoitus = MKVJ
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where MKVJ <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'OKM_PERUS_ORAHAS'
	,tutkimusrahoitus = ORAHAS
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where ORAHAS <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'RKORK'
	,tutkimusrahoitus = RKORK
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where RKORK <> 0.0

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'ORAHAS'
	,tutkimusrahoitus = AORAHAS
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where AORAHAS <> 0.0 and AORAHAS is not null

Union all  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,rahoituslahde_avain = 'PERUS'
	,tutkimusrahoitus = BUDJETTI
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where BUDJETTI <> 0.0 and BUDJETTI is not null
 ) kaikki


GO

USE [ANTERO]