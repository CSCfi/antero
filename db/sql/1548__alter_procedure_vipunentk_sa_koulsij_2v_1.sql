USE [VipunenTK_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_koulutukseen_sijoittuneet_2v_1_tarkastelujakso]    Script Date: 19.4.2018 13:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_lataa_f_koulutukseen_sijoittuneet_2v_1_tarkastelujakso] AS


declare @debug_what_to_run tinyint; set @debug_what_to_run=2; -- käytä arvoa 3 vain kun teet yhden vuoden
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
 (case when l.tutklaja= '' then '' 
       when l.tutklaja is NULL then '' else l.tutklaja end ),
  (case when l.tutktav= '' then '' 
       when l.tutktav is NULL then '' else l.tutktav end ),
 l.aikoul,
 l.tutkmaak,
 -- Koulutus 1
 (case
    --lukiokoulutuksessa 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2009 <> '' and l.ammopiskkoulk2009 = '' and
	l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then l.luopiskkoulk2009 
	-- ammattikoulutuksessa 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 <> '' and
	l.amkopiskkoulk2009 ='' and l.yoopiskkoulk2009 = ''  then l.ammopiskkoulk2009 
	--lukiokoulutuksessa ja ammattillisessa koulutuksessa, otetaan tieto lukiokoulutuksen 2009 ensim. koulutustietoihin
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2009 <> '' and l.ammopiskkoulk2009 <> '' and
	l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then l.luopiskkoulk2009
	-- ammattikorkeakoulutuksessa 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2009  <> '' and l.yoopiskkoulk2009  = '' and
	l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = '' then l.amkopiskkoulk2009
	-- yliopistokoulutuksessa 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 <> '' and 
	l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = ''   then l.yoopiskkoulk2009
	-- ammattikorkeakoulutuksessa ja yliopistokoulutuksessa, merkitään ensimmäiseen koulutustietoihin ammattikorkeakoulutus  
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2009 <> '' and l.yoopiskkoulk2009  <> '' and
	l.luopiskkoulk2009 = '' and ammopiskkoulk2009 = ''  then l.amkopiskkoulk2009 
	
	
	-- lukiokoulutuksessa 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2010 <> '' and l.ammopiskkoulk2010 = '' and
	l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then l.luopiskkoulk2010
	-- ammatillisessa koulutuksessa 2010 
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 <> '' and
	l.amkopiskkoulk2010 ='' and l.yoopiskkoulk2010 = ''  then l.ammopiskkoulk2010 
	--lukiokoulutuksessa ja ammattillisessa koulutuksessa, otetaan tieto lukiokoulutuksen 2010 ensimäisiin koulutustietoihin
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2010 <> '' and l.ammopiskkoulk2010 <> '' and
	l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then l.luopiskkoulk2010
	-- ammattikorkeakoulutuksessa
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2010  <> '' and l.yoopiskkoulk2010  = '' and
	l.luopiskkoulk2010  = '' and l.ammopiskkoulk2010 = '' then l.amkopiskkoulk2010
	-- yliopistokoulutuksessa
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 <> '' and 
	l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = ''   then l.yoopiskkoulk2010 
	-- ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään ensimmäiseen koulutustietoihin ammattikorkeakoulutus  
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2010 <> '' and l.yoopiskkoulk2010  <> '' and
	l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = ''  then l.amkopiskkoulk2010 
	
	
	-- lukiokoulutuksessa 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2011 <> '' and l.ammopiskkoulk2011 = '' and
	l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then l.luopiskkoulk2011
	-- ammatillisessa koulutuksessa 2011 
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 <> '' and
	l.amkopiskkoulk2011 ='' and l.yoopiskkoulk2011 = ''  then l.ammopiskkoulk2011 
	--lukiokoulutuksessa ja ammattillisessa koulutuksessa, otetaan tieto lukiokoulutuksen 2011 ensimäisiin koulutustietoihin
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2011 <> '' and l.ammopiskkoulk2011 <> '' and
	l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then l.luopiskkoulk2011
	-- ammattikorkeakoulutuksessa
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2011  <> '' and l.yoopiskkoulk2011  = '' and
	l.luopiskkoulk2011  = '' and l.ammopiskkoulk2011 = '' then l.amkopiskkoulk2011
	-- yliopistokoulutuksessa
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 <> '' and 
	l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = ''   then l.yoopiskkoulk2011 
	-- ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään ensimmäiseen koulutustietoihin ammattikorkeakoulutus  
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2011 <> '' and l.yoopiskkoulk2011  <> '' and
	l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = ''  then l.amkopiskkoulk2011 
	
	-- lukiokoulutuksessa 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2012 <> '' and l.ammopiskkoulk2012 = '' and
	l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then l.luopiskkoulk2012
	-- ammatillisessa koulutuksessa 2012 
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 <> '' and
	l.amkopiskkoulk2012 ='' and l.yoopiskkoulk2012 = ''  then l.ammopiskkoulk2012 
	--lukiokoulutuksessa ja ammattillisessa koulutuksessa, otetaan tieto lukiokoulutuksen 2012 ensimäisiin koulutustietoihin
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2012 <> '' and l.ammopiskkoulk2012 <> '' and
	l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then l.luopiskkoulk2012
	-- ammattikorkeakoulutuksessa
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2012  <> '' and l.yoopiskkoulk2012  = '' and
	l.luopiskkoulk2012  = '' and l.ammopiskkoulk2012 = '' then l.amkopiskkoulk2012
	-- yliopistokoulutuksessa
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 <> '' and 
	l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = ''   then l.yoopiskkoulk2012 
	-- ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään ensimmäiseen koulutustietoihin ammattikorkeakoulutus  
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2012 <> '' and l.yoopiskkoulk2012  <> '' and
	l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = ''  then l.amkopiskkoulk2012 

	-- lukiokoulutuksessa 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2013 <> '' and l.ammopiskkoulk2013 = '' and
	l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then l.luopiskkoulk2013
	-- ammatillisessa koulutuksessa 2013 
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 <> '' and
	l.amkopiskkoulk2013 ='' and l.yoopiskkoulk2013 = ''  then l.ammopiskkoulk2013 
	--lukiokoulutuksessa ja ammattillisessa koulutuksessa, otetaan tieto lukiokoulutuksen 2013 ensimäisiin koulutustietoihin
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2013 <> '' and l.ammopiskkoulk2013 <> '' and
	l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then l.luopiskkoulk2013
	-- ammattikorkeakoulutuksessa
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2013  <> '' and l.yoopiskkoulk2013  = '' and
	l.luopiskkoulk2013  = '' and l.ammopiskkoulk2013 = '' then l.amkopiskkoulk2013
	-- yliopistokoulutuksessa
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 <> '' and 
	l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = ''   then l.yoopiskkoulk2013 
	-- ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään ensimmäiseen koulutustietoihin ammattikorkeakoulutus  
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2013 <> '' and l.yoopiskkoulk2013  <> '' and
	l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = ''  then l.amkopiskkoulk2013 

	-- lukiokoulutuksessa 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2014 <> '' and l.ammopiskkoulk2014 = '' and
	l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then l.luopiskkoulk2014
	-- ammatillisessa koulutuksessa 2014 
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 <> '' and
	l.amkopiskkoulk2014 ='' and l.yoopiskkoulk2014 = ''  then l.ammopiskkoulk2014 
	--lukiokoulutuksessa ja ammattillisessa koulutuksessa, otetaan tieto lukiokoulutuksen 2014 ensimäisiin koulutustietoihin
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2014 <> '' and l.ammopiskkoulk2014 <> '' and
	l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then l.luopiskkoulk2014
	-- ammattikorkeakoulutuksessa
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2014  <> '' and l.yoopiskkoulk2014  = '' and
	l.luopiskkoulk2014  = '' and l.ammopiskkoulk2014 = '' then l.amkopiskkoulk2014
	-- yliopistokoulutuksessa
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 <> '' and 
	l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = ''   then l.yoopiskkoulk2014 
	-- ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään ensimmäiseen koulutustietoihin ammattikorkeakoulutus  
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2014 <> '' and l.yoopiskkoulk2014  <> '' and
	l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = ''  then l.amkopiskkoulk2014 

	-- lukiokoulutuksessa 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2015 <> '' and l.ammopiskkoulk2015 = '' and
	l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then l.luopiskkoulk2015
	-- ammatillisessa koulutuksessa 2015 
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 <> '' and
	l.amkopiskkoulk2015 ='' and l.yoopiskkoulk2015 = ''  then l.ammopiskkoulk2015 
	--lukiokoulutuksessa ja ammattillisessa koulutuksessa, otetaan tieto lukiokoulutuksen 2015 ensimäisiin koulutustietoihin
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2015 <> '' and l.ammopiskkoulk2015 <> '' and
	l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then l.luopiskkoulk2015
	-- ammattikorkeakoulutuksessa
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2015  <> '' and l.yoopiskkoulk2015  = '' and
	l.luopiskkoulk2015  = '' and l.ammopiskkoulk2015 = '' then l.amkopiskkoulk2015
	-- yliopistokoulutuksessa
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 <> '' and 
	l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = ''   then l.yoopiskkoulk2015 
	-- ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään ensimmäiseen koulutustietoihin ammattikorkeakoulutus  
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2015 <> '' and l.yoopiskkoulk2015  <> '' and
	l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = ''  then l.amkopiskkoulk2015 
	
	else ''
	
	    
	    end),
	    
