USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_aloittaneiden_lapaisy_K3_10_yhteiset]    Script Date: 1.2.2019 15:21:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








/*
1.2.2019 lisätty uusi ikäjaottelu d5b
-JKO
*/











ALTER VIEW [dbo].[v_f_aloittaneiden_lapaisy_K3_10_yhteiset]
AS
SELECT f.lkm_int AS lkm_int2, 
		d1.lukuvuosi AS Aloituslukuvuosi, 
		d1.vuosiselite AS Aloitusvuosi, 
		d1.lukukausiselite AS Aloituslukukausi, 
		d17.tarkastelujakso AS Tarkastelujakso, 
		d16.sukupuoli AS Sukupuoli, 
		d2.aidinkieli_versio1 AS Äidinkieli, 
		d5.ika AS Ikä, 
		d5.ika5v AS Ikäryhmä, 
		d5b.ika as [Ikäryhmä 2], 
		d6.koulutuslaji2 AS [Tavoitetutk. koulutuslaji], 
		d6.koulutuslaji2 AS [Tavoitetutk. koulutustyyppi], 
		--d6.koodinselite AS [Tavoitetutk. koulutusaste], -- Tätä käytetään yo-raportilla
		d7.koulutusaste2002 AS [Tavoitetutk. koulutusaste], 
		Case when d7.koulutusaste2002_koodi='63' 
		Or (d7.koulutusaste2002_koodi='72' 
			and  d7.koulutus_koodi in ('772101', '772201')) Or d7.koulutusaste2002_koodi='62' then 'Aloitus I syklin tutkinnossa' 
			when d7.koulutusaste2002_koodi='71' Or d7.koulutusaste2002_koodi='72' then 'Aloitus II syklin tutkinnossa'  
			else 'Tuntematon' end AS [Tavoitetutk. sykli], 
		d7.koulutusala2002 AS [Tavoitetutk. koulutusala], 
		d7.koulutusala2002 AS [Tavoitetutk. koul.ala (02 luokitus)], 
		d7.opintoala1995 AS [Tavoitetutk. koul.ala (95 luokitus)], 
		d7.opintoala2002 AS [Tavoitetutk. opintoala], 
		d7.opintoala2002 AS [Tavoitetutk. opintoala (02 luokitus)], 
		d7.koulutus AS [Tavoitetutk. koulutusnimike], 
		d8.koulutusaste2002 AS [Suor. tutkinnon koulutusaste], 
		d8.koulutusala2002 AS [Suor. tutkinnon koulutusala], 
		d8.koulutusala2002 AS [Suor. tutkinnon koul.ala (02 luokitus)], 
		d8.opintoala1995 AS [Suor. tutkinnon koul.ala (95 luokitus)], 
		d8.opintoala2002 AS [Suor. tutkinnon opintoala], 
		d8.opintoala2002 AS [Suor. tutkinnon opintoala (02 luokitus)], 
		d8.koulutus AS [Suor. tutkinnon koulutusnimike], 
		d9.koulutusaste2002 AS [Pohjakoul. koulutusaste], 
		d9.koulutusala2002 AS [Pohjakoul. koulutusala], 
		d9.koulutusala2002 AS [Pohjakoul. koul.ala (02 luokitus)], 
		d9.opintoala1995 AS [Pohjakoul. koul.ala (95 luokitus)], 
		d9.opintoala2002 AS [Pohjakoul. opintoala], 
		d9.opintoala2002 AS [Pohjakoul. opintoala (02 luokitus)], 
		d9.koulutus AS [Pohjakoul. koulutusnimike], 
		d3.maakunta AS [Tavoitetutk. maakunta], 
		d4.maakunta AS [Suor. tutkinnon maakunta], 
		d12.opiskelijan_olo AS Kirjoillaolo, 
		d13.oppilaitos AS [Tavoitetutk. oppilaitos], 
		d13.oppilaitos AS [Tavoitetutk. yliopisto], 
		d13.oppilaitos AS [Tavoitetutk. amk], 
		d13.oppilaitostyyppi AS [Tavoitetutk. oppil.tyyppi], 
		d13.oppilaitoksen_omistajatyyppi AS [Tavoitetutk. oppil. omistajatyyppi],
		d13.koulutuksen_jarjestaja AS [Tavoitetutk. koul. järjestäjä],
		d14.oppilaitos AS [Suor. tutkinnon oppilaitos], 
		d14.oppilaitos AS [Suor. tutkinnon yliopisto], 
		d14.oppilaitos AS [Suor. tutkinnon amk], 
		d14.oppilaitostyyppi AS [Suor. tutkinnon oppil.tyyppi], 
		d14.oppilaitoksen_omistajatyyppi AS [Suor. tutkinnon oppil. omistajatyyppi], 
		f.saavutettu_suorv AS [Tutkinnon suoritusvuosi],
		f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] AS [Opintojen kulku], 
		f.[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa] AS [Opintojen kulku prioriteetti 2], 
		f.[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] AS [Suoritettu tutkinto], 
		f.[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan] AS [Opiskelua jatkavat tutk.lajin mukaan], 
		f.[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan] AS [Tutkinto tavoitet. tutkintolajissa], 
		f.[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] AS [Tutkinto muussa tutkintolajissa], 
		f.[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan] AS [Opiskelee tavoitet. tutkintolajissa], 
		f.[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan] AS [Opiskelee muussa tutkintolajissa], 
		f.[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto] AS [Opintojen kulku koulutusaloittain], 
		f.[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] AS [Opintojen kulku koulutusaloittain prioriteetti 2], 
		f.[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan] AS [Tutkinto tavoitet. koulutusalalla], 
		f.[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan] AS [Tutkinto tavoitet. koul.alalla (02 luokitus)], 
		f.[2f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] AS [Tutkinto muulla koulutusalalla], 
		f.[2g Aloittaneista alkuperäisellä koulutusalalla opiskelua jatkavat koulutusalan mukaan] AS [Opiskelee tavoitet. koulutusalalla], 
		f.[2h Aloittaneista muulla koulutusalalla opiskelua jatkavat koulutusalan mukaan] AS [Opiskelee muulla koulutusalalla], 
		f.[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto] AS [Opintojen kulku opintoaloittain], 
		f.[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] AS [Opintojen kulku opintoaloittain prioriteetti 2],
		f.[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] AS [Tutkinto tavoitet. opintoalalla], 
		f.[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] AS [Tutkinto tavoitet. op.alalla (02 luokitus)], 
		f.[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] AS [Tutkinto muulla opintoalalla], 
		f.[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] AS [Opiskelee tavoitet. opintoalalla], 
		f.[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan] AS [Opiskelee muulla opintoalalla], 
		f.[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa] AS [Opintojen kulku koul. järjestäjittäin], 
		f.[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä] AS [Opintojen kulku koul. järjestäjittäin prioriteetti 2], 
		f.[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] AS [Tutkinto tavoitet. koul. järjestäjällä], 
		f.[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan] AS [Tutkinto muulla koul. järjestäjällä], 
		f.[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan] AS [Opiskelee tavoitet. koul. järjestäjällä], 
		f.[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan] AS [Opiskelee muulla koul. järjestäjällä], 
		f.[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa] AS [Opintojen kulku oppilaitoksittain], 
		f.[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] AS [Opintojen kulku oppilaitoksittain prioriteetti 2], 
		f.[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] AS [Tutkinto tavoitet. oppilaitoksessa], 
		f.[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] AS [Tutkinto muussa oppilaitoksessa], 
		f.[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] AS [Opiskelee tavoitet. oppilaitoksessa], 
		f.[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan] AS [Opiskelee muussa oppilaitoksessa], 
		f.[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa] AS [Opintojen kulku maakunnittain], 
		f.[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä] AS [Opintojen kulku maakunnittain prioriteetti 2], 
		f.[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan] AS [Tutkinto tavoitet. maakunnassa], 
		f.[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan] AS [Tutkinto muussa maakunnassa], 
		f.[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan] AS [Opiskelee tavoitet. maakunnassa], 
		f.[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan] AS [Opiskelee muussa maakunnassa], 
		f.[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa] AS [Opintojen kulku koul.sektoreittan], 
		f.[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] AS [Opintojen kulku koul.sektoreittan prioriteetti 2], 
		f.[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] AS [Tutkinto tavoitet. koulutussektorilla], 
		f.[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan] AS [Tutkinto muulla koulutussektorilla], 
		f.[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] AS [Opiskelee tavoitet. koulutussektorilla], 
		f.[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan] AS [Opiskelee muulla koulutussektorilla], 
		f.[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto] AS [Opintojen kulku koul.aloittain (95)], 
		f.[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] AS [Opintojen kulku koul.aloittain (95) prioriteetti 2], 
		f.[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] AS [Tutkinto tavoitet. koulutusalalla (95)], 
		f.[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan] AS [Tutkinto muulla koulutusalalla (95)], 
		f.[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] AS [Opiskelee tavoitet. koulutusalalla (95)], 
		f.[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan] AS [Opiskelee muulla koulutusalalla (95)], 
		f.aloitus_saavutus AS [Aloitus saavutus], 
		f.tarkastelujakso_tulevaisuus AS [Tarkastelujakson tulevaisuus], 
		f.tarkastelujakso_edustavuus AS [Tarkastelujakson edustavuus], 
		d10.lahde AS Lähde, 
		--ruotsi
		d1.lukuvuosi AS Begynnelseläsår, 
		d1.vuosiselite_SV AS Begynnelseår, 
		d1.lukukausiselite_SV AS Begynnelsetermin, 
		d17.tarkastelujakso_SV AS Granskningsperiod, 
		d16.sukupuoli_SV AS Kön, 
		d2.aidinkieli_versio1_SV AS Modersmål, 
		d5.ika_SV AS Ålder, 
		d5.ika5v_SV AS Åldersgrupp, 
		d5b.ika_SV AS [Åldersgrupp 2], 
		d6.koulutuslaji2_SV AS [Målexamens examensslag], 
		d6.koulutuslaji2_SV AS [Målexamens typ av utbildn.], 
		d7.koulutusaste2002_SV AS [Målexamens utbildn.nivå 2002], 
		Case when d7.koulutusaste2002_koodi='63' 
		Or (d7.koulutusaste2002_koodi='72' 
			and  d7.koulutus_koodi in ('772101', '772201')) Or d7.koulutusaste2002_koodi='62' then 'Påbörjande i I-skedets examen' 
			when d7.koulutusaste2002_koodi='71' Or d7.koulutusaste2002_koodi='72' then 'Påbörjande i II-skedets examen'  
			else 'Tuntematon' end AS [Startskede], 
		d7.koulutusala2002_SV AS [Målexamens utbildn.område 02], 
		d7.opintoala1995_SV AS [Målexamens utbildn.område 95], 
		d7.opintoala2002_SV AS [Målexamens studieområde 02], 
		d7.koulutus_SV AS [Målexamens utbildn.benämning], 
		d8.koulutusaste2002_SV AS [Examens utbildn.nivå 2002], 
		d8.koulutusala2002_SV AS [Examens utbildn.område 2002], 
		d8.opintoala1995_SV AS [Examens utbildn.område 1995], 
		d8.opintoala2002_SV AS [Examens studieområde 2002], 
		d8.koulutus_SV AS [Examens utbildn.benämning], 
		d9.koulutusaste2002_SV AS [Grundutb. utbildn.nivå 2002], 
		d9.koulutusala2002_SV AS [Grundutb. utbildn.område 2002], 
		d9.opintoala1995_SV AS [Grundutb. utbildn.område 1995], 
		d9.opintoala2002_SV AS [Grundutb. studieområde 2002], 
		d9.koulutus_SV AS [Grundutb. utbildn.benämning], 
		d3.maakunta_SV AS [Målexamens landskap], 
		d4.maakunta_SV AS [Examens landskap], 
		d12.opiskelijan_olo_SV AS Inskrivning, 
		d13.oppilaitos_SV AS [Målexamens läroanstalt], 
		d13.oppilaitos_SV AS [Målexamens universitet], 
		d13.oppilaitos_SV AS [Målexamens yrkehögskola], 
		d13.koulutuksen_jarjestaja_SV AS [Målexamens utbildn.ordnare],
		d14.oppilaitos_SV AS [Examens läroanstalt], 
		d14.oppilaitos_SV AS [Examens universitet], 
		d14.oppilaitos_SV AS [Examens yrkehögskola], 
		f.saavutettu_suorv AS [År då utbildningen avlagts],
		[Studieförlopp] = 
			case f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]
				when 'Tutkinto alkuperäisessä tutkintolajissa' then 'Examen i det ursprungliga examensslaget'
				when 'Tutkinto muussa tutkintolajissa' then 'Examen i annat examensslag'
				when 'Tutkinto muussa tutkintolajissa, kandidaatin tutkinto' then 'Examen i annat examensslag, lägre högskoleexamen'
				when 'Opiskelee alkuperäisessä tutkintolajissa' then 'Studerar i det ursprungliga examensslaget'
				when 'Opiskelee muussa tutkintolajissa' then 'Studerar i annat examensslag'
				when 'Ei tutkintoa, ei opiskele, työllinen' then 'Ingen examen, inte studerar, sysselsatt'
				when 'Ei tutkintoa, ei opiskele, ei työllinen' then 'Ingen examen, inte studerar, arbetslös'
				else  'Information saknas'
			end , 
		[Studieförlopp prior. 2] =
			case f.[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa]
				when 'Tutkinto alkuperäisessä tutkintolajissa' then 'Examen i det ursprungliga examensslaget'
				when 'Tutkinto muussa tutkintolajissa' then 'Examen i annat examensslag'
				when 'Tutkinto muussa tutkintolajissa, kandidaatin tutkinto' then 'Examen i annat examensslag, lägre högskoleexamen'
				when 'Opiskelee alkuperäisessä tutkintolajissa' then 'Studerar i det ursprungliga examensslaget'
				when 'Opiskelee muussa tutkintolajissa' then 'Studerar i annat examensslag'
				when 'Ei tutkintoa, ei opiskele, työllinen' then 'Ingen examen, inte studerar, sysselsatt'
				when 'Ei tutkintoa, ei opiskele, ei työllinen' then 'Ingen examen, inte studerar, arbetslös'
				else 'Information saknas'
			end			, 
		[Avlagt examen] =
			case f.[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan]
				when 'Tutkinto lukiokoulutuksesta' then 'Studentexamen'
				when 'Ammatillinen perustutkinto' then 'Grundläggande yrkesexamen'
				when 'Ammatillinen lisäkoulutus ammattitutkinto tai erikoisammattitutkinto' then 'Yrkesinriktad tilläggsutbildning, yrkesexamen eller specialyrkesexamen'
				when 'Muu korkein ja viimeisimmäksi suoritettu tutkinto, toinen aste' then 'Övrig högsta och senast avlagd examen, andra stadiet'
				when 'Ammattikorkeakoulututkinto' then 'Yrkeshögskoleexamen'
				when 'Alempi korkeakoulututkinto' then 'Lägre högskoleexamen'
				when 'Ylempi ammattikorkeakoulututkinto' then 'Högre yrkeshögskoleexamen'
				when 'Ylempi korkeakoulututkinto' then 'Högre högskoleexamen'
				when 'Tutkijakoulutusasteen tutkinto' then 'Examen på forskarutbildningsnivå'
				when 'Muu korkein ja viimeisimmäksi suoritettu tutkinto, korkeakoulututkinto' then 'Övrig högsta och senast avlagd examen, högskoleexamen'
				when 'Ei tutkintoa' then 'Ingen examen'
				when 'Virhetilanne' then 'Information saknas'
			end, 
		[Examen i målex. examensslag] = 
			case f.[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan]
				when 'Kyllä' then 'Ja'
				when 'Ei' then 'Inte'
				when 'Virhetilanne' then 'Information saknas'
			end
		, 
		[Examen i annat examensslag] = 
			case [1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan]
				when 'Kyllä' then 'Ja'
				when 'Ei' then 'Inte'
				when 'Virhetilanne' then 'Information saknas'
			end	
			, 
		[Examen i målex. utbildn.område 02] =
			case [2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
				when 'Kyllä' then 'Ja'
				when 'Ei' then 'Inte'
				when 'Virhetilanne' then 'Information saknas'
			end	
		, 
		[Examen i målex. studieområde 02] = 
			case [3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
				when 'Kyllä' then 'Ja'
				when 'Ei' then 'Inte'
				when 'Virhetilanne' then 'Information saknas'
			end	
		, 
		[Examen i målex. läroanstalt] = 
			case [5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan] 
				when 'Kyllä' then 'Ja'
				when 'Ei' then 'Inte'
				when 'Virhetilanne' then 'Information saknas'
			end	
		, 
		[Examen i målex. utbildn.område 95] = 
			case [8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
				when 'Kyllä' then 'Ja'
				when 'Ei' then 'Inte'
				when 'Virhetilanne' then 'Information saknas'
			end	
		, 
		--englanti
		d1.lukuvuosi AS [First academic year], 
		d1.vuosiselite_EN AS [First year of studies], 
		d1.lukukausiselite_EN AS [First term], 
		d17.tarkastelujakso_EN AS [Reference period], 
		d16.sukupuoli_EN AS Gender, 
		d2.aidinkieli_versio1_EN AS [Mother tongue], 
		d5.ika_EN AS Age, 
		d5.ika5v_EN AS [Age group],
		d5b.ika_EN AS [Age group 2],  
		d6.koulutuslaji2_EN AS [Target degree's form of deg.], 
		d6.koulutuslaji2_EN AS [Target degree's type of ed.], 
		d7.koulutusaste2002_EN AS [Target deg. level of ed. 02], 
		Case when d7.koulutusaste2002_koodi='63' 
		Or (d7.koulutusaste2002_koodi='72' 
			and  d7.koulutus_koodi in ('772101', '772201')) Or d7.koulutusaste2002_koodi='62' then 'Beginning of studies in cycle I degree' 
			when d7.koulutusaste2002_koodi='71' Or d7.koulutusaste2002_koodi='72' then 'Beginning of studies in cycle II degree'  
			else 'Tuntematon' end AS [Beginning cycle of ed.], 
		d7.koulutusala2002_EN AS [Target deg. field of ed. 02], 
		d7.opintoala1995_EN AS [Target deg. field of ed. 95], 
		d7.opintoala2002_EN AS [Target deg. subfield of ed. 02], 
		d7.koulutus_EN AS [Target deg. name of ed.], 
		d8.koulutusaste2002_EN AS [Degree's level of ed. 02], 
		d8.koulutusala2002_EN AS [Degree's field of ed. 02], 
		d8.opintoala1995_EN AS [Degree's field of ed. 95], 
		d8.opintoala2002_EN AS [Degree's subfield of ed. 02], 
		d8.koulutus_EN AS [Degree's name of ed.], 
		d9.koulutusaste2002_EN AS [Previous deg. level of ed. 02], 
		d9.koulutusala2002_EN AS [Previous deg. field of ed. 02], 
		d9.opintoala1995_EN AS [Previous deg. field of ed. 95], 
		d9.opintoala2002_EN AS [Previous deg. subfield of ed. 02], 
		d9.koulutus_EN AS [Previous deg. name of ed.], 
		d3.maakunta_EN AS [Target degree's region], 
		d4.maakunta_EN AS [Degree's region], 
		d12.opiskelijan_olo_EN AS [Enrollment status], 
		d13.oppilaitos_EN AS [Target deg. ed. institution], 
		d13.oppilaitos_EN AS [Target deg. university], 
		d13.oppilaitos_EN AS [Target deg. polytechnic], 
		d13.koulutuksen_jarjestaja_EN AS [Target deg. ed. provider],
		d14.oppilaitos_EN AS [Degree's ed. institution], 
		d14.oppilaitos_EN AS [Degree's university], 
		d14.oppilaitos_EN AS [Degree's polytechnic], 
		f.saavutettu_suorv AS [Graduation year],
		[Study progress] =
			case f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]
				when 'Tutkinto alkuperäisessä tutkintolajissa' then 'Qualification in the original form of degree'
				when 'Tutkinto muussa tutkintolajissa' then 'Qualification in another form of degree'
				when 'Tutkinto muussa tutkintolajissa, kandidaatin tutkinto' then 'Qualification in another form of degree, Bachelor''s degree'
				when 'Opiskelee alkuperäisessä tutkintolajissa' then 'Studying in the original form of degree'
				when 'Opiskelee muussa tutkintolajissa' then 'Studying in another form of degree'
				when 'Ei tutkintoa, ei opiskele, työllinen' then 'No qualification, not studying, employed'
				when 'Ei tutkintoa, ei opiskele, ei työllinen' then 'No qualification, not studying, unemployed'
				else  'Missing data'
			end ,
		[Study progress prior. 2] = 
			case f.[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa]
				when 'Tutkinto alkuperäisessä tutkintolajissa' then 'Qualification in the original form of degree'
				when 'Tutkinto muussa tutkintolajissa' then 'Qualification in another form of degree'
				when 'Tutkinto muussa tutkintolajissa, kandidaatin tutkinto' then 'Qualification in another form of degree, Bachelor''s degree'
				when 'Opiskelee alkuperäisessä tutkintolajissa' then 'Studying in the original form of degree'
				when 'Opiskelee muussa tutkintolajissa' then 'Studying in another form of degree'
				when 'Ei tutkintoa, ei opiskele, työllinen' then 'No qualification, not studying, employed'
				when 'Ei tutkintoa, ei opiskele, ei työllinen' then 'No qualification, not studying, unemployed'
				else  'Missing data'
			end , 
		[Completed degree] =
			case f.[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan]
				when 'Tutkinto lukiokoulutuksesta' then 'Matriculation examination'
				when 'Ammatillinen perustutkinto' then 'Vocational upper secondary qualification'
				when 'Ammatillinen lisäkoulutus ammattitutkinto tai erikoisammattitutkinto' then 'Further vocational qualification or specialist vocational qualification'
				when 'Muu korkein ja viimeisimmäksi suoritettu tutkinto, toinen aste' then 'Other highest and most recent degree, upper secondary education'
				when 'Ammattikorkeakoulututkinto' then 'UAS degree'
				when 'Alempi korkeakoulututkinto' then 'Bachelor''s degree'
				when 'Ylempi ammattikorkeakoulututkinto' then 'UAS Master''s degree'
				when 'Ylempi korkeakoulututkinto' then 'Master''s degree'
				when 'Tutkijakoulutusasteen tutkinto' then 'Research degree'
				when 'Muu korkein ja viimeisimmäksi suoritettu tutkinto, korkeakoulututkinto' then 'Other highest and most recent degree, higher education'
				when 'Ei tutkintoa' then 'No degree'
				when 'Virhetilanne' then 'Missing data'
			end, 
		[Degree in target form of deg.] =
			case f.[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		[Degree in another form of deg.] =
			case f.[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		 [Degree in target field of ed. 02] =
			case f.[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		[Degree in target subfield of ed. 02] =
			case f.[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		 [Degree in target ed. institution] =
			case f.[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		 [Degree in target field of ed. 95] =
			case f.[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		--koodit
		d7.koulutusaste2002_Koodi AS [Koodit Tavoitetutk. koulutusaste 2002], 
		d7.koulutusala2002_Koodi AS [Koodit Tavoitetutk. koul.ala 2002], 
		d7.opintoala1995_Koodi AS [Koodit Tavoitetutk. koul.ala 1995], 
		d7.opintoala2002_Koodi AS [Koodit Tavoitetutk. opintoala 2002], 
		d7.koulutus_Koodi AS [Koodit Tavoitetutk. koulutusnimike], 
		d8.koulutusaste2002_Koodi AS [Koodit Suor. tutkinnon koulutusaste 2002], 
		d8.koulutusala2002_Koodi AS [Koodit Suor. tutkinnon koul.ala 2002], 
		d8.opintoala1995_Koodi AS [Koodit Suor. tutkinnon koul.ala 1995], 
		d8.opintoala2002_Koodi AS [Koodit Suor. tutkinnon opintoala 2002], 
		d8.koulutus_Koodi AS [Koodit Suor. tutkinnon koulutusnimike], 
		d9.koulutusaste2002_Koodi AS [Koodit Pohjakoul. koulutusaste 2002], 
		d9.koulutusala2002_Koodi AS [Koodit Pohjakoul. koul.ala 2002], 
		d9.opintoala1995_Koodi AS [Koodit Pohjakoul. koul.ala 1995], 
		d9.opintoala2002_Koodi AS [Koodit Pohjakoul. opintoala 2002], 
		d9.koulutus_Koodi AS [Koodit Pohjakoul. koulutusnimike], 
		d3.maakunta_Koodi AS [Koodit Tavoitetutk. maakunta], 
		d4.maakunta_Koodi AS [Koodit Suor. tutkinnon maakunta], 
		coalesce(d13.oppilaitoksen_korvaavakoodi,d13.oppilaitoskoodi) AS [Koodit Tavoitetutk. oppilaitos], 
		coalesce(d13.oppilaitoksen_korvaavakoodi,d13.oppilaitoskoodi) AS [Koodit Tavoitetutk. yliopisto], 
		coalesce(d13.oppilaitoksen_korvaavakoodi,d13.oppilaitoskoodi) AS [Koodit Tavoitetutk. amk], 
		d13.koulutuksen_jarjestajakoodi AS [Koodit Tavoitetutk. koul. järjestäjä],
		coalesce(d14.oppilaitoksen_korvaavakoodi,d14.oppilaitoskoodi) AS [Koodit Suor. tutkinnon oppilaitos], 
		coalesce(d14.oppilaitoksen_korvaavakoodi,d14.oppilaitoskoodi) AS [Koodit Suor. tutkinnon yliopisto], 
		coalesce(d14.oppilaitoksen_korvaavakoodi,d14.oppilaitoskoodi) AS [Koodit Suor. tutkinnon amk], 
		--jarjestys
		d1.jarjestys AS lukukausi_jarjestys, 
		d17.jarjestys AS tarkastelujakso_jarjestys, 
		d16.jarjestys AS sukupuoli_jarjestys, 
		d2.jarjestys AS aidinkieli_jarjestys, 
		d5.jarjestys_ika, 
		d5.jarjestys_ika5v,
		d5b.jarjestys_ika as [Ikaryhma 2 jarj], 
		d6.jarjestys_koulutuslaji2 AS koulutuslaji_jarjestys, 
		d7.jarjestys_koulutusaste2002, 
		d7.jarjestys_koulutusala2002, 
		d7.jarjestys_opintoala1995 AS jarjestys_koulutusala1995, 
		d7.jarjestys_opintoala2002 AS jarjestys_opintoala, 
		d7.jarjestys AS jarjestys_koulutusnimike, 
		d8.jarjestys_koulutusaste2002 AS jarjestys_suor_koulutusaste2002, 
		d8.jarjestys_koulutusala2002 AS jarjestys_suor_koulutusala2002, 
		d8.jarjestys_opintoala1995 AS jarjestys_suor_koulutusala1995, 
		d8.jarjestys_opintoala2002 AS jarjestys_suor_opintoala, 
		d8.jarjestys AS jarjestys_suor_koulutusnimike, 
		d9.jarjestys_koulutusaste2002 AS jarjestys_pohj_koulutusaste2002, 
		d9.jarjestys_koulutusala2002 AS jarjestys_pohj_koulutusala2002, 
		d9.jarjestys_opintoala1995 AS jarjestys_pohj_koulutusala1995, 
		d9.jarjestys_opintoala2002 AS jarjestys_pohj_opintoala, 
		d9.jarjestys AS jarjestys_pohj_koulutusnimike, 
		d3.jarjestys_maakunta, 
		d4.jarjestys_maakunta AS saavutettu_al_jarjestys_maakunta, 
		d12.jarjestys AS opiskelijan_olo_jarjestys, 
		d13.jarjestys_oppilaitos, 
		d13.jarjestys_oppilaitostyyppi, 
		d13.jarjestys_omistajatyyppi, 
		d14.jarjestys_oppilaitos AS saavutettu_jarjestys_oppilaitos, 
		d14.jarjestys_oppilaitostyyppi AS saavutettu_jarjestys_oppilaitostyyppi, 
		d14.jarjestys_omistajatyyppi AS saavutettu_jarjestys_omistajatyyppi, 
		f.[1a_jarjestys], f.[1b_jarjestys], f.[1c_jarjestys], 
		f.[1d_jarjestys], f.[1e_jarjestys], f.[1f_jarjestys], f.[1g_jarjestys], f.[1h_jarjestys], 
		f.[2a_jarjestys], f.[2b_jarjestys], f.[2e_jarjestys], f.[2f_jarjestys], f.[2g_jarjestys], 
		f.[2h_jarjestys], f.[3a_jarjestys], f.[3b_jarjestys], f.[3e_jarjestys], f.[3f_jarjestys], 
		f.[3g_jarjestys], f.[3h_jarjestys], f.[4a_jarjestys], f.[4b_jarjestys], f.[4e_jarjestys], 
		f.[4f_jarjestys], f.[4g_jarjestys], f.[4h_jarjestys], f.[5a_jarjestys], f.[5b_jarjestys], 
		f.[5e_jarjestys], f.[5f_jarjestys], f.[5g_jarjestys], f.[5h_jarjestys], f.[6a_jarjestys], 
		f.[6b_jarjestys], f.[6e_jarjestys], f.[6f_jarjestys], f.[6g_jarjestys], f.[6h_jarjestys], 
		f.[7a_jarjestys], f.[7b_jarjestys], f.[7e_jarjestys], f.[7f_jarjestys], f.[7g_jarjestys], 
		f.[7h_jarjestys], f.[8a_jarjestys], f.[8b_jarjestys], f.[8e_jarjestys], f.[8f_jarjestys], 
		f.[8g_jarjestys], f.[8h_jarjestys], 
		d10.lahde_koodi, 
		d6.koulutuslaji2_koodi
		--isced
		,d7.iscle2011 as "Tavoitetutk. koul.aste 1"
		,d7.Koulutusaste_taso2 as "Tavoitetutk. koul.aste 2"
		,d7.iscfibroad2013 as "Tavoitetutk. koul.ala 1"
		,d7.iscfinarrow2013 as "Tavoitetutk. koul.ala 2"
		,d7.iscfi2013 as "Tavoitetutk. koul.ala 3"
		,d7.OKM_ohjauksen_ala as "Tavoitetutk. OKM ohj. ala kk"
		,d7.iscle2011_SV as "Målexamens utbildn.nivå 1"
		,d7.Koulutusaste_taso2_SV as "Målexamens utbildn.nivå 2"
		,d7.iscfibroad2013_SV as "Målexamens utbildn.omr. 1"
		,d7.iscfinarrow2013_SV as "Målexamens utbildn.omr. 2"
		,d7.iscfi2013_SV as "Målexamens utbildn.omr. 3"
		,d7.OKM_ohjauksen_ala_SV as "Målexamens UKM-styrn.omr. hs"
		,d7.iscle2011_EN as "Target level of ed. 1"
		,d7.Koulutusaste_taso2_EN as "Target level of ed. 2"
		,d7.iscfibroad2013_EN as "Target field of ed. 1"
		,d7.iscfinarrow2013_EN as "Target field of ed. 2"
		,d7.iscfi2013_EN as "Target field of ed. 3"
		,d7.OKM_ohjauksen_ala_EN as "Target field of ed. HE ste."
		,d7.jarjestys_iscle2011 as jarj_isced_koulast1
		,d7.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
		,d7.jarjestys_iscfibroad2013 as jarj_isced_koulala1
		,d7.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
		,d7.jarjestys_iscfi2013 as jarj_isced_koulala3
		,d7.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1
		,d7.iscle2011_koodi as "Koodit Tavoitetutk. koul.aste 1"
		,d7.Koulutusaste_taso2_koodi as "Koodit Tavoitetutk. koul.aste 2"
		,d7.iscfibroad2013_koodi as "Koodit Tavoitetutk. koul.ala 1"
		,d7.iscfinarrow2013_koodi as "Koodit Tavoitetutk. koul.ala 2"
		,d7.iscfi2013_koodi as "Koodit Tavoitetutk. koul.ala 3"
		,d7.OKM_ohjauksen_ala_koodi as "Koodit Tavoitetutk. OKM ohjauksen ala kk"
		,d8.iscle2011 as "Suor. tutk. koul.aste 1"
		,d8.Koulutusaste_taso2 as "Suor. tutk. koul.aste 2"
		,d8.iscfibroad2013 as "Suor. tutk. koul.ala 1"
		,d8.iscfinarrow2013 as "Suor. tutk. koul.ala 2"
		,d8.iscfi2013 as "Suor. tutk. koul.ala 3"
		,d8.OKM_ohjauksen_ala as "Suor. tutk. OKM ohj. ala kk"
		,d8.iscle2011_SV as "Examens utbildn.nivå 1"
		,d8.Koulutusaste_taso2_SV as "Examens utbildn.nivå 2"
		,d8.iscfibroad2013_SV as "Examens utbildn.omr. 1"
		,d8.iscfinarrow2013_SV as "Examens utbildn.omr. 2"
		,d8.iscfi2013_SV as "Examens utbildn.omr. 3"
		,d8.OKM_ohjauksen_ala_SV as "Examens UKM-styrn.omr. hs"
		,d8.iscle2011_EN as "Degree's level of ed. 1"
		,d8.Koulutusaste_taso2_EN as "Degree's level of ed. 2"
		,d8.iscfibroad2013_EN as "Degree's field of ed. 1"
		,d8.iscfinarrow2013_EN as "Degree's field of ed. 2"
		,d8.iscfi2013_EN as "Degree's field of ed. 3"
		,d8.OKM_ohjauksen_ala_EN as "Degree's field of ed. HE ste."
		,d8.jarjestys_iscle2011 as jarj_isced2_koulast1
		,d8.jarjestys_Koulutusaste_taso2 as jarj_isced2_koulast2
		,d8.jarjestys_iscfibroad2013 as jarj_isced2_koulala1
		,d8.jarjestys_iscfinarrow2013 as jarj_isced2_koulala2
		,d8.jarjestys_iscfi2013 as jarj_isced2_koulala3
		,d8.jarjestys_OKM_ohjauksen_ala as jarj_isced2_okmohjaus1
		,d8.iscle2011_koodi as "Koodit Suor. tutk. koul.aste 1"
		,d8.Koulutusaste_taso2_koodi as "Koodit Suor. tutk. koul.aste 2"
		,d8.iscfibroad2013_koodi as "Koodit Suor. tutk. koul.ala 1"
		,d8.iscfinarrow2013_koodi as "Koodit Suor. tutk. koul.ala 2"
		,d8.iscfi2013_koodi as "Koodit Suor. tutk. koul.ala 3"
		,d8.OKM_ohjauksen_ala_koodi as "Koodit Suor. tutk. OKM ohjauksen ala kk"
		,d9.iscle2011 as "Pohjakoul. koul.aste 1"
		,d9.Koulutusaste_taso2 as "Pohjakoul. koul.aste 2"
		,d9.iscfibroad2013 as "Pohjakoul. koul.ala 1"
		,d9.iscfinarrow2013 as "Pohjakoul. koul.ala 2"
		,d9.iscfi2013 as "Pohjakoul. koul.ala 3"
		,d9.OKM_ohjauksen_ala as "Pohjakoul. OKM ohj. ala kk"
		,d9.iscle2011_SV as "Grundutb. utbildn.nivå 1"
		,d9.Koulutusaste_taso2_SV as "Grundutb. utbildn.nivå 2"
		,d9.iscfibroad2013_SV as "Grundutb. utbildn.omr. 1"
		,d9.iscfinarrow2013_SV as "Grundutb. utbildn.omr. 2"
		,d9.iscfi2013_SV as "Grundutb. utbildn.omr. 3"
		,d9.OKM_ohjauksen_ala_SV as "Grundutb. UKM-styrn.omr. hs"
		,d9.iscle2011_EN as "Previous deg. level of ed. 1"
		,d9.Koulutusaste_taso2_EN as "Previous deg. level of ed. 2"
		,d9.iscfibroad2013_EN as "Previous deg. field of ed. 1"
		,d9.iscfinarrow2013_EN as "Previous deg. field of ed. 2"
		,d9.iscfi2013_EN as "Previous deg. field of ed. 3"
		,d9.OKM_ohjauksen_ala_EN as "Previous deg. field of ed. HE ste."
		,d9.jarjestys_iscle2011 as jarj_isced3_koulast1
		,d9.jarjestys_Koulutusaste_taso2 as jarj_isced3_koulast2
		,d9.jarjestys_iscfibroad2013 as jarj_isced3_koulala1
		,d9.jarjestys_iscfinarrow2013 as jarj_isced3_koulala2
		,d9.jarjestys_iscfi2013 as jarj_isced3_koulala3
		,d9.jarjestys_OKM_ohjauksen_ala as jarj_isced3_okmohjaus1
		,d9.iscle2011_koodi as "Koodit Pohjakoul. koul.aste 1"
		,d9.Koulutusaste_taso2_koodi as "Koodit Pohjakoul. koul.aste 2"
		,d9.iscfibroad2013_koodi as "Koodit Pohjakoul. koul.ala 1"
		,d9.iscfinarrow2013_koodi as "Koodit Pohjakoul. koul.ala 2"
		,d9.iscfi2013_koodi as "Koodit Pohjakoul. koul.ala 3"
		,d9.OKM_ohjauksen_ala_koodi as "Koodit Pohjakoul. OKM ohjauksen ala kk"
FROM     dbo.f_aloittaneiden_lapaisy f INNER JOIN
			dbo.d_kausi AS d1 ON d1.kausi_id = f.aloituskausikoodi INNER JOIN
			dbo.d_aidinkieli_versio1 AS d2 ON d2.id = f.aikielir1_id INNER JOIN
			dbo.d_sukupuoli AS d16 ON d16.id = f.sp_id INNER JOIN
			dbo.d_tarkastelujakso AS d17 ON d17.id = f.tarkastelujakso_id INNER JOIN
			dbo.d_alueluokitus AS d3 ON d3.id = f.alueluokitus_id INNER JOIN
			dbo.d_alueluokitus AS d4 ON d4.id = f.saavutettu_alueluokitus_id INNER JOIN
			dbo.d_ika AS d5 ON d5.id = f.ika_id INNER JOIN
			dbo.d_ika as d5b on d5b.ika_avain = case 
												when d5.ika_int>0 and d5.ika_int<19 then 'ikar7_18'
												when d5.ika_int>18 and d5.ika_int<25 then 'ikar7_'+d5.ika
												when d5.ika_int>24 and d5.ika_int<30 then 'ikar7_25'
												when d5.ika_int>29 and d5.ika_int<35 then 'ikar7_30'
												when d5.ika_int>34 and d5.ika_int<40 then 'ikar7_35'
												when d5.ika_int>39 and d5.ika_int<45 then 'ikar7_40'
												when d5.ika_int>44 and d5.ika_int<50 then 'ikar7_45'
												when d5.ika_int>49 and d5.ika_int<55 then 'ikar7_50'
												when d5.ika_int>54 and d5.ika_int<60 then 'ikar7_55'
												when d5.ika_int>59 and d5.ika_int<65 then 'ikar7_60'
												when d5.ika_int>64 then 'ikar7_65'
												when d5.ika_int=-1 then d5.ika_avain
												else null end
												INNER JOIN
			dbo.d_koulutuslaji2 AS d6 ON d6.id = f.koulutuslaji2_id INNER JOIN
			dbo.d_koulutusluokitus AS d7 ON d7.id = f.koulk_id INNER JOIN
			dbo.d_koulutusluokitus AS d8 ON d8.id = f.saavutettu_koulk_id INNER JOIN
			dbo.d_koulutusluokitus AS d9 ON d9.id = f.pohjkoulk_id INNER JOIN
			dbo.d_lahde AS d10 ON d10.id = f.lahde_id INNER JOIN
			dbo.d_opiskelijan_olo AS d12 ON d12.id = f.ololk_id INNER JOIN
			dbo.d_oppilaitoksen_taustatiedot AS d13 ON d13.id = f.oppilaitoksen_taustatiedot_id INNER JOIN
			dbo.d_oppilaitoksen_taustatiedot AS d14 ON d14.id = f.saavutettu_oppilaitoksen_taustatiedot_id
WHERE        (f.aineistokoodi = 'K3.10') AND (d17.tarkastelujakso <> '0,5 vuotta') AND (d1.lukuvuosi <> '1999/2000') AND (d1.lukuvuosi <> '2000/2001') AND (d1.lukuvuosi <> '2001/2002') AND (d6.koulutuslaji2_koodi <> '52') AND 
                         (f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne')



















GO


USE [ANTERO]