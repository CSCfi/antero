USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_generoi_hyvaksytty_korotustekija]    Script Date: 21.8.2020 10:55:39 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_generoi_hyvaksytty_korotustekija]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 21.8.2020 10:55:39 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 21.8.2020 10:55:39 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija]    Script Date: 21.8.2020 10:55:39 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]    Script Date: 21.8.2020 10:55:39 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet]    Script Date: 21.8.2020 10:55:39 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]    Script Date: 21.8.2020 10:55:39 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_opiskelijavuodet_koko]    Script Date: 21.8.2020 10:55:39 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_amos_opiskelijavuodet_koko]
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 21.8.2020 10:55:39 ******/
DROP TABLE IF EXISTS [dw].[f_amos_tutkinnot_ja_tutkinnonosat]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet]    Script Date: 21.8.2020 10:55:39 ******/
DROP TABLE IF EXISTS [dw].[f_amos_opiskelijavuodet]
GO
/****** Object:  View [dw].[v_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 21.8.2020 10:55:39 ******/
DROP VIEW IF EXISTS [dw].[v_amos_tutkinnot_ja_tutkinnonosat]
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 21.8.2020 10:55:39 ******/
DROP TABLE IF EXISTS [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]
GO
/****** Object:  View [dw].[v_amos_opiskelijavuodet]    Script Date: 21.8.2020 10:55:39 ******/
DROP VIEW IF EXISTS [dw].[v_amos_opiskelijavuodet]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut]    Script Date: 21.8.2020 10:55:39 ******/
DROP TABLE IF EXISTS [dw].[f_amos_opiskelijavuodet_painotetut]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijavuodet_painotetut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_opiskelijavuodet_painotetut](
	[tilastovuosi] [int] NULL,
	[d_kalenteri_tilastokuukausi_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_osa_aikaisuus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_majoitus_id] [int] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_kytkin_henkilostokoulutus_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_jarj_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_hist_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_majoitus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[d_kytkin_sisaopp_ov_ylittyy_id] [int] NULL,
	[d_kytkin_erityistuen_ov_ylittyy_id] [int] NULL,
	[opiskelijavuodet_painottamaton] [float] NULL,
	[opiskelijavuodet_painotettu_yhteensa] [float] NULL,
	[opiskelijavuodet_painotettu_pt] [float] NULL,
	[opiskelijavuodet_painotettu_at_eat] [float] NULL,
	[opiskelijavuodet_painotettu_valma_telma] [float] NULL,
	[opiskelijavuodet_painotettu_opisk_valm_tukevat] [float] NULL,
	[opiskelijavuodet_painotettu_muu] [float] NULL,
	[opiskelijavuodet_painotettu_erityistuki] [float] NULL,
	[opiskelijavuodet_painotettu_erityistuki_hyv] [float] NULL,
	[opiskelijavuodet_painotettu_majoitus] [float] NULL,
	[opiskelijavuodet_painotettu_majoitus_hyv] [float] NULL,
	[opiskelijavuodet_painotettu_henkilostokoulutus] [float] NULL,
	[opiskelijavuodet_painotettu_tyovoimakoulutus] [float] NULL,
	[opiskelijavuodet_painotettu_vankilaopetus] [float] NULL,
	[opiskelijavuodet_hylatyt] [float] NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  View [dw].[v_amos_opiskelijavuodet]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_opiskelijavuodet]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dw].[v_amos_opiskelijavuodet] AS

SELECT --TOP 100   
	 [Tilastovuosi] = f.tilastovuosi
	,[Tilastokuukausi] = d14.kuukausi_fi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Äidinkieli] = d2.kieli_fi
	,[Ikä] = d3.ika_fi 
	,[Ikäryhmä] = d3.ikaryhma3_fi
	,[Hyväksytyt/hylätyt opiskelijavuodet] = d22.selite_fi 

	,[Tutkintotyypin ryhmä] = 
		CASE 
			WHEN d4.koulutusluokitus_fi like ''%VALMA%'' OR d4.koulutusluokitus_fi like ''%TELMA%'' THEN ''Valmentava koulutus'' 
			WHEN d4.koulutusluokitus_koodi = ''999900'' THEN ''Koulutusaste tuntematon''
			WHEN d18.koodi = ''muu'' /* OR f.d_koulutusluokitus_id = ''-1'' */  THEN ''Muu ammatillinen koulutus''
			ELSE d4.tutkintotyypin_ryhma_fi
		END  
   
	,[Tutkintotyyppi] = 
		CASE 
			WHEN d4.koulutusluokitus_fi like ''%VALMA%'' OR d4.koulutusluokitus_fi like ''%TELMA%'' THEN ''Valmentava koulutus'' 
			WHEN d4.koulutusluokitus_koodi = ''999900'' THEN ''Koulutusaste tuntematon''
			WHEN d18.koodi = ''muu'' /* OR f.d_koulutusluokitus_id = ''-1''*/ THEN ''Muu ammatillinen koulutus''
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
			when ''Kyllä'' then ''Oppisopimuskoulutus'' 
			when ''Ei'' then ''Ei oppisopimuskoulutus'' 
			else ''Tieto puuttuu'' 
		end
	,[Vankilaopetus] = 
		case d7.kytkin_fi 
			when ''Kyllä'' then ''Vankilaopetus'' 
			when ''Ei'' then ''Ei vankilaopetus'' 
			else ''Tieto puuttuu'' 
		end
	,[Henkilöstokoulutus] =	
		case d8.kytkin_fi 
			when ''Kyllä'' then ''Henkilöstökoulutus'' 
			when ''Ei'' then ''Ei henkilöstökoulutus'' 
			else ''Tieto puuttuu'' 
		end
	,[Työvoimakoulutus] = 
		case d9.kytkin_fi 
			when ''Kyllä'' then ''Työvoimakoulutus'' 
			when ''Ei'' then ''Ei työvoimakoulutus'' 
			else ''Tieto puuttuu'' 
		end
	,[Hankintakoulutus] = d26.kytkin_fi

	,[Hankintakoulutuksen järjestäjä] = d27.organisaatio_fi
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

	,[Luvaton koulutus] = d23.selite_fi
	,[Luvaton majoitus] = d24.selite_fi
	,[Luvaton korotustekijä] = d25.selite_fi
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
	,[Koodit Koulutuksen järjestäjä] = d11.organisaatio_koodi 
	,[Koodit Hankintakoulutuksen järjestäjä] = d27.organisaatio_koodi 
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
		WHEN d18.koodi = ''muu'' THEN ''90''
		WHEN d4.koulutusluokitus_fi like ''%VALMA%'' OR d4.koulutusluokitus_fi like ''%TELMA%'' THEN ''91'' 
		WHEN d4.koulutusluokitus_koodi = ''999900'' THEN ''92''
		ELSE d4.jarjestys_tutkintotyypin_ryhma_koodi
	END AS jarj_tutkintotyypin_ryhma
	,CASE 
		WHEN d18.koodi = ''muu'' THEN ''90''
		WHEN d4.koulutusluokitus_fi like ''%VALMA%'' OR d4.koulutusluokitus_fi like ''%TELMA%'' THEN ''91'' 
		WHEN d4.koulutusluokitus_koodi = ''999900'' THEN ''92''
		ELSE d4.jarjestys_tutkintotyyppi_koodi
	END AS jarj_tutkintotyyppi
	,jarj_hylkaamisperuste = d22.jarjestys
	,jarj_luvaton_koulutus = d23.jarjestys
	,jarj_luvaton_majoitus = d24.jarjestys
	,jarj_luvaton_korotustekija = d25.jarjestys

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
	--	WHEN d_koulutusluokitus.koulutusluokitus_fi like ''%VALMA%'' OR d_koulutusluokitus.koulutusluokitus_fi like ''%TELMA%'' THEN ''Utbildning som inte leder till examen'' 
	--	ELSE d_koulutusluokitus.tutkintotyyppi_sv
	--END) AS [Typ av examen]
	--,(CASE 
	--	WHEN d_koulutusluokitus.koulutusluokitus_fi like ''%VALMA%'' OR d_koulutusluokitus.koulutusluokitus_fi like ''%TELMA%'' THEN ''Education not leading to a degree'' 
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
	--	WHEN d_koulutusluokitus.koulutusluokitus_fi like ''%VALMA%'' OR d_koulutusluokitus.koulutusluokitus_fi like ''%TELMA%'' THEN ''Utbildning som inte leder till examen'' 
	--	WHEN d_koulutusluokitus.tutkintotyyppi_koodi in (19,20) THEN ''Yrkes- och specialyrkesexamina'' 
	--	ELSE d_koulutusluokitus.tutkintotyyppi_sv 
	--END) AS [Kategori av typ av examen]
	--,(CASE 
	--	WHEN d_koulutusluokitus.koulutusluokitus_fi like ''%VALMA%'' OR d_koulutusluokitus.koulutusluokitus_fi like ''%TELMA%'' THEN ''Education not leading to a degree'' 
	--	WHEN d_koulutusluokitus.tutkintotyyppi_koodi in (19,20) THEN ''Further and specialist vocational qualifications'' 
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
LEFT JOIN dw.d_amos_luvaton_koulutus d23 ON d23.id = f.d_amos_luvaton_koulutus_id
LEFT JOIN dw.d_amos_luvaton_majoitus d24 ON d24.id = f.d_amos_luvaton_majoitus_id
LEFT JOIN dw.d_amos_luvaton_korotustekija d25 ON d25.id = f.d_amos_luvaton_korotustekija_id
LEFT JOIN dw.d_kytkin d26 ON d26.id = f.d_kytkin_hankintakoulutus_id
LEFT JOIN dw.d_organisaatioluokitus d27 ON d27.id = f.d_organisaatioluokitus_jarj_pihvi_id
LEFT JOIN dw.d_kytkin d28 ON d28.id = f.d_kytkin_sisaopp_ov_ylittyy_id
LEFT JOIN dw.d_kytkin d29 ON d29.id = f.d_kytkin_erityistuen_ov_ylittyy_id

WHERE 1=1 --(d14.paivays <= dateadd(month,-1,getdate()))
AND ([opiskelijavuodet_painottamaton] > 0.0 OR [opiskelijavuodet_hylatyt] > 0.0)









' 
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut](
	[tilastovuosi] [int] NULL,
	[d_kalenteri_id] [int] NULL,
	[d_kalenteri_alkamispaiva_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_hist_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[painottamaton_tutkinnot] [int] NULL,
	[painottamaton_osatutkinnot] [int] NULL,
	[painottamaton_osaamispisteet] [float] NULL,
	[painottamaton_osaamispisteet_summa] [float] NULL,
	[painotettu_tutkinnot_pt_kr_pk] [float] NULL,
	[painotettu_tutkinnot_at_eat_kr_pk] [float] NULL,
	[painotettu_tutkinnot_erityistuki] [float] NULL,
	[painotettu_tutkinnot_erityistuki_hyv] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv] [float] NULL,
	[painotettu_tutkinnot_yht] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_yht] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  View [dw].[v_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_tutkinnot_ja_tutkinnonosat]'))
