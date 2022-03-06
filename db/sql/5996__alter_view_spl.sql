USE [ANTERO]
GO
/****** Object:  View [dw].[v_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 6.3.2022 18:39:11 ******/
DROP VIEW IF EXISTS [dw].[v_amos_tutkinnot_ja_tutkinnonosat]
GO
/****** Object:  View [dw].[v_amos_opiskelijavuodet]    Script Date: 6.3.2022 18:39:11 ******/
DROP VIEW IF EXISTS [dw].[v_amos_opiskelijavuodet]
GO
/****** Object:  View [dw].[v_amos_opiskelijavuodet]    Script Date: 6.3.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_opiskelijavuodet]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [dw].[v_amos_opiskelijavuodet] AS

SELECT --TOP 1000
	[Tilastovuosi] = f.tilastovuosi
	,[Tilastokuukausi] = d14.kuukausi_fi

	,[Sukupuoli] = d1.sukupuoli_fi
	,[Äidinkieli] = d2.kieli_fi
	,[Ikä] = d3.ika_fi 
	,[Ikäryhmä] = d3.ikaryhma3_fi
	,[Hyväksytyt/hylätyt opiskelijavuodet] = d22.selite_fi 
	,[Tutkintotyypin ryhmä] = case when d18.koodi = ''muu'' then ''Muu ammatillinen koulutus'' else coalesce(nullif(d4b.tutkintotyypin_ryhma_fi,''Tieto puuttuu''),d4.tutkintotyypin_ryhma_fi) end
    ,[Tutkintotyyppi] = case when d18.koodi = ''muu'' then ''Muu ammatillinen koulutus'' when d4.koulutusluokitus_fi like ''%VALMA%'' then ''VALMA'' when d4.koulutusluokitus_fi like ''%TELMA%'' then ''TELMA'' else coalesce(nullif(d4b.tutkintotyyppi_fi,''Tieto puuttuu''),d4.tutkintotyyppi_fi) end
	,[Tutkinto] = d4.koulutusluokitus_fi  
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi  
    ,[Koulutusala, taso 2] = d4.koulutusalataso2_fi 
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi 
	,[Osaamisala] = d20.selite_fi
    ,[Osa-aikaisuus] = d16.kytkin_fi
    ,[Suorituksen tyyppi] = d17.selite_fi
	,[Suorituskieli] = d32.kieli_fi
	,[Kustannusryhmä] = d18.selite_fi 
	,[Rahoitusmuoto] = d19.selite_fi
	,[Erityisopetus] = d13.erityisopetus_nimi_fi
	,[Majoitus] = d15.majoitus_nimi_fi
	,[Oppisopimuskoulutus] = 
		case d6.kytkin_koodi
			when 1 then ''Oppisopimuskoulutus'' 
			when 0 then ''Ei oppisopimuskoulutus'' 
			else ''Tieto puuttuu'' 
		end
	,[Vankilaopetus] = 
		case d7.kytkin_koodi
			when 1 then ''Vankilaopetus'' 
			when 0 then ''Ei vankilaopetus'' 
			else ''Tieto puuttuu'' 
		end
	,[Henkilöstokoulutus] =	
		case d8.kytkin_koodi
			when 1 then ''Henkilöstökoulutus'' 
			when 0 then ''Ei henkilöstökoulutus'' 
			else ''Tieto puuttuu'' 
		end
	,[Työvoimakoulutus] = 
		case d9.kytkin_koodi
			when 1 then ''Työvoimakoulutus'' 
			when 0 then ''Ei työvoimakoulutus'' 
			else ''Tieto puuttuu'' 
		end
	,[Hankintakoulutus] = d26.kytkin_fi
	,[Oppivelvollisuus] = 
		case d30.kytkin_koodi
			when 1 then ''Maksuton koulutus''
			when 0 then ''Ei maksuton koulutus''
			else ''''
		end


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
	,[Luvaton koulutus totuusarvo] = case d23.koodi when 1 then 0 else 1 end
	,[Luvaton majoitus] = d24.selite_fi
	,[Luvaton korotustekijä] = d25.selite_fi
	,[Luvanmukainen suorituskieli] = d33.kieli_fi

	,[sisaopp_ylittyy] = d28.jarjestys_kytkin_koodi
	,[erityistuki_ylittyy] = d29.jarjestys_kytkin_koodi

	,[Opiskelijavuoden tyyppi] = d31.selite_fi
	,painottamaton = cast(painottamaton as decimal (20,10))
	,painotettu = cast(painotettu as decimal (20,10))
	,hylatty = cast(hylatty as decimal (20,10))

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
	,case when d18.koodi = ''muu'' then ''90'' else coalesce(nullif(d4b.jarjestys_tutkintotyypin_ryhma_koodi,''99999''),d4.jarjestys_tutkintotyypin_ryhma_koodi) end AS jarj_tutkintotyypin_ryhma
	,case when d18.koodi = ''muu'' then ''90'' when d4.koulutusluokitus_fi like ''%VALMA%'' then 91 when d4.koulutusluokitus_fi like ''%TELMA%'' then 92 else coalesce(nullif(d4b.jarjestys_tutkintotyyppi_koodi,''99999''),d4.jarjestys_tutkintotyyppi_koodi) end AS jarj_tutkintotyyppi
	,jarj_hylkaamisperuste = d22.jarjestys
	,jarj_luvaton_koulutus = d23.jarjestys
	,jarj_luvaton_majoitus = d24.jarjestys
	,jarj_luvaton_korotustekija = d25.jarjestys
	,jarj_painotuksen_tyyppi = d31.jarjestys
	,jarj_suorituskieli = case when d32.kieli_koodi = ''-2'' then ''ööö'' else left(d32.kieli_koodi, 3) end
	,jarj_suorituskieli_luvanmukainen = case when d33.kieli_koodi = ''-2'' then ''ööö'' else left(d33.kieli_koodi, 3) end

FROM  dw.f_amos_opiskelijavuodet_painotetut_unpivot f 
LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_koulutusluokitus d4b ON d4b.id = f.d_koulutusluokitus_tutk_osaa_pienempi_id
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
LEFT JOIN dw.d_kytkin d30 ON d30.id = f.d_kytkin_oppivelvollisuus_id
LEFT JOIN dw.d_amos_painotuksen_tyyppi d31 ON d31.id = f.d_amos_painotuksen_tyyppi_id
LEFT JOIN dw.d_kieli d32 ON d32.id = f.d_kieli_suoritus_id
LEFT JOIN dw.d_kieli d33 ON d33.id = f.d_kieli_suoritus_luvanmukainen_id

WHERE 1=1 


























' 
GO
/****** Object:  View [dw].[v_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 6.3.2022 18:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_tutkinnot_ja_tutkinnonosat]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dw].[v_amos_tutkinnot_ja_tutkinnonosat] AS

SELECT --TOP 1000
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
	,[Suorituskieli] = d16.kieli_fi

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
	,[Luvaton koulutus totuusarvo] = case d23.koodi when 1 then 0 when 23 then 0 else 1 end
	,[Luvaton korotustekijä] = d25.selite_fi
	,[Luvanmukainen suorituskieli] = d17.kieli_fi

	,[Koodit Koulutuksen järjestäjä] = d1a.organisaatio_koodi
	,[Koodit Hankintakoulutuksen järjestäjä] = d15.organisaatio_koodi
	,[Koodit Tutkinto] = d2.koulutusluokitus_koodi
	,[Koodit Tutkintotyyppi] = d2.tutkintotyyppi_koodi

	,[Hyväksytään laskentaan] = case when f.laskentaan_hyvaksyttava=1 and d23.hyvaksytaan=1 then ''Kyllä'' else ''Ei'' end
	,[Tutkintopisteen tyyppi] = d26.selite_fi
	
	--apusarakkeet
	,[painottamaton_tutkinnot_ja_osaamispisteet] = [painottamaton_tutkinnot_ja_osaamispisteet]
	,[painottamaton_tutkinnot_ja_osaamispisteet_hylatty] = case when f.laskentaan_hyvaksyttava=0 then [painottamaton_tutkinnot_ja_osaamispisteet] end
	,[painotettu_tutkinnot_ja_osaamispisteet] = case when f.laskentaan_hyvaksyttava=1 and d23.hyvaksytaan=1 then [painotettu_tutkinnot_ja_osaamispisteet] end

	--,[rahoitusmuoto_maksetaan] = d5.sisaltyy_okm_suoritusrahoitus
	--,[hyvaksytaan_rahoitukseen] = case when d23.koodi=1 then 1 else 0 end

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
	,[jarj Suorituskieli] = case when d16.kieli_koodi = ''-2'' then ''ööö'' else left(d16.kieli_koodi, 3) end
	,[jarj Suorituskieli luvanmukainen] = case when d17.kieli_koodi = ''-2'' then ''ööö'' else left(d17.kieli_koodi, 3) end

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

	,jarj_painotuksen_tyyppi = d26.jarjestys

FROM  dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot  f

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
LEFT JOIN dw.d_kieli d16 on d16.id = f.d_kieli_suoritus_id
LEFT JOIN dw.d_kieli d17 on d17.id = f.d_kieli_suoritus_luvanmukainen_id
LEFT JOIN dw.d_amos_luvaton_koulutus d23 on d23.id = f.d_amos_luvaton_koulutus_id
LEFT JOIN dw.d_amos_luvaton_korotustekija d25 on d25.id = f.d_amos_luvaton_korotustekija_id
LEFT JOIN dw.d_amos_painotuksen_tyyppi d26 on d26.id = f.d_amos_painotuksen_tyyppi_id



' 