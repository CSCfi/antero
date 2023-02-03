USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_amm_opiskelijat_pbi]    Script Date: 3.2.2023 9:14:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER   VIEW [dw].[v_koski_lukio_amm_opiskelijat_pbi] AS

SELECT Tilastovuosi = vuosi
	,[Koulutuksen järjestäjä] = d2.organisaatio_fi
	,[Oppilaitos] = d1.organisaatio_fi
	,Suorituskieli = d7.kieli_fi
	,[Toimipisteen maakunta] = d4.maakunta_fi
	,[Toimipisteen kunta] = left(d4.kunta_fi,charindex(' ', d4.kunta_fi))
	,[Oppilaitoksen maakunta] = d5.maakunta_fi
	,[Oppilaitoksen kunta] = left(d5.kunta_fi,charindex(' ', d5.kunta_fi))
	,[Koulutuksen järjestäjän maakunta] = d6.maakunta_fi
	,[Koulutuksen järjestäjän kunta] = left(d6.kunta_fi,charindex(' ', d6.kunta_fi))
	,Toimipiste = d3.organisaatio_fi
	,[Toimipisteen postinumero] = d3.postinumero
	,[Toimipisteen katuosoite] = d3.katuosoite
	,[Oppilaitoksen postinumero] = d1.postinumero
	,[Oppilaitoksen katuosoite] = d1.katuosoite
	,[Koulutuksen järjestäjän postinumero] = d2.postinumero
	,[Koulutuksen järjestäjän katuosoite] = d2.katuosoite
	,[Lukion opetussuunnitelma] =
		case 
			when f.oppimaara = 'Aikuisten oppimäärä' then 'Aikuisten lukiokoulutus' 
			when f.oppimaara = 'Nuorten oppimäärä' then 'Nuorten lukiokoulutus' 
			when f.oppimaara = 'Ulkomainen tutkinto' then 'Ulkomainen lukiokoulutus' 
			else f.oppimaara
		end
	,Tutkintotyyppi = 
		case 
			when f.koulutus = 'Lukiokoulutukseen valmistava koulutus' then 'LUVA' 
			when f.koulutus = 'Tutkintokoulutukseen valmentava koulutus' then 'TUVA' 
			when f.koulutus = 'Yleissivistävä lukiokoulutus' then 'Lukiokoulutus (pl. valmentava)' 
			else f.koulutus
		end
	,Tutkinto =
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
	,[Työvoimakoulutus (ammatillinen)] = 'Lukiokoulutus'
	,[Oppisopimuskoulutus (ammatillinen)] = 'Lukiokoulutus'
	,[Erityisopetus (ammatillinen)] = 'Lukiokoulutus'
	,[Koulutusala, taso 1] = 'Yleissivistävä koulutus'
	,[Koulutusala, taso 2] = 'Yleissivistävä koulutus'
	,[Koulutusala, taso 3] = 'Yleissivistävä koulutus'
	,[Ikä] = Ika
	,[Lukio/ammatillisen koulutuksen järjestäjä] = 'Lukio koulutuksen järjestäjä'
	,oppija_oid
FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_kuukausittain] f
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d1 ON d1.organisaatio_oid = f.oppilaitos_oid
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2 ON d2.organisaatio_oid = d1.ylaorganisaatio_oid
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d3 ON d3.organisaatio_oid = f.toimipiste_oid
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d4 ON d4.kunta_koodi = d3.kunta_koodi --toimipiste
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d5 ON d5.kunta_koodi = d1.kunta_koodi --oppilatos
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d6 ON d6.kunta_koodi = d2.kunta_koodi --koulutuksen järjestäjä
	LEFT JOIN [ANTERO].[dw].[d_kieli] d7 on d7.kieli_koodi = f.suorituskieli_koodiarvo
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] AS d8 ON  d8.koulutusluokitus_koodi = f.koulutustoimija_oid

UNION

SELECT tilastovuosi
	,[Koulutuksen järjestäjä] = d2.organisaatio_fi
	,[Oppilaitos] = d1.organisaatio_fi
	,Suorituskieli = d10.kieli_fi
	,[Toimipisteen maakunta] = d4.maakunta_fi
	,[Toimipisteen kunta] = left(d4.kunta_fi,charindex(' ', d4.kunta_fi))
	,[Oppilaitoksen maakunta] = d5.maakunta_fi
	,[Oppilaitoksen kunta] = left(d5.kunta_fi,charindex(' ', d5.kunta_fi))
	,[Koulutuksen järjestäjän maakunta] = d6.maakunta_fi
	,[Koulutuksen järjestäjän kunta] = left(d6.kunta_fi,charindex(' ', d6.kunta_fi))
	,Toimipiste = d3.organisaatio_fi
	,[Toimipisteen postinumero] = d3.postinumero
	,[Toimipisteen katuosoite] = d3.katuosoite
	,[Oppilaitoksen postinumero] = d1.postinumero
	,[Oppilaitoksen katuosoite] = d1.katuosoite
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
	,Tutkinto =
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
	,[Ikä] = d_ika_id
	,[Lukio/ammatillisen koulutuksen järjestäjä] = 'Ammatillisen koulutuksen järjestäjä'
	,oppija_oid
FROM [ANTERO].[dw].[f_koski_amm_opiskelijat] f
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d1 ON d1.id = f.d_organisaatioluokitus_oppilaitos_id
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2 ON d2.organisaatio_oid = d1.ylaorganisaatio_oid
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d3 ON d3.id = f.d_organisaatioluokitus_toimipiste_id
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d4 ON d4.kunta_koodi = d3.kunta_koodi --toimipiste
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d5 ON d5.kunta_koodi = d1.kunta_koodi --oppilatos
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d6 ON d6.kunta_koodi = d2.kunta_koodi --koulutuksen järjestäjä
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d7 ON d7.id = f.d_kytkin_tyovoimakoulutus_id
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d8 ON d8.id = f.d_kytkin_oppisopimuskoulutus_id
	LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d9 on d9.id = f.d_erityisopetus_id
	LEFT JOIN [ANTERO].[dw].[d_kieli] d10 on d10.id = f.d_kieli_suorituskieli_id
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d11 ON d11.id = f.d_koulutusluokitus_id
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d12 ON d12.id = f.d_kytkin_muu_ammatillinen_id
	LEFT JOIN [ANTERO].[dw].[d_suorituksen_tyyppi] d13 ON d13.id = f.d_suorituksen_tyyppi_id







GO


USE [ANTERO]