USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[_v_aloittaneiden_lapaisy_lasketut_sarakkeet_dimensioarvot]    Script Date: 18.9.2021 23:07:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[_v_aloittaneiden_lapaisy_lasketut_sarakkeet_dimensioarvot] AS

--lisätty 9-11 / CSC Juha 20.9.2021

-- Select * from vipunen_ETL.v_aloittaneiden_lapaisy_lasketut_sarakkeet_dimensioarvot order by rivinumero
SELECT rivinumero
,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = ISNULL([1a].selite, 'Virhetilanne')
,[1a_jarjestys] = ISNULL([1a].jarjestys, 'ÖÖÖ')
,[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa] = ISNULL([1b].selite, 'Virhetilanne')
,[1b_jarjestys] = ISNULL([1b].jarjestys, 'ÖÖÖ')
,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] = ISNULL([1c].selite, 'Virhetilanne')
,[1c_jarjestys] = ISNULL([1c].jarjestys, 'ÖÖÖ')
,[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan] = ISNULL([1d].selite, 'Virhetilanne')
,[1d_jarjestys] = ISNULL([1d].jarjestys, 'ÖÖÖ')
,[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan] = ISNULL([1e].selite, 'Virhetilanne')
,[1e_jarjestys] = ISNULL([1e].jarjestys, 'ÖÖÖ')
,[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] = ISNULL([1f].selite, 'Virhetilanne')
,[1f_jarjestys] = ISNULL([1f].jarjestys, 'ÖÖÖ')
,[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan] = ISNULL([1g].selite, 'Virhetilanne')
,[1g_jarjestys] = ISNULL([1g].jarjestys, 'ÖÖÖ')
,[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan] = ISNULL([1h].selite, 'Virhetilanne')
,[1h_jarjestys] = ISNULL([1h].jarjestys, 'ÖÖÖ')
,[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto] = ISNULL([2a].selite, 'Virhetilanne')
,[2a_jarjestys] = ISNULL([2a].jarjestys, 'ÖÖÖ')
,[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] = ISNULL([2b].selite, 'Virhetilanne')
,[2b_jarjestys] = ISNULL([2b].jarjestys, 'ÖÖÖ')
,[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan] = ISNULL([2e].selite, 'Virhetilanne')
,[2e_jarjestys] = ISNULL([2e].jarjestys, 'ÖÖÖ')
,[2f Aloittaneista muun koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan] = ISNULL([2f].selite, 'Virhetilanne')
,[2f_jarjestys] = ISNULL([2f].jarjestys, 'ÖÖÖ')
,[2g Aloittaneista alkuperäisellä koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan] = ISNULL([2g].selite, 'Virhetilanne')
,[2g_jarjestys] = ISNULL([2g].jarjestys, 'ÖÖÖ')
,[2h Aloittaneista muulla koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan] = ISNULL([2h].selite, 'Virhetilanne')
,[2h_jarjestys] = ISNULL([2h].jarjestys, 'ÖÖÖ')
,[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto] = ISNULL([3a].selite, 'Virhetilanne')
,[3a_jarjestys] = ISNULL([3a].jarjestys, 'ÖÖÖ')
,[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] = ISNULL([3b].selite, 'Virhetilanne')
,[3b_jarjestys] = ISNULL([3b].jarjestys, 'ÖÖÖ')
,[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] = ISNULL([3e].selite, 'Virhetilanne')
,[3e_jarjestys] = ISNULL([3e].jarjestys, 'ÖÖÖ')
,[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] = ISNULL([3f].selite, 'Virhetilanne')
,[3f_jarjestys] = ISNULL([3f].jarjestys, 'ÖÖÖ')
,[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] = ISNULL([3g].selite, 'Virhetilanne')
,[3g_jarjestys] = ISNULL([3g].jarjestys, 'ÖÖÖ')
,[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] = ISNULL([3h].selite, 'Virhetilanne')
,[3h_jarjestys] = ISNULL([3h].jarjestys, 'ÖÖÖ')
,[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa] = ISNULL([4a].selite, 'Virhetilanne')
,[4a_jarjestys] = ISNULL([4a].jarjestys, 'ÖÖÖ')
,[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä] = ISNULL([4b].selite, 'Virhetilanne')
,[4b_jarjestys] = ISNULL([4b].jarjestys, 'ÖÖÖ')
,[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] = ISNULL([4e].selite, 'Virhetilanne')
,[4e_jarjestys] = ISNULL([4e].jarjestys, 'ÖÖÖ')
,[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] = ISNULL([4f].selite, 'Virhetilanne')
,[4f_jarjestys] = ISNULL([4f].jarjestys, 'ÖÖÖ')
,[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan] = ISNULL([4g].selite, 'Virhetilanne')
,[4g_jarjestys] = ISNULL([4g].jarjestys, 'ÖÖÖ')
,[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan] = ISNULL([4h].selite, 'Virhetilanne')
,[4h_jarjestys] = ISNULL([4h].jarjestys, 'ÖÖÖ')
,[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa] = ISNULL([5a].selite, 'Virhetilanne')
,[5a_jarjestys] = ISNULL([5a].jarjestys, 'ÖÖÖ')
,[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] = ISNULL([5b].selite, 'Virhetilanne')
,[5b_jarjestys] = ISNULL([5b].jarjestys, 'ÖÖÖ')
,[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] = ISNULL([5e].selite, 'Virhetilanne')
,[5e_jarjestys] = ISNULL([5e].jarjestys, 'ÖÖÖ')
,[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] = ISNULL([5f].selite, 'Virhetilanne')
,[5f_jarjestys] = ISNULL([5f].jarjestys, 'ÖÖÖ')
,[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] = ISNULL([5g].selite, 'Virhetilanne')
,[5g_jarjestys] = ISNULL([5g].jarjestys, 'ÖÖÖ')
,[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] = ISNULL([5h].selite, 'Virhetilanne')
,[5h_jarjestys] = ISNULL([5h].jarjestys, 'ÖÖÖ')
,[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa] = ISNULL([6a].selite, 'Virhetilanne')
,[6a_jarjestys] = ISNULL([6a].jarjestys, 'ÖÖÖ')
,[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] = ISNULL([6b].selite, 'Virhetilanne')
,[6b_jarjestys] = ISNULL([6b].jarjestys, 'ÖÖÖ')
,[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan] = ISNULL([6e].selite, 'Virhetilanne')
,[6e_jarjestys] = ISNULL([6e].jarjestys, 'ÖÖÖ')
,[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan] = ISNULL([6f].selite, 'Virhetilanne')
,[6f_jarjestys] = ISNULL([6f].jarjestys, 'ÖÖÖ')
,[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan] = ISNULL([6g].selite, 'Virhetilanne')
,[6g_jarjestys] = ISNULL([6g].jarjestys, 'ÖÖÖ')
,[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan] = ISNULL([6h].selite, 'Virhetilanne')
,[6h_jarjestys] = ISNULL([6h].jarjestys, 'ÖÖÖ')
,[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa] = ISNULL([7a].selite, 'Virhetilanne')
,[7a_jarjestys] = ISNULL([7a].jarjestys, 'ÖÖÖ')
,[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] = ISNULL([7b].selite, 'Virhetilanne')
,[7b_jarjestys] = ISNULL([7b].jarjestys, 'ÖÖÖ')
,[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] = ISNULL([7e].selite, 'Virhetilanne')
,[7e_jarjestys] = ISNULL([7e].jarjestys, 'ÖÖÖ')
,[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] = ISNULL([7f].selite, 'Virhetilanne')
,[7f_jarjestys] = ISNULL([7f].jarjestys, 'ÖÖÖ')
,[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] = ISNULL([7g].selite, 'Virhetilanne')
,[7g_jarjestys] = ISNULL([7g].jarjestys, 'ÖÖÖ')
,[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] = ISNULL([7h].selite, 'Virhetilanne')
,[7h_jarjestys] = ISNULL([7h].jarjestys, 'ÖÖÖ')
,[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto] = ISNULL([8a].selite, 'Virhetilanne')
,[8a_jarjestys] = ISNULL([8a].jarjestys, 'ÖÖÖ')
,[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] = ISNULL([8b].selite, 'Virhetilanne')
,[8b_jarjestys] = ISNULL([8b].jarjestys, 'ÖÖÖ')
,[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] = ISNULL([8e].selite, 'Virhetilanne')
,[8e_jarjestys] = ISNULL([8e].jarjestys, 'ÖÖÖ')
,[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] = ISNULL([8f].selite, 'Virhetilanne')
,[8f_jarjestys] = ISNULL([8f].jarjestys, 'ÖÖÖ')
,[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] = ISNULL([8g].selite, 'Virhetilanne')
,[8g_jarjestys] = ISNULL([8g].jarjestys, 'ÖÖÖ')
,[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] = ISNULL([8h].selite, 'Virhetilanne')
,[8h_jarjestys] = ISNULL([8h].jarjestys, 'ÖÖÖ')
,[9a Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina mikä tahansa tutkinto] = ISNULL([9a].selite, 'Virhetilanne')
,[9a_jarjestys] = ISNULL([9a].jarjestys, 'ÖÖÖ')
,[9b Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] = ISNULL([9b].selite, 'Virhetilanne')
,[9b_jarjestys] = ISNULL([9b].jarjestys, 'ÖÖÖ')
,[9e Aloittaneista alkuperäisen koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan] = ISNULL([9e].selite, 'Virhetilanne')
,[9e_jarjestys] = ISNULL([9e].jarjestys, 'ÖÖÖ')
,[9f Aloittaneista muun koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan] = ISNULL([9f].selite, 'Virhetilanne')
,[9f_jarjestys] = ISNULL([9f].jarjestys, 'ÖÖÖ')
,[9g Aloittaneista alkuperäisellä koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan] = ISNULL([9g].selite, 'Virhetilanne')
,[9g_jarjestys] = ISNULL([9g].jarjestys, 'ÖÖÖ')
,[9h Aloittaneista muulla koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan] = ISNULL([9h].selite, 'Virhetilanne')
,[9h_jarjestys] = ISNULL([9h].jarjestys, 'ÖÖÖ')
,[10a Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina mikä tahansa tutkinto] = ISNULL([10a].selite, 'Virhetilanne')
,[10a_jarjestys] = ISNULL([10a].jarjestys, 'ÖÖÖ')
,[10b Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] = ISNULL([10b].selite, 'Virhetilanne')
,[10b_jarjestys] = ISNULL([10b].jarjestys, 'ÖÖÖ')
,[10e Aloittaneista alkuperäisen koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan] = ISNULL([10e].selite, 'Virhetilanne')
,[10e_jarjestys] = ISNULL([10e].jarjestys, 'ÖÖÖ')
,[10f Aloittaneista muun koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan] = ISNULL([10f].selite, 'Virhetilanne')
,[10f_jarjestys] = ISNULL([10f].jarjestys, 'ÖÖÖ')
,[10g Aloittaneista alkuperäisellä koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan] = ISNULL([10g].selite, 'Virhetilanne')
,[10g_jarjestys] = ISNULL([10g].jarjestys, 'ÖÖÖ')
,[10h Aloittaneista muulla koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan] = ISNULL([10h].selite, 'Virhetilanne')
,[10h_jarjestys] = ISNULL([10h].jarjestys, 'ÖÖÖ')
,[11a Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina mikä tahansa tutkinto] = ISNULL([11a].selite, 'Virhetilanne')
,[11a_jarjestys] = ISNULL([11a].jarjestys, 'ÖÖÖ')
,[11b Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] = ISNULL([11b].selite, 'Virhetilanne')
,[11b_jarjestys] = ISNULL([11b].jarjestys, 'ÖÖÖ')
,[11e Aloittaneista alkuperäisen koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan] = ISNULL([11e].selite, 'Virhetilanne')
,[11e_jarjestys] = ISNULL([11e].jarjestys, 'ÖÖÖ')
,[11f Aloittaneista muun koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan] = ISNULL([11f].selite, 'Virhetilanne')
,[11f_jarjestys] = ISNULL([11f].jarjestys, 'ÖÖÖ')
,[11g Aloittaneista alkuperäisellä koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan] = ISNULL([11g].selite, 'Virhetilanne')
,[11g_jarjestys] = ISNULL([11g].jarjestys, 'ÖÖÖ')
,[11h Aloittaneista muulla koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan] = ISNULL([11h].selite, 'Virhetilanne')
,[11h_jarjestys] = ISNULL([11h].jarjestys, 'ÖÖÖ')
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
,lkm_laskettu

