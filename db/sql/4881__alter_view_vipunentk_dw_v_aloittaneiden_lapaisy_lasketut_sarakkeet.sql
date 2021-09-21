USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_aloittaneiden_lapaisy_lasketut_sarakkeet]    Script Date: 18.9.2021 23:02:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--lisätty 9-11 / CSC Juha 20.9.2021

ALTER VIEW [dbo].[v_aloittaneiden_lapaisy_lasketut_sarakkeet] AS
SELECT 
-- lähtötiedot
  tiiv.[rivinumero]
      ,[tilv]
      ,tilv_date = CAST(tilv+'-01-01' as date)
      ,[lahde]
      ,[opp] = CAST(opp as nvarchar(5))
      ,[sp]
      ,[syntv]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[klaji]
      ,[ophal]
      ,[jarj]
      ,[kkun]
      ,[maak]
      ,[koulk]
      --,[opmala]
      --,[opmopa]
      --,[opmast]
      --,[opm95opa]
      ,[koulutussektori]
      ,[pohjkoulk]
      ,[alvv_kk]
      ,[allk_kk]
      ,[ololk]
      ,[rahlahde]
      ,[koulutuslaji2]
      ,saavutettu_suorv
	  ,saavutettu_suorlk
	  ,saavutettu_tutkmaak
	  ,saavutettu_tutkjarj
	  ,saavutettu_tutkopp
	  ,saavutettu_tutkkoulk
	  --,saavutettu_tutkopmala
	  --,saavutettu_tutkopmopa
	  --,saavutettu_tutkopmast
	  --,saavutettu_tutkopm95opa
	  ,saavutettu_tutkkoulutussektori
      ,[tarkasteluperiodi]
      ,[tarkasteluperiodi_char] = [tarkasteluperiodi]
  --    ,[tarkasteluperiodi_char] = Case [tarkasteluperiodi] 
		--when 0.5 then '0,5' when 1.5 then '1,5' when 2.5 then '2,5' when 3.5 then '3,5' when 4.5 then '4,5' when 5.5 then '5,5' when 6.5 then '6,5'
		--when 1 then '1' when 2 then '2' when 3 then '3' when 4 then '4' when 5 then '5' when 6 then '6' when 7 then '7' when 8 then '8' when 9 then '9' 
		--else '-1' end
      ,[tietolahde]
      ,[aineistorivinumero]
      ,[lkm_int]=lask.lkm_laskettu
 --lasketut sarakkeet      
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
      ,[2f Aloittaneista muun koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
      ,[2f_jarjestys]
      ,[2g Aloittaneista alkuperäisellä koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan]
      ,[2g_jarjestys]
      ,[2h Aloittaneista muulla koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan]
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
	  ,[9a Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina mikä tahansa tutkinto]
      ,[9a_jarjestys]
      ,[9b Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
      ,[9b_jarjestys]
      ,[9e Aloittaneista alkuperäisen koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan]
      ,[9e_jarjestys]
      ,[9f Aloittaneista muun koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan]
      ,[9f_jarjestys]
      ,[9g Aloittaneista alkuperäisellä koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan]
      ,[9g_jarjestys]
      ,[9h Aloittaneista muulla koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan]
      ,[9h_jarjestys]
	  ,[10a Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina mikä tahansa tutkinto]
      ,[10a_jarjestys]
      ,[10b Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
      ,[10b_jarjestys]
      ,[10e Aloittaneista alkuperäisen koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan]
      ,[10e_jarjestys]
      ,[10f Aloittaneista muun koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan]
      ,[10f_jarjestys]
      ,[10g Aloittaneista alkuperäisellä koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan]
      ,[10g_jarjestys]
      ,[10h Aloittaneista muulla koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan]
      ,[10h_jarjestys]
	  ,[11a Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina mikä tahansa tutkinto]
      ,[11a_jarjestys]
      ,[11b Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
      ,[11b_jarjestys]
      ,[11e Aloittaneista alkuperäisen koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan]
      ,[11e_jarjestys]
      ,[11f Aloittaneista muun koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan]
      ,[11f_jarjestys]
      ,[11g Aloittaneista alkuperäisellä koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan]
      ,[11g_jarjestys]
      ,[11h Aloittaneista muulla koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan]
      ,[11h_jarjestys]
  FROM [_aloittaneiden_lapaisy_tiivistetty] tiiv
--LEFT 
JOIN _v_aloittaneiden_lapaisy_lasketut_sarakkeet_dimensioarvot lask
	ON tiiv.rivinumero = lask.rivinumero


GO


