USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_koski_lukio_ainevalinnat_kurssit_cultures] AS

SELECT --TOP 1000

	--apusarakkeet
	apusarake_paatason_suoritus_id = [paatason_suoritus_id]
	,apusarake_ylempi_osasuoritus_id = [ylempi_osasuoritus_id]
	,apusarake_lkm = [lkm]
	,apusarake_katsomusaine_suoritettu_1_0 = katsomusaine_suoritettu_1_0
	,apusarake_katsomusaineet_piilosuodatin_1_0 = case when tilastovuosi > 2023 then 1 else 0 end

	,lukuvuosi

	--FI
	,lukukausi_fi = 
		case lukukausi 
			when 'k' then 'Kevät' --'Vår'
			when 's' then 'Syksy' --'Höst'
		end
	
	,[sukupuoli_fi] = d9.sukupuoli_fi

	,[ops_n_voimaantulo_fi] = ops_voimaantulo --case when ops_voimaantulo = '1.8.2021' then ops_voimaantulo else 'Annat än 1.8.2021' end
    ,[lukion_oppimaara_fi] = 
		case lukionoppimaara 
			when 'nuortenops' then 'Nuorten OPS' --'Läroplan för unga'
			when 'aikuistenops' then 'Aikuisten OPS' --'Läroplan för vuxna'
		end
    ,[lukion_oppimaaran_suorituskieli_fi] = d3.suorituskieli_yleissivistava_fi	
	,[oppiaineryhma_fi] = coalesce(d5.ryhma_nimi, 'Tieto puuttuu') --oppimäärästä/kielestä, koska erottelu toinen kotimainen vs. vieraat
    ,[oppiaineen_tai_oppimaaran_suorituskieli_fi] = d6.suorituskieli_yleissivistava_fi
    ,[oppiaine_tai_oppimaara_fi] = 
		case 
			when d4.ryhma_koodi in ('toi','kie') and d4.nimi like '%,%' then left(d4.nimi, CHARINDEX(',', d4.nimi) - 1) --poistetaan lopusta ", väh./alle X .."
			else coalesce(d4.nimi, 'Tieto puuttuu')
		end
    ,[oppimaara_tai_kieli_fi] = coalesce(d5.nimi, 'Tieto puuttuu')
	,[katsomusaine_fi] = case when katsomusaineen_oppimaara_koodisto is not null then d4.nimi else 'Tieto puuttuu' end
    ,[katsomusaineen_oppimaara_fi] = 
		case 
			when katsomusaineen_oppimaara_koodisto is not null then coalesce(d5b.nimi, 'Katsomusaineen oppimäärää ei ole tiedossa') --'Ingen information om lärokursen i religion eller livsåskådningskunskap'
			else 'Ei katsomusaineen suoritusta' --'Inga prestationer i religion eller livsåskådningskunskap'
		end
	,[moduuli_kurssi_fi] = case when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'Tieto puuttuu (paikallinen OPS)' else kurssi + ' ' + d13.nimi end
	,[moduulin_kurssin_koodi_fi] = case when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'Tieto puuttuu (paikallinen OPS)' else kurssi end
	,[moduulin_kurssin_nimi_fi] = case when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'Tieto puuttuu (paikallinen OPS)' else d13.nimi end
	,[moduulin_kurssin_ops_fi] = 
		case 
			when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'Paikallinen' --'Lokal'
			when kurssi_paikallinen_OPS_0_1 = 0 then 'Valtakunnallinen' --'Riksomfattande'
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
	,[moduulin_kurssin_arvosana_fi] = kurssi_arvosana
 
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
			when 'k' then 'Kevät' --'Vår'
			when 's' then 'Syksy' --'Höst'
		end
	
	,[sukupuoli_sv] = d9.sukupuoli_sv

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
	,[oppiaineryhma_sv] = coalesce(d5.ryhma_nimi_sv, 'Information saknas') --oppimäärästä/kielestä, koska erottelu toinen kotimainen vs. vieraat
    ,[oppiaineen_tai_oppimaaran_suorituskieli_sv] = d6.suorituskieli_yleissivistava_sv
    ,[oppiaine_tai_oppimaara_sv] = 
		case 
			when d4.ryhma_koodi in ('toi','kie') and d4.nimi_sv like '%,%' then left(d4.nimi_sv, CHARINDEX(',', d4.nimi_sv) - 1) --poistetaan lopusta ", väh./alle X .."
			else coalesce(d4.nimi_sv, 'Information saknas')
		end
    ,[oppimaara_tai_kieli_sv] = coalesce(d5.nimi_sv, 'Information saknas')
	,[katsomusaine_sv] = case when katsomusaineen_oppimaara_koodisto is not null then d4.nimi_sv else 'Information saknas' end
    ,[katsomusaineen_oppimaara_sv] = 
		case 
			when katsomusaineen_oppimaara_koodisto is not null then coalesce(d5b.nimi_sv, 'Ingen information om lärokursen i religion eller livsåskådningskunskap')
			else 'Inga prestationer i religion eller livsåskådningskunskap'
		end
	,[moduuli_kurssi_sv] = case when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'Information saknas (lokal LP)' else kurssi + ' ' + d13.nimi_sv end
	,[moduulin_kurssin_koodi_sv] = case when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'Information saknas (lokal LP)' else kurssi end
	,[moduulin_kurssin_nimi_sv] = case when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'Information saknas (lokal LP)' else d13.nimi_sv end
	,[moduulin_kurssin_ops_sv] = 
		case 
			when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'Lokal'
			when kurssi_paikallinen_OPS_0_1 = 0 then 'Riksomfattande'
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
	,[moduulin_kurssin_arvosana_sv] = kurssi_arvosana
 
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
    ,[jarjestys_lukion_oppimaara] = 
		case lukionoppimaara 
			when 'nuortenops' then 1
			when 'aikuistenops' then 2
		end
	,[jarjestys_oppiaineryhma] = coalesce(d5.jarjestys_ryhma, 9999)
	,[jarjestys_oppiaine_tai_oppimaara] = coalesce(d4.jarjestys, 9999)
	,[jarjestys_oppimaara_tai_kieli] = coalesce(d5.jarjestys, 9999)
	,[jarjestys_katsomusaineen_oppimaara] = coalesce(d5b.jarjestys, 9999) - case when katsomusaineen_oppimaara_koodisto is not null then 1 else 0 end
	,[jarjestys_moduuli_kurssi] = concat(case when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'öööö' else d13.jarjestys end, '_', d13.nimi)
	,[jarjestys_moduulin_kurssin_koodi] = case when kurssi_paikallinen_OPS_0_1 = 1 or d13.id is null then 'ööö' else d13.jarjestys end
	,[jarjestys_moduulin_kurssin_ops] = coalesce(kurssi_paikallinen_OPS_0_1, 9)
	,[jarjestys_moduulin_kurssin_tyyppi] =
		case 
			when kurssi_tyyppi = 'pakollinen' or kurssi_pakollinen_0_1 = 1 then 1
			when kurssi_tyyppi = 'syventava' then 2
			when kurssi_tyyppi = 'soveltava' then 3
			when kurssi_pakollinen_0_1 = 0 then 4
			else 9
		end
	,[jarjestys_moduulin_kurssin_arvosana] = case when isnumeric(kurssi_arvosana) = 0 then 11 else kurssi_arvosana end
	,[jarjestys_oppilaitoksen_kuntaryhma] = coalesce(d2a.jarjestys_kuntaryhma_koodi, 9999)
	,[jarjestys_oppilaitoksen_maakunta] = coalesce(d2a.jarjestys_maakunta_koodi, 9999)
	,[jarjestys_koulutuksen_jarjestajan_maakunta] = coalesce(d2b.jarjestys_maakunta_koodi, 9999)

