USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_koulutukseen_sijoittuneet_8v_1_tarkastelujakso]    Script Date: 22.10.2024 16:21:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE OR ALTER PROCEDURE [dbo].[p_lataa_f_koulutukseen_sijoittuneet_8v_1_tarkastelujakso] AS


INSERT INTO [VipunenTK_DW].[dbo].[_koulutukseen_sijoittuneet_8v_tarkastelu]
(
rivinumero
, tarkastelujakso
, tilv 
, tilv_date
, tutkryh 
, suorv
, suorlk 
, sp 
, syntv
, aikielir1 
, tutkkaskun 
, kansalr1
, pohjmaa 
, eumaa 
, etamaa 
, tunn
, jarj
, kkielir1 
, tutklaja 
, tutktav 
, aikoul 
, tutkmaak
, koulutus_1
, oppilaitos_1
, koulutuksen_jarjestaja_1
, koulutuksen_maakunta_1
, koulutus_2
, oppilaitos_2
, koulutuksen_jarjestaja_2
, koulutuksen_maakunta_2
, monihaku
, paaasiallinen_toiminta
, ammattiasema
, lkm
, pohjkoulk
, tietolahde
, aineisto
, opintotuki_ulkom
, lukiokoulutuksessa
, ammatillisessa_koulutuksessa
, ammattikorkeakoulutuksessa
, yliopistokoulutuksessa
, lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa
, toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa
, ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa
, koulutuksen_paattaneiden_toiminta
, ika_1v
, ika_5v
, ika_1v_suorv
, opisk_lu
, opisk_amm_pk
, opisk_amm_at
, opisk_amm_eat
, opisk_amm
, opisk_amk
, opisk_yo
, opisk_amk_koulala1
, opisk_amk_koulala2
, opisk_amk_koulala3
, opisk_amk_koulala4
, opisk_amk_koulala5
, opisk_amk_koulala6
, opisk_amk_koulala7
, opisk_amk_koulala8
, opisk_amk_koulala9
, opisk_amk_koulala10
, opisk_yo_koulala1
, opisk_yo_koulala2
, opisk_yo_koulala3
, opisk_yo_koulala4
, opisk_yo_koulala5
, opisk_yo_koulala6
, opisk_yo_koulala7
, opisk_yo_koulala8
, opisk_yo_koulala9
, opisk_yo_koulala10
, opisk_vah2_koulala
, haku_amm
, haku_amk
, haku_yo
, eihaku_kk_eiopisk
, eihaku_kk_eiopisk_kk_opisk_ta
, eihaku_kk_eiopisk_kk_opisk_lu
, eihaku_kk_eiopisk_kk_opisk_pk
, eihaku_kk_eiopisk_kk_opisk_at
, eihaku_kk_eiopisk_kk_opisk_eat
, haku_kk_eiopisk_kk
, haku_kk_eiopisk_kk_eiopisk_ta
, haku_kk_eiopisk_kk_opisk_ta
, haku_amk_eiopisk_kk
, haku_yo_eiopisk_kk
, haku_amkyo_eiopisk_kk
, opisk_kk
, opisk_kk_eiopisk_ta
, opisk_kk_opisk_ta
, opisk_vain_amk
, opisk_vain_yo
, opisk_amkyo
)
SELECT
 l.rivinumero,
 '1',
 l.tilv,
 l.tilv_date,
 (case 
	when l.tutkryh=3 and tutklaja=1 then 31
	when l.tutkryh=3 and tutklaja=2 then 32
	when l.tutkryh=3 and tutklaja=3 then 33
	else l.tutkryh
  end),
 l.suorv,
  (case
	when l.suorlk = '1'  then (l.suorv+'0'+l.suorlk)
	when l.suorlk = '2'  then (l.suorv+'0'+'8')
	else ''
	end),
 l.sp,
 l.syntv,
 l.aikielir1,
 l.tutkaskun,
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
 -- Koulutus 1
 (case
    --lukiokoulutuksessa _2
	when l.suorlk = '1' and l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 = '' and
	l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then l.luopiskkoulk_2 
	-- ammattikoulutuksessa _2
	when l.suorlk = '1' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 <> '' and
	l.amkopiskkoulk_2 ='' and l.yoopiskkoulk_2 = ''  then l.ammopiskkoulk_2 
	--lukiokoulutuksessa ja ammattillisessa koulutuksessa, otetaan tieto lukiokoulutuksen _2 ensim. koulutustietoihin
	when l.suorlk = '1' and l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 <> '' and
	l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then l.luopiskkoulk_2
	-- ammattikorkeakoulutuksessa _2
	when l.suorlk = '1' and l.amkopiskkoulk_2  <> '' and l.yoopiskkoulk_2  = '' and
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' then l.amkopiskkoulk_2
	-- yliopistokoulutuksessa _2
	when l.suorlk = '1' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 <> '' and 
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = ''   then l.yoopiskkoulk_2
	-- ammattikorkeakoulutuksessa ja yliopistokoulutuksessa, merkitään ensimmäiseen koulutustietoihin ammattikorkeakoulutus  
	when l.suorlk = '1' and l.amkopiskkoulk_2 <> '' and l.yoopiskkoulk_2  <> '' and
	l.luopiskkoulk_2 = '' and ammopiskkoulk_2 = ''  then l.amkopiskkoulk_2 
	
	else ''

	
	    
	    end),
	    
