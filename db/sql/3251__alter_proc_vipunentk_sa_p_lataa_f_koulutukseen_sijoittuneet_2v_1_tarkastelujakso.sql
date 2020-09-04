USE [VipunenTK_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_koulutukseen_sijoittuneet_2v_1_tarkastelujakso]    Script Date: 4.9.2020 20:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_f_koulutukseen_sijoittuneet_2v_1_tarkastelujakso] AS


/*declare @debug_what_to_run tinyint; set @debug_what_to_run=2; -- käytä arvoa 3 vain kun teet yhden vuoden
print '$'+convert(varchar,sysdatetime(),20)+'$ '+'DEBUG (what to run)='+cast(@debug_what_to_run as varchar)+
': 0=luo vain taulut, älä tulosta mitään; 1=luo taulut ja tulosta joitakin merkittävimpiä välivaiheita; 2=luo taulut ja tulosta välivaiheet; 3=luo taulut, tulosta välivaiheet ja tulosta myös tulokset, 4=tulosta välivaiheet, mutta älä tee mitään';



-- lisätään data
if @debug_what_to_run not in (4) begin
if @debug_what_to_run>0 print 'inserting data';

-- parametrimuuttujien arvot
-- parametrimuuttujat
DECLARE @ensimmainen_suoritusvuosi int;
DECLARE @toinen_suoritusvuosi int;
DECLARE @kolmas_suoritusvuosi int;
DECLARE @neljas_suoritusvuosi int;
DECLARE @viides_suoritusvuosi int;
DECLARE @kuudes_suoritusvuosi int;
DECLARE @seitsemas_suoritusvuosi int;
DECLARE @kahdeksas_suoritusvuosi int;

set @ensimmainen_suoritusvuosi = 2008;
set @toinen_suoritusvuosi = 2009;
set @kolmas_suoritusvuosi = 2010;
set @neljas_suoritusvuosi = 2011;
set @viides_suoritusvuosi = 2012;
set @kuudes_suoritusvuosi = 2013;
set @seitsemas_suoritusvuosi = 2014;
set @kahdeksas_suoritusvuosi = 2015;

*/

DECLARE @maxVuosi int;
SET @maxVuosi = (select max(suorv) from [VipunenTK_SA].[dbo].[v_K3_12_Perusk_paattaneet_amm_tutk_suorittaneet]);

INSERT INTO [VipunenTK_DW].[dbo].[_koulutukseen_sijoittuneet_2v_tarkastelu]
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
    --lukiokoulutuksessa
	when  l.suorlk = '1' and l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 = '' and
	l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then l.luopiskkoulk_2 
	-- ammattikoulutuksessa _2
	when  l.suorlk = '1' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 <> '' and
	l.amkopiskkoulk_2 ='' and l.yoopiskkoulk_2 = ''  then l.ammopiskkoulk_2 
	--lukiokoulutuksessa ja ammattillisessa koulutuksessa, otetaan tieto lukiokoulutuksen _2 ensim. koulutustietoihin
	when  l.suorlk = '1' and l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 <> '' and
	l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then l.luopiskkoulk_2
	-- ammattikorkeakoulutuksessa _2
	when  l.suorlk = '1' and l.amkopiskkoulk_2  <> '' and l.yoopiskkoulk_2  = '' and
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' then l.amkopiskkoulk_2
	-- yliopistokoulutuksessa _2
	when  l.suorlk = '1' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 <> '' and 
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = ''   then l.yoopiskkoulk_2
	-- ammattikorkeakoulutuksessa ja yliopistokoulutuksessa, merkitään ensimmäiseen koulutustietoihin ammattikorkeakoulutus  
	when  l.suorlk = '1' and l.amkopiskkoulk_2 <> '' and l.yoopiskkoulk_2  <> '' and
	l.luopiskkoulk_2 = '' and ammopiskkoulk_2 = ''  then l.amkopiskkoulk_2 		
	else ''	    
	    end),
	    
