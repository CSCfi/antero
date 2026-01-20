USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_amm_opiskelijat_pbi]    Script Date: 30.7.2025 10.48.33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_koski_lukio_amm_opiskelijat_pbi] AS

DROP TABLE IF EXISTS [dw].[f_koski_lukio_amm_opiskelijat_pbi]

SELECT * INTO [dw].[f_koski_lukio_amm_opiskelijat_pbi] FROM (
--Lukio
SELECT DISTINCT Tilastovuosi = vuosi
	,[Tilastokuukausi] = null
	,[pv_kk] = null
	,[Koulutuksen järjestäjä] = d2.organisaatio_fi
	,[Oppilaitos] = d1.organisaatio_fi
	,[Oppilaitoksen opetuskieli] = d1.oppilaitoksenopetuskieli_fi
	,[Opiskelijan äidinkieli] = d9.kieli_fi
	,[Toimipisteen maakunta] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d6.maakunta_fi  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d5.maakunta_fi
			else d4.maakunta_fi
		end
	,[Toimipisteen kunta] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d6.kunta_fi  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d5.kunta_fi
			else d4.kunta_fi
		end
	,[Oppilaitoksen maakunta] =
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d6.maakunta_fi    
			else d5.maakunta_fi
		end
	,[Oppilaitoksen kunta] = 
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d6.kunta_fi    
			else d5.kunta_fi
		end
	,[Koulutuksen järjestäjän maakunta] = d6.maakunta_fi
	,[Koulutuksen järjestäjän kunta] = d6.kunta_fi
	,Toimipiste = d3.organisaatio_fi
	,[Toimipisteen postinumero] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d2.postinumero  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d1.postinumero 
			else d3.postinumero
		end
	,[Toimipisteen katuosoite] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d2.katuosoite
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d1.katuosoite
			else d3.katuosoite
		end
	,[Oppilaitoksen postinumero] = 
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d2.postinumero   
			else d1.postinumero
		end
	,[Oppilaitoksen katuosoite] =
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d2.katuosoite
			else d1.katuosoite
		end
	,[Koulutuksen järjestäjän postinumero] = d2.postinumero
	,[Koulutuksen järjestäjän katuosoite] = d2.katuosoite
	,[Lukion opetussuunnitelma] =
		case 
			when f.oppimaara = 'Aikuisten oppimäärä' then 'Aikuisten lukiokoulutus' 
			when f.oppimaara = 'Nuorten oppimäärä' then 'Nuorten lukiokoulutus' 
			when f.oppimaara = 'Ulkomainen tutkinto' then 'Ulkomainen lukiokoulutus' 
			when f.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' AND f.koulutus = 'Tutkintokoulutukseen valmentava koulutus' then 'TUVA (lukiokoulutuksen järjestäjä)'
			when f.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' AND f.koulutus = 'Lukiokoulutukseen valmistava koulutus' then 'LUVA (lukiokoulutuksen järjestäjä)'
			else f.oppimaara
		end
	,Tutkintotyyppi = 
		case 
			when f.koulutus = 'Lukiokoulutukseen valmistava koulutus' then 'LUVA' 
			when f.koulutus = 'Tutkintokoulutukseen valmentava koulutus' then 'TUVA' 
			when f.koulutus = 'Yleissivistävä lukiokoulutus' then 'Lukiokoulutus (pl. valmentava)' 
			else f.koulutus
		end
	,[Tutkinto/koulutus] =
		case 
			when f.tavoitetutkinto = 'Deutsche Internationale Abitur; Reifeprüfung' then 'Deutsche Internationale Abitur (Reifeprüfung)' 
			when f.tavoitetutkinto = 'Ylioppilastutkinto' then 'Lukiokoulutus (pl. valmentava)' 
			when tavoitetutkinto = 'Ei tutkintotavoitetta' AND f.koulutus = 'Lukiokoulutukseen valmistava koulutus' then 'LUVA' 
			when tavoitetutkinto = 'Ei tutkintotavoitetta' AND f.koulutus = 'Tutkintokoulutukseen valmentava koulutus' then 'TUVA'
			when tavoitetutkinto = 'Ei tutkintotavoitetta' AND f.koulutus = 'Yleissivistävä lukiokoulutus' then 'Ei lukion tutkintotavoitetta' 
			else f.tavoitetutkinto
		end
	,[Suorituksen tyyppi] =
		case 
			when f.koulutus = 'Lukiokoulutukseen valmistava koulutus' then 'Valmentava koulutus' 
			when f.koulutus = 'Tutkintokoulutukseen valmentava koulutus' then 'Valmentava koulutus' 
			when f.koulutus = 'Yleissivistävä lukiokoulutus' AND f.tavoitetutkinto != 'Ei tutkintotavoitetta' then 'Lukion tutkinto-opiskelija'
			when f.koulutus = 'Yleissivistävä lukiokoulutus' AND f.tavoitetutkinto = 'Ei tutkintotavoitetta' then 'Lukion aineopiskelija'  
			else f.koulutus
		end
	,[Työvoimakoulutus (ammatillinen)] = 'Lukiokoulutus: ei työvoimakoulutusta'
	,[Oppisopimuskoulutus (ammatillinen)] = 'Lukiokoulutus: ei oppisopimuskoulutusta'
	,[Erityisopetus (ammatillinen)] = 'Lukiokoulutus: erityisopetuksen tieto puuttuu'
	,[Koulutusala, taso 1] = 'Yleissivistävä koulutus'
	,[Koulutusala, taso 2] = 'Yleissivistävä koulutus'
	,[Koulutusala, taso 3] = 'Yleissivistävä koulutus'
	,[Opiskelijan ikä] =
		case
			when f.ika = -1 then 'Tieto puuttuu' 
			when f.[ika] < 15 then 'Alle 15 vuotta' 
			when f.ika > 70 then 'Yli 70 vuotta'
			else CAST(f.ika AS nvarchar(30))
		end
	,[Lukio-/ammatillisen koulutuksen järjestäjä] = 'Lukiokoulutuksen järjestäjä'
	,f.master_oid as oppija_oid
	,opiskelijat = null
	,opiskelija_20_9 = (SELECT MAX([tilastopaiva_20_9]) FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_laskentapaiva] f1 WHERE f1.tilastovuosi = f.vuosi AND f1.master_oid = f.master_oid AND f1.opiskeluoikeus_oid = f.opiskeluoikeus_oid)
	,raportti = 'perus'
FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_kuukausittain] f
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d1 ON d1.organisaatio_oid = f.oppilaitos_oid
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2 ON d2.organisaatio_oid = f.koulutustoimija_oid
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d3 ON d3.organisaatio_oid = f.toimipiste_oid
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d4 ON d4.kunta_koodi = d3.kunta_koodi --toimipiste
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d5 ON d5.kunta_koodi = d1.kunta_koodi --oppilaitos
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d6 ON d6.kunta_koodi = d2.kunta_koodi --koulutuksen järjestäjä
	LEFT JOIN [ANTERO].[dw].[d_kieli] d7 on d7.kieli_koodi = f.suorituskieli_koodiarvo
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] AS d8 ON  d8.koulutusluokitus_koodi = f.koulutustoimija_oid
	LEFT JOIN [ANTERO].[dw].[d_kieli] d9 on d9.kieli_koodi = f.aidinkieli
	WHERE d2.organisaatio_koodi != '0763403-0' OR (d2.organisaatio_koodi = '0763403-0' AND vuosi < 2022)

UNION

--Ammatillinen
SELECT DISTINCT Tilastovuosi = tilastovuosi
	,[Tilastokuukausi] = null
	,[pv_kk] = null
	,[Koulutuksen järjestäjä] = d15.nimi_amos_spl
	,[Oppilaitos] = d1.organisaatio_fi
	,[Oppilaitoksen opetuskieli] = d1.oppilaitoksenopetuskieli_fi
	,[Opiskelijan äidinkieli] = d10.kieli_fi
	,[Toimipisteen maakunta] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d6.maakunta_fi  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d5.maakunta_fi
			else d4.maakunta_fi
		end
	,[Toimipisteen kunta] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d6.kunta_fi  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d5.kunta_fi
			else d4.kunta_fi
		end
	,[Oppilaitoksen maakunta] =
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d6.maakunta_fi    
			else d5.maakunta_fi
		end
	,[Oppilaitoksen kunta] = 
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d6.kunta_fi    
			else d5.kunta_fi
		end
	,[Koulutuksen järjestäjän maakunta] = d6.maakunta_fi
	,[Koulutuksen järjestäjän kunta] = d6.kunta_fi
	,Toimipiste = d3.organisaatio_fi
	,[Toimipisteen postinumero] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d2.postinumero 
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d1.postinumero  
			else d3.postinumero
		end
	,[Toimipisteen katuosoite] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d2.katuosoite
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d1.katuosoite
			else d3.katuosoite
		end
	,[Oppilaitoksen postinumero] = 
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d2.postinumero   
			else d1.postinumero
		end
	,[Oppilaitoksen katuosoite] =
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d2.katuosoite
			else d1.katuosoite
		end
	,[Koulutuksen järjestäjän postinumero] = d2.postinumero
	,[Koulutuksen järjestäjän katuosoite] = d2.katuosoite
	,[Lukion opetussuunnitelma] = 'Ammatillinen koulutus'
	,[tutkintotyyppi] = 
		case 
			when valmentava_koodi = 1 then 'VALMA' 
			when valmentava_koodi = 2 then 'TELMA' 
			when valmentava_koodi = 3 then 'TUVA' 
			when d12.kytkin_koodi = 1 then 'Muu ammatillinen koulutus' 
			when d11.tutkintotyyppi_fi = 'Ammatilliset perustutkinnot' then 'Ammatillinen perustutkinto'
			when d11.tutkintotyyppi_fi = 'Ammattitutkinnot' then 'Ammattitutkinto'
			when d11.tutkintotyyppi_fi = 'Erikoisammattitutkinnot' then 'Erikoisammattitutkinto'
			else d11.tutkintotyyppi_fi 
		end
	,[Tutkinto/koulutus] =
		case
			when valmentava_koodi = 1 then 'VALMA' 
			when valmentava_koodi = 2 then 'TELMA' 
			when valmentava_koodi = 3 then 'TUVA' 
			else d11.koulutusluokitus_fi
		end
	,[Suorituksen tyyppi] =
		case
			when valmentava_koodi = 1 then 'Valmentava koulutus' 
			when valmentava_koodi = 2 then 'Valmentava koulutus' 
			when valmentava_koodi = 3 then 'Valmentava koulutus'
			when d13.selite_fi = 'Koko tutkinto' then 'Koko ammatillinen tutkinto'
			when d13.selite_fi = 'Tutkinnon osa/osia' then 'Ammatillisen tutkinnon osa/osia'  
			when d13.selite_fi = 'Tutkinnon osaa pienempi kokonaisuus' then 'Ammatillisen tutkinnon osaa pienempi kokonaisuus' 
			else d13.selite_fi
		end
	,[Työvoimakoulutus (ammatillinen)] = d7.kytkin_fi
	,[Oppisopimuskoulutus (ammatillinen)] = d8.kytkin_fi
	,[Erityisopetus (ammatillinen)] = d9.erityisopetus_ryhma_fi
	,[Koulutusala, taso 1] = d11.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d11.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d11.koulutusalataso3_fi
	,[Opiskelijan ikä] =
		case
			when f.d_ika_id = -1 then 'Tieto puuttuu' 
			when f.d_ika_id < 15 then 'Alle 15 vuotta' 
			when f.d_ika_id > 70 then 'Yli 70 vuotta'
			else CAST(f.d_ika_id AS nvarchar(30))
		end
	,[Lukio-/ammatillisen koulutuksen järjestäjä] = 'Ammatillisen koulutuksen järjestäjä'
	,master_oid as oppija_oid
	,opiskelijat = null
	,opiskelija_20_9 = tilastopaiva_20_9
	,raportti = 'perus'