EXEC dbo.sp_executesql @statement = N'











CREATE VIEW [dw].[v_amos_tutkinnot_ja_tutkinnonosat] AS

SELECT 
	 [Tilastovuosi] = f.[tilastovuosi]
	,[Tilastokuukausi] = d6.kuukausi_fi

	,[Sukupuoli] = d11.sukupuoli_fi
	,[Äidinkieli] = d12.kieliryhma1_fi
	,[Ikäryhmä] = d13.ikaryhma3_fi
	,[Ikä] = d13.ika_fi

	,[Tutkinto] = d2.koulutusluokitus_fi
	,[Koulutusala, taso 1] = d2.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d2.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d2.koulutusalataso3_fi
	,[Tutkintotyyppi] = d2.tutkintotyyppi_fi
	
	,[Rahoitusmuoto] = d5.selite_fi
	,[Kustannusryhmä] = d7.selite_fi
	,[Oppisopimuskoulutus] = d4.selite_fi
	,[Erityisopetus] = d3.erityisopetus_nimi_fi
	,[Suorituksen tyyppi] = d8.selite_fi
	,[Hankintakoulutus] = d14.kytkin_fi

	,[Hankintakoulutuksen järjestäjä] = d15.organisaatio_fi

	,[Koulutuksen järjestäjä] = d1a.organisaatio_fi
	,[Koulutuksen järjestäjän AVI] = d10a.avi_fi
	,[Koulutuksen järjestäjän ELY] = d10a.ely_fi
	,[Koulutuksen järjestäjän maakunta] = d10a.maakunta_fi
	,[Koulutuksen järjestäjän kunta] = d10a.kunta_fi
	,[Oppilaitos] = d1b.organisaatio_fi
	,[Oppilaitoksen AVI] = d10b.avi_fi
	,[Oppilaitoksen ELY] = d10b.ely_fi
	,[Oppilaitoksen maakunta] = d10b.maakunta_fi
	,[Oppilaitoksen kunta] = d10b.kunta_fi
	,[Toimipiste] = d1c.organisaatio_fi
	,[Toimipisteen AVI] = d10c.avi_fi
	,[Toimipisteen ELY] = d10c.ely_fi
	,[Toimipisteen maakunta] = d10c.maakunta_fi
	,[Toimipisteen kunta] = d10c.kunta_fi

	,[Luvaton koulutus] = d23.selite_fi
	,[Luvaton korotustekijä] = d25.selite_fi

	,[Koodit Koulutuksen järjestäjä] = d1a.organisaatio_koodi
	,[Koodit Hankintakoulutuksen järjestäjä] = d15.organisaatio_koodi
	,[Koodit Tutkinto] = d2.koulutusluokitus_koodi
	,[Koodit Tutkintotyyppi] = d2.tutkintotyyppi_koodi

    ,[painottamaton_tutkinnot]
    ,[painottamaton_osatutkinnot]
	,[painottamaton_osaamispisteet]

	,[painotettu_tutkinnot_pt_kr_pk]
    ,[painotettu_tutkinnot_at_eat_kr_pk]
    ,[painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnot_erityistuki_hyv]
    ,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv]
    ,[painotettu_tutkinnot_yht]
    ,[painotettu_tutkinnon_osien_osaamispisteet_yht]

	--leikkuri (120 osaamispistettä varainhoitovuoden tavoitteellista opiskelijavuotta kohti)
	,[leikkauskerroin] = 
		CASE 
			WHEN os_pisteet_summa.osaamispisteet_sum > 120.0 * sa1.tavoitteelliset_opiskelijavuodet THEN (120.0 * sa1.tavoitteelliset_opiskelijavuodet) / os_pisteet_summa.osaamispisteet_sum
			ELSE 1.0
		END
	,[tavoitteelliset_opv] = sa1.tavoitteelliset_opiskelijavuodet
	,[rahoitusmuoto_maksetaan] = d5.sisaltyy_okm_suoritusrahoitus
	,[hyvaksytaan_rahoitukseen] = case when d23.koodi=1 /*and d25.koodi=1*/ then 1 else 0 end

	--järjestykset
	,[jarj Tilastokuukausi] = d6.kuukausi
	,[jarj Sukupuoli] = d11.jarjestys_sukupuoli_koodi
	,[jarj Äidinkieli] = d12.jarjestys_kieliryhma1
	,[jarj Ikäryhmä] = d13.jarjestys_ikaryhma3
	,[jarj Ikä] = d13.jarjestys_ika
	,[jarj Koulutusala, taso 1] = d2.jarjestys_koulutusalataso1_koodi
	,[jarj Koulutusala, taso 2] = d2.jarjestys_koulutusalataso2_koodi
	,[jarj Koulutusala, taso 3] = d2.jarjestys_koulutusalataso3_koodi
	,[jarj Tutkintotyyppi] = d2.jarjestys_tutkintotyyppi_koodi
	
	,[jarj Rahoitusmuoto] = d5.jarjestys_koodi
	,[jarj Kustannusryhmä] = d7.jarjestys_koodi
	,[jarj Oppisopimuskoulutus] = d4.jarjestys
	,[jarj Erityisopetus] = d3.jarjestys_erityisopetus_koodi
	,[jarj Suorituksen tyyppi] = d8.jarjestys

	,[jarj Koulutuksen järjestäjän AVI] = d10a.jarjestys_avi_koodi
	,[jarj Koulutuksen järjestäjän ELY] = d10a.jarjestys_ely_koodi
	,[jarj Koulutuksen järjestäjän maakunta] = d10a.jarjestys_maakunta_koodi

	,[jarj Oppilaitoksen AVI] = d10b.jarjestys_avi_koodi
	,[jarj Oppilaitoksen ELY] = d10b.jarjestys_ely_koodi
	,[jarj Oppilaitoksen maakunta] = d10b.jarjestys_maakunta_koodi

	,[jarj Toimipisteen AVI] = d10c.jarjestys_avi_koodi
	,[jarj Toimipisteen ELY] = d10c.jarjestys_ely_koodi
	,[jarj Toimipisteen maakunta] = d10c.jarjestys_maakunta_koodi

	,jarj_luvaton_koulutus = d23.jarjestys
	,jarj_luvaton_korotustekija = d25.jarjestys