-- Oppilaitos 1
	(case
	-- lukiokoulutuksen oppilaitos
	when  l.suorlk = '1' and l.luopisktunn_2 <> '' and l.ammopisktunn_2 = '' and
	l.amkopisktunn_2 = '' and l.yoopisktunn_2 = '' then l.luopisktunn_2 
	-- ammattikoulutuksen oppilaitos _2
	when  l.suorlk = '1' and l.luopisktunn_2 = '' and l.ammopisktunn_2 <> '' and
	l.amkopisktunn_2 ='' and l.yoopisktunn_2 = ''  then l.ammopisktunn_2 
	-- lukiokoulutuksen oppilaitos ja ammatillisen koulutuksen oppilaitos, merkitään lukiokoulutuksen oppilaitos _2
	when  l.suorlk = '1' and l.luopisktunn_2 <> '' and l.ammopisktunn_2 <> '' and
	l.amkopisktunn_2 = '' and l.yoopisktunn_2 = '' then l.luopisktunn_2
	-- ammattikorkeakoulutuksen oppilaitos _2
	when  l.suorlk = '1' and l.amkopisktunn_2  <> '' and l.yoopisktunn_2  = '' and
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = '' then l.amkopisktunn_2
	-- yliopistokoulutuksen oppilaitos _2
	when  l.suorlk = '1' and l.amkopisktunn_2 = '' and l.yoopisktunn_2 <> '' and 
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = ''   then l.yoopisktunn_2
	-- ammattikorkeakoulutus ja yliopistokoulutus oppilaitos, merkitään ammattikorkeakoulutus _2  
	when  l.suorlk = '1' and l.amkopisktunn_2 <> '' and l.yoopisktunn_2  <> '' and
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = ''  then l.amkopisktunn_2 	
	else ''
	    end),

  --Koulutuksen järjestäjä 1
	(case
	-- lukikoulutuksen järjestäjä
	when  l.suorlk = '1' and l.luopiskjarj_2  <> '' and l.ammopiskjarj_2 = '' and
	l.amkopiskjarj_2 = '' and yoopiskjarj_2 = '' then l.luopiskjarj_2
	-- ammatillisen koulutuksen järjestäjä _2  
	when  l.suorlk = '1' and l.luopiskjarj_2 = '' and l.ammopiskjarj_2 <> '' and
	l.amkopiskjarj_2 ='' and l.yoopiskjarj_2 = ''  then l.ammopiskjarj_2
	-- lukio- ja ammatillisen koulutuksen järjestäjä, merkitään lukiokoulutuksen _2 järjestäjä 
	when  l.suorlk = '1' and l.luopiskjarj_2 <> '' and l.ammopiskjarj_2 <> '' and
	l.amkopiskjarj_2 = '' and l.yoopiskjarj_2 = '' then l.luopiskjarj_2
	-- ammattikorkeakoulutuksen järjestäjä _2
	when  l.suorlk = '1' and l.amkopiskjarj_2  <> '' and l.yoopiskjarj_2   = '' and
	l.luopiskjarj_2 = '' and l.ammopiskjarj_2 = '' then l.amkopiskjarj_2
	-- yliopistokoulutuksen järjestäjä _2 
	when  l.suorlk = '1' and l.amkopiskjarj_2  = '' and l.yoopiskjarj_2  <> '' and 
	l.luopiskjarj_2  = '' and l.ammopiskjarj_2 = ''   then l.yoopiskjarj_2
	-- ammattikorkea- ja yliopistokoulutuksen järjestäjä, merkitään ammattikorkeakoulutuksen _2 järjestäjä   
	when  l.suorlk = '1' and l.amkopiskjarj_2  <> '' and l.yoopiskjarj_2   <> '' and
	l.luopiskjarj_2  = '' and l.ammopiskjarj_2  = ''  then l.amkopiskjarj_2 
	else ''
	    end),

 --Koulutuksen maakunta 1
	(case
	-- lukioopiskelun maakunta 
	when  l.suorlk = '1' and l.luopiskmaak_2   <> '' and l.ammopiskmaak_2  = '' and
	l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  = '' then l.luopiskmaak_2   
	-- ammatillisen koulutuksen maakunta _2
	when  l.suorlk = '1' and l.luopiskmaak_2  = '' and l.ammopiskmaak_2  <> '' and
	l.amkopiskmaak_2  ='' and l.yoopiskmaak_2  = ''  then l.ammopiskmaak_2  
	-- lukiokoulutuksen ja ammatillisen koulutus otetaan lukiokoulutuksen maakunta _2
	when  l.suorlk = '1' and l.luopiskmaak_2  <> '' and l.ammopiskmaak_2  <> '' and
	l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  = '' then l.luopiskmaak_2 
    -- ammattikorkeakoulutuksen maakunta _2
	when  l.suorlk = '1' and l.amkopiskmaak_2   <> '' and l.yoopiskmaak_2   = '' and
	l.luopiskjarj_2 = '' and l.ammopiskmaak_2 = '' then l.amkopiskmaak_2
	-- yliopistokoulutuksen maakunta _2 
	when  l.suorlk = '1' and l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  <> '' and 
	l.luopiskjarj_2  = '' and l.ammopiskmaak_2 = ''   then l.yoopiskmaak_2
	-- ammattikorkekoulutuksen ja yliopistokoulutksen maakunta otetaan ammattikorkeakoulutuksen maakunta _2   
	when  l.suorlk = '1' and l.amkopiskmaak_2  <> '' and l.yoopiskmaak_2   <> '' and
	l.luopiskjarj_2  = '' and l.ammopiskmaak_2  = ''  then l.amkopiskmaak_2 
	else ''	
	    end),

-- Koulutus 2
(case
   -- jos lukiokoulutuksessa vain niin jätetään tyhjäksi
	when  l.suorlk = '1' and l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 = '' and
	l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then ''
	-- jos ammattikoulutuksessa vain  jätetään tyhjäksi _2 
	when  l.suorlk = '1' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 <> '' and
	l.amkopiskkoulk_2 ='' and l.yoopiskkoulk_2 = ''  then ''
	-- jos lukiokoulutksessa ja ammattikoulutuksessa merkitään ammattikoulutus _2 
	when  l.suorlk = '1' and l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 <> '' and
	l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then l.ammopiskkoulk_2 
	-- jos vain ammattikorkeakoulutuksessa jätetään tyhjäksi
	when  l.suorlk = '1' and l.amkopiskkoulk_2  <> '' and l.yoopiskkoulk_2  = '' and
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' then ''
	-- jos yliopistokoulutuksessa vain jätetään tyhjäksi
	when  l.suorlk = '1' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 <> '' and 
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = ''   then ''
	-- jos ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään yliopistokoulutus _2
	when  l.suorlk = '1' and l.amkopiskkoulk_2 <> '' and l.yoopiskkoulk_2  <> '' and
	l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = ''  then l.yoopiskkoulk_2
	else ''
	    end),

-- Oppilaitos 2
(case
    -- lukiokoulutuksen oppilaitos vain merkitään tyhjäksi
	when  l.suorlk = '1' and l.luopisktunn_2 <> '' and l.ammopisktunn_2 = '' and
	l.amkopisktunn_2 = '' and l.yoopisktunn_2 = '' then ''
	-- ammatillisen koulutuksen oppilaitos _2 merkitään tyhjäksi
	when  l.suorlk = '1' and l.luopisktunn_2 = '' and l.ammopisktunn_2 <> '' and
	l.amkopisktunn_2 ='' and l.yoopisktunn_2 = ''  then '' 
	-- lukiokoulutuksen ja ammatillisen koulutuksen oppilaitos merkitään ammatillisen koulutuksen oppilaitos _2
	when  l.suorlk = '1' and l.luopisktunn_2 <> '' and l.ammopisktunn_2 <> '' and
	l.amkopisktunn_2 = '' and l.yoopisktunn_2 = '' then l.ammopisktunn_2 
	-- ammattikorkeakoulutksen oppilaitos vain merkitään tyhjäksi _2
	when  l.suorlk = '1' and l.amkopisktunn_2  <> '' and l.yoopisktunn_2  = '' and
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = '' then ''
	-- yliopistokoulutksen oppilaitos vain merkitään tyhjäksi _2
	when  l.suorlk = '1' and l.amkopisktunn_2 = '' and l.yoopisktunn_2 <> '' and 
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = ''   then ''  
	--  ammattikorkeakoulutksen oppilaitos ja yliopistokoulutuksen oppilaitos, merkitään yliopistokoulutuksen oppilaitos _2
	when  l.suorlk = '1' and l.amkopisktunn_2 <> '' and l.yoopisktunn_2  <> '' and
	l.luopisktunn_2 = '' and l.ammopisktunn_2 = ''  then l.yoopisktunn_2 
	else ''
	    end),