FROM [ANTERO].[dw].[f_koski_amm_opiskelijat] f
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d1 ON d1.id = f.d_organisaatioluokitus_oppilaitos_id
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2 ON d2.id = f.d_organisaatioluokitus_jarj_id
	LEFT JOIN [ANTERO].[dw].[d_amos_spl_jarjestaja_linkki] d15 ON d15.oid_avain = d2.organisaatio_oid
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d3 ON d3.id = f.d_organisaatioluokitus_toimipiste_id
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d4 ON d4.kunta_koodi = d3.kunta_koodi --toimipiste
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d5 ON d5.kunta_koodi = d1.kunta_koodi --oppilaitos
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d6 ON d6.kunta_koodi = d2.kunta_koodi --koulutuksen järjestäjä
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d7 ON d7.id = f.d_kytkin_tyovoimakoulutus_id
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d8 ON d8.id = f.d_kytkin_oppisopimuskoulutus_id
	LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d9 on d9.id = f.d_erityisopetus_id
	LEFT JOIN [ANTERO].[dw].[d_kieli] d10 on d10.id = f.d_kieli_aidinkieli_id
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d11 ON d11.id = f.d_koulutusluokitus_id
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d12 ON d12.id = f.d_kytkin_muu_ammatillinen_id
	LEFT JOIN [ANTERO].[dw].[d_suorituksen_tyyppi] d13 ON d13.id = f.d_suorituksen_tyyppi_id
	LEFT JOIN [ANTERO].[dw].[d_kalenteri] d14 ON d14.id = f.d_kalenteri_id
	WHERE d2.organisaatio_koodi != '0763403-0' OR (d2.organisaatio_koodi = '0763403-0' AND tilastovuosi < 2022)