-- Oppilaitos 1
	(case
	-- lukiokoulutuksen oppilaitos _2
	when l.suorlk = '1' and l.luopisktunn_2 <> '' and l.ammopisktunn_2 = '' and
	l.amkopisktunn_2 = '' and l.yoopisktunn_2 = '' then l.luopisktunn_2 
	-- ammattikoulutuksen oppilaitos _2
	when l.suorlk = '1' and l.luopisktunn_2 = '' and l.ammopisktunn_2 <> '' and
	l.amkopisktunn_2 ='' and l.yoopisktunn_2 = ''  then l.ammopisktunn_2 
	-- lukiokoulutuksen oppilaitos ja ammatillisen koulutuksen oppilaitos, merkitään lukiokoulutuksen oppilaitos _2
	when l.suorlk = '1' and l.luopisktunn_2 <> '' and l.ammopisktunn_2 <> '' and
	l.amkopisktunn_2 = '' and l.yoopisktunn_2 = '' then l.luopisktunn_2
	-- ammattikorkeakoulutuksen oppilaitos _2
	when l.suorlk = '1' and l.amkopisktunn_2  <> '' and l.yoopisktunn_2  = '' and
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = '' then l.amkopisktunn_2
	-- yliopistokoulutuksen oppilaitos _2
	when l.suorlk = '1' and l.amkopisktunn_2 = '' and l.yoopisktunn_2 <> '' and 
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = ''   then l.yoopisktunn_2
	-- ammattikorkeakoulutus ja yliopistokoulutus oppilaitos, merkitään ammattikorkeakoulutus _2  
	when l.suorlk = '1' and l.amkopisktunn_2 <> '' and l.yoopisktunn_2  <> '' and
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = ''  then l.amkopisktunn_2 
	
	
	

	
	else ''
	
	    end),
  --Koulutuksen järjestäjä 1
	(case
	-- lukikoulutuksen järjestäjä _2
	when l.suorlk = '1' and l.luopiskjarj_2  <> '' and l.ammopiskjarj_2 = '' and
	l.amkopiskjarj_2 = '' and yoopiskjarj_2 = '' then l.luopiskjarj_2
	-- ammatillisen koulutuksen järjestäjä _2  
	when l.suorlk = '1' and l.luopiskjarj_2 = '' and l.ammopiskjarj_2 <> '' and
	l.amkopiskjarj_2 ='' and l.yoopiskjarj_2 = ''  then l.ammopiskjarj_2
	-- lukio- ja ammatillisen koulutuksen järjestäjä, merkitään lukiokoulutuksen _2 järjestäjä 
	when l.suorlk = '1' and l.luopiskjarj_2 <> '' and l.ammopiskjarj_2 <> '' and
	l.amkopiskjarj_2 = '' and l.yoopiskjarj_2 = '' then l.luopiskjarj_2
	-- ammattikorkeakoulutuksen järjestäjä _2
	when l.suorlk = '1' and l.amkopiskjarj_2  <> '' and l.yoopiskjarj_2   = '' and
	l.luopiskjarj_2 = '' and l.ammopiskjarj_2 = '' then l.amkopiskjarj_2
	-- yliopistokoulutuksen järjestäjä _2 
	when l.suorlk = '1' and l.amkopiskjarj_2  = '' and l.yoopiskjarj_2  <> '' and 
	l.luopiskjarj_2  = '' and l.ammopiskjarj_2 = ''   then l.yoopiskjarj_2
	-- ammattikorkea- ja yliopistokoulutuksen järjestäjä, merkitään ammattikorkeakoulutuksen _2 järjestäjä   
	when l.suorlk = '1' and l.amkopiskjarj_2  <> '' and l.yoopiskjarj_2   <> '' and
	l.luopiskjarj_2  = '' and l.ammopiskjarj_2  = ''  then l.amkopiskjarj_2 

	
	else ''
	    end),
 --Koulutuksen maakunta 1
	(case
	-- lukioopiskelun maakunta _2
	when l.suorlk = '1' and l.luopiskmaak_2   <> '' and l.ammopiskmaak_2  = '' and
	l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  = '' then l.luopiskmaak_2   
	-- ammatillisen koulutuksen maakunta _2
	when l.suorlk = '1' and l.luopiskmaak_2  = '' and l.ammopiskmaak_2  <> '' and
	l.amkopiskmaak_2  ='' and l.yoopiskmaak_2  = ''  then l.ammopiskmaak_2  
	-- lukiokoulutuksen ja ammatillisen koulutus otetaan lukiokoulutuksen maakunta _2
	when l.suorlk = '1' and l.luopiskmaak_2  <> '' and l.ammopiskmaak_2  <> '' and
	l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  = '' then l.luopiskmaak_2 
    -- ammattikorkeakoulutuksen maakunta _2
	when l.suorlk = '1' and l.amkopiskmaak_2   <> '' and l.yoopiskmaak_2   = '' and
	l.luopiskjarj_2 = '' and l.ammopiskmaak_2 = '' then l.amkopiskmaak_2
	-- yliopistokoulutuksen maakunta _2 
	when l.suorlk = '1' and l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  <> '' and 
	l.luopiskjarj_2  = '' and l.ammopiskmaak_2 = ''   then l.yoopiskmaak_2
	-- ammattikorkekoulutuksen ja yliopistokoulutksen maakunta otetaan ammattikorkeakoulutuksen maakunta _2   
	when l.suorlk = '1' and l.amkopiskmaak_2  <> '' and l.yoopiskmaak_2   <> '' and
	l.luopiskjarj_2  = '' and l.ammopiskmaak_2  = ''  then l.amkopiskmaak_2 
	
	else ''
	
	    end),
