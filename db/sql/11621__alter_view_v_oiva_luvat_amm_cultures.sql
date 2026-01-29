USE [ANTERO]
GO

/****** Object:  View [dw].[v_oiva_luvat_amm_cultures]    Script Date: 29.1.2026 14.05.16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





















ALTER VIEW [dw].[v_oiva_luvat_amm_cultures] AS


SELECT DISTINCT --TOP 1000
	 [tarkasteluvuosi]=d14.vuosi
	,[luvan_alkamisvuosi] = d5.vuosi
	
	--fi
	,[luvan_paattymisvuosi_fi] = coalesce(nullif(cast(d6.vuosi as varchar(20)),'-1'),'Ei päättynyt')
	,[luvan_alkamiskuukausi_fi] = d5.kuukausi_fi
	,[luvan_paattymiskuukausi_fi] = coalesce(nullif(d6.kuukausi_fi,ca.puuttuu_fi),'Ei päättynyt')
	,[tarkastelupaiva_fi] = concat('Voimassa 1.', d14.kuukausi, '.')  -- Lupa voimassa muutos tarkastelupäiväksi JK

	,[koulutuksen_jarjestaja_fi] = d1.organisaatio_fi
	,[koulutuksen_jarjestajan_kunta_fi] = d1a.kunta_fi
	,[koulutuksen_jarjestajan_maakunta_fi] = d1a.maakunta_fi
	,[koulutuksen_jarjestajan_hyvinvointialue_fi] = d1a.hyvinvointialue_fi
	,[toiminta_alueen_kunta_fi] = coalesce(nullif(d2a.kunta_fi,ca.puuttuu_fi),'Ei määritelty')
	,[toiminta_alueen_kunnan_hyvinvointialue_fi] = coalesce(nullif(d2a.hyvinvointialue_fi,ca.puuttuu_fi),'Ei määritelty')
	,[toiminta_alueen_maakunta_fi] = coalesce(nullif(d2b.maakunta_fi,ca.puuttuu_fi),'Ei määritelty')
	,[toiminta_alueena_koko_maa_fi] = d11.kytkin_fi
	,[toiminta_alueena_koko_maakunta_fi] = d12.kytkin_fi
	,[tutkinto_fi] = coalesce(nullif(d3.koulutusluokitus_fi,ca.puuttuu_fi),'Ei määritelty')
	,[osaamisala_fi] = CASE d13.koodi WHEN -1 THEN NULL ELSE d13.selite_fi END -- Tieto puuttuu näkymään tyhjänä JK 25.3.2025
	,[koulutusala_taso_1_fi] = d3.koulutusalataso1_fi
	,[koulutusala_taso_2_fi] = d3.koulutusalataso2_fi
	,[koulutusala_taso_3_fi] = d3.koulutusalataso3_fi
	,[tutkintotyyppi_fi] = d3.tutkintotyyppi_fi
	,[osaamisala_rajoite_fi] =  CASE d4.koodi WHEN -1 THEN NULL ELSE d4.selite_fi END -- Tieto puuttuu näkymään tyhjänä
	,[luvanmukaiset_koulutukset_fi] = coalesce(nullif(d9.selite_fi,ca.puuttuu_fi),'Ei määritelty')
	,[muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat_fi] = coalesce(nullif(d10.selite_fi,ca.puuttuu_fi),'Ei määritelty')
	,[tutkintokieli1_fi] = coalesce(nullif(d8.kieli_fi,ca.puuttuu_fi), 'opetuskieli')
	,[tutkintokieli2_fi] = coalesce(nullif(case d8b.kieli_fi when 'pohjoissaame' then 'saame' else d8b.kieli_fi end,ca.puuttuu_fi), 'ei määritelty')
	,[opetuskieli_fi] = d7.selite_fi

	--sv
	,[luvan_paattymisvuosi_sv] = coalesce(nullif(cast(d6.vuosi as varchar(20)),'-1'),'Ej löpt ut')
	,[luvan_alkamiskuukausi_sv] = d5.kuukausi_sv
	,[luvan_paattymiskuukausi_sv] = coalesce(nullif(d6.kuukausi_sv,ca.puuttuu_sv),'Ej löpt ut')
	,[tarkastelupaiva_sv] = concat('Giltigt 1.', d14.kuukausi, '.') -- Lupa voimassa muutos tarkastelupäiväksi JK

	,[koulutuksen_jarjestaja_sv] = d1.organisaatio_sv
	,[koulutuksen_jarjestajan_kunta_sv] = d1a.kunta_sv
	,[koulutuksen_jarjestajan_maakunta_sv] = d1a.maakunta_sv
	,[koulutuksen_jarjestajan_hyvinvointialue_sv] = d1a.hyvinvointialue_sv
	,[toiminta_alueen_kunta_sv] = coalesce(nullif(d2a.kunta_sv,ca.puuttuu_sv),'Ej angivet')
	,[toiminta_alueen_kunnan_hyvinvointialue_sv] = coalesce(nullif(d2a.hyvinvointialue_sv,ca.puuttuu_sv),'Ej angivet')
	,[toiminta_alueen_maakunta_sv] = coalesce(nullif(d2b.maakunta_sv,ca.puuttuu_sv),'Ej angivet')
	,[toiminta_alueena_koko_maa_sv] = d11.kytkin_sv
	,[toiminta_alueena_koko_maakunta_sv] = d12.kytkin_sv
	,[tutkinto_sv] = coalesce(nullif(d3.koulutusluokitus_sv,ca.puuttuu_sv),'Ej angivet')
	,[osaamisala_sv] = CASE d13.koodi WHEN -1 THEN NULL ELSE d13.selite_sv END -- Tieto puuttuu näkymään tyhjänä JK 25.3.2025
	,[koulutusala_taso_1_sv] = d3.koulutusalataso1_sv
	,[koulutusala_taso_2_sv] = d3.koulutusalataso2_sv
	,[koulutusala_taso_3_sv] = d3.koulutusalataso3_sv
	,[tutkintotyyppi_sv] = d3.tutkintotyyppi_sv
	,[osaamisala_rajoite_sv] = CASE d4.koodi WHEN -1 THEN NULL ELSE d4.selite_sv END -- Tieto puuttuu näkymään tyhjänä
	,[luvanmukaiset_koulutukset_sv] = coalesce(nullif(d9.selite_sv,ca.puuttuu_sv), 'Ej angivet')
	,[muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat_sv] = coalesce(nullif(d10.selite_sv,ca.puuttuu_sv), 'Ej angivet')
	,[tutkintokieli1_sv] = coalesce(nullif(d8.kieli_sv,ca.puuttuu_sv), 'undervisningsspråk')
	,[tutkintokieli2_sv] =  coalesce(nullif(d8b.kieli_sv,ca.puuttuu_sv),'ej angivet')
	,[opetuskieli_sv] = d7.selite_sv

	--en
	,[luvan_paattymisvuosi_en] = coalesce(nullif(cast(d6.vuosi as varchar(20)),'-1'),'Not ended')
	,[luvan_alkamiskuukausi_en] = d5.kuukausi_en
	,[luvan_paattymiskuukausi_en] = coalesce(nullif(d6.kuukausi_en,ca.puuttuu_en),'Not ended')
	,[tarkastelupaiva_en] = concat('Valid 1.', d14.kuukausi, '.') -- Lupa voimassa muutos tarkastelupäiväksi JK

	,[koulutuksen_jarjestaja_en] = d1.organisaatio_en
	,[koulutuksen_jarjestajan_kunta_en] = d1a.kunta_en
	,[koulutuksen_jarjestajan_maakunta_en] = d1a.maakunta_en
	,[koulutuksen_jarjestajan_hyvinvointialue_en] = d1a.hyvinvointialue_en
	,[toiminta_alueen_kunta_en] = coalesce(nullif(d2a.kunta_en,ca.puuttuu_en),'Not specified')
	,[toiminta_alueen_kunnan_hyvinvointialue_en] = coalesce(nullif(d2a.hyvinvointialue_en,ca.puuttuu_en),'Not specified')
	,[toiminta_alueen_maakunta_en] = coalesce(nullif(d2b.maakunta_en,ca.puuttuu_en),'Not specified')
	,[toiminta_alueena_koko_maa_en] = d11.kytkin_en
	,[toiminta_alueena_koko_maakunta_en] = d12.kytkin_en
	,[tutkinto_en] = coalesce(nullif(d3.koulutusluokitus_en,ca.puuttuu_en),'Not specified')
	,[osaamisala_en] = CASE d13.koodi WHEN -1 THEN NULL ELSE d13.selite_en END -- Tieto puuttuu näkymään tyhjänä JK 25.3.2025
	,[koulutusala_taso_1_en] = d3.koulutusalataso1_en
	,[koulutusala_taso_2_en] = d3.koulutusalataso2_en
	,[koulutusala_taso_3_en] = d3.koulutusalataso3_en
	,[tutkintotyyppi_en] = d3.tutkintotyyppi_en
	,[osaamisala_rajoite_en] = coalesce(nullif(d4.selite_en,ca.puuttuu_en), 'Not specified')
	,[luvanmukaiset_koulutukset_en] = coalesce(nullif(d9.selite_en,ca.puuttuu_en), 'Not specified')
	,[muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat_en] = coalesce(nullif(d10.selite_en,ca.puuttuu_en), 'Not specified')
	,[tutkintokieli1_en] = coalesce(nullif(d8.kieli_en,ca.puuttuu_en), 'undervisningsspråk')
	,[tutkintokieli2_en] =  coalesce(nullif(d8b.kieli_en,ca.puuttuu_en),'Not specified')
	,[opetuskieli_en] = d7.selite_en

	--apusarakkeet
	,apusarake_opiskelijavuodet = opiskelijavuodet
	,apusarake_opiskelijavuodet_sisa = opiskelijavuodet_sisa
	,apusarake_opiskelijavuodet_vet = opiskelijavuodet_vet

	,[koodit_koulutuksen_jarjestaja] = d1.organisaatio_koodi
	,[koodit_tutkinto] = d3.koulutusluokitus_koodi
	,[koodit_osaamisala] = CASE d13.koodi WHEN -1 THEN NULL ELSE d13.koodi END -- Tieto puuttuu näkymään tyhjänä JK 25.3.2025
	,[koodit_muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat] = d10.koodi

	--jarjestys
	,[jarjestys_luvan_alkamiskuukausi] = d5.kuukausi
	,[jarjestys_luvan_paattymiskuukausi] = d6.kuukausi
	,[jarjestys_koulutuksen_jarjestajan_maakunta] = d1a.jarjestys_maakunta_koodi
	,[jarjestys_koulutuksen_jarjestajan_hyvinvointialue] = d1a.jarjestys_hyvinvointialue_koodi
	,[jarjestys_toiminta_alueen_maakunta] = d2b.jarjestys_maakunta_koodi
	,[jarjestys_toiminta_alueen_kunta] = d2a.jarjestys_kunta_koodi
	,[jarjestys_toiminta_alueen_kunnan_hyvinvointialue] = d2a.jarjestys_hyvinvointialue_koodi
	,[jarjestys_koulutusala_taso_1] = d3.jarjestys_koulutusalataso1_koodi
	,[jarjestys_koulutusala_taso_2] = d3.jarjestys_koulutusalataso2_koodi
	,[jarjestys_koulutusala_taso_3] = d3.jarjestys_koulutusalataso3_koodi
	,[jarjestys_tutkintotyyppi] = d3.jarjestys_tutkintotyyppi_koodi
	--,[jarjestys_osaamisala] = d13.jarjestys
	,[jarjestys_osaamisala_rajoite] = d4.jarjestys
	,[jarjestys_luvanmukaiset_koulutukset] = d9.jarjestys
	,[jarjestys_muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat] = d10.jarjestys
	,[jarjestys_tutkintokieli1] = d8.jarjestys_kieliryhma1
	,[jarjestys_tutkintokieli2] = d8b.jarjestys_kieliryhma1
	,[jarjestys_opetuskieli] = d7.jarjestys

FROM dw.f_oiva_luvat_amm f
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_id
LEFT JOIN dw.d_alueluokitus d1a on d1a.kunta_koodi=d1.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2a on d2a.id=f.d_alueluokitus_toiminta_alue_kunta_id
LEFT JOIN dw.d_alueluokitus d2b on d2b.id=f.d_alueluokitus_toiminta_alue_maakunta_id
LEFT JOIN dw.d_koulutusluokitus d3 on d3.id=f.d_koulutusluokitus_tutkinto_id
LEFT JOIN dw.d_osaamisala d4 on d4.id=f.d_osaamisala_luvan_rajoite_id
LEFT JOIN dw.d_kalenteri d5 on d5.id=f.d_kalenteri_luvan_alku_id
LEFT JOIN dw.d_kalenteri d6 on d6.id=f.d_kalenteri_luvan_loppu_id
LEFT JOIN dw.d_oppilaitoksenopetuskieli d7 on d7.id=f.d_oppilaitoksenopetuskieli_id
LEFT JOIN dw.d_kieli d8 on d8.id=f.d_kieli_tutkinto_id
LEFT JOIN dw.d_kieli d8b on d8b.id=f.d_kieli_tutkinto_ja_opetus_id
LEFT JOIN dw.d_oivakoulutukset d9 on d9.id=f.d_oivakoulutukset_id
LEFT JOIN dw.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat d10 on d10.id=f.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_id
LEFT JOIN dw.d_kytkin d11 on d11.id=f.d_kytkin_toiminta_alue_koko_maa_id
LEFT JOIN dw.d_kytkin d12 on d12.id=f.d_kytkin_toiminta_alue_koko_maakunta_id
LEFT JOIN dw.d_osaamisala d13 on d13.id=f.d_osaamisala_tutkinto_id
LEFT JOIN dw.d_kalenteri d14 on d14.id = f.d_kalenteri_tarkastelupaiva -- Lupa voimassa muutos tarkastelupäiväksi JK
CROSS APPLY (select puuttuu_fi = 'Tieto puuttuu', puuttuu_sv = 'Information saknas', puuttuu_en = 'Missing data') ca