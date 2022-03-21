USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_amm_opintojen_kulku]    Script Date: 26.5.2021 15:44:23 ******/
DROP VIEW IF EXISTS [dw].[v_koski_amm_opintojen_kulku]
GO

/****** Object:  View [dw].[v_koski_amm_opintojen_kulku]    Script Date: 26.5.2021 15:44:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE VIEW [dw].[v_koski_amm_opintojen_kulku] AS

SELECT --TOP 100 

-- AIKAMUUTTUJAT
	Aloitusajankohta = f.kohortti_fi
	,Aloitusvuosi = aloitusvuosi
	,Aloitusvuosipuolisko = aloitusvuosipuolisko
-- LASKENTAMUUTTUJAT
	  ,oppija_oid
      ,aikaero_AB = COALESCE([aikaero_AB], -1)
      ,[aikaero_AB_virhe]
      ,A_koulutuksen_kesto = COALESCE([A_koulutuksen_kesto], - 1)
 --     ,[osaamispisteet_per_sarja]
 --     ,[osaamispisteet_kum]
	  ,Tarkastelujakso =
		CASE
			WHEN sarja = 0 THEN 'Aloituspäivä'
			WHEN sarja = 1 THEN '0,5 vuotta aloituspäivästä'
			WHEN sarja = 2 THEN '1,0 vuotta aloituspäivästä'
			WHEN sarja = 3 THEN '1,5 vuotta aloituspäivästä'
			WHEN sarja = 4 THEN '2,0 vuotta aloituspäivästä'
			WHEN sarja = 5 THEN '2,5 vuotta aloituspäivästä'
			WHEN sarja = 6 THEN '3,0 vuotta aloituspäivästä'
			WHEN sarja = 7 THEN '3,5 vuotta aloituspäivästä'
			WHEN sarja = 8 THEN '4,0 vuotta aloituspäivästä'
			WHEN sarja = 9 THEN '4,5 vuotta aloituspäivästä'
			ELSE NULL END
      ,[paivat_lasna]
      ,[paivat_koulutussopimus]
      ,[paivat_oppisopimus]
	  ,kohortin_koko
	  ,ero_ajankohta_kk
	  ,eroaminen_tapahtunut
	  ,valmistuminen_tapahtunut
	  ,peruskoulu_keskiarvo = COALESCE(peruskoulu_keskiarvo, -1)
	  ,peruskoulu_keskiarvo_lukuaineet = COALESCE(peruskoulu_keskiarvo_lukuaineet, -1)

-- SIIRTYMÄMUUTTUJAT
      ,[Tutkinnon sukupuolivaltaisuus] = [A_sukupuolivaltaisuus]
      ,[Uuden tutk. sukupuolivaltaisuus] = [B_sukupuolivaltaisuus]
      ,[Lopputulema] = [A_lopputulema]
      ,[Tilanne] = [A_taso1]
      ,[Uuden koul. lopputulema] =[B_lopputulema]
      ,[Uuden koul. tilanne] = [B_taso1]
      ,[Uusi koulutus] = [uusi_koulutus_olemassa]
      ,[Uusi alkanut päällekkäisesti] = [uusi_alkanut_ennen_paattymista]
      ,[Uusi alkanut päällekkäisesti (10 pv)] = [uusi_alkanut_ennen_paattymista_toleranssi]  
      ,[Tutkinto vaihtunut] = [muutos_tutkinto]
      ,[Osaamisala vaihtunut] = [muutos_osaamisala]
      ,[Tavoite vaihtunut] = [muutos_tavoite]
	  ,[Prioristoitu tilanne] = priorisoitu_tilanne
	  ,[Koulutuksen järjestäjän vaihdos] = vaihtanut_jarjestajaa


-- HENKILÖMUUTTUJAT
	,[Sukupuoli] = d1.sukupuoli_fi
	,[Äidinkieli] = d2.kieliryhma1_fi
	,[Ikä] = d3.ika_fi 
	,[Ikäryhmä] = d3.ikaryhma3_fi
    ,[Peruskoulun päättökeskiarvo] = [peruskoulu_keskiarvo_kategoria]
    ,[Peruskoulun lukuaineiden päättökeskiarvo] = [peruskoulu_keskiarvo_lukuaineet_kategoria]
	,[Päättökeskiarvon kvintiili] = [peruskoulu_keskiarvo_kvintiili]
	,[Lukuaineiden päättökeskiarvon kvintiili] = [peruskoulu_keskiarvo_lukuaineet_kvintiili]
	,Kansalaisuus = case when d21.maatjavaltiot2_fi = 'Suomi' then 'Suomi' else 'Muu' end

-- ALKUPERÄINEN KOULUTUSMUUTTUJAT
	,[Tutkintotyypin ryhmä] = d4a.tutkintotyypin_ryhma_fi --case when d18a.koodi = 'muu' then 'Muu ammatillinen koulutus' else d4a.tutkintotyypin_ryhma_fi end
    ,[Tutkintotyyppi] = d4a.tutkintotyyppi_fi --case when d18a.koodi = 'muu' then 'Muu ammatillinen koulutus' else d4a.tutkintotyyppi_fi end
	,[Tutkinto] = d4a.koulutusluokitus_fi  
	,[Koulutusala, taso 3] = d4a.koulutusalataso3_fi  
    ,[Koulutusala, taso 2] = d4a.koulutusalataso2_fi 
	,[Koulutusala, taso 1] = d4a.koulutusalataso1_fi 
	,[Osaamisala] = d20a.selite_fi
    ,[Suorituksen tyyppi] = d17a.selite_fi
--	,[Rahoitusmuoto] = d19.selite_fi
	,[Erityisopetus] = d13a.erityisopetus_nimi_fi
	,[Erityisopiskelija] = erityisopetus_jossain
--	,[Majoitus] = d15.majoitus_nimi_fi

-- ALKUPERÄINEN ORGANISAATIOMUUTTUJAT
	,[Oppilaitos] = d5a.organisaatio_fi
	,[Koulutuksen järjestäjä] = d11a.organisaatio_fi
--	,[Toimipiste] = d21a.organisaatio_fi
	,[Oppilaitoksen kunta] = d10a.kunta_fi
	,[Oppilaitoksen maakunta] = d10a.maakunta_fi
	,[Oppilaitoksen AVI] = d10a.avi_fi
	,[Oppilaitoksen ELY] = d10a.ely_fi 
	,[Koul. järjestäjän kunta] = d12a.kunta_fi 
	,[Koul. järjestäjän maakunta] = d12a.maakunta_fi 
	,[Koul. järjestäjän ELY] = d12a.ely_fi 
	,[Koul. järjestäjän AVI] = d12a.avi_fi  

-- UUDET KOULUTUSMUUTTUJAT
	,[Uusi Tutkintotyypin ryhmä] = d4b.tutkintotyypin_ryhma_fi --case when d18b.koodi = 'muu' then 'Muu ammatillinen koulutus' else d4b.tutkintotyypin_ryhma_fi end
    ,[Uusi Tutkintotyyppi] = d4b.tutkintotyyppi_fi --case when d18b.koodi = 'muu' then 'Muu ammatillinen koulutus' else d4b.tutkintotyyppi_fi end
	,[Uusi Tutkinto] = d4b.koulutusluokitus_fi  
	,[Uusi Koulutusala, taso 3] = d4b.koulutusalataso3_fi  
    ,[Uusi Koulutusala, taso 2] = d4b.koulutusalataso2_fi 
	,[Uusi Koulutusala, taso 1] = d4b.koulutusalataso1_fi 
	,[Uusi Osaamisala] = d20b.selite_fi
    ,[Uusi Suorituksen tyyppi] = d17b.selite_fi
--	,[Uusi Rahoitusmuoto] = d19.selite_fi
--	,[Uusi Erityisopetus] = d13b.erityisopetus_nimi_fi


-- UUDET ORGANISAATIOMUUTTUJAT
	,[Uusi Oppilaitos] = d5b.organisaatio_fi
	,[Uusi Koulutuksen järjestäjä] = d11b.organisaatio_fi
--	,[Uusi Toimipiste] = d21b.organisaatio_fi
	,[Uusi Oppilaitoksen kunta] = d10b.kunta_fi
	,[Uusi Oppilaitoksen maakunta] = d10b.maakunta_fi
	,[Uusi Oppilaitoksen AVI] = d10b.avi_fi
	,[Uusi Oppilaitoksen ELY] = d10b.ely_fi 
	,[Uusi Koul. järjestäjän kunta] = d12b.kunta_fi 
	,[Uusi Koul. järjestäjän maakunta] = d12b.maakunta_fi 
	,[Uusi Koul. järjestäjän ELY] = d12b.ely_fi 
	,[Uusi Koul. järjestäjän AVI] = d12b.avi_fi  
-- KOODIT
	,[Koodit Koulutuksen järjestäjä] = d11a.organisaatio_koodi 
--	,[Koodit Hankintakoulutuksen järjestäjä] = d27a.organisaatio_koodi 
	,[Koodit Oppilaitos] = d5a.organisaatio_koodi 
	,[Koodit Tutkinto] = d4a.koulutusluokitus_koodi
	,[Koodit Osaamisala] = d20a.koodi
	--,[Koodit Kustannusryhmä] = d18.koodi

	,[Koodit Uusi Koulutuksen järjestäjä] = d11b.organisaatio_koodi 
--	,[Koodit Uusi Hankintakoulutuksen järjestäjä] = d27b.organisaatio_koodi 
	,[Koodit Uusi Oppilaitos] = d5b.organisaatio_koodi 
	,[Koodit Uusi Tutkinto] = d4b.koulutusluokitus_koodi
	,[Koodit Uusi Osaamisala] = d20b.koodi
	--,[Koodit Uusi Kustannusryhmä] = d18.koodi

-- JÄRJESTYSMUUTTUJAT
	  ,jarj_kohortti = CAST(CONCAT(RIGHT(aloitusvuosi, 2), LEFT(aloitusvuosipuolisko, 1)) AS int)
      ,jarj_A_sukupuolivaltaisuus = [A_jarj_sukupuolivaltaisuus]
      ,jarj_B_sukupuolivaltaisuus = [B_jarj_sukupuolivaltaisuus]
	  ,[jarj_tarkasteluajankohta] = sarja + 1 
      ,[jarj_peruskoulu_keskiarvo_kategoria]
      ,[jarj_peruskoulu_keskiarvo_lukuaineet_kategoria]
      ,[jarj_keskiarvo_kvintiili]
      ,[jarj_keskiarvo_lukuaineet_kvintiili]
	  ,[jarj_a_lopputulema]
	  ,[jarj_b_lopputulema]
	  ,[jarj_a_tilanne]
	--  ,[jarj_b_tilanne]
	--,d14.kuukausi AS jarj_tilastokuukausi
	,jarj_aidinkieli = d2.jarjestys_kieliryhma1
	,d1.jarjestys_sukupuoli_koodi AS jarj_sukupuoli
	,d3.jarjestys_ikaryhma3 AS jarj_ikaryhma
	,d3.ika_avain AS jarj_ika 
	,jarj_kansalaisuus = case when d21.maatjavaltiot2_fi = 'Suomi' then 1 else 2 end
	,d4a.jarjestys_koulutusalataso1_koodi AS jarj_A_koulutusala_taso1
	,d4a.jarjestys_koulutusalataso2_koodi AS jarj_A_koulutusala_taso2
	,d4a.jarjestys_koulutusalataso3_koodi AS jarj_A_koulutusala_taso3
	,d12a.jarjestys_maakunta_koodi AS jarj_A_koul_jarj_A_maakunta
	,d12a.jarjestys_avi_koodi AS jarj_A_koul_jarj_A_avi
	,d12a.jarjestys_ely_koodi AS jarj_A_koul_jarj_A_ely
	,d10a.jarjestys_maakunta_koodi AS jarj_A_oppilaitoksen_maakunta
	,d10a.jarjestys_ely_koodi AS jarj_A_oppilaitoksen_ely
	,d10a.jarjestys_avi_koodi AS jarj_A_oppilaitoksen_avi
	,d13a.jarjestys_erityisopetus_koodi AS jarj_A_erityisopetus


	,d4b.jarjestys_koulutusalataso1_koodi AS jarj_B_koulutusala_taso1
	,d4b.jarjestys_koulutusalataso2_koodi AS jarj_B_koulutusala_taso2
	,d4b.jarjestys_koulutusalataso3_koodi AS jarj_B_koulutusala_taso3
	,d12b.jarjestys_maakunta_koodi AS jarj_B_koul_jarj_B_maakunta
	,d12b.jarjestys_avi_koodi AS jarj_B_koul_jarj_B_avi
	,d12b.jarjestys_ely_koodi AS jarj_B_koul_jarj_B_ely
	,d10b.jarjestys_maakunta_koodi AS jarj_B_oppilaitoksen_maakunta
	,d10b.jarjestys_ely_koodi AS jarj_B_oppilaitoksen_ely
	,d10b.jarjestys_avi_koodi AS jarj_B_oppilaitoksen_avi
	,d13b.jarjestys_erityisopetus_koodi AS jarj_B_erityisopetus
	,jarj_priorisoitu_tilanne = priorisoitu_tilanne_koodi
	,jarj_vaihtanut_jarjestajaa
	--,CASE 
	--	WHEN d18.koodi = 'muu' THEN '90'
	--	WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN '91' 
	--	WHEN d4.koulutusluokitus_koodi = '999900' THEN '92'
	--	ELSE d4.jarjestys_tutkintotyypin_ryhma_koodi
	--END AS jarj_tutkintotyypin_ryhma
	--,CASE 
	--	WHEN d18.koodi = 'muu' THEN '90'
	--	WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN '91' 
	--	WHEN d4.koulutusluokitus_koodi = '999900' THEN '92'
	--	ELSE d4.jarjestys_tutkintotyyppi_koodi
	--END AS jarj_tutkintotyyppi



FROM  dw.f_koski_amm_opintojen_kulku f 
LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id

-- ALKUPERÄISET
LEFT JOIN dw.d_koulutusluokitus d4a ON d4a.id = f.da_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d5a ON d5a.id = f.da_organisaatioluokitus_oppilaitos_id
--LEFT JOIN dw.d_kytkin d6 ON d6.id = f.d_kytkin_oppisopimuskoulutus_id
--LEFT JOIN dw.d_kytkin d7 ON d7.id = f.d_kytkin_vankilaopetus_id
--LEFT JOIN dw.d_kytkin d8 ON d8.id = f.d_kytkin_henkilostokoulutus_id
--LEFT JOIN dw.d_kytkin d9 ON d9.id = f.d_kytkin_tyovoimakoulutus_id 
LEFT JOIN dw.d_alueluokitus d10a ON d10a.kunta_koodi = d5a.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d11a ON d11a.id = f.da_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d12a ON d12a.kunta_koodi = d11a.kunta_koodi
LEFT JOIN dw.d_erityisopetus d13a ON d13a.id = f.d_erityisopetus_id
LEFT JOIN dw.d_suorituksen_tyyppi d17a ON d17a.id = f.da_suorituksen_tyyppi_id

LEFT JOIN dw.d_osaamisala d20a ON d20a.id = f.da_osaamisala_id 
--LEFT JOIN dw.d_organisaatioluokitus d21a ON d21a.id = f.da_organisaatioluokitus_toimipiste_id

-- UUDET 
LEFT JOIN dw.d_koulutusluokitus d4b ON d4b.id = f.db_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d5b ON d5b.id = f.db_organisaatioluokitus_oppilaitos_id
--LEFT JOIN dw.d_kytkin d6 ON d6.id = f.d_kytkin_oppisopimuskoulutus_id
--LEFT JOIN dw.d_kytkin d7 ON d7.id = f.d_kytkin_vankilaopetus_id
--LEFT JOIN dw.d_kytkin d8 ON d8.id = f.d_kytkin_henkilostokoulutus_id
--LEFT JOIN dw.d_kytkin d9 ON d9.id = f.d_kytkin_tyovoimakoulutus_id 
LEFT JOIN dw.d_alueluokitus d10b ON d10b.kunta_koodi = d5b.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d11b ON d11b.id = f.db_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d12b ON d12b.kunta_koodi = d11b.kunta_koodi
LEFT JOIN dw.d_erityisopetus d13b ON d13b.id = f.d_erityisopetus_id
LEFT JOIN dw.d_suorituksen_tyyppi d17b ON d17b.id = f.db_suorituksen_tyyppi_id

LEFT JOIN dw.d_osaamisala d20b ON d20b.id = f.db_osaamisala_id
LEFT JOIN dw.d_maatjavaltiot2 d21 ON d21.id = d_maatjavaltiot2_kansalaisuus_id
























GO


USE ANTERO