-- Koulutuksen järjestäjä 2
	(case
	-- lukiokoulutuksen järjestäjä vain _2, merkitään tyhjäksi
	when  l.suorlk = '1' and l.luopiskjarj_2  <> '' and l.ammopiskjarj_2 = '' and
	l.amkopiskjarj_2 = '' and l.yoopiskjarj_2 = '' then ''
	-- ammatillisen koulutuksen järjestäjä vain _2, merkitään tyhjäksi
	when  l.suorlk = '1' and l.luopiskjarj_2 = '' and l.ammopiskjarj_2 <> '' and
	l.amkopiskjarj_2 ='' and l.yoopiskjarj_2 = ''  then ''
	-- lukiokoulutuksen ja ammatillisen koulutuksen järjestäjä, merkitään ammatillisen koulutuksen järjestäjä _2
	when  l.suorlk = '1' and l.luopiskjarj_2 <> '' and l.ammopiskjarj_2 <> '' and
	l.amkopiskjarj_2 = '' and l.yoopiskjarj_2 = '' then l.ammopiskjarj_2 
	-- vain ammattikorkeakoulutuksen järjestäjä merkitään tyhjäksi
	when  l.suorlk = '1' and l.amkopiskjarj_2  <> '' and l.yoopiskjarj_2   = '' and
	l.luopiskjarj_2 = '' and l.ammopiskjarj_2 = '' then ''
	-- vain yliopistokoulutuksen järjestäjä, merkitään tyhjäksi
	when  l.suorlk = '1' and l.amkopiskjarj_2  = '' and l.yoopiskjarj_2  <> '' and 
	l.luopiskjarj_2  = '' and l.ammopiskjarj_2 = ''   then ''
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen järjestäjä merkitään yliopistokoulutuksen järjetäjä _2
	when  l.suorlk = '1' and l.amkopiskjarj_2  <> '' and l.yoopiskjarj_2   <> '' and
	l.luopiskjarj_2  = '' and l.ammopiskjarj_2  = ''  then l.yoopiskjarj_2 	
	else ''
	    end),

-- Koulutuksen maakunta 2
	(case
	-- vain lukiokoulutuksen maakunta _2, jätetään tyhjäksi
	when  l.suorlk = '1' and l.luopiskmaak_2   <> '' and l.ammopiskmaak_2  = '' and
	l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  = '' then ''
	-- vain ammatillisen koulutuksen maakunta _2, jätetään tyhjäksi   
	when  l.suorlk = '1' and l.luopiskmaak_2  = '' and l.ammopiskmaak_2  <> '' and
	l.amkopiskmaak_2  ='' and l.yoopiskmaak_2  = ''  then ''  
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta, merkitään ammatillisen koulutuksen maakunta _2
	when  l.suorlk = '1' and l.luopiskmaak_2  <> '' and l.ammopiskmaak_2  <> '' and
	l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  = '' then l.ammopiskmaak_2 
	-- vain ammattikorkeakoulutuksen maakunta _2, jätetään tyhjäksi
	when  l.suorlk = '1' and l.amkopiskmaak_2   <> '' and l.yoopiskmaak_2   = '' and
	l.luopiskmaak_2 = '' and l.ammopiskmaak_2 = '' then '' 
	-- vain yliopistokoulutuksen maakunta _2, merkitään tyhjäksi
	when  l.suorlk = '1' and l.amkopiskmaak_2  = '' and l.yoopiskmaak_2  <> '' and 
	l.luopiskmaak_2  = '' and l.ammopiskmaak_2 = ''   then '' 
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen maakunta _2, merkitään yliopistokoulutuksen maakunta _2
	when  l.suorlk = '1' and l.amkopiskmaak_2  <> '' and l.yoopiskmaak_2   <> '' and
	l.luopiskjarj_2  = '' and l.ammopiskmaak_2  = ''  then l.yoopiskmaak_2
	else ''
	    end),

	-- Monihaku
	(case
	-- 2009
	when l.monihaku_2 = '' then '90'
	else l.monihaku_2
	end),

    -- Pääasiallinen toiminta
    (case when l.suorlk = '1' then l.ptoim1r4_2 else '' end),

	-- Ammattiasema
	(case when  l.suorlk = '1' then l.amas_2 else '' end),
    l.lkm,
     (case when l.pohjkoul= '' then '' when l.pohjkoul is NULL then '' else l.pohjkoul end ),
 l.tietolahde,
 'K3.12',
 -- Lukiokoulutuksessa
 (case
	    when  (l.suorlk = '1' ) and  l.luopiskkoulk_2 <> '' and l.ammopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' then '1'  
	    else '0'
	    end) as lukiokoulutuksessa,
 -- Ammatillisessa koulutuksessa 
 (case
	    when  (l.suorlk = '1') and  l.ammopiskkoulk_2  <> '' and l.luopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then '1' 
	    else '0'
	    end) as ammatillisessa_koulutuksessa,
-- Ammattikorkeakoulutuksessa
 (case
	   when  (l.suorlk = '1') and  l.amkopiskkoulk_2 <> '' and l.ammopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.luopiskkoulk_2 = '' then  '1'
	   else '0' 
	   end) as ammattikorkeakoulutuksessa,
-- Yliopistokoulutuksessa
 (case
	    when  (l.suorlk = '1') and  l.yoopiskkoulk_2  <> '' and l.amkopiskkoulk_2 = '' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' then '1' 
	    else '0'
	    end) as yliopistokoulutuksessa,
-- Lukiokoulutuksessa ja ammatillisessa koulutuksessa
(case
	    when  (l.suorlk = '1') and  l.luopiskkoulk_2  <> '' and l.ammopiskkoulk_2 <> '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2  = '' then '1'  
	    else '0'
	    end) as lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa,
-- Toisen asteen ammatillisessa koulutuksessa ja korkeakoulutuksessa
(case
	    when  (l.suorlk = '1') and  l.ammopiskkoulk_2  <> '' and l.amkopiskkoulk_2 <> '' and l.luopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then '1' 
	    else '0'
	    end) as toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa,
-- Ammattikorkeakoulutuksessa ja yliopistokoulutuksessa
(case
	    when  (l.suorlk = '1') and  l.amkopiskkoulk_2  <> '' and l.yoopiskkoulk_2 <> '' and l.ammopiskkoulk_2  = '' and l.luopiskkoulk_2 = ''  then '1' 
	    else '0'
	    end) as ammattikorkekoulutuksessa_ja_yliopistokoulutuksessa,    