UNION

--Lukio netto
SELECT DISTINCT Tilastovuosi = tilastovuosi
	,Tilastokuukausi = d9.kuukausi_fi
	,[pv_kk] = DAY(EOMONTH(MAX(d9.paivays)))
	,[Koulutuksen järjestäjä] = d2.organisaatio_fi
	,[Oppilaitos] = d1.organisaatio_fi
	,[Oppilaitoksen opetuskieli] = d1.oppilaitoksenopetuskieli_fi
	,[Opiskelijan äidinkieli] = d8.kieli_fi
	,[Toimipisteen maakunta] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d6.maakunta_fi  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d5.maakunta_fi
			else d4.maakunta_fi
		end
	,[Toimipisteen kunta] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d6.kunta_fi  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d5.kunta_fi
			else d4.kunta_fi
		end
	,[Oppilaitoksen maakunta] =
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d6.maakunta_fi    
			else d5.maakunta_fi
		end
	,[Oppilaitoksen kunta] = 
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d6.kunta_fi    
			else d5.kunta_fi
		end
	,[Koulutuksen järjestäjän maakunta] = d6.maakunta_fi
	,[Koulutuksen järjestäjän kunta] = d6.kunta_fi
	,Toimipiste = d3.organisaatio_fi
	,[Toimipisteen postinumero] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d2.postinumero  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d1.postinumero 
			else d3.postinumero
		end
	,[Toimipisteen katuosoite] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d2.katuosoite
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d1.katuosoite
			else d3.katuosoite
		end
	,[Oppilaitoksen postinumero] = 
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d2.postinumero   
			else d1.postinumero
		end
	,[Oppilaitoksen katuosoite] =
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d2.katuosoite
			else d1.katuosoite
		end
	,[Koulutuksen järjestäjän postinumero] = d2.postinumero
	,[Koulutuksen järjestäjän katuosoite] = d2.katuosoite
	,[Lukion opetussuunnitelma] =
		case 
			when f.oppimaara = 'Aikuisten oppimäärä' then 'Aikuisten lukiokoulutus' 
			when f.oppimaara = 'Nuorten oppimäärä' then 'Nuorten lukiokoulutus' 
			when f.oppimaara = 'Ulkomainen tutkinto' then 'Ulkomainen lukiokoulutus' 
			when f.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' AND f.koulutus = 'Tutkintokoulutukseen valmentava koulutus' then 'TUVA (lukiokoulutuksen järjestäjä)'
			when f.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' AND f.koulutus = 'Lukiokoulutukseen valmistava koulutus' then 'LUVA (lukiokoulutuksen järjestäjä)'
			else f.oppimaara
		end
	,Tutkintotyyppi = 
		case 
			when f.koulutus = 'Lukiokoulutukseen valmistava koulutus' then 'LUVA' 
			when f.koulutus = 'Tutkintokoulutukseen valmentava koulutus' then 'TUVA' 
			when f.koulutus = 'Yleissivistävä lukiokoulutus' then 'Lukiokoulutus (pl. valmentava)' 
			else f.koulutus
		end
	,[Tutkinto/koulutus] =
		case 
			when f.tavoitetutkinto = 'Deutsche Internationale Abitur; Reifeprüfung' then 'Deutsche Internationale Abitur (Reifeprüfung)' 
			when f.tavoitetutkinto = 'Ylioppilastutkinto' then 'Lukiokoulutus (pl. valmentava)' 
			when tavoitetutkinto = 'Ei tutkintotavoitetta' AND f.koulutus = 'Lukiokoulutukseen valmistava koulutus' then 'LUVA' 
			when tavoitetutkinto = 'Ei tutkintotavoitetta' AND f.koulutus = 'Tutkintokoulutukseen valmentava koulutus' then 'TUVA'
			when tavoitetutkinto = 'Ei tutkintotavoitetta' AND f.koulutus = 'Yleissivistävä lukiokoulutus' then 'Ei lukion tutkintotavoitetta' 
			else f.tavoitetutkinto
		end
	,[Suorituksen tyyppi] =
		case 
			when f.koulutus = 'Lukiokoulutukseen valmistava koulutus' then 'Valmentava koulutus' 
			when f.koulutus = 'Tutkintokoulutukseen valmentava koulutus' then 'Valmentava koulutus' 
			when f.koulutus = 'Yleissivistävä lukiokoulutus' AND f.tavoitetutkinto != 'Ei tutkintotavoitetta' then 'Lukion tutkinto-opiskelija'
			when f.koulutus = 'Yleissivistävä lukiokoulutus' AND f.tavoitetutkinto = 'Ei tutkintotavoitetta' then 'Lukion aineopiskelija'  
			else f.koulutus
		end
	,[Työvoimakoulutus (ammatillinen)] = 'Lukiokoulutus: ei työvoimakoulutusta'
	,[Oppisopimuskoulutus (ammatillinen)] = 'Lukiokoulutus: ei oppisopimuskoulutusta'
	,[Erityisopetus (ammatillinen)] = 'Lukiokoulutus: erityisopetuksen tieto puuttuu'
	,[Koulutusala, taso 1] = 'Yleissivistävä koulutus'
	,[Koulutusala, taso 2] = 'Yleissivistävä koulutus'
	,[Koulutusala, taso 3] = 'Yleissivistävä koulutus'
	,[Opiskelijan ikä] =
		case
			when f.d_ika_id = -1 then 'Tieto puuttuu' 
			when f.d_ika_id < 15 then 'Alle 15 vuotta' 
			when f.d_ika_id > 70 then 'Yli 70 vuotta'
			else CAST(f.d_ika_id AS nvarchar(30))
		end
	,[Lukio-/ammatillisen koulutuksen järjestäjä] = 'Lukiokoulutuksen järjestäjä'
	,master_oid = null
	,opiskelijat = SUM(opiskelijat)
	,opiskelija_20_9 = null
	,raportti = 'netto'
FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_netto] f
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d1 ON d1.id = f.d_organisaatioluokitus_oppilaitos_id
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2 ON d2.id = f.d_organisaatioluokitus_jarj_id
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d3 ON d3.id = f.d_organisaatioluokitus_toimipiste_id
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d4 ON d4.kunta_koodi = d3.kunta_koodi --toimipiste
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d5 ON d5.kunta_koodi = d1.kunta_koodi --oppilaitos
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d6 ON d6.kunta_koodi = d2.kunta_koodi --koulutuksen järjestäjä
	LEFT JOIN [ANTERO].[dw].[d_kieli] d7 on d7.id = f.d_kieli_suorituskieli_id
	LEFT JOIN [ANTERO].[dw].[d_kieli] d8 on d8.id = f.d_kieli_aidinkieli_id
	LEFT JOIN [ANTERO].[dw].[d_kalenteri] d9 ON d9.id = f.d_kalenteri_id
	WHERE d2.organisaatio_koodi != '0763403-0' OR (d2.organisaatio_koodi = '0763403-0' AND tilastovuosi < 2022)
	GROUP BY tilastovuosi, d9.kuukausi_fi, d2.organisaatio_fi, d1.organisaatio_fi, d8.kieli_fi, d3.organisaatio_fi, f.oppimaara, f.koulutus, f.tavoitetutkinto, f.d_ika_id, d4.maakunta_fi,
	d5.maakunta_fi, d6.maakunta_fi, d4.kunta_fi, d5.kunta_fi, d6.kunta_fi, d1.postinumero, d2.postinumero, d3.postinumero, d1.katuosoite, d2.katuosoite, d3.katuosoite, d1.oppilaitoksenopetuskieli_fi

