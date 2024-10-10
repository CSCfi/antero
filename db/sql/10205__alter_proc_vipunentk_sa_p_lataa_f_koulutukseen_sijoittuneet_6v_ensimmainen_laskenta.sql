USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_koulutukseen_sijoittuneet_6v_ensimmainen_laskenta]    Script Date: 10.10.2024 13:53:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[p_lataa_f_koulutukseen_sijoittuneet_6v_ensimmainen_laskenta] AS

TRUNCATE TABLE [VipunenTK_DW].[dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]

INSERT INTO [VipunenTK_DW].[dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]
(
aineistorivinumero,
tarkastelujakso,
tilv, 
tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,
koulutus,
oppilaitos,
koulutuksen_jarjestaja,
koulutuksen_maakunta,
monihaku,
paaasiallinen_toiminta,
ammattiasema,
lkm,
pohjkoulk,
tietolahde,
aineisto,
opintotuki_ulkom,
lukiokoulutuksessa,
ammatillisessa_koulutuksessa,
ammattikorkeakoulutuksessa,
yliopistokoulutuksessa,
lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa,
toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa,
ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa,
koulutuksen_paattaneiden_toiminta,
rivinumero,
ika_1v,
ika_5v,
ika_1v_suorv
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
,tj0_koul_luokitus_id
)
SELECT
l.rivinumero,
l.tarkastelujakso,
l.tilv, 
l.tilv_date,
l.tutkryh,
l.suorv,
l.suorlk,
l.sp,
l.syntv,
l.aikielir1,
l.tutkkaskun,
l.kansalr1,
l.pohjmaa,
l.eumaa,
l.etamaa,
l.tunn,
l.jarj,
l.kkielir1,
l.tutklaja,
l.tutktav,
l.aikoul,
l.tutkmaak,
l.koulutus_1,--coalesce(nullif(l.koulutus_2,''),l.koulutus_1),
l.oppilaitos_1,--coalesce(nullif(l.oppilaitos_2,''),l.oppilaitos_1),
l.koulutuksen_jarjestaja_1,--coalesce(nullif(l.koulutuksen_jarjestaja_2,''),l.koulutuksen_jarjestaja_1),
l.koulutuksen_maakunta_1,--coalesce(nullif(l.koulutuksen_maakunta_2,''),l.koulutuksen_maakunta_1),
l.monihaku,
l.paaasiallinen_toiminta,
l.ammattiasema,
l.lkm,
l.pohjkoulk,
l.tietolahde,
l.aineisto,
l.opintotuki_ulkom,
l.lukiokoulutuksessa,
l.ammatillisessa_koulutuksessa,
l.ammattikorkeakoulutuksessa,
l.yliopistokoulutuksessa,
l.lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa,
l.toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa,
l.ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa,
l.koulutuksen_paattaneiden_toiminta,
ROW_NUMBER()OVER(ORDER BY l.tarkastelujakso),
l.ika_1v,
l.ika_5v,
l.ika_1v_suorv
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
,opisk_vain_yo,opisk_amkyo
,-1 as tj0_koul_luokitus_id
FROM 
		(
		select * from [VipunenTK_DW].[dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu]
		) as l

		


GO