-- Koulutuksen päättäneiden toiminta
(case
	   -- Tutkintoon johtavassa koulutuksessa olevat
	   when (l.suorlk = '1') 
	   and (l.ptoim1r4_2 = '22' or l.ptoim1r4_2 = '13')
	   and (l.luopiskkoulk_2 <>'' or l.ammopiskkoulk_2 <>'' or l.amkopiskkoulk_2 <>'' or l.yoopiskkoulk_2 <>'') then '1' 

	  -- Ei tutkintoon johtavassa koulutuksessa olevat
	   when  (l.suorlk = '1') 
	   and (l.ptoim1r4_2 = '22' or l.ptoim1r4_2 = '13')
	   and (l.luopiskkoulk_2 ='' and l.ammopiskkoulk_2 ='' and l.amkopiskkoulk_2 ='' and l.yoopiskkoulk_2 ='') then '2' 
	 
	   -- Ei opiskelevat työlliset
	   when (l.suorlk = '1')and  l.ptoim1r4_2  = '10'  then '3' 
	   -- Ei opiskelevat työttömät
	   when  (l.suorlk = '1') and  l.ptoim1r4_2  = '12'  then '4' 
	   --  
	   -- Ei opiskelevat muut
		else '5' 
	   end ) as koulutuksen_paattaneiden_toiminta
 ,ika_1v = cast((case 
            when syntv = '' then '-1' else  ((cast(tilv as int) - cast(syntv as int))) end)  as nvarchar(10))
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
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk_2 <> '' or l.luopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '') then 1*/
	else 0
end as opisk_lu
--Opiskellut ammatillisessa peruskoulutuksessa
,case
	when  l.suorlk = '1' and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and (d1c.Koulutusaste_taso2_koodi = '32' or d2c.Koulutusaste_taso2_koodi = '32') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk_2 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '32' or d3c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '32' or d4c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '32' or d5c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '32' or d6c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '32' or d7c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '32' or d8c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d8c.Koulutusaste_taso2_koodi = '32' or d9c.Koulutusaste_taso2_koodi = '32') then 1*/
	else 0
end as opisk_amm_pk
--Opiskellut ammattitutkintokoulutuksessa
,case
	when  l.suorlk = '1' and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and (d1c.Koulutusaste_taso2_koodi = '33' or d2c.Koulutusaste_taso2_koodi = '33') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk_2 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '33' or d3c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '33' or d4c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '33' or d5c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '33' or d6c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '33' or d7c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '33' or d8c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d8c.Koulutusaste_taso2_koodi = '33' or d9c.Koulutusaste_taso2_koodi = '33') then 1*/
	else 0
end as opisk_amm_at
--Opiskellut erikoisammattitutkintokoulutuksessa
,case
	when  l.suorlk = '1' and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and (d1c.Koulutusaste_taso2_koodi = '41' or d2c.Koulutusaste_taso2_koodi = '41') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk_2 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '41' or d3c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '41' or d4c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '41' or d5c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '41' or d6c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '41' or d7c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '41' or d8c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d8c.Koulutusaste_taso2_koodi = '41' or d9c.Koulutusaste_taso2_koodi = '41') then 1*/
	else 0
end as opisk_amm_eat
--Opiskellut ammatillisessa koulutuksessa
,case
	when  l.suorlk = '1' and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk_2 <> '' or l.ammopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') then 1*/
	else 0
end as opisk_amm
--Opiskellut ammattikorkeakoulutuksessa
,case
	when  l.suorlk = '1' and (l.amkopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk_2 <> '' or l.amkopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '') then 1*/
	else 0
end as opisk_amk
--Opiskellut yliopistokoulutuksessa
,case
	when  l.suorlk = '1' and (l.yoopiskkoulk_1 <> '' or l.yoopiskkoulk_2 <> '') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk_2 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2010 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2011 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2012 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2013 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2014 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2015 <> '' or l.yoopiskkoulk2016 <> '') then 1*/
	else 0
end as opisk_yo



----KOULUTUSALA, TASO 1 KYLLÄ/EI
--Opiskellut koulutusala1 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '01' or d2a.iscfibroad2013_koodi = '01') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '01' or d3a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '01' or d4a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '01' or d5a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '01' or d6a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '01' or d7a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '01' or d8a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '01' or d9a.iscfibroad2013_koodi = '01') then 1*/
	else 0
end as opisk_amk_koulala1
--Opiskellut koulutusala2 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '02' or d2a.iscfibroad2013_koodi = '02') then 1
/*		when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '02' or d3a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '02' or d4a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '02' or d5a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '02' or d6a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '02' or d7a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '02' or d8a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '02' or d9a.iscfibroad2013_koodi = '02') then 1*/
	else 0
end as opisk_amk_koulala2
--Opiskellut koulutusala3 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '03' or d2a.iscfibroad2013_koodi = '03') then 1
/*		when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '03' or d3a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '03' or d4a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '03' or d5a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '03' or d6a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '03' or d7a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '03' or d8a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '03' or d9a.iscfibroad2013_koodi = '03') then 1*/
	else 0
end as opisk_amk_koulala3
--Opiskellut koulutusala4 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '04' or d2a.iscfibroad2013_koodi = '04') then 1
/*		when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '04' or d3a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '04' or d4a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '04' or d5a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '04' or d6a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '04' or d7a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '04' or d8a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '04' or d9a.iscfibroad2013_koodi = '04') then 1*/
	else 0
end as opisk_amk_koulala4
--Opiskellut koulutusala5 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '05' or d2a.iscfibroad2013_koodi = '05') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '05' or d3a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '05' or d4a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '05' or d5a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '05' or d6a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '05' or d7a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '05' or d8a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '05' or d9a.iscfibroad2013_koodi = '05') then 1*/
	else 0
end as opisk_amk_koulala5
--Opiskellut koulutusala6 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '06' or d2a.iscfibroad2013_koodi = '06') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '06' or d3a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '06' or d4a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '06' or d5a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '06' or d6a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '06' or d7a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '06' or d8a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '06' or d9a.iscfibroad2013_koodi = '06') then 1*/
	else 0
end as opisk_amk_koulala6
--Opiskellut koulutusala7 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '07' or d2a.iscfibroad2013_koodi = '07') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '07' or d3a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '07' or d4a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '07' or d5a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '07' or d6a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '07' or d7a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '07' or d8a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '07' or d9a.iscfibroad2013_koodi = '07') then 1*/
	else 0
