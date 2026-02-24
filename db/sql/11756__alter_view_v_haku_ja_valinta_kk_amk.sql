USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_amk]    Script Date: 5.2.2026 8.40.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER   VIEW [dw].[v_haku_ja_valinta_kk_amk] AS

SELECT 
	   cast(f.loadtime as date) as Päivitysaika
	  ,Lukumäärä = case when f.master_oid is not null then 1 else 0 end
	  ,f.alpa
      ,[valpa] = 0
	  ,[Pisteraja] = f.pisteraja
	  ,[Ensikertaisena kohdeltava hakija] = CASE f.ensikertalainen WHEN 0 THEN 'Ei ensikertainen hakija ' WHEN 1 THEN 'Ensikertainen hakija' ELSE 'Tieto puuttuu' END
	  ,[Ensikertainen hakija] = d18.kytkin_fi
	  ,[Ensikertaisuuden lähde] = CASE WHEN f.ensikertaisuuden_lahde = 1 THEN 'ODW' WHEN f.ensikertaisuuden_lahde = 2 THEN 'Ovara' WHEN f.ensikertaisuuden_lahde = 3 THEN 'Virta-OTP' END
	  ,[Hakemus OID] = f.hakemus_oid
	  ,[Haku AMK/YO] = d46.selite_fi
	  ,[Haku] = d25.haun_nimi_fi
	  ,[Hakuaika] = coalesce(d25.hakuaika_fi,'Tieto puuttuu')
	  ,[Hakukohde] = d10.selite_fi
	  ,[hakukohde OID] = d10.oid
	  ,[Haun kohdejoukon tarkenne] = d25.kohdejoukontarkenne_fi
	  ,[Hakutapa] = case d25.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d25.hakutapa_fi end
	  ,[Hakutyyppi] = d25.hakutyyppi_fi
	  ,[Koulutustoimija] = d16a.organisaatio_fi
	  ,[Korkeakoulu] = d16b.organisaatio_fi
	  ,[Toimipiste] = d16c.organisaatio_fi
	  ,[Maakunta (hakukohde)] = d19.maakunta_fi
	  ,[Kunta (hakukohde)] = d19.kunta_fi
	  ,[Hakukohteen koulutusaste] = d20.koulutusaste2002_fi
	  ,[Koulutusala (2002)] = d20.koulutusala2002_fi
	  ,[Opintoala (2002)] = d20.opintoala2002_fi
	  ,[Hakukohteen koulutusala 1995] = d20.opintoala1995_fi
	  ,[Koulutusaste, taso 1 (hakukohde)] = d20.koulutusastetaso1_fi
	  ,[Koulutusaste, taso 2 (hakukohde)] = d20.koulutusastetaso2_fi
	  ,[Koulutusala, taso 1 (hakukohde)] = d20.koulutusalataso1_fi
	  ,[Koulutusala, taso 2 (hakukohde)] = d20.koulutusalataso2_fi
	  ,[Koulutusala, taso 3 (hakukohde)] = d20.koulutusalataso3_fi
	  ,[OKM ohjauksen ala (hakukohde)] = d20.okmohjauksenala_fi
	  ,[Hakutoive] = f.hakutoive
	  ,[Pääasiallinen tutkinto (hakukohde)] = d20.koulutusluokitus_fi
	  
	  ,[1 Hakukohde] = d34.selite_fi
	  ,[1 Koulutusala, taso 1] = d33.koulutusalataso1_fi
	  ,[1 Koulutusala, taso 2] = d33.koulutusalataso2_fi
	  ,[1 Koulutusala, taso 3] = d33.koulutusalataso3_fi

	  ,[2 Hakukohde] = d36.selite_fi
	  ,[2 Koulutusala, taso 1] = d35.koulutusalataso1_fi
	  ,[2 Koulutusala, taso 2] = d35.koulutusalataso2_fi
	  ,[2 Koulutusala, taso 3] = d35.koulutusalataso3_fi

	  ,[3 Hakukohde] = d38.selite_fi
	  ,[3 Koulutusala, taso 1] = d37.koulutusalataso1_fi
	  ,[3 Koulutusala, taso 2] = d37.koulutusalataso2_fi
	  ,[3 Koulutusala, taso 3] = d37.koulutusalataso3_fi

	  ,[4 Hakukohde] = d40.selite_fi
	  ,[4 Koulutusala, taso 1] = d39.koulutusalataso1_fi
	  ,[4 Koulutusala, taso 2] = d39.koulutusalataso2_fi
	  ,[4 Koulutusala, taso 3] = d39.koulutusalataso3_fi

	  ,[5 Hakukohde] = d42.selite_fi
	  ,[5 Koulutusala, taso 1] = d41.koulutusalataso1_fi
	  ,[5 Koulutusala, taso 2] = d41.koulutusalataso2_fi
	  ,[5 Koulutusala, taso 3] = d41.koulutusalataso3_fi

	  ,[6 Hakukohde] = d43b.selite_fi
	  ,[6 Koulutusala, taso 1] = d43.koulutusalataso1_fi
	  ,[6 Koulutusala, taso 2] = d43.koulutusalataso2_fi
	  ,[6 Koulutusala, taso 3] = d43.koulutusalataso3_fi

	  ,[Valintatapajono] = d47.selite_fi
	  ,[Valintatapajonon tyyppi] = d48.selite_fi
	  ,[Pisteet] = f.pisteet

	  ,[Henkilö OID] = f.master_oid
	  ,[Ikä] = d9.ika_fi
	  ,[Ikäryhmä] = d9.ikaryhma2_fi
	  ,[Kansalaisuus] = COALESCE(d28.maa,'Tieto puuttuu')
	  ,[Kansalaisuus (maanosa)] = d30.maanosa5_fi
	  ,[Kansalaisuus (ryhmä)] = d30.maanosa6_fi
	  ,[Kotipaikkakunta] = d6.kunta_fi
	  ,[Kotipaikan maakunta] = d6.maakunta_fi
	  ,[Kotipaikan AVI] = d6.avi_fi
	  ,[Kotipaikan ELY] = d6.ely_fi
	  ,[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	  ,[Koulutuksen alkamiskausi] = d2.selite_fi
	  ,[Koulutuksen kieli] = d27.selite_fi
	  ,[Opiskelun laajuus] = f.laajuus
	  ,[Pohjakoulutuksen maa] = 
		case 
			when d4.kytkin_koodi = 1 then ' Ulkomaat' 
			when d4.kytkin_koodi = 0 then ' Suomi' 
			else d4.kytkin_fi
		end
	  ,[Pohjakoulutuksen maa (priorisoitu)] = 
		case 
			when f.pohjakoulutus_suomessa_priorisoitu = 1 then ' Suomi' 
			when f.pohjakoulutus_suomessa_priorisoitu = 0 then ' Ulkomaat' 
			else 'Tieto puuttuu'
		end
	  ,[Kansainvälinen opiskelija] = d50.kytkin_fi
	  ,[Pohjakoulutus] = d22.selite_fi 
	  ,[Suomessa suoritettu ammatillinen perustutkinto, kouluasteen, opistoasteen tai ammatillisen korkea-asteen tutkinto*] = d49a.kytkin_fi
	  ,[Suomessa suoritettu ammatillinen perustutkinto*] = d49b.kytkin_fi
	  ,[Suomessa suoritettu ammatti- tai erikoisammattitutkinto*] = d49c.kytkin_fi
	  ,[Suomessa suoritettu kouluasteen, opistoasteen tai ammatillisen korkea-asteen tutkinto*] = d49d.kytkin_fi
	  ,[Korkeakoulun edellyttämät avoimen korkeakoulun opinnot*] = d49e.kytkin_fi
	  ,[Suomessa suoritettu korkeakoulututkinto*] = d49f.kytkin_fi
	  ,[Muualla kuin Suomessa suoritettu korkeakoulututkinto*] = d49g.kytkin_fi
	  ,[Suomessa suoritettu lukion oppimäärä ilman ylioppilastutkintoa*] = d49h.kytkin_fi
	  ,[Muualla kuin Suomessa suoritettu toisen asteen koulutus, joka asianomaisessa maassa antaa hakukelpoisuuden korkeakouluun*] = d49i.kytkin_fi
	  ,[Suomessa suoritettu ylioppilastutkinto*] = d49j.kytkin_fi
	  ,[Suomessa suoritettu kaksoistutkinto (ammatillinen perustutkinto ja ylioppilastutkinto)*] = d49k.kytkin_fi
	  ,[Suomessa suoritettu kansainvälinen ylioppilastutkinto (IB, EB ja RP/DIA)*] = d49l.kytkin_fi
	  ,[Muualla kuin Suomessa suoritettu kansainvälinen ylioppilastutkinto (IB, EB ja RP/DIA)*] = d49m.kytkin_fi
	  ,[Muu korkeakoulukelpoisuus*] = d49n.kytkin_fi
	  ,[Sektori] = case when d10.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d20.koulutussektori_fi end --coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'Ammattikorkeakoulutus' else f.sektori_kk end, 'Tuntematon')
	  ,[Sukupuoli] = d7.sukupuoli_fi
	  ,[Toisen asteen koulutuksen suoritusvuosi] = case f.toisen_asteen_koulutuksen_suoritusvuosi when '-1' then 'Tieto puuttuu' else f.toisen_asteen_koulutuksen_suoritusvuosi end
	  ,[Tutkinnon taso (hakukohde)] = d45.selite_fi
	  ,[Tutkinnon aloitussykli (hakukohde)] = d44.selite_fi
	  --,[Valinnan tila] = d23.valinnan_tila
	  --,[Vastaanoton tila] = d24.vastaanoton_tila
	  ,[Äidinkieli] = d8.kieliryhma1_fi

