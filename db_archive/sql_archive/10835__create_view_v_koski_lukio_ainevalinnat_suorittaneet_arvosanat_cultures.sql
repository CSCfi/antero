USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_koski_lukio_ainevalinnat_suorittaneet_arvosanat_cultures] AS

/*
Huom. 
- Muodostettu näkymästä v_koski_lukio_ainevalinnat_suorittaneet_cultures poiskommentoimalla moduulien/kurssien tiedot.
- Lisätty oppiaineen/oppimäärän arvosana ja matematiikan pitkä oppimäärä (jos alkaa tökkiä, siirretään aiempaan vaiheeseen - kuutiokehitystä vapauta 'testilataus').
- Jos lisätään oppiaine-/kurssimuuttujia, nämä huomioitava lukion oppimäärän suorittaneiden mittarin all-ehdoissa.
*/

SELECT DISTINCT --TOP 1000

	--apusarakkeet
	apusarake_paatason_suoritus_id = paatason_suoritus_id
	,apusarake_osasuoritus_id = osasuoritus_id
	,apusarake_aine_S_arvosana_0_1 = aine_S_arvosana_0_1
	/*
	,apusarake_moduulien_kurssien_laajuus = kurssit_laajuus
	,apusarake_moduulien_kurssien_S_arvosanat_laajuus = kurssit_S_arvosanat_laajuus
	*/

	,lukuvuosi

	--FI
	,lukukausi_fi = 
		case lukukausi 
			when 'k' then 'Kevät' --'Vår'
			when 's' then 'Syksy' --'Höst'
		end
	
	,[sukupuoli_fi] = d9.sukupuoli_fi
	,[ikaryhma_fi] = d10.ikaryhma2_fi
	,[aidinkieli_fi] = d11.kieliryhma2_fi
	,[kansalaisuus_fi] = 
		case kansalaisuus 
			when '246' then 'Suomi' --'Finland'
			when '999' then 'Tuntematon' --'Okänd'
			else 'Muu' --'Övrig'
		end
	,[opiskeltujen_kielten_maara_fi] = 
		case 
			when kielet_lkm = 1 then '1 kieli' --'1 språk'
			when kielet_lkm < 6 then cast(kielet_lkm as nvarchar(1)) + ' kieltä' --' språk'
			else '6 kieltä tai enemmän' --'6 språk eller mera'
		end
	,[matematiikan_pitka_oppimaara_fi] = --'testilataus'
		case max(case when d5.ryhma_koodi = 'luo' and d5.koodi = 'MAA' then 1 else 0 end) over(partition by [paatason_suoritus_id])
			when 1 then 'Pitkän matematiikan suorittanut' --'Har avlagt lång matematik'
			when 0 then 'Ei pitkää matematiikkaa suorittanut' --'Har inte avlagt lång matematik'
		end

	,[ops_n_voimaantulo_fi] = ops_voimaantulo --case when ops_voimaantulo = '1.8.2021' then ops_voimaantulo else 'Annat än 1.8.2021' end
    ,[lukion_oppimaara_fi] = 
		case lukionoppimaara 
			when 'nuortenops' then 'Nuorten OPS' --'Läroplan för unga'
			when 'aikuistenops' then 'Aikuisten OPS' --'Läroplan för vuxna'
		end
    ,[lukion_oppimaaran_suorituskieli_fi] = d3.suorituskieli_yleissivistava_fi
	,[oppiaineryhma_fi] = d5.ryhma_nimi --oppimäärästä/kielestä, koska erottelu toinen kotimainen vs. vieraat
    ,[oppiaine_tai_oppimaara_fi] = d4.nimi
    ,[oppimaara_tai_kieli_fi] = d5.nimi
    ,[oppiaineen_tai_oppimaaran_suorituskieli_fi] = d6.suorituskieli_yleissivistava_fi
	,[oppiaineen_tai_oppimaaran_arvosana_fi] = aine_arvosana
	/*
    ,[oppiaineen_tai_oppimaaran_laajuus_fi] = replace(ltrim(str(case when d13.koodiarvo = 2 then 1.0 else 2.0 end * aine_laajuus, 4, 1)), '.', ',') + ' op' --' sp'
    ,[opintopisteet_per_moduulin_kurssin_ops_ja_tyyppi_fi] = replace(ltrim(str(kurssit_laajuus_all_suorituskieli, 4, 1)), '.', ',') + ' op' --' sp'
	,[moduulin_kurssin_ops_fi] = 
		case kurssi_paikallinen_OPS_0_1 
			when 1 then 'Paikallinen' --'Lokal'
			when 0 then 'Valtakunnallinen' --'Riksomfattande'
			else 'Tieto puuttuu' --'Information saknas'
		end
	,[moduulin_kurssin_tyyppi_fi] = 
		case 
			when kurssi_tyyppi = 'pakollinen' or kurssi_pakollinen_0_1 = 1 then 'Pakollinen' --'Obligatorisk'
			when kurssi_tyyppi = 'syventava' then 'Syventävä (ei LOPS21)' --'Fördjupad (ej GLP21)'
			when kurssi_tyyppi = 'soveltava' then 'Soveltava (ei LOPS21)' --'Tillämpad (ej GLP21)'
			when kurssi_pakollinen_0_1 = 0 then 'Valinnainen' --'Valfri'
			else 'Tieto puuttuu' --'Information saknas'
		end
    ,[moduulin_kurssin_suorituskieli_fi] = coalesce(d8.suorituskieli_yleissivistava_fi, 'Tieto puuttuu') --'Information saknas'
	*/

	,[oppilaitoksen_opetuskieli_fi] = d0a.oppilaitoksenopetuskieli_fi
	,[oppilaitos_fi] = d0a.organisaatio_fi
	,[oppilaitoksen_kunta_fi] = d2a.kunta_fi
	,[oppilaitoksen_kuntaryhma_fi] = d2a.kuntaryhma_fi
	,[oppilaitoksen_maakunta_fi] = d2a.maakunta_fi
	,[koulutuksen_jarjestaja_fi] = d0b.organisaatio_fi
	,[koulutuksen_jarjestajan_kunta_fi] = d2b.kunta_fi
	,[koulutuksen_jarjestajan_maakunta_fi] = d2b.maakunta_fi

	--SV
	,lukukausi_sv = 
		case lukukausi 
			when 'k' then 'Vår'
			when 's' then 'Höst'
		end
	
	,[sukupuoli_sv] = d9.sukupuoli_sv
	,[ikaryhma_sv] = d10.ikaryhma2_sv
	,[aidinkieli_sv] = d11.kieliryhma2_sv
	,[kansalaisuus_sv] = 
		case kansalaisuus 
			when '246' then 'Finland'
			when '999' then 'Okänd'
			else 'Övrig'
		end
	,[opiskeltujen_kielten_maara_sv] = 
		case 
			when kielet_lkm = 1 then '1 språk'
			when kielet_lkm < 6 then cast(kielet_lkm as nvarchar(1)) + ' språk'
			else '6 språk eller mera'
		end
	,[matematiikan_pitka_oppimaara_sv] = --'testilataus'
		case max(case when d5.ryhma_koodi = 'luo' and d5.koodi = 'MAA' then 1 else 0 end) over(partition by [paatason_suoritus_id])
			when 1 then 'Har avlagt lång matematik'
			when 0 then 'Har inte avlagt lång matematik'
		end

	,[ops_n_voimaantulo_sv] = 
		case 
			when ops_voimaantulo = '1.8.2021' then ops_voimaantulo 
			else 'Annat än 1.8.2021' 
		end
    ,[lukion_oppimaara_sv] = 
		case lukionoppimaara 
			when 'nuortenops' then 'Läroplan för unga'
			when 'aikuistenops' then 'Läroplan för vuxna'
		end
    ,[lukion_oppimaaran_suorituskieli_sv] = d3.suorituskieli_yleissivistava_sv
	,[oppiaineryhma_sv] = d5.ryhma_nimi_sv --oppimäärästä/kielestä, koska erottelu toinen kotimainen vs. vieraat
    ,[oppiaine_tai_oppimaara_sv] = d4.nimi_sv
    ,[oppimaara_tai_kieli_sv] = d5.nimi_sv
    ,[oppiaineen_tai_oppimaaran_suorituskieli_sv] = d6.suorituskieli_yleissivistava_sv
	,[oppiaineen_tai_oppimaaran_arvosana_sv] = aine_arvosana
    /*
	,[oppiaineen_tai_oppimaaran_laajuus_sv] = replace(ltrim(str(case when d13.koodiarvo = 2 then 1.0 else 2.0 end * aine_laajuus, 4, 1)), '.', ',') + ' sp'
    ,[opintopisteet_per_moduulin_kurssin_ops_ja_tyyppi_sv] = replace(ltrim(str(kurssit_laajuus_all_suorituskieli, 4, 1)), '.', ',') + ' sp'
	,[moduulin_kurssin_ops_sv] = 
		case kurssi_paikallinen_OPS_0_1 
			when 1 then 'Lokal'
			when 0 then 'Riksomfattande'
			else 'Information saknas'
		end
	,[moduulin_kurssin_tyyppi_sv] = 
		case 
			when kurssi_tyyppi = 'pakollinen' or kurssi_pakollinen_0_1 = 1 then 'Obligatorisk'
			when kurssi_tyyppi = 'syventava' then 'Fördjupad (ej GLP21)'
			when kurssi_tyyppi = 'soveltava' then 'Tillämpad (ej GLP21)'
			when kurssi_pakollinen_0_1 = 0 then 'Valfri'
			else 'Information saknas'
		end
    ,[moduulin_kurssin_suorituskieli_sv] = coalesce(d8.suorituskieli_yleissivistava_sv, 'Information saknas')
	*/

	,[oppilaitoksen_opetuskieli_sv] = d0a.oppilaitoksenopetuskieli_sv
	,[oppilaitos_sv] = d0a.organisaatio_sv
	,[oppilaitoksen_kunta_sv] = d2a.kunta_sv
	,[oppilaitoksen_kuntaryhma_sv] = d2a.kuntaryhma_sv
	,[oppilaitoksen_maakunta_sv] = d2a.maakunta_sv
	,[koulutuksen_jarjestaja_sv] = d0b.organisaatio_sv
	,[koulutuksen_jarjestajan_kunta_sv] = d2b.kunta_sv
	,[koulutuksen_jarjestajan_maakunta_sv] = d2b.maakunta_sv

	--koodit
	,[koodit_oppilaitos] = d0a.organisaatio_koodi
	,[koodit_koulutuksen_jarjestaja] = d0b.organisaatio_koodi
	
	--jarjestykset
	,jarjestys_lukukausi = 
		case lukukausi 
			when 'k' then 2
			when 's' then 1
		end
	,[jarjestys_ikaryhma] = d10.jarjestys_ikaryhma2
	,[jarjestys_aidinkieli] = coalesce(d11.jarjestys_kieliryhma2, 9999)
	,[jarjestys_kansalaisuus] = case when kansalaisuus in ('246','999') then kansalaisuus else '666' end
	,[jarjestys_opiskeltujen_kielten_maara] = kielet_lkm
    ,[jarjestys_lukion_oppimaara] = 
		case lukionoppimaara 
			when 'nuortenops' then 1
			when 'aikuistenops' then 2
		end
	,[jarjestys_oppiaineryhma] = coalesce(d5.jarjestys_ryhma, 9999)
	,[jarjestys_oppiaine_tai_oppimaara] = coalesce(d4.jarjestys, 9999)
	,[jarjestys_oppimaara_tai_kieli] = coalesce(d5.jarjestys, 9999)
	,[jarjestys_oppiaineen_tai_oppimaaran_arvosana] = case when isnumeric(aine_arvosana) = 0 then 11 else aine_arvosana end --huom. käytetään myös kuution mittarissa
	/*
    ,[jarjestys_oppiaineen_tai_oppimaaran_laajuus] = cast(case when d13.koodiarvo = '2' then 1.0 else 2.0 end * aine_laajuus as decimal(4,1))
    ,[jarjestys_opintopisteet_per_moduulin_kurssin_ops_ja_tyyppi] = cast(kurssit_laajuus_all_suorituskieli as decimal(4,1))
	,[jarjestys_moduulin_kurssin_ops] = coalesce(kurssi_paikallinen_OPS_0_1, 9)
	,[jarjestys_moduulin_kurssin_tyyppi] =
		case 
			when kurssi_tyyppi = 'pakollinen' or kurssi_pakollinen_0_1 = 1 then 1
			when kurssi_tyyppi = 'syventava' then 2
			when kurssi_tyyppi = 'soveltava' then 3
			when kurssi_pakollinen_0_1 = 0 then 4
			else 9 --'Tieto puuttuu'
		end
	*/
	,[jarjestys_oppilaitoksen_kuntaryhma] = coalesce(d2a.jarjestys_kuntaryhma_koodi, 9999)
	,[jarjestys_oppilaitoksen_maakunta] = coalesce(d2a.jarjestys_maakunta_koodi, 9999)
	,[jarjestys_koulutuksen_jarjestajan_maakunta] = coalesce(d2b.jarjestys_maakunta_koodi, 9999)