-- Koulutus 2
(case
   -- jos lukiokoulutuksessa vain niin jätetään tyhjäksi _2
	when l.suorlk = '1' and l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 = '' and
	l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then ''
	-- jos ammattikoulutuksessa vain  jätetään tyhjäksi _2 
	when l.suorlk = '1' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 <> '' and
	l.amkopiskkoulk_2 ='' and l.yoopiskkoulk_2 = ''  then ''
	-- jos lukiokoulutksessa ja ammattikoulutuksessa merkitään ammattikoulutus _2 
	when l.suorlk = '1' and l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 <> '' and
	l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then l.ammopiskkoulk_2 
	-- jos vain ammattikorkeakoulutuksessa jätetään tyhjäksi
	when l.suorlk = '1' and l.amkopiskkoulk_2  <> '' and l.yoopiskkoulk_2  = '' and
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' then ''
	-- jos yliopistokoulutuksessa vain jätetään tyhjäksi
	when l.suorlk = '1' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 <> '' and 
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = ''   then ''
	-- jos ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään yliopistokoulutus _2
	when l.suorlk = '1' and l.amkopiskkoulk_2 <> '' and l.yoopiskkoulk_2  <> '' and
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = ''  then l.yoopiskkoulk_2
	
	
	
	else ''
	    end),
-- Oppilaitos 2
(case
    -- lukiokoulutuksen oppilaitos vain merkitään tyhjäksi
	when l.suorlk = '1' and l.luopisktunn_2 <> '' and l.ammopisktunn_2 = '' and
	l.amkopisktunn_2 = '' and l.yoopisktunn_2 = '' then ''
	-- ammatillisen koulutuksen oppilaitos _2 merkitään tyhjäksi
	when l.suorlk = '1' and l.luopisktunn_2 = '' and l.ammopisktunn_2 <> '' and
	l.amkopisktunn_2 ='' and l.yoopisktunn_2 = ''  then '' 
	-- lukiokoulutuksen ja ammatillisen koulutuksen oppilaitos merkitään ammatillisen koulutuksen oppilaitos _2
	when l.suorlk = '1' and l.luopisktunn_2 <> '' and l.ammopisktunn_2 <> '' and
	l.amkopisktunn_2 = '' and l.yoopisktunn_2 = '' then l.ammopisktunn_2 
	-- ammattikorkeakoulutksen oppilaitos vain merkitään tyhjäksi _2
	when l.suorlk = '1' and l.amkopisktunn_2  <> '' and l.yoopisktunn_2  = '' and
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = '' then ''
	-- yliopistokoulutksen oppilaitos vain merkitään tyhjäksi _2
	when l.suorlk = '1' and l.amkopisktunn_2 = '' and l.yoopisktunn_2 <> '' and 
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = ''   then ''  
	--  ammattikorkeakoulutksen oppilaitos ja yliopistokoulutuksen oppilaitos, merkitään yliopistokoulutuksen oppilaitos _2
	when l.suorlk = '1' and l.amkopisktunn_2 <> '' and l.yoopisktunn_2  <> '' and
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = ''  then l.yoopisktunn_2 
	
	
	else ''
	    end),