end as opisk_amk_koulala7
--Opiskellut koulutusala8 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '08' or d2a.iscfibroad2013_koodi = '08') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '08' or d3a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '08' or d4a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '08' or d5a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '08' or d6a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '08' or d7a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '08' or d8a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '08' or d9a.iscfibroad2013_koodi = '08') then 1*/
	else 0
end as opisk_amk_koulala8
--Opiskellut koulutusala9 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '09' or d2a.iscfibroad2013_koodi = '09') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '09' or d3a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '09' or d4a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '09' or d5a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '09' or d6a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '09' or d7a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '09' or d8a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '09' or d9a.iscfibroad2013_koodi = '09') then 1*/
	else 0
end as opisk_amk_koulala9
--Opiskellut koulutusala10 (amk) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '10' or d2a.iscfibroad2013_koodi = '10') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '10' or d3a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '10' or d4a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '10' or d5a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '10' or d6a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '10' or d7a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '10' or d8a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '10' or d9a.iscfibroad2013_koodi = '10') then 1*/
	else 0
end as opisk_amk_koulala10




--Opiskellut koulutusala1 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '01' or d2b.iscfibroad2013_koodi = '01') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '01' or d3b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '01' or d4b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '01' or d5b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '01' or d6b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '01' or d7b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '01' or d8b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '01' or d9b.iscfibroad2013_koodi = '01') then 1*/
	else 0
end as opisk_yo_koulala1
--Opiskellut koulutusala2 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '02' or d2b.iscfibroad2013_koodi = '02') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '02' or d3b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '02' or d4b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '02' or d5b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '02' or d6b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '02' or d7b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '02' or d8b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '02' or d9b.iscfibroad2013_koodi = '02') then 1*/
	else 0
end as opisk_yo_koulala2
--Opiskellut koulutusala3 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '03' or d2b.iscfibroad2013_koodi = '03') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '03' or d3b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '03' or d4b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '03' or d5b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '03' or d6b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '03' or d7b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '03' or d8b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '03' or d9b.iscfibroad2013_koodi = '03') then 1*/
	else 0
end as opisk_yo_koulala3
--Opiskellut koulutusala4 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '04' or d2b.iscfibroad2013_koodi = '04') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '04' or d3b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '04' or d4b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '04' or d5b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '04' or d6b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '04' or d7b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '04' or d8b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '04' or d9b.iscfibroad2013_koodi = '04') then 1*/
	else 0
end as opisk_yo_koulala4
--Opiskellut koulutusala5 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '05' or d2b.iscfibroad2013_koodi = '05') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '05' or d3b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '05' or d4b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '05' or d5b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '05' or d6b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '05' or d7b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '05' or d8b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '05' or d9b.iscfibroad2013_koodi = '05') then 1*/
	else 0
end as opisk_yo_koulala5
--Opiskellut koulutusala6 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '06' or d2b.iscfibroad2013_koodi = '06') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '06' or d3b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '06' or d4b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '06' or d5b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '06' or d6b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '06' or d7b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '06' or d8b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '06' or d9b.iscfibroad2013_koodi = '06') then 1*/
	else 0
end as opisk_yo_koulala6
--Opiskellut koulutusala7 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '07' or d2b.iscfibroad2013_koodi = '07') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '07' or d3b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '07' or d4b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '07' or d5b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '07' or d6b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '07' or d7b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '07' or d8b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '07' or d9b.iscfibroad2013_koodi = '07') then 1*/
	else 0
end as opisk_yo_koulala7
--Opiskellut koulutusala8 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '08' or d2b.iscfibroad2013_koodi = '08') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '08' or d3b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '08' or d4b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '08' or d5b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '08' or d6b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '08' or d7b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '08' or d8b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '08' or d9b.iscfibroad2013_koodi = '08') then 1*/
	else 0
end as opisk_yo_koulala8
--Opiskellut koulutusala9 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '09' or d2b.iscfibroad2013_koodi = '09') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '09' or d3b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '09' or d4b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '09' or d5b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '09' or d6b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '09' or d7b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '09' or d8b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '09' or d9b.iscfibroad2013_koodi = '09') then 1*/
	else 0
end as opisk_yo_koulala9
--Opiskellut koulutusala10 (yo) (taso 1) (kyllä/ei)
,case
	when  l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '10' or d2b.iscfibroad2013_koodi = '10') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '10' or d3b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '10' or d4b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '10' or d5b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '10' or d6b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '10' or d7b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '10' or d8b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '10' or d9b.iscfibroad2013_koodi = '10') then 1*/
	else 0
end as opisk_yo_koulala10


--Opiskellut useampaa kuin yhtä alaa (taso 1) (kyllä/ei)
,case --ensimmäisenä vuotena on mahdollista olla vain yksi ala
	when  l.suorlk = '1' and m1.MinValue <> m1.MaxValue then 1 
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and m2.MinValue <> m2.MaxValue then 1 
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and m3.MinValue <> m3.MaxValue then 1 
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and m4.MinValue <> m4.MaxValue then 1 
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and m5.MinValue <> m5.MaxValue then 1 
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and m6.MinValue <> m6.MaxValue then 1 
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and m7.MinValue <> m7.MaxValue then 1 
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and m8.MinValue <> m8.MaxValue then 1 */
	else 0
end as opisk_vah2_koulala


----HAUT KYLLÄ/EI
--Hakenut ammatilliseen koulutukseen
,case
	when  l.suorlk = '1' and (l.monihaku_1 in (2,3,5,0,8,9) or l.monihaku_2 in (2,3,5,0,8,9)) then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.monihaku_2 in (2,3,5) or l.monihaku2010 in (2,3,5)) then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2010 in (2,3,5) or l.monihaku2011 in (2,3,5)) then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2011 in (2,3,5) or l.monihaku2012 in (2,3,5)) then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2012 in (2,3,5) or l.monihaku2013 in (2,3,5)) then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2013 in (2,3,5) or l.monihaku2014 in (2,3,5)) then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2014 in (2,3,5) or l.monihaku2015 in (2,3,5)) then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2015 in (2,3,5) or l.monihaku2016 in (2,3,5)) then 1*/
	else 0
