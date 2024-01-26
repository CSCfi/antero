USE [ANTERO]
GO
/****** Object:  View [dw].[v_oiva_luvat_epo_cultures]    Script Date: 21.2.2022 20:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_oiva_luvat_epo_cultures]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dw].[v_oiva_luvat_epo_cultures] AS


SELECT
	 [tarkasteluvuosi] = f.[Tarkasteluvuosi]
	
	--fi
	,[luvan_alkamisvuosi_fi] = d5.vuosi
	,[luvan_alkamiskuukausi_fi] = d5.kuukausi_fi
	,[luvan_paattymisvuosi_fi] = coalesce(nullif(cast(d6.vuosi as varchar(20)),''-1''), ''Ei päättynyt'')
	,[luvan_paattymiskuukausi_fi] = case when d6.kuukausi != 99 then d6.kuukausi_fi else ''Ei päättynyt'' end
	,[lupa_voimassa_fi] = d11.kytkin_fi
	,[opetuksen_jarjestaja_fi] = d1.organisaatio_fi
	,[opetuksen_jarjestajan_yritysmuoto_fi] = d1.koulutuksen_jarjestajan_yritysmuoto
	,[oppilaitos_fi] = d12.organisaatio_fi
	,[kunta_fi] = d2.kunta_fi
	,[maakunta_fi] = d2.maakunta_fi
	,[opetuskieli_fi] = coalesce(nullif(case d3.kieli_fi when ''pohjoissaame'' then ''saame'' else d3.kieli_fi end, ''Tieto puuttuu''), ''ei määritelty'')
	,[opetus_jota_lupa_koskee_fi] = d7.selite2_fi
	,[erityinen_koulutustehtava_fi] = coalesce(nullif(d8.selite_fi, ''Tieto puuttuu''), ''Ei määritelty'')
	,[opetuksen_jarjestamismuoto_fi] = coalesce(nullif(d9.selite_fi, ''Tieto puuttuu''), ''Ei määritelty'')
	,[oppilas_opiskelijamaara_fi] = f.opiskelijamaara
	,[edellyttaa_sopimusta_kunnan_kanssa_fi] = case when f.muutkoulutuksenjarjestamiseenliittyvatehdot = ''Edellyttää sopimusta kunnan kanssa'' then ''Kyllä'' else ''Ei'' end

	--sv
	,[luvan_alkamisvuosi_sv] = d5.vuosi
	,[luvan_alkamiskuukausi_sv] = d5.kuukausi_sv
	,[luvan_paattymisvuosi_sv] = coalesce(nullif(cast(d6.vuosi as varchar(20)),''-1''), ''Ej löpt ut'')
	,[luvan_paattymiskuukausi_sv] = case when d6.kuukausi != 99 then d6.kuukausi_sv else ''Ej löpt ut'' end
	,[lupa_voimassa_sv] = d11.kytkin_sv
	,[opetuksen_jarjestaja_sv] = d1.organisaatio_sv
	,[opetuksen_jarjestajan_yritysmuoto_sv] = d1.koulutuksen_jarjestajan_yritysmuoto
	,[oppilaitos_sv] = d12.organisaatio_sv
	,[kunta_sv] = d2.kunta_sv
	,[maakunta_sv] = d2.maakunta_sv
	,[opetuskieli_sv] = coalesce(nullif(case d3.kieli_fi when ''pohjoissaame'' then ''samiska'' else d3.kieli_sv end, ''Information saknas''), ''ej angivet'')
	,[opetus_jota_lupa_koskee_sv] = d7.selite2_sv
	,[erityinen_koulutustehtava_sv] = coalesce(nullif(d8.selite_sv, ''Information saknas''), ''Ej angivet'')
	,[opetuksen_jarjestamismuoto_sv] = coalesce(nullif(d9.selite_sv, ''Information saknas''), ''Ej angivet'')
	,[edellyttaa_sopimusta_kunnan_kanssa_sv] = case when f.muutkoulutuksenjarjestamiseenliittyvatehdot = ''Edellyttää sopimusta kunnan kanssa'' then ''Ja'' else ''Nej'' end

	--en
	,[luvan_alkamisvuosi_en] = d5.vuosi
	,[luvan_alkamiskuukausi_en] = d5.kuukausi_en
	,[luvan_paattymisvuosi_en] = coalesce(nullif(cast(d6.vuosi as varchar(20)),''-1''), ''Not ended'')
	,[luvan_paattymiskuukausi_en] = case when d6.kuukausi != 99 then d6.kuukausi_en else ''Not ended'' end
	,[lupa_voimassa_en] = d11.kytkin_en
	,[opetuksen_jarjestaja_en] = d1.organisaatio_en
	,[opetuksen_jarjestajan_yritysmuoto_en] = d1.koulutuksen_jarjestajan_yritysmuoto
	,[oppilaitos_en] = d12.organisaatio_en
	,[kunta_en] = d2.kunta_en
	,[maakunta_en] = d2.maakunta_en
	,[opetuskieli_en] = coalesce(nullif(case d3.kieli_fi when ''pohjoissaame'' then ''Sami'' else d3.kieli_en end, ''Missing data''), ''Not specified'')
	,[opetus_jota_lupa_koskee_en] = d7.selite2_en
	,[erityinen_koulutustehtava_en] = coalesce(nullif(d8.selite_en, ''Missing data''), ''Not specified'')
	,[opetuksen_jarjestamismuoto_en] = coalesce(nullif(d9.selite_en, ''Missing data''), ''Not specified'')
	,[edellyttaa_sopimusta_kunnan_kanssa_en] = case when f.muutkoulutuksenjarjestamiseenliittyvatehdot = ''Edellyttää sopimusta kunnan kanssa'' then ''Yes'' else ''No'' end

	--koodit
	,[koodit_opetuksen_jarjestaja] = d1.organisaatio_koodi

	--järjestykset
	,[jarjestys_maakunta] = d2.jarjestys_maakunta_koodi
	,[jarjestys_opetus_jota_lupa_koskee] = d7.jarjestys
	,[jarjestys_erityinen_koulutustehtava] = d8.jarjestys
	,[jarjestys_opetuksen_jarjestamismuoto] = d9.jarjestys
	,[jarjestys_luvan_alkamiskuukausi] = d5.kuukausi
	,[jarjestys_luvan_paattymiskuukausi] = coalesce(nullif(d6.kuukausi,-1),99)
	,[jarjestys_opetuskieli] = case when d3.kieli_koodi = ''-1'' then ''öööö'' else left(d3.kieli_fi,4) end
	,[jarjestys_muu_ehto] = left(coalesce(f.muutkoulutuksenjarjestamiseenliittyvatehdot, ''öö''),2)

FROM dw.f_oiva_luvat_epo f

LEFT JOIN dbo.translations_keys_as_columns k on 1=0
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN dw.d_alueluokitus d2 on d2.id=f.d_alueluokitus_opetus_id
LEFT JOIN dw.d_kieli d3 on d3.id=f.d_kieli_id
LEFT JOIN dw.d_kalenteri d5 on d5.id=f.d_kalenteri_luvan_alku_id
LEFT JOIN dw.d_kalenteri d6 on d6.id=f.d_kalenteri_luvan_loppu_id
LEFT JOIN dw.d_opetustehtava d7 on d7.id = f.d_opetustehtava_id
LEFT JOIN dw.d_erityinen_koulutustehtava d8 on d8.id = f.d_erityinen_koulutustehtava_id
LEFT JOIN dw.d_opetuksen_jarjestamismuoto d9 on d9.id = f.d_opetuksen_jarjestamismuoto_id
LEFT JOIN dw.d_kytkin d11 on d11.id = f.d_kytkin_lupa_voimassa_id
LEFT JOIN dw.d_organisaatioluokitus d12 on d12.id = f.d_organisaatioluokitus_oppilaitos_id

WHERE d7.selite2_fi is not null

' 
