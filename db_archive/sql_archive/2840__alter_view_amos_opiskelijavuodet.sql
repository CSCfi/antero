USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_opiskelijavuodet]    Script Date: 10.2.2020 17:55:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER VIEW [dw].[v_amos_opiskelijavuodet] AS

SELECT        
	 [Tilastovuosi] = f.tilastovuosi
	,[Tilastokuukausi] = d14.kuukausi_fi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Äidinkieli] = d2.kieli_fi
	,[Ikä] = d3.ika_fi 
	,[Ikäryhmä] = d3.ikaryhma3_fi
	,[Hyväksytyt/hylätyt opiskelijavuodet] = d22.selite_fi 

	,[Tutkintotyypin ryhmä] = 
		CASE 
			WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN 'Valmentava koulutus' 
			WHEN d4.koulutusluokitus_koodi = '999900' THEN 'Koulutusaste tuntematon'
			WHEN d18.koodi = 'muu' /* OR f.d_koulutusluokitus_id = '-1' */  THEN 'Muu ammatillinen koulutus'
			ELSE d4.tutkintotyypin_ryhma_fi
		END  
   
	,[Tutkintotyyppi] = 
		CASE 
			WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN 'Valmentava koulutus' 
			WHEN d4.koulutusluokitus_koodi = '999900' THEN 'Koulutusaste tuntematon'
			WHEN d18.koodi = 'muu' /* OR f.d_koulutusluokitus_id = '-1'*/ THEN 'Muu ammatillinen koulutus'
			ELSE d4.tutkintotyyppi_fi
		END
	
	,[Tutkinto] = d4.koulutusluokitus_fi  
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi  
    ,[Koulutusala, taso 2] = d4.koulutusalataso2_fi 
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi 
	,[Osaamisala] = d20.selite_fi
    ,[Osa-aikaisuus] = d16.kytkin_fi
    ,[Suorituksen tyyppi] = d17.selite_fi
	,[Kustannusryhmä] = d18.selite_fi 
	,[Rahoitusmuoto] = d19.selite_fi
	,[Erityisopetus] = d13.erityisopetus_nimi_fi
	,[Majoitus] = d15.majoitus_nimi_fi
	,[Oppisopimuskoulutus] = 
		case d6.kytkin_fi 
			when 'Kyllä' then 'Oppisopimuskoulutus' 
			when 'Ei' then 'Ei oppisopimuskoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Vankilaopetus] = 
		case d7.kytkin_fi 
			when 'Kyllä' then 'Vankilaopetus' 
			when 'Ei' then 'Ei vankilaopetus' 
			else 'Tieto puuttuu' 
		end
	,[Henkilöstokoulutus] =	
		case d8.kytkin_fi 
			when 'Kyllä' then 'Henkilöstökoulutus' 
			when 'Ei' then 'Ei henkilöstökoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Työvoimakoulutus] = 
		case d9.kytkin_fi 
			when 'Kyllä' then 'Työvoimakoulutus' 
			when 'Ei' then 'Ei työvoimakoulutus' 
			else 'Tieto puuttuu' 
		end

	,[Oppilaitos] = d5.organisaatio_fi
	,[Koulutuksen järjestäjä] = d11.organisaatio_fi
	,[Toimipiste] = d21.organisaatio_fi
	,[Oppilaitoksen kunta] = d10.kunta_fi
	,[Oppilaitoksen maakunta] = d10.maakunta_fi
	,[Oppilaitoksen AVI] = d10.avi_fi
	,[Oppilaitoksen ELY] = d10.ely_fi 
	,[Koul. järjestäjän kunta] = d12.kunta_fi 
	,[Koul. järjestäjän maakunta] = d12.maakunta_fi 
	,[Koul. järjestäjän ELY] = d12.ely_fi 
	,[Koul. järjestäjän AVI] = d12.avi_fi  

	,[opiskelijavuodet_painottamaton]
    ,[opiskelijavuodet_painotettu_yhteensa]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
    ,[opiskelijavuodet_painotettu_muu]
    ,[opiskelijavuodet_painotettu_erityistuki]
    ,[opiskelijavuodet_painotettu_majoitus]
    ,[opiskelijavuodet_painotettu_henkilostokoulutus]
    ,[opiskelijavuodet_painotettu_tyovoimakoulutus]
    ,[opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_hylatyt]

	--Koodit
	,[Koodit Koulutuksen järjestäjä] = d11.organisaatio_koodi 
	,[Koodit Oppilaitos] = d5.organisaatio_koodi 
	,[Koodit Tutkinto] = d4.koulutusluokitus_koodi
	,[Koodit Osaamisala] = d20.koodi
	,[Koodit Kustannusryhmä] = d18.koodi

	--Järjestykset
	,d18.jarjestys_koodi AS jarj_kustannusryhma
	,d19.jarjestys_koodi AS jarj_rahoitusmuoto
	,d14.kuukausi AS jarj_tilastokuukausi
	,d1.jarjestys_sukupuoli_koodi AS jarj_sukupuoli
	,d3.jarjestys_ikaryhma3 AS jarj_ikaryhma
	,d3.ika_avain AS jarj_ika 
	,d4.jarjestys_koulutusalataso1_koodi AS jarj_koulutusala_taso1
	,d4.jarjestys_koulutusalataso2_koodi AS jarj_koulutusala_taso2
	,d4.jarjestys_koulutusalataso3_koodi AS jarj_koulutusala_taso3
	,d12.jarjestys_maakunta_koodi AS jarj_koul_jarj_maakunta
	,d12.jarjestys_avi_koodi AS jarj_koul_jarj_avi
	,d12.jarjestys_ely_koodi AS jarj_koul_jarj_ely
	,d10.jarjestys_maakunta_koodi AS jarj_oppilaitoksen_maakunta
	,d10.jarjestys_ely_koodi AS jarj_oppilaitoksen_ely
	,d10.jarjestys_avi_koodi AS jarj_oppilaitoksen_avi
	,d13.jarjestys_erityisopetus_koodi AS jarj_erityisopetus
	,CASE 
		WHEN [opiskelijavuodet_painotettu_muu] > 0 THEN '90'
		WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN '91' 
		WHEN d4.koulutusluokitus_koodi = '999900' THEN '92'
		ELSE d4.jarjestys_tutkintotyypin_ryhma_koodi
	END AS jarj_tutkintotyypin_ryhma
	,CASE 
		WHEN [opiskelijavuodet_painotettu_muu] > 0 THEN '90'
		WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN '91' 
		WHEN d4.koulutusluokitus_koodi = '999900' THEN '92'
		ELSE d4.jarjestys_tutkintotyyppi_koodi
	END AS jarj_tutkintotyyppi
	,jarj_hylkaamisperuste = d22.jarjestys

	--Ruotsi
	--,d_suorituksen_tyyppi.selite_sv AS [Typ av utföranden]
	--,d_suorituksen_tyyppi.selite_en AS [Type of accomplishment]

    
	--, d_koulutusluokitus.koulutusluokitus_sv AS Examen
	--, d_koulutusluokitus.koulutusluokitus_en AS [Degree/Qualification]
   
	--, d_koulutusluokitus.koulutusalataso1_sv AS [Utbildningsområde, nivå 1]
 --   ,d_koulutusluokitus.koulutusalataso1_en AS [Field of education, tier 1]
	
	--, d_koulutusluokitus.koulutusalataso2_sv AS [Utbildningsområde, nivå 2]
	--, d_koulutusluokitus.koulutusalataso2_en AS [Field of education, tier 2]
	
	--, d_koulutusluokitus.koulutusalataso3_sv AS [Utbildningsområde, nivå 3]
	--, d_koulutusluokitus.koulutusalataso3_en AS [Field of education, tier 3]
   
 --   d_kytkin_oppisopimuskoulutus.kytkin_sv AS Läroavtalsutbildning
	--, d_kytkin_oppisopimuskoulutus.kytkin_en AS [Apprenticeship training]
	
 --   d_erityisopetus.erityisopetus_nimi_sv AS Specialundervisning
	--, d_erityisopetus.erityisopetus_nimi_en AS [Special needs education]
	
	--, d_majoitus.majoitus_nimi_sv AS Inkvartering
	--, d_majoitus.majoitus_nimi_en AS Accommodation
	
 --   d_kytkin_vankilaopetus.kytkin_sv AS Fängelseundervisning
	--, d_kytkin_vankilaopetus.kytkin_en AS [Prison education]
	
 --   d_kytkin_henkilostokoulutus.kytkin_sv AS Personalutbildning
	--, d_kytkin_henkilostokoulutus.kytkin_en AS [Personnel training]
	
 --   d_kytkin_tyovoimakoulutus.kytkin_sv AS Arbetskraftsutbildning
	--, d_kytkin_tyovoimakoulutus.kytkin_en AS [Labour market training]
	
	
 --   ,d_organisaatioluokitus_oppilaitos.organisaatio_sv AS Läroanstalt
	--, d_organisaatioluokitus_oppilaitos.organisaatio_en AS [Educational institution]
	
 --   ,d_alueluokitus_oppilaitos.kunta_sv AS [Läroanstaltens kommun]
	--, d_alueluokitus_oppilaitos.kunta_en AS [Municipality of the institution]
	 
 --   d_alueluokitus_oppilaitos.maakunta_sv AS [Läroanstaltens landskap]
	--, d_alueluokitus_oppilaitos.maakunta_en AS [Region of the institution], 
   
	
	--, d_alueluokitus_oppilaitos.avi_sv AS [Läroanstaltens RFV-område], 
 --   d_alueluokitus_oppilaitos.avi_en AS [AVI area of the institution]
	
 --   d_alueluokitus_oppilaitos.ely_sv AS [Läroanstaltens NMT-område]
	--, d_alueluokitus_oppilaitos.ely_en AS [ELY area of the institution]
	
	--, d_organisaatioluokitus_jarj.organisaatio_sv AS Utbildningsanordnare
	--, d_organisaatioluokitus_jarj.organisaatio_en AS [Education provider 
    
	--, d_alueluokitus_jarj.kunta_sv AS [Utbildningsanordnarens kommun]
	--, d_alueluokitus_jarj.kunta_en AS [Municipality of the education provider],

	--, d_alueluokitus_jarj.maakunta_sv AS [Utbildningsanordnarens landskap]
	--, d_alueluokitus_jarj.maakunta_en AS [Region of the education provider]
   
	--, d_alueluokitus_jarj.avi_sv AS [Utbildningsanordnarens RFV-område], 
 --   d_alueluokitus_jarj.avi_en AS [AVI area of the education provider]
	
 --   d_alueluokitus_jarj.ely_sv AS [Utbildningsanordnarens NMT-område]
	--, d_alueluokitus_jarj.ely_en AS [ELY area of the education provider]
	
	--, d_ika.ika_sv AS Ålder
	--, d_ika.ika_en AS Age
	
	--, d_ika.ikaryhma3_sv AS Åldersgrupp
	--, d_ika.ikaryhma3_en AS [Age group], 
    
	
	--, d_kieli.kieli_sv AS Modersmål
	--, d_kieli.kieli_en AS [Mother tongue]
	
 --   d_sukupuoli.sukupuoli_sv AS Kön
	--, d_sukupuoli.sukupuoli_en AS Gender
	

	--,(CASE 
	--	WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Utbildning som inte leder till examen' 
	--	ELSE d_koulutusluokitus.tutkintotyyppi_sv
	--END) AS [Typ av examen]
	--,(CASE 
	--	WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Education not leading to a degree' 
	--	ELSE d_koulutusluokitus.tutkintotyyppi_en 
	--END) AS [Qualification type]

	--,d_kytkin.kytkin_sv AS Deltid
	--,d_kytkin.kytkin_en AS [Part Time]
	--,f.tilastovuosi AS Statistikår
	--,f.tilastovuosi AS [Statistical year]
	--, d_kalenteri.kuukausi_sv AS Statistikmånad
	--, d_kalenteri.kuukausi_en AS [Statistical month]
	--,d_kustannusryhma.selite_sv AS Bekostnadsgrupp
	--,d_kustannusryhma.selite_en AS [Cost group]
	-- ,(CASE 
	--	WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Utbildning som inte leder till examen' 
	--	WHEN d_koulutusluokitus.tutkintotyyppi_koodi in (19,20) THEN 'Yrkes- och specialyrkesexamina' 
	--	ELSE d_koulutusluokitus.tutkintotyyppi_sv 
	--END) AS [Kategori av typ av examen]
	--,(CASE 
	--	WHEN d_koulutusluokitus.koulutusluokitus_fi like '%VALMA%' OR d_koulutusluokitus.koulutusluokitus_fi like '%TELMA%' THEN 'Education not leading to a degree' 
	--	WHEN d_koulutusluokitus.tutkintotyyppi_koodi in (19,20) THEN 'Further and specialist vocational qualifications' 
	--	ELSE d_koulutusluokitus.tutkintotyyppi_en
	--END) AS [Category of qualification type]

FROM  dw.f_amos_opiskelijavuodet_painotetut f 
LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_kytkin d6 ON d6.id = f.d_kytkin_oppisopimuskoulutus_id
LEFT JOIN dw.d_kytkin d7 ON d7.id = f.d_kytkin_vankilaopetus_id
LEFT JOIN dw.d_kytkin d8 ON d8.id = f.d_kytkin_henkilostokoulutus_id
LEFT JOIN dw.d_kytkin d9 ON d9.id = f.d_kytkin_tyovoimakoulutus_id 
LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d12 ON d12.kunta_koodi = d11.kunta_koodi
LEFT JOIN dw.d_erityisopetus d13 ON d13.id = f.d_erityisopetus_id
LEFT JOIN dw.d_kalenteri d14 ON d14.id = f.d_kalenteri_tilastokuukausi_id
LEFT JOIN dw.d_majoitus d15 ON d15.id = f.d_majoitus_id
LEFT JOIN dw.d_kytkin d16 ON d16.id = f.d_osa_aikaisuus_id
LEFT JOIN dw.d_suorituksen_tyyppi d17 ON d17.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d18 ON d18.id = f.d_kustannusryhma_id
LEFT JOIN dw.d_opintojenrahoitus d19 ON d19.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_osaamisala d20 ON d20.id = f.d_osaamisala_id 
LEFT JOIN dw.d_organisaatioluokitus d21 ON d21.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste d22 ON d22.id = f.d_amos_spl_opiskelijavuodet_hylkaamisperuste_id

WHERE 1=1--(d14.paivays <= dateadd(month,-1,getdate()))
AND ([opiskelijavuodet_painottamaton] > 0.0 OR [opiskelijavuodet_hylatyt] > 0.0)