UNION

--Ammatillinen netto
SELECT DISTINCT Tilastovuosi = tilastovuosi
	,Tilastokuukausi = d14.kuukausi_fi
	,[pv_kk] = DAY(EOMONTH(MAX(d14.paivays))) 
	,[Koulutuksen järjestäjä] = d15.nimi_amos_spl
	,[Oppilaitos] = d1.organisaatio_fi
	,[Oppilaitoksen opetuskieli] = d1.oppilaitoksenopetuskieli_fi
	,[Opiskelijan äidinkieli] = d10.kieli_fi
	,[Toimipisteen maakunta] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d6.maakunta_fi  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d5.maakunta_fi
			else d4.maakunta_fi
		end
	,[Toimipisteen kunta] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d6.kunta_fi  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d5.kunta_fi
			else d4.kunta_fi
		end
	,[Oppilaitoksen maakunta] =
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d6.maakunta_fi    
			else d5.maakunta_fi
		end
	,[Oppilaitoksen kunta] = 
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d6.kunta_fi    
			else d5.kunta_fi
		end
	,[Koulutuksen järjestäjän maakunta] = d6.maakunta_fi
	,[Koulutuksen järjestäjän kunta] = d6.kunta_fi
	,Toimipiste = d3.organisaatio_fi
	,[Toimipisteen postinumero] =
		case 
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d2.postinumero  
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d1.postinumero 
			else d3.postinumero
		end
	,[Toimipisteen katuosoite] =
		case
			when (d3.postinumero IS NULL OR d3.postinumero = '00000') AND (d1.postinumero IS NULL OR d1.postinumero = '00000') then d2.katuosoite
			when d3.postinumero IS NULL OR d3.postinumero = '00000' then d1.katuosoite
			else d3.katuosoite
		end
	,[Oppilaitoksen postinumero] = 
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d2.postinumero   
			else d1.postinumero
		end
	,[Oppilaitoksen katuosoite] =
		case 
			when d1.postinumero IS NULL OR d1.postinumero = '00000' then d2.katuosoite
			else d1.katuosoite
		end
	,[Koulutuksen järjestäjän postinumero] = d2.postinumero
	,[Koulutuksen järjestäjän katuosoite] = d2.katuosoite
	,[Lukion opetussuunnitelma] = 'Ammatillinen koulutus'
	,[tutkintotyyppi] = 
		case 
			when valmentava_koodi = 1 then 'VALMA' 
			when valmentava_koodi = 2 then 'TELMA' 
			when valmentava_koodi = 3 then 'TUVA' 
			when d12.kytkin_koodi = 1 then 'Muu ammatillinen koulutus' 
			when d11.tutkintotyyppi_fi = 'Ammatilliset perustutkinnot' then 'Ammatillinen perustutkinto'
			when d11.tutkintotyyppi_fi = 'Ammattitutkinnot' then 'Ammattitutkinto'
			when d11.tutkintotyyppi_fi = 'Erikoisammattitutkinnot' then 'Erikoisammattitutkinto'
			else d11.tutkintotyyppi_fi 
		end
	,[Tutkinto/koulutus] =
		case
			when valmentava_koodi = 1 then 'VALMA' 
			when valmentava_koodi = 2 then 'TELMA' 
			when valmentava_koodi = 3 then 'TUVA' 
			else d11.koulutusluokitus_fi
		end
	,[Suorituksen tyyppi] =
		case
			when valmentava_koodi = 1 then 'Valmentava koulutus' 
			when valmentava_koodi = 2 then 'Valmentava koulutus' 
			when valmentava_koodi = 3 then 'Valmentava koulutus'
			when d13.selite_fi = 'Koko tutkinto' then 'Koko ammatillinen tutkinto'
			when d13.selite_fi = 'Tutkinnon osa/osia' then 'Ammatillisen tutkinnon osa/osia'  
			when d13.selite_fi = 'Tutkinnon osaa pienempi kokonaisuus' then 'Ammatillisen tutkinnon osaa pienempi kokonaisuus' 
			else d13.selite_fi
		end
	,[Työvoimakoulutus (ammatillinen)] = d7.kytkin_fi
	,[Oppisopimuskoulutus (ammatillinen)] = d8.kytkin_fi
	,[Erityisopetus (ammatillinen)] = d9.erityisopetus_ryhma_fi
	,[Koulutusala, taso 1] = d11.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d11.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d11.koulutusalataso3_fi
	,[Opiskelijan ikä] =
		case
			when f.d_ika_id = -1 then 'Tieto puuttuu' 
			when f.d_ika_id < 15 then 'Alle 15 vuotta' 
			when f.d_ika_id > 70 then 'Yli 70 vuotta'
			else CAST(f.d_ika_id AS nvarchar(30))
		end
	,[Lukio-/ammatillisen koulutuksen järjestäjä] = 'Ammatillisen koulutuksen järjestäjä'
	,master_oid = null
	,opiskelijat = SUM(opiskelijat)
	,opiskelija_20_9 = null
	,raportti = 'netto'
