USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_opiskelijavuodet_uudet_kertoimet]    Script Date: 15.9.2020 9:05:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [dw].[v_amos_opiskelijavuodet_uudet_kertoimet] AS

SELECT --TOP 100   
	 [Tilastovuosi] = f.tilastovuosi
	,[Tilastokuukausi] = d14.kuukausi_fi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[�idinkieli] = d2.kieli_fi
	,[Ik�] = d3.ika_fi 
	,[Ik�ryhm�] = d3.ikaryhma3_fi
	,[Hyv�ksytyt/hyl�tyt opiskelijavuodet] = d22.selite_fi 

	,[Tutkintotyypin ryhm�] = 
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
	,[Kustannusryhm�] = d18.selite_fi 
	,[Rahoitusmuoto] = d19.selite_fi
	,[Erityisopetus] = d13.erityisopetus_nimi_fi
	,[Majoitus] = d15.majoitus_nimi_fi
	,[Oppisopimuskoulutus] = 
		case d6.kytkin_fi 
			when 'Kyll�' then 'Oppisopimuskoulutus' 
			when 'Ei' then 'Ei oppisopimuskoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Vankilaopetus] = 
		case d7.kytkin_fi 
			when 'Kyll�' then 'Vankilaopetus' 
			when 'Ei' then 'Ei vankilaopetus' 
			else 'Tieto puuttuu' 
		end
	,[Henkil�stokoulutus] =	
		case d8.kytkin_fi 
			when 'Kyll�' then 'Henkil�st�koulutus' 
			when 'Ei' then 'Ei henkil�st�koulutus' 
			else 'Tieto puuttuu' 
		end
	,[Ty�voimakoulutus] = 
		case d9.kytkin_fi 
			when 'Kyll�' then 'Ty�voimakoulutus' 
			when 'Ei' then 'Ei ty�voimakoulutus' 
			else 'Tieto puuttuu' 
		end
	,[Hankintakoulutus] = d26.kytkin_fi

	,[Hankintakoulutuksen j�rjest�j�] = d27.organisaatio_fi
	,[Oppilaitos] = d5.organisaatio_fi
	,[Koulutuksen j�rjest�j�] = d11.organisaatio_fi
	,[Toimipiste] = d21.organisaatio_fi
	,[Oppilaitoksen kunta] = d10.kunta_fi
	,[Oppilaitoksen maakunta] = d10.maakunta_fi
	,[Oppilaitoksen AVI] = d10.avi_fi
	,[Oppilaitoksen ELY] = d10.ely_fi 
	,[Koul. j�rjest�j�n kunta] = d12.kunta_fi 
	,[Koul. j�rjest�j�n maakunta] = d12.maakunta_fi 
	,[Koul. j�rjest�j�n ELY] = d12.ely_fi 
	,[Koul. j�rjest�j�n AVI] = d12.avi_fi  

	,[Luvaton koulutus] = d23.selite_fi
	,[Luvaton majoitus] = d24.selite_fi
	,[Luvaton korotustekij�] = d25.selite_fi
	,[sisaopp_ylittyy] = d28.jarjestys_kytkin_koodi
	,[erityistuki_ylittyy] = d29.jarjestys_kytkin_koodi

	,[opiskelijavuodet_painottamaton]
    ,[opiskelijavuodet_painotettu_yhteensa]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
    ,[opiskelijavuodet_painotettu_muu]
    ,[opiskelijavuodet_painotettu_erityistuki]
	,[opiskelijavuodet_painotettu_erityistuki_hyv]
    ,[opiskelijavuodet_painotettu_majoitus]
	,[opiskelijavuodet_painotettu_majoitus_hyv]
    ,[opiskelijavuodet_painotettu_henkilostokoulutus]
    ,[opiskelijavuodet_painotettu_tyovoimakoulutus]
    ,[opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_hylatyt]

	--Koodit
	,[Koodit Koulutuksen j�rjest�j�] = d11.organisaatio_koodi 
	,[Koodit Hankintakoulutuksen j�rjest�j�] = d27.organisaatio_koodi 
	,[Koodit Oppilaitos] = d5.organisaatio_koodi 
	,[Koodit Tutkinto] = d4.koulutusluokitus_koodi
	,[Koodit Osaamisala] = d20.koodi
	,[Koodit Kustannusryhm�] = d18.koodi

	--J�rjestykset
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
		WHEN d18.koodi = 'muu' THEN '90'
		WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN '91' 
		WHEN d4.koulutusluokitus_koodi = '999900' THEN '92'
		ELSE d4.jarjestys_tutkintotyypin_ryhma_koodi
	END AS jarj_tutkintotyypin_ryhma
	,CASE 
		WHEN d18.koodi = 'muu' THEN '90'
		WHEN d4.koulutusluokitus_fi like '%VALMA%' OR d4.koulutusluokitus_fi like '%TELMA%' THEN '91' 
		WHEN d4.koulutusluokitus_koodi = '999900' THEN '92'
		ELSE d4.jarjestys_tutkintotyyppi_koodi
	END AS jarj_tutkintotyyppi
	,jarj_hylkaamisperuste = d22.jarjestys
	,jarj_luvaton_koulutus = d23.jarjestys
	,jarj_luvaton_majoitus = d24.jarjestys
	,jarj_luvaton_korotustekija = d25.jarjestys

	--Ruotsi
	--,d_suorituksen_tyyppi.selite_sv AS [Typ av utf�randen]
	--,d_suorituksen_tyyppi.selite_en AS [Type of accomplishment]

    
	--, d_koulutusluokitus.koulutusluokitus_sv AS Examen
	--, d_koulutusluokitus.koulutusluokitus_en AS [Degree/Qualification]
   
	--, d_koulutusluokitus.koulutusalataso1_sv AS [Utbildningsomr�de, niv� 1]
 --   ,d_koulutusluokitus.koulutusalataso1_en AS [Field of education, tier 1]
	
	--, d_koulutusluokitus.koulutusalataso2_sv AS [Utbildningsomr�de, niv� 2]
	--, d_koulutusluokitus.koulutusalataso2_en AS [Field of education, tier 2]
	
	--, d_koulutusluokitus.koulutusalataso3_sv AS [Utbildningsomr�de, niv� 3]
	--, d_koulutusluokitus.koulutusalataso3_en AS [Field of education, tier 3]
   
 --   d_kytkin_oppisopimuskoulutus.kytkin_sv AS L�roavtalsutbildning
	--, d_kytkin_oppisopimuskoulutus.kytkin_en AS [Apprenticeship training]
	
 --   d_erityisopetus.erityisopetus_nimi_sv AS Specialundervisning
	--, d_erityisopetus.erityisopetus_nimi_en AS [Special needs education]
	
	--, d_majoitus.majoitus_nimi_sv AS Inkvartering
	--, d_majoitus.majoitus_nimi_en AS Accommodation
	
 --   d_kytkin_vankilaopetus.kytkin_sv AS F�ngelseundervisning
	--, d_kytkin_vankilaopetus.kytkin_en AS [Prison education]
	
 --   d_kytkin_henkilostokoulutus.kytkin_sv AS Personalutbildning
	--, d_kytkin_henkilostokoulutus.kytkin_en AS [Personnel training]
	
 --   d_kytkin_tyovoimakoulutus.kytkin_sv AS Arbetskraftsutbildning
	--, d_kytkin_tyovoimakoulutus.kytkin_en AS [Labour market training]
	
	
 --   ,d_organisaatioluokitus_oppilaitos.organisaatio_sv AS L�roanstalt
	--, d_organisaatioluokitus_oppilaitos.organisaatio_en AS [Educational institution]
	
 --   ,d_alueluokitus_oppilaitos.kunta_sv AS [L�roanstaltens kommun]
	--, d_alueluokitus_oppilaitos.kunta_en AS [Municipality of the institution]
	 
 --   d_alueluokitus_oppilaitos.maakunta_sv AS [L�roanstaltens landskap]
	--, d_alueluokitus_oppilaitos.maakunta_en AS [Region of the institution], 
   
	
	--, d_alueluokitus_oppilaitos.avi_sv AS [L�roanstaltens RFV-omr�de], 
 --   d_alueluokitus_oppilaitos.avi_en AS [AVI area of the institution]
	
 --   d_alueluokitus_oppilaitos.ely_sv AS [L�roanstaltens NMT-omr�de]
	--, d_alueluokitus_oppilaitos.ely_en AS [ELY area of the institution]
	
	--, d_organisaatioluokitus_jarj.organisaatio_sv AS Utbildningsanordnare
	--, d_organisaatioluokitus_jarj.organisaatio_en AS [Education provider 
    
	--, d_alueluokitus_jarj.kunta_sv AS [Utbildningsanordnarens kommun]
	--, d_alueluokitus_jarj.kunta_en AS [Municipality of the education provider],

	--, d_alueluokitus_jarj.maakunta_sv AS [Utbildningsanordnarens landskap]
	--, d_alueluokitus_jarj.maakunta_en AS [Region of the education provider]
   
	--, d_alueluokitus_jarj.avi_sv AS [Utbildningsanordnarens RFV-omr�de], 
 --   d_alueluokitus_jarj.avi_en AS [AVI area of the education provider]
	
 --   d_alueluokitus_jarj.ely_sv AS [Utbildningsanordnarens NMT-omr�de]
	--, d_alueluokitus_jarj.ely_en AS [ELY area of the education provider]
	
	--, d_ika.ika_sv AS �lder
	--, d_ika.ika_en AS Age
	
	--, d_ika.ikaryhma3_sv AS �ldersgrupp
	--, d_ika.ikaryhma3_en AS [Age group], 
    
	
	--, d_kieli.kieli_sv AS Modersm�l
	--, d_kieli.kieli_en AS [Mother tongue]
	
 --   d_sukupuoli.sukupuoli_sv AS K�n
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
	--,f.tilastovuosi AS Statistik�r
	--,f.tilastovuosi AS [Statistical year]
	--, d_kalenteri.kuukausi_sv AS Statistikm�nad
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

FROM  dw.f_amos_opiskelijavuodet_painotetut_uusi f 
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
LEFT JOIN dw.d_amos_luvaton_koulutus d23 ON d23.id = f.d_amos_luvaton_koulutus_id
LEFT JOIN dw.d_amos_luvaton_majoitus d24 ON d24.id = f.d_amos_luvaton_majoitus_id
LEFT JOIN dw.d_amos_luvaton_korotustekija d25 ON d25.id = f.d_amos_luvaton_korotustekija_id
LEFT JOIN dw.d_kytkin d26 ON d26.id = f.d_kytkin_hankintakoulutus_id
LEFT JOIN dw.d_organisaatioluokitus d27 ON d27.id = f.d_organisaatioluokitus_jarj_pihvi_id
LEFT JOIN dw.d_kytkin d28 ON d28.id = f.d_kytkin_sisaopp_ov_ylittyy_id
LEFT JOIN dw.d_kytkin d29 ON d29.id = f.d_kytkin_erityistuen_ov_ylittyy_id

WHERE 1=1 --(d14.paivays <= dateadd(month,-1,getdate()))
AND ([opiskelijavuodet_painottamaton] > 0.0 OR [opiskelijavuodet_hylatyt] > 0.0)











GO