-- Koulutuksen järjestäjä 2
	(case
	-- lukiokoulutuksen järjestäjä vain _2, merkitään tyhjäksi
	when l.suorlk = '1' and l.luopiskjarj_2  <> '' and l.ammopiskjarj_2 = '' and
	l.amkopiskjarj_2 = '' and l.yoopiskjarj_2 = '' then ''
	-- ammatillisen koulutuksen järjestäjä vain _2, merkitään tyhjäksi
	when l.suorlk = '1' and l.luopiskjarj_2 = '' and l.ammopiskjarj_2 <> '' and
	l.amkopiskjarj_2 ='' and l.yoopiskjarj_2 = ''  then ''
	-- lukiokoulutuksen ja ammatillisen koulutuksen järjestäjä, merkitään ammatillisen koulutuksen järjestäjä _2
	when l.suorlk = '1' and l.luopiskjarj_2 <> '' and l.ammopiskjarj_2 <> '' and
	l.amkopiskjarj_2 = '' and l.yoopiskjarj_2 = '' then l.ammopiskjarj_2 
	-- vain ammattikorkeakoulutuksen järjestäjä merkitään tyhjäksi
	when l.suorlk = '1' and l.amkopiskjarj_2  <> '' and l.yoopiskjarj_2   = '' and
	l.luopiskjarj_2 = '' and l.ammopiskjarj_2 = '' then ''
	-- vain yliopistokoulutuksen järjestäjä, merkitään tyhjäksi
	when l.suorlk = '1' and l.amkopiskjarj_2  = '' and l.yoopiskjarj_2  <> '' and 
	l.luopiskjarj_2  = '' and l.ammopiskjarj_2 = ''   then ''
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen järjestäjä merkitään yliopistokoulutuksen järjetäjä _2
	when l.suorlk = '1' and l.amkopiskjarj_2  <> '' and l.yoopiskjarj_2   <> '' and
	l.luopiskjarj_2  = '' and l.ammopiskjarj_2  = ''  then l.yoopiskjarj_2 
	

	else ''
	    end),
-- Koulutuksen maakunta 2
	(case
	-- vain lukiokoulutuksen maakunta _2, jätetään tyhjäksi
	when l.suorlk = '1' and l.luopiskmaak_2   <> '' and l.ammopiskmaak_2  = '' and
	l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  = '' then ''
	-- vain ammatillisen koulutuksen maakunta _2, jätetään tyhjäksi   
	when l.suorlk = '1' and l.luopiskmaak_2  = '' and l.ammopiskmaak_2  <> '' and
	l.amkopiskmaak_2  ='' and l.yoopiskmaak_2  = ''  then ''  
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta, merkitään ammatillisen koulutuksen maakunta _2
	when l.suorlk = '1' and l.luopiskmaak_2  <> '' and l.ammopiskmaak_2  <> '' and
	l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  = '' then l.ammopiskmaak_2 
	-- vain ammattikorkeakoulutuksen maakunta _2, jätetään tyhjäksi
	when l.suorlk = '1' and l.amkopiskmaak_2   <> '' and l.yoopiskmaak_2   = '' and
	l.luopiskmaak_2 = '' and l.ammopiskmaak_2 = '' then '' 
	-- vain yliopistokoulutuksen maakunta _2, merkitään tyhjäksi
	when l.suorlk = '1' and l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  <> '' and 
	l.luopiskmaak_2  = '' and l.ammopiskmaak_2 = ''   then '' 
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen maakunta _2, merkitään yliopistokoulutuksen maakunta _2
	when l.suorlk = '1' and l.amkopiskmaak_2  <> '' and l.yoopiskmaak_2   <> '' and
	l.luopiskjarj_2  = '' and l.ammopiskmaak_2  = ''  then l.yoopiskmaak_2
	

	else ''
	
	    end),
	-- Monihaku
	(case
	-- _2
	when l.monihaku_2 = '' then '90'	
	else l.monihaku_2
	end),
    -- Pääasiallinen toiminta
    (case
    -- _2
	when l.suorlk = '1' then l.ptoim1r4_2
	else ''
	end),
	-- Ammattiasema
	(case
	-- _2
	when l.suorlk = '1' then l.amas_2
	else ''
	end),
    l.lkm,
	l.pohjkoul,
 l.tietolahde,
 'K3.13b',
 l.opintotuki_ulkom_2,
 -- Lukiokoulutuksessa
 (case
	    when (l.suorlk = '1' ) and  l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' then '1'    
	    else '0'
	    end) as lukiokoulutuksessa,
 -- Ammatillisessa koulutuksessa 
 (case
	    when (l.suorlk = '1') and  l.ammopiskkoulk_2  <> '' and l.luopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then '1' 
	    else '0'
	    end) as ammatillisessa_koulutuksessa,
