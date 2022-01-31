USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_perusopetus_ainevalinnat_ja_arvosanat]    Script Date: 31.1.2022 10:31:23 ******/
DROP VIEW IF EXISTS [dw].[v_koski_perusopetus_ainevalinnat_ja_arvosanat]
GO

/****** Object:  View [dw].[v_koski_perusopetus_ainevalinnat_ja_arvosanat]    Script Date: 31.1.2022 10:31:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dw].[v_koski_perusopetus_ainevalinnat_ja_arvosanat] AS

SELECT 

	[Lukuvuosi]

	,oppilaitos_oid
	,paatason_suoritus_id
	,osasuoritus_id

  --lk
	,Vuosiluokka = case when left(d9.vuosiluokka_fi, 1) <> '9' then d9.vuosiluokka_fi else d9.vuosiluokka_fi + ' (päättötodistus)' end
	,[Vuosiluokka (ryhmä)] = d9.vuosiluokkaryhma_fi
	,[Opiskeltujen kielten määrä] = 
		case 
			when kielet_lkm = 1 then '1 kieli' 
			when kielet_lkm < 6 then cast(kielet_lkm as nvarchar(1)) + ' kieltä' 
			else '6 kieltä tai enemmän'
		end

  --aine
	,[Oppiaineryhmä] = d16.ryhma_nimi
	,[Oppiaineryhmä II] = d17.ryhma2_nimi 
    ,[Oppiaine] = case when d16.ryhma_koodi <> 'usk' then d16.nimi else d16.ryhma_nimi end
	,[Oppimäärä tai kieli] = case when d17.ryhma_koodi <> 'usk' then d17.nimi else d17.ryhma_nimi end

  --aiemmin/dimensioon?
    ,[Oppiaineen laajuus] = --replace(ltrim(str(k.koulutusmoduuli_laajuus_arvo,4,1)), '.', ',') + ' ' + d18.nimi
	/*,[Oppiaineen laajuus (0,5 vvt)] = 
		case 
			when k.koulutusmoduuli_laajuus_arvo >= 100 then replace(ltrim(str(k.koulutusmoduuli_laajuus_arvo,4,1)), '.', ',') + ' ' + d18.nimi
			else replace(ltrim(str(cast(2*k.koulutusmoduuli_laajuus_arvo as int) * 0.5, 4, 1)), '.', ',') + ' - ' 
				+ replace(ltrim(str(cast(2*k.koulutusmoduuli_laajuus_arvo as int) * 0.5 + 0.4, 4, 1)), '.', ',') + ' ' + d18.nimi
		end
	,[Oppiaineen laajuus (1,0 vvt)] = */
		case 
			when k.koulutusmoduuli_laajuus_arvo >= 100 then replace(ltrim(str(k.koulutusmoduuli_laajuus_arvo,4,1)), '.', ',') + ' ' + d18.nimi
			else replace(ltrim(str(cast(1*k.koulutusmoduuli_laajuus_arvo as int) * 1.0, 4, 1)), '.', ',') + ' - ' 
				+ replace(ltrim(str(cast(1*k.koulutusmoduuli_laajuus_arvo as int) * 1.0 + 0.9, 4, 1)), '.', ',') + ' ' + d18.nimi
		end
	,koulutusmoduuli_laajuus_arvo =
		case 
			when k.koulutusmoduuli_laajuus_arvo >= 100 then ltrim(str(k.koulutusmoduuli_laajuus_arvo,4,1))
			else ltrim(str(cast(1*k.koulutusmoduuli_laajuus_arvo as int) * 1.0, 4, 1))
		end

	,[Pakollinen/Valinnainen] = case koulutusmoduuli_pakollinen when 1 then ' Pakollinen' when 0 then ' Valinnainen' else 'Ei tietoa' end
	,[Arvosana] = case when aineen_arvosana <> 'S' then aineen_arvosana else 'Hyväksytty' end

  --hlö
	,[Sukupuoli] = case d2.sukupuoli_koodi when '1' then 'Pojat' when '2' then 'Tytöt' else 'Tieto puuttuu' end
	,[Ikä] = d4.ika_fi
	--,[Ikäryhmä] = d4.ikaryhma2_fi
	,[Äidinkieli] = d3.kieli_fi
	,[Äidinkieli (ryhmä)] = d3.kieliryhma1_fi
	,[Kansalaisuus] = d5.maatjavaltiot2_fi
	,[Kansalaisuus (ryhmä)] = case kansalaisuus when '246' then 'Suomi' when '999' then 'Tuntematon' else 'Muu' end
	
  --org
    ,[Oppilaitosnumero] = d12.organisaatio_koodi
	,[Oppilaitos] = d12.organisaatio_fi
	,[Oppilaitoksen kunta] = d14.kunta_fi
	,[Oppilaitoksen maakunta] = d14.maakunta_fi
	,[Oppilaitoksen AVI] = d14.avi_fi
	,[Oppilaitoksen ELY] = d14.ely_fi
	,[Oppilaitoksen opetuskieli] = d12.oppilaitoksenopetuskieli_fi
	,[Oppilaitostyyppi] = d12.oppilaitostyyppi_fi

	,[Opetuksen järjestäjä] = d13.organisaatio_fi
	,[Opet. järjestäjän kunta] = d15.kunta_fi
	,[Opet. järjestäjän maakunta] = d15.maakunta_fi
	,[Opet. järjestäjän AVI] = d15.avi_fi
	,[Opet. järjestäjän ELY] = d15.ely_fi
	,[Opet. järjestäjän yritysmuoto] = d13.koulutuksen_jarjestajan_yritysmuoto

	,[Toimipiste] = d11.organisaatio_fi
	
  --jarj
	,[jarj_oppiaineryhma] = d16.jarjestys_ryhma
	,[jarj_oppiaineryhma_II] = d16.jarjestys_ryhma2
	,[jarj_oppiaine] = d16.jarjestys
	,[jarj_oppimaara_tai_kieli] = d17.jarjestys

	,[jarj_arvosana] = case when isnumeric(aineen_arvosana) = 0 then 11 else aineen_arvosana end
	
	,[jarj_sukupuoli] = d2.jarjestys_sukupuoli_koodi
	,[jarj_ika] = d4.jarjestys_ika
	,[jarj_aidinkieli_ryhma] = d3.jarjestys_kieliryhma1
	,[jarj_kansalaisuus_ryhma] = case when kansalaisuus in ('246','999') then kansalaisuus else '666' end
	
	,[jarj_oppilaitoksen_maakunta] = d14.jarjestys_maakunta_koodi
	,[jarj_oppilaitoksen_avi] = d14.jarjestys_avi_koodi
	,[jarj_oppilaitoksen_ely] = d14.jarjestys_ely_koodi
	,[jarj_oppilaitoksen_opetuskieli] = d12.jarjestys_oppilaitoksenopetuskieli_koodi
	,[jarj_oppilaitostyyppi] = d12.jarjestys_oppilaitostyyppi_koodi

	,[jarj_opetutuksen_jarjestajan_maakunta] = d15.jarjestys_maakunta_koodi
	,[jarj_opetutuksen_jarjestajan_avi] = d15.jarjestys_avi_koodi
	,[jarj_opetutuksen_jarjestajan_ely] = d15.jarjestys_ely_koodi

	FROM dw.f_koski_perusopetus_ainevalinnat k
	LEFT JOIN dw.d_sukupuoli d2 ON d2.id = k.d_sukupuoli_id
	LEFT JOIN dw.d_kieli d3 ON d3.id = k.d_kieli_aidinkieli_id
	LEFT JOIN dw.d_ika d4 ON d4.id = k.d_ika_id
	LEFT JOIN dw.d_maatjavaltiot2 d5 ON d5.id = k.d_maatjavaltiot2_kansalaisuus_id
	LEFT JOIN dw.d_vuosiluokka_tai_koulutus d9 ON d9.id = k.d_vuosiluokka_id
	LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = k.d_organisaatioluokitus_toimipiste_id
	LEFT JOIN dw.d_organisaatioluokitus d12 ON d12.id = k.d_organisaatioluokitus_oppilaitos_id
	LEFT JOIN dw.d_organisaatioluokitus d13 ON d13.id = k.d_organisaatioluokitus_jarjestaja_id
	LEFT JOIN dw.d_alueluokitus d14 on d14.id = k.d_alueluokitus_oppilaitos_id
	LEFT JOIN dw.d_alueluokitus d15 on d15.id = k.d_alueluokitus_jarj_id
	LEFT JOIN dw.d_perusopetus_oppiaine_ja_oppimaara d16 on d16.id = k.d_oppiaine_ja_oppimaara_aine_id
	LEFT JOIN dw.d_perusopetus_oppiaine_ja_oppimaara d17 on d17.id = k.d_oppiaine_ja_oppimaara_maara_id
	LEFT JOIN dw.d_opintojenlaajuusyksikko d18 on d18.id = k.d_opintojenlaajuusyksikko_id

	WHERE d16.koodi not in ('B3','FI','PS','OP','OPA') 
	--pyynnöstä rajattu vääriä (B3,FI,PS) tai puutteellisia (opo) valtakunnallisia





GO


