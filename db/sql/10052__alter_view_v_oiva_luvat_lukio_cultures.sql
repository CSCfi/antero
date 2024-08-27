USE [ANTERO]
GO

/****** Object:  View [dw].[v_oiva_luvat_lukio_cultures]    Script Date: 26.8.2024 13:56:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dw].[v_oiva_luvat_lukio_cultures] AS


SELECT DISTINCT --TOP 1000
	 [tarkasteluvuosi]=d7.vuosi
	,[luvan_alkamisvuosi] = d5.vuosi
	
	--fi
	,[luvan_paattymisvuosi_fi] = coalesce(nullif(cast(d6.vuosi as varchar(20)),'-1'),'Ei päättynyt')
	,[luvan_alkamiskuukausi_fi] = d5.kuukausi_fi
	,[luvan_paattymiskuukausi_fi] = coalesce(nullif(d6.kuukausi_fi,ca.puuttuu_fi),'Ei päättynyt')
	,[tarkastelupaiva_fi] = concat('Voimassa 1.', d7.kuukausi, '.')  -- Lupa voimassa muutos tarkastelupäiväksi JK
	,[koulutuksen_jarjestaja_fi] = d1.organisaatio_fi
	,[koulutuksen_jarjestajan_yritysmuoto_fi] = d1.koulutuksen_jarjestajan_yritysmuoto
	,[koulutuksen_jarjestajan_kunta_fi] = d1a.kunta_fi
	,[koulutuksen_jarjestajan_maakunta_fi] = d1a.maakunta_fi
	,[oppilaitos_fi] = d12.organisaatio_fi
	,[hyvinvointialue_fi] = d1a.hyvinvointialue_fi
	,[toiminta_alueen_kunta_fi] = coalesce(nullif(d2a.kunta_fi,ca.puuttuu_fi),'Ei määritelty')
	,[toiminta_alueen_maakunta_fi] = coalesce(nullif(d2b.maakunta_fi,ca.puuttuu_fi),'Ei määritelty')
	,[opetuskieli_fi] = coalesce(nullif(case d3.kieli_fi when 'pohjoissaame' then 'saame' else d3.kieli_fi end, 'Tieto puuttuu'), 'Ei määritelty')
	,[erityinen_koulutustehtava_fi] = coalesce(nullif(d8.selite_fi, 'Tieto puuttuu'), 'Ei määritelty')
	,[opetuksen_jarjestamismuoto_fi] = coalesce(nullif(d9.selite_fi, 'Tieto puuttuu'), 'Ei määritelty')
	,[muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat_fi] = coalesce(nullif(d10.selite_fi,ca.puuttuu_fi),'Ei määritelty')

	--sv
	,[luvan_paattymisvuosi_sv] = coalesce(nullif(cast(d6.vuosi as varchar(20)),'-1'),'Ej löpt ut')
	,[luvan_alkamiskuukausi_sv] = d5.kuukausi_sv
	,[luvan_paattymiskuukausi_sv] = coalesce(nullif(d6.kuukausi_sv,ca.puuttuu_sv),'Ej löpt ut')
	,[tarkastelupaiva_sv] = concat('Giltigt 1.', d7.kuukausi, '.') -- Lupa voimassa muutos tarkastelupäiväksi JK
	,[koulutuksen_jarjestaja_sv] = d1.organisaatio_sv
	,[koulutuksen_jarjestajan_yritysmuoto_sv] = d1.koulutuksen_jarjestajan_yritysmuoto_sv
	,[koulutuksen_jarjestajan_kunta_sv] = d1a.kunta_sv
	,[koulutuksen_jarjestajan_maakunta_sv] = d1a.maakunta_sv
	,[oppilaitos_sv] = d12.organisaatio_sv
	,[hyvinvointialue_sv] = d1a.hyvinvointialue_sv
	,[toiminta_alueen_kunta_sv] = coalesce(nullif(d2a.kunta_sv,ca.puuttuu_sv),'Ej angivet')
	,[toiminta_alueen_maakunta_sv] = coalesce(nullif(d2b.maakunta_sv,ca.puuttuu_sv),'Ej angivet')
	,[opetuskieli_sv] = coalesce(nullif(case d3.kieli_fi when 'pohjoissaame' then 'samiska' else d3.kieli_sv end, 'Information saknas'), 'Ej angivet')
	,[erityinen_koulutustehtava_sv] = coalesce(nullif(d8.selite_sv, 'Information saknas'), 'Ej angivet')
	,[opetuksen_jarjestamismuoto_sv] = coalesce(nullif(d9.selite_sv, 'Information saknas'), 'Ej angivet')	
	,[muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat_sv] = coalesce(nullif(d10.selite_sv,ca.puuttuu_sv), 'Ej angivet')

	--en
	,[luvan_paattymisvuosi_en] = coalesce(nullif(cast(d6.vuosi as varchar(20)),'-1'),'Not ended')
	,[luvan_alkamiskuukausi_en] = d5.kuukausi_en
	,[luvan_paattymiskuukausi_en] = coalesce(nullif(d6.kuukausi_en,ca.puuttuu_en),'Not ended')
	,[tarkastelupaiva_en] = concat('Valid 1.', d7.kuukausi, '.') -- Lupa voimassa muutos tarkastelupäiväksi JK
	,[koulutuksen_jarjestaja_en] = d1.organisaatio_en
	,[koulutuksen_jarjestajan_yritysmuoto_en] = d1.koulutuksen_jarjestajan_yritysmuoto_en
	,[koulutuksen_jarjestajan_kunta_en] = d1a.kunta_en
	,[koulutuksen_jarjestajan_maakunta_en] = d1a.maakunta_en
	,[oppilaitos_en] = d12.organisaatio_en
	,[hyvinvointialue_en] = d1a.hyvinvointialue_en
	,[toiminta_alueen_kunta_en] = coalesce(nullif(d2a.kunta_en,ca.puuttuu_en),'Not specified')
	,[toiminta_alueen_maakunta_en] = coalesce(nullif(d2b.maakunta_en,ca.puuttuu_en),'Not specified')
	,[opetuskieli_en] = coalesce(nullif(case d3.kieli_fi when 'pohjoissaame' then 'Sami' else d3.kieli_en end, 'Missing data'), 'Not specified')
	,[erityinen_koulutustehtava_en] = coalesce(nullif(d8.selite_en, 'Missing data'), 'Not specified')
	,[opetuksen_jarjestamismuoto_en] = coalesce(nullif(d9.selite_en, 'Missing data'), 'Not specified')
	,[muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat_en] = coalesce(nullif(d10.selite_en,ca.puuttuu_en), 'Not specified')

	--apusarakkeet
	,[koodit_koulutuksen_jarjestaja] = d1.organisaatio_koodi

	--jarjestys
	,[jarjestys_luvan_alkamiskuukausi] = d5.kuukausi
	,[jarjestys_luvan_paattymiskuukausi] = d6.kuukausi
	,[jarjestys_koulutuksen_jarjestajan_maakunta] = d1a.jarjestys_maakunta_koodi
	,[jarjestys_toiminta_alueen_maakunta] = d2b.jarjestys_maakunta_koodi
	,[jarjestys_toiminta_alueen_kunta] = d2a.jarjestys_kunta_koodi
	,[jarjestys_opetuskieli] = d3.kieliryhma1_koodi 
	,[jarjestys_muut_oikeudet_velvollisuudet_ehdot_ja_tehtavat] = case when d10.selite_fi = ca.puuttuu_fi then 0 else d10.jarjestys end

FROM dw.f_oiva_luvat_lukio f
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN dw.d_alueluokitus d1a on d1a.kunta_koodi=d1.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2a on d2a.id=f.d_alueluokitus_toiminta_alue_kunta_id
LEFT JOIN dw.d_alueluokitus d2b on d2b.id=f.d_alueluokitus_toiminta_alue_maakunta_id
LEFT JOIN dw.d_kieli d3 on d3.id=f.d_kieli_id
LEFT JOIN dw.d_kalenteri d5 on d5.id=f.d_kalenteri_luvan_alku_id
LEFT JOIN dw.d_kalenteri d6 on d6.id=f.d_kalenteri_luvan_loppu_id
LEFT JOIN dw.d_kalenteri d7 on d7.id = f.d_kalenteri_tarkastelupaiva -- Lupa voimassa muutos tarkastelupäiväksi JK
LEFT JOIN dw.d_erityinen_koulutustehtava_lukio d8 on d8.id = f.d_erityinen_koulutustehtava_id
LEFT JOIN dw.d_opetuksen_jarjestamismuoto_lukio d9 on d9.id = f.d_opetuksen_jarjestamismuoto_id
LEFT JOIN dw.d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot d10 on d10.id=f.d_muutkoulutuksenjarjestamiseenliittyvatehdot_id
LEFT JOIN dw.d_organisaatioluokitus d12 on d12.id = f.d_organisaatioluokitus_oppilaitos_id
CROSS APPLY (select puuttuu_fi = 'Tieto puuttuu', puuttuu_sv = 'Information saknas', puuttuu_en = 'Missing data') ca