-- Ammattikorkeakoulutuksessa
 (case
	   when (l.suorlk = '1') and  l.amkopiskkoulk_2 <> '' and l.ammopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.luopiskkoulk_2 = '' then  '1'
	   else '0' 
	   end) as ammattikorkeakoulutuksessa,
-- Yliopistokoulutuksessa
 (case
	    when (l.suorlk = '1') and  l.yoopiskkoulk_2  <> '' and l.amkopiskkoulk_2 = '' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' then '1'   	   
	    else '0'
	    end) as yliopistokoulutuksessa,
-- Lukiokoulutuksessa ja ammatillisessa koulutuksessa
(case
	    when (l.suorlk = '1') and  l.luopiskkoulk_2  <> '' and l.ammopiskkoulk_2 <> '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2  = '' then '1'  
	    else '0'
	    end) as lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa,
-- Toisen asteen ammatillisessa koulutuksessa ja korkeakoulutuksessa
(case
	    when (l.suorlk = '1') and  l.ammopiskkoulk_2  <> '' and l.amkopiskkoulk_2 <> '' and l.luopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then '1'  
	    else '0'
	    end) as toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa,
-- Ammattikorkeakoulutuksessa ja yliopistokoulutuksessa
(case
	    when (l.suorlk = '1') and  l.amkopiskkoulk_2  <> '' and l.yoopiskkoulk_2 <> '' and l.ammopiskkoulk_2  = '' and l.luopiskkoulk_2 = ''  then '1' 
	    else '0'
	    end) as ammattikorkekoulutuksessa_ja_yliopistokoulutuksessa,    
-- Koulutuksen päättäneiden toiminta
(case
	   -- Tutkintoon johtavassa koulutuksessa olevat
	   when (l.suorlk = '1')  and (l.ptoim1r4_2 = '22' or l.ptoim1r4_2 = '13')
       and	(l.luopiskkoulk_2 <>'' or l.ammopiskkoulk_2 <>'' or l.amkopiskkoulk_2 <>'' or l.yoopiskkoulk_2 <>'')   then '1' 
	
	   -- Ei tutkintoon johtavassa koulutuksessa olevat
	   when (l.suorlk = '1')  and (l.ptoim1r4_2 = '22' or l.ptoim1r4_2 = '13')
       and	(l.luopiskkoulk_2 ='' and l.ammopiskkoulk_2 ='' and l.amkopiskkoulk_2 ='' and l.yoopiskkoulk_2 ='')   then '2' 
   
   
	   -- Ei opiskelevat työlliset
	   when (l.suorlk = '1')and  l.ptoim1r4_2  = '10'  then '3' 
	   -- Ei opiskelevat työttömät
	   when (l.suorlk = '1') and  l.ptoim1r4_2  = '12'  then '4' 
	   -- Ei opiskelevat muut
		else '5' 
	   end ) as koulutuksen_paattaneiden_toiminta
 ,ika_1v = cast((case 
            when syntv = '' then '-1'
            when  (cast(tilv as int) - cast(syntv as int)) > 99 then ''
            else  ((cast(tilv as int) - cast(syntv as int))) end)  as nvarchar(10))
 ,ika_5v =cast(
       (
		case
		when (cast(tilv as int) - cast(syntv as int)) < 15 then '5v10'
		when ((cast(tilv as int) - cast(syntv as int)) >= 15 and (cast(tilv as int) - cast(syntv as int)) <= 19) then '5v15'
		when ((cast(tilv as int) - cast(syntv as int)) >= 20 and (cast(tilv as int) - cast(syntv as int)) <= 24) then '5v20'
		when ((cast(tilv as int) - cast(syntv as int)) >= 25 and (cast(tilv as int) - cast(syntv as int)) <= 29) then '5v25'
		when ((cast(tilv as int) - cast(syntv as int)) >= 30 and (cast(tilv as int) - cast(syntv as int)) <= 34) then '5v30'
		when ((cast(tilv as int) - cast(syntv as int)) >= 35 and (cast(tilv as int) - cast(syntv as int)) <= 39) then '5v35'
		when ((cast(tilv as int) - cast(syntv as int)) >= 40 and (cast(tilv as int) - cast(syntv as int)) <= 44) then '5v40'
		when ((cast(tilv as int) - cast(syntv as int)) >= 45 and (cast(tilv as int) - cast(syntv as int)) <= 49) then '5v45'
		when ((cast(tilv as int) - cast(syntv as int)) >= 50 and (cast(tilv as int) - cast(syntv as int)) <= 54) then '5v50'
		when ((cast(tilv as int) - cast(syntv as int)) >= 55 and (cast(tilv as int) - cast(syntv as int)) <= 59) then '5v55'
		when ((cast(tilv as int) - cast(syntv as int)) >= 60 and (cast(tilv as int) - cast(syntv as int)) <= 64) then '5v60'
		when ((cast(tilv as int) - cast(syntv as int)) >= 65 and (cast(tilv as int) - cast(syntv as int)) <= 69) then '5v65'
		when ((cast(tilv as int) - cast(syntv as int)) >= 70 and (cast(tilv as int) - cast(syntv as int)) <= 74) then '5v70'
		when ((cast(tilv as int) - cast(syntv as int)) >= 75 and (cast(tilv as int) - cast(syntv as int)) <= 79) then '5v75'
		when ((cast(tilv as int) - cast(syntv as int)) >= 80 and (cast(tilv as int) - cast(syntv as int)) <= 84) then '5v80'
		when ((cast(tilv as int) - cast(syntv as int)) >= 85 and (cast(tilv as int) - cast(syntv as int)) <= 89) then '5v85'
		when ((cast(tilv as int) - cast(syntv as int)) >= 90 and (cast(tilv as int) - cast(syntv as int)) <= 94) then '5v90'
		when ((cast(tilv as int) - cast(syntv as int)) >= 95) then '5v95'
		
		end
	   ) as nvarchar (10))

  ,ika_1v_suorv = cast(
					(case 
						when syntv = '' then '-1' 
						else ((cast(suorv as int) - cast(syntv as int))) 
					end)  
	as nvarchar(10))