FROM  dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut  f

LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.id = f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d1c on d1c.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_erityisopetus d3 on d3.id = f.d_erityisopetus_id
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.id = f.d_oppisopimuskoulutus_id
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_kalenteri d6 on d6.id = f.d_kalenteri_id
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d7 on d7.id = f.d_kustannusryhma_id
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d9 on d9.id = f.d_amos_spl_jarjestaja_linkki_id	
LEFT JOIN dw.d_alueluokitus d10a on d10a.alueluokitus_avain = ''kunta_''+d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d10b on d10b.alueluokitus_avain = ''kunta_''+d1b.kunta_koodi
LEFT JOIN dw.d_alueluokitus d10c on d10c.alueluokitus_avain = ''kunta_''+d1c.kunta_koodi
LEFT JOIN dw.d_sukupuoli d11 on d11.id = f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d12 on d12.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d13 on d13.id = f.d_ika_id
LEFT JOIN dw.d_kytkin d14 on d14.id = f.d_kytkin_hankintakoulutus_id
LEFT JOIN dw.d_organisaatioluokitus d15 on d15.id = f.d_organisaatioluokitus_jarjestaja_pihvi_id
LEFT JOIN dw.d_amos_luvaton_koulutus d23 ON d23.id = f.d_amos_luvaton_koulutus_id
LEFT JOIN dw.d_amos_luvaton_korotustekija d25 ON d25.id = f.d_amos_luvaton_korotustekija_id
--tavoitteelliset opiskelijavuodet (fuusiot huomioiden)
LEFT JOIN (
	SELECT
		ytunnus
		,vuosi
		,tavoitteelliset_opiskelijavuodet = SUM(tavoitteelliset_opiskelijavuodet_2018)
	FROM (
		SELECT DISTINCT
			ytunnus = coalesce(d.ytunnus_amos_spl, sa.ytunnus)
			,vuosi = 2018
			,tavoitteelliset_opiskelijavuodet_2018
		FROM sa.sa_amos_tavoitteelliset_opiskelijavuodet sa
		LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = sa.ytunnus 
	) Q
	GROUP BY ytunnus,vuosi
) sa1 on sa1.ytunnus = d1a.organisaatio_koodi and sa1.vuosi = f.tilastovuosi
--tutkinnon osien osaamispisteiden leikkuria varten lasketaan rahoituksessa huomioitavien luvallisten osaamispisteiden summa per järjestäjä per vuosi
LEFT JOIN (
	SELECT 
		f.tilastovuosi
		,organisaatio_koodi = d1.ytunnus_amos_spl
		,osaamispisteet_sum = sum(f.painottamaton_osaamispisteet)
	FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut f
	JOIN dw.d_amos_spl_jarjestaja_linkki d1 on d1.id = f.d_amos_spl_jarjestaja_linkki_id
	JOIN dw.d_opintojenrahoitus d2 on d2.id = f.d_opintojenrahoitus_id
	JOIN dw.d_amos_luvaton_koulutus d3 on d3.id = f.d_amos_luvaton_koulutus_id
	WHERE d2.sisaltyy_okm_suoritusrahoitus = 1 and d3.koodi = 1
	GROUP BY f.tilastovuosi, d1.ytunnus_amos_spl
) os_pisteet_summa on os_pisteet_summa.organisaatio_koodi = d9.ytunnus_amos_spl AND os_pisteet_summa.tilastovuosi = f.tilastovuosi








' 
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijavuodet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_opiskelijavuodet](
	[vuosi] [int] NULL,
	[d_kalenteri_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_osa_aikaisuus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_majoitus_id] [int] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_kytkin_henkilostokoulutus_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_jarj_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_hist_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [nchar](10) NULL,
	[d_kytkin_verrataan_lupatietoihin_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_majoitus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[opiskelijavuodet] [float] NULL,
	[opiskelijavuodet_hylatyt] [float] NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat](
	[Tilastovuosi] [int] NULL,
	[d_kalenteri_id] [int] NULL,
	[d_kalenteri_alkamispaiva_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_hist_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kytkin_verrataan_lupatietoihin_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[koko_tutkinto] [int] NULL,
	[tutkinnon_osat] [int] NULL,
	[osaamispisteet] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_opiskelijavuodet_koko]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_amos_opiskelijavuodet_koko]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_amos_opiskelijavuodet_koko] AS

DECLARE @minVuosi as int, @maxVuosi as int
SET @minVuosi = 2018
SET @maxVuosi = NULL

EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu @minVuosi, @maxVuosi

EXEC Koski_SA.dbo.p_lataa_opiskelijavuodet_valitaulu_unpivot

EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet

EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet_painotetut
EXEC ANTERO.dw.p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija

GO
/****** Object:  StoredProcedure [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko] AS' 
END
GO





ALTER PROCEDURE [dw].[p_lataa_amos_tutkinnot_ja_tutkinnonosat_koko] AS

DECLARE @minVuosi as int, @maxVuosi as int
SET @minVuosi = 2018
SET @maxVuosi = NULL


EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu @minVuosi,@maxVuosi

EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu
EXEC Koski_SA.dbo.p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat

EXEC sa.p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki
EXEC sa.p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot

EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut
EXEC dw.p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_generoi_hyvaksytty_korotustekija


GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet] AS


TRUNCATE TABLE [ANTERO].[dw].[f_amos_opiskelijavuodet]

INSERT INTO dw.f_amos_opiskelijavuodet (
	 vuosi
	,d_kalenteri_id
	,d_sukupuoli_id
	,d_kieli_aidinkieli_id
	,d_ika_id
	,d_osa_aikaisuus_id
	,d_erityisopetus_id
	,d_majoitus_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_vankilaopetus_id
	,d_kytkin_henkilostokoulutus_id
	,d_kytkin_tyovoimakoulutus_id
	,d_koulutusluokitus_id
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarj_id
	,d_organisaatioluokitus_jarj_hist_id
	,d_organisaatioluokitus_jarj_pihvi_id
	,d_organisaatioluokitus_jarj_pihvi_hist_id
	,d_organisaatioluokitus_toimipiste_id
	,d_amos_spl_jarjestaja_linkki_id
	,d_kustannusryhma_id
	,d_suorituksen_tyyppi_id
	,d_opintojenrahoitus_id
	,d_osaamisala_id
	,muu_ammatillinen_tarkenne
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
	,d_kytkin_verrataan_lupatietoihin_id
	,d_amos_luvaton_koulutus_id
	,d_amos_luvaton_majoitus_id
	,d_amos_luvaton_korotustekija_id
	,d_kytkin_hankintakoulutus_id
	,opiskelijavuodet
	,opiskelijavuodet_hylatyt
	,loadtime
)

SELECT 
	
	 q.vuosi
	,d_kalenteri_id = COALESCE(d1.id,-1)
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_osa_aikaisuus_id = COALESCE(d20.id,-1)
	,d_erityisopetus_id = COALESCE(d5.id,-1)
	,d_majoitus_id = COALESCE(d6.id,-1)
	,d_kytkin_oppisopimuskoulutus_id = COALESCE(d7.id,-1)
	,d_kytkin_vankilaopetus_id = COALESCE(d8.id,-1)
	,d_kytkin_henkilostokoulutus_id = COALESCE(d9.id,-1)
	,d_kytkin_tyovoimakoulutus_id = COALESCE(d10.id,-1)
	,d_koulutusluokitus_id = COALESCE(d11.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)
	,d_organisaatioluokitus_jarj_hist_id = COALESCE(d13c.id,-1)
	,d_organisaatioluokitus_jarj_pihvi_id = COALESCE(d13d.id,-1)
	,d_organisaatioluokitus_jarj_pihvi_hist_id = COALESCE(d13e.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d18.id,-1)
	,d_amos_spl_jarjestaja_linkki_id = COALESCE(d13b.id,-1)
	,d_kustannusryhma_id = COALESCE(d15.id,-1)
	,d_suorituksen_tyyppi_id = COALESCE(d14.id,-1)
	,d_opintojenrahoitus_id = COALESCE(d16.id,-1)
	,d_osaamisala_id = COALESCE(d17.id,-1)
	,muu_ammatillinen_tarkenne = COALESCE(muu_ammatillinen_tarkenne, -1)
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste = COALESCE(d19.id,-1)
	,d_kytkin_verrataan_lupatietoihin_id = COALESCE(d21.id,-1)
	,d_amos_luvaton_koulutus_id = COALESCE(d22.id,-1)
	,d_amos_luvaton_majoitus_id = COALESCE(d23.id,-1)
	,d_amos_luvaton_korotustekija_id = COALESCE(d24.id,-1)
	,d_kytkin_hankintakoulutus_id = COALESCE(d25.id,-1)
	,opiskelijavuodet = SUM(case when q.hyvaksytaan = 1 then op_vuodet else 0 end)
	,opiskelijavuodet_hylatyt = SUM(case when q.hyvaksytaan = 0 then op_vuodet else 0 end)
	,GETDATE()
	
FROM [Koski_SA].[dbo].[opiskelijavuodet_valitaulu_unpivot] q
LEFT JOIN d_kalenteri d1 ON d1.kalenteri_avain = q.tilv_date
LEFT JOIN d_sukupuoli d2 ON d2.sukupuoli_koodi = q.sukupuoli
LEFT JOIN d_kieli d3 ON d3.kieli_koodi = q.aidinkieli
LEFT JOIN d_ika d4 ON d4.ika_avain = q.ika
LEFT JOIN d_erityisopetus d5 ON d5.erityisopetus_koodi = q.erityisopetus
LEFT JOIN d_majoitus d6 ON d6.majoitus_koodi = q.majoitus
LEFT JOIN d_kytkin d7 ON d7.kytkin_koodi = q.oppis
LEFT JOIN d_kytkin d8 ON d8.kytkin_koodi = q.vankilaopetus
LEFT JOIN d_kytkin d9 ON d9.kytkin_koodi = q.henkilostokoulutus
LEFT JOIN d_kytkin d10 ON d10.kytkin_koodi = q.tyovoimakoulutus
LEFT JOIN d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi = q.koulk
LEFT JOIN d_organisaatioluokitus d12 ON d12.organisaatio_oid = q.tunn_oid
LEFT JOIN d_organisaatioluokitus d13 ON d13.organisaatio_oid = q.jarj_oid
LEFT JOIN d_amos_spl_jarjestaja_linkki d13b ON d13b.oid_avain = q.jarj_oid
LEFT JOIN d_organisaatioluokitus d13c ON d13c.organisaatio_oid = q.jarj_oid_hist
LEFT JOIN d_organisaatioluokitus d13d ON d13d.organisaatio_oid = q.jarj_oid_pihvi
LEFT JOIN d_organisaatioluokitus d13e ON d13e.organisaatio_oid = q.jarj_oid_pihvi_hist
LEFT JOIN d_suorituksen_tyyppi d14 ON d14.koodi = q.suorituksen_tyyppi
LEFT JOIN d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi = q.kustannusryhma
LEFT JOIN d_opintojenrahoitus d16 ON d16.koodi = q.opintojen_rahoitus
LEFT JOIN d_osaamisala d17 ON d17.koodi = q.osaamisala
LEFT JOIN d_organisaatioluokitus d18 ON d18.organisaatio_oid = q.toim_oid
LEFT JOIN d_amos_spl_opiskelijavuodet_hylkaamisperuste d19 ON d19.koodi = q.hylkaamisen_peruste
LEFT JOIN d_kytkin d20 ON d20.kytkin_koodi = q.osa_aikaisuus
LEFT JOIN d_kytkin d25 ON d25.kytkin_koodi = (case when q.jarj_oid_pihvi is null then 0 else 1 end)
--LEFT JOIN d_koulutusluokitus d26 ON d26.koulutusluokitus_koodi = q.koulk_pihvi
--LINKITYS LUPATIETOIHIN ALKAA
LEFT JOIN d_kytkin d21 ON d21.kytkin_koodi = 
(
	case 
		when (d11.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d11.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 1
		else 0 --tähän 1 jos vertailu halutaan tehdä kaikille opiskeluoikeuksille
	end
)
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki sjl ON sjl.oid_avain = coalesce(q.jarj_oid_pihvi_hist, q.jarj_oid_pihvi, q.jarj_oid_hist, q.jarj_oid)
--tutkinto-oikeudet
LEFT JOIN sa.v_amos_oiva_tutkinto_oikeudet v1 ON (tilv_date between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm)) and v1.tutkintokoodi = q.koulk and v1.jarjestajaYtunnus = 
(
	case 
		when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
		else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
	end
)
--muut oikeudet
LEFT JOIN sa.v_amos_oiva_muut_oikeudet v2 ON tilv_date between v2.alkupvm and v2.loppupvm and v2.jarjestajaYtunnus =
(
	case 
		when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
		else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
	end
)
--dimensiot
LEFT JOIN dw.d_amos_luvaton_koulutus d22 ON d22.koodi = 
(
	case 
		--katsotaan luvalliseksi jos pihvikoulutus on lukiokoulutusta
		when d21.kytkin_koodi = 0 or q.koulutusmuoto_pihvi = 'lukiokoulutus' then 1
		else 
			case
				when v1.jarjestajaYtunnus is null and q.koulk = '999903' then 9
				when v1.jarjestajaYtunnus is null and q.koulk = '999901' then 8
				when muu_ammatillinen_tarkenne = '94095' and q.oppis = 1 and v2.valmistava = 0 then 7
				when muu_ammatillinen_tarkenne = '94095' and q.oppis = 0 and v2.valmistava = 0 then 6
				when muu_ammatillinen_tarkenne = '94090' and q.oppis = 1 and v2.laaja_oppis = 0 then 5
				when muu_ammatillinen_tarkenne = '94090' and q.oppis = 0 and v2.laaja_oppis = 0 then 4
				when v1.jarjestajaYtunnus is null and muu_ammatillinen_tarkenne is null and q.oppis = 1 and v2.laaja_oppis = 0 then 3
				when v1.jarjestajaYtunnus is null and muu_ammatillinen_tarkenne is null and q.oppis = 0 then 2
				else 1
			end
	end
)
LEFT JOIN dw.d_amos_luvaton_majoitus d23 ON d23.koodi = 
(
	case
		when d21.kytkin_koodi = 0 then 1
		else
			case
				when q.majoitus = 3 and v2.sisaoppilaitosmuotoinen = 0 then 2
				else 1
			end
	end
)
LEFT JOIN dw.d_amos_luvaton_korotustekija d24 ON d24.koodi = 
(
	case 
		when d21.kytkin_koodi = 0 then 1
		else
			case
				when d10.kytkin_koodi = '1' and d11.tutkintotyyppi_koodi in ('19','20') and v2.tyovoima = 0 then 2
				when d8.kytkin_koodi = '1' and v2.vankila = 0 then 3
				when d5.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 then 4
				else 1
			end
	end
)


GROUP BY 
q.vuosi
,d1.id
,d2.id
,d3.id
,d4.id
,d5.id
,d6.id
,d7.id
,d8.id
,d9.id
,d10.id
,d11.id
,d12.id
,d13.id
,d13b.id
,d13c.id
,d13d.id
,d13e.id
,d14.id
,d15.id
,d16.id
,d17.id
,d18.id
,d19.id
,d20.id
,d21.id
,d22.id
,d23.id
,d24.id
,d25.id
,muu_ammatillinen_tarkenne



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut] AS


TRUNCATE TABLE [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut]

INSERT INTO dw.f_amos_opiskelijavuodet_painotetut (
	 [tilastovuosi]
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_osa_aikaisuus_id]
    ,[d_erityisopetus_id]
    ,[d_majoitus_id]
    ,[d_kytkin_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_kytkin_henkilostokoulutus_id]
    ,[d_kytkin_tyovoimakoulutus_id]
    ,[d_koulutusluokitus_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
	,[d_organisaatioluokitus_jarj_hist_id]
	,[d_organisaatioluokitus_jarj_pihvi_id]
	,[d_organisaatioluokitus_jarj_pihvi_hist_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_opintojenrahoitus_id]
	,[d_osaamisala_id]
	,[muu_ammatillinen_tarkenne]
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_majoitus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_kytkin_sisaopp_ov_ylittyy_id]
	,[d_kytkin_erityistuen_ov_ylittyy_id]
    ,[opiskelijavuodet_painottamaton]
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
	,[opiskelijavuodet_painotettu_yhteensa]
	,loadtime
)

SELECT  
	 *
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki] + [opiskelijavuodet_painotettu_majoitus] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus]
	,GETDATE()

FROM (

	SELECT 
		[tilastovuosi] = f.[vuosi]
		,[d_kalenteri_id]
		,[d_sukupuoli_id]
		,[d_kieli_aidinkieli_id]
		,[d_ika_id]
		,[d_osa_aikaisuus_id]
		,[d_erityisopetus_id]
		,[d_majoitus_id]
		,[d_kytkin_oppisopimuskoulutus_id]
		,[d_kytkin_vankilaopetus_id]
		,[d_kytkin_henkilostokoulutus_id]
		,[d_kytkin_tyovoimakoulutus_id]
		,[d_koulutusluokitus_id]
		,[d_organisaatioluokitus_oppilaitos_id]
		,f.[d_organisaatioluokitus_jarj_id]
		,[d_organisaatioluokitus_jarj_hist_id]
		,[d_organisaatioluokitus_jarj_pihvi_id]
		,[d_organisaatioluokitus_jarj_pihvi_hist_id]
		,[d_organisaatioluokitus_toimipiste_id]
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id]
		,[d_opintojenrahoitus_id]
		,[d_osaamisala_id]
		,[muu_ammatillinen_tarkenne]
		,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
		,[d_amos_luvaton_koulutus_id]
		,[d_amos_luvaton_majoitus_id]
		,[d_amos_luvaton_korotustekija_id]
		,[d_kytkin_hankintakoulutus_id]	
		,[d_kytkin_sisaopp_ov_ylittyy_id] = case when coalesce(som.ov_sisa,0) > coalesce(jl.sisaoppilaitosmuotoinen,999999) then 1 else 2 end
		,[d_kytkin_erityistuen_ov_ylittyy_id] = case when coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,999999) then 1 else 2 end

		,[opiskelijavuodet_painottamaton] = [opiskelijavuodet]
		,[opiskelijavuodet_painotettu_pt] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
			( 
					(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
			)

		,[opiskelijavuodet_painotettu_at_eat] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
			( 
					(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
			)

		,[opiskelijavuodet_painotettu_valma_telma] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_6' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='vt' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_opisk_valm_tukevat] =
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_7' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='ot' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_muu] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='muu' then opiskelijavuodet else 0 end)
			

		,[opiskelijavuodet_painotettu_erityistuki] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_14' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_18' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='7' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_19' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='8' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_20' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='9' then opiskelijavuodet else 0 end)
	
		,[opiskelijavuodet_painotettu_erityistuki_hyv] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_14' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='4' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='5' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='6' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_18' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='7' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='7' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_19' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='8' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='8' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_20' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='9' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='9' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
		-- luvan ylittäviltä vaativan erityisen tuen koulutuksen opiskelijavuosilta otetaan pois vaativan erityisen tuen painotus, muutetaan tavallisiksi opiskelijavuosiksi
		--+	(case when d6.jarjestys_erityisopetus_ryhma = '3' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) and coalesce(jl.vaativa_erityinen_tuki,0) > 0 then opiskelijavuodet-opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	

		,[opiskelijavuodet_painotettu_majoitus] =
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='3' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_majoitus_hyv] =
		-- luvan ylittävät sisäoppilaitosmuotoisen koulutuksen opiskelijavuodet painotetaan tavallisen majoituksen opiskelijavuosien painolla
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet when d7.majoitus_koodi='3' and coalesce(som.ov_sisa,0) > coalesce(jl.sisaoppilaitosmuotoinen,0) and coalesce(jl.sisaoppilaitosmuotoinen,0) > 0 then opiskelijavuodet-opiskelijavuodet*(jl.sisaoppilaitosmuotoinen/som.ov_sisa) else 0 end)
	+	(case when d11.koodi = 2 then (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) else (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.vuosi+2 = varainhoitovuosi) end) * (case when d7.majoitus_koodi='3' and (coalesce(som.ov_sisa,0) <= coalesce(jl.sisaoppilaitosmuotoinen,0) or coalesce(jl.sisaoppilaitosmuotoinen,0)=0) then opiskelijavuodet when d7.majoitus_koodi='3' and coalesce(som.ov_sisa,0) > coalesce(jl.sisaoppilaitosmuotoinen,0) then opiskelijavuodet*(jl.sisaoppilaitosmuotoinen/som.ov_sisa) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)


		,[opiskelijavuodet_painotettu_henkilostokoulutus] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_25' and f.vuosi+2 = varainhoitovuosi) * 
			(
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
				)
			+
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
				)
			)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and f.vuosi+2 = varainhoitovuosi) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and f.vuosi+2 = varainhoitovuosi)  * 
			(
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
				( 
					(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
				)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)
			)
		,[opiskelijavuodet_painotettu_vankilaopetus] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='vankilaopetus'and f.vuosi+2 = varainhoitovuosi) * (case when d3.kytkin_koodi = '1' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_hylatyt]

	FROM [ANTERO].[dw].[f_amos_opiskelijavuodet] f
	left join dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	left join dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	left join dw.d_kytkin d3 on d3.id = f.d_kytkin_vankilaopetus_id
	left join dw.d_kytkin d4 on d4.id = f.d_kytkin_tyovoimakoulutus_id
	left join dw.d_kytkin d5 on d5.id = f.d_kytkin_henkilostokoulutus_id
	left join dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	left join dw.d_majoitus d7 on d7.id = f.d_majoitus_id
	left join dw.d_amos_luvaton_korotustekija d8 on d8.id = f.d_amos_luvaton_korotustekija_id
	left join dw.d_organisaatioluokitus d9 on d9.id = f.d_organisaatioluokitus_jarj_id
	left join dw.d_kalenteri d10 on d10.id = f.d_kalenteri_id
	left join dw.d_amos_luvaton_majoitus d11 on d11.id = f.d_amos_luvaton_majoitus_id

	--sisäoppilaitosmuotoisen majoituksen opiskelijavuodet summa per vuosi
	left join (
		select 
			vuosi
			,d_organisaatioluokitus_jarj_id
			,ov_sisa = sum(opiskelijavuodet)
		from dw.f_amos_opiskelijavuodet f
		left join dw.d_majoitus d1 on d1.id=f.d_majoitus_id
		left join dw.d_amos_luvaton_koulutus d2 on d2.id = f.d_amos_luvaton_koulutus_id
		where d1.majoitus_koodi='3' and d2.koodi=1
		group by vuosi,d_organisaatioluokitus_jarj_id
	) som on som.vuosi=f.vuosi and som.d_organisaatioluokitus_jarj_id=f.d_organisaatioluokitus_jarj_id

	--vaativan erityisen tuen opiskelijavuodet summa per vuosi
	left join (
		select 
			vuosi
			,d_organisaatioluokitus_jarj_id
			,ov = sum(opiskelijavuodet)
		from dw.f_amos_opiskelijavuodet f
		left join dw.d_erityisopetus d1 on d1.id=f.d_erityisopetus_id
		left join dw.d_amos_luvaton_koulutus d2 on d2.id = f.d_amos_luvaton_koulutus_id
		where d1.jarjestys_erityisopetus_ryhma='3' and d2.koodi=1
		group by vuosi,d_organisaatioluokitus_jarj_id
	) vet on vet.vuosi=f.vuosi and vet.d_organisaatioluokitus_jarj_id=f.d_organisaatioluokitus_jarj_id

	--järjestämisluvan rajoite sisäoppilaitosmuotoiselle majoitukselle ja vaativalle erityiselle tuelle
	left join sa.v_amos_oiva_opiskelijavuodet_rajoite jl on jl.jarjestajaYtunnus=d9.organisaatio_koodi and d10.paivays between jl.alkupvm and jl.loppupvm

) q



/* 2018 TIETOJA EI NÄYTETÄ ENÄÄ LIVERAPORTILLA */
UNION ALL

