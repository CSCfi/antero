USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 10.10.2024 14:42:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








/****** Script for SelectTopNRows command from SSMS  ******/
ALTER   VIEW [dbo].[v_f_koulutukseen_sijoittuneet_6v_tarkastelu] AS
SELECT [aineistorivinumero]
      ,[tarkastelujakso]
      ,[tilv]
      ,[tilv_date]
      ,[tutkryh]
      ,[suorv]=(case when [suorv]='' then '-1' else [suorv] end)
      ,[suorlk]=(case when [suorlk]='' then '-1' else [suorlk] end)
      ,[sp]
      ,[syntv]=(case when [syntv]='' then '-1' else [syntv] end)
      ,[aikielir1]
      ,[tutkkaskun]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[tunn]
      ,[jarj]
      ,[kkielir1]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak]
      ,[pohjkoulk]
      ,[koulutus] = (case when [koulutus]='' then '-1' else [koulutus] end)
      ,[oppilaitos]
      ,[koulutuksen_jarjestaja]
      ,[koulutuksen_maakunta]= (case when [koulutuksen_maakunta]='' then '-1' else [koulutuksen_maakunta]end)
      ,[monihaku]
      ,[paaasiallinen_toiminta]
      ,[ammattiasema]
	  ,[opintotuki_ulkom]
      ,[lkm]
      ,[tietolahde]
      ,[aineisto]
      ,[lukiokoulutuksessa]
      ,[ammatillisessa_koulutuksessa]
      ,[ammattikorkeakoulutuksessa]
      ,[yliopistokoulutuksessa]
      ,[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa]
      ,[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa]
      ,[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa]
      ,[koulutuksen_paattaneiden_toiminta]
      ,[lukiokoulutuksessa_ke]= (cast ((case when [lukiokoulutuksessa] = 1 then 'Kyllä' else 'Ei' end) as nchar(5)))
      ,[ammatillisessa_koulutuksessa_ke] = (cast((case when ammatillisessa_koulutuksessa = 1 then 'Kyllä' else 'Ei'end) as nchar(5)))
      ,[ammattikorkeakoulutuksessa_ke]= (cast((case when ammattikorkeakoulutuksessa = 1 then 'Kyllä' else 'Ei'end) as nchar(5)))
      ,[yliopistokoulutuksessa_ke]= cast((case when yliopistokoulutuksessa = 1 then 'Kyllä' else 'Ei'end) as nchar(5))
      ,[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa_ke]= cast((case when lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa= 1 then 'Kyllä' else 'Ei'end) as nchar(5))
      ,[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa_ke]= cast((case when toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa= 1 then 'Kyllä' else 'Ei'end) as nchar(5))
      ,[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa_ke] = cast((case when ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa = 1 then 'Kyllä' else 'Ei'end) as nchar(5))
      ,[rivinumero]
      ,[ika_1v]
      ,[ika_5v]
	  ,[ika_1v_suorv]
	  ,opisk_lu
	  ,opisk_amm_pk
	  ,opisk_amm_at
	  ,opisk_amm_eat
	  ,opisk_amm
	  ,opisk_amk
	  ,opisk_yo
	  ,opisk_amk_koulala1
	  ,opisk_amk_koulala2
	  ,opisk_amk_koulala3
	  ,opisk_amk_koulala4 
	  ,opisk_amk_koulala5
	  ,opisk_amk_koulala6
	  ,opisk_amk_koulala7
	  ,opisk_amk_koulala8
	  ,opisk_amk_koulala9
	  ,opisk_amk_koulala10
	  ,opisk_yo_koulala1
	  ,opisk_yo_koulala2
	  ,opisk_yo_koulala3
	  ,opisk_yo_koulala4
	  ,opisk_yo_koulala5
	  ,opisk_yo_koulala6
	  ,opisk_yo_koulala7
	  ,opisk_yo_koulala8
	  ,opisk_yo_koulala9
	  ,opisk_yo_koulala10
	  ,opisk_vah2_koulala
	  ,haku_amm
	  ,haku_amk
	  ,haku_yo
	  ,eihaku_kk_eiopisk
	  ,eihaku_kk_eiopisk_kk_opisk_ta
	  ,eihaku_kk_eiopisk_kk_opisk_lu
	  ,eihaku_kk_eiopisk_kk_opisk_pk
	  ,eihaku_kk_eiopisk_kk_opisk_at
	  ,eihaku_kk_eiopisk_kk_opisk_eat
	  ,haku_kk_eiopisk_kk
	  ,haku_kk_eiopisk_kk_eiopisk_ta
	  ,haku_kk_eiopisk_kk_opisk_ta
	  ,haku_amk_eiopisk_kk
	  ,haku_yo_eiopisk_kk
	  ,haku_amkyo_eiopisk_kk	
	  ,opisk_kk
	  ,opisk_kk_eiopisk_ta
	  ,opisk_kk_opisk_ta
	  ,opisk_vain_amk
	  ,opisk_vain_yo
	  ,opisk_amkyo
	  ,[tj0_koul_luokitus_id]
  FROM [VipunenTK_DW].[dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]






GO