-- Oppilaitos 1
	(case
	-- lukiokoulutuksen oppilaitos 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2009 <> '' and l.ammopisktunn2009 = '' and
	l.amkopisktunn2009 = '' and l.yoopisktunn2009 = '' then l.luopisktunn2009 
	-- ammattikoulutuksen oppilaitos 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2009 = '' and l.ammopisktunn2009 <> '' and
	l.amkopisktunn2009 ='' and l.yoopisktunn2009 = ''  then l.ammopisktunn2009 
	-- lukiokoulutuksen oppilaitos ja ammatillisen koulutuksen oppilaitos, merkitään lukiokoulutuksen oppilaitos 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2009 <> '' and l.ammopisktunn2009 <> '' and
	l.amkopisktunn2009 = '' and l.yoopisktunn2009 = '' then l.luopisktunn2009
	-- ammattikorkeakoulutuksen oppilaitos 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2009  <> '' and l.yoopisktunn2009  = '' and
	l.luopisktunn2009 = '' and l.ammopisktunn2009 = '' then l.amkopisktunn2009
	-- yliopistokoulutuksen oppilaitos 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2009 = '' and l.yoopisktunn2009 <> '' and 
	l.luopisktunn2009 = '' and l.ammopisktunn2009 = ''   then l.yoopisktunn2009
	-- ammattikorkeakoulutus ja yliopistokoulutus oppilaitos, merkitään ammattikorkeakoulutus 2009  
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2009 <> '' and l.yoopisktunn2009  <> '' and
	l.luopisktunn2009 = '' and l.ammopisktunn2009 = ''  then l.amkopisktunn2009 
	
	
	-- lukiokoulutuksen oppilaitos 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2010 <> '' and l.ammopisktunn2010 = '' and
	l.amkopisktunn2010 = '' and l.yoopisktunn2010 = '' then l.luopisktunn2010
	-- ammatillisen koulutuksen oppilaitos 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2010 = '' and l.ammopisktunn2010 <> '' and
	l.amkopisktunn2010 ='' and l.yoopisktunn2010 = ''  then l.ammopisktunn2010
	-- lukiokoulutuksen oppilaitos ja ammatillisen koulutuksen oppilaitos, merkitään lukiokoulutuksen oppilaitos 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2010 <> '' and l.ammopisktunn2010 <> '' and
	l.amkopisktunn2010 = '' and l.yoopisktunn2010 = '' then l.luopisktunn2010
	-- ammattikorkeakoulutuksen oppilaitos 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2010  <> '' and l.yoopisktunn2010  = '' and
	l.luopisktunn2010 = '' and l.ammopisktunn2010 = '' then l.amkopisktunn2010
	-- yliopistokoulutuksen oppilaitos 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2010 = '' and l.yoopisktunn2010 <> '' and 
	l.luopisktunn2010 = '' and l.ammopisktunn2010 = ''   then l.yoopisktunn2010  
	-- ammattikorkeakoulutus ja yliopistokoulutus oppilaitos, merkitään ammattikorkeakoulutus 2010  
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2010 <> '' and l.yoopisktunn2010  <> '' and
	l.luopisktunn2010 = '' and l.ammopisktunn2010 = ''  then l.amkopisktunn2010 
	
	-- lukiokoulutuksen oppilaitos 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2011 <> '' and l.ammopisktunn2011 = '' and
	l.amkopisktunn2011 = '' and l.yoopisktunn2011 = '' then l.luopisktunn2011
	-- ammatillisen koulutuksen oppilaitos 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2011 = '' and l.ammopisktunn2011 <> '' and
	l.amkopisktunn2011 ='' and l.yoopisktunn2011 = ''  then l.ammopisktunn2011
	-- lukiokoulutuksen oppilaitos ja ammatillisen koulutuksen oppilaitos, merkitään lukiokoulutuksen oppilaitos 2010
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2011 <> '' and l.ammopisktunn2011 <> '' and
	l.amkopisktunn2011 = '' and l.yoopisktunn2011 = '' then l.luopisktunn2011
	-- ammattikorkeakoulutuksen oppilaitos 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2011  <> '' and l.yoopisktunn2011  = '' and
	l.luopisktunn2011 = '' and l.ammopisktunn2011 = '' then l.amkopisktunn2011
	-- yliopistokoulutuksen oppilaitos 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2011 = '' and l.yoopisktunn2011 <> '' and 
	l.luopisktunn2011 = '' and l.ammopisktunn2011 = ''   then l.yoopisktunn2011 
	-- ammattikorkeakoulutus ja yliopistokoulutus oppilaitos, merkitään ammattikorkeakoulutus 2010  
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2011 <> '' and l.yoopisktunn2011  <> '' and
	l.luopisktunn2011 = '' and l.ammopisktunn2011 = ''  then l.amkopisktunn2011
	
	-- lukiokoulutuksen oppilaitos 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2012 <> '' and l.ammopisktunn2012 = '' and
	l.amkopisktunn2012 = '' and l.yoopisktunn2012 = '' then l.luopisktunn2012
	-- ammatillisen koulutuksen oppilaitos 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2012 = '' and l.ammopisktunn2012 <> '' and
	l.amkopisktunn2012 ='' and l.yoopisktunn2012 = ''  then l.ammopisktunn2012
	-- lukiokoulutuksen oppilaitos ja ammatillisen koulutuksen oppilaitos, merkitään lukiokoulutuksen oppilaitos 2010
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2012 <> '' and l.ammopisktunn2012 <> '' and
	l.amkopisktunn2012 = '' and l.yoopisktunn2012 = '' then l.luopisktunn2012
	-- ammattikorkeakoulutuksen oppilaitos 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2012  <> '' and l.yoopisktunn2012  = '' and
	l.luopisktunn2012 = '' and l.ammopisktunn2012 = '' then l.amkopisktunn2012
	-- yliopistokoulutuksen oppilaitos 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2012 = '' and l.yoopisktunn2012 <> '' and 
	l.luopisktunn2012 = '' and l.ammopisktunn2012 = ''   then l.yoopisktunn2012 
	-- ammattikorkeakoulutus ja yliopistokoulutus oppilaitos, merkitään ammattikorkeakoulutus 2010  
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2012 <> '' and l.yoopisktunn2012  <> '' and
	l.luopisktunn2012 = '' and l.ammopisktunn2012 = ''  then l.amkopisktunn2012

		-- lukiokoulutuksen oppilaitos 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2013 <> '' and l.ammopisktunn2013 = '' and
	l.amkopisktunn2013 = '' and l.yoopisktunn2013 = '' then l.luopisktunn2013
	-- ammatillisen koulutuksen oppilaitos 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2013 = '' and l.ammopisktunn2013 <> '' and
	l.amkopisktunn2013 ='' and l.yoopisktunn2013 = ''  then l.ammopisktunn2013
	-- lukiokoulutuksen oppilaitos ja ammatillisen koulutuksen oppilaitos, merkitään lukiokoulutuksen oppilaitos 2010
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2013 <> '' and l.ammopisktunn2013 <> '' and
	l.amkopisktunn2013 = '' and l.yoopisktunn2013 = '' then l.luopisktunn2013
	-- ammattikorkeakoulutuksen oppilaitos 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2013  <> '' and l.yoopisktunn2013  = '' and
	l.luopisktunn2013 = '' and l.ammopisktunn2013 = '' then l.amkopisktunn2013
	-- yliopistokoulutuksen oppilaitos 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2013 = '' and l.yoopisktunn2013 <> '' and 
	l.luopisktunn2013 = '' and l.ammopisktunn2013 = ''   then l.yoopisktunn2013 
	-- ammattikorkeakoulutus ja yliopistokoulutus oppilaitos, merkitään ammattikorkeakoulutus 2010  
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2013 <> '' and l.yoopisktunn2013  <> '' and
	l.luopisktunn2013 = '' and l.ammopisktunn2013 = ''  then l.amkopisktunn2013

	-- lukiokoulutuksen oppilaitos 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2014 <> '' and l.ammopisktunn2014 = '' and
	l.amkopisktunn2014 = '' and l.yoopisktunn2014 = '' then l.luopisktunn2014
	-- ammatillisen koulutuksen oppilaitos 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2014 = '' and l.ammopisktunn2014 <> '' and
	l.amkopisktunn2014 ='' and l.yoopisktunn2014 = ''  then l.ammopisktunn2014
	-- lukiokoulutuksen oppilaitos ja ammatillisen koulutuksen oppilaitos, merkitään lukiokoulutuksen oppilaitos 2010
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2014 <> '' and l.ammopisktunn2014 <> '' and
	l.amkopisktunn2014 = '' and l.yoopisktunn2014 = '' then l.luopisktunn2014
	-- ammattikorkeakoulutuksen oppilaitos 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2014  <> '' and l.yoopisktunn2014  = '' and
	l.luopisktunn2014 = '' and l.ammopisktunn2014 = '' then l.amkopisktunn2014
	-- yliopistokoulutuksen oppilaitos 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2014 = '' and l.yoopisktunn2014 <> '' and 
	l.luopisktunn2014 = '' and l.ammopisktunn2014 = ''   then l.yoopisktunn2014 
	-- ammattikorkeakoulutus ja yliopistokoulutus oppilaitos, merkitään ammattikorkeakoulutus 2010  
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2014 <> '' and l.yoopisktunn2014  <> '' and
	l.luopisktunn2014 = '' and l.ammopisktunn2014 = ''  then l.amkopisktunn2014

	-- lukiokoulutuksen oppilaitos 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2015 <> '' and l.ammopisktunn2015 = '' and
	l.amkopisktunn2015 = '' and l.yoopisktunn2015 = '' then l.luopisktunn2015
	-- ammatillisen koulutuksen oppilaitos 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2015 = '' and l.ammopisktunn2015 <> '' and
	l.amkopisktunn2015 ='' and l.yoopisktunn2015 = ''  then l.ammopisktunn2015
	-- lukiokoulutuksen oppilaitos ja ammatillisen koulutuksen oppilaitos, merkitään lukiokoulutuksen oppilaitos 2010
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2015 <> '' and l.ammopisktunn2015 <> '' and
	l.amkopisktunn2015 = '' and l.yoopisktunn2015 = '' then l.luopisktunn2015
	-- ammattikorkeakoulutuksen oppilaitos 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2015  <> '' and l.yoopisktunn2015  = '' and
	l.luopisktunn2015 = '' and l.ammopisktunn2015 = '' then l.amkopisktunn2015
	-- yliopistokoulutuksen oppilaitos 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2015 = '' and l.yoopisktunn2015 <> '' and 
	l.luopisktunn2015 = '' and l.ammopisktunn2015 = ''   then l.yoopisktunn2015 
	-- ammattikorkeakoulutus ja yliopistokoulutus oppilaitos, merkitään ammattikorkeakoulutus 2010  
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2015 <> '' and l.yoopisktunn2015  <> '' and
	l.luopisktunn2015 = '' and l.ammopisktunn2015 = ''  then l.amkopisktunn2015

	else ''
	
	    end),
  --Koulutuksen järjestäjä 1
	(case
	-- lukikoulutuksen järjestäjä 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2009  <> '' and l.ammopiskjarj2009 = '' and
	l.amkopiskjarj2009 = '' and yoopiskjarj2009 = '' then l.luopiskjarj2009
	-- ammatillisen koulutuksen järjestäjä 2009  
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2009 = '' and l.ammopiskjarj2009 <> '' and
	l.amkopiskjarj2009 ='' and l.yoopiskjarj2009 = ''  then l.ammopiskjarj2009
	-- lukio- ja ammatillisen koulutuksen järjestäjä, merkitään lukiokoulutuksen 2009 järjestäjä 
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2009 <> '' and l.ammopiskjarj2009 <> '' and
	l.amkopiskjarj2009 = '' and l.yoopiskjarj2009 = '' then l.luopiskjarj2009
	-- ammattikorkeakoulutuksen järjestäjä 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2009  <> '' and l.yoopiskjarj2009   = '' and
	l.luopiskjarj2009 = '' and l.ammopiskjarj2009 = '' then l.amkopiskjarj2009
	-- yliopistokoulutuksen järjestäjä 2009 
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2009  = '' and l.yoopiskjarj2009  <> '' and 
	l.luopiskjarj2009  = '' and l.ammopiskjarj2009 = ''   then l.yoopiskjarj2009
	-- ammattikorkea- ja yliopistokoulutuksen järjestäjä, merkitään ammattikorkeakoulutuksen 2009 järjestäjä   
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2009  <> '' and l.yoopiskjarj2009   <> '' and
	l.luopiskjarj2009  = '' and l.ammopiskjarj2009  = ''  then l.amkopiskjarj2009 

	
	-- lukiokoulutuksen järjestäjä 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2010  <> '' and l.ammopiskjarj2010  = '' and
	l.amkopiskjarj2010 = '' and l.yoopiskjarj2010 = '' then l.luopiskjarj2010  
	-- ammatillisen koulutuksen järjestäjä 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2010 = '' and l.ammopiskjarj2010 <> '' and
	l.amkopiskjarj2010 ='' and yoopiskjarj2010 = ''  then l.ammopiskjarj2010 
	--lukiokoulutuksen- ja ammattikoulutuksen järjestäjä 2010, merkitään lukiokoulutuksen 2010 järjestäjä
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2010 <> '' and l.ammopiskjarj2010 <> '' and
	l.amkopiskjarj2010 = '' and l.yoopiskjarj2010 = '' then l.luopiskjarj2010
	-- ammattikorkeakoulutuksen 2010 järjestäjä
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2010  <> '' and l.yoopiskjarj2010   = '' and
	l.luopiskjarj2010 = '' and l.ammopiskjarj2010 = '' then l.amkopiskjarj2010 
	-- yliopistokoulutuksen 2010 järjestäjä
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2010  = '' and l.yoopiskjarj2010  <> '' and 
	l.luopiskjarj2010  = '' and l.ammopiskjarj2010 = ''   then l.yoopiskjarj2010
	-- ammattikorkekoulutuksen- ja yliopistokoulutuksen järjestäjä 2010, merkitään ammattikorkekoulutuksen järjestäjä 2010   
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2010  <> '' and l.yoopiskjarj2010   <> '' and
	l.luopiskjarj2010  = '' and l.ammopiskjarj2010  = ''  then l.amkopiskjarj2010 
	
	-- lukiokoulutuksen järjestäjä 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2011  <> '' and l.ammopiskjarj2011 = '' and
	l.amkopiskjarj2011 = '' and l.yoopiskjarj2011 = '' then l.luopiskjarj2011 
	-- ammatillisen koulutuksen järjestäjä 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2011 = '' and l.ammopiskjarj2011 <> '' and
	l.amkopiskjarj2011 ='' and yoopiskjarj2011 = ''  then l.ammopiskjarj2011 
	--lukiokoulutuksen- ja ammattikoulutuksen järjestäjä 2010, merkitään lukiokoulutuksen 2011 järjestäjä
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2011 <> '' and l.ammopiskjarj2011 <> '' and
	l.amkopiskjarj2011 = '' and l.yoopiskjarj2011 = '' then l.luopiskjarj2011
	-- ammattikorkeakoulutuksen 2011 järjestäjä
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2011  <> '' and l.yoopiskjarj2011   = '' and
	l.luopiskjarj2011 = '' and l.ammopiskjarj2011 = '' then l.amkopiskjarj2011 
	-- yliopistokoulutuksen 2010 järjestäjä
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2011  = '' and l.yoopiskjarj2011  <> '' and 
	l.luopiskjarj2011  = '' and l.ammopiskjarj2011 = ''   then l.yoopiskjarj2011
	-- ammattikorkekoulutuksen- ja yliopistokoulutuksen järjestäjä 2010, merkitään ammattikorkekoulutuksen järjestäjä 2010   
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2011  <> '' and l.yoopiskjarj2011   <> '' and
	l.luopiskjarj2011  = '' and l.ammopiskjarj2011  = ''  then l.amkopiskjarj2011 
	
	-- lukiokoulutuksen järjestäjä 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2012  <> '' and l.ammopiskjarj2012 = '' and
	l.amkopiskjarj2012 = '' and l.yoopiskjarj2012 = '' then l.luopiskjarj2012 
	-- ammatillisen koulutuksen järjestäjä 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2012 = '' and l.ammopiskjarj2012 <> '' and
	l.amkopiskjarj2012 ='' and yoopiskjarj2012 = ''  then l.ammopiskjarj2012 
	--lukiokoulutuksen- ja ammattikoulutuksen järjestäjä 2010, merkitään lukiokoulutuksen 2012 järjestäjä
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2012 <> '' and l.ammopiskjarj2012 <> '' and
	l.amkopiskjarj2012 = '' and l.yoopiskjarj2012 = '' then l.luopiskjarj2012
	-- ammattikorkeakoulutuksen 2012 järjestäjä
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2012  <> '' and l.yoopiskjarj2012   = '' and
	l.luopiskjarj2012 = '' and l.ammopiskjarj2012 = '' then l.amkopiskjarj2012 
	-- yliopistokoulutuksen 2010 järjestäjä
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2012  = '' and l.yoopiskjarj2012  <> '' and 
	l.luopiskjarj2012  = '' and l.ammopiskjarj2012 = ''   then l.yoopiskjarj2012
	-- ammattikorkekoulutuksen- ja yliopistokoulutuksen järjestäjä 2010, merkitään ammattikorkekoulutuksen järjestäjä 2010   
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2012  <> '' and l.yoopiskjarj2012   <> '' and
	l.luopiskjarj2012  = '' and l.ammopiskjarj2012  = ''  then l.amkopiskjarj2012 

			-- lukiokoulutuksen järjestäjä 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2013  <> '' and l.ammopiskjarj2013 = '' and
	l.amkopiskjarj2013 = '' and l.yoopiskjarj2013 = '' then l.luopiskjarj2013 
	-- ammatillisen koulutuksen järjestäjä 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2013 = '' and l.ammopiskjarj2013 <> '' and
	l.amkopiskjarj2013 ='' and yoopiskjarj2013 = ''  then l.ammopiskjarj2013 
	--lukiokoulutuksen- ja ammattikoulutuksen järjestäjä 2010, merkitään lukiokoulutuksen 2013 järjestäjä
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2013 <> '' and l.ammopiskjarj2013 <> '' and
	l.amkopiskjarj2013 = '' and l.yoopiskjarj2013 = '' then l.luopiskjarj2013
	-- ammattikorkeakoulutuksen 2013 järjestäjä
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2013  <> '' and l.yoopiskjarj2013   = '' and
	l.luopiskjarj2013 = '' and l.ammopiskjarj2013 = '' then l.amkopiskjarj2013 
	-- yliopistokoulutuksen 2010 järjestäjä
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2013  = '' and l.yoopiskjarj2013  <> '' and 
	l.luopiskjarj2013  = '' and l.ammopiskjarj2013 = ''   then l.yoopiskjarj2013
	-- ammattikorkekoulutuksen- ja yliopistokoulutuksen järjestäjä 2010, merkitään ammattikorkekoulutuksen järjestäjä 2010   
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2013  <> '' and l.yoopiskjarj2013   <> '' and
	l.luopiskjarj2013  = '' and l.ammopiskjarj2013  = ''  then l.amkopiskjarj2013 

	-- lukiokoulutuksen järjestäjä 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2014  <> '' and l.ammopiskjarj2014 = '' and
	l.amkopiskjarj2014 = '' and l.yoopiskjarj2014 = '' then l.luopiskjarj2014 
	-- ammatillisen koulutuksen järjestäjä 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2014 = '' and l.ammopiskjarj2014 <> '' and
	l.amkopiskjarj2014 ='' and yoopiskjarj2014 = ''  then l.ammopiskjarj2014 
	--lukiokoulutuksen- ja ammattikoulutuksen järjestäjä 2010, merkitään lukiokoulutuksen 2014 järjestäjä
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2014 <> '' and l.ammopiskjarj2014 <> '' and
	l.amkopiskjarj2014 = '' and l.yoopiskjarj2014 = '' then l.luopiskjarj2014
	-- ammattikorkeakoulutuksen 2014 järjestäjä
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2014  <> '' and l.yoopiskjarj2014   = '' and
	l.luopiskjarj2014 = '' and l.ammopiskjarj2014 = '' then l.amkopiskjarj2014 
	-- yliopistokoulutuksen 2010 järjestäjä
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2014  = '' and l.yoopiskjarj2014  <> '' and 
	l.luopiskjarj2014  = '' and l.ammopiskjarj2014 = ''   then l.yoopiskjarj2014
	-- ammattikorkekoulutuksen- ja yliopistokoulutuksen järjestäjä 2010, merkitään ammattikorkekoulutuksen järjestäjä 2010   
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2014  <> '' and l.yoopiskjarj2014   <> '' and
	l.luopiskjarj2014  = '' and l.ammopiskjarj2014  = ''  then l.amkopiskjarj2014 

	-- lukiokoulutuksen järjestäjä 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2015  <> '' and l.ammopiskjarj2015 = '' and
	l.amkopiskjarj2015 = '' and l.yoopiskjarj2015 = '' then l.luopiskjarj2015 
	-- ammatillisen koulutuksen järjestäjä 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2015 = '' and l.ammopiskjarj2015 <> '' and
	l.amkopiskjarj2015 ='' and yoopiskjarj2015 = ''  then l.ammopiskjarj2015 
	--lukiokoulutuksen- ja ammattikoulutuksen järjestäjä 2010, merkitään lukiokoulutuksen 2015 järjestäjä
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2015 <> '' and l.ammopiskjarj2015 <> '' and
	l.amkopiskjarj2015 = '' and l.yoopiskjarj2015 = '' then l.luopiskjarj2015
	-- ammattikorkeakoulutuksen 2015 järjestäjä
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2015  <> '' and l.yoopiskjarj2015   = '' and
	l.luopiskjarj2015 = '' and l.ammopiskjarj2015 = '' then l.amkopiskjarj2015 
	-- yliopistokoulutuksen 2010 järjestäjä
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2015  = '' and l.yoopiskjarj2015  <> '' and 
	l.luopiskjarj2015  = '' and l.ammopiskjarj2015 = ''   then l.yoopiskjarj2015
	-- ammattikorkekoulutuksen- ja yliopistokoulutuksen järjestäjä 2010, merkitään ammattikorkekoulutuksen järjestäjä 2010   
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2015  <> '' and l.yoopiskjarj2015   <> '' and
	l.luopiskjarj2015  = '' and l.ammopiskjarj2015  = ''  then l.amkopiskjarj2015 
	
	
	else ''
	    end),
 --Koulutuksen maakunta 1
	(case
	-- lukioopiskelun maakunta 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2009   <> '' and l.ammopiskmaak2009  = '' and
	l.amkopiskmaak2009  = '' and l.yoopiskmaak2009  = '' then l.luopiskmaak2009   
	-- ammatillisen koulutuksen maakunta 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2009  = '' and l.ammopiskmaak2009  <> '' and
	l.amkopiskmaak2009  ='' and l.yoopiskmaak2009  = ''  then l.ammopiskmaak2009  
	-- lukiokoulutuksen ja ammatillisen koulutus otetaan lukiokoulutuksen maakunta 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2009  <> '' and l.ammopiskmaak2009  <> '' and
	l.amkopiskmaak2009  = '' and l.yoopiskmaak2009  = '' then l.luopiskmaak2009 
    -- ammattikorkeakoulutuksen maakunta 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2009   <> '' and l.yoopiskmaak2009   = '' and
	l.luopiskjarj2009 = '' and l.ammopiskmaak2009 = '' then l.amkopiskmaak2009
	-- yliopistokoulutuksen maakunta 2009 
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2009  = '' and l.yoopiskmaak2009  <> '' and 
	l.luopiskjarj2009  = '' and l.ammopiskmaak2009 = ''   then l.yoopiskmaak2009
	-- ammattikorkekoulutuksen ja yliopistokoulutksen maakunta otetaan ammattikorkeakoulutuksen maakunta 2009   
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2009  <> '' and l.yoopiskmaak2009   <> '' and
	l.luopiskjarj2009  = '' and l.ammopiskmaak2009  = ''  then l.amkopiskmaak2009 
	
	
	-- lukioopiskelun maakunta 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2010   <> '' and l.ammopiskmaak2010  = '' and
	l.amkopiskmaak2010  = '' and l.yoopiskmaak2010  = '' then l.luopiskmaak2010
	-- ammatillisen koulutksen maakunta 2010    
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2010  = '' and l.ammopiskmaak2010  <> '' and
	l.amkopiskmaak2010  ='' and l.yoopiskmaak2010  = ''  then l.ammopiskmaak2010
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta otetaan lukiokoulutuksen maakunta 2010  
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2010  <> '' and l.ammopiskmaak2010  <> '' and
	l.amkopiskmaak2010  = '' and l.yoopiskmaak2010  = '' then l.luopiskmaak2010 
	-- ammattikorkekoulutuksen maakunta 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2010   <> '' and l.yoopiskmaak2010   = '' and
	l.luopiskmaak2010 = '' and l.ammopiskmaak2010 = '' then l.amkopiskmaak2010
	-- yliopistokoulutuksen maakunta 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2010  = '' and l.yoopiskmaak2010  <> '' and 
	l.luopiskmaak2010  = '' and l.ammopiskmaak2010 = ''   then l.yoopiskmaak2010
	-- ammattikorkeakoulutuksen ja yliopistokoulutksen maakunta 2010, otetaan talteen ammattikorkekoulutksen maakunta 2010   
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2010  <> '' and l.yoopiskmaak2010   <> '' and
	l.luopiskmaak2010  = '' and l.ammopiskmaak2010  = ''  then l.amkopiskmaak2010 
	
    -- lukioopiskelun maakunta 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2011   <> '' and l.ammopiskmaak2011  = '' and
	l.amkopiskmaak2011  = '' and l.yoopiskmaak2011  = '' then l.luopiskmaak2011
	-- ammatillisen koulutksen maakunta 2011    
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2011  = '' and l.ammopiskmaak2011  <> '' and
	l.amkopiskmaak2011  ='' and l.yoopiskmaak2011  = ''  then l.ammopiskmaak2011
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta otetaan lukiokoulutuksen maakunta 2010  
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2011  <> '' and l.ammopiskmaak2011  <> '' and
	l.amkopiskmaak2011  = '' and l.yoopiskmaak2011  = '' then l.luopiskmaak2011 
	-- ammattikorkekoulutuksen maakunta 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2011   <> '' and l.yoopiskmaak2011   = '' and
	l.luopiskjarj2011 = '' and l.ammopiskmaak2011 = '' then l.amkopiskmaak2011
	-- yliopistokoulutuksen maakunta 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2011  = '' and l.yoopiskmaak2011  <> '' and 
	l.luopiskjarj2011  = '' and l.ammopiskmaak2011 = ''   then l.yoopiskmaak2011
	-- ammattikorkeakoulutuksen ja yliopistokoulutksen maakunta 2010, otetaan talteen ammattikorkekoulutksen maakunta 2010   
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2011  <> '' and l.yoopiskmaak2011   <> '' and
	l.luopiskjarj2011  = '' and l.ammopiskmaak2011  = ''  then l.amkopiskmaak2011 
	
	
	-- lukioopiskelun maakunta 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2012   <> '' and l.ammopiskmaak2012  = '' and
	l.amkopiskmaak2012  = '' and l.yoopiskmaak2012  = '' then l.luopiskmaak2012
	-- ammatillisen koulutksen maakunta 2012    
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2012  = '' and l.ammopiskmaak2012  <> '' and
	l.amkopiskmaak2012  ='' and l.yoopiskmaak2012  = ''  then l.ammopiskmaak2012
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta otetaan lukiokoulutuksen maakunta 2010  
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2012  <> '' and l.ammopiskmaak2012  <> '' and
	l.amkopiskmaak2012  = '' and l.yoopiskmaak2012  = '' then l.luopiskmaak2012 
	-- ammattikorkekoulutuksen maakunta 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2012   <> '' and l.yoopiskmaak2012   = '' and
	l.luopiskjarj2012 = '' and l.ammopiskmaak2012 = '' then l.amkopiskmaak2012
	-- yliopistokoulutuksen maakunta 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2012  = '' and l.yoopiskmaak2012  <> '' and 
	l.luopiskjarj2012  = '' and l.ammopiskmaak2012 = ''   then l.yoopiskmaak2012
	-- ammattikorkeakoulutuksen ja yliopistokoulutksen maakunta 2010, otetaan talteen ammattikorkekoulutksen maakunta 2010   
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2012  <> '' and l.yoopiskmaak2012   <> '' and
	l.luopiskjarj2012  = '' and l.ammopiskmaak2012  = ''  then l.amkopiskmaak2012 

	-- lukioopiskelun maakunta 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2013   <> '' and l.ammopiskmaak2013  = '' and
	l.amkopiskmaak2013  = '' and l.yoopiskmaak2013  = '' then l.luopiskmaak2013
	-- ammatillisen koulutksen maakunta 2013    
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2013  = '' and l.ammopiskmaak2013  <> '' and
	l.amkopiskmaak2013  ='' and l.yoopiskmaak2013  = ''  then l.ammopiskmaak2013
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta otetaan lukiokoulutuksen maakunta 2010  
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2013  <> '' and l.ammopiskmaak2013  <> '' and
	l.amkopiskmaak2013  = '' and l.yoopiskmaak2013  = '' then l.luopiskmaak2013 
	-- ammattikorkekoulutuksen maakunta 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2013   <> '' and l.yoopiskmaak2013   = '' and
	l.luopiskjarj2013 = '' and l.ammopiskmaak2013 = '' then l.amkopiskmaak2013
	-- yliopistokoulutuksen maakunta 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2013  = '' and l.yoopiskmaak2013  <> '' and 
	l.luopiskjarj2013  = '' and l.ammopiskmaak2013 = ''   then l.yoopiskmaak2013
	-- ammattikorkeakoulutuksen ja yliopistokoulutksen maakunta 2010, otetaan talteen ammattikorkekoulutksen maakunta 2010   
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2013  <> '' and l.yoopiskmaak2013   <> '' and
	l.luopiskjarj2013  = '' and l.ammopiskmaak2013  = ''  then l.amkopiskmaak2013 

		-- lukioopiskelun maakunta 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2014   <> '' and l.ammopiskmaak2014  = '' and
	l.amkopiskmaak2014  = '' and l.yoopiskmaak2014  = '' then l.luopiskmaak2014
	-- ammatillisen koulutksen maakunta 2014    
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2014  = '' and l.ammopiskmaak2014  <> '' and
	l.amkopiskmaak2014  ='' and l.yoopiskmaak2014  = ''  then l.ammopiskmaak2014
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta otetaan lukiokoulutuksen maakunta 2010  
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2014  <> '' and l.ammopiskmaak2014  <> '' and
	l.amkopiskmaak2014  = '' and l.yoopiskmaak2014  = '' then l.luopiskmaak2014 
	-- ammattikorkekoulutuksen maakunta 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2014   <> '' and l.yoopiskmaak2014   = '' and
	l.luopiskjarj2014 = '' and l.ammopiskmaak2014 = '' then l.amkopiskmaak2014
	-- yliopistokoulutuksen maakunta 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2014  = '' and l.yoopiskmaak2014  <> '' and 
	l.luopiskjarj2014  = '' and l.ammopiskmaak2014 = ''   then l.yoopiskmaak2014
	-- ammattikorkeakoulutuksen ja yliopistokoulutksen maakunta 2010, otetaan talteen ammattikorkekoulutksen maakunta 2010   
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2014  <> '' and l.yoopiskmaak2014   <> '' and
	l.luopiskjarj2014  = '' and l.ammopiskmaak2014  = ''  then l.amkopiskmaak2014 

	-- lukioopiskelun maakunta 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2015   <> '' and l.ammopiskmaak2015  = '' and
	l.amkopiskmaak2015  = '' and l.yoopiskmaak2015  = '' then l.luopiskmaak2015
	-- ammatillisen koulutksen maakunta 2015    
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2015  = '' and l.ammopiskmaak2015  <> '' and
	l.amkopiskmaak2015  ='' and l.yoopiskmaak2015  = ''  then l.ammopiskmaak2015
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta otetaan lukiokoulutuksen maakunta 2010  
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2015  <> '' and l.ammopiskmaak2015  <> '' and
	l.amkopiskmaak2015  = '' and l.yoopiskmaak2015  = '' then l.luopiskmaak2015 
	-- ammattikorkekoulutuksen maakunta 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2015   <> '' and l.yoopiskmaak2015   = '' and
	l.luopiskjarj2015 = '' and l.ammopiskmaak2015 = '' then l.amkopiskmaak2015
	-- yliopistokoulutuksen maakunta 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2015  = '' and l.yoopiskmaak2015  <> '' and 
	l.luopiskjarj2015  = '' and l.ammopiskmaak2015 = ''   then l.yoopiskmaak2015
	-- ammattikorkeakoulutuksen ja yliopistokoulutksen maakunta 2010, otetaan talteen ammattikorkekoulutksen maakunta 2010   
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2015  <> '' and l.yoopiskmaak2015   <> '' and
	l.luopiskjarj2015  = '' and l.ammopiskmaak2015  = ''  then l.amkopiskmaak2015 
	
	else ''
	
	    end),
