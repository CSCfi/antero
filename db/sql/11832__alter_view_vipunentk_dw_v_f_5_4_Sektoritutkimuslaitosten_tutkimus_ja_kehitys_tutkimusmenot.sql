USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot]    Script Date: 30.3.2026 12.25.43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER view [dbo].[v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot] as

-- CSC JN 16.4.2015
-- CSC JN 27.4.2015 Lisätään mukaan arviot seuraavasta vuodesta

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot
-- Select * into VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot
-- Insert into VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot Select * from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot

-- YHME = PAME + OSTPAL + KMENO + HMENO

SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,menokohde_avain
	  ,tutkimusmenot
	  ,tutkimusmenot_arvio_seuraavatilastovuosi
      ,[tietolahde]
      ,[rivinumero]
FROM ( --kaikki
  
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,menokohde_avain = 'PALKAT'
	,tutkimusmenot = palme
	,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where palme <> 0.0

Union All
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,menokohde_avain = 'OSTPAL'
	,tutkimusmenot = ostpa
	,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where ostpa <> 0.0

Union All
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,menokohde_avain = 'MUUTKMENOT'
	,tutkimusmenot = KMENO
	,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where KMENO <> 0.0

Union All
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,menokohde_avain = 'MUUTMENOT'
	,tutkimusmenot = HMENO
	,tutkimusmenot_arvio_seuraavatilastovuosi = NULL
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where HMENO <> 0.0

Union All
Select 
	 tilv
	,[tilv_date]
	,TK_koodi
	,menokohde_avain = '-1'
	,tutkimusmenot = NULL
	,tutkimusmenot_arvio_seuraavatilastovuosi = tk_arvioe
	,[tietolahde]
    ,[rivinumero]
From VipunenTK_DW.[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
Where HMENO <> 0.0

) kaikki



GO