--uudet muuttujat 03/2018

,case
	when  l.suorlk = '1' and (l.luopiskkoulk_1 <> '' or l.luopiskkoulk_2 <> '') then 1
	else 0
end as opisk_lu
--Opiskellut ammatillisessa peruskoulutuksessa
,case
	when  l.suorlk = '1' and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and (d1c.Koulutusaste_taso2_koodi = '32' or d2c.Koulutusaste_taso2_koodi = '32') then 1
	else 0
end as opisk_amm_pk
--Opiskellut ammattitutkintokoulutuksessa
,case
	when  l.suorlk = '1' and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and (d1c.Koulutusaste_taso2_koodi = '33' or d2c.Koulutusaste_taso2_koodi = '33') then 1
	else 0
end as opisk_amm_at
--Opiskellut erikoisammattitutkintokoulutuksessa
,case
	when  l.suorlk = '1' and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and (d1c.Koulutusaste_taso2_koodi = '41' or d2c.Koulutusaste_taso2_koodi = '41') then 1
	else 0
end as opisk_amm_eat
--Opiskellut ammatillisessa koulutuksessa
,case
	when  l.suorlk = '1' and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') then 1
	else 0
end as opisk_amm
--Opiskellut ammattikorkeakoulutuksessa
,case
	when  l.suorlk = '1' and (l.amkopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '') then 1
	else 0
end as opisk_amk
--Opiskellut yliopistokoulutuksessa
,case
	when  l.suorlk = '1' and (l.yoopiskkoulk_1 <> '' or l.yoopiskkoulk_2 <> '') then 1
	else 0
end as opisk_yo



----KOULUTUSALA, TASO 1 KYLLÄ/EI
--Opiskellut koulutusala1 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '01' or d2a.iscfibroad2013_koodi = '01') then 1
	else 0
end as opisk_amk_koulala1
--Opiskellut koulutusala2 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '02' or d2a.iscfibroad2013_koodi = '02') then 1
	else 0
end as opisk_amk_koulala2
--Opiskellut koulutusala3 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '03' or d2a.iscfibroad2013_koodi = '03') then 1
	else 0
end as opisk_amk_koulala3
--Opiskellut koulutusala4 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '04' or d2a.iscfibroad2013_koodi = '04') then 1
	else 0
end as opisk_amk_koulala4
--Opiskellut koulutusala5 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '05' or d2a.iscfibroad2013_koodi = '05') then 1
	else 0
end as opisk_amk_koulala5
--Opiskellut koulutusala6 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '06' or d2a.iscfibroad2013_koodi = '06') then 1
	else 0
end as opisk_amk_koulala6
--Opiskellut koulutusala7 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '07' or d2a.iscfibroad2013_koodi = '07') then 1
	else 0
end as opisk_amk_koulala7
--Opiskellut koulutusala8 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '08' or d2a.iscfibroad2013_koodi = '08') then 1
	else 0
end as opisk_amk_koulala8
--Opiskellut koulutusala9 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '09' or d2a.iscfibroad2013_koodi = '09') then 1
	else 0
end as opisk_amk_koulala9
--Opiskellut koulutusala10 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '10' or d2a.iscfibroad2013_koodi = '10') then 1
	else 0
end as opisk_amk_koulala10




--Opiskellut koulutusala1 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '01' or d2b.iscfibroad2013_koodi = '01') then 1
	else 0