--Ruotsi
	  ,[Behandlas som förstagångssökande] = case f.ensikertalainen when 0 then 'Ej förstagångssökande' when 1 then 'Förstagångssökande' else 'Information saknas' end
	  ,[Förstagångssökande] = d18.kytkin_sv
	  ,[Ansökan YH/Univ.] = d46.selite_sv
	  ,[Ansökning] = d25.haun_nimi_sv
	  ,[Ansökningstiden] = coalesce(d25.hakuaika_sv,'Information saknas')
	  ,[Sökobjekt] = d10.selite_sv
	  ,[Ansökans målgrupps specifikation] = d25.kohdejoukontarkenne_sv
	  ,[Gemensam/separat ansökan] = case d25.hakutapa_fi when 'Jatkuva haku' then 'Separata antagningar' else d25.hakutapa_sv end
	  ,[Typ av ansökan] = d25.hakutyyppi_sv
	  ,[Högskola (sökobjekt)] = d16b.organisaatio_sv
	  ,[Anstalt (sökobjekt)] = d16c.organisaatio_sv
	  ,[Landskap (sökobjekt)] = d19.maakunta_SV
	  ,[Kommun (sökobjekt)] = d19.kunta_SV
	  ,[Utb.nivå (sökobjekt)] = d20.koulutusaste2002_SV
	  ,[Utb.område (2002) (sökobjekt)] = d20.koulutusala2002_sv
	  ,[Studieområde (2002) (sökobjekt)] = d20.opintoala2002_SV
	  ,[Utb.område (1995) (sökobjekt)] = d20.opintoala1995_SV
	  ,[Utb.nivå, nivå 1 (sökobjekt)] = d20.koulutusastetaso1_sv--coalesce(d20b.iscle2011_SV,'Övriga eller Information saknasa')
	  ,[Utb.nivå, nivå 2 (sökobjekt)] = d20.koulutusastetaso2_sv--coalesce(d20b.koulutusaste_taso2_SV,'Övriga eller Information saknasa')
	  ,[Utb.område, nivå 1 (sökobjekt)] = d20.koulutusalataso1_sv--coalesce(d20b.iscfibroad2013_SV,'Övriga eller Information saknasa')
	  ,[Utb.område, nivå 2 (sökobjekt)] = d20.koulutusalataso2_sv--coalesce(d20b.iscfinarrow2013_SV,'Övriga eller Information saknasa')
	  ,[Utb.område, nivå 3 (sökobjekt)] = d20.koulutusalataso3_sv--coalesce(d20b.iscfi2013_SV,'Övriga eller Information saknasa')
	  ,[UKM-styrningsområde (sökobjekt)] = d20.okmohjauksenala_sv
	  ,[Ansökningsönskemål] = f.hakutoive
	  ,[Huvudsaklig examen (ansökningsmål)] = d20.koulutusluokitus_sv

	  ,[1 Sökobjekt] = d34.selite_sv
	  ,[1 Utb.område, nivå 1] = d33.koulutusalataso1_sv
	  ,[1 Utb.område, nivå 2] = d33.koulutusalataso2_sv
	  ,[1 Utb.område, nivå 3] = d33.koulutusalataso3_sv

	  ,[2 Sökobjekt] = d36.selite_sv
	  ,[2 Utb.område, nivå 1] = d35.koulutusalataso1_sv
	  ,[2 Utb.område, nivå 2] = d35.koulutusalataso2_sv
	  ,[2 Utb.område, nivå 3] = d35.koulutusalataso3_sv

	  ,[3 Sökobjekt] = d38.selite_sv
	  ,[3 Utb.område, nivå 1] = d37.koulutusalataso1_sv
	  ,[3 Utb.område, nivå 2] = d37.koulutusalataso2_sv
	  ,[3 Utb.område, nivå 3] = d37.koulutusalataso3_sv

	  ,[4 Sökobjekt] = d40.selite_sv
	  ,[4 Utb.område, nivå 1] = d39.koulutusalataso1_sv
	  ,[4 Utb.område, nivå 2] = d39.koulutusalataso2_sv
	  ,[4 Utb.område, nivå 3] = d39.koulutusalataso3_sv

	  ,[5 Sökobjekt] = d42.selite_sv
	  ,[5 Utb.område, nivå 1] = d41.koulutusalataso1_sv
	  ,[5 Utb.område, nivå 2] = d41.koulutusalataso2_sv
	  ,[5 Utb.område, nivå 3] = d41.koulutusalataso3_sv

	  ,[6 Sökobjekt] = d43b.selite_sv
	  ,[6 Utb.område, nivå 1] = d43.koulutusalataso1_sv
	  ,[6 Utb.område, nivå 2] = d43.koulutusalataso2_sv
	  ,[6 Utb.område, nivå 3] = d43.koulutusalataso3_sv

	  ,[Ålder] = d9.ika_SV
	  ,[Åldersgrupp] = d9.ikaryhma2_sv
	  ,[Medborgarskap] = d28.maa_SV
	  ,[Medborgarskap (världsdel)] = d30.maanosa5_sv
	  ,[Medborgarskap (gruppen)] = d30.maanosa6_sv
	  ,[Hemkommun] = d6.kunta_SV
	  ,[Hemlandskap] = d6.maakunta_SV
	  ,[Begynnelseår] = f.koulutuksen_alkamisvuosi
	  ,[Begynnelsetermin] = d2.selite_sv
	  ,[Utbildningens språk] = d27.selite_sv
	  ,[Studiernas omfattning] = f.laajuus
	  ,[Grundutbildningens land] = 
		case 
			when d4.kytkin_koodi = 1 then ' Utomlands' 
			when d4.kytkin_koodi = 0 then ' Finland' 
			else d4.kytkin_fi
		end
	  ,[Grundutbildningens land (prioriterat)] = 
		case 
			when f.pohjakoulutus_suomessa_priorisoitu = 1 then ' Finland' 
			when f.pohjakoulutus_suomessa_priorisoitu = 0 then ' Utomlands' 
			else 'Information saknas'
		end
	  ,[Internationell studerande] = d50.kytkin_sv
	  ,[Grundutbildning] = d22.selite_sv
	  ,[Yrkesinr. grundex., examen på skolnivå, examen på institutsnivå eller yrkesinr. examen på högre nivå som avlagts i Finland*] = d49a.kytkin_sv
	  ,[Yrkesinriktad grundexamen som avlagts i Finland*] = d49b.kytkin_sv
	  ,[Yrkesexamen eller specialyrkesexamen som avlagts i Finland*] = d49c.kytkin_sv
	  ,[Yrkesinriktad examen på skolnivå, examen på institutsnivå eller yrkesinriktad examen på högre nivå som avlagts i Finland*] = d49d.kytkin_sv
	  ,[Studier som högskolan kräver vid en öppen högskola*] = d49e.kytkin_sv
	  ,[Högskoleexamen som avlagts i Finland*] = d49f.kytkin_sv
	  ,[Högskoleexamen som avlagts annanstans än i Finland*] = d49g.kytkin_sv
	  ,[Gymnasiets lärokurs som avlagts i Finland utan studentexamen*] = d49h.kytkin_sv
	  ,[Utbildning på andra stadiet som avlagts annanstans än i Finland, och ger behörighet för högskolestudier i ifrågavarande land*] = d49i.kytkin_sv
	  ,[Studentexamen som avlagts i Finland*] = d49j.kytkin_sv
	  ,[Dubbelexamen som avlagts i Finland*] = d49k.kytkin_sv
	  ,[Internationell studentexamen som avlagts i Finland (IB, EB och RP/DIA)*] = d49l.kytkin_sv
	  ,[Internationell studentexamen som avlagts annanstans än i Finland (IB, EB och RP/DIA)*] = d49m.kytkin_sv
	  ,[Övrig högskolebehörighet*] = d49n.kytkin_sv
	  ,[Sektor] = d20.koulutussektori_sv--coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'Yrkeshögskoleutbildning' when f.sektori_kk = 'Ammattikorkeakoulutus' then 'Yrkeshögskoleutbildning' when f.sektori_kk = 'Yliopistokoulutus' then 'Universitetsutbildning' else 'Information saknas' end, 'Information saknas')
	  ,[Kön] = d7.sukupuoli_SV
	  ,[År då andra stadiets utbildning avlagts] = case f.toisen_asteen_koulutuksen_suoritusvuosi when '-1' then 'Information saknas' else f.toisen_asteen_koulutuksen_suoritusvuosi end
	  ,[Examensnivå (sökobjekt)] = d45.selite_sv
	  ,[Cykeln (sökobjekt)] = d44.selite_sv
	  ,[Modersmål] = d8.kieliryhma1_sv