FROM VipunenTK_SA.dbo.v_sa_TK_Koski_lukio_ainevalinnat_kurssit f
LEFT JOIN dw.d_organisaatioluokitus d0a ON d0a.organisaatio_oid = oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d0b ON d0b.organisaatio_oid = koulutustoimija_oid
LEFT JOIN dw.d_alueluokitus d2a on d2a.alueluokitus_avain = ('kunta_' + d0a.kunta_koodi) 
LEFT JOIN dw.d_alueluokitus d2b on d2b.alueluokitus_avain = ('kunta_' + d0b.kunta_koodi) 
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = lukionoppimaara_suorituskieli
LEFT JOIN dw.d_lukio_oppiaine_ja_oppimaara d4 ON d4.koodi = aine AND d4.koodisto = aine_koodisto
LEFT JOIN dw.d_lukio_oppiaine_ja_oppimaara d5 ON d5.koodi = aineenoppimaara AND d5.koodisto = aineenoppimaara_koodisto
LEFT JOIN dw.d_lukio_oppiaine_ja_oppimaara d5b ON d5b.koodi = katsomusaineen_oppimaara AND d5b.koodisto = katsomusaineen_oppimaara_koodisto
LEFT JOIN dw.d_kieli d6 ON d6.kieli_koodi = aine_suorituskieli
LEFT JOIN dw.d_kieli d8 ON d8.kieli_koodi = kurssi_suorituskieli
LEFT JOIN dw.d_sukupuoli d9 ON d9.sukupuoli_koodi = sukupuoli
LEFT JOIN dw.d_lukio_kurssit_ja_moduulit d13 ON d13.koodisto = kurssi_koodisto AND d13.koodi = kurssi

WHERE kurssi_arvosana != 'O'

GO