FROM [ANTERO].[dw].[f_koski_amm_opiskelijat_netto] f
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d1 ON d1.id = f.d_organisaatioluokitus_oppilaitos_id
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2 ON d2.id = f.d_organisaatioluokitus_jarj_id
	LEFT JOIN [ANTERO].[dw].[d_amos_spl_jarjestaja_linkki] d15 ON d15.oid_avain = d2.organisaatio_oid
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d3 ON d3.id = f.d_organisaatioluokitus_toimipiste_id
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d4 ON d4.kunta_koodi = d3.kunta_koodi --toimipiste
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d5 ON d5.kunta_koodi = d1.kunta_koodi --oppilaitos
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d6 ON d6.kunta_koodi = d2.kunta_koodi --koulutuksen järjestäjä
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d7 ON d7.id = f.d_kytkin_tyovoimakoulutus_id
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d8 ON d8.id = f.d_kytkin_oppisopimuskoulutus_id
	LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d9 on d9.id = f.d_erityisopetus_id
	LEFT JOIN [ANTERO].[dw].[d_kieli] d10 on d10.id = f.d_kieli_aidinkieli_id
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d11 ON d11.id = f.d_koulutusluokitus_id
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d12 ON d12.id = f.d_kytkin_muu_ammatillinen_id
	LEFT JOIN [ANTERO].[dw].[d_suorituksen_tyyppi] d13 ON d13.id = f.d_suorituksen_tyyppi_id
	LEFT JOIN [ANTERO].[dw].[d_kalenteri] d14 ON d14.id = f.d_kalenteri_id
	WHERE d2.organisaatio_koodi != '0763403-0' OR (d2.organisaatio_koodi = '0763403-0' AND tilastovuosi < 2022)
	GROUP BY tilastovuosi, d14.kuukausi_fi, d15.nimi_amos_spl, d1.organisaatio_fi, d10.kieli_fi, d4.maakunta_fi, d5.maakunta_fi, d6.maakunta_fi, d4.kunta_fi, d5.kunta_fi, d6.kunta_fi,
	d3.organisaatio_fi, valmentava_koodi, d12.kytkin_koodi, d11.tutkintotyyppi_fi, d11.koulutusluokitus_fi, d13.selite_fi, d7.kytkin_fi, d8.kytkin_fi, d9.erityisopetus_ryhma_fi, d11.koulutusalataso1_fi,
	d11.koulutusalataso2_fi, d11.koulutusalataso3_fi, d_ika_id, d1.postinumero, d2.postinumero, d3.postinumero, d1.katuosoite, d2.katuosoite, d3.katuosoite, d1.oppilaitoksenopetuskieli_fi)p


GO

