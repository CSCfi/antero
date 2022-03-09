USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_perusopetus_ainevalinnat_ja_arvosanat_cultures]    Script Date: 9.2.2022 10:33:41 ******/
DROP VIEW IF EXISTS [dw].[v_koski_perusopetus_ainevalinnat_ja_arvosanat_cultures]
GO

/****** Object:  View [dw].[v_koski_perusopetus_ainevalinnat_ja_arvosanat_cultures]    Script Date: 9.2.2022 10:33:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dw].[v_koski_perusopetus_ainevalinnat_ja_arvosanat_cultures] AS

SELECT 
  
  --apu
	 apusarake_oppilaitos_oid = oppilaitos_oid
	,apusarake_paatason_suoritus_id = paatason_suoritus_id
	,apusarake_osasuoritus_id = osasuoritus_id

  --aika
	,[lukuvuosi_fi] = Lukuvuosi

  --hlö
	,[sukupuoli_fi] = case d2.sukupuoli_koodi when '1' then 'Pojat' when '2' then 'Tytöt' else 'Tieto puuttuu' end
	,[ika_fi] = d4.ika_fi
	,[aidinkieli_fi] = d3.kieli_fi
	,[aidinkieli_ryhma_fi] = d3.kieliryhma1_fi
	,[kansalaisuus_fi] = d5.maatjavaltiot2_fi
	,[kansalaisuus_ryhma_fi] = case when kansalaisuus = '246' then 'Suomi' when kansalaisuus <> '999' then 'Muu' else 'Tuntematon' end

  --koulutus
	,[vuosiluokka_fi] = case when d9.vuosiluokka_fi like '%9%' then d9.vuosiluokka_fi + ' (päättötodistus)' else d9.vuosiluokka_fi end
	,[vuosiluokka_ryhma_fi] = d9.vuosiluokkaryhma_fi
	,[opiskeltujen_kielten_maara_fi] =
		case 
			when kielet_lkm = 1 then '1 kieli' 
			when kielet_lkm < 6 then cast(kielet_lkm as nvarchar(1)) + ' kieltä' 
			else '6 kieltä tai enemmän'
		end
	,[oppiaineryhma_fi] = d16.ryhma_nimi
	,[oppiaineryhma_II_fi] = d17.ryhma2_nimi
    ,[oppiaine_fi] = d16.nimi
	,[oppimaara_tai_kieli_fi] = d17.nimi

	,[oppiaineen_laajuus_fi] = 
		case 
			when koulutusmoduuli_laajuus_arvo >= 100 then '100,0 - ' + d18.nimi
			else replace(cast(0.0 + floor(koulutusmoduuli_laajuus_arvo) as decimal(4,1)), '.', ',') + ' - ' 
			  + replace(cast(0.9 + floor(koulutusmoduuli_laajuus_arvo) as decimal(4,1)), '.', ',') + ' ' 
			  + d18.nimi
		end

	,[pakollinen_valinnainen_fi] = case koulutusmoduuli_pakollinen when 1 then 'Pakollinen' when 0 then 'Valinnainen' else 'Tieto puuttuu' end
	,[arvosana_fi] = case when aineen_arvosana = 'S' then 'Hyväksytty' else aineen_arvosana end
	
  --org
    ,[oppilaitosnumero_fi] = d12.organisaatio_koodi
	,[oppilaitos_fi] = d12.organisaatio_fi
	,[oppilaitoksen_kunta_fi] = d14.kunta_fi
	,[oppilaitoksen_maakunta_fi] = d14.maakunta_fi
	,[oppilaitoksen_avi_fi] = d14.avi_fi
	,[oppilaitoksen_ely_fi] = d14.ely_fi
	,[oppilaitoksen_opetuskieli_fi] = d12.oppilaitoksenopetuskieli_fi
	,[oppilaitostyyppi_fi] = d12.oppilaitostyyppi_fi
	,[opetuksen_jarjestaja_fi] = d13.organisaatio_fi
	,[opetuksen_jarjestajan_kunta_fi] = d15.kunta_fi
	,[opetuksen_jarjestajan_maakunta_fi] = d15.maakunta_fi
	,[opetuksen_jarjestajan_avi_fi] = d15.avi_fi
	,[opetuksen_jarjestajan_ely_fi] = d15.ely_fi
	,[opetuksen_jarjestajan_yritysmuoto_fi] = d13.koulutuksen_jarjestajan_yritysmuoto
	,[toimipiste_fi] = d11.organisaatio_fi
	
  --jarj
	,[jarjestys_sukupuoli] = d2.jarjestys_sukupuoli_koodi
	,[jarjestys_ika] = d4.jarjestys_ika
	,[jarjestys_aidinkieli_ryhma] = d3.jarjestys_kieliryhma1
	,[jarjestys_kansalaisuus_ryhma] = case when kansalaisuus in ('246','999') then kansalaisuus else '666' end

	,[jarjestys_oppiaineryhma] = d16.jarjestys_ryhma
	,[jarjestys_oppiaineryhma_II] = d17.jarjestys_ryhma2
	,[jarjestys_oppiaine] = d16.jarjestys
	,[jarjestys_oppimaara_tai_kieli] = d17.jarjestys
	,[jarjestys_arvosana] = case when isnumeric(aineen_arvosana) = 0 then 11 else aineen_arvosana end
	,[jarjestys_oppiaineen_laajuus] = case when koulutusmoduuli_laajuus_arvo > 99 then 99 else floor(koulutusmoduuli_laajuus_arvo) end
	,[jarjestys_pakollinen_valinnainen] = case when koulutusmoduuli_pakollinen is null then 9 else 2 - koulutusmoduuli_pakollinen end
	
	,[jarjestys_oppilaitoksen_maakunta] = d14.jarjestys_maakunta_koodi
	,[jarjestys_oppilaitoksen_avi] = d14.jarjestys_avi_koodi
	,[jarjestys_oppilaitoksen_ely] = d14.jarjestys_ely_koodi
	,[jarjestys_oppilaitoksen_opetuskieli] = d12.jarjestys_oppilaitoksenopetuskieli_koodi
	,[jarjestys_oppilaitostyyppi] = d12.jarjestys_oppilaitostyyppi_koodi
	,[jarjestys_opetutuksen_jarjestajan_maakunta] = d15.jarjestys_maakunta_koodi
	,[jarjestys_opetutuksen_jarjestajan_avi] = d15.jarjestys_avi_koodi
	,[jarjestys_opetutuksen_jarjestajan_ely] = d15.jarjestys_ely_koodi


--SV
  --aika
	,[lukuvuosi_sv] = Lukuvuosi

  --hlö
	,[sukupuoli_sv] = case d2.sukupuoli_koodi when '1' then 'Pojkar' when '2' then 'Flickor' else 'Information saknas' end
	,[ika_sv] = d4.ika_sv
	,[aidinkieli_sv] = d3.kieli_sv
	,[aidinkieli_ryhma_sv] = d3.kieliryhma1_sv
	,[kansalaisuus_sv] = d5.maatjavaltiot2_sv
	,[kansalaisuus_ryhma_sv] = case when kansalaisuus = '246' then 'Finland' when kansalaisuus <> '999' then 'Övrigt' else 'Okänt' end

  --koulutus
	,[vuosiluokka_sv] = case when d9.vuosiluokka_sv like '%9%' then d9.vuosiluokka_sv + ' (avgångsbetyg)' else d9.vuosiluokka_sv end
	,[vuosiluokka_ryhma_sv] = d9.vuosiluokkaryhma_sv
	,[opiskeltujen_kielten_maara_sv] =
		case 
			when kielet_lkm = 1 then '1 språk' 
			when kielet_lkm < 6 then cast(kielet_lkm as nvarchar(1)) + ' språk' 
			else '6 språk eller flera'
		end
	,[oppiaineryhma_sv] = d16.ryhma_nimi_sv
	,[oppiaineryhma_II_sv] = d17.ryhma2_nimi_sv
    ,[oppiaine_sv] = d16.nimi_sv
	,[oppimaara_tai_kieli_sv] = d17.nimi_sv

	,[oppiaineen_laajuus_sv] = 
		case 
			when koulutusmoduuli_laajuus_arvo >= 100 then '100,0 - ' + d18.nimi_sv
			else replace(cast(0.0 + floor(koulutusmoduuli_laajuus_arvo) as decimal(4,1)), '.', ',') + ' - ' 
			  + replace(cast(0.9 + floor(koulutusmoduuli_laajuus_arvo) as decimal(4,1)), '.', ',') + ' ' 
			  + d18.nimi_sv
		end

	,[pakollinen_valinnainen_sv] = case koulutusmoduuli_pakollinen when 1 then 'Obligatorisk' when 0 then 'Valfri' else 'Information saknas' end
	,[arvosana_sv] = case when aineen_arvosana = 'S' then 'Godkänd' else aineen_arvosana end
	
  --org
    ,[oppilaitosnumero_sv] = d12.organisaatio_koodi
	,[oppilaitos_sv] = d12.organisaatio_sv
	,[oppilaitoksen_kunta_sv] = d14.kunta_sv
	,[oppilaitoksen_maakunta_sv] = d14.maakunta_sv
	,[oppilaitoksen_avi_sv] = d14.avi_sv
	,[oppilaitoksen_ely_sv] = d14.ely_sv
	,[oppilaitoksen_opetuskieli_sv] = d12.oppilaitoksenopetuskieli_sv
	,[oppilaitostyyppi_sv] = d12.oppilaitostyyppi_sv
	,[opetuksen_jarjestaja_sv] = d13.organisaatio_sv
	,[opetuksen_jarjestajan_kunta_sv] = d15.kunta_sv
	,[opetuksen_jarjestajan_maakunta_sv] = d15.maakunta_sv
	,[opetuksen_jarjestajan_avi_sv] = d15.avi_sv
	,[opetuksen_jarjestajan_ely_sv] = d15.ely_sv
	,[opetuksen_jarjestajan_yritysmuoto_sv] = d13.koulutuksen_jarjestajan_yritysmuoto_sv
	,[toimipiste_sv] = d11.organisaatio_sv

--EN
--mm. koskioppiaineetyleissivistava vain FI, SV

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

	WHERE d16.koodi not in ('B3','FI','PS','OP','OPA','YL') OR (d16.koodi = 'YL' and vuosiluokkaryhma_fi = 'Vuosiluokat 1–6')
	--pyynnöstä rajattu vääriä tai puutteellisia valtakunnallisia

GO