FROM _v_aloittaneiden_lapaisy_lasketut_sarakkeet_dimensioarvojen_avaimet
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [1a] ON [1a].koodi=[1a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [1b] ON [1b].koodi=[1b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [1c] ON [1c].koodi=[1c_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [1d] ON [1d].koodi=[1d_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [1e] ON [1e].koodi=[1e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [1f] ON [1f].koodi=[1f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [1g] ON [1g].koodi=[1g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [1h] ON [1h].koodi=[1h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [2a] ON [2a].koodi=[2a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [2b] ON [2b].koodi=[2b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [2e] ON [2e].koodi=[2e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [2f] ON [2f].koodi=[2f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [2g] ON [2g].koodi=[2g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [2h] ON [2h].koodi=[2h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [3a] ON [3a].koodi=[3a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [3b] ON [3b].koodi=[3b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [3e] ON [3e].koodi=[3e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [3f] ON [3f].koodi=[3f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [3g] ON [3g].koodi=[3g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [3h] ON [3h].koodi=[3h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [4a] ON [4a].koodi=[4a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [4b] ON [4b].koodi=[4b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [4e] ON [4e].koodi=[4e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [4f] ON [4f].koodi=[4f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [4g] ON [4g].koodi=[4g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [4h] ON [4h].koodi=[4h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [5a] ON [5a].koodi=[5a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [5b] ON [5b].koodi=[5b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [5e] ON [5e].koodi=[5e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [5f] ON [5f].koodi=[5f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [5g] ON [5g].koodi=[5g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [5h] ON [5h].koodi=[5h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [6a] ON [6a].koodi=[6a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [6b] ON [6b].koodi=[6b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [6e] ON [6e].koodi=[6e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [6f] ON [6f].koodi=[6f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [6g] ON [6g].koodi=[6g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [6h] ON [6h].koodi=[6h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [7a] ON [7a].koodi=[7a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [7b] ON [7b].koodi=[7b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [7e] ON [7e].koodi=[7e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [7f] ON [7f].koodi=[7f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [7g] ON [7g].koodi=[7g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [7h] ON [7h].koodi=[7h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [8a] ON [8a].koodi=[8a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [8b] ON [8b].koodi=[8b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [8e] ON [8e].koodi=[8e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [8f] ON [8f].koodi=[8f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [8g] ON [8g].koodi=[8g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [8h] ON [8h].koodi=[8h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [9a] ON [9a].koodi=[9a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [9b] ON [9b].koodi=[9b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [9e] ON [9e].koodi=[9e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [9f] ON [9f].koodi=[9f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [9g] ON [9g].koodi=[9g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [9h] ON [9h].koodi=[9h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [10a] ON [10a].koodi=[10a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [10b] ON [10b].koodi=[10b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [10e] ON [10e].koodi=[10e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [10f] ON [10f].koodi=[10f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [10g] ON [10g].koodi=[10g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [10h] ON [10h].koodi=[10h_koodi]

LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [11a] ON [11a].koodi=[11a_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [11b] ON [11b].koodi=[11b_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [11e] ON [11e].koodi=[11e_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [11f] ON [11f].koodi=[11f_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [11g] ON [11g].koodi=[11g_koodi]
LEFT JOIN VipunenTK_lisatiedot.dbo.aloittaneiden_lapaisy_seuranta [11h] ON [11h].koodi=[11h_koodi]


GO


