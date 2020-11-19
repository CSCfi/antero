USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_aloittaneiden_lapaisy_K3_9_lukio]    Script Date: 21.10.2020 11:48:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_f_aloittaneiden_lapaisy_K3_9_lukio]
AS
SELECT f.lkm_int AS lkm_int2, 
		d1.lukuvuosi AS Aloituslukuvuosi, 
		d1.vuosiselite AS Aloitusvuosi, 
		d1.lukukausiselite AS Aloituslukukausi, 
		d17.tarkastelujakso AS Tarkastelujakso, 		
		d11.opetushallinnon_koulutus AS Hallinnonala, 
		d16.sukupuoli AS Sukupuoli, 
		d2.aidinkieli_versio1 AS Äidinkieli, 
		d5.ika AS Ikä, 
		--d5.ika5v AS [Ikäryhmä II], 
		d5b.ikaryhma2_fi as [Ikäryhmä],
		d6.koulutuslaji2 AS [Tavoitetutk. koulutuslaji], 
		d7.koulutusaste2002 AS [Tavoitetutk. koulutusaste], 
		d7.koulutusala2002 AS [Tavoitetutk. koulutusala], 		
		d7.opintoala2002 AS [Tavoitetutk. opintoala], 
		d7.koulutus AS [Tavoitetutk. koulutusnimike], 
		d8.koulutusaste2002 AS [Suor. tutkinnon koulutusaste], 
		d8.koulutusala2002 AS [Suor. tutkinnon koulutusala], 		
		d8.opintoala2002 AS [Suor. tutkinnon opintoala], 
		d8.koulutus AS [Suor. tutkinnon koulutusnimike], 
		d9.koulutusaste2002 AS [Pohjakoul. koulutusaste], 
		d9.koulutusala2002 AS [Pohjakoul. koulutusala], 		
		d9.opintoala2002 AS [Pohjakoul. opintoala], 
		d9.koulutus AS [Pohjakoul. koulutusnimike], 
		d3.kunta AS [Tavoitetutk. kunta], 
		d3.maakunta AS [Tavoitetutk. maakunta], 
		d3.avi AS [Tavoitetutk. AVI], 		
		d3.ely AS [Tavoitetutk. ELY], 
		d3.seutukunta AS [Tavoitetutk. seutukunta], 
		d3.suuralue AS [Tavoitetutk. suuralue], 
		d3.kuntaryhma AS [Tavoitetutk. kuntaryhmä], 
		d3.laani AS [Tavoitetutk. lääni], 		
		d3.tyovoima_elinkeinokeskus AS [Tavoitetutk. työvoima ja elinkeinokeskus], 
		d3.kielisuhde AS [Tavoitetutk. kunnan kielisuhde], 
		d4.kunta AS [Suor. tutkinnon kunta], 
		d4.maakunta AS [Suor. tutkinnon maakunta], 		
		d4.avi AS [Suor. tutkinnon AVI], 
		d4.ely AS [Suor. tutkinnon ELY], 
		d4.seutukunta AS [Suor. tutkinnon seutukunta], 
		d4.suuralue AS [Suor. tutkinnon suuralue], 
		d4.kuntaryhma AS [Suor. tutkinnon kuntaryhmä], 		
		d4.laani AS [Suor. tutkinnon lääni], 
		d4.tyovoima_elinkeinokeskus AS [Suor. tutkinnon työvoima ja elinkeinokeskus], 
		d4.kielisuhde AS [Suor. tutkinnon kunnan kielisuhde], 
		d12.opiskelijan_olo AS Kirjoillaolo, 		
		d15.rahoituslahde AS [Tavoitetutk. rahoituslähde], 
		d13.oppilaitos AS [Tavoitetutk. oppilaitos], 
		d13.oppilaitostyyppi AS [Tavoitetutk. oppil.tyyppi], 		
		d13.oppilaitoksen_omistajatyyppi AS [Tavoitetutk. oppil. omistajatyyppi], 
		d13.opetuskieli AS [Tavoitetutk. oppil. opetuskieli], 
		d13.koulutuksen_jarjestaja AS [Tavoitetutk. koul. järjestäjä], 		
		d13.koulutuksen_jarjestajan_omistajatyyppi AS [Tavoitetutk. koul. järjestäjän omistajatyyppi], 
		d13.koulutuksen_jarjestajan_kieli AS [Tavoitetutk. koul. järjestäjän kieli], 		
		d14.oppilaitos AS [Suor. tutkinnon oppilaitos], 
		d14.oppilaitostyyppi AS [Suor. tutkinnon oppil.tyyppi], 
		d14.oppilaitoksen_omistajatyyppi AS [Suor. tutkinnon oppil. omistajatyyppi], 		
		d14.opetuskieli AS [Suor. tutkinnon oppil. opetuskieli], 
		d14.koulutuksen_jarjestaja AS [Suor. tutkinnon koul. järjestäjä], 		
		d14.koulutuksen_jarjestajan_omistajatyyppi AS [Suor. tutkinnon koul. järjestäjän omistajatyyppi], 
		d14.koulutuksen_jarjestajan_kieli AS [Suor. tutkinnon koul. järjestäjän kieli], 		
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
		f.[2f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan] AS [Tutkinto muulla koulutusalalla], 		
		f.[2g Aloittaneista alkuperäisellä koulutusalalla opiskelua jatkavat koulutusalan mukaan] AS [Opiskelee tavoitet. koulutusalalla], 		
		f.[2h Aloittaneista muulla koulutusalalla opiskelua jatkavat koulutusalan mukaan] AS [Opiskelee muulla koulutusalalla], 		
		f.[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto] AS [Opintojen kulku opintoaloittain], 		
		f.[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä] AS [Opintojen kulku opintoaloittain prioriteetti 2], 		
		f.[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan] AS [Tutkinto tavoitet. opintoalalla], 		
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
		d11.opetushallinnon_koulutus AS Förvaltningsområde, 
		d2.aidinkieli_versio1_SV AS Modersmål, 
		d5.ika_SV AS Ålder, 
		--d5.ika5v_SV AS [Åldersgrupp II],
		d5b.ikaryhma2_sv AS [Åldersgrupp], 
		d6.koulutuslaji2_SV AS [Målexamens examensslag], 
		d7.koulutus_SV AS [Målexamens utbildn.benämning], 
		d8.koulutus_SV AS [Examens utbildn.benämning], 
		d9.koulutusaste2002_SV AS [Grundutb. utbildn.nivå 2002], 
		d9.koulutusala2002_SV AS [Grundutb. utbildn.område 2002], 
		d9.opintoala2002_SV AS [Grundutb. studieområde 2002], 
		d9.koulutus_SV AS [Grundutb. utbildn.benämning], 
		d3.maakunta_SV AS [Målexamens landskap], 
		d3.avi AS [Målexamens RVF], 		
		d3.ely AS [Målexamens NTM], 
		d3.kunta AS [Målexamens kommun], 
		d4.maakunta_SV AS [Examens landskap], 
		d4.avi AS [Examens RVF], 
		d4.ely AS [Examens NTM], 
		d4.kunta AS [Examens kommun], 
		d12.opiskelijan_olo_SV AS Inskrivning, 
		d13.koulutuksen_jarjestaja_SV AS [Målexamens utbildn.ordnare],
		d14.koulutuksen_jarjestaja AS [Examens utbildn.ordnare], 
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
		d11.opetushallinnon_koulutus AS [Administrative sector], 
		d2.aidinkieli_versio1_EN AS [Mother tongue], 
		d5.ika_EN AS Age, 
		--d5.ika5v_EN AS [Age group II],
		d5b.ikaryhma2_en AS [Age group],  
		d6.koulutuslaji2_EN AS [Target qualif. form of qual.], 
		d7.koulutus_EN AS [Target qual. name of ed.], 
		d8.koulutus_EN AS [Qualif. name of ed.], 
		d9.koulutusaste2002_EN AS [Previous qual. level of ed. 02], 
		d9.koulutusala2002_EN AS [Previous qual. field of ed. 02], 
		d9.opintoala2002_EN AS [Previous qual. subfield of ed. 02], 
		d9.koulutus_EN AS [Previous qual. name of ed.], 
		d3.maakunta_EN AS [Target qualif. region], 
		d3.avi AS [Target qualif. AVI], 		
		d3.ely AS [Target qualif. ELY], 
		d3.kunta AS [Target qualif. municipal.], 
		d4.maakunta_EN AS [Qualifcation's region], 
		d4.avi AS [Qualifcation's AVI], 
		d4.ely AS [Qualifcation's ELY], 
		d4.kunta AS [Qualifcation's municipality], 
		d12.opiskelijan_olo_EN AS [Enrollment status], 
		d13.koulutuksen_jarjestaja_EN AS [Target qual. ed. provider],
		d14.koulutuksen_jarjestaja AS [Qualification's ed. provider], 
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
		[Completed qualification] =
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
		[Completed in target form of qual.] =
			case f.[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		[Completed in another form of qual.] =
			case f.[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		 [Completed in target field of ed. 02] =
			case f.[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		[Completed in target subfield of ed. 02] =
			case f.[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		 [Completed in target ed. institution] =
			case f.[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		 [Completed in target field of ed. 95] =
			case f.[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
				when 'Kyllä' then 'Yes'
				when 'Ei' then 'No'
				when 'Virhetilanne' then 'Missing data'
			end, 
		--koodit
		d7.koulutus_Koodi AS [Koodit Tavoitetutk. koulutusnimike], 
		d8.koulutus_Koodi AS [Koodit Suor. tutkinnon koulutusnimike], 
		d9.koulutus_Koodi AS [Koodit Pohjakoul. koulutusnimike], 
		d3.maakunta_Koodi AS [Koodit Tavoitetutk. maakunta], 
		d4.maakunta_Koodi AS [Koodit Suor. tutkinnon maakunta], 
		d13.koulutuksen_jarjestajakoodi AS [Koodit Tavoitetutk. koul. järjestäjä],
		--jarjestys
		d1.jarjestys AS lukukausi_jarjestys, 		
		d17.jarjestys AS tarkastelujakso_jarjestys, 
		d11.jarjestys AS opetushallinnon_koulutus_jarjestys, 
		d16.jarjestys AS sukupuoli_jarjestys, 
		d2.jarjestys AS aidinkieli_jarjestys, 
		d5.jarjestys_ika, 
		--d5.jarjestys_ika5v, 	
		d5b.jarjestys_ikaryhma2 as [jarjestys_ikaryhma],		
		d6.jarjestys_koulutuslaji2 AS koulutuslaji_jarjestys, 
		d7.jarjestys_koulutusaste2002, 
		d7.jarjestys_koulutusala2002, 
		d7.jarjestys_opintoala2002 AS jarjestys_opintoala, 
		d7.jarjestys AS jarjestys_koulutusnimike, 		
		d8.jarjestys_koulutusaste2002 AS jarjestys_suor_koulutusaste2002, 
		d8.jarjestys_koulutusala2002 AS jarjestys_suor_koulutusala2002, 
		d8.jarjestys_opintoala2002 AS jarjestys_suor_opintoala, 		
		d8.jarjestys AS jarjestys_suor_koulutusnimike, 
		d9.jarjestys_koulutusaste2002 AS jarjestys_pohj_koulutusaste2002, 
		d9.jarjestys_koulutusala2002 AS jarjestys_pohj_koulutusala2002, 		
		d9.jarjestys_opintoala2002 AS jarjestys_pohj_opintoala, 
		d9.jarjestys AS jarjestys_pohj_koulutusnimike, 
		d3.jarjestys AS alueluokitus_jarjestys, 
		d3.jarjestys_maakunta, 
		d3.jarjestys_avi, 
		d3.jarjestys_ely, 		
		d3.jarjestys_seutukunta, 
		d3.jarjestys_suuralue, 
		d3.jarjestys_kuntaryhma, 
		d3.jarjestys_laani, 
		d3.jarjestys_tyovoima_elinkeinokeskus, 
		d3.jarjestys_kielisuhde, 
		d4.jarjestys AS saavutettu_al_jarjestys, 		
		d4.jarjestys_maakunta AS saavutettu_al_jarjestys_maakunta, 
		d4.jarjestys_avi AS saavutettu_al_jarjestys_avi, 
		d4.jarjestys_ely AS saavutettu_al_jarjestys_ely, 		
		d4.jarjestys_seutukunta AS saavutettu_al_jarjestys_seutukunta, 
		d4.jarjestys_suuralue AS saavutettu_al_jarjestys_suuralue, 
		d4.jarjestys_kuntaryhma AS saavutettu_al_jarjestys_kuntaryhma, 		
		d4.jarjestys_laani AS saavutettu_al_jarjestys_laani, 
		d4.jarjestys_tyovoima_elinkeinokeskus AS saavutettu_al_jarjestys_tyovoima_elinkeinokeskus, 		
		d4.jarjestys_kielisuhde AS saavutettu_al_jarjestys_kielisuhde, 
		d12.jarjestys AS opiskelijan_olo_jarjestys, 
		d15.jarjestys AS rahoituslahde_jarjestys, 
		d13.jarjestys_oppilaitos, 
		d13.jarjestys_oppilaitostyyppi, 		
		d13.jarjestys_omistajatyyppi, 
		d13.jarjestys_opetuskieli, 
		d13.jarjestys_koulutuksen_jarjestaja, 
		d13.jarjestys_koulutuksenjarjestaja, 
		d13.jarjestys_koulutuksen_jarjestajan_kieli, 		
		d14.jarjestys_oppilaitos AS saavutettu_jarjestys_oppilaitos, 
		d14.jarjestys_oppilaitostyyppi AS saavutettu_jarjestys_oppilaitostyyppi, 
		d14.jarjestys_omistajatyyppi AS saavutettu_jarjestys_omistajatyyppi, 		
		d14.jarjestys_opetuskieli AS saavutettu_jarjestys_opetuskieli, 
		d14.jarjestys_koulutuksen_jarjestaja AS saavutettu_jarjestys_koulutuksen_jarjestaja, 		
		d14.jarjestys_koulutuksenjarjestaja AS saavutettu_jarjestys_koulutuksenjarjestaja, 
		d14.jarjestys_koulutuksen_jarjestajan_kieli AS saavutettu_jarjestys_koulutuksen_jarjestajan_kieli, 
		f.[1a_jarjestys], 
		f.[1b_jarjestys], f.[1c_jarjestys], f.[1d_jarjestys], f.[1e_jarjestys], f.[1f_jarjestys], f.[1g_jarjestys], f.[1h_jarjestys], f.[2a_jarjestys], f.[2b_jarjestys], f.[2e_jarjestys], f.[2f_jarjestys], f.[2g_jarjestys], f.[2h_jarjestys], 
		f.[3a_jarjestys], f.[3b_jarjestys], f.[3e_jarjestys], f.[3f_jarjestys], f.[3g_jarjestys], f.[3h_jarjestys], f.[4a_jarjestys], f.[4b_jarjestys], f.[4e_jarjestys], f.[4f_jarjestys], f.[4g_jarjestys], f.[4h_jarjestys], f.[5a_jarjestys], 
		f.[5b_jarjestys], f.[5e_jarjestys], f.[5f_jarjestys], f.[5g_jarjestys], f.[5h_jarjestys], f.[6a_jarjestys], f.[6b_jarjestys], f.[6e_jarjestys], f.[6f_jarjestys], f.[6g_jarjestys], f.[6h_jarjestys], f.[7a_jarjestys], f.[7b_jarjestys], 
		f.[7e_jarjestys], f.[7f_jarjestys], f.[7g_jarjestys], f.[7h_jarjestys], f.[8a_jarjestys], f.[8b_jarjestys], f.[8e_jarjestys], f.[8f_jarjestys], f.[8g_jarjestys], f.[8h_jarjestys], 
		d10.lahde_koodi, 
		d6.koulutuslaji2_koodi
		
FROM  dbo.f_aloittaneiden_lapaisy f LEFT JOIN
        dbo.d_kausi AS d1 ON d1.kausi_id = f.aloituskausikoodi LEFT JOIN
        dbo.d_aidinkieli_versio1 AS d2 ON d2.id = f.aikielir1_id LEFT JOIN
        dbo.d_sukupuoli AS d16 ON d16.id = f.sp_id LEFT JOIN
        dbo.d_tarkastelujakso AS d17 ON d17.id = f.tarkastelujakso_id LEFT JOIN
        dbo.d_alueluokitus AS d3 ON d3.id = f.alueluokitus_id LEFT JOIN
        dbo.d_alueluokitus AS d4 ON d4.id = f.saavutettu_alueluokitus_id LEFT JOIN
        dbo.d_ika AS d5 ON d5.id = f.ika_id LEFT JOIN
		[ANTERO].[dw].[d_ika] as d5b on d5b.ika_avain = d5.ika LEFT JOIN
		/*	
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
												else null end LEFT JOIN
		*/
        dbo.d_koulutuslaji2 AS d6 ON d6.id = f.koulutuslaji2_id LEFT JOIN
        dbo.d_koulutusluokitus AS d7 ON d7.id = f.koulk_id LEFT JOIN
        dbo.d_koulutusluokitus AS d8 ON d8.id = f.saavutettu_koulk_id LEFT JOIN
        dbo.d_koulutusluokitus AS d9 ON d9.id = f.pohjkoulk_id LEFT JOIN
        dbo.d_lahde AS d10 ON d10.id = f.lahde_id LEFT JOIN
        dbo.d_opetushallinnon_koulutus AS d11 ON d11.id = f.ophal_id LEFT JOIN
        dbo.d_opiskelijan_olo AS d12 ON d12.id = f.ololk_id LEFT JOIN
        dbo.d_oppilaitoksen_taustatiedot AS d13 ON d13.id = f.oppilaitoksen_taustatiedot_id LEFT JOIN
        dbo.d_oppilaitoksen_taustatiedot AS d14 ON d14.id = f.saavutettu_oppilaitoksen_taustatiedot_id LEFT JOIN
        dbo.d_rahoituslahde AS d15 ON d15.id = f.rahlahde_id

WHERE f.aineistokoodi = 'K3.9' 
	AND d10.lahde_koodi = '21' 
	AND f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'


GO
USE [ANTERO]