SELECT 
	*
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki] + [opiskelijavuodet_painotettu_majoitus] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus]
	,GETDATE()
FROM (

	SELECT  
		 [tilastovuosi]
		,[d_kalenteri_id] = '-1'
		,[d_sukupuoli_id] = '-1'
		,[d_kieli_aidinkieli_id] = '-1'
		,[d_ika_id] = '-1'
		,[d_osa_aikaisuus_id] = '-1'
		,[d_erityisopetus_id]
		,[d_majoitus_id] 
		,[d_kytkin_oppisopimuskoulutus_id]
		,[d_kytkin_vankilaopetus_id]
		,[d_kytkin_henkilostokoulutus_id]
		,[d_kytkin_tyovoimakoulutus_id]
		,[d_koulutusluokitus_id] = '-1'
		,[d_organisaatioluokitus_oppilaitos_id] = '-1'
		,[d_organisaatioluokitus_jarj_id]
		,[d_organisaatioluokitus_jarj_hist_id] = '-1'
		,[d_organisaatioluokitus_jarj_pihvi_id] = '-1'
		,[d_organisaatioluokitus_jarj_pihvi_hist_id] = '-1'
		,[d_organisaatioluokitus_toimipiste_id] = '-1'
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id] = '-1'
		,[d_opintojenrahoitus_id]
		,[d_osaamisala_id] = '-1'
		,[muu_ammatillinen_tarkenne] = '-1'
		,[d_amos_spl_opiskelijavuodet_hylkaamisperuste] = '9'
		,[d_amos_luvaton_koulutus_id] = '0'
		,[d_amos_luvaton_majoitus_id] = '0'
		,[d_amos_luvaton_korotustekija_id] = '0'
		,[d_kytkin_hankintakoulutus_id] = '-1'
		,[d_kytkin_sisaopp_ov_ylittyy_id] = '2'
		,[d_kytkin_erityistuen_ov_ylittyy_id] = '2'
		,[opiskelijavuodet_painottamaton] = sum(eioppis_eivankila) + sum(henkilosto_eioppis_eivankila) + sum(majoitus_eioppis_eivankila) + sum(tyovoima_eioppis_eivankila) + sum(tyovoima_henkilosto_eioppis_eivankila) + sum(oppis) + sum(henkilosto_oppis) + sum(majoitus_oppis) + sum(vankila)
		,[opiskelijavuodet_painotettu_pt] = 0 
		,[opiskelijavuodet_painotettu_at_eat] = 0
		,[opiskelijavuodet_painotettu_valma_telma] = 0
		,[opiskelijavuodet_painotettu_opisk_valm_tukevat]  = 0
		,[opiskelijavuodet_painotettu_muu] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(sum(eioppis_eivankila) + sum(henkilosto_eioppis_eivankila) + sum(majoitus_eioppis_eivankila) + sum(tyovoima_eioppis_eivankila) + sum(tyovoima_henkilosto_eioppis_eivankila) + sum(oppis) + sum(henkilosto_oppis) + sum(majoitus_oppis) + sum(vankila))
		
		,[opiskelijavuodet_painotettu_erityistuki] = 0

		,[opiskelijavuodet_painotettu_erityistuki_hyv] = 0
		
		,[opiskelijavuodet_painotettu_majoitus] = 
			(sum(majoitus_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(majoitus_oppis) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))

		,[opiskelijavuodet_painotettu_majoitus_hyv] = 
			(sum(majoitus_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(majoitus_oppis) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))
		
		,[opiskelijavuodet_painotettu_henkilostokoulutus] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(
			(sum(henkilosto_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(tyovoima_henkilosto_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(henkilosto_oppis) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and v.tilastovuosi+2 = varainhoitovuosi))
			)
		
		,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(sum(tyovoima_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and v.tilastovuosi+2 = varainhoitovuosi))
		
		,[opiskelijavuodet_painotettu_vankilaopetus] = 
			(sum(vankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='vankilaopetus'and v.tilastovuosi+2 = varainhoitovuosi))
		
		,[opiskelijavuodet_hylatyt] = 0

	FROM [sa].[v_amos_muut_tutkinnot] v
	GROUP BY v.tilastovuosi,d_kytkin_oppisopimuskoulutus_id,d_kytkin_vankilaopetus_id,d_kytkin_henkilostokoulutus_id,d_kytkin_tyovoimakoulutus_id,d_organisaatioluokitus_jarj_id,d_kustannusryhma_id,d_opintojenrahoitus_id,d_erityisopetus_id,d_majoitus_id,d_amos_spl_jarjestaja_linkki_id

) q2


GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija] AS

SELECT distinct
	 [tilastovuosi]
      ,[d_kalenteri_tilastokuukausi_id]
      ,[d_sukupuoli_id]
      ,[d_kieli_aidinkieli_id]
      ,[d_ika_id]
      ,[d_osa_aikaisuus_id]
      ,[d_erityisopetus_id]
      ,[d_majoitus_id]
      ,[d_kytkin_oppisopimuskoulutus_id]
      ,[d_kytkin_vankilaopetus_id]
      ,[d_kytkin_henkilostokoulutus_id]
      ,[d_kytkin_tyovoimakoulutus_id]
      ,[d_koulutusluokitus_id]
      ,[d_organisaatioluokitus_oppilaitos_id]
      ,[d_organisaatioluokitus_jarj_id]
      ,[d_organisaatioluokitus_jarj_hist_id]
	  ,[d_organisaatioluokitus_jarj_pihvi_id]
      ,[d_organisaatioluokitus_jarj_pihvi_hist_id]
      ,[d_organisaatioluokitus_toimipiste_id]
      ,[d_amos_spl_jarjestaja_linkki_id]
      ,[d_kustannusryhma_id]
      ,[d_suorituksen_tyyppi_id]
      ,[d_opintojenrahoitus_id]
      ,[d_osaamisala_id]
      ,[muu_ammatillinen_tarkenne]
      ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
      ,[d_amos_luvaton_koulutus_id]
      ,[d_amos_luvaton_majoitus_id] = 0
      ,[d_amos_luvaton_korotustekija_id] = 0
      ,[d_kytkin_hankintakoulutus_id]
      ,[d_kytkin_sisaopp_ov_ylittyy_id]
      ,[d_kytkin_erityistuen_ov_ylittyy_id]

      ,[opiskelijavuodet_painottamaton] = 0
      ,[opiskelijavuodet_painotettu_yhteensa] = 0
      ,[opiskelijavuodet_painotettu_pt] = 0
      ,[opiskelijavuodet_painotettu_at_eat] = 0
      ,[opiskelijavuodet_painotettu_valma_telma] = 0
      ,[opiskelijavuodet_painotettu_opisk_valm_tukevat] = 0
      ,[opiskelijavuodet_painotettu_muu] = 0
      ,[opiskelijavuodet_painotettu_erityistuki] = 0
      ,[opiskelijavuodet_painotettu_erityistuki_hyv] = 0
      ,[opiskelijavuodet_painotettu_majoitus] = 0
      ,[opiskelijavuodet_painotettu_majoitus_hyv] = 0
      ,[opiskelijavuodet_painotettu_henkilostokoulutus] = 0
      ,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 0
      ,[opiskelijavuodet_painotettu_vankilaopetus] = 0
      ,[opiskelijavuodet_hylatyt] = 0

      ,[loadtime]

INTO #temp
FROM [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut] f1
WHERE NOT EXISTS (select d_organisaatioluokitus_jarj_id from dw.f_amos_opiskelijavuodet_painotetut f2 where d_amos_luvaton_korotustekija_id = 0 and f2.d_organisaatioluokitus_jarj_id = f1.d_organisaatioluokitus_jarj_id)


INSERT INTO [dw].[f_amos_opiskelijavuodet_painotetut] SELECT * FROM #temp

DROP TABLE #temp
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat] AS' 
END
GO





ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat] AS


TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat] (
	 [Tilastovuosi]
    ,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_koulutusluokitus_id]
    ,[d_opintojenrahoitus_id]
    ,[d_kustannusryhma_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_erityisopetus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_toimipiste_id]
	,[d_kytkin_verrataan_lupatietoihin_id]
	,[d_kytkin_hankintakoulutus_id]
    ,[koko_tutkinto]
    ,[tutkinnon_osat]
    ,[osaamispisteet]
)

SELECT 
	 [Tilastovuosi] = tt.vuosi
	,d_kalenteri_id = coalesce(d9.id, -1)
	,d_kalenteri_alkamispaiva_id = coalesce(d9b.id, -1)
	,d_sukupuoli_id = coalesce(d11.id, -1)
	,d_kieli_aidinkieli_id = coalesce(d12.id, -1)
	,d_ika_id = coalesce(d13.id, -1)
	,d_koulutusluokitus_id = coalesce(d2b.id,d2.id, -1)
	
	,d_opintojenrahoitus_id = coalesce(d5.id, -1)
	,d_kustannusryhma_id = coalesce(d7.id, -1)
	,d_oppisopimuskoulutus_id = coalesce(d4.id, -1)
	,d_erityisopetus_id = coalesce(d3.id, -1)
	,d_kytkin_vankilaopetus_id = coalesce(d10.id, -1)
	,d_suorituksen_tyyppi_id = coalesce(d8.id, -1)

	,d_organisaatioluokitus_jarjestaja_id = coalesce(d1a.id, -1)
	,d_organisaatioluokitus_jarjestaja_hist_id = coalesce(d1e.id, -1)
	,d_organisaatioluokitus_jarjestaja_pihvi_id = coalesce(d1f.id, -1)
	,d_organisaatioluokitus_jarjestaja_pihvi_hist_id = coalesce(d1g.id, -1)
	,d_amos_spl_jarjestaja_linkki_id = coalesce(d1d.id, -1)
	,d_organisaatioluokitus_oppilaitos_id = coalesce(d1b.id, -1)
	,d_organisaatioluokitus_toimipiste_id = coalesce(d1c.id, -1)

	,d_kytkin_verrataan_lupatietoihin_id = coalesce(d14.id, -1)
	,d_kytkin_hankintakoulutus_id = coalesce(d15.id, -1)

    ,koko_tutkinto = count(distinct tutkinto)
    ,tutkinnon_osat = count(distinct tutkinnon_osa)
	,osaamispisteet = sum(coalesce(laajuus,0))

FROM  Koski_SA.dbo.tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty tt

LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.organisaatio_oid = tt.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = tt.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d1c on d1c.organisaatio_oid = tt.toimipiste_oid
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1d on d1d.oid_avain = tt.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d1e on d1e.organisaatio_oid = tt.koulutustoimija_oid_hist
LEFT JOIN dw.d_organisaatioluokitus d1f on d1f.organisaatio_oid = tt.koulutustoimija_oid_pihvi
LEFT JOIN dw.d_organisaatioluokitus d1g on d1g.organisaatio_oid = tt.koulutustoimija_oid_pihvi_hist
LEFT JOIN dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = tt.tutkinto_koodi
LEFT JOIN dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = coalesce(d2.uusi_eat_koodi,d2.koulutusluokitus_koodi)
LEFT JOIN dw.d_erityisopetus d3 on d3.erityisopetus_koodi = tt.erityisopetus_koodi
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.koodi = tt.oppisopimus_koodi
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.koodi = tt.opintojen_rahoitus_koodi
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d7 on d7.koodi = tt.kustannusryhma_koodi
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.koodi = tt.suorituksen_tyyppi_koodi
LEFT JOIN dw.d_kalenteri d9 on d9.kalenteri_avain = concat(tt.vuosi,'-',right(concat('00', tt.kuukausi),2),'-01')
LEFT JOIN dw.d_kalenteri d9b on d9b.kalenteri_avain = tt.alkamispaiva
LEFT JOIN dw.d_kytkin d10 on d10.kytkin_koodi = tt.vankilaopetus_koodi
LEFT JOIN dw.d_sukupuoli d11 on d11.sukupuoli_koodi = tt.sukupuoli
LEFT JOIN dw.d_kieli d12 on d12.kieli_koodi = tt.aidinkieli
LEFT JOIN dw.d_ika d13 on d13.ika_avain = tt.ika
LEFT JOIN dw.d_kytkin d14 on d14.kytkin_koodi = (
	case 
		when (d2b.tutkintotyyppi_koodi = '02' and tt.alkamispaiva >= '2018-08-01') or (d2b.tutkintotyyppi_koodi in ('19','20') and tt.alkamispaiva >= '2019-01-01') then 1
		else 0 --tähän 1 jos vertailu halutaan tehdä kaikille opiskeluoikeuksille
	end
)
LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = (case when tt.koulutustoimija_oid_pihvi is null then 0 else 1 end)


GROUP BY 
	tt.vuosi
	,d1a.id
	,d1b.id
	,d1c.id
	,d1d.id
	,d1e.id
	,d1f.id
	,d1g.id
	,d2.id
	,d2b.id
	,d3.id
	,d4.id
	,d5.id
	,d7.id
	,d8.id
	,d9.id
	,d9b.id
	,d10.id
	,d11.id
	,d12.id
	,d13.id
	,d14.id
	,d15.id
	
HAVING 
	   count(distinct tutkinto) > 0
    or count(distinct tutkinnon_osa) > 0
    or sum(coalesce(laajuus,0)) > 0	



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut] AS


DECLARE @maxTilv as int
SET @maxTilv = (select max(vuosi) from sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot)


TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut] (
	[tilastovuosi]
    ,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_erityisopetus_id]
    ,[d_koulutusluokitus_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_opintojenrahoitus_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kytkin_hankintakoulutus_id]
    ,[painottamaton_tutkinnot]
    ,[painottamaton_osatutkinnot]
    ,[painottamaton_osaamispisteet]
    ,[painottamaton_osaamispisteet_summa]
    ,[painotettu_tutkinnot_pt_kr_pk]
    ,[painotettu_tutkinnot_at_eat_kr_pk]
    ,[painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnot_erityistuki_hyv]
    ,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv]
    ,[painotettu_tutkinnot_yht]
    ,[painotettu_tutkinnon_osien_osaamispisteet_yht]
	)

SELECT  
	 [tilastovuosi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kytkin_hankintakoulutus_id]
	,[painottamaton_tutkinnot]
	,[painottamaton_osatutkinnot] 
	,[painottamaton_osaamispisteet]
	,[painottamaton_osaamispisteet_summa]
	,[painotettu_tutkinnot_pt_kr_pk]
	,[painotettu_tutkinnot_at_eat_kr_pk]
	,[painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnot_erityistuki_hyv]
	,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
	,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv]
	,[painotettu_tutkinnot_yht] = [painotettu_tutkinnot_pt_kr_pk] + [painotettu_tutkinnot_at_eat_kr_pk] + [painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_yht] = [painotettu_tutkinnon_osien_osaamispisteet_pt_kr] + [painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] + [painotettu_tutkinnon_osien_osaamispisteet_erityistuki]

