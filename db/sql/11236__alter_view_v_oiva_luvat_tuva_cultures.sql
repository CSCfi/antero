USE [ANTERO]
GO

/****** Object:  View [dw].[v_oiva_luvat_tuva_cultures]    Script Date: 26.9.2025 14.58.48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_oiva_luvat_tuva_cultures] AS


SELECT --TOP 1000
	
	--fi
	 [tarkasteluvuosi_fi] = f.[Tarkasteluvuosi]
	,[luvan_alkamisvuosi_fi] = d4.vuosi
	,[luvan_alkamiskuukausi_fi] = d4.kuukausi_fi
	,[luvan_paattymisvuosi_fi] = coalesce(nullif(cast(d5.vuosi as varchar(20)),'-1'), 'Ei päättynyt')
	,[luvan_paattymiskuukausi_fi] = case when d5.kuukausi != 99 then d5.kuukausi_fi else 'Ei päättynyt' end
	,[toiminta_alueena_koko_maa_fi] = d8.kytkin_fi
	,[toiminta_alueena_koko_maakunta_fi] = d9.kytkin_fi
	,[alkuperainen_jarjestamislupa_fi] = f.[alkup_jarjestamislupa]
	,[tarkastelupaiva_fi] = case when tarkastelukuukausi is null then 'Ei voimassa 1.1./1.8.' else concat('Voimassa 1.', tarkastelukuukausi, '.') end -- Lupa voimassa muutos tarkastelupäiväksi JK
	,[koulutuksen_jarjestaja_fi] = d1.organisaatio_fi
	,[koulutuksen_jarjestajan_yritysmuoto_fi] = d1.koulutuksen_jarjestajan_yritysmuoto
	,[koulutuksen_jarjestajan_kunta_fi] = d1a.kunta_fi
	,[koulutuksen_jarjestajan_maakunta_fi] = d1a.maakunta_fi
	,[koulutuksen_jarjestajan_hyvinvointialue_fi] = d1a.hyvinvointialue_fi
	,[toiminta_alueen_kunta_fi] = case when d1.organisaatio_koodi = '0209276-2' then 'Uusikaarlepyy' else d2a.kunta_fi end
	,[toiminta_alueen_kunnan_hyvinvointialue_fi] = case when d1.organisaatio_koodi = '0209276-2' then 'Pohjanmaan hyvinvointialue' else d2a.hyvinvointialue_fi end
	,[toiminta_alueen_maakunta_fi] = case when d1.organisaatio_koodi = '0209276-2' then 'Pohjanmaa' else d2b.maakunta_fi end
	,[opetuskieli_fi] = case
							when d1.organisaatio_koodi = '0209276-2' then 'ruotsi'
							when alkup_jarjestamislupa = 'Ammatillinen koulutus' then REPLACE(d3.selite_fi, 'vain ','')
							else coalesce(nullif(case d10.kieli_fi when 'pohjoissaame' then 'saame' else d10.kieli_fi end, 'Tieto puuttuu'), 'Tieto puuttuu')
						end

	--sv
	,[tarkasteluvuosi_sv] = f.[Tarkasteluvuosi]
	,[luvan_alkamisvuosi_sv] = d4.vuosi
	,[luvan_alkamiskuukausi_sv] = d4.kuukausi_sv
	,[luvan_paattymisvuosi_sv] = coalesce(nullif(cast(d5.vuosi as varchar(20)),'-1'), 'Ej löpt ut')
	,[luvan_paattymiskuukausi_sv] = case when d5.kuukausi != 99 then d5.kuukausi_sv else 'Ej löpt ut' end
	,[toiminta_alueena_koko_maa_sv] = d8.kytkin_sv
	,[toiminta_alueena_koko_maakunta_sv] = d9.kytkin_sv
	,[alkuperainen_jarjestamislupa_sv] = case
											when f.[alkup_jarjestamislupa] = 'Ammatillinen koulutus' then 'Yrkesutbildning'
											when f.[alkup_jarjestamislupa] = 'Esi- ja perusopetus' then 'Förskoleundervisning och grundläggande utbildning'
											when f.[alkup_jarjestamislupa] = 'Lukiokoulutus' then 'Gymnasieutbildning'
										 end
	,[tarkastelupaiva_sv] = case when tarkastelukuukausi is null then 'Ej giltigt 1.1./1.8.' else concat('Giltigt 1.', tarkastelukuukausi, '.') end -- Lupa voimassa muutos tarkastelupäiväksi JK
	,[koulutuksen_jarjestaja_sv] = d1.organisaatio_sv
	,[koulutuksen_jarjestajan_yritysmuoto_sv] = d1.koulutuksen_jarjestajan_yritysmuoto_sv
	,[koulutuksen_jarjestajan_kunta_sv] = d1a.kunta_sv
	,[koulutuksen_jarjestajan_maakunta_sv] = d1a.maakunta_sv
	,[koulutuksen_jarjestajan_hyvinvointialue_sv] = d1a.hyvinvointialue_sv
	,[toiminta_alueen_kunta_sv] = case when d1.organisaatio_koodi = '0209276-2' then 'Nykarleby' else d2a.kunta_sv end
	,[toiminta_alueen_kunnan_hyvinvointialue_sv] = case when d1.organisaatio_koodi = '0209276-2' then 'Österbottens välfärdsområde' else d2a.hyvinvointialue_sv end
	,[toiminta_alueen_maakunta_sv] = case when d1.organisaatio_koodi = '0209276-2' then 'Österbotten' else d2b.maakunta_sv end
	,[opetuskieli_sv] = case
							when d1.organisaatio_koodi = '0209276-2' then 'svenska'
							when alkup_jarjestamislupa = 'Ammatillinen koulutus' then REPLACE(d3.selite_sv, 'endast ','')
							else coalesce(nullif(case d10.kieli_fi when 'pohjoissaame' then 'samiska' else d10.kieli_sv end, 'Information saknas'), 'Information saknas')
						end

	--en
	,[tarkasteluvuosi_en] = f.[Tarkasteluvuosi]
	,[luvan_alkamisvuosi_en] = d4.vuosi
	,[luvan_alkamiskuukausi_en] = d4.kuukausi_en
	,[luvan_paattymisvuosi_en] = coalesce(nullif(cast(d5.vuosi as varchar(20)),'-1'), 'Not ended')
	,[luvan_paattymiskuukausi_en] = case when d5.kuukausi != 99 then d5.kuukausi_en else 'Not ended' end
	,[toiminta_alueena_koko_maa_en] = d8.kytkin_en
	,[toiminta_alueena_koko_maakunta_en] = d9.kytkin_en
	,[alkuperainen_jarjestamislupa_en] = case
											when f.[alkup_jarjestamislupa] = 'Ammatillinen koulutus' then 'EN*Ammatillinen koulutus'
											when f.[alkup_jarjestamislupa] = 'Esi- ja perusopetus' then 'EN*Esi- ja perusopetus'
											when f.[alkup_jarjestamislupa] = 'Lukiokoulutus' then 'EN*Lukiokoulutus'
										 end
	,[tarkastelupaiva_en] = case when tarkastelukuukausi is null then 'Not valid 1.1./1.8.' else concat('Valid 1.', tarkastelukuukausi, '.') end -- Lupa voimassa muutos tarkastelupäiväksi JK
	,[koulutuksen_jarjestaja_en] = d1.organisaatio_en
	,[koulutuksen_jarjestajan_yritysmuoto_en] = d1.koulutuksen_jarjestajan_yritysmuoto_en
	,[koulutuksen_jarjestajan_kunta_en] = d1a.kunta_en
	,[koulutuksen_jarjestajan_maakunta_en] = d1a.maakunta_en
	,[koulutuksen_jarjestajan_hyvinvointialue_en] = d1a.hyvinvointialue_en
	,[toiminta_alueen_kunta_en] = case when d1.organisaatio_koodi = '0209276-2' then 'Uusikaarlepyy' else d2a.kunta_en end
	,[toiminta_alueen_kunnan_hyvinvointialue_en] = case when d1.organisaatio_koodi = '0209276-2' then 'Ostrobothnia wellbeing services county' else d2a.hyvinvointialue_en end
	,[toiminta_alueen_maakunta_en] = case when d1.organisaatio_koodi = '0209276-2' then 'Ostrobothnia' else d2b.maakunta_en end
	,[opetuskieli_en] = case
							when d1.organisaatio_koodi = '0209276-2' then 'Swedish'
						    when alkup_jarjestamislupa = 'Ammatillinen koulutus' then REPLACE(d3.selite_en, 'only ','')
							else coalesce(nullif(case d10.kieli_fi when 'pohjoissaame' then 'Sami' else d10.kieli_en end, 'Missing data'), 'Missing data')
						end

	--apusarakkeet
	,[apusarake_opiskelijavuodet] = opiskelijavuodet
	,[apusarake_opiskelijavuodet_sisa] = opiskelijavuodet_sisa
	,[apusarake_opiskelijavuodet_vet] = opiskelijavuodet_vet

	--koodit
	,[koodit_koulutuksen_jarjestaja] = d1.organisaatio_koodi

	--järjestykset
	,[jarjestys_koulutuksen_jarjestajan_maakunta] = case when d1.organisaatio_koodi = '0209276-2' then 15 else d1a.jarjestys_maakunta_koodi end
	,[jarjestys_koulutuksen_jarjestajan_hyvinvointialue] = case when d1.organisaatio_koodi = '0209276-2' then 17 else d1a.jarjestys_hyvinvointialue_koodi end
	,[jarjestys_toiminta_alueen_maakunta] = case when d1.organisaatio_koodi = '0209276-2' then 15 else d2b.jarjestys_maakunta_koodi end
	,[jarjestys_toiminta_alueen_kunnan_hyvinvointialue] = case when d1.organisaatio_koodi = '0209276-2' then 17 else d2a.jarjestys_hyvinvointialue_koodi end
	,[jarjestys_luvan_alkamiskuukausi] = d4.kuukausi
	,[jarjestys_luvan_paattymiskuukausi] = coalesce(nullif(d5.kuukausi,-1),99)
	,[jarjestys_opetuskieli] = case
								   when d1.organisaatio_koodi = '0209276-2' then 2
							       when alkup_jarjestamislupa = 'Ammatillinen koulutus' then LEFT(d3.jarjestys, 2)
								   else LEFT(d10.jarjestys_kieliryhma1, 2)
							   end

FROM dw.f_oiva_luvat_tuva f
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN dw.d_alueluokitus d1a on d1a.kunta_koodi=d1.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2a on d2a.id=f.d_alueluokitus_toiminta_alue_kunta_id
LEFT JOIN dw.d_alueluokitus d2b on d2b.id=f.d_alueluokitus_toiminta_alue_maakunta_id
LEFT JOIN dw.d_oppilaitoksenopetuskieli d3 on d3.id=f.d_oppilaitoksenopetuskieli_id
LEFT JOIN dw.d_kalenteri d4 on d4.id=f.d_kalenteri_luvan_alku_id
LEFT JOIN dw.d_kalenteri d5 on d5.id=f.d_kalenteri_luvan_loppu_id
LEFT JOIN dw.d_kytkin d7 on d7.id = f.tarkastelukuukausi -- Lupa voimassa muutos tarkastelupäiväksi JK
LEFT JOIN dw.d_kytkin d8 on d8.id=f.d_kytkin_toiminta_alue_koko_maa_id
LEFT JOIN dw.d_kytkin d9 on d9.id=f.d_kytkin_toiminta_alue_koko_maakunta_id
LEFT JOIN dw.d_kieli d10 on d10.id=f.d_kieli_id
-- TUVA-koulutus alkanut 1.8.2022
WHERE d4.vuosi > 2021 and (f.tarkasteluvuosi > 2022 or (f.tarkasteluvuosi = 2022 and f.tarkastelukuukausi > 7))

GO