end as haku_amm
--Hakenut ammattikorkeakoulutukseen
,case
	when  l.suorlk = '1' and (l.monihaku_1 in (4,6,0,8) or l.monihaku_2 in (4,6,0,8)) then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.monihaku_2 in (4,6) or l.monihaku2010 in (4,6)) then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2010 in (4,6) or l.monihaku2011 in (4,6)) then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2011 in (4,6) or l.monihaku2012 in (4,6)) then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2012 in (4,6) or l.monihaku2013 in (4,6)) then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2013 in (4,6) or l.monihaku2014 in (4,6)) then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2014 in (4,6) or l.monihaku2015 in (4,6)) then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2015 in (4,6) or l.monihaku2016 in (4,6)) then 1*/
	else 0
end as haku_amk
--Hakenut yliopistokoulutukseen
,case
	when  l.suorlk = '1' and (l.monihaku_1 in (6,7,0,9) or l.monihaku_2 in (6,7,0,9)) then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.monihaku_2 in (6,7) or l.monihaku2010 in (6,7)) then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2010 in (6,7) or l.monihaku2011 in (6,7)) then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2011 in (6,7) or l.monihaku2012 in (6,7)) then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2012 in (6,7) or l.monihaku2013 in (6,7)) then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2013 in (6,7) or l.monihaku2014 in (6,7)) then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2014 in (6,7) or l.monihaku2015 in (6,7)) then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2015 in (6,7) or l.monihaku2016 in (6,7)) then 1*/
	else 0
end as haku_yo




----MITTARIT
,case
	when  l.suorlk = '1' and monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and l.luopiskkoulk_1 = '' and l.ammopiskkoulk_1 = '' and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku_2 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.luopiskkoulk2016 = '' and l.ammopiskkoulk2016 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end eihaku_kk_eiopisk

--Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa
,case 
	when  l.suorlk = '1' and monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and (l.luopiskkoulk_1 <> '' or l.ammopiskkoulk_1 <> '' or l.luopiskkoulk_2 <> '' or l.ammopiskkoulk_2 <> '') and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku_2 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.luopiskkoulk_2 <> '' or l.ammopiskkoulk_2 <> '' or l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '') and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '' or l.ammopiskkoulk2016 <> '') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end eihaku_kk_eiopisk_kk_opisk_ta

----Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut lukiokoulutuksessa
,case 
	when  l.suorlk = '1' and monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and (l.luopiskkoulk_1 <> '' or l.luopiskkoulk_2 <> '') and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = ''  then 1