FROM (

	SELECT
		 f.[Tilastovuosi]
		,[d_kalenteri_id]
		,[d_kalenteri_alkamispaiva_id]
		,[d_sukupuoli_id]
		,[d_kieli_aidinkieli_id]
		,[d_ika_id]
		,[d_erityisopetus_id]
		,[d_koulutusluokitus_id]
		,[d_organisaatioluokitus_jarjestaja_id]
		,[d_organisaatioluokitus_jarjestaja_pihvi_id]
		,[d_organisaatioluokitus_jarjestaja_hist_id]
		,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_organisaatioluokitus_oppilaitos_id]
		,[d_organisaatioluokitus_toimipiste_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id]
		,[d_opintojenrahoitus_id]
		,[d_oppisopimuskoulutus_id]
		,[d_kytkin_vankilaopetus_id]
		,[d_amos_luvaton_koulutus_id] = coalesce(d22.id,-1)
		,[d_amos_luvaton_korotustekija_id] = coalesce(d24.id,-1)
		,[d_kytkin_hankintakoulutus_id]
		,[painottamaton_tutkinnot] = [koko_tutkinto]
		,[painottamaton_osatutkinnot] = [tutkinnon_osat]
		,[painottamaton_osaamispisteet] = f.[osaamispisteet]
		,[painottamaton_osaamispisteet_summa] = 0--os_pisteet_summa.osaamispisteet_sum
		,[painotettu_tutkinnot_pt_kr_pk] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					)
			   + (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					)
			)

		,[painotettu_tutkinnot_at_eat_kr_pk] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					)
			   + (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					)
			)

		,[painotettu_tutkinnot_erityistuki] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' and d5.koodi = '1' then koko_tutkinto else 0 end)
			)

		,[painotettu_tutkinnot_erityistuki_hyv] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='6' and d5.koodi = '1' then koko_tutkinto else 0 end)
			)
		
		,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then osaamispisteet else 0 end) 
			)
		
		,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then osaamispisteet else 0 end) 
			)	  
		
		,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] = 
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then osaamispisteet else 0 end)

		,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv] = 
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then osaamispisteet else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='4' then osaamispisteet else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='5' then osaamispisteet else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='6' then osaamispisteet else 0 end)
			
			

	FROM [ANTERO].[dw].[f_amos_tutkinnot_ja_tutkinnonosat] f
	left join dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	left join dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	left join dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	left join dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatioluokitus_jarjestaja_id
	left join dw.d_amos_spl_jarjestaja_linkki d3b on d3b.id = f.d_amos_spl_jarjestaja_linkki_id
	left join dw.d_organisaatioluokitus d3c on d3c.id = f.d_organisaatioluokitus_jarjestaja_hist_id
	left join dw.d_organisaatioluokitus d3d on d3d.id = f.d_organisaatioluokitus_jarjestaja_pihvi_id
	left join dw.d_organisaatioluokitus d3e on d3e.id = f.d_organisaatioluokitus_jarjestaja_pihvi_hist_id
	left join sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot d4 on d4.vuosi = (case when f.Tilastovuosi > @maxTilv then f.Tilastovuosi-1 else f.Tilastovuosi end) and d4.ytunnus = d3.organisaatio_koodi and cast(d4.kr as varchar) = d2.koodi and d4.tutktyyppi = (case when d1.tutkintotyyppi_koodi in ('19','20') then '19_20' else tutkintotyyppi_koodi end)
	left join dw.d_suorituksen_tyyppi d5 on d5.id = f.d_suorituksen_tyyppi_id
	left join dw.d_kalenteri d9 on d9.id = f.d_kalenteri_id
	left join dw.d_kalenteri d9b on d9b.id = f.d_kalenteri_alkamispaiva_id
	left join dw.d_kytkin d10 on d10.id = f.d_oppisopimuskoulutus_id
	left join dw.d_kytkin d21 on d21.id = f.d_kytkin_verrataan_lupatietoihin_id
	left join dw.d_amos_spl_jarjestaja_linkki sjl on sjl.oid_avain = coalesce(nullif(d3e.organisaatio_oid,'-1'),nullif(d3d.organisaatio_oid,'-1'),nullif(d3c.organisaatio_oid,'-1'), d3.organisaatio_oid)--coalesce(nullif(d3c.organisaatio_oid,'-1'), d3.organisaatio_oid)
	--tutkinto-oikeudet
	left join sa.v_amos_oiva_tutkinto_oikeudet v1 on (d9.paivays between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm)) and v1.tutkintokoodi = d1.koulutusluokitus_koodi and v1.jarjestajaYtunnus = 
	(
		case 
			when d9.paivays < sjl.voimaan_alkaen then sjl.ytunnus_avain
			else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
		end
	)
	--muut oikeudet
	left join sa.v_amos_oiva_muut_oikeudet v2 on d9.paivays between v2.alkupvm and v2.loppupvm and v2.jarjestajaYtunnus =
	(
		case 
			when d9.paivays < sjl.voimaan_alkaen then sjl.ytunnus_avain
			else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
		end
	)
	--dimensiot
	left join dw.d_amos_luvaton_koulutus d22 on d22.koodi = 
	(
		case 
			when d21.kytkin_koodi = 0 then 1
			else 
				case
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 0 and koko_tutkinto > 0 and osaamispisteet = 0 then 20
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 1 and koko_tutkinto > 0 and osaamispisteet = 0 and v2.laaja_oppis = 0 then 21
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 0 and koko_tutkinto = 0 and osaamispisteet > 0 then 22
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 1 and koko_tutkinto = 0 and osaamispisteet > 0 and v2.laaja_oppis = 0 then 23
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 0 and koko_tutkinto > 0 and osaamispisteet > 0 then 24
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 1 and koko_tutkinto > 0 and osaamispisteet > 0 and v2.laaja_oppis = 0 then 25
					else 1
				end
		end
	)
	left join dw.d_amos_luvaton_korotustekija d24 on d24.koodi = 
	(
		case 
			when d21.kytkin_koodi = 0 then 1
			else
				case
					when d6.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 and koko_tutkinto > 0 and osaamispisteet = 0 then 10
					when d6.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 and koko_tutkinto = 0 and osaamispisteet > 0 then 11
					when d6.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 and koko_tutkinto > 0 and osaamispisteet > 0 then 12
					else 1
				end
		end
	)
	--tämä laskenta siirretty näkymään koska koulutuksen luvallisuuden tarkistus on tässä proseduurissa
	--tutkinnon osien osaamispisteiden leikkuria varten lasketaan rahoituksessa huomioitavien osaamispisteiden summa per järjestäjä per vuosi
	/*
	left join 
	(
		SELECT 
			f.tilastovuosi
			,organisaatio_koodi = d1.ytunnus_amos_spl
			,osaamispisteet_sum = sum(f.osaamispisteet)
		FROM dw.f_amos_tutkinnot_ja_tutkinnonosat f
		JOIN dw.d_amos_spl_jarjestaja_linkki d1 on d1.id = f.d_amos_spl_jarjestaja_linkki_id
		JOIN dw.d_opintojenrahoitus d2 on d2.id = f.d_opintojenrahoitus_id
		WHERE d2.sisaltyy_okm_suoritusrahoitus = 1
		GROUP BY f.tilastovuosi, d1.ytunnus_amos_spl
	) os_pisteet_summa on os_pisteet_summa.organisaatio_koodi = d3b.ytunnus_amos_spl AND os_pisteet_summa.tilastovuosi = f.tilastovuosi
	*/

	--jos järjestäjälle ei löydy pohjakoulutustietoja, käytetään koko aineiston jakaumaa
	cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A1
	cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A2
	cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B1
	cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B2
	  
) q



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_generoi_hyvaksytty_korotustekija]    Script Date: 21.8.2020 10:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_generoi_hyvaksytty_korotustekija]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_generoi_hyvaksytty_korotustekija] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_generoi_hyvaksytty_korotustekija] AS

SELECT distinct
	 [tilastovuosi]
    ,[d_kalenteri_id]
    ,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_erityisopetus_id]
    ,[d_koulutusluokitus_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
    ,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
    ,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_opintojenrahoitus_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_amos_luvaton_koulutus_id]
    ,[d_amos_luvaton_korotustekija_id] = 0
    ,[d_kytkin_hankintakoulutus_id]

    ,[painottamaton_tutkinnot] = 0
    ,[painottamaton_osatutkinnot] = 0
    ,[painottamaton_osaamispisteet] = 0
    ,[painottamaton_osaamispisteet_summa] = 0
    ,[painotettu_tutkinnot_pt_kr_pk] = 0
    ,[painotettu_tutkinnot_at_eat_kr_pk] = 0
    ,[painotettu_tutkinnot_erityistuki] = 0
    ,[painotettu_tutkinnot_erityistuki_hyv] = 0
    ,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] = 0
    ,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] = 0
    ,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] = 0
    ,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv] = 0
    ,[painotettu_tutkinnot_yht] = 0
    ,[painotettu_tutkinnon_osien_osaamispisteet_yht] = 0
	
INTO #temp
FROM [ANTERO].[dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut] f1
WHERE NOT EXISTS (select 1 from dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut f2 where f2.d_amos_luvaton_korotustekija_id = 0 and f2.d_organisaatioluokitus_jarjestaja_id = f1.d_organisaatioluokitus_jarjestaja_id)


INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut] SELECT * FROM #temp

DROP TABLE #temp