-- Koulutus 2
(case
   -- jos lukiokoulutuksessa vain niin jätetään tyhjäksi 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2009 <> '' and l.ammopiskkoulk2009 = '' and
	l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then ''
	-- jos ammattikoulutuksessa vain  jätetään tyhjäksi 2009 
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 <> '' and
	l.amkopiskkoulk2009 ='' and l.yoopiskkoulk2009 = ''  then ''
	-- jos lukiokoulutksessa ja ammattikoulutuksessa merkitään ammattikoulutus 2009 
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2009 <> '' and l.ammopiskkoulk2009 <> '' and
	l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then l.ammopiskkoulk2009 
	-- jos vain ammattikorkeakoulutuksessa jätetään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2009  <> '' and l.yoopiskkoulk2009  = '' and
	l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = '' then ''
	-- jos yliopistokoulutuksessa vain jätetään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 <> '' and 
	l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = ''   then ''
	-- jos ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään yliopistokoulutus 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2009 <> '' and l.yoopiskkoulk2009  <> '' and
	l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = ''  then l.yoopiskkoulk2009
	
	
	-- jos lukiokoulutksessa vain niin jätetään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2010 <> '' and l.ammopiskkoulk2010 = '' and
	l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then ''
	-- jos ammatillisessa koulutuksessa vain jätetään tyhjäksi 2010 
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 <> '' and
	l.amkopiskkoulk2010 ='' and l.yoopiskkoulk2010 = ''  then '' 
	-- jos ammatillisessa ja lukiokoulutuksessa merkitään ammatillisen koulutus 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2010 <> '' and l.ammopiskkoulk2010 <> '' and
	l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then l.ammopiskkoulk2010
	-- jos ammattikorkeakoulutuksessa vain jätetään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2010  <> '' and l.yoopiskkoulk2010  = '' and
	l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' then ''
	-- jos yliopistokoulutuksessa vain jätetään tyhjäksi
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 <> '' and 
	l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = ''   then ''
    -- jos ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään yliopistokoulutus
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2010 <> '' and l.yoopiskkoulk2010  <> '' and
	l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = ''  then l.yoopiskkoulk2010   
	
	-- jos lukiokoulutksessa vain niin jätetään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2011 <> '' and l.ammopiskkoulk2011 = '' and
	l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then ''
	-- jos ammatillisessa koulutuksessa vain jätetään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 <> '' and
	l.amkopiskkoulk2011 ='' and l.yoopiskkoulk2011 = ''  then '' 
	-- jos ammatillisessa ja lukiokoulutuksessa merkitään ammatillisen koulutus 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2011 <> '' and l.ammopiskkoulk2011 <> '' and
	l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then l.ammopiskkoulk2011
	-- jos ammattikorkeakoulutuksessa vain jätetään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2011  <> '' and l.yoopiskkoulk2011  = '' and
	l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' then ''
	-- jos yliopistokoulutuksessa vain jätetään tyhjäksi
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 <> '' and 
	l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = ''   then ''
    -- jos ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään yliopistokoulutus
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2011 <> '' and l.yoopiskkoulk2011  <> '' and
	l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = ''  then l.yoopiskkoulk2011   
	
	-- jos lukiokoulutksessa vain niin jätetään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2012 <> '' and l.ammopiskkoulk2012 = '' and
	l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then ''
	-- jos ammatillisessa koulutuksessa vain jätetään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 <> '' and
	l.amkopiskkoulk2012 ='' and l.yoopiskkoulk2012 = ''  then '' 
	-- jos ammatillisessa ja lukiokoulutuksessa merkitään ammatillisen koulutus 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2012 <> '' and l.ammopiskkoulk2012 <> '' and
	l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then l.ammopiskkoulk2012
	-- jos ammattikorkeakoulutuksessa vain jätetään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2012  <> '' and l.yoopiskkoulk2012  = '' and
	l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' then ''
	-- jos yliopistokoulutuksessa vain jätetään tyhjäksi
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 <> '' and 
	l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = ''   then ''
    -- jos ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään yliopistokoulutus
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2012 <> '' and l.yoopiskkoulk2012  <> '' and
	l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = ''  then l.yoopiskkoulk2012   

		-- jos lukiokoulutksessa vain niin jätetään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2013 <> '' and l.ammopiskkoulk2013 = '' and
	l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then ''
	-- jos ammatillisessa koulutuksessa vain jätetään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 <> '' and
	l.amkopiskkoulk2013 ='' and l.yoopiskkoulk2013 = ''  then '' 
	-- jos ammatillisessa ja lukiokoulutuksessa merkitään ammatillisen koulutus 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2013 <> '' and l.ammopiskkoulk2013 <> '' and
	l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then l.ammopiskkoulk2013
	-- jos ammattikorkeakoulutuksessa vain jätetään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2013  <> '' and l.yoopiskkoulk2013  = '' and
	l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' then ''
	-- jos yliopistokoulutuksessa vain jätetään tyhjäksi
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 <> '' and 
	l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = ''   then ''
    -- jos ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään yliopistokoulutus
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2013 <> '' and l.yoopiskkoulk2013  <> '' and
	l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = ''  then l.yoopiskkoulk2013  
	
			-- jos lukiokoulutksessa vain niin jätetään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2014 <> '' and l.ammopiskkoulk2014 = '' and
	l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then ''
	-- jos ammatillisessa koulutuksessa vain jätetään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 <> '' and
	l.amkopiskkoulk2014 ='' and l.yoopiskkoulk2014 = ''  then '' 
	-- jos ammatillisessa ja lukiokoulutuksessa merkitään ammatillisen koulutus 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2014 <> '' and l.ammopiskkoulk2014 <> '' and
	l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then l.ammopiskkoulk2014
	-- jos ammattikorkeakoulutuksessa vain jätetään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2014  <> '' and l.yoopiskkoulk2014  = '' and
	l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' then ''
	-- jos yliopistokoulutuksessa vain jätetään tyhjäksi
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 <> '' and 
	l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = ''   then ''
    -- jos ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään yliopistokoulutus
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2014 <> '' and l.yoopiskkoulk2014  <> '' and
	l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = ''  then l.yoopiskkoulk2014   

	-- jos lukiokoulutksessa vain niin jätetään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2015 <> '' and l.ammopiskkoulk2015 = '' and
	l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then ''
	-- jos ammatillisessa koulutuksessa vain jätetään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 <> '' and
	l.amkopiskkoulk2015 ='' and l.yoopiskkoulk2015 = ''  then '' 
	-- jos ammatillisessa ja lukiokoulutuksessa merkitään ammatillisen koulutus 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskkoulk2015 <> '' and l.ammopiskkoulk2015 <> '' and
	l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then l.ammopiskkoulk2015
	-- jos ammattikorkeakoulutuksessa vain jätetään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2015  <> '' and l.yoopiskkoulk2015  = '' and
	l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' then ''
	-- jos yliopistokoulutuksessa vain jätetään tyhjäksi
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 <> '' and 
	l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = ''   then ''
    -- jos ammattikorkeakoulutuksessa ja yliopistokoulutuksessa merkitään yliopistokoulutus
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskkoulk2015 <> '' and l.yoopiskkoulk2015  <> '' and
	l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = ''  then l.yoopiskkoulk2015   
	
	else ''
	    end),