/*--	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku_2 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.luopiskkoulk_2 <> '' or l.luopiskkoulk2010 <> '') and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
--	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.luopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
--	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.luopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
--	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.luopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.luopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.luopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.luopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end eihaku_kk_eiopisk_kk_opisk_lu

----Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut ammatillisessa peruskoulutuksessa
,case 
	when  l.suorlk = '1' and monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and (d1c.Koulutusaste_taso2_koodi = '32' or d2c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku_2 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.ammopiskkoulk_2 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '32' or d3c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '32' or d4c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '32' or d5c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '32' or d6c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '32' or d7c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '32' or d8c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d7c.Koulutusaste_taso2_koodi = '32' or d8c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end eihaku_kk_eiopisk_kk_opisk_pk

------Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut ammattitutkintokoulutuksessa
,case 
	when  l.suorlk = '1' and monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and (d1c.Koulutusaste_taso2_koodi = '33' or d2c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku_2 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.ammopiskkoulk_2 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '33' or d3c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '33' or d4c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '33' or d5c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '33' or d6c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '33' or d7c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '33' or d8c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d7c.Koulutusaste_taso2_koodi = '33' or d8c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end eihaku_kk_eiopisk_kk_opisk_at

------Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut erikoisammattitutkintokoulutuksessa
,case 
	when  l.suorlk = '1' and monihaku_1 not in (4,5,6,7,0,8,9) and monihaku_2 not in (4,5,6,7,0,8,9) and (l.ammopiskkoulk_1 <> '' or l.ammopiskkoulk_2 <> '') and (d1c.Koulutusaste_taso2_koodi = '41' or d2c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku_2 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.ammopiskkoulk_2 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '41' or d3c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '41' or d4c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '41' or d5c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '41' or d6c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '41' or d7c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '41' or d8c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d7c.Koulutusaste_taso2_koodi = '41' or d8c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end eihaku_kk_eiopisk_kk_opisk_eat

--Hakenut korkea-asteelle, ei opiskellut korkea-asteella
,case 
	when  l.suorlk = '1' and (monihaku_1 in (4,5,6,7,0,8,9) or monihaku_2 in (4,5,6,7,0,8,9)) and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku_2 in (4,5,6,7) or monihaku2010 in (4,5,6,7)) and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 in (4,5,6,7) or monihaku2011 in (4,5,6,7)) and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 in (4,5,6,7) or monihaku2012 in (4,5,6,7)) and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 in (4,5,6,7) or monihaku2013 in (4,5,6,7)) and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 in (4,5,6,7) or monihaku2014 in (4,5,6,7)) and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 in (4,5,6,7) or monihaku2015 in (4,5,6,7)) and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 in (4,5,6,7) or monihaku2016 in (4,5,6,7)) and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end haku_kk_eiopisk_kk
----Hakenut korkea-asteelle, ei opiskellut korkea-asteella, ei-opiskellut toisen asteen koulutuksessa
,case
	when  l.suorlk = '1' and (monihaku_1 in (4,5,6,7,0,8,9) or monihaku_2 in (4,5,6,7,0,8,9)) and l.luopiskkoulk_1 = '' and l.ammopiskkoulk_1 = '' and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku_2 in (4,5,6,7) or monihaku2010 in (4,5,6,7)) and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 in (4,5,6,7) or monihaku2011 in (4,5,6,7)) and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 in (4,5,6,7) or monihaku2012 in (4,5,6,7)) and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 in (4,5,6,7) or monihaku2013 in (4,5,6,7)) and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 in (4,5,6,7) or monihaku2014 in (4,5,6,7)) and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 in (4,5,6,7) or monihaku2015 in (4,5,6,7)) and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 in (4,5,6,7) or monihaku2016 in (4,5,6,7)) and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.luopiskkoulk2016 = '' and l.ammopiskkoulk2016 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end haku_kk_eiopisk_kk_eiopisk_ta
----Hakenut korkea-asteelle, ei opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa
,case
	when  l.suorlk = '1' and (monihaku_1 in (4,5,6,7,0,8,9) or monihaku_2 in (4,5,6,7,0,8,9)) and (l.luopiskkoulk_1 <> '' or l.ammopiskkoulk_1 <> '' or l.luopiskkoulk_2 <> '' or l.ammopiskkoulk_2 <> '') and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku_2 in (4,5,6,7) or monihaku2010 in (4,5,6,7)) and (l.luopiskkoulk_2 <> '' or l.ammopiskkoulk_2 <> '' or l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '') and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 in (4,5,6,7) or monihaku2011 in (4,5,6,7)) and (l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 in (4,5,6,7) or monihaku2012 in (4,5,6,7)) and (l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 in (4,5,6,7) or monihaku2013 in (4,5,6,7)) and (l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 in (4,5,6,7) or monihaku2014 in (4,5,6,7)) and (l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 in (4,5,6,7) or monihaku2015 in (4,5,6,7)) and (l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 in (4,5,6,7) or monihaku2016 in (4,5,6,7)) and (l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '' or l.ammopiskkoulk2016 <> '') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end haku_kk_eiopisk_kk_opisk_ta
----Hakenut vain ammattikorkeakouluun, ei opiskellut korkea-asteella
,case
	when  l.suorlk = '1' and (monihaku_1 in (4,8) or monihaku_2 in (4,8)) and (monihaku_1 not in (5,6,7,0,9) and monihaku_2 not in (5,6,7,0,9)) and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku_2 = 4 or monihaku2010 = 4) and (monihaku_2 not in (5,6,7) and monihaku2010 not in (5,6,7)) and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 = 4 or monihaku2011 = 4) and (monihaku2010 not in (5,6,7) and monihaku2011 not in (5,6,7)) and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 = 4 or monihaku2012 = 4) and (monihaku2011 not in (5,6,7) and monihaku2012 not in (5,6,7)) and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 = 4 or monihaku2013 = 4) and (monihaku2012 not in (5,6,7) and monihaku2013 not in (5,6,7)) and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 = 4 or monihaku2014 = 4) and (monihaku2013 not in (5,6,7) and monihaku2014 not in (5,6,7)) and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 = 4 or monihaku2015 = 4) and (monihaku2014 not in (5,6,7) and monihaku2015 not in (5,6,7)) and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 = 4 or monihaku2016 = 4) and (monihaku2015 not in (5,6,7) and monihaku2016 not in (5,6,7)) and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end haku_amk_eiopisk_kk
----Hakenut vain yliopistokoulutukseen, ei opiskellut korkea-asteella
,case
	when  l.suorlk = '1' and (monihaku_1 in (7,9) or monihaku_2 in (7,9)) and (monihaku_1 not in (4,5,6,0,8) and monihaku_2 not in (4,5,6,0,8)) and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku_2 = 7 or monihaku2010 = 7) and (monihaku_2 not in (4,5,6) and monihaku2010 not in (4,5,6)) and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 = 7 or monihaku2011 = 7) and (monihaku2010 not in (4,5,6) and monihaku2011 not in (4,5,6)) and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 = 7 or monihaku2012 = 7) and (monihaku2011 not in (4,5,6) and monihaku2012 not in (4,5,6)) and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 = 7 or monihaku2013 = 7) and (monihaku2012 not in (4,5,6) and monihaku2013 not in (4,5,6)) and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 = 7 or monihaku2014 = 7) and (monihaku2013 not in (4,5,6) and monihaku2014 not in (4,5,6)) and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 = 7 or monihaku2015 = 7) and (monihaku2014 not in (4,5,6) and monihaku2015 not in (4,5,6)) and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 = 7 or monihaku2016 = 7) and (monihaku2015 not in (4,5,6) and monihaku2016 not in (4,5,6)) and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end haku_yo_eiopisk_kk
----Hakenut sekä amk- että yliopistokoulutukseen, ei opiskellut korkea-asteella
,case
	when  l.suorlk = '1' and (monihaku_1 in (6,0) or monihaku_2 in (6,0) or ((monihaku_1 in (4,8) or monihaku_2 in (4,8)) and (monihaku_1 in (7,9) or monihaku_2 in (7,9)))) and l.amkopiskkoulk_1 = '' and l.yoopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku_2 = 6 or monihaku2010 = 6 or ((monihaku_2 = 4 or monihaku2010 = 4) and (monihaku_2 = 7 or monihaku2010 = 7))) and l.amkopiskkoulk_2 = '' and l.yoopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 = 6 or monihaku2011 = 6 or ((monihaku2010 = 4 or monihaku2011 = 4) and (monihaku2010 = 7 or monihaku2011 = 7))) and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 = 6 or monihaku2012 = 6 or ((monihaku2011 = 4 or monihaku2012 = 4) and (monihaku2011 = 7 or monihaku2012 = 7))) and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 = 6 or monihaku2013 = 6 or ((monihaku2012 = 4 or monihaku2013 = 4) and (monihaku2012 = 7 or monihaku2013 = 7))) and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 = 6 or monihaku2014 = 6 or ((monihaku2013 = 4 or monihaku2014 = 4) and (monihaku2013 = 7 or monihaku2014 = 7))) and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 = 6 or monihaku2015 = 6 or ((monihaku2014 = 4 or monihaku2015 = 4) and (monihaku2014 = 7 or monihaku2015 = 7))) and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 = 6 or monihaku2016 = 6 or ((monihaku2015 = 4 or monihaku2016 = 4) and (monihaku2015 = 7 or monihaku2016 = 7))) and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end haku_amkyo_eiopisk_kk

--Opiskellut korkea-asteella
,case
	when  l.suorlk = '1' and (l.amkopiskkoulk_1 <> '' or l.yoopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '' or l.yoopiskkoulk_2 <> '') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk_2 <> '' or l.yoopiskkoulk_2 <> '' or l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '' or l.yoopiskkoulk2016 <> '') then 1*/
	else 0
end opisk_kk
----Opiskellut korkea-asteella, ei-opiskellut toisen asteen koulutuksessa
,case
	when  l.suorlk = '1' and l.luopiskkoulk_1 = '' and l.ammopiskkoulk_1 = '' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' and (l.amkopiskkoulk_1 <> '' or l.yoopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '' or l.yoopiskkoulk_2 <> '') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk_2 = '' and l.ammopiskkoulk_2 = '' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and (l.amkopiskkoulk_2 <> '' or l.yoopiskkoulk_2 <> '' or l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and (l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and (l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and (l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and (l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and (l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.luopiskkoulk2016 = '' and l.ammopiskkoulk2016 = '' and (l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '' or l.yoopiskkoulk2016 <> '') then 1*/
	else 0