FROM VipunenTK_SA.dbo.v_sa_TK_Koski_lukio_ainevalinnat_suorittaneet f
LEFT JOIN dw.d_organisaatioluokitus d0a on d0a.organisaatio_oid = oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d0b on d0b.organisaatio_oid = koulutustoimija_oid
LEFT JOIN dw.d_alueluokitus d2a on d2a.alueluokitus_avain = ('kunta_' + d0a.kunta_koodi) 
LEFT JOIN dw.d_alueluokitus d2b on d2b.alueluokitus_avain = ('kunta_' + d0b.kunta_koodi) 
LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = lukionoppimaara_suorituskieli
LEFT JOIN dw.[d_lukio_oppiaine_ja_oppimaara] d4 on d4.koodi = aine AND d4.koodisto = aine_koodisto
LEFT JOIN dw.[d_lukio_oppiaine_ja_oppimaara] d5 on d5.koodi = aineenoppimaara AND d5.koodisto = aineenoppimaara_koodisto
LEFT JOIN dw.d_kieli d6 on d6.kieli_koodi = aine_suorituskieli
LEFT JOIN dw.d_kieli d8 on d8.kieli_koodi = kurssi_suorituskieli
LEFT JOIN dw.d_sukupuoli d9 on d9.sukupuoli_koodi = sukupuoli
LEFT JOIN dw.d_ika d10 on d10.ika_avain = ika
LEFT JOIN dw.d_kieli d11 on d11.kieli_koodi = aidinkieli
LEFT JOIN dw.d_opintojenlaajuusyksikko d13 on d13.koodiarvo = aine_laajuus_yksikko

WHERE aine not in ('OP','MS') --pois opo ja muut suoritukset
AND aine_arvosana != 'O' --pois vanhat "hyväksytyt" yksittäishavainnot sekä uuden lopsin mukaiset muut opinnot ilman päätason arviointia

GO