--Englanti
	  ,[Considered as a first-time applicant] = case f.ensikertalainen when 0 then 'Not considered as a first-time applicant' when 1 then 'Considered as a first-time applicant' else 'Missing data' end
	  ,[First-time applicant] = d18.kytkin_en
	  ,[Application to UAS/Univ.] = d46.selite_en
	  ,[Application] = d25.haun_nimi_en
	  ,[Application period] = coalesce(d25.hakuaika_en,'Missing information') 
	  ,[Applied study programme] = d10.selite_en
	  ,[Applied study programme group specification] = d25.kohdejoukontarkenne_en
	  ,[Joint/separate application] = case when d25.hakutapa_fi ='Jatkuva haku' then 'Separate application' else d25.hakutapa_en end --Application system
	  ,[Application round] = d25.hakutyyppi_en
	  ,[Higher education institution] = d16b.organisaatio_en
	  ,[Faculty/campus] = d16c.organisaatio_en--isnull(d16.toimipiste_EN,d16.oppilaitos_EN)
	  ,[Region of study programme] = d19.maakunta_EN
	  ,[Municipality of study programme] = d19.kunta_EN
	  ,[Level of education] = d20.koulutusaste2002_EN
	  ,[Field of ed. (2002)] = d20.koulutusala2002_en
	  ,[Subfield of ed. (2002)] = d20.opintoala2002_EN
	  ,[Field of ed. (1995)] = d20.opintoala1995_EN
	  ,[Level of ed., tier 1] = d20.koulutusastetaso1_en--coalesce(d20b.iscle2011_EN,'Unknown')--tier 1
	  ,[Level of ed., tier 2] = d20.koulutusastetaso2_en--coalesce(d20b.koulutusaste_taso2_EN,'Unknown')--tier 2
	  ,[Field of ed., level 1] = d20.koulutusalataso1_en--coalesce(d20b.iscfibroad2013_EN,'Unknown')--tier 1
	  ,[Field of ed., level 2] = d20.koulutusalataso2_en--coalesce(d20b.iscfinarrow2013_EN,'Unknown')--tier 2
	  ,[Field of ed., level 3] = d20.koulutusalataso3_en--coalesce(d20b.iscfi2013_EN,'Unknown')--tier 3
	  ,[Field of ed., HE steering] = d20.okmohjauksenala_en
	  ,[Preference of study programme] = f.hakutoive
	  ,[Main degree (applied study programme)] = d20.koulutusluokitus_en

	  ,[1 Study programme] = d34.selite_en
	  ,[1 Field of ed., tier 1] = d33.koulutusalataso1_en
	  ,[1 Field of ed., tier 2] = d33.koulutusalataso2_en
	  ,[1 Field of ed., tier 3] = d33.koulutusalataso3_en

	  ,[2 Study programme] = d36.selite_en
	  ,[2 Field of ed., tier 1] = d35.koulutusalataso1_en
	  ,[2 Field of ed., tier 2] = d35.koulutusalataso2_en
	  ,[2 Field of ed., tier 3] = d35.koulutusalataso3_en

	  ,[3 Study programme] = d38.selite_en
	  ,[3 Field of ed., tier 1] = d37.koulutusalataso1_en
	  ,[3 Field of ed., tier 2] = d37.koulutusalataso2_en
	  ,[3 Field of ed., tier 3] = d37.koulutusalataso3_en

	  ,[4 Study programme] = d40.selite_en
	  ,[4 Field of ed., tier 1] = d39.koulutusalataso1_en
	  ,[4 Field of ed., tier 2] = d39.koulutusalataso2_en
	  ,[4 Field of ed., tier 3] = d39.koulutusalataso3_en

	  ,[5 Study programme] = d42.selite_en
	  ,[5 Field of ed., tier 1] = d41.koulutusalataso1_en
	  ,[5 Field of ed., tier 2] = d41.koulutusalataso2_en
	  ,[5 Field of ed., tier 3] = d41.koulutusalataso3_en

	  ,[6 Study programme] = d43b.selite_en
	  ,[6 Field of ed., tier 1] = d43.koulutusalataso1_en
	  ,[6 Field of ed., tier 2] = d43.koulutusalataso2_en
	  ,[6 Field of ed., tier 3] = d43.koulutusalataso3_en

	  ,[Age] = d9.ika_EN
	  ,[Age group] = d9.ikaryhma2_en
	  ,[Nationality] = d28.maa_EN
	  ,[Nationality (continent)] = d30.maanosa5_en
	  ,[Nationality (group)] = d30.maanosa6_en
	  ,[Municipality of residence] = d6.kunta_EN
	  ,[Region of residence] = d6.maakunta_EN
	  ,[Year (start of studies)] = f.koulutuksen_alkamisvuosi
	  ,[Term (start of studies)] = d2.selite_en
	  ,[Language of education] = d27.selite_en
	  ,[Extent of the study programme] = f.laajuus
	  ,[Country of prior education] = 
		case 
			when d4.kytkin_koodi = 1 then 'Abroad' 
			when d4.kytkin_koodi = 0 then ' Finland' 
			else d4.kytkin_fi
		end
	  ,[Country of prior education (prioritised)] = 
		case 
			when f.pohjakoulutus_suomessa_priorisoitu = 1 then ' Finland' 
			when f.pohjakoulutus_suomessa_priorisoitu = 0 then 'Abroad' 
			else 'Missing information'
		end
	  ,[International student] = d50.kytkin_sv
	  ,[Prior education] = d22.selite_en
	  ,[Vocat. upper sec. qualif., school-level qualif., post-sec. level qualif. or higher vocat. level qualif. cmpl. in Finland*] = d49a.kytkin_en
	  ,[Vocational upper secondary qualification completed in Finland (ammatillinen perustutkinto)*] = d49b.kytkin_en
	  ,[Further or specialist vocational qualification completed in Finland (ammatti- tai erikoisammattitutkinto)*] = d49c.kytkin_en
	  ,[Former vocational qualification completed in Finland (kouluasteen, opistoasteen tai ammatillisen korkea-asteen tutkinto)*] = d49d.kytkin_en
	  ,[Studies required by the higher education institution completed at open university or open polytechnic/UAS*] = d49e.kytkin_en
	  ,[Bachelor’s/Master’s/Doctoral degree completed in Finland*] = d49f.kytkin_en
	  ,[Bachelor’s/Master’s/Doctoral degree completed outside Finland*] = d49g.kytkin_en
	  ,[General upper secondary school syllabus completed in Finland (without matriculation examination)*] = d49h.kytkin_en
	  ,[Upper secondary education completed outside Finland (general or vocational)*] = d49i.kytkin_en
	  ,[Matriculation examination completed in Finland*] = d49j.kytkin_en
	  ,[Double upper secondary qualification completed in Finland (kaksoistutkinto)*] = d49k.kytkin_en
	  ,[International matriculation examination completed in Finland (IB, EB and RP/DIA)*] = d49l.kytkin_en
	  ,[International matriculation examination completed outside Finland (IB, EB and RP/DIA)*] = d49m.kytkin_en
	  ,[Other eligibility for higher education*] = d49n.kytkin_en

	  ,[Sector] = d20.koulutussektori_en--coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'University of applied sciences education' when f.sektori_kk = 'Ammattikorkeakoulutus' then 'University of applied sciences education' when f.sektori_kk = 'Yliopistokoulutus' then 'University education' else 'Unknown' end, 'Unknown')
	  ,[Gender] = d7.sukupuoli_EN
	  ,[Graduation year (upper secondary education)] = case f.toisen_asteen_koulutuksen_suoritusvuosi when '-1' then 'Unknown' else f.toisen_asteen_koulutuksen_suoritusvuosi end
	  ,[Level of degree] = d45.selite_en
	  ,[Beginning cycle of education] =  d44.selite_en
	  ,[Mother tongue] = d8.kieliryhma1_en
	   
	 --KOODIMUUTTUJAT
	  ,[Koodit Koulutusala, taso 1 (hakukohde)] = d20.koulutusalataso1_koodi
	  ,[Koodit Koulutusala, taso 2 (hakukohde)] = d20.koulutusalataso2_koodi
	  ,[Koodit Koulutusala, taso 3 (hakukohde)] = d20.koulutusalataso3_koodi
	  ,[Koodit OKM ohjauksen ala (hakukohde)] = d20.okmohjauksenala_koodi
	  ,[Koodit Koulutuksen järjestäjä] = d16a.organisaatio_koodi
	  ,[Koodit Korkeakoulu] = d16b.organisaatio_koodi
	  ,[Koodit Maakunta hakukohde] = d19.maakunta_koodi
	  ,[Koodit Kunta hakukohde] = d19.kunta_koodi
	  ,[Koodit Kotimaakunta hakija] = d6.maakunta_koodi
	  ,[Koodit Kotikunta hakija] = d6.kunta_koodi
	  ,[Koodit Pääasiallinen koulutusnimike] = d20.koulutusluokitus_koodi
	  

