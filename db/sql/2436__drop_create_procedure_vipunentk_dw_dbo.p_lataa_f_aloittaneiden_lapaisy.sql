USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_aloittaneiden_lapaisy_T1285]    Script Date: 16.9.2019 9:19:05 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_f_aloittaneiden_lapaisy_T1285]
GO

DROP PROCEDURE IF EXISTS [dbo].[p_lataa_f_aloittaneiden_lapaisy]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_aloittaneiden_lapaisy_T1285]    Script Date: 16.9.2019 9:19:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[p_lataa_f_aloittaneiden_lapaisy] AS

-- 30.3.2015 Poistettu kaikki historiadimensioiden surrogaattiavaimet ja joinit historiadimensioihin
-- 3.4.2014 Päivitetty alue-, koulutus-, ja oppilaitoksen taustatietojen historia ja nykytilakentät / CSC Lasse

--EXECUTE p_lataa_f_aloittaneiden_lapaisy
--Aika 0:53:28, kun ajetaan vain surrogaatit

-- CSC Jarmo 18.9.2013
-- Poistettu kuutiosta tulevaisuuteen ulottuvat tarkastelujaksot
-- where kaikkirivit.tarkastelujakso_tulevaisuus = 'Tarkastelujakso ei ulotu tulevaisuuteen'
-- CSC Jarmo 16.6.2014
-- Iän laskenta vaihdettu tilv-syntv -> alvv-syntv
-- CSC Jarmo 22.1.2015
-- Haetaan oppilaitoskoodin sijaan oppilaitos_avain oppilaitoksen_taustattiedot_avain-kenttään. 
-- Näin myös järjestäjälle tulee testaukseen järkevä arvo. Kuutiossa tietoa ei käytetä.
-- Alkaa ja paattyy-kentät poistettu turhina koulutuslaji2:n joinista CSC Jarmo 7.4.2015
-- CSC Jarmo 12.6.2015
-- Muutettu kaikki historia_id-kentät arvoon NULL

--Aika ja rivit 9.10.2013 buutin jälkeen
--(34951268 row(s) affected)
--(16388469 row(s) affected)
--5:36:38

--Aika ja rivit 19.10.2013 
--(38128656 row(s) affected)
--(16446218 row(s) affected)
--6:08:43

--Aika ja rivit 27.1.2014 
--(38128656 row(s) affected)
--(16167925 row(s) affected)
--6:14:33

--Aika ja rivit 18.3.2014 
--(38128656 row(s) affected)
--(16159649 row(s) affected)
--6:09:18


-- Alla oleva esivalmisteluajo päivittää taulun VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet 
-- Ajetaan alla oleva esivalmistelu vain kun läpäisyn päättelyajo on ajettu läpi / Jarmo 29.1.2014
-- Päivitetty uudelleen nimettyjä dimensiotauluja vasten devissä 7.3.2014 / Lasse
-- Lisätty logiikka jolla lähteaineisto käsitellään pienemmissä erissä 4.5.2018 / juha kareinen Arcusys