-- Oppilaitos 2
(case
    -- lukiokoulutuksen oppilaitos vain merkitään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2009 <> '' and l.ammopisktunn2009 = '' and
	l.amkopisktunn2009 = '' and l.yoopisktunn2009 = '' then ''
	-- ammatillisen koulutuksen oppilaitos 2009 merkitään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2009 = '' and l.ammopisktunn2009 <> '' and
	l.amkopisktunn2009 ='' and l.yoopisktunn2009 = ''  then '' 
	-- lukiokoulutuksen ja ammatillisen koulutuksen oppilaitos merkitään ammatillisen koulutuksen oppilaitos 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2009 <> '' and l.ammopisktunn2009 <> '' and
	l.amkopisktunn2009 = '' and l.yoopisktunn2009 = '' then l.ammopisktunn2009 
	-- ammattikorkeakoulutksen oppilaitos vain merkitään tyhjäksi 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2009  <> '' and l.yoopisktunn2009  = '' and
	l.luopisktunn2009 = '' and l.ammopisktunn2009 = '' then ''
	-- yliopistokoulutksen oppilaitos vain merkitään tyhjäksi 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2009 = '' and l.yoopisktunn2009 <> '' and 
	l.luopisktunn2009 = '' and l.ammopisktunn2009 = ''   then ''  
	--  ammattikorkeakoulutksen oppilaitos ja yliopistokoulutuksen oppilaitos, merkitään yliopistokoulutuksen oppilaitos 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2009 <> '' and l.yoopisktunn2009  <> '' and
	l.luopisktunn2009 = '' and l.ammopisktunn2009 = ''  then l.yoopisktunn2009 
	
	
	-- vain lukiokoulutuksen oppilaitos, merkitään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2010 <> '' and l.ammopisktunn2010 = '' and
	l.amkopisktunn2010 = '' and l.yoopisktunn2010 = '' then ''
	-- vain ammatillisen koulutuksen oppilaitos merkitään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2010 = '' and l.ammopisktunn2010 <> '' and
	l.amkopisktunn2010 ='' and yoopisktunn2010 = ''  then '' 
	-- lukiokoulutuksen ja ammatillisen koulutuksen oppilaitos, merkitään ammatillinen koulutus oppilaitos 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2010 <> '' and l.ammopisktunn2010 <> '' and
	l.amkopisktunn2010 = '' and l.yoopisktunn2010 = '' then l.ammopisktunn2010 
	-- vain ammattikorkeakoulutuksen oppilaitos, jätetään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2010  <> '' and l.yoopisktunn2010  = '' and
	l.luopisktunn2010 = '' and l.ammopisktunn2010 = '' then ''
	-- vin yliopistokoulutuksen oppilaitos, jätetään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2010 = '' and l.yoopisktunn2010 <> '' and 
	l.luopisktunn2010 = '' and l.ammopisktunn2010  = ''   then '' 
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen 2010 oppilaitos, merkitään yliopistokoulutuksen oppilaitos 2010 
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2010 <> '' and l.yoopisktunn2010  <> '' and
	l.luopisktunn2010 = '' and l.ammopisktunn2010 = ''  then l.yoopisktunn2010 
	
	-- vain lukiokoulutuksen oppilaitos, merkitään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2011 <> '' and l.ammopisktunn2011 = '' and
	l.amkopisktunn2011 = '' and l.yoopisktunn2011 = '' then ''
	-- vain ammatillisen koulutuksen oppilaitos merkitään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2011 = '' and l.ammopisktunn2011 <> '' and
	l.amkopisktunn2011 ='' and yoopisktunn2011 = ''  then '' 
	-- lukiokoulutuksen ja ammatillisen koulutuksen oppilaitos, merkitään ammatillinen koulutus oppilaitos 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2011 <> '' and l.ammopisktunn2011 <> '' and
	l.amkopisktunn2011 = '' and l.yoopisktunn2011 = '' then l.ammopisktunn2011 
	-- vain ammattikorkeakoulutuksen oppilaitos, jätetään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2011  <> '' and l.yoopisktunn2011  = '' and
	l.luopisktunn2011 = '' and l.ammopisktunn2011 = '' then ''
	-- vin yliopistokoulutuksen oppilaitos, jätetään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2011 = '' and l.yoopisktunn2011 <> '' and 
	l.luopisktunn2011 = '' and l.ammopisktunn2011  = ''   then '' 
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen 2011 oppilaitos, merkitään yliopistokoulutuksen oppilaitos 2010 
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2011 <> '' and l.yoopisktunn2011  <> '' and
	l.luopisktunn2011 = '' and l.ammopisktunn2011 = ''  then l.yoopisktunn2011 
	
	-- vain lukiokoulutuksen oppilaitos, merkitään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2012 <> '' and l.ammopisktunn2012 = '' and
	l.amkopisktunn2012 = '' and l.yoopisktunn2012 = '' then ''
	-- vain ammatillisen koulutuksen oppilaitos merkitään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2012 = '' and l.ammopisktunn2012 <> '' and
	l.amkopisktunn2012 ='' and yoopisktunn2012 = ''  then '' 
	-- lukiokoulutuksen ja ammatillisen koulutuksen oppilaitos, merkitään ammatillinen koulutus oppilaitos 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2012 <> '' and l.ammopisktunn2012 <> '' and
	l.amkopisktunn2012 = '' and l.yoopisktunn2012 = '' then l.ammopisktunn2012 
	-- vain ammattikorkeakoulutuksen oppilaitos, jätetään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2012  <> '' and l.yoopisktunn2012  = '' and
	l.luopisktunn2012 = '' and l.ammopisktunn2012 = '' then ''
	-- vin yliopistokoulutuksen oppilaitos, jätetään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2012 = '' and l.yoopisktunn2012 <> '' and 
	l.luopisktunn2012 = '' and l.ammopisktunn2012  = ''   then '' 
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen 2012 oppilaitos, merkitään yliopistokoulutuksen oppilaitos 2010 
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2012 <> '' and l.yoopisktunn2012  <> '' and
	l.luopisktunn2012 = '' and l.ammopisktunn2012 = ''  then l.yoopisktunn2012 

		-- vain lukiokoulutuksen oppilaitos, merkitään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2013 <> '' and l.ammopisktunn2013 = '' and
	l.amkopisktunn2013 = '' and l.yoopisktunn2013 = '' then ''
	-- vain ammatillisen koulutuksen oppilaitos merkitään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2013 = '' and l.ammopisktunn2013 <> '' and
	l.amkopisktunn2013 ='' and yoopisktunn2013 = ''  then '' 
	-- lukiokoulutuksen ja ammatillisen koulutuksen oppilaitos, merkitään ammatillinen koulutus oppilaitos 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2013 <> '' and l.ammopisktunn2013 <> '' and
	l.amkopisktunn2013 = '' and l.yoopisktunn2013 = '' then l.ammopisktunn2013 
	-- vain ammattikorkeakoulutuksen oppilaitos, jätetään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2013  <> '' and l.yoopisktunn2013  = '' and
	l.luopisktunn2013 = '' and l.ammopisktunn2013 = '' then ''
	-- vin yliopistokoulutuksen oppilaitos, jätetään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2013 = '' and l.yoopisktunn2013 <> '' and 
	l.luopisktunn2013 = '' and l.ammopisktunn2013  = ''   then '' 
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen 2013 oppilaitos, merkitään yliopistokoulutuksen oppilaitos 2010 
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2013 <> '' and l.yoopisktunn2013  <> '' and
	l.luopisktunn2013 = '' and l.ammopisktunn2013 = ''  then l.yoopisktunn2013 

	
	-- vain lukiokoulutuksen oppilaitos, merkitään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2014 <> '' and l.ammopisktunn2014 = '' and
	l.amkopisktunn2014 = '' and l.yoopisktunn2014 = '' then ''
	-- vain ammatillisen koulutuksen oppilaitos merkitään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2014 = '' and l.ammopisktunn2014 <> '' and
	l.amkopisktunn2014 ='' and yoopisktunn2014 = ''  then '' 
	-- lukiokoulutuksen ja ammatillisen koulutuksen oppilaitos, merkitään ammatillinen koulutus oppilaitos 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2014 <> '' and l.ammopisktunn2014 <> '' and
	l.amkopisktunn2014 = '' and l.yoopisktunn2014 = '' then l.ammopisktunn2014 
	-- vain ammattikorkeakoulutuksen oppilaitos, jätetään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2014  <> '' and l.yoopisktunn2014  = '' and
	l.luopisktunn2014 = '' and l.ammopisktunn2014 = '' then ''
	-- vin yliopistokoulutuksen oppilaitos, jätetään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2014 = '' and l.yoopisktunn2014 <> '' and 
	l.luopisktunn2014 = '' and l.ammopisktunn2014  = ''   then '' 
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen 2014 oppilaitos, merkitään yliopistokoulutuksen oppilaitos 2010 
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2014 <> '' and l.yoopisktunn2014  <> '' and
	l.luopisktunn2014 = '' and l.ammopisktunn2014 = ''  then l.yoopisktunn2014 
	
	-- vain lukiokoulutuksen oppilaitos, merkitään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2015 <> '' and l.ammopisktunn2015 = '' and
	l.amkopisktunn2015 = '' and l.yoopisktunn2015 = '' then ''
	-- vain ammatillisen koulutuksen oppilaitos merkitään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2015 = '' and l.ammopisktunn2015 <> '' and
	l.amkopisktunn2015 ='' and yoopisktunn2015 = ''  then '' 
	-- lukiokoulutuksen ja ammatillisen koulutuksen oppilaitos, merkitään ammatillinen koulutus oppilaitos 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopisktunn2015 <> '' and l.ammopisktunn2015 <> '' and
	l.amkopisktunn2015 = '' and l.yoopisktunn2015 = '' then l.ammopisktunn2015 
	-- vain ammattikorkeakoulutuksen oppilaitos, jätetään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2015  <> '' and l.yoopisktunn2015  = '' and
	l.luopisktunn2015 = '' and l.ammopisktunn2015 = '' then ''
	-- vin yliopistokoulutuksen oppilaitos, jätetään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2015 = '' and l.yoopisktunn2015 <> '' and 
	l.luopisktunn2015 = '' and l.ammopisktunn2015  = ''   then '' 
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen 2015 oppilaitos, merkitään yliopistokoulutuksen oppilaitos 2010 
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopisktunn2015 <> '' and l.yoopisktunn2015  <> '' and
	l.luopisktunn2015 = '' and l.ammopisktunn2015 = ''  then l.yoopisktunn2015 
	
	else ''
	    end),
-- Koulutuksen järjestäjä 2
	(case
	-- lukiokoulutuksen järjestäjä vain 2009, merkitään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2009  <> '' and l.ammopiskjarj2009 = '' and
	l.amkopiskjarj2009 = '' and l.yoopiskjarj2009 = '' then ''
	-- ammatillisen koulutuksen järjestäjä vain 2009, merkitään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2009 = '' and l.ammopiskjarj2009 <> '' and
	l.amkopiskjarj2009 ='' and l.yoopiskjarj2009 = ''  then ''
	-- lukiokoulutuksen ja ammatillisen koulutuksen järjestäjä, merkitään ammatillisen koulutuksen järjestäjä 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2009 <> '' and l.ammopiskjarj2009 <> '' and
	l.amkopiskjarj2009 = '' and l.yoopiskjarj2009 = '' then l.ammopiskjarj2009 
	-- vain ammattikorkeakoulutuksen järjestäjä merkitään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2009  <> '' and l.yoopiskjarj2009   = '' and
	l.luopiskjarj2009 = '' and l.ammopiskjarj2009 = '' then ''
	-- vain yliopistokoulutuksen järjestäjä, merkitään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2009  = '' and l.yoopiskjarj2009  <> '' and 
	l.luopiskjarj2009  = '' and l.ammopiskjarj2009 = ''   then ''
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen järjestäjä merkitään yliopistokoulutuksen järjetäjä 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2009  <> '' and l.yoopiskjarj2009   <> '' and
	l.luopiskjarj2009  = '' and l.ammopiskjarj2009  = ''  then l.yoopiskjarj2009 
	
	
	-- vain lukiokoulutuksen järjestäjä, jätetään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2010  <> '' and l.ammopiskjarj2010 = '' and
	l.amkopiskjarj2010 = '' and l.yoopiskjarj2010 = '' then ''
	-- vain ammattikoulutuksen järjestäjä, jätetään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2010 = '' and l.ammopiskjarj2010 <> '' and
	l.amkopiskjarj2010 ='' and l.yoopiskjarj2010 = ''  then ''
	-- lukiokoulutuksen ja ammatillisen koulutuksen järjestäjä, merkitään ammatillisen koulutuksen järjestäjä 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2010 <> '' and l.ammopiskjarj2010 <> '' and
	l.amkopiskjarj2010 = '' and l.yoopiskjarj2010 = '' then l.ammopiskjarj2010 
	-- vain ammattikorkeakoulutuksen järjestäjä merkitään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2010  <> '' and l.yoopiskjarj2010   = '' and
	l.luopiskjarj2010 = '' and l.ammopiskjarj2010 = '' then ''
	-- vain yliopistokoulutuksen järjestäjä, jätetään tyhjäksi 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2010  = '' and l.yoopiskjarj2010  <> '' and 
	l.luopiskjarj2010  = '' and l.ammopiskjarj2010 = ''   then ''
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen järjestjät, merkitään yliopistokoulutuksen järjestäjä 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2010  <> '' and l.yoopiskjarj2010   <> '' and
	l.luopiskjarj2010  = '' and l.ammopiskjarj2010  = ''  then l.yoopiskjarj2010 
	
	-- vain lukiokoulutuksen järjestäjä, jätetään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2011  <> '' and l.ammopiskjarj2011 = '' and
	l.amkopiskjarj2011 = '' and l.yoopiskjarj2011 = '' then ''
	-- vain ammattikoulutuksen järjestäjä, jätetään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2011 = '' and l.ammopiskjarj2011 <> '' and
	l.amkopiskjarj2011 ='' and l.yoopiskjarj2011 = ''  then ''
	-- lukiokoulutuksen ja ammatillisen koulutuksen järjestäjä, merkitään ammatillisen koulutuksen järjestäjä 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2011 <> '' and l.ammopiskjarj2011 <> '' and
	l.amkopiskjarj2011 = '' and l.yoopiskjarj2011 = '' then l.ammopiskjarj2011 
	-- vain ammattikorkeakoulutuksen järjestäjä merkitään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2011  <> '' and l.yoopiskjarj2011   = '' and
	l.luopiskjarj2011 = '' and l.ammopiskjarj2011 = '' then ''
	-- vain yliopistokoulutuksen järjestäjä, jätetään tyhjäksi 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2011  = '' and l.yoopiskjarj2011  <> '' and 
	l.luopiskjarj2011 = '' and l.ammopiskjarj2011 = ''   then ''
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen järjestjät, merkitään yliopistokoulutuksen järjestäjä 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2011  <> '' and l.yoopiskjarj2011   <> '' and
	l.luopiskjarj2011  = '' and l.ammopiskjarj2011  = ''  then l.yoopiskjarj2011 
	
	-- vain lukiokoulutuksen järjestäjä, jätetään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2012  <> '' and l.ammopiskjarj2012 = '' and
	l.amkopiskjarj2012 = '' and l.yoopiskjarj2012 = '' then ''
	-- vain ammattikoulutuksen järjestäjä, jätetään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2012 = '' and l.ammopiskjarj2012 <> '' and
	l.amkopiskjarj2012 ='' and l.yoopiskjarj2012 = ''  then ''
	-- lukiokoulutuksen ja ammatillisen koulutuksen järjestäjä, merkitään ammatillisen koulutuksen järjestäjä 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2012 <> '' and l.ammopiskjarj2012 <> '' and
	l.amkopiskjarj2012 = '' and l.yoopiskjarj2012 = '' then l.ammopiskjarj2012 
	-- vain ammattikorkeakoulutuksen järjestäjä merkitään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2012  <> '' and l.yoopiskjarj2012   = '' and
	l.luopiskjarj2012 = '' and l.ammopiskjarj2012 = '' then ''
	-- vain yliopistokoulutuksen järjestäjä, jätetään tyhjäksi 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2012  = '' and l.yoopiskjarj2012  <> '' and 
	l.luopiskjarj2012 = '' and l.ammopiskjarj2012 = ''   then ''
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen järjestjät, merkitään yliopistokoulutuksen järjestäjä 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2012  <> '' and l.yoopiskjarj2012   <> '' and
	l.luopiskjarj2012  = '' and l.ammopiskjarj2012  = ''  then l.yoopiskjarj2012 

		-- vain lukiokoulutuksen järjestäjä, jätetään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2013  <> '' and l.ammopiskjarj2013 = '' and
	l.amkopiskjarj2013 = '' and l.yoopiskjarj2013 = '' then ''
	-- vain ammattikoulutuksen järjestäjä, jätetään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2013 = '' and l.ammopiskjarj2013 <> '' and
	l.amkopiskjarj2013 ='' and l.yoopiskjarj2013 = ''  then ''
	-- lukiokoulutuksen ja ammatillisen koulutuksen järjestäjä, merkitään ammatillisen koulutuksen järjestäjä 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2013 <> '' and l.ammopiskjarj2013 <> '' and
	l.amkopiskjarj2013 = '' and l.yoopiskjarj2013 = '' then l.ammopiskjarj2013 
	-- vain ammattikorkeakoulutuksen järjestäjä merkitään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2013  <> '' and l.yoopiskjarj2013   = '' and
	l.luopiskjarj2013 = '' and l.ammopiskjarj2013 = '' then ''
	-- vain yliopistokoulutuksen järjestäjä, jätetään tyhjäksi 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2013  = '' and l.yoopiskjarj2013  <> '' and 
	l.luopiskjarj2013 = '' and l.ammopiskjarj2013 = ''   then ''
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen järjestjät, merkitään yliopistokoulutuksen järjestäjä 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2013  <> '' and l.yoopiskjarj2013   <> '' and
	l.luopiskjarj2013  = '' and l.ammopiskjarj2013  = ''  then l.yoopiskjarj2013 

	-- vain lukiokoulutuksen järjestäjä, jätetään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2014  <> '' and l.ammopiskjarj2014 = '' and
	l.amkopiskjarj2014 = '' and l.yoopiskjarj2014 = '' then ''
	-- vain ammattikoulutuksen järjestäjä, jätetään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2014 = '' and l.ammopiskjarj2014 <> '' and
	l.amkopiskjarj2014 ='' and l.yoopiskjarj2014 = ''  then ''
	-- lukiokoulutuksen ja ammatillisen koulutuksen järjestäjä, merkitään ammatillisen koulutuksen järjestäjä 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2014 <> '' and l.ammopiskjarj2014 <> '' and
	l.amkopiskjarj2014 = '' and l.yoopiskjarj2014 = '' then l.ammopiskjarj2014 
	-- vain ammattikorkeakoulutuksen järjestäjä merkitään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2014  <> '' and l.yoopiskjarj2014   = '' and
	l.luopiskjarj2014 = '' and l.ammopiskjarj2014 = '' then ''
	-- vain yliopistokoulutuksen järjestäjä, jätetään tyhjäksi 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2014  = '' and l.yoopiskjarj2014  <> '' and 
	l.luopiskjarj2014 = '' and l.ammopiskjarj2014 = ''   then ''
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen järjestjät, merkitään yliopistokoulutuksen järjestäjä 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2014  <> '' and l.yoopiskjarj2014   <> '' and
	l.luopiskjarj2014  = '' and l.ammopiskjarj2014  = ''  then l.yoopiskjarj2014 

	-- vain lukiokoulutuksen järjestäjä, jätetään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2015  <> '' and l.ammopiskjarj2015 = '' and
	l.amkopiskjarj2015 = '' and l.yoopiskjarj2015 = '' then ''
	-- vain ammattikoulutuksen järjestäjä, jätetään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2015 = '' and l.ammopiskjarj2015 <> '' and
	l.amkopiskjarj2015 ='' and l.yoopiskjarj2015 = ''  then ''
	-- lukiokoulutuksen ja ammatillisen koulutuksen järjestäjä, merkitään ammatillisen koulutuksen järjestäjä 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskjarj2015 <> '' and l.ammopiskjarj2015 <> '' and
	l.amkopiskjarj2015 = '' and l.yoopiskjarj2015 = '' then l.ammopiskjarj2015 
	-- vain ammattikorkeakoulutuksen järjestäjä merkitään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2015  <> '' and l.yoopiskjarj2015   = '' and
	l.luopiskjarj2015 = '' and l.ammopiskjarj2015 = '' then ''
	-- vain yliopistokoulutuksen järjestäjä, jätetään tyhjäksi 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2015  = '' and l.yoopiskjarj2015  <> '' and 
	l.luopiskjarj2015 = '' and l.ammopiskjarj2015 = ''   then ''
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen järjestjät, merkitään yliopistokoulutuksen järjestäjä 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskjarj2015  <> '' and l.yoopiskjarj2015   <> '' and
	l.luopiskjarj2015  = '' and l.ammopiskjarj2015  = ''  then l.yoopiskjarj2015 

	else ''
	    end),
-- Koulutuksen maakunta 2
	(case
	-- vain lukiokoulutuksen maakunta 2009, jätetään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2009   <> '' and l.ammopiskmaak2009  = '' and
	l.amkopiskmaak2009  = '' and l.yoopiskmaak2009  = '' then ''
	-- vain ammatillisen koulutuksen maakunta 2009, jätetään tyhjäksi   
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2009  = '' and l.ammopiskmaak2009  <> '' and
	l.amkopiskmaak2009  ='' and l.yoopiskmaak2009  = ''  then ''  
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta, merkitään ammatillisen koulutuksen maakunta 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2009  <> '' and l.ammopiskmaak2009  <> '' and
	l.amkopiskmaak2009  = '' and l.yoopiskmaak2009  = '' then l.ammopiskmaak2009 
	-- vain ammattikorkeakoulutuksen maakunta 2009, jätetään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2009   <> '' and l.yoopiskmaak2009   = '' and
	l.luopiskmaak2009 = '' and l.ammopiskmaak2009 = '' then '' 
	-- vain yliopistokoulutuksen maakunta 2009, merkitään tyhjäksi
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2009  = '' and l.yoopiskmaak2009  <> '' and 
	l.luopiskmaak2010  = '' and l.ammopiskmaak2009 = ''   then '' 
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen maakunta 2009, merkitään yliopistokoulutuksen maakunta 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2009  <> '' and l.yoopiskmaak2009   <> '' and
	l.luopiskjarj2009  = '' and l.ammopiskmaak2009  = ''  then l.yoopiskmaak2009
	
	
	-- vain lukiokoulutuksen maakunta 2010, merkitään tyhjäksi
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2010   <> '' and l.ammopiskmaak2010  = '' and
	l.amkopiskmaak2010  = '' and yoopiskmaak2010  = '' then ''
	-- vain ammatillisen koulutuksen maakunta 2010, merkitään tyhjäksi   
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2010  = '' and l.ammopiskmaak2010  <> '' and
	l.amkopiskmaak2010  ='' and l.yoopiskmaak2010  = ''  then ''  
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta 2010, merkitään ammatillisen koulutuksen maakunta
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2010  <> '' and l.ammopiskmaak2010  <> '' and
	l.amkopiskmaak2010  = '' and l.yoopiskmaak2010  = '' then l.ammopiskmaak2010 
	-- vain ammattikorkeakoulutuksen maakunta 2010, merkitään tyhjäksi
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2010   <> '' and l.yoopiskmaak2010   = '' and
	l.luopiskmaak2010 = '' and l.ammopiskmaak2010 = '' then '' 
	-- vain yliopistokoulutuksen maakunta 2010, merkitään tyhjäksi
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2010  = '' and l.yoopiskmaak2010  <> '' and 
	l.luopiskmaak2010  = '' and l.ammopiskmaak2010 = ''   then ''  
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen maakunta 2010, merkitään yliopistokoulutuksen 2010 maakunta 
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2010  <> '' and l.yoopiskmaak2010   <> '' and
	l.luopiskmaak2010  = '' and l.ammopiskmaak2010  = ''  then l.yoopiskmaak2010  
	
	
	-- vain lukiokoulutuksen maakunta 2011, merkitään tyhjäksi
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2011   <> '' and l.ammopiskmaak2011  = '' and
	l.amkopiskmaak2011  = '' and yoopiskmaak2011  = '' then ''
	-- vain ammatillisen koulutuksen maakunta 2011, merkitään tyhjäksi   
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2011  = '' and l.ammopiskmaak2011  <> '' and
	l.amkopiskmaak2011  = '' and l.yoopiskmaak2011  = ''  then ''  
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta 2011, merkitään ammatillisen koulutuksen maakunta
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2011  <> '' and l.ammopiskmaak2011  <> '' and
	l.amkopiskmaak2011  = '' and l.yoopiskmaak2011  = '' then l.ammopiskmaak2011 
	-- vain ammattikorkeakoulutuksen maakunta 2011, merkitään tyhjäksi
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2011   <> '' and l.yoopiskmaak2011   = '' and
	l.luopiskmaak2011 = '' and l.ammopiskmaak2011 = '' then '' 
	-- vain yliopistokoulutuksen maakunta 2011, merkitään tyhjäksi
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2011  = '' and l.yoopiskmaak2011  <> '' and 
	l.luopiskmaak2011  = '' and l.ammopiskmaak2011 = ''   then ''  
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen maakunta 2011, merkitään yliopistokoulutuksen 2010 maakunta 
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2011  <> '' and l.yoopiskmaak2011   <> '' and
	l.luopiskmaak2011  = '' and l.ammopiskmaak2011  = ''  then l.yoopiskmaak2011  
	
	
	-- vain lukiokoulutuksen maakunta 2012, merkitään tyhjäksi
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2012   <> '' and l.ammopiskmaak2012  = '' and
	l.amkopiskmaak2012  = '' and yoopiskmaak2012  = '' then ''
	-- vain ammatillisen koulutuksen maakunta 2012, merkitään tyhjäksi   
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2012  = '' and l.ammopiskmaak2012  <> '' and
	l.amkopiskmaak2012  = '' and l.yoopiskmaak2012  = ''  then ''  
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta 2012, merkitään ammatillisen koulutuksen maakunta
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2012  <> '' and l.ammopiskmaak2012  <> '' and
	l.amkopiskmaak2012  = '' and l.yoopiskmaak2012  = '' then l.ammopiskmaak2012 
	-- vain ammattikorkeakoulutuksen maakunta 2012, merkitään tyhjäksi
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2012   <> '' and l.yoopiskmaak2012   = '' and
	l.luopiskmaak2012 = '' and l.ammopiskmaak2012 = '' then '' 
	-- vain yliopistokoulutuksen maakunta 2012, merkitään tyhjäksi
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2012  = '' and l.yoopiskmaak2012  <> '' and 
	l.luopiskmaak2012  = '' and l.ammopiskmaak2012 = ''   then ''  
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen maakunta 2012, merkitään yliopistokoulutuksen 2010 maakunta 
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2012  <> '' and l.yoopiskmaak2012   <> '' and
	l.luopiskmaak2012  = '' and l.ammopiskmaak2012  = ''  then l.yoopiskmaak2012  

			-- vain lukiokoulutuksen maakunta 2013, merkitään tyhjäksi
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2013   <> '' and l.ammopiskmaak2013  = '' and
	l.amkopiskmaak2013  = '' and yoopiskmaak2013  = '' then ''
	-- vain ammatillisen koulutuksen maakunta 2013, merkitään tyhjäksi   
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2013  = '' and l.ammopiskmaak2013  <> '' and
	l.amkopiskmaak2013  = '' and l.yoopiskmaak2013  = ''  then ''  
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta 2013, merkitään ammatillisen koulutuksen maakunta
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2013  <> '' and l.ammopiskmaak2013  <> '' and
	l.amkopiskmaak2013  = '' and l.yoopiskmaak2013  = '' then l.ammopiskmaak2013 
	-- vain ammattikorkeakoulutuksen maakunta 2013, merkitään tyhjäksi
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2013   <> '' and l.yoopiskmaak2013   = '' and
	l.luopiskmaak2013 = '' and l.ammopiskmaak2013 = '' then '' 
	-- vain yliopistokoulutuksen maakunta 2013, merkitään tyhjäksi
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2013  = '' and l.yoopiskmaak2013  <> '' and 
	l.luopiskmaak2013  = '' and l.ammopiskmaak2013 = ''   then ''  
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen maakunta 2013, merkitään yliopistokoulutuksen 2010 maakunta 
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2013  <> '' and l.yoopiskmaak2013   <> '' and
	l.luopiskmaak2013  = '' and l.ammopiskmaak2013  = ''  then l.yoopiskmaak2013  


	-- vain lukiokoulutuksen maakunta 2014, merkitään tyhjäksi
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2014   <> '' and l.ammopiskmaak2014  = '' and
	l.amkopiskmaak2014  = '' and yoopiskmaak2014  = '' then ''
	-- vain ammatillisen koulutuksen maakunta 2014, merkitään tyhjäksi   
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2014  = '' and l.ammopiskmaak2014  <> '' and
	l.amkopiskmaak2014  = '' and l.yoopiskmaak2014  = ''  then ''  
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta 2014, merkitään ammatillisen koulutuksen maakunta
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2014  <> '' and l.ammopiskmaak2014  <> '' and
	l.amkopiskmaak2014  = '' and l.yoopiskmaak2014  = '' then l.ammopiskmaak2014 
	-- vain ammattikorkeakoulutuksen maakunta 2014, merkitään tyhjäksi
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2014   <> '' and l.yoopiskmaak2014   = '' and
	l.luopiskmaak2014 = '' and l.ammopiskmaak2014 = '' then '' 
	-- vain yliopistokoulutuksen maakunta 2014, merkitään tyhjäksi
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2014  = '' and l.yoopiskmaak2014  <> '' and 
	l.luopiskmaak2014  = '' and l.ammopiskmaak2014 = ''   then ''  
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen maakunta 2014, merkitään yliopistokoulutuksen 2010 maakunta 
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2014  <> '' and l.yoopiskmaak2014   <> '' and
	l.luopiskmaak2014  = '' and l.ammopiskmaak2014  = ''  then l.yoopiskmaak2014  
	
	-- vain lukiokoulutuksen maakunta 2015, merkitään tyhjäksi
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2015   <> '' and l.ammopiskmaak2015  = '' and
	l.amkopiskmaak2015  = '' and yoopiskmaak2015  = '' then ''
	-- vain ammatillisen koulutuksen maakunta 2015, merkitään tyhjäksi   
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2015  = '' and l.ammopiskmaak2015  <> '' and
	l.amkopiskmaak2015  = '' and l.yoopiskmaak2015  = ''  then ''  
	-- lukiokoulutuksen ja ammatillisen koulutuksen maakunta 2015, merkitään ammatillisen koulutuksen maakunta
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.luopiskmaak2015  <> '' and l.ammopiskmaak2015  <> '' and
	l.amkopiskmaak2015  = '' and l.yoopiskmaak2015  = '' then l.ammopiskmaak2015 
	-- vain ammattikorkeakoulutuksen maakunta 2015, merkitään tyhjäksi
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2015   <> '' and l.yoopiskmaak2015   = '' and
	l.luopiskmaak2015 = '' and l.ammopiskmaak2015 = '' then '' 
	-- vain yliopistokoulutuksen maakunta 2015, merkitään tyhjäksi
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2015  = '' and l.yoopiskmaak2015  <> '' and 
	l.luopiskmaak2015  = '' and l.ammopiskmaak2015 = ''   then ''  
	-- ammattikorkeakoulutuksen ja yliopistokoulutuksen maakunta 2015, merkitään yliopistokoulutuksen 2010 maakunta 
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' and l.amkopiskmaak2015  <> '' and l.yoopiskmaak2015   <> '' and
	l.luopiskmaak2015  = '' and l.ammopiskmaak2015  = ''  then l.yoopiskmaak2015   
	
	else ''
	
	    end),
	-- Monihaku
	(case
	-- 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' then l.monihaku2009
	--2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1'  then l.monihaku2010
	-- 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' then l.monihaku2011
	
	-- 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' then l.monihaku2012
		-- 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' then l.monihaku2013

	-- 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' then l.monihaku2014
	--2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' then l.monihaku2015

	else '8'
	end),
    -- Pääasiallinen toiminta
    (case
    -- 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' then l.ptoim1r4_2009
	-- 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' then l.ptoim1r4_2010 
	-- 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' then l.ptoim1r4_2011
	-- 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' then l.ptoim1r4_2012
	-- 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' then l.ptoim1r4_2013

	-- 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' then l.ptoim1r4_2014
	-- 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' then l.ptoim1r4_2015
   
	else ''
	end),
	-- Ammattiasema
	(case
	-- 2009
	when l.suorv = @ensimmainen_suoritusvuosi and l.suorlk = '1' then l.amas_2009
	-- 2010
	when l.suorv = @toinen_suoritusvuosi and l.suorlk = '1' then l.amas_2010
	-- 2011
	when l.suorv = @kolmas_suoritusvuosi and l.suorlk = '1' then l.amas_2011
	-- 2012
	when l.suorv = @neljas_suoritusvuosi and l.suorlk = '1' then l.amas_2012
	-- 2013
	when l.suorv = @viides_suoritusvuosi and l.suorlk = '1' then l.amas_2013

	-- 2014
	when l.suorv = @kuudes_suoritusvuosi and l.suorlk = '1' then l.amas_2014
	-- 2015
	when l.suorv = @seitsemas_suoritusvuosi and l.suorlk = '1' then l.amas_2015

	else ''
	end),
    l.lkm,
	l.pohjkoul,
 l.tietolahde,
 'K3.12',
 -- Lukiokoulutuksessa
 (case
	    when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1' ) and  l.luopiskkoulk2009 <> '' and l.ammopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2009 = '' then '1' 
	    when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1' ) and  l.luopiskkoulk2010 <> '' and l.ammopiskkoulk2010 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then '1'  
	    when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1' ) and  l.luopiskkoulk2011 <> '' and l.ammopiskkoulk2011 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then '1'  
        when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1' ) and  l.luopiskkoulk2012 <> '' and l.ammopiskkoulk2012 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then '1'  
			when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1' ) and  l.luopiskkoulk2013 <> '' and l.ammopiskkoulk2013 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then '1'  
			when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1' ) and  l.luopiskkoulk2014 <> '' and l.ammopiskkoulk2014 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then '1'  
		when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1' ) and  l.luopiskkoulk2015 <> '' and l.ammopiskkoulk2015 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then '1'  
	    else '0'
	 
	    end) as lukiokoulutuksessa,
 -- Ammatillisessa koulutuksessa 
 (case
	    when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2009  <> '' and l.luopiskkoulk2009 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then '1' 
	    when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2010 <> '' and l.luopiskkoulk2010  = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then '1'   
	    when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2011 <> '' and l.luopiskkoulk2011  = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then '1'    
	    when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2012 <> '' and l.luopiskkoulk2012  = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then '1'    
		when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2013 <> '' and l.luopiskkoulk2013  = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then '1'  
		when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2014 <> '' and l.luopiskkoulk2014  = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then '1'    
		when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2015 <> '' and l.luopiskkoulk2015  = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then '1'      
	   
	    else '0'
	    end) as ammatillisessa_koulutuksessa,
-- Ammattikorkeakoulutuksessa
 (case
	   when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1') and  l.amkopiskkoulk2009 <> '' and l.ammopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.luopiskkoulk2009 = '' then  '1'
	   when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1') and  l.amkopiskkoulk2010 <> '' and l.ammopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.luopiskkoulk2010 = '' then  '1'
	   when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1') and  l.amkopiskkoulk2011 <> '' and l.ammopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.luopiskkoulk2011 = '' then  '1'
	    when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1') and  l.amkopiskkoulk2012 <> '' and l.ammopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.luopiskkoulk2012 = '' then  '1'
		 when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1') and  l.amkopiskkoulk2013<> '' and l.ammopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.luopiskkoulk2013 = '' then  '1'
		  when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1') and  l.amkopiskkoulk2014<> '' and l.ammopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.luopiskkoulk2014 = '' then  '1'
	   when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1') and  l.amkopiskkoulk2015<> '' and l.ammopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.luopiskkoulk2015 = '' then  '1'
	   else '0' 
	   end) as ammattikorkeakoulutuksessa,
-- Yliopistokoulutuksessa
 (case
	    when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1') and  l.yoopiskkoulk2009  <> '' and l.amkopiskkoulk2009 = '' and l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = '' then '1' 
	    when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1') and  l.yoopiskkoulk2010 <> '' and l.amkopiskkoulk2010 = '' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' then '1'  
	    when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1') and  l.yoopiskkoulk2011 <> '' and l.amkopiskkoulk2011 = '' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' then '1'  	   
	    when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1') and  l.yoopiskkoulk2012 <> '' and l.amkopiskkoulk2012 = '' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' then '1'  	   
	    	    when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1') and  l.yoopiskkoulk2013 <> '' and l.amkopiskkoulk2013 = '' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' then '1'
				when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1') and  l.yoopiskkoulk2014 <> '' and l.amkopiskkoulk2014 = '' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' then '1'
        when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1') and  l.yoopiskkoulk2015 <> '' and l.amkopiskkoulk2015 = '' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' then '1'
	    else '0'
	    end) as yliopistokoulutuksessa,
-- Lukiokoulutuksessa ja ammatillisessa koulutuksessa
(case
	    when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1') and  l.luopiskkoulk2009  <> '' and l.ammopiskkoulk2009 <> '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009  = '' then '1' 
	    when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1') and  l.luopiskkoulk2010 <> '' and l.ammopiskkoulk2010 <> '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then '1'  
	    when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1') and  l.luopiskkoulk2011 <> '' and l.ammopiskkoulk2011 <> '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then '1'  
	   	when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1') and  l.luopiskkoulk2012 <> '' and l.ammopiskkoulk2012 <> '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then '1'  
			when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1') and  l.luopiskkoulk2013 <> '' and l.ammopiskkoulk2013 <> '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then '1'  
			when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1') and  l.luopiskkoulk2014 <> '' and l.ammopiskkoulk2014 <> '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then '1'  
		when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1') and  l.luopiskkoulk2015 <> '' and l.ammopiskkoulk2015 <> '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then '1'  
	    else '0'
	    end) as lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa,
-- Toisen asteen ammatillisessa koulutuksessa ja korkeakoulutuksessa
(case
	    when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2009  <> '' and l.amkopiskkoulk2009 <> '' and l.luopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then '1' 
	    when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2010  <> '' and l.amkopiskkoulk2010 <> ''  and l.luopiskkoulk2010 = '' and l.yoopiskkoulk2010  = '' then '1' 
	    when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2011 <> '' and l.amkopiskkoulk2011 <> ''  and l.luopiskkoulk2011 = '' and l.yoopiskkoulk2011  = '' then '1'  
	 	when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2012 <> '' and l.amkopiskkoulk2012 <> ''  and l.luopiskkoulk2012 = '' and l.yoopiskkoulk2012  = '' then '1'  
        when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2013 <> '' and l.amkopiskkoulk2013 <> ''  and l.luopiskkoulk2013 = '' and l.yoopiskkoulk2013  = '' then '1' 
	    when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2014 <> '' and l.amkopiskkoulk2014 <> ''  and l.luopiskkoulk2014 = '' and l.yoopiskkoulk2014  = '' then '1'   
		when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1') and  l.ammopiskkoulk2015 <> '' and l.amkopiskkoulk2015 <> ''  and l.luopiskkoulk2015 = '' and l.yoopiskkoulk2015  = '' then '1'   
	    else '0'
	    end) as toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa,
-- Ammattikorkeakoulutuksessa ja yliopistokoulutuksessa
(case
	    when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1') and  l.amkopiskkoulk2009  <> '' and l.yoopiskkoulk2009 <> '' and l.ammopiskkoulk2009  = '' and l.luopiskkoulk2009 = ''  then '1' 
	    when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1' ) and  l.amkopiskkoulk2010 <> '' and l.yoopiskkoulk2010 <> ''  and l.ammopiskkoulk2010  = '' and l.luopiskkoulk2010 = '' then '1'  
		 when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1' ) and  l.amkopiskkoulk2011 <> '' and l.yoopiskkoulk2011 <> ''  and l.ammopiskkoulk2011  = '' and l.luopiskkoulk2011 = '' then '1'  
	    when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1' ) and  l.amkopiskkoulk2012 <> '' and l.yoopiskkoulk2012 <> ''  and l.ammopiskkoulk2012  = '' and l.luopiskkoulk2012 = '' then '1'  
	     when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1' ) and  l.amkopiskkoulk2013 <> '' and l.yoopiskkoulk2013 <> ''  and l.ammopiskkoulk2013  = '' and l.luopiskkoulk2013 = '' then '1' 
		   when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1' ) and  l.amkopiskkoulk2014 <> '' and l.yoopiskkoulk2014 <> ''  and l.ammopiskkoulk2014  = '' and l.luopiskkoulk2014 = '' then '1'  
		when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1' ) and  l.amkopiskkoulk2015 <> '' and l.yoopiskkoulk2015 <> ''  and l.ammopiskkoulk2015  = '' and l.luopiskkoulk2015 = '' then '1'  
	    else '0'
	    end) as ammattikorkekoulutuksessa_ja_yliopistokoulutuksessa,    
-- Koulutuksen päättäneiden toiminta
(case
	   -- Tutkintoon johtavassa koulutuksessa olevat
	   when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1')  and (l.ptoim1r4_2009 = '22' or l.ptoim1r4_2009 = '13') 
	   and (l.luopiskkoulk2009 <> '' or l.ammopiskkoulk2009<>'' or l.amkopiskkoulk2009 <> '' or l.yoopiskkoulk2009<>'') then '1' 
	   when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1') and  (l.ptoim1r4_2010 = '22' or l.ptoim1r4_2010  = '13')
	   and (l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010<>'' or l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010<>'') then '1' 
	   when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1') and  (l.ptoim1r4_2011 = '22' or l.ptoim1r4_2011 = '13')
	   and (l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011<>'' or l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011<>'')then '1' 
	    when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1') and  (l.ptoim1r4_2012 = '22' or l.ptoim1r4_2012 = '13')
	   and (l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012<>'' or l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012<>'')then '1' 
        when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1') and  (l.ptoim1r4_2013 = '22' or l.ptoim1r4_2013 = '13')
	   and (l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013<>'' or l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013<>'')then '1' 
	    when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1') and  (l.ptoim1r4_2014 = '22' or l.ptoim1r4_2014 = '13')
	   and (l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014<>'' or l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014<>'')then '1' 
	    when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1') and  (l.ptoim1r4_2015 = '22' or l.ptoim1r4_2015 = '13')
	   and (l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015<>'' or l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015<>'')then '1' 
	 
	   -- Ei tutkintoon johtavassa koulutuksessa olevat
	   when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1') and (l.ptoim1r4_2009 = '22' or l.ptoim1r4_2009 ='13')
	   and (l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009='' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009='') then '2' 
	   when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1' ) and (l.ptoim1r4_2010 = '22' or l.ptoim1r4_2010 = '13')
	   and (l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010='' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010='') then '2'  
	   when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1' ) and (l.ptoim1r4_2011 = '22' or l.ptoim1r4_2011 = '13')
	   and (l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011='' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011= '') then '2' 
	   when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1' ) and (l.ptoim1r4_2012 = '22' or l.ptoim1r4_2012 = '13')
	   and (l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012='' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012= '') then '2' 
	    when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1' ) and (l.ptoim1r4_2013 = '22' or l.ptoim1r4_2013 = '13')
	   and (l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 ='' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013= '') then '2' 
	    when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1' ) and (l.ptoim1r4_2014 = '22' or l.ptoim1r4_2014 = '13')
	   and (l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 ='' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014= '') then '2' 
	    when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1' ) and (l.ptoim1r4_2015 = '22' or l.ptoim1r4_2015 = '13')
	   and (l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 ='' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015= '') then '2' 


	   -- Ei opiskelevat työlliset
	   when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1')and  l.ptoim1r4_2009  = '10'  then '3' 
	   when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1' ) and  l.ptoim1r4_2010 = '10'  then '3'  
	   when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1' ) and  l.ptoim1r4_2011 = '10'  then '3'
	   when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1' ) and  l.ptoim1r4_2012 = '10'  then '3' 
	   when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1' ) and  l.ptoim1r4_2013 = '10'  then '3' 
	   when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1' ) and  l.ptoim1r4_2014 = '10'  then '3' 
	   when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1' ) and  l.ptoim1r4_2015 = '10'  then '3' 
 

	    
	   -- Ei opiskelevat työttömät
	   when l.suorv = @ensimmainen_suoritusvuosi and (l.suorlk = '1') and  l.ptoim1r4_2009  = '12'  then '4' 
	   when l.suorv = @toinen_suoritusvuosi and (l.suorlk = '1') and  l.ptoim1r4_2010 = '12'  then '4' 
	   when l.suorv = @kolmas_suoritusvuosi and (l.suorlk = '1') and  l.ptoim1r4_2011 = '12'  then '4' 
	   when l.suorv = @neljas_suoritusvuosi and (l.suorlk = '1') and  l.ptoim1r4_2012 = '12'  then '4' 
	   when l.suorv = @viides_suoritusvuosi and (l.suorlk = '1') and  l.ptoim1r4_2013 = '12'  then '4' 
	   when l.suorv = @kuudes_suoritusvuosi and (l.suorlk = '1') and  l.ptoim1r4_2014 = '12'  then '4'
	   when l.suorv = @seitsemas_suoritusvuosi and (l.suorlk = '1') and  l.ptoim1r4_2015 = '12'  then '4'
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

----OPISKELUT KYLLÄ/EI
--Opiskellut lukiokoulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.luopiskkoulk2008 <> '' or l.luopiskkoulk2009 <> '') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2009 <> '' or l.luopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '') then 1
	else 0
end as opisk_lu
--Opiskellut ammatillisessa peruskoulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.ammopiskkoulk2008 <> '' or l.ammopiskkoulk2009 <> '') and (d1c.Koulutusaste_taso2_koodi = '32' or d2c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2009 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '32' or d3c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '32' or d4c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '32' or d5c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '32' or d6c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '32' or d7c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '32' or d8c.Koulutusaste_taso2_koodi = '32') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d8c.Koulutusaste_taso2_koodi = '32' or d9c.Koulutusaste_taso2_koodi = '32') then 1
	else 0
end as opisk_amm_pk
--Opiskellut ammattitutkintokoulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.ammopiskkoulk2008 <> '' or l.ammopiskkoulk2009 <> '') and (d1c.Koulutusaste_taso2_koodi = '33' or d2c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2009 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '33' or d3c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '33' or d4c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '33' or d5c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '33' or d6c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '33' or d7c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '33' or d8c.Koulutusaste_taso2_koodi = '33') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d8c.Koulutusaste_taso2_koodi = '33' or d9c.Koulutusaste_taso2_koodi = '33') then 1
	else 0
end as opisk_amm_at
--Opiskellut erikoisammattitutkintokoulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.ammopiskkoulk2008 <> '' or l.ammopiskkoulk2009 <> '') and (d1c.Koulutusaste_taso2_koodi = '41' or d2c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2009 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '41' or d3c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '41' or d4c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '41' or d5c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '41' or d6c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '41' or d7c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '41' or d8c.Koulutusaste_taso2_koodi = '41') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d8c.Koulutusaste_taso2_koodi = '41' or d9c.Koulutusaste_taso2_koodi = '41') then 1
	else 0
end as opisk_amm_eat
--Opiskellut ammatillisessa koulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.ammopiskkoulk2008 <> '' or l.ammopiskkoulk2009 <> '') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2009 <> '' or l.ammopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') then 1
	else 0
end as opisk_amm
--Opiskellut ammattikorkeakoulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.amkopiskkoulk2008 <> '' or l.amkopiskkoulk2009 <> '') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2009 <> '' or l.amkopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '') then 1
	else 0
end as opisk_amk
--Opiskellut yliopistokoulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.yoopiskkoulk2008 <> '' or l.yoopiskkoulk2009 <> '') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2009 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2010 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2011 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2012 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2013 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2014 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.yoopiskkoulk2015 <> '' or l.yoopiskkoulk2016 <> '') then 1
	else 0
end as opisk_yo



----KOULUTUSALA, TASO 1 KYLLÄ/EI
--Opiskellut koulutusala1 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '01' or d2a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '01' or d3a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '01' or d4a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '01' or d5a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '01' or d6a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '01' or d7a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '01' or d8a.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '01' or d9a.iscfibroad2013_koodi = '01') then 1
	else 0
end as opisk_amk_koulala1
--Opiskellut koulutusala2 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '02' or d2a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '02' or d3a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '02' or d4a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '02' or d5a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '02' or d6a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '02' or d7a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '02' or d8a.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '02' or d9a.iscfibroad2013_koodi = '02') then 1
	else 0
end as opisk_amk_koulala2
--Opiskellut koulutusala3 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '03' or d2a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '03' or d3a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '03' or d4a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '03' or d5a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '03' or d6a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '03' or d7a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '03' or d8a.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '03' or d9a.iscfibroad2013_koodi = '03') then 1
	else 0
end as opisk_amk_koulala3
--Opiskellut koulutusala4 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '04' or d2a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '04' or d3a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '04' or d4a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '04' or d5a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '04' or d6a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '04' or d7a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '04' or d8a.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '04' or d9a.iscfibroad2013_koodi = '04') then 1
	else 0
end as opisk_amk_koulala4
--Opiskellut koulutusala5 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '05' or d2a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '05' or d3a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '05' or d4a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '05' or d5a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '05' or d6a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '05' or d7a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '05' or d8a.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '05' or d9a.iscfibroad2013_koodi = '05') then 1
	else 0
end as opisk_amk_koulala5
--Opiskellut koulutusala6 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '06' or d2a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '06' or d3a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '06' or d4a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '06' or d5a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '06' or d6a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '06' or d7a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '06' or d8a.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '06' or d9a.iscfibroad2013_koodi = '06') then 1
	else 0
end as opisk_amk_koulala6
--Opiskellut koulutusala7 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '07' or d2a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '07' or d3a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '07' or d4a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '07' or d5a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '07' or d6a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '07' or d7a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '07' or d8a.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '07' or d9a.iscfibroad2013_koodi = '07') then 1
	else 0
end as opisk_amk_koulala7
--Opiskellut koulutusala8 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '08' or d2a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '08' or d3a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '08' or d4a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '08' or d5a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '08' or d6a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '08' or d7a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '08' or d8a.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '08' or d9a.iscfibroad2013_koodi = '08') then 1
	else 0
end as opisk_amk_koulala8
--Opiskellut koulutusala9 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '09' or d2a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '09' or d3a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '09' or d4a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '09' or d5a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '09' or d6a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '09' or d7a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '09' or d8a.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '09' or d9a.iscfibroad2013_koodi = '09') then 1
	else 0
end as opisk_amk_koulala9
--Opiskellut koulutusala10 (amk) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1a.iscfibroad2013_koodi = '10' or d2a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2a.iscfibroad2013_koodi = '10' or d3a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3a.iscfibroad2013_koodi = '10' or d4a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4a.iscfibroad2013_koodi = '10' or d5a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5a.iscfibroad2013_koodi = '10' or d6a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6a.iscfibroad2013_koodi = '10' or d7a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7a.iscfibroad2013_koodi = '10' or d8a.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8a.iscfibroad2013_koodi = '10' or d9a.iscfibroad2013_koodi = '10') then 1
	else 0
end as opisk_amk_koulala10




--Opiskellut koulutusala1 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '01' or d2b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '01' or d3b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '01' or d4b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '01' or d5b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '01' or d6b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '01' or d7b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '01' or d8b.iscfibroad2013_koodi = '01') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '01' or d9b.iscfibroad2013_koodi = '01') then 1
	else 0
end as opisk_yo_koulala1
--Opiskellut koulutusala2 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '02' or d2b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '02' or d3b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '02' or d4b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '02' or d5b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '02' or d6b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '02' or d7b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '02' or d8b.iscfibroad2013_koodi = '02') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '02' or d9b.iscfibroad2013_koodi = '02') then 1
	else 0
end as opisk_yo_koulala2
--Opiskellut koulutusala3 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '03' or d2b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '03' or d3b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '03' or d4b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '03' or d5b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '03' or d6b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '03' or d7b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '03' or d8b.iscfibroad2013_koodi = '03') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '03' or d9b.iscfibroad2013_koodi = '03') then 1
	else 0
end as opisk_yo_koulala3
--Opiskellut koulutusala4 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '04' or d2b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '04' or d3b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '04' or d4b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '04' or d5b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '04' or d6b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '04' or d7b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '04' or d8b.iscfibroad2013_koodi = '04') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '04' or d9b.iscfibroad2013_koodi = '04') then 1
	else 0
end as opisk_yo_koulala4
--Opiskellut koulutusala5 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '05' or d2b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '05' or d3b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '05' or d4b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '05' or d5b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '05' or d6b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '05' or d7b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '05' or d8b.iscfibroad2013_koodi = '05') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '05' or d9b.iscfibroad2013_koodi = '05') then 1
	else 0
end as opisk_yo_koulala5
--Opiskellut koulutusala6 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '06' or d2b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '06' or d3b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '06' or d4b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '06' or d5b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '06' or d6b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '06' or d7b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '06' or d8b.iscfibroad2013_koodi = '06') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '06' or d9b.iscfibroad2013_koodi = '06') then 1
	else 0
end as opisk_yo_koulala6
--Opiskellut koulutusala7 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '07' or d2b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '07' or d3b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '07' or d4b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '07' or d5b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '07' or d6b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '07' or d7b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '07' or d8b.iscfibroad2013_koodi = '07') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '07' or d9b.iscfibroad2013_koodi = '07') then 1
	else 0
end as opisk_yo_koulala7
--Opiskellut koulutusala8 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '08' or d2b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '08' or d3b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '08' or d4b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '08' or d5b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '08' or d6b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '08' or d7b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '08' or d8b.iscfibroad2013_koodi = '08') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '08' or d9b.iscfibroad2013_koodi = '08') then 1
	else 0
end as opisk_yo_koulala8
--Opiskellut koulutusala9 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '09' or d2b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '09' or d3b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '09' or d4b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '09' or d5b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '09' or d6b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '09' or d7b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '09' or d8b.iscfibroad2013_koodi = '09') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '09' or d9b.iscfibroad2013_koodi = '09') then 1
	else 0
end as opisk_yo_koulala9
--Opiskellut koulutusala10 (yo) (taso 1) (kyllä/ei)
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (d1b.iscfibroad2013_koodi = '10' or d2b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (d2b.iscfibroad2013_koodi = '10' or d3b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (d3b.iscfibroad2013_koodi = '10' or d4b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (d4b.iscfibroad2013_koodi = '10' or d5b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (d5b.iscfibroad2013_koodi = '10' or d6b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (d6b.iscfibroad2013_koodi = '10' or d7b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (d7b.iscfibroad2013_koodi = '10' or d8b.iscfibroad2013_koodi = '10') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (d8b.iscfibroad2013_koodi = '10' or d9b.iscfibroad2013_koodi = '10') then 1
	else 0
end as opisk_yo_koulala10


--Opiskellut useampaa kuin yhtä alaa (taso 1) (kyllä/ei)
,case --ensimmäisenä vuotena on mahdollista olla vain yksi ala
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and m1.MinValue <> m1.MaxValue then 1 
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and m2.MinValue <> m2.MaxValue then 1 
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and m3.MinValue <> m3.MaxValue then 1 
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and m4.MinValue <> m4.MaxValue then 1 
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and m5.MinValue <> m5.MaxValue then 1 
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and m6.MinValue <> m6.MaxValue then 1 
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and m7.MinValue <> m7.MaxValue then 1 
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and m8.MinValue <> m8.MaxValue then 1 
	else 0
end as opisk_vah2_koulala


----HAUT KYLLÄ/EI
--Hakenut ammatilliseen koulutukseen
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.monihaku2008 in (2,3,5) or l.monihaku2009 in (2,3,5)) then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2009 in (2,3,5) or l.monihaku2010 in (2,3,5)) then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2010 in (2,3,5) or l.monihaku2011 in (2,3,5)) then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2011 in (2,3,5) or l.monihaku2012 in (2,3,5)) then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2012 in (2,3,5) or l.monihaku2013 in (2,3,5)) then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2013 in (2,3,5) or l.monihaku2014 in (2,3,5)) then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2014 in (2,3,5) or l.monihaku2015 in (2,3,5)) then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2015 in (2,3,5) or l.monihaku2016 in (2,3,5)) then 1
	else 0
end as haku_amm
--Hakenut ammattikorkeakoulutukseen
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.monihaku2008 in (4,6) or l.monihaku2009 in (4,6)) then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2009 in (4,6) or l.monihaku2010 in (4,6)) then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2010 in (4,6) or l.monihaku2011 in (4,6)) then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2011 in (4,6) or l.monihaku2012 in (4,6)) then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2012 in (4,6) or l.monihaku2013 in (4,6)) then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2013 in (4,6) or l.monihaku2014 in (4,6)) then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2014 in (4,6) or l.monihaku2015 in (4,6)) then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2015 in (4,6) or l.monihaku2016 in (4,6)) then 1
	else 0
end as haku_amk
--Hakenut yliopistokoulutukseen
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.monihaku2008 in (6,7) or l.monihaku2009 in (6,7)) then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2009 in (6,7) or l.monihaku2010 in (6,7)) then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2010 in (6,7) or l.monihaku2011 in (6,7)) then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2011 in (6,7) or l.monihaku2012 in (6,7)) then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2012 in (6,7) or l.monihaku2013 in (6,7)) then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2013 in (6,7) or l.monihaku2014 in (6,7)) then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2014 in (6,7) or l.monihaku2015 in (6,7)) then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.monihaku2015 in (6,7) or l.monihaku2016 in (6,7)) then 1
	else 0
end as haku_yo




----MITTARIT
--Ei hakenut eikä opiskellut mitään
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and monihaku2008 not in (4,5,6,7) and monihaku2009 not in (4,5,6,7) and l.luopiskkoulk2008 = '' and l.ammopiskkoulk2008 = '' and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku2009 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.luopiskkoulk2016 = '' and l.ammopiskkoulk2016 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end eihaku_kk_eiopisk

--Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa
,case 
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and monihaku2008 not in (4,5,6,7) and monihaku2009 not in (4,5,6,7) and (l.luopiskkoulk2008 <> '' or l.ammopiskkoulk2008 <> '' or l.luopiskkoulk2009 <> '' or l.ammopiskkoulk2009 <> '') and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku2009 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.luopiskkoulk2009 <> '' or l.ammopiskkoulk2009 <> '' or l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '') and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '' or l.ammopiskkoulk2016 <> '') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_ta

----Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut lukiokoulutuksessa
,case 
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and monihaku2008 not in (4,5,6,7) and monihaku2009 not in (4,5,6,7) and (l.luopiskkoulk2008 <> '' or l.luopiskkoulk2009 <> '') and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = ''  then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku2009 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.luopiskkoulk2009 <> '' or l.luopiskkoulk2010 <> '') and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.luopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.luopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.luopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.luopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.luopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.luopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_lu

----Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut ammatillisessa peruskoulutuksessa
,case 
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and monihaku2008 not in (4,5,6,7) and monihaku2009 not in (4,5,6,7) and (l.ammopiskkoulk2008 <> '' or l.ammopiskkoulk2009 <> '') and (d1c.Koulutusaste_taso2_koodi = '32' or d2c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku2009 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.ammopiskkoulk2009 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '32' or d3c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '32' or d4c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '32' or d5c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '32' or d6c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '32' or d7c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '32' or d8c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d7c.Koulutusaste_taso2_koodi = '32' or d8c.Koulutusaste_taso2_koodi = '32') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_pk

------Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut ammattitutkintokoulutuksessa
,case 
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and monihaku2008 not in (4,5,6,7) and monihaku2009 not in (4,5,6,7) and (l.ammopiskkoulk2008 <> '' or l.ammopiskkoulk2009 <> '') and (d1c.Koulutusaste_taso2_koodi = '33' or d2c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku2009 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.ammopiskkoulk2009 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '33' or d3c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '33' or d4c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '33' or d5c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '33' or d6c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '33' or d7c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '33' or d8c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d7c.Koulutusaste_taso2_koodi = '33' or d8c.Koulutusaste_taso2_koodi = '33') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_at