end as opisk_yo_koulala1
--Opiskellut koulutusala2 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '02' or d2b.iscfibroad2013_koodi = '02') then 1
	else 0
end as opisk_yo_koulala2
--Opiskellut koulutusala3 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '03' or d2b.iscfibroad2013_koodi = '03') then 1
	else 0
end as opisk_yo_koulala3
--Opiskellut koulutusala4 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '04' or d2b.iscfibroad2013_koodi = '04') then 1
	else 0
end as opisk_yo_koulala4
--Opiskellut koulutusala5 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '05' or d2b.iscfibroad2013_koodi = '05') then 1
	else 0
end as opisk_yo_koulala5
--Opiskellut koulutusala6 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '06' or d2b.iscfibroad2013_koodi = '06') then 1
	else 0
end as opisk_yo_koulala6
--Opiskellut koulutusala7 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '07' or d2b.iscfibroad2013_koodi = '07') then 1
	else 0
end as opisk_yo_koulala7
--Opiskellut koulutusala8 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '08' or d2b.iscfibroad2013_koodi = '08') then 1
	else 0
end as opisk_yo_koulala8
--Opiskellut koulutusala9 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '09' or d2b.iscfibroad2013_koodi = '09') then 1
	else 0
end as opisk_yo_koulala9
--Opiskellut koulutusala10 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '10' or d2b.iscfibroad2013_koodi = '10') then 1
	else 0
end as opisk_yo_koulala10



--Opiskellut useampaa kuin yhtä alaa (taso 1) (kyllä/ei)
,case --ensimmäisenä vuotena on mahdollista olla vain yksi ala
	when  l.suorlk = '1' and m1.MinValue <> m1.MaxValue then 1 
	else 0
end as opisk_vah2_koulala


----HAUT KYLLÄ/EI
--Hakenut ammatilliseen koulutukseen
,case
	when  l.suorlk = '1' and (l.monihaku_1 in (2,3,5,0,8,9) or l.monihaku_2 in (2,3,5,0,8,9)) then 1
	else 0
end as haku_amm
--Hakenut ammattikorkeakoulutukseen
,case
	when  l.suorlk = '1' and (l.monihaku_1 in (4,6,0,8) or l.monihaku_2 in (4,6,0,8)) then 1
	else 0
end as haku_amk
--Hakenut yliopistokoulutukseen
,case
	when  l.suorlk = '1' and (l.monihaku_1 in (6,7,0,9) or l.monihaku_2 in (6,7,0,9)) then 1
	else 0
end as haku_yo




----MITTARIT
--Ei hakenut eikä opiskellut mitään
,case
	when  l.suorlk = '1' and
	monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and
	l.luopiskkoulk_1 = '' and l.ammopiskkoulk_1 = '' and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end eihaku_kk_eiopisk

--Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa
,case 
	when  l.suorlk = '1' and
	monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and
	(l.luopiskkoulk_1 <> '' or l.ammopiskkoulk_1 <> '' or l.luopiskkoulk_2 <> '' or l.ammopiskkoulk_2 <> '') and 
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_ta

----Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut lukiokoulutuksessa
,case 
	when  l.suorlk = '1' and
	monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and
	(l.luopiskkoulk_1 <> '' or l.luopiskkoulk_2 <> '') and
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = ''  then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_lu

----Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut ammatillisessa peruskoulutuksessa
,case 
	when  l.suorlk = '1' and 
	monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and
	(l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and 
	(d1c.Koulutusaste_taso2_koodi = '32' or d2c.Koulutusaste_taso2_koodi = '32') and
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_pk

------Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut ammattitutkintokoulutuksessa
,case 
	when  l.suorlk = '1' and
	monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and
	(l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and
	(d1c.Koulutusaste_taso2_koodi = '33' or d2c.Koulutusaste_taso2_koodi = '33') and
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_at

------Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut erikoisammattitutkintokoulutuksessa
,case 
	when  l.suorlk = '1' and 
	monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and
	(l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and
	(d1c.Koulutusaste_taso2_koodi = '41' or d2c.Koulutusaste_taso2_koodi = '41') and
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_eat

--Hakenut korkea-asteelle, ei opiskellut korkea-asteella
,case 
	when  l.suorlk = '1' and
	(monihaku_1 in (4,5,6,7,0,8,9) or monihaku_2 in (4,5,6,7,0,8,9)) and 
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end haku_kk_eiopisk_kk
----Hakenut korkea-asteelle, ei opiskellut korkea-asteella, ei-opiskellut toisen asteen koulutuksessa
,case
	when  l.suorlk = '1' and 
	(monihaku_1 in (4,5,6,7,0,8,9) or monihaku_2 in (4,5,6,7,0,8,9)) and
	l.luopiskkoulk_1 = '' and l.ammopiskkoulk_1 = '' and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end haku_kk_eiopisk_kk_eiopisk_ta
----Hakenut korkea-asteelle, ei opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa
,case
	when  l.suorlk = '1' and
	(monihaku_1 in (4,5,6,7,0,8,9) or monihaku_2 in (4,5,6,7,0,8,9)) and
	(l.luopiskkoulk_1 <> '' or l.ammopiskkoulk_1 <> '' or l.luopiskkoulk_2 <> '' or l.ammopiskkoulk_2 <> '') and
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end haku_kk_eiopisk_kk_opisk_ta
----Hakenut vain ammattikorkeakouluun, ei opiskellut korkea-asteella
,case
	when  l.suorlk = '1' and
	(monihaku_1 in (4,8) or monihaku_2 in (4,8)) and
	(monihaku_1 not in (5,6,7,0,9) and monihaku_2 not in (5,6,7,0,9)) and
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end haku_amk_eiopisk_kk
----Hakenut vain yliopistokoulutukseen, ei opiskellut korkea-asteella
,case
	when  l.suorlk = '1' and
	(monihaku_1 in (7,9) or monihaku_2 in (7,9)) and
	(monihaku_1 not in (4,5,6,0,8) and monihaku_2 not in (4,5,6,0,8)) and
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end haku_yo_eiopisk_kk
----Hakenut sekä amk- että yliopistokoulutukseen, ei opiskellut korkea-asteella
,case
	when  l.suorlk = '1' and 
	(monihaku_1 in (6,0) or monihaku_2 in (6,0) or
	((monihaku_1 in (4,8) or monihaku_2 in (4,8)) and
	(monihaku_1 in (7,9) or monihaku_2 in (7,9)))) and
	l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end haku_amkyo_eiopisk_kk

--Opiskellut korkea-asteella
,case
	when  l.suorlk = '1' and
	(l.amkopiskkoulk_1 <> '' or l.yoopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '' or l.yoopiskkoulk_2 <> '') then 1
	else 0
end opisk_kk
----Opiskellut korkea-asteella, ei-opiskellut toisen asteen koulutuksessa
,case
	when  l.suorlk = '1' and
	l.luopiskkoulk_1 = '' and l.ammopiskkoulk_1 = '' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' and
	(l.amkopiskkoulk_1 <> '' or l.yoopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '' or l.yoopiskkoulk_2 <> '') then 1
	else 0
end opisk_kk_eiopisk_ta
----Opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa
,case
	when  l.suorlk = '1' and
	(l.luopiskkoulk_1 <> '' or l.ammopiskkoulk_1 <> '' or l.luopiskkoulk_2 <> '' or l.ammopiskkoulk_2 <> '') and
	(l.amkopiskkoulk_1 <> '' or l.yoopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '' or l.yoopiskkoulk_2 <> '') then 1
	else 0
end opisk_kk_opisk_ta
----Opiskellut vain ammattikorkeakoulussa
,case
	when  l.suorlk = '1' and
	(l.amkopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '') and
	l.yoopiskkoulk_1 = '' and l.yoopiskkoulk_2 = '' then 1
	else 0
end opisk_vain_amk
----Opiskellut vain yliopistokoulutuksessa
,case
	when  l.suorlk = '1' and
	l.amkopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and
	(l.yoopiskkoulk_1 <> '' or l.yoopiskkoulk_2 <> '') then 1
	else 0
end opisk_vain_yo
----Opiskellut sekä amk- että yliopistokoulutuksessa
,case
	when  l.suorlk = '1' and
	(l.amkopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '') and
	(l.yoopiskkoulk_1 <> '' or l.yoopiskkoulk_2 <> '') then 1
	else 0
end opisk_amkyo





FROM 
    (
	
	select * from [VipunenTK_DW].[dbo].[sa_K3_13b_Perusk_paattaneet_amm_tutk_suorittaneet]
	where suorlk = '1'
	) as l


LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d1a on d1a.koulutusluokitus_avain=l.amkopiskkoulk_1
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d2a on d2a.koulutusluokitus_avain=l.amkopiskkoulk_2

LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d1b on d1b.koulutusluokitus_avain=l.yoopiskkoulk_1
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d2b on d2b.koulutusluokitus_avain=l.yoopiskkoulk_2

LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d1c on d1c.koulutusluokitus_avain=l.ammopiskkoulk_1
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d2c on d2c.koulutusluokitus_avain=l.ammopiskkoulk_2


CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d1a.iscfibroad2013_koodi),(d1b.iscfibroad2013_koodi), (d2a.iscfibroad2013_koodi),(d2b.iscfibroad2013_koodi)) AS a(d)) m1


	WHERE 1=1



GO