end opisk_kk_eiopisk_ta
----Opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa
,case
	when  l.suorlk = '1' and (l.luopiskkoulk_1 <> '' or l.ammopiskkoulk_1 <> '' or l.luopiskkoulk_2 <> '' or l.ammopiskkoulk_2 <> '') and (l.amkopiskkoulk_1 <> '' or l.yoopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '' or l.yoopiskkoulk_2 <> '') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk_2 <> '' or l.ammopiskkoulk_2 <> '' or l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '') and (l.amkopiskkoulk_2 <> '' or l.yoopiskkoulk_2 <> '' or l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '') and (l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '') and (l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '') and (l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '') and (l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '') and (l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '' or l.ammopiskkoulk2016 <> '') and (l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '' or l.yoopiskkoulk2016 <> '') then 1*/
	else 0
end opisk_kk_opisk_ta
----Opiskellut vain ammattikorkeakoulussa
,case
	when  l.suorlk = '1' and (l.amkopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '') and l.yoopiskkoulk_1 = '' and l.yoopiskkoulk_2 = '' then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk_2 <> '' or l.amkopiskkoulk2010 <> '') and l.yoopiskkoulk_2 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '') and l.yoopiskkoulk2010 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '') and l.yoopiskkoulk2011 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '') and l.yoopiskkoulk2012 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '') and l.yoopiskkoulk2013 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '') and l.yoopiskkoulk2014 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '') and l.yoopiskkoulk2015 = '' and l.yoopiskkoulk2016 = '' then 1*/
	else 0
end opisk_vain_amk
----Opiskellut vain yliopistokoulutuksessa
,case
	when  l.suorlk = '1' and l.amkopiskkoulk_1 = '' and l.amkopiskkoulk_2 = '' and (l.yoopiskkoulk_1 <> '' or l.yoopiskkoulk_2 <> '') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk_2 = '' and l.amkopiskkoulk2010 = '' and (l.yoopiskkoulk_2 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and (l.yoopiskkoulk2010 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and (l.yoopiskkoulk2011 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and (l.yoopiskkoulk2012 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and (l.yoopiskkoulk2013 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and (l.yoopiskkoulk2014 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and (l.yoopiskkoulk2015 <> '' or l.yoopiskkoulk2016 <> '') then 1*/
	else 0
end opisk_vain_yo
----Opiskellut sekä amk- että yliopistokoulutuksessa
,case
	when  l.suorlk = '1' and (l.amkopiskkoulk_1 <> '' or l.amkopiskkoulk_2 <> '') and (l.yoopiskkoulk_1 <> '' or l.yoopiskkoulk_2 <> '') then 1
/*	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk_2 <> '' or l.amkopiskkoulk2010 <> '') and (l.yoopiskkoulk_2 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '') and (l.yoopiskkoulk2010 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '') and (l.yoopiskkoulk2011 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '') and (l.yoopiskkoulk2012 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '') and (l.yoopiskkoulk2013 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '') and (l.yoopiskkoulk2014 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '') and (l.yoopiskkoulk2015 <> '' or l.yoopiskkoulk2016 <> '') then 1*/
	else 0
end opisk_amkyo


FROM 
(
	select * from [VipunenTK_SA].[dbo].[v_K3_12_Perusk_paattaneet_amm_tutk_suorittaneet]
	where suorlk = '1'
	and suorv <> @maxVuosi --tuoreimmalle tiedolle löytyy vain 0v jakson tiedot
) as l

INNER JOIN VipunenTK.dbo.d_koulutusluokitus d1a on d1a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk_1,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2a on d2a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk_2,''),'-1')
/*INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2a on d2a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2009,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d3a on d3a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2010,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d4a on d4a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2011,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d5a on d5a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2012,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d6a on d6a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2013,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d7a on d7a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2014,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d8a on d8a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2015,''),'-1')*/

INNER JOIN VipunenTK.dbo.d_koulutusluokitus d1b on d1b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk_1,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2b on d2b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk_2,''),'-1')
/*INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2b on d2b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2009,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d3b on d3b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2010,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d4b on d4b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2011,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d5b on d5b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2012,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d6b on d6b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2013,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d7b on d7b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2014,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d8b on d8b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2015,''),'-1')*/

INNER JOIN VipunenTK.dbo.d_koulutusluokitus d1c on d1c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk_1,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2c on d2c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk_2,''),'-1')
/*INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2c on d2c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2009,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d3c on d3c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2010,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d4c on d4c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2011,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d5c on d5c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2012,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d6c on d6c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2013,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d7c on d7c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2014,''),'-1')	
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d8c on d8c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2015,''),'-1')	*/

CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d1a.iscfibroad2013_koodi),(d1b.iscfibroad2013_koodi), (d2a.iscfibroad2013_koodi),(d2b.iscfibroad2013_koodi)) AS a(d)) m1
/*CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d2a.iscfibroad2013_koodi),(d2b.iscfibroad2013_koodi), (d3a.iscfibroad2013_koodi),(d3b.iscfibroad2013_koodi)) AS a(d)) m2
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d3a.iscfibroad2013_koodi),(d3b.iscfibroad2013_koodi), (d4a.iscfibroad2013_koodi),(d4b.iscfibroad2013_koodi)) AS a(d)) m3
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d4a.iscfibroad2013_koodi),(d4b.iscfibroad2013_koodi), (d5a.iscfibroad2013_koodi),(d5b.iscfibroad2013_koodi)) AS a(d)) m4
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d5a.iscfibroad2013_koodi),(d5b.iscfibroad2013_koodi), (d6a.iscfibroad2013_koodi),(d6b.iscfibroad2013_koodi)) AS a(d)) m5
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d6a.iscfibroad2013_koodi),(d6b.iscfibroad2013_koodi), (d7a.iscfibroad2013_koodi),(d7b.iscfibroad2013_koodi)) AS a(d)) m6
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d7a.iscfibroad2013_koodi),(d7b.iscfibroad2013_koodi), (d8a.iscfibroad2013_koodi),(d8b.iscfibroad2013_koodi)) AS a(d)) m7
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d8a.iscfibroad2013_koodi),(d8b.iscfibroad2013_koodi), (d9a.iscfibroad2013_koodi),(d9b.iscfibroad2013_koodi)) AS a(d)) m8*/

	WHERE 1=1
	
GO

USE [ANTERO]