------Ei hakenut eikä opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa, opiskellut erikoisammattitutkintokoulutuksessa
,case 
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and monihaku2008 not in (4,5,6,7) and monihaku2009 not in (4,5,6,7) and (l.ammopiskkoulk2008 <> '' or l.ammopiskkoulk2009 <> '') and (d1c.Koulutusaste_taso2_koodi = '41' or d2c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and monihaku2009 not in (4,5,6,7) and monihaku2010 not in (4,5,6,7) and (l.ammopiskkoulk2009 <> '' or l.ammopiskkoulk2010 <> '') and (d2c.Koulutusaste_taso2_koodi = '41' or d3c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and monihaku2010 not in (4,5,6,7) and monihaku2011 not in (4,5,6,7) and (l.ammopiskkoulk2010 <> '' or l.ammopiskkoulk2011 <> '') and (d3c.Koulutusaste_taso2_koodi = '41' or d4c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and monihaku2011 not in (4,5,6,7) and monihaku2012 not in (4,5,6,7) and (l.ammopiskkoulk2011 <> '' or l.ammopiskkoulk2012 <> '') and (d4c.Koulutusaste_taso2_koodi = '41' or d5c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and monihaku2012 not in (4,5,6,7) and monihaku2013 not in (4,5,6,7) and (l.ammopiskkoulk2012 <> '' or l.ammopiskkoulk2013 <> '') and (d5c.Koulutusaste_taso2_koodi = '41' or d6c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and monihaku2013 not in (4,5,6,7) and monihaku2014 not in (4,5,6,7) and (l.ammopiskkoulk2013 <> '' or l.ammopiskkoulk2014 <> '') and (d6c.Koulutusaste_taso2_koodi = '41' or d7c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and monihaku2014 not in (4,5,6,7) and monihaku2015 not in (4,5,6,7) and (l.ammopiskkoulk2014 <> '' or l.ammopiskkoulk2015 <> '') and (d7c.Koulutusaste_taso2_koodi = '41' or d8c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and monihaku2015 not in (4,5,6,7) and monihaku2016 not in (4,5,6,7) and (l.ammopiskkoulk2015 <> '' or l.ammopiskkoulk2016 <> '') and (d7c.Koulutusaste_taso2_koodi = '41' or d8c.Koulutusaste_taso2_koodi = '41') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end eihaku_kk_eiopisk_kk_opisk_eat

--Hakenut korkea-asteelle, ei opiskellut korkea-asteella
,case 
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (monihaku2008 in (4,5,6,7) or monihaku2009 in (4,5,6,7)) and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku2009 in (4,5,6,7) or monihaku2010 in (4,5,6,7)) and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 in (4,5,6,7) or monihaku2011 in (4,5,6,7)) and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 in (4,5,6,7) or monihaku2012 in (4,5,6,7)) and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 in (4,5,6,7) or monihaku2013 in (4,5,6,7)) and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 in (4,5,6,7) or monihaku2014 in (4,5,6,7)) and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 in (4,5,6,7) or monihaku2015 in (4,5,6,7)) and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 in (4,5,6,7) or monihaku2016 in (4,5,6,7)) and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end haku_kk_eiopisk_kk
----Hakenut korkea-asteelle, ei opiskellut korkea-asteella, ei-opiskellut toisen asteen koulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (monihaku2008 in (4,5,6,7) or monihaku2009 in (4,5,6,7)) and l.luopiskkoulk2008 = '' and l.ammopiskkoulk2008 = '' and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku2009 in (4,5,6,7) or monihaku2010 in (4,5,6,7)) and l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 in (4,5,6,7) or monihaku2011 in (4,5,6,7)) and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 in (4,5,6,7) or monihaku2012 in (4,5,6,7)) and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 in (4,5,6,7) or monihaku2013 in (4,5,6,7)) and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 in (4,5,6,7) or monihaku2014 in (4,5,6,7)) and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 in (4,5,6,7) or monihaku2015 in (4,5,6,7)) and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 in (4,5,6,7) or monihaku2016 in (4,5,6,7)) and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.luopiskkoulk2016 = '' and l.ammopiskkoulk2016 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end haku_kk_eiopisk_kk_eiopisk_ta
----Hakenut korkea-asteelle, ei opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (monihaku2008 in (4,5,6,7) or monihaku2009 in (4,5,6,7)) and (l.luopiskkoulk2008 <> '' or l.ammopiskkoulk2008 <> '' or l.luopiskkoulk2009 <> '' or l.ammopiskkoulk2009 <> '') and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku2009 in (4,5,6,7) or monihaku2010 in (4,5,6,7)) and (l.luopiskkoulk2009 <> '' or l.ammopiskkoulk2009 <> '' or l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '') and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 in (4,5,6,7) or monihaku2011 in (4,5,6,7)) and (l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '') and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 in (4,5,6,7) or monihaku2012 in (4,5,6,7)) and (l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '') and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 in (4,5,6,7) or monihaku2013 in (4,5,6,7)) and (l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '') and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 in (4,5,6,7) or monihaku2014 in (4,5,6,7)) and (l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '') and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 in (4,5,6,7) or monihaku2015 in (4,5,6,7)) and (l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '') and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 in (4,5,6,7) or monihaku2016 in (4,5,6,7)) and (l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '' or l.ammopiskkoulk2016 <> '') and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end haku_kk_eiopisk_kk_opisk_ta
----Hakenut vain ammattikorkeakouluun, ei opiskellut korkea-asteella
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (monihaku2008 = 4 or monihaku2009 = 4) and (monihaku2008 not in (5,6,7) and monihaku2009 not in (5,6,7)) and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku2009 = 4 or monihaku2010 = 4) and (monihaku2009 not in (5,6,7) and monihaku2010 not in (5,6,7)) and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 = 4 or monihaku2011 = 4) and (monihaku2010 not in (5,6,7) and monihaku2011 not in (5,6,7)) and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 = 4 or monihaku2012 = 4) and (monihaku2011 not in (5,6,7) and monihaku2012 not in (5,6,7)) and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 = 4 or monihaku2013 = 4) and (monihaku2012 not in (5,6,7) and monihaku2013 not in (5,6,7)) and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 = 4 or monihaku2014 = 4) and (monihaku2013 not in (5,6,7) and monihaku2014 not in (5,6,7)) and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 = 4 or monihaku2015 = 4) and (monihaku2014 not in (5,6,7) and monihaku2015 not in (5,6,7)) and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 = 4 or monihaku2016 = 4) and (monihaku2015 not in (5,6,7) and monihaku2016 not in (5,6,7)) and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end haku_amk_eiopisk_kk
----Hakenut vain yliopistokoulutukseen, ei opiskellut korkea-asteella
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (monihaku2008 = 7 or monihaku2009 = 7) and (monihaku2008 not in (4,5,6) and monihaku2009 not in (4,5,6)) and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku2009 = 7 or monihaku2010 = 7) and (monihaku2009 not in (4,5,6) and monihaku2010 not in (4,5,6)) and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 = 7 or monihaku2011 = 7) and (monihaku2010 not in (4,5,6) and monihaku2011 not in (4,5,6)) and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 = 7 or monihaku2012 = 7) and (monihaku2011 not in (4,5,6) and monihaku2012 not in (4,5,6)) and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 = 7 or monihaku2013 = 7) and (monihaku2012 not in (4,5,6) and monihaku2013 not in (4,5,6)) and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 = 7 or monihaku2014 = 7) and (monihaku2013 not in (4,5,6) and monihaku2014 not in (4,5,6)) and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 = 7 or monihaku2015 = 7) and (monihaku2014 not in (4,5,6) and monihaku2015 not in (4,5,6)) and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 = 7 or monihaku2016 = 7) and (monihaku2015 not in (4,5,6) and monihaku2016 not in (4,5,6)) and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end haku_yo_eiopisk_kk
----Hakenut sekä amk- että yliopistokoulutukseen, ei opiskellut korkea-asteella
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (monihaku2008 = 6 or monihaku2009 = 6 or ((monihaku2008 = 4 or monihaku2009 = 4) and (monihaku2008 = 7 or monihaku2009 = 7))) and l.amkopiskkoulk2008 = '' and l.yoopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (monihaku2009 = 6 or monihaku2010 = 6 or ((monihaku2009 = 4 or monihaku2010 = 4) and (monihaku2009 = 7 or monihaku2010 = 7))) and l.amkopiskkoulk2009 = '' and l.yoopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (monihaku2010 = 6 or monihaku2011 = 6 or ((monihaku2010 = 4 or monihaku2011 = 4) and (monihaku2010 = 7 or monihaku2011 = 7))) and l.amkopiskkoulk2010 = '' and l.yoopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (monihaku2011 = 6 or monihaku2012 = 6 or ((monihaku2011 = 4 or monihaku2012 = 4) and (monihaku2011 = 7 or monihaku2012 = 7))) and l.amkopiskkoulk2011 = '' and l.yoopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (monihaku2012 = 6 or monihaku2013 = 6 or ((monihaku2012 = 4 or monihaku2013 = 4) and (monihaku2012 = 7 or monihaku2013 = 7))) and l.amkopiskkoulk2012 = '' and l.yoopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (monihaku2013 = 6 or monihaku2014 = 6 or ((monihaku2013 = 4 or monihaku2014 = 4) and (monihaku2013 = 7 or monihaku2014 = 7))) and l.amkopiskkoulk2013 = '' and l.yoopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (monihaku2014 = 6 or monihaku2015 = 6 or ((monihaku2014 = 4 or monihaku2015 = 4) and (monihaku2014 = 7 or monihaku2015 = 7))) and l.amkopiskkoulk2014 = '' and l.yoopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (monihaku2015 = 6 or monihaku2016 = 6 or ((monihaku2015 = 4 or monihaku2016 = 4) and (monihaku2015 = 7 or monihaku2016 = 7))) and l.amkopiskkoulk2015 = '' and l.yoopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end haku_amkyo_eiopisk_kk

--Opiskellut korkea-asteella
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.amkopiskkoulk2008 <> '' or l.yoopiskkoulk2008 <> '' or l.amkopiskkoulk2009 <> '' or l.yoopiskkoulk2009 <> '') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2009 <> '' or l.yoopiskkoulk2009 <> '' or l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '' or l.yoopiskkoulk2016 <> '') then 1
	else 0
end opisk_kk
----Opiskellut korkea-asteella, ei-opiskellut toisen asteen koulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and l.luopiskkoulk2008 = '' and l.ammopiskkoulk2008 = '' and l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = '' and (l.amkopiskkoulk2008 <> '' or l.yoopiskkoulk2008 <> '' or l.amkopiskkoulk2009 <> '' or l.yoopiskkoulk2009 <> '') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2009 = '' and l.ammopiskkoulk2009 = '' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and (l.amkopiskkoulk2009 <> '' or l.yoopiskkoulk2009 <> '' or l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2010 = '' and l.ammopiskkoulk2010 = '' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and (l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2011 = '' and l.ammopiskkoulk2011 = '' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and (l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2012 = '' and l.ammopiskkoulk2012 = '' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and (l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2013 = '' and l.ammopiskkoulk2013 = '' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and (l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2014 = '' and l.ammopiskkoulk2014 = '' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and (l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and l.luopiskkoulk2015 = '' and l.ammopiskkoulk2015 = '' and l.luopiskkoulk2016 = '' and l.ammopiskkoulk2016 = '' and (l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '' or l.yoopiskkoulk2016 <> '') then 1
	else 0
end opisk_kk_eiopisk_ta
----Opiskellut korkea-asteella, opiskellut toisen asteen koulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.luopiskkoulk2008 <> '' or l.ammopiskkoulk2008 <> '' or l.luopiskkoulk2009 <> '' or l.ammopiskkoulk2009 <> '') and (l.amkopiskkoulk2008 <> '' or l.yoopiskkoulk2008 <> '' or l.amkopiskkoulk2009 <> '' or l.yoopiskkoulk2009 <> '') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2009 <> '' or l.ammopiskkoulk2009 <> '' or l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '') and (l.amkopiskkoulk2009 <> '' or l.yoopiskkoulk2009 <> '' or l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2010 <> '' or l.ammopiskkoulk2010 <> '' or l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '') and (l.amkopiskkoulk2010 <> '' or l.yoopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2011 <> '' or l.ammopiskkoulk2011 <> '' or l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '') and (l.amkopiskkoulk2011 <> '' or l.yoopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2012 <> '' or l.ammopiskkoulk2012 <> '' or l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '') and (l.amkopiskkoulk2012 <> '' or l.yoopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2013 <> '' or l.ammopiskkoulk2013 <> '' or l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '') and (l.amkopiskkoulk2013 <> '' or l.yoopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2014 <> '' or l.ammopiskkoulk2014 <> '' or l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '') and (l.amkopiskkoulk2014 <> '' or l.yoopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.luopiskkoulk2015 <> '' or l.ammopiskkoulk2015 <> '' or l.luopiskkoulk2016 <> '' or l.ammopiskkoulk2016 <> '') and (l.amkopiskkoulk2015 <> '' or l.yoopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '' or l.yoopiskkoulk2016 <> '') then 1
	else 0
end opisk_kk_opisk_ta
----Opiskellut vain ammattikorkeakoulussa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.amkopiskkoulk2008 <> '' or l.amkopiskkoulk2009 <> '') and l.yoopiskkoulk2008 = '' and l.yoopiskkoulk2009 = '' then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2009 <> '' or l.amkopiskkoulk2010 <> '') and l.yoopiskkoulk2009 = '' and l.yoopiskkoulk2010 = '' then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '') and l.yoopiskkoulk2010 = '' and l.yoopiskkoulk2011 = '' then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '') and l.yoopiskkoulk2011 = '' and l.yoopiskkoulk2012 = '' then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '') and l.yoopiskkoulk2012 = '' and l.yoopiskkoulk2013 = '' then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '') and l.yoopiskkoulk2013 = '' and l.yoopiskkoulk2014 = '' then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '') and l.yoopiskkoulk2014 = '' and l.yoopiskkoulk2015 = '' then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '') and l.yoopiskkoulk2015 = '' and l.yoopiskkoulk2016 = '' then 1
	else 0
end opisk_vain_amk
----Opiskellut vain yliopistokoulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and l.amkopiskkoulk2008 = '' and l.amkopiskkoulk2009 = '' and (l.yoopiskkoulk2008 <> '' or l.yoopiskkoulk2009 <> '') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2009 = '' and l.amkopiskkoulk2010 = '' and (l.yoopiskkoulk2009 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2010 = '' and l.amkopiskkoulk2011 = '' and (l.yoopiskkoulk2010 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2011 = '' and l.amkopiskkoulk2012 = '' and (l.yoopiskkoulk2011 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2012 = '' and l.amkopiskkoulk2013 = '' and (l.yoopiskkoulk2012 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2013 = '' and l.amkopiskkoulk2014 = '' and (l.yoopiskkoulk2013 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2014 = '' and l.amkopiskkoulk2015 = '' and (l.yoopiskkoulk2014 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and l.amkopiskkoulk2015 = '' and l.amkopiskkoulk2016 = '' and (l.yoopiskkoulk2015 <> '' or l.yoopiskkoulk2016 <> '') then 1
	else 0
end opisk_vain_yo
----Opiskellut sekä amk- että yliopistokoulutuksessa
,case
	when l.suorv = @ensimmainen_suoritusvuosi	and l.suorlk = '1' and (l.amkopiskkoulk2008 <> '' or l.amkopiskkoulk2009 <> '') and (l.yoopiskkoulk2008 <> '' or l.yoopiskkoulk2009 <> '') then 1
	when l.suorv = @toinen_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2009 <> '' or l.amkopiskkoulk2010 <> '') and (l.yoopiskkoulk2009 <> '' or l.yoopiskkoulk2010 <> '') then 1
	when l.suorv = @kolmas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2010 <> '' or l.amkopiskkoulk2011 <> '') and (l.yoopiskkoulk2010 <> '' or l.yoopiskkoulk2011 <> '') then 1
	when l.suorv = @neljas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2011 <> '' or l.amkopiskkoulk2012 <> '') and (l.yoopiskkoulk2011 <> '' or l.yoopiskkoulk2012 <> '') then 1
	when l.suorv = @viides_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2012 <> '' or l.amkopiskkoulk2013 <> '') and (l.yoopiskkoulk2012 <> '' or l.yoopiskkoulk2013 <> '') then 1
	when l.suorv = @kuudes_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2013 <> '' or l.amkopiskkoulk2014 <> '') and (l.yoopiskkoulk2013 <> '' or l.yoopiskkoulk2014 <> '') then 1
	when l.suorv = @seitsemas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2014 <> '' or l.amkopiskkoulk2015 <> '') and (l.yoopiskkoulk2014 <> '' or l.yoopiskkoulk2015 <> '') then 1
	when l.suorv = @kahdeksas_suoritusvuosi		and l.suorlk = '1' and (l.amkopiskkoulk2015 <> '' or l.amkopiskkoulk2016 <> '') and (l.yoopiskkoulk2015 <> '' or l.yoopiskkoulk2016 <> '') then 1
	else 0
end opisk_amkyo


FROM 
    (
	select * from [VipunenTK_SA].[dbo].[v_K3_12_Perusk_paattaneet_amm_tutk_suorittaneet]
	where (suorv = '2008' or suorv = '2009' or suorv = '2010' or suorv = '2011' or suorv= '2012' or suorv= '2013' or suorv='2014' or suorv= '2015' ) and suorlk = '1'
	) as l
	

INNER JOIN VipunenTK.dbo.d_koulutusluokitus d1a on d1a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2008,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2a on d2a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2009,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d3a on d3a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2010,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d4a on d4a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2011,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d5a on d5a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2012,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d6a on d6a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2013,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d7a on d7a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2014,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d8a on d8a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2015,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d9a on d9a.koulutusluokitus_avain=COALESCE(NULLIF(l.amkopiskkoulk2016,''),'-1')

INNER JOIN VipunenTK.dbo.d_koulutusluokitus d1b on d1b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2008,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2b on d2b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2009,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d3b on d3b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2010,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d4b on d4b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2011,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d5b on d5b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2012,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d6b on d6b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2013,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d7b on d7b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2014,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d8b on d8b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2015,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d9b on d9b.koulutusluokitus_avain=COALESCE(NULLIF(l.yoopiskkoulk2016,''),'-1')

INNER JOIN VipunenTK.dbo.d_koulutusluokitus d1c on d1c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2008,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d2c on d2c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2009,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d3c on d3c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2010,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d4c on d4c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2011,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d5c on d5c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2012,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d6c on d6c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2013,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d7c on d7c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2014,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d8c on d8c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2015,''),'-1')
INNER JOIN VipunenTK.dbo.d_koulutusluokitus d9c on d9c.koulutusluokitus_avain=COALESCE(NULLIF(l.ammopiskkoulk2016,''),'-1')

CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d1a.iscfibroad2013_koodi),(d1b.iscfibroad2013_koodi), (d2a.iscfibroad2013_koodi),(d2b.iscfibroad2013_koodi)) AS a(d)) m1
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d2a.iscfibroad2013_koodi),(d2b.iscfibroad2013_koodi), (d3a.iscfibroad2013_koodi),(d3b.iscfibroad2013_koodi)) AS a(d)) m2
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d3a.iscfibroad2013_koodi),(d3b.iscfibroad2013_koodi), (d4a.iscfibroad2013_koodi),(d4b.iscfibroad2013_koodi)) AS a(d)) m3
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d4a.iscfibroad2013_koodi),(d4b.iscfibroad2013_koodi), (d5a.iscfibroad2013_koodi),(d5b.iscfibroad2013_koodi)) AS a(d)) m4
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d5a.iscfibroad2013_koodi),(d5b.iscfibroad2013_koodi), (d6a.iscfibroad2013_koodi),(d6b.iscfibroad2013_koodi)) AS a(d)) m5
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d6a.iscfibroad2013_koodi),(d6b.iscfibroad2013_koodi), (d7a.iscfibroad2013_koodi),(d7b.iscfibroad2013_koodi)) AS a(d)) m6
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d7a.iscfibroad2013_koodi),(d7b.iscfibroad2013_koodi), (d8a.iscfibroad2013_koodi),(d8b.iscfibroad2013_koodi)) AS a(d)) m7
CROSS APPLY (SELECT MIN(d) MinValue, MAX(d) MaxValue FROM (VALUES (d8a.iscfibroad2013_koodi),(d8b.iscfibroad2013_koodi), (d9a.iscfibroad2013_koodi),(d9b.iscfibroad2013_koodi)) AS a(d)) m8
	
	
	WHERE 1=1
end;

--
-- TULOS
-- 
if @debug_what_to_run>=3 begin
	if @debug_what_to_run>0 print 'querying result';
	select * from [VipunenTK_DW].[dbo].[_koulutukseen_sijoittuneet_2v]
end;

if @debug_what_to_run>0 PRINT 'all done.';


GO

USE [ANTERO]