--EXECUTE p_lataa_f_aloittaneiden_lapaisy_esivalmistelu
/*
create index idx_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet_rivinumero on VipunenTK_DW.dbo.[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet] (rivinumero ASC)

drop index idx_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet_rivinumero on VipunenTK_DW.dbo.[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet] 

*/
/*
declare @maxrow int
declare @fromrow int
declare @torow int

set @maxrow = (SELECT max(rnro) from _aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet)
--set @maxrow = 10000000
set @fromrow = 1
Truncate table VipunenTK.dbo.f_aloittaneiden_lapaisy
while @fromrow < @maxrow

   begin
--


set @torow = @fromrow + 99999
--INSERT 1
--INSERT 2
--INSERT 3

--INSERT 1
*/
INSERT INTO [VipunenTK].[dbo].[f_aloittaneiden_lapaisy]
           ([rivinumero]
           ,[tilv]
           ,[lahde]
           ,[lahde_id]
           ,[opp]
           ,[oppilaitoksen_taustatiedot_avain]
           ,[oppilaitoksen_taustatiedot_id]
           ,[oppilaitoksen_taustatiedot_historia_id]
           ,[sp]
           ,[sp_id]
           ,[syntv]
           ,[ika]
           ,[ika_id]
           ,[aikielir1]
           ,[aikielir1_id]
           ,[alvv]
           ,[allk]
           ,[aloituskausikoodi]
           ,[klaji]
           ,[ophal]
           ,[ophal_id]
           ,[jarj]
           ,[kkun]
           ,[alueluokitus_historia_id]
           ,[alueluokitus_id]
           ,[maak]
           ,[koulk]
           ,[koulk_historia_id]
           ,[koulk_id]
           ,[opmala]
           ,[opmopa]
           ,[opmast]
           ,[opm95opa]
           ,[koulutussektori]
           ,[pohjkoulk]
           ,[pohjkoulk_historia_id]
           ,[pohjkoulk_id]
           ,[alvv_kk]
           ,[allk_kk]
           ,[aloituskausikoodi_kk]
           ,[ololk]
           ,[ololk_id]
           ,[rahlahde]
           ,[rahlahde_id]
           ,[koulutuslaji2]
           ,[koulutuslaji2_id]
           ,[saavutettu_suorv]
           ,[saavutettu_suorlk]
           ,[saavutettu_kausikoodi]
           ,[saavutettu_tutkmaak]
           ,[saavutettu_alueluokitus_historia_id]
           ,[saavutettu_alueluokitus_id]
           ,[saavutettu_tutkjarj]
           ,[saavutettu_tutkopp]
           ,[saavutettu_oppilaitoksen_taustatiedot_avain]
           ,[saavutettu_oppilaitoksen_taustatiedot_id]
           ,[saavutettu_oppilaitoksen_taustatiedot_historia_id]
           ,[saavutettu_tutkkoulk]
           ,[saavutettu_koulk_historia_id]
           ,[saavutettu_koulk_id]
           ,[saavutettu_tutkopmala]
           ,[saavutettu_tutkopmopa]
           ,[saavutettu_tutkopmast]
           ,[saavutettu_tutkopm95opa]
           ,[saavutettu_tutkkoulutussektori]
           ,[tarkastelujakso]
           ,[tarkastelujakso_id]
           ,[aloitus_saavutus]
           ,[tarkastelujakso_tulevaisuus]
           ,[tarkastelujakso_edustavuus]
           ,[tietolahde]
           ,[aineistokoodi]
           ,[aineistorivinumero]
           ,[lkm_int]
           ,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]
           ,[1a_jarjestys]
           ,[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa]
           ,[1b_jarjestys]
           ,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan]
           ,[1c_jarjestys]
           ,[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan]
           ,[1d_jarjestys]
           ,[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan]
           ,[1e_jarjestys]
           ,[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan]
           ,[1f_jarjestys]
           ,[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan]
           ,[1g_jarjestys]
           ,[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan]
           ,[1h_jarjestys]
           ,[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto]
           ,[2a_jarjestys]
           ,[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
           ,[2b_jarjestys]
           ,[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
           ,[2e_jarjestys]
           ,[2f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan]
           ,[2f_jarjestys]
           ,[2g Aloittaneista alkuperäisellä koulutusalalla opiskelua jatkavat koulutusalan mukaan]
           ,[2g_jarjestys]
           ,[2h Aloittaneista muulla koulutusalalla opiskelua jatkavat koulutusalan mukaan]
           ,[2h_jarjestys]
           ,[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto]
           ,[3a_jarjestys]
           ,[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
           ,[3b_jarjestys]
           ,[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
           ,[3e_jarjestys]
           ,[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
           ,[3f_jarjestys]
           ,[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan]
           ,[3g_jarjestys]
           ,[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan]
           ,[3h_jarjestys]
           ,[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa]
           ,[4a_jarjestys]
           ,[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä]
           ,[4b_jarjestys]
           ,[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan]
           ,[4e_jarjestys]
           ,[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan]
           ,[4f_jarjestys]
           ,[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan]
           ,[4g_jarjestys]
           ,[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan]
           ,[4h_jarjestys]
           ,[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa]
           ,[5a_jarjestys]
           ,[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä]
           ,[5b_jarjestys]
           ,[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
           ,[5e_jarjestys]
           ,[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
           ,[5f_jarjestys]
           ,[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan]
           ,[5g_jarjestys]
           ,[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan]
           ,[5h_jarjestys]
           ,[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa]
           ,[6a_jarjestys]
           ,[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä]
           ,[6b_jarjestys]
           ,[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan]
           ,[6e_jarjestys]
           ,[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan]
           ,[6f_jarjestys]
           ,[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan]
           ,[6g_jarjestys]
           ,[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan]
           ,[6h_jarjestys]
           ,[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa]
           ,[7a_jarjestys]
           ,[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
           ,[7b_jarjestys]
           ,[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan]
           ,[7e_jarjestys]
           ,[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan]
           ,[7f_jarjestys]
           ,[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan]
           ,[7g_jarjestys]
           ,[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan]
           ,[7h_jarjestys]
           ,[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto]
           ,[8a_jarjestys]
           ,[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
           ,[8b_jarjestys]
           ,[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
           ,[8e_jarjestys]
           ,[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
           ,[8f_jarjestys]
           ,[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan]
           ,[8g_jarjestys]
           ,[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan]
           ,[8h_jarjestys])

SELECT kaikkirivit.* FROM (
SELECT --top 0 
	   [rivinumero]
      ,[tilv]
      ,f.[lahde]
      ,[lahde_id] = isnull(d13.id, -1)
      ,[opp]
      --,[oppilaitoksen_taustatiedot_id] = isnull(d1.id,(Select id from okm.vipunen_tk.d_oppilaitos where oppilaitoskoodi='-1' and tilv_date between alkaa and paattyy))
      ,[oppilaitoksen_taustatiedot_avain] = isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d17.oppilaitos_avain,d1.oppilaitos_avain) else d1.oppilaitos_avain end, -2)
      ,[oppilaitoksen_taustatiedot_id] = isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d17.id,d1.id) else d1.id end, -2)
      ,[oppilaitoksen_taustatiedot_historia_id] = NULL --isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d17h.id,d1h.id) else d1h.id end, -2)      
      ,[sp]
      ,[sp_id] = ISNULL(d2.id, -1)
      ,[syntv]
  -- iän laskenta vaihdettu tilv-syntv -> alvv-syntv / Jarmo CSC 16.6.2014
  -- Lisätty lähteen vaikutus / Jarmo CSC 18.6.2014
      ,ika = Cast(Case 
				when f.lahde in ('41', '51') then  case when alvv_kk is not null and syntv is not null and ISNUMERIC(alvv_kk)=1 and ISNUMERIC(syntv)=1 then cast(alvv_kk as int)-cast(syntv as int) else -1 end 
				else case when alvv is not null and syntv is not null and ISNUMERIC(alvv)=1 and ISNUMERIC(syntv)=1 then cast(alvv as int)-cast(syntv as int) else -1 end 
			end as nvarchar(10))
      ,ika_id = ISNULL(d19.id, -1)
      ,[aikielir1]
      ,[aikielir1_id] = ISNULL(d12.id, -1)
      ,[alvv]
      ,[allk]
      -- Ksri muistutti 17.6. säännöstä tähän muuttujaan. Toteutettu. / CSC Jarmo 18.6.2014
      -- Huom alvv ja allk ovat edelleen alkuperäiset aineistosta tulleet arvot
      ,[aloituskausikoodi] = Cast(Case 
      			when f.lahde in ('41', '51') then [alvv_kk]+Case when [allk_kk]='9' then '2' else [allk_kk] end
      			else [alvv]+Case when [allk]='9' then '2' else [allk] end
			end as varchar(8))
      ,[klaji]
      ,f.[ophal]
      ,[ophal_id] = isnull(d14.id, -1)
      ,[jarj]
      ,[kkun]
      ,[alueluokitus_historia_id] = NULL --isnull(isnull(d3h.id, d11h.id), -2)
      ,[alueluokitus_id] = isnull(isnull(d3.id, d11.id), -2)
      ,[maak]
      ,[koulk]
      --,[koulk_id] = isnull(d4.id, (Select id from okm.vipunen_tk.d_koulutusluokitus where koulutuskoodi='-1' and tilv_date between alkaa and paattyy))
      ,[koulk_historia_id] = NULL --isnull(d4h.id, -1)
      ,[koulk_id] = isnull(d4.id, -1)
--,[koulk_id] = isnull((Select id from okm.vipunen_tk.d_koulutusluokitus where koulutuskoodi=koulk and tilv+'-01-01' between alkaa and paattyy),isnull((Select id from okm.vipunen_tk.d_koulutusluokitus where koulutuskoodi=koulk and alvv+'-01-01' between alkaa and paattyy),(Select id from okm.vipunen_tk.d_koulutusluokitus where koulutuskoodi='-1' and tilv+'-01-01' between alkaa and paattyy)))
      ,[opmala]
      ,[opmopa]
      ,[opmast]
      ,[opm95opa]
      ,[koulutussektori]
      ,[pohjkoulk]
      --,[pohjkoulk_id] = isnull(d5.id, (Select id from okm.vipunen_tk.d_koulutusluokitus where koulutuskoodi='-1' and tilv_date between alkaa and paattyy))
      ,[pohjkoulk_historia_id] = NULL --isnull(d5h.id, -1)
      ,[pohjkoulk_id] = isnull(d5.id, -1)
      ,[alvv_kk]
      ,[allk_kk]
      ,[aloituskausikoodi_kk] = Cast(Case when [alvv_kk]='' then '-1' else [alvv_kk]+Case when [allk_kk]='9' then '2' else [allk_kk] end end as varchar(8))
      ,f.[ololk]
      ,[ololk_id] = isnull(d15.id, -1)
      ,[rahlahde]
      ,[rahlahde_id] = isnull(d16.id, -1)
      ,f.[koulutuslaji2]
      ,[koulutuslaji2_id] = isnull(d6.id, -1)
      ,saavutettu_suorv
	  ,saavutettu_suorlk
	  ,[saavutettu_kausikoodi] = isnull(Cast([saavutettu_suorv]+[saavutettu_suorlk] as varchar(8)),'-1')
	  ,saavutettu_tutkmaak
	  ,[saavutettu_alueluokitus_historia_id]  = NULL --isnull(isnull(d7h.id, d11h.id), -2)
	  ,[saavutettu_alueluokitus_id]  = isnull(isnull(d7.id, d11.id), -2)
	  ,saavutettu_tutkjarj
	  ,saavutettu_tutkopp
	  --,[saavutettu_oppilaitoksen_taustatiedot_id] = isnull(d8.id,(Select id from okm.vipunen_tk.d_oppilaitos where oppilaitoskoodi='-1' and tilv_date between alkaa and paattyy))
	  ,[saavutettu_oppilaitoksen_taustatiedot_avain] = isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d18.oppilaitoskoodi,d8.oppilaitoskoodi) else d8.oppilaitoskoodi end, -1)
	  ,[saavutettu_oppilaitoksen_taustatiedot_id] = isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d18.id,d8.id) else d8.id end, -1)
	  ,[saavutettu_oppilaitoksen_taustatiedot_historia_id] = NULL --isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d18h.id,d8h.id) else d8h.id end, -1)
	  
	  --	  ,[saavutettu_oppilaitoksen_taustatiedot_id] = isnull(isnull(d18.id,d8.id),-1)
	  ,saavutettu_tutkkoulk
      --,[saavutettu_koulk_id] = isnull(d9.id, (Select id from okm.vipunen_tk.d_koulutusluokitus where koulutuskoodi='-1' and tilv_date between alkaa and paattyy))
      ,[saavutettu_koulk_historia_id] = NULL --isnull(d9h.id, -1)
      ,[saavutettu_koulk_id] = isnull(d9.id, -1)
	  ,saavutettu_tutkopmala
	  ,saavutettu_tutkopmopa
	  ,saavutettu_tutkopmast
	  ,saavutettu_tutkopm95opa
	  ,saavutettu_tutkkoulutussektori
	  ,[tarkastelujakso] = [tarkasteluperiodi_char]
      ,[tarkastelujakso_id] = ISNULL(d10.id, -2)

      ,[aloitus_saavutus] = Cast(Case 
			when saavutettu_suorv is null then 'Ei suoritusta tai suoritus aloituksen jälkeen'
			when [alvv] <= saavutettu_suorv then 'Ei suoritusta tai suoritus aloituksen jälkeen'
			when [alvv] > saavutettu_suorv then 'Suoritus ennen aloitusta'
			else 'Ei aloitusta' end as nvarchar(50))
	  --,[tarkastelujakso_tulevaisuus] = Cast(Case
			--when cast(tilv as int)+ 0,5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1)/2 + 1 > CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) then 'Tarkastelujakso ei ulotu tulevaisuuteen'
			--else 'Tarkastelujakso ulottuu tulevaisuuteen' end as nvarchar(50))
	-- Jakson pituuden laskenta muutettu sisältämään myös kausi / Jarmo 13.9.2013
    -- Muutettu laskenta 41 ja 51 osalta käyttämään _kk-kenttiä CSC Jarmo 24.3.2015	
	-- Otetaan mukaan vain jaksot, joille on seurantatietoa loppuun asti (suodatus myöhempänä). Ei tehdä vertailua nvarchar-arvoista, jätetään kuitenkin tekstitieto tässä vaiheessa
	  ,[tarkastelujakso_tulevaisuus] = 'Tarkastelujakso ei ulotu tulevaisuuteen'	
	/*  ,[tarkastelujakso_tulevaisuus] = Cast(Case 
				when f.lahde in ('41', '51') then Case
			when cast(tilv as int)+ 0.5 - cast(alvv_kk as int)- (Case when [allk_kk]='9' then 2 else Cast([allk_kk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
				 >= CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakson pituus
				then 'Tarkastelujakso ei ulotu tulevaisuuteen'
				else 'Tarkastelujakso ulottuu tulevaisuuteen' end 
				else Case
			when cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
				 >= CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakson pituus
				then 'Tarkastelujakso ei ulotu tulevaisuuteen'
				else 'Tarkastelujakso ulottuu tulevaisuuteen' end 
		end as nvarchar(50))
		*/
	  --,[tarkastelujakso_edustavuus] = Cast(Case
			--when cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 --syksyn tiedot eivät ole edustavia 
			--	 >= CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakson pituus
			--	then 'Tarkastelujakso on edustava'
			--	else 'Tarkastelujakso ei ole edustava' end as nvarchar(50))
-- Testattu työpajassa 19.3.2014 ja löydetty vikaa
	  --,[tarkastelujakso_edustavuus] = Cast(Case
			--when cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
			--	 < CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakso ylipitkä
			--	then 'Tarkastelujakso ei ole edustava'
			--when cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
			--	 > CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakso ylipitkä
			--	then 'Tarkastelujakso on edustava'
			--when (cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
			--	 = CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1))) --tarkastelujakso ylipitkä
			--	  AND
			--	  (Cast([allk] as int)= 1 ) --kevät 
			--	then 'Tarkastelujakso on edustava'
			--	else 'Tarkastelujakso ei ole edustava' end as nvarchar(50))
-- CSC Jarmo 19.3.2014			
	  --,[tarkastelujakso_edustavuus] = Cast(Case
			--when cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
			--	 < CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakso ylipitkä
			--	then 'Tarkastelujakso ei ole edustava'
			--when (cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 -1.0 --kerätyn tiedon kesto 
			--	 < CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1))) --tarkastelujakso jatkuu viimeiselle aineistovuodelle
			--	  AND
			--	  (Cast([allk] as int)= 1 ) --kevät 
			--	then 'Tarkastelujakso ei ole edustava'
			--	else 'Tarkastelujakso on edustava' end as nvarchar(50))
-- CSC Jarmo 20.3.2014	
	  ,[tarkastelujakso_edustavuus] = Cast(Case
			when cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
				 < CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakso ylipitkä
				then 'Tarkastelujakso ei ole edustava'
			when (cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
				 = CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1))) --tarkastelujakso jatkuu viimeisen aineistovuoden viimeiselle kaudelle
				  AND
				  (Cast([allk] as int)= 1 ) --kevät 
				then 'Tarkastelujakso ei ole edustava'
				else 'Tarkastelujakso on edustava' end as nvarchar(50))
      ,f.[tietolahde]
      ,[aineistokoodi] = Case when CHARINDEX('K3_9',f.tietolahde)>0 then 'K3.9' when CHARINDEX('K3_10',f.tietolahde)>0 then 'K3.10' else '-2' end
      ,[aineistorivinumero]
      ,[lkm_int]
      ,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]
      ,[1a_jarjestys]
      ,[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa]
      ,[1b_jarjestys]
      ,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan]
      ,[1c_jarjestys]
      ,[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan]
      ,[1d_jarjestys]
      ,[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan]
      ,[1e_jarjestys]
      ,[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan]
      ,[1f_jarjestys]
      ,[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan]
      ,[1g_jarjestys]
      ,[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan]
      ,[1h_jarjestys]
      ,[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto]
      ,[2a_jarjestys]
      ,[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
      ,[2b_jarjestys]
      ,[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
      ,[2e_jarjestys]
      ,[2f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan]
      ,[2f_jarjestys]
      ,[2g Aloittaneista alkuperäisellä koulutusalalla opiskelua jatkavat koulutusalan mukaan]
      ,[2g_jarjestys]
      ,[2h Aloittaneista muulla koulutusalalla opiskelua jatkavat koulutusalan mukaan]
      ,[2h_jarjestys]
      ,[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto]
      ,[3a_jarjestys]
      ,[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
      ,[3b_jarjestys]
      ,[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
      ,[3e_jarjestys]
      ,[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
      ,[3f_jarjestys]
      ,[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan]
      ,[3g_jarjestys]
      ,[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan]
      ,[3h_jarjestys]
      ,[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa]
      ,[4a_jarjestys]
      ,[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä]
      ,[4b_jarjestys]
      ,[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan]
      ,[4e_jarjestys]
      ,[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan]
      ,[4f_jarjestys]
      ,[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan]
      ,[4g_jarjestys]
      ,[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan]
      ,[4h_jarjestys]
      ,[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa]
      ,[5a_jarjestys]
      ,[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä]
      ,[5b_jarjestys]
      ,[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
      ,[5e_jarjestys]
      ,[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
      ,[5f_jarjestys]
      ,[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan]
      ,[5g_jarjestys]
      ,[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan]
      ,[5h_jarjestys]
      ,[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa]
      ,[6a_jarjestys]
      ,[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä]
      ,[6b_jarjestys]
      ,[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan]
      ,[6e_jarjestys]
      ,[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan]
      ,[6f_jarjestys]
      ,[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan]
      ,[6g_jarjestys]
      ,[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan]
      ,[6h_jarjestys]
      ,[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa]
      ,[7a_jarjestys]
      ,[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
      ,[7b_jarjestys]
      ,[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan]
      ,[7e_jarjestys]
      ,[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan]
      ,[7f_jarjestys]
      ,[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan]
      ,[7g_jarjestys]
      ,[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan]
      ,[7h_jarjestys]
      ,[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto]
      ,[8a_jarjestys]
      ,[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
      ,[8b_jarjestys]
      ,[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
      ,[8e_jarjestys]
      ,[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
      ,[8f_jarjestys]
      ,[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan]
      ,[8g_jarjestys]
      ,[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan]
      ,[8h_jarjestys]
--INTO VipunenTK.dbo.f_aloittaneiden_lapaisy_jarmo
  FROM VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet f
  LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1
	ON d1.oppilaitos_avain=f.jarj --AND f.tilv_date between d1.alkaa and d1.paattyy
	--ON d1.oppilaitoskoodi=f.opp AND f.tilv_date between d1.alkaa and d1.paattyy

  --LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d1h
	--ON d1h.oppilaitos_avain=f.jarj AND f.tilv_date between d1h.alkaa and d1h.paattyy

  LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d17
	ON d17.oppilaitos_avain=d1.koulutuksen_jarjestajan_ainoa_oppilaitos --AND d1.alkaa between d17.alkaa and d17.paattyy
	
  --LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d17h
	--ON d17h.oppilaitos_avain=d1h.koulutuksen_jarjestajan_ainoa_oppilaitos AND d1h.alkaa between d17h.alkaa and d17h.paattyy
	
	
 -- LEFT JOIN okm.vipunen_tk.d_oppilaitos d1
	--ON d1.oppilaitoskoodi=f.opp AND f.tilv_date between d1.alkaa and d1.paattyy
  LEFT JOIN VipunenTK.dbo.d_sukupuoli d2
	ON d2.sukupuoli_koodi = f.sp AND f.tilv_date between d2.alkaa and d2.paattyy
 -- LEFT JOIN okm.Vipunen_TK.d_sukupuoli d2
	--ON d2.sukupuolikoodi = f.sp AND f.tilv_date between d2.alkaa and d2.paattyy
  --LEFT JOIN VipunenTK.dbo.d_alueluokitus_historia d3h 
	--ON d3h.alueluokitus_avain=f.kkun and f.tilv_date between d3h.alkaa and d3h.paattyy

  LEFT JOIN VipunenTK.dbo.d_alueluokitus d3 
	ON d3.alueluokitus_avain=f.kkun 


 -- LEFT JOIN okm.vipunen_tk.d_alueluokitus d3 
	--ON d3.kuntakoodi=f.kkun and f.tilv_date between d3.alkaa and d3.paattyy
  --LEFT JOIN VipunenTK.dbo.d_koulutusluokitus_historia d4h
	--ON d4h.koulutusluokitus_avain=f.koulk and f.tilv_date between d4h.alkaa and d4h.paattyy
	
  LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d4
	ON d4.koulutusluokitus_avain=f.koulk 
	
	
 -- LEFT JOIN okm.vipunen_tk.d_koulutusluokitus d4
	--ON d4.koulutuskoodi=f.koulk and f.tilv_date between d4.alkaa and d4.paattyy
  --LEFT JOIN VipunenTK.dbo.d_koulutusluokitus_historia d5h
    --ON d5h.koulutusluokitus_avain=f.pohjkoulk and f.tilv_date between d5h.alkaa and d5h.paattyy

  LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d5
    ON d5.koulutusluokitus_avain=f.pohjkoulk

  --LEFT JOIN okm.vipunen_tk.d_koulutusluokitus d5
  --  ON d5.koulutuskoodi=f.pohjkoulk and f.tilv_date between d5.alkaa and d5.paattyy
  LEFT JOIN VipunenTK..d_koulutuslaji2 d6
	ON d6.koulutuslaji2_koodi=f.koulutuslaji2 --and f.tilv_date between d6.alkaa and d6.paattyy
	--alkaa ja paattyy poistettu turhina CSC Jarmo 7.4.2015

  --LEFT JOIN VipunenTK.dbo.d_alueluokitus_historia d7h
	--ON d7h.alueluokitus_avain='MAAK'+f.saavutettu_tutkmaak and f.tilv_date between d7h.alkaa and d7h.paattyy

  LEFT JOIN VipunenTK.dbo.d_alueluokitus d7
	ON d7.alueluokitus_avain='MAAK'+f.saavutettu_tutkmaak



 -- LEFT JOIN okm.vipunen_tk.d_alueluokitus d7
	--ON d7.kuntakoodi='M'+f.saavutettu_tutkmaak and f.tilv_date between d7.alkaa and d7.paattyy


  LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d8 
    ON d8.oppilaitos_avain=f.saavutettu_tutkjarj --and f.tilv_date between d8.alkaa and d8.paattyy
    --ON d8.oppilaitoskoodi=f.saavutettu_tutkopp and f.tilv_date between d8.alkaa and d8.paattyy
  --LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d8h 
    --ON d8h.oppilaitos_avain=f.saavutettu_tutkjarj and f.tilv_date between d8h.alkaa and d8h.paattyy

  LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d18
	ON d18.oppilaitos_avain=d8.koulutuksen_jarjestajan_ainoa_oppilaitos --AND d8.alkaa between d18.alkaa and d18.paattyy

  --LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d18h
	--ON d18h.oppilaitos_avain=d8h.koulutuksen_jarjestajan_ainoa_oppilaitos AND d8h.alkaa between d18h.alkaa and d18h.paattyy



  --LEFT JOIN okm.vipunen_tk.d_oppilaitos d8 
  --  ON d8.oppilaitoskoodi=f.saavutettu_tutkopp and f.tilv_date between d8.alkaa and d8.paattyy
  --LEFT JOIN VipunenTK.dbo.d_koulutusluokitus_historia d9h
    --ON d9h.koulutusluokitus_avain=f.saavutettu_tutkkoulk and f.tilv_date between d9h.alkaa and d9h.paattyy

  LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d9
    ON d9.koulutusluokitus_avain=f.saavutettu_tutkkoulk


  --LEFT JOIN okm.vipunen_tk.d_koulutusluokitus d9
  --  ON d9.koulutuskoodi=f.saavutettu_tutkkoulk and f.tilv_date between d9.alkaa and d9.paattyy
  LEFT JOIN VipunenTK..d_tarkastelujakso d10 
	ON d10.tarkastelujakso_koodi=f.tarkasteluperiodi_char and f.tilv_date between d10.alkaa and d10.paattyy

  --LEFT JOIN VipunenTK.dbo.d_alueluokitus_historia d11h
	--ON d11h.alueluokitus_avain='-1' and f.tilv_date between d11h.alkaa and d11h.paattyy
 
   LEFT JOIN VipunenTK.dbo.d_alueluokitus d11
	ON d11.alueluokitus_avain='-1'

 
 -- LEFT JOIN okm.vipunen_tk.d_alueluokitus d11
	--ON d11.kuntakoodi='-1' and f.tilv_date between d11.alkaa and d11.paattyy
  LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio1 d12
	on d12.aidinkieli_versio1_koodi=f.aikielir1
	and f.tilv_date between d12.alkaa and d12.paattyy	
  LEFT JOIN VipunenTK.dbo.d_lahde d13
	on d13.lahde_koodi=f.lahde
	and f.tilv_date between d13.alkaa and d13.paattyy	
  LEFT JOIN VipunenTK.dbo.d_opetushallinnon_koulutus d14
	on d14.opetushallinnon_koulutus_koodi=f.ophal
	and f.tilv_date between d14.alkaa and d14.paattyy	
  LEFT JOIN VipunenTK.dbo.d_opiskelijan_olo d15
	on d15.opiskelijan_olo_koodi=f.ololk
	and f.tilv_date between d15.alkaa and d15.paattyy	
  LEFT JOIN VipunenTK.dbo.d_rahoituslahde d16
	on d16.rahoituslahde_koodi=f.rahlahde
	and f.tilv_date between d16.alkaa and d16.paattyy	
  LEFT JOIN VipunenTK.dbo.d_ika d19
  -- avaimen laskenta muutettu ottamaan lähde huomioon / Jarmo CSC 18.6.2014
	on d19.ika_avain = Cast(Case 
				when f.lahde in ('41', '51') then  case when alvv_kk is not null and syntv is not null and ISNUMERIC(alvv_kk)=1 and ISNUMERIC(syntv)=1 then cast(alvv_kk as int)-cast(syntv as int) else -1 end 
				else case when alvv is not null and syntv is not null and ISNUMERIC(alvv)=1 and ISNUMERIC(syntv)=1 then cast(alvv as int)-cast(syntv as int) else -1 end 
			end as nvarchar(10))
where --f.rnro between @fromrow and @torow	
-- Otetaan mukaan vain jaksot, joille on seurantatietoa loppuun asti. 1 = tarkastelujakso ei oletu tulevaisuuteen, 0= tarkastelujakso ulottuu tulevaisuuteen
--and
 (1 = Case 
				when f.lahde in ('41', '51') then Case
			when cast(tilv as int)+ 0.5 - cast(alvv_kk as int)- (Case when [allk_kk]='9' then 2 else Cast([allk_kk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
				 >= CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakson pituus
				then 1
				else 0 end 
				else Case
			when cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
				 >= CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakson pituus
				then 1
				else 0 end 
		end)

 ) kaikkirivit

-- Lisäys 11/2013
-- Otetaan mukaan vain jaksot, joille on seurantatietoa loppuun asti
where 

--kaikkirivit.tarkastelujakso_tulevaisuus = 'Tarkastelujakso ei ulotu tulevaisuuteen' and

-- Lisäys työpajassa 14.1.2014
-- Jukka: otetaan aineistoon mukaan vain ne joilla alvv ja alvv_kk ovat samoja (lukukausi tarkkuudella. Näin amk- ja yo-sektoreita käsitellään samalla lailla. 
 (
 kaikkirivit.lahde not in ('41', '51')
 or kaikkirivit.koulutuslaji2 in ('46', '52')
 or  --kaikkirivit.lahde  in ('41', '51')
-- kaikkirivit..koulutuslaji2 in ('41', '42') and --lienee turha ehto. Odota varmistus OKM:ltä / Jarmo 15.1.2014
	kaikkirivit.allk = kaikkirivit.allk_kk 
	and kaikkirivit.alvv = kaikkirivit.alvv_kk
	and kaikkirivit.allk in ('1', '2') --ei saa olla tuntematon
	)	

-- Lisäys läpimenon varnistamiseksi
-- Insert on jaettu kolmeen osaan
-- CSC Jarmo 26.5.2014
--and  tarkastelujakso in ('0,5', '1', '1,5', '2', '2,5', '3', '3,5', '4', '4,5', '5', '5,5', '6')
--and not exists (select 1 from [VipunenTK].[dbo].[f_aloittaneiden_lapaisy] where [VipunenTK].[dbo].[f_aloittaneiden_lapaisy].rivinumero = kaikkirivit.rivinumero) order by rivinumero
--set @fromrow = @torow + 1

 --  end
   

GO


USE [ANTERO]