--Apusarakkeet mittareille	    

		/* nettouttamatonta hakijamäärää varten valitaan yksi pohjakoulutus per hakija (per haku) */
	  ,[yksi_pk_per_hakija] = case when f.pk_rnk = 1 then 1 else 0 end
	  
	  --f.loadtime>=d1.hakijat vuosikellorajauksessa
	  ,[Hakijat2] = case when master_oid is not null then 1 else 0 end --case when f.loadtime>=d1.hakijat then 1 else 0 end
	  ,[Ensisijaiset hakijat2] = case when /*f.loadtime>=d1.hakijat and*/ hakutoive=1 then 1 else 0 end
	  ,[Valitut2] = case when f.loadtime>=d1.valitut then f.valittu else 0 end
	  ,[Paikan vastaanottaneet2] = case when f.loadtime>=d1.vastaanottaneet then f.vastaanottanut_paikan else 0	end		
	  ,[Aloittaneet2] = case when f.loadtime>=d1.aloittaneet  then f.ilmoittautunut else 0 end
					
	  --Järjestys-kentät
	  ,[Ensikertainen hakija järjestys] = f.ensikertalainen
	  ,[Hakuaika järjestys] = 999 --coalesce(d31.jarjestys2,999)
	  ,[Haku AMK/YO järjestys] = d46.jarjestys_koodi
 	  ,[Hakukohteen koulutusaste 2002 järjestys] = d20.jarjestys_koulutusaste2002_koodi
 	  ,[Hakukohteen koulutusala 2002 järjestys] = d20.jarjestys_koulutusala2002_koodi
 	  ,[Hakukohteen opintoala 2002 järjestys] = d20.jarjestys_opintoala2002_koodi
 	  ,[Hakukohteen koulutusala 1995 järjestys] = d20.jarjestys_opintoala1995_koodi
	  ,[Koulutusaste, taso 1 järjestys] = d20.jarjestys_koulutusastetaso1_koodi
	  ,[Koulutusaste, taso 2 järjestys] = d20.jarjestys_koulutusastetaso2_koodi
	  ,[Koulutusala, taso 1 järjestys] = d20.jarjestys_koulutusalataso1_koodi
	  ,[Koulutusala, taso 2 järjestys] = d20.jarjestys_koulutusalataso2_koodi
	  ,[Koulutusala, taso 3 järjestys] = d20.jarjestys_koulutusalataso3_koodi
	  ,[OKM ohjauksen ala järjestys] = d20.jarjestys_okmohjauksenala_koodi
	  ,[Hakutoive järjestys] = f.hakutoive
 	  ,[Hakukohteen maakunta järjestys] = d19.jarjestys_maakunta_koodi
	  ,[Hakutapa järjestys] = case when d25.hakutapa_fi = 'Jatkuva haku' then 2 else d25.jarjestys_hakutapa end
	  ,[Hakutyyppi järjestys] = d25.jarjestys_hakutyyppi
	  ,[Ikä järjestys] = d9.jarjestys_ika
	  ,[Ikä 5v järjestys] = d9.jarjestys_ikaryhma2
	  ,[Kansalaisuus järjestys] = d28.jarjestys
	  ,[Kansalaisuus maanosa järjestys] = d30.jarjestys_maanosa5_koodi
	  ,[Kansalaisuus ryhmä järjestys] = d30.jarjestys_maanosa6_koodi
	  ,[Kotipaikkakunta järjestys] = left(d6.kunta_fi, 4)
	  ,[Kotipaikan maakunta järjestys] = d6.jarjestys_maakunta_koodi
	  ,[Kotipaikan AVI järjestys] = d6.jarjestys_avi_koodi
	  ,[Kotipaikan ELY järjestys] = d6.jarjestys_ely_koodi
	  ,[Koulutuksen kieli järjestys] = d27.jarjestys
	  ,[Opiskelun laajuus järjestys] = f.laajuus
	  ,[Pohjakoulutuksen maa järjestys] = d4.jarjestys_kytkin_koodi
	  ,[Pohjakoulutus järjestys] = left(d22.selite_fi,3)--d22.jarjestys--case d22.jarjestys when '98' then 'yy' when 'yo' then 'aa' else d22.jarjestys end
	  ,[Sektori järjestys] = d20.jarjestys_koulutussektori_koodi
	  ,[Sukupuoli järjestys] = d7.jarjestys_sukupuoli_koodi
	  ,[Toisen asteen koulutuksen suoritusvuosi järjestys] = case when f.toisen_asteen_koulutuksen_suoritusvuosi = 0 then 9999 else 9999-f.toisen_asteen_koulutuksen_suoritusvuosi end
	  ,[Tutkinnon taso (hakukohde) järjestys] = d45.jarjestys_koodi
	  ,[Tutkinnon aloitussykli (hakukohde) järjestys] = d44.jarjestys_koodi
	  ,[Äidinkieli versio1 järjestys] = d8.jarjestys_kieliryhma1
	  ,[Valintatapajonon tyyppi järjestys] = d48.jarjestys
	  ,[1 Koulutusala, taso 1 järjestys] = d33.jarjestys_koulutusalataso1_koodi
	  ,[1 Koulutusala, taso 2 järjestys] = d33.jarjestys_koulutusalataso2_koodi
	  ,[1 Koulutusala, taso 3 järjestys] = d33.jarjestys_koulutusalataso3_koodi
	  ,[2 Koulutusala, taso 1 järjestys] = d35.jarjestys_koulutusalataso1_koodi
	  ,[2 Koulutusala, taso 2 järjestys] = d35.jarjestys_koulutusalataso2_koodi
	  ,[2 Koulutusala, taso 3 järjestys] = d35.jarjestys_koulutusalataso3_koodi
	  ,[3 Koulutusala, taso 1 järjestys] = d37.jarjestys_koulutusalataso1_koodi
	  ,[3 Koulutusala, taso 2 järjestys] = d37.jarjestys_koulutusalataso2_koodi
	  ,[3 Koulutusala, taso 3 järjestys] = d37.jarjestys_koulutusalataso3_koodi
	  ,[4 Koulutusala, taso 1 järjestys] = d39.jarjestys_koulutusalataso1_koodi
	  ,[4 Koulutusala, taso 2 järjestys] = d39.jarjestys_koulutusalataso2_koodi
	  ,[4 Koulutusala, taso 3 järjestys] = d39.jarjestys_koulutusalataso3_koodi
	  ,[5 Koulutusala, taso 1 järjestys] = d41.jarjestys_koulutusalataso1_koodi
	  ,[5 Koulutusala, taso 2 järjestys] = d41.jarjestys_koulutusalataso2_koodi
	  ,[5 Koulutusala, taso 3 järjestys] = d41.jarjestys_koulutusalataso3_koodi
	  ,[6 Koulutusala, taso 1 järjestys] = d43.jarjestys_koulutusalataso1_koodi
	  ,[6 Koulutusala, taso 2 järjestys] = d43.jarjestys_koulutusalataso2_koodi
	  ,[6 Koulutusala, taso 3 järjestys] = d43.jarjestys_koulutusalataso3_koodi
	  ,d49a.jarjestys_kytkin_koodi as [pohjakoulutus_am järjestys]
	  ,d49b.jarjestys_kytkin_koodi as [pohjakoulutus_amp järjestys]
	  ,d49c.jarjestys_kytkin_koodi as [pohjakoulutus_amt järjestys]
	  ,d49d.jarjestys_kytkin_koodi as [pohjakoulutus_amv järjestys]
	  ,d49e.jarjestys_kytkin_koodi as [pohjakoulutus_avoin järjestys]
	  ,d49f.jarjestys_kytkin_koodi as [pohjakoulutus_kk järjestys]
	  ,d49g.jarjestys_kytkin_koodi as [pohjakoulutus_kk_ulk järjestys]
	  ,d49h.jarjestys_kytkin_koodi as [pohjakoulutus_lk järjestys]
	  ,d49i.jarjestys_kytkin_koodi as [pohjakoulutus_ulk järjestys]
	  ,d49j.jarjestys_kytkin_koodi as [pohjakoulutus_yo järjestys]
	  ,d49k.jarjestys_kytkin_koodi as [pohjakoulutus_yo_ammatillinen järjestys]
	  ,d49l.jarjestys_kytkin_koodi as [pohjakoulutus_yo_kansainvalinen_suomessa järjestys]
	  ,d49m.jarjestys_kytkin_koodi as [pohjakoulutus_yo_ulkomainen järjestys]
	  ,d49n.jarjestys_kytkin_koodi as [pohjakoulutus_muu järjestys]
	  ,d18.jarjestys_kytkin_koodi as jarjestys_ensikertainen_hakija

FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
INNER JOIN sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id --f.loadtime >= d1.hakijat huomioidaan faktalatauksen id-noudossa
--INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on ((d1.haku_oid=d25.haku_oid and d1.haku_oid is not null) OR (d1.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d2.jarjestys as varchar) and d25.hakutapa_koodi <> '01' and d1.haku_oid is null)) and f.loadtime >= d1.hakijat
LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_kytkin d4 ON d4.id=f.d_kytkin_pohjakoulutus_ulkomaat_id
LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.id = f.d_alueluokitus_kotikunta_id
LEFT JOIN ANTERO.dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_kieli d8 ON d8.id = f.d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_ika d9 ON d9.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatioluokitus_koulutustoimija_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN ANTERO.dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_pohjakoulutus d22 ON d22.id = f.d_pohjakoulutus_id
LEFT JOIN ANTERO.dw.d_oppilaitoksenopetuskieli d27 ON d27.id=f.d_oppilaitoksenopetuskieli_koulutuksen_kieli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d30 ON d30.id=f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN VipunenTK.dbo.d_valtio d28 ON d28.valtio_avain=d30.maatjavaltiot2_koodi
LEFT JOIN ANTERO.dw.d_hakukohde d32 ON d32.id=f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d33 ON d33.id=f.d_koulutusluokitus_hakukohde1_id
LEFT JOIN ANTERO.dw.d_hakukohde d34 ON d34.id=f.d_hakukohde_hakukohde1_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d35 ON d35.id=f.d_koulutusluokitus_hakukohde2_id
LEFT JOIN ANTERO.dw.d_hakukohde d36 ON d36.id=f.d_hakukohde_hakukohde2_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d37 ON d37.id=f.d_koulutusluokitus_hakukohde3_id
LEFT JOIN ANTERO.dw.d_hakukohde d38 ON d38.id=f.d_hakukohde_hakukohde3_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d39 ON d39.id=f.d_koulutusluokitus_hakukohde4_id
LEFT JOIN ANTERO.dw.d_hakukohde d40 ON d40.id=f.d_hakukohde_hakukohde4_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d41 ON d41.id=f.d_koulutusluokitus_hakukohde5_id
LEFT JOIN ANTERO.dw.d_hakukohde d42 ON d42.id=f.d_hakukohde_hakukohde5_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d43 ON d43.id=f.d_koulutusluokitus_hakukohde6_id
LEFT JOIN ANTERO.dw.d_hakukohde d43b ON d43b.id=f.d_hakukohde_hakukohde6_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d45 on d45.id=f.d_tutkinnon_taso_kk_id
LEFT JOIN ANTERO.dw.d_haku_amk_yo d46 on d46.id=f.d_haku_amk_yo_id
LEFT JOIN ANTERO.dw.d_valintatapajono d47 on d47.id = f.d_valintatapajono_id
LEFT JOIN ANTERO.dw.d_valintatapajonon_tyyppi d48 on d48.id = f.d_valintatapajonon_tyyppi_id
LEFT JOIN ANTERO.dw.d_kytkin d18 on d18.kytkin_koodi = COALESCE(f.aidosti_ensikertainen,-1)
LEFT JOIN ANTERO.dw.d_kytkin d49a on d49a.id = f.d_kytkin_pohjakoulutus_am_id
LEFT JOIN ANTERO.dw.d_kytkin d49b on d49b.id = f.d_kytkin_pohjakoulutus_amp_id  
LEFT JOIN ANTERO.dw.d_kytkin d49c on d49c.id = f.d_kytkin_pohjakoulutus_amt_id
LEFT JOIN ANTERO.dw.d_kytkin d49d on d49d.id = f.d_kytkin_pohjakoulutus_amv_id
LEFT JOIN ANTERO.dw.d_kytkin d49e on d49e.id = f.d_kytkin_pohjakoulutus_avoin_id
LEFT JOIN ANTERO.dw.d_kytkin d49f on d49f.id = f.d_kytkin_pohjakoulutus_kk_id
LEFT JOIN ANTERO.dw.d_kytkin d49g on d49g.id = f.d_kytkin_pohjakoulutus_kk_ulk_id
LEFT JOIN ANTERO.dw.d_kytkin d49h on d49h.id = f.d_kytkin_pohjakoulutus_lk_id
LEFT JOIN ANTERO.dw.d_kytkin d49i on d49i.id = f.d_kytkin_pohjakoulutus_ulk_id
LEFT JOIN ANTERO.dw.d_kytkin d49j on d49j.id = f.d_kytkin_pohjakoulutus_yo_id
LEFT JOIN ANTERO.dw.d_kytkin d49k on d49k.id = f.d_kytkin_pohjakoulutus_yo_ammatillinen_id
LEFT JOIN ANTERO.dw.d_kytkin d49l on d49l.id = f.d_kytkin_pohjakoulutus_yo_kansainvalinen_suomessa_id
LEFT JOIN ANTERO.dw.d_kytkin d49m on d49m.id = f.d_kytkin_pohjakoulutus_yo_ulkomainen_id
LEFT JOIN ANTERO.dw.d_kytkin d49n on d49n.id = f.d_kytkin_pohjakoulutus_muu_id
LEFT JOIN ANTERO.dw.d_kytkin d50 on d50.kytkin_koodi = f.kansainvalinen_opiskelija
WHERE (d20.koulutussektori_koodi = '4' or d10.selite_fi like 'Ammatillinen opettajankoulutus%')