USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk]    Script Date: 12.2.2026 12.11.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dw].[v_haku_ja_valinta_kk] AS

SELECT 
	cast(f.loadtime as date) as Päivitysaika
	,[Lukumäärä] = CASE WHEN master_oid is not null THEN 1 ELSE 0 END
	,[alpa] = f.alpa
	,[valpa] = 0
	,[Pisteraja] = f.pisteraja
	,[Ensikertaisena kohdeltava hakija] = CASE f.ensikertalainen WHEN 0 THEN 'Ei ensikertainen hakija ' WHEN 1 THEN 'Ensikertainen hakija' ELSE 'Tieto puuttuu' END
	,[Ensikertainen hakija] = d18.kytkin_fi
	,[Ensikertaisuuden lähde] = CASE WHEN f.ensikertaisuuden_lahde = 1 THEN 'ODW' WHEN f.ensikertaisuuden_lahde = 2 THEN 'Ovara' WHEN f.ensikertaisuuden_lahde = 3 THEN 'Virta-OTP' END
	,[Hakemus OID] = f.hakemus_oid
	,[Haku AMK/YO] = d21.selite_fi
	,[Haku] = d1.haun_nimi_fi
	,[Haku OID] = d1.haku_oid
	,[Hakuaika] = coalesce(d1.hakuaika_fi,'Tieto puuttuu')
	,[Hakukohde] = d10.selite_fi
	,[hakukohde OID] = d10.oid
	,[Haun kohdejoukon tarkenne] = d1.kohdejoukontarkenne_fi
	,[Hakutapa] = case d1.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d1.hakutapa_fi end
	,[Hakutyyppi] = d1.hakutyyppi_fi

	,[Hakukohteen koulutustoimija] = d5a.organisaatio_fi
	,[Hakukohteen oppilaitos] = d5b.organisaatio_fi
	,[Hakukohteen toimipiste] = d5c.organisaatio_fi

	,[Hakukohteen maakunta] = d11.maakunta_fi
	,[Hakukohteen kunta] = d11.kunta_fi
	--,[Hakukohteen koulutusaste] = d12.koulutusaste2002_fi
	--,[Hakukohteen koulutusala 2002] = d12.koulutusala2002_fi
	--,[Hakukohteen opintoala 2002] = d12.opintoala2002_fi
	--,[Hakukohteen koulutusala 1995] = d12.opintoala1995_fi
	,[Pääasiallinen tutkinto (hakukohde)] = d12.koulutusluokitus_fi
	,[Koulutusaste, taso 1 (hakukohde)] = d12.koulutusastetaso1_fi
	,[Koulutusaste, taso 2 (hakukohde)] = d12.koulutusastetaso2_fi
	,[Koulutusala, taso 1 (hakukohde)] = d12.koulutusalataso1_fi
	,[Koulutusala, taso 2 (hakukohde)] = d12.koulutusalataso2_fi
	,[Koulutusala, taso 3 (hakukohde)] = d12.koulutusalataso3_fi
	,[OKM ohjauksen ala (hakukohde)] = d12.okmohjauksenala_fi
	,[Hakutoive] = f.hakutoive

	--,[Korkeakoulu_hakukohde] = d5b.organisaatio_fi + '_' + d10.selite_fi
	,[1 Hakukohde] = d24.selite_fi
	,[1 Koulutusala, taso 1] = d25.koulutusalataso1_fi
	,[1 Koulutusala, taso 2] = d25.koulutusalataso2_fi
	,[1 Koulutusala, taso 3] = d25.koulutusalataso3_fi
	,[1 Sektori] = d25.koulutussektori_fi
	,[1 Aloitussykli] = d25b.selite_fi
	,[1 Korkeakoulu] = d25a.organisaatio_fi
	--,[1 Korkeakoulu_hakukohde] = d25a.organisaatio_fi + '_' + d24.selite_fi

	,[2 Hakukohde] = d26.selite_fi
	,[2 Koulutusala, taso 1] = d27.koulutusalataso1_fi
	,[2 Koulutusala, taso 2] = d27.koulutusalataso2_fi
	,[2 Koulutusala, taso 3] = d27.koulutusalataso3_fi
	,[2 Sektori] = d27.koulutussektori_fi
	,[2 Aloitussykli] = d27b.selite_fi
	,[2 Korkeakoulu] = d27a.organisaatio_fi
	--,[2 Korkeakoulu_hakukohde] = d27a.organisaatio_fi + '_' + d26.selite_fi

	,[3 Hakukohde] = d28.selite_fi
	,[3 Koulutusala, taso 1] = d29.koulutusalataso1_fi
	,[3 Koulutusala, taso 2] = d29.koulutusalataso2_fi
	,[3 Koulutusala, taso 3] = d29.koulutusalataso3_fi
	,[3 Sektori] = d29.koulutussektori_fi
	,[3 Aloitussykli] = d29b.selite_fi
	,[3 Korkeakoulu] = d29a.organisaatio_fi
	--,[3 Korkeakoulu_hakukohde] = d29a.organisaatio_fi + '_' + d28.selite_fi

	,[4 Hakukohde] = d30.selite_fi
	,[4 Koulutusala, taso 1] = d31.koulutusalataso1_fi
	,[4 Koulutusala, taso 2] = d31.koulutusalataso2_fi
	,[4 Koulutusala, taso 3] = d31.koulutusalataso3_fi
	,[4 Sektori] = d31.koulutussektori_fi
	,[4 Aloitussykli] = d31b.selite_fi
	,[4 Korkeakoulu] = d31a.organisaatio_fi
	--,[4 Korkeakoulu_hakukohde] = d31a.organisaatio_fi + '_' + d30.selite_fi

	,[5 Hakukohde] = d32.selite_fi
	,[5 Koulutusala, taso 1] = d33.koulutusalataso1_fi
	,[5 Koulutusala, taso 2] = d33.koulutusalataso2_fi
	,[5 Koulutusala, taso 3] = d33.koulutusalataso3_fi
	,[5 Sektori] = d33.koulutussektori_fi
	,[5 Aloitussykli] = d33b.selite_fi
	,[5 Korkeakoulu] = d33a.organisaatio_fi
	--,[5 Korkeakoulu_hakukohde] = d33a.organisaatio_fi + '_' + d32.selite_fi

	,[6 Hakukohde] = d34.selite_fi
	,[6 Koulutusala, taso 1] = d35.koulutusalataso1_fi
	,[6 Koulutusala, taso 2] = d35.koulutusalataso2_fi
	,[6 Koulutusala, taso 3] = d35.koulutusalataso3_fi
	,[6 Sektori] = d35.koulutussektori_fi
	,[6 Aloitussykli] = d35b.selite_fi
	,[6 Korkeakoulu] = d35a.organisaatio_fi
	--,[6 Korkeakoulu_hakukohde] = d35a.organisaatio_fi + '_' + d34.selite_fi

	,[Valintatapajonon nimi] = d39.selite_fi
	,[Valintatapajonon tyyppi] = d22.selite_fi
	,[Pisteet] = f.pisteet

	,[Henkilö OID] = f.master_oid
	,[Ikä] = d9.ika_fi
	,[Ikäryhmä] = d9.ikaryhma2_fi
	,[Kansalaisuus] = COALESCE(d16.maa,'Tieto puuttuu')
	,[Kansalaisuus (maanosa)] = d15.maanosa5_fi
	,[Kansalaisuus (ryhmä)] = d15.maanosa6_fi
	,[Kotipaikkakunta] = d6.kunta_fi
	,[Kotipaikan maakunta] = d6.maakunta_fi
	,[Hakijan kotimaakunta sama kuin hakukohteen maakunta] = 
		case
			when d6.maakunta_fi = 'Tieto puuttuu' or d6.maakunta_fi = 'Ei tiedossa (maakunta)' or d6.maakunta_fi is null then 'Tieto puuttuu'
			when d6.maakunta_fi = d11.maakunta_fi then 'Kyllä'
			else 'Ei'
		end
	--,[Kotipaikan AVI] = d6.avi_fi
	--,[Kotipaikan ELY] = d6.ely_fi
	,[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[Koulutuksen alkamiskausi] = d2.selite_fi
	,[Koulutuksen kieli] = d14.selite_fi
	,[Opiskelun laajuus] = coalesce(cast(f.laajuus as varchar), 'Tieto puuttuu')
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
	,[Pohjakoulutus] = d13.selite_fi 
	,[Suomessa suoritettu ammatillinen perustutkinto, kouluasteen, opistoasteen tai ammatillisen korkea-asteen tutkinto*] = d23a.kytkin_fi
	,[Suomessa suoritettu ammatillinen perustutkinto*] = d23b.kytkin_fi
	,[Suomessa suoritettu ammatti- tai erikoisammattitutkinto*] = d23c.kytkin_fi
	,[Suomessa suoritettu kouluasteen, opistoasteen tai ammatillisen korkea-asteen tutkinto*] = d23d.kytkin_fi
	,[Korkeakoulun edellyttämät avoimen korkeakoulun opinnot*] = d23e.kytkin_fi
	,[Suomessa suoritettu korkeakoulututkinto*] = d23f.kytkin_fi
	,[Muualla kuin Suomessa suoritettu korkeakoulututkinto*] = d23g.kytkin_fi
	,[Suomessa suoritettu lukion oppimäärä ilman ylioppilastutkintoa*] = d23h.kytkin_fi
	,[Muualla kuin Suomessa suoritettu toisen asteen koulutus, joka asianomaisessa maassa antaa hakukelpoisuuden korkeakouluun*] = d23i.kytkin_fi
	,[Suomessa suoritettu ylioppilastutkinto*] = d23j.kytkin_fi
	,[Suomessa suoritettu kaksoistutkinto (ammatillinen perustutkinto ja ylioppilastutkinto)*] = d23k.kytkin_fi
	,[Suomessa suoritettu kansainvälinen ylioppilastutkinto (IB, EB ja RP/DIA)*] = d23l.kytkin_fi
	,[Muualla kuin Suomessa suoritettu kansainvälinen ylioppilastutkinto (IB, EB ja RP/DIA)*] = d23m.kytkin_fi
	,[Muu korkeakoulukelpoisuus*] = d23n.kytkin_fi

	,[Sektori] = case when d10.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d12.koulutussektori_fi end
	,[Sukupuoli] = d7.sukupuoli_fi
	,[Toisen asteen koulutuksen suoritusvuosi] = case f.toisen_asteen_koulutuksen_suoritusvuosi when null then 'Tieto puuttuu' else cast(f.toisen_asteen_koulutuksen_suoritusvuosi as varchar) end
	,[Ylioppilastutkinnon suoritusvuosi] = d3.vuosi
	,[Tutkinnon taso (hakukohde)] = d20.selite_fi
	,[Tutkinnon aloitussykli (hakukohde)] = d19.selite_fi 
	,[Äidinkieli] = d8.kieliryhma1_fi
	  
	,[Aloittanut opinnot toisen asteen koulutuksen suoritusvuonna] = d37.kytkin_fi
	,[Aloittanut opinnot ilmoittamansa pohjakoulutuksen suoritusvuonna] = d38.kytkin_fi
	,[Kansainvälinen opiskelija] = d36.kytkin_fi
			
	--Ruotsi
	,[Behandlas som förstagångssökande] = case f.ensikertalainen when 0 then 'Ej förstagångssökande' when 1 then 'Förstagångssökande' else 'Information saknas' end
	,[Förstagångssökande] = d18.kytkin_sv
	,[Ansökan YH/Univ.] = d21.selite_sv	
	--,[Ansökning] = d1.haun_nimi_sv
	,[Ansökningstiden] = coalesce(d1.hakuaika_sv,'Information saknas')
	,[Sökobjekt] = d10.selite_sv
	,[Ansökans målgrupps specifikation] = d1.kohdejoukontarkenne_sv
	,[Gemensam/separat ansökan] = case d1.hakutapa_fi when 'Jatkuva haku' then 'Separata antagningar' else d1.hakutapa_sv end
	,[Typ av ansökan] = d1.hakutyyppi_sv
	,[Högskola (sökobjekt)] = d5b.organisaatio_sv
	,[Anstalt (sökobjekt)] = d5c.organisaatio_sv
	,[Landskap (sökobjekt)] = d11.maakunta_SV
	,[Kommun (sökobjekt)] = d11.kunta_SV
	--,[Utb.nivå (sökobjekt)] = d12.koulutusaste2002_SV
	--,[Utb.område (2002) (sökobjekt)] = d12.koulutusala2002_sv
	--,[Studieområde (2002) (sökobjekt)] = d12.opintoala2002_SV
	--,[Utb.område (1995) (sökobjekt)] = d12.opintoala1995_SV
	,[Utb.nivå, nivå 1 (sökobjekt)] = d12.koulutusastetaso1_sv--coalesce(d12b.iscle2011_SV,'Övriga eller Information saknasa')
	,[Utb.nivå, nivå 2 (sökobjekt)] = d12.koulutusastetaso2_sv--coalesce(d12b.koulutusaste_taso2_SV,'Övriga eller Information saknasa')
	,[Utb.område, nivå 1 (sökobjekt)] = d12.koulutusalataso1_sv--coalesce(d12b.iscfibroad1213_SV,'Övriga eller Information saknasa')
	,[Utb.område, nivå 2 (sökobjekt)] = d12.koulutusalataso2_sv--coalesce(d12b.iscfinarrow2013_SV,'Övriga eller Information saknasa')
	,[Utb.område, nivå 3 (sökobjekt)] = d12.koulutusalataso3_sv--coalesce(d12b.iscfi2013_SV,'Övriga eller Information saknasa')
	,[UKM-styrningsområde (sökobjekt)] = d12.okmohjauksenala_sv
	,[Ansökningsönskemål] = f.hakutoive
	,[Huvudsaklig examen (ansökningsmål)] = d12.koulutusluokitus_sv

	--,[Högskola_sökobjekt] = d5b.organisaatio_sv + '_' + d10.selite_sv
	,[1 Sökobjekt] = d24.selite_sv
	,[1 Utb.område, nivå 1] = d25.koulutusalataso1_sv
	,[1 Utb.område, nivå 2] = d25.koulutusalataso2_sv
	,[1 Utb.område, nivå 3] = d25.koulutusalataso3_sv
	,[1 Sektor] = d25.koulutussektori_sv
	,[1 Cykeln] = d25b.selite_sv
	,[1 Högskola] = d25a.organisaatio_sv
	--,[1 Högskola_sökobjekt] = d25a.organisaatio_sv + '_' + d24.selite_sv

	,[2 Sökobjekt] = d26.selite_sv
	,[2 Utb.område, nivå 1] = d27.koulutusalataso1_sv
	,[2 Utb.område, nivå 2] = d27.koulutusalataso2_sv
	,[2 Utb.område, nivå 3] = d27.koulutusalataso3_sv
	,[2 Sektor] = d27.koulutussektori_sv
	,[2 Cykeln] = d27b.selite_sv
	,[2 Högskola] = d27a.organisaatio_sv
	--,[2 Högskola_sökobjekt] = d27a.organisaatio_sv + '_' + d26.selite_sv

	,[3 Sökobjekt] = d28.selite_sv
	,[3 Utb.område, nivå 1] = d29.koulutusalataso1_sv
	,[3 Utb.område, nivå 2] = d29.koulutusalataso2_sv
	,[3 Utb.område, nivå 3] = d29.koulutusalataso3_sv
	,[3 Sektor] = d29.koulutussektori_sv
	,[3 Cykeln] = d29b.selite_sv
	,[3 Högskola] = d29a.organisaatio_sv
	--,[3 Högskola_sökobjekt] = d29a.organisaatio_sv + '_' + d28.selite_sv

	,[4 Sökobjekt] = d30.selite_sv
	,[4 Utb.område, nivå 1] = d31.koulutusalataso1_sv
	,[4 Utb.område, nivå 2] = d31.koulutusalataso2_sv
	,[4 Utb.område, nivå 3] = d31.koulutusalataso3_sv
	,[4 Sektor] = d31.koulutussektori_sv
	,[4 Cykeln] = d31b.selite_sv
	,[4 Högskola] = d31a.organisaatio_sv
	--,[4 Högskola_sökobjekt] = d31a.organisaatio_sv + '_' + d30.selite_sv

	,[5 Sökobjekt] = d32.selite_sv
	,[5 Utb.område, nivå 1] = d33.koulutusalataso1_sv
	,[5 Utb.område, nivå 2] = d33.koulutusalataso2_sv
	,[5 Utb.område, nivå 3] = d33.koulutusalataso3_sv
	,[5 Sektor] = d33.koulutussektori_sv
	,[5 Cykeln] = d33b.selite_sv
	,[5 Högskola] = d33a.organisaatio_sv
	--,[5 Högskola_sökobjekt] = d33a.organisaatio_sv + '_' + d32.selite_sv

	,[6 Sökobjekt] = d34.selite_sv
	,[6 Utb.område, nivå 1] = d35.koulutusalataso1_sv
	,[6 Utb.område, nivå 2] = d35.koulutusalataso2_sv
	,[6 Utb.område, nivå 3] = d35.koulutusalataso3_sv
	,[6 Sektor] = d35.koulutussektori_sv
	,[6 Cykeln] = d35b.selite_sv
	,[6 Högskola] = d35a.organisaatio_sv
	--,[6 Högskola_sökobjekt] = d35a.organisaatio_sv + '_' + d34.selite_sv

	,[Typ av antagningskö] = d22.selite_sv
	,[Namnet på antagningskö] = d39.selite_sv
	 
	--,[Ålder] = d9.ika_SV
	,[Åldersgrupp] = d9.ikaryhma2_sv
	,[Medborgarskap] = d16.maa_SV
	,[Medborgarskap (världsdel)] = d15.maanosa5_sv
	,[Medborgarskap (gruppen)] = d15.maanosa6_sv
	,[Hemkommun] = d6.kunta_SV
	,[Hemlandskap] = d6.maakunta_SV
	,[Begynnelseår] = f.koulutuksen_alkamisvuosi
	,[Begynnelsetermin] = d2.selite_sv
	,[Utbildningens språk] = d14.selite_sv
	,[Studiernas omfattning] = coalesce(cast(f.laajuus as varchar), 'Information saknas')
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
	,[Grundutbildning] = d13.selite_sv
	,[Yrkesinr. grundex., examen på skolnivå, examen på institutsnivå eller yrkesinr. examen på högre nivå som avlagts i Finland*] = d23a.kytkin_sv
	,[Yrkesinriktad grundexamen som avlagts i Finland*] = d23b.kytkin_sv
	,[Yrkesexamen eller specialyrkesexamen som avlagts i Finland*] = d23c.kytkin_sv
	,[Yrkesinriktad examen på skolnivå, examen på institutsnivå eller yrkesinriktad examen på högre nivå som avlagts i Finland*] = d23d.kytkin_sv
	,[Studier som högskolan kräver vid en öppen högskola*] = d23e.kytkin_sv
	,[Högskoleexamen som avlagts i Finland*] = d23f.kytkin_sv
	,[Högskoleexamen som avlagts annanstans än i Finland*] = d23g.kytkin_sv
	,[Gymnasiets lärokurs som avlagts i Finland utan studentexamen*] = d23h.kytkin_sv
	,[Utbildning på andra stadiet som avlagts annanstans än i Finland, och ger behörighet för högskolestudier i ifrågavarande land*] = d23i.kytkin_sv
	,[Studentexamen som avlagts i Finland*] = d23j.kytkin_sv
	,[Dubbelexamen som avlagts i Finland*] = d23k.kytkin_sv
	,[Internationell studentexamen som avlagts i Finland (IB, EB och RP/DIA)*] = d23l.kytkin_sv
	,[Internationell studentexamen som avlagts annanstans än i Finland (IB, EB och RP/DIA)*] = d23m.kytkin_sv
	,[Övrig högskolebehörighet*] = d23n.kytkin_sv

	,[Sektor] = d12.koulutussektori_sv
	,[Kön] = d7.sukupuoli_SV
	,[År då andra stadiets utbildning avlagts] = case f.toisen_asteen_koulutuksen_suoritusvuosi when '-1' then 'Information saknas' else f.toisen_asteen_koulutuksen_suoritusvuosi end
	,[Examensnivå (sökobjekt)] = d20.selite_sv
	,[Cykeln (sökobjekt)] = d19.selite_sv
	,[Modersmål] = d8.kieliryhma1_sv
	,[Internationell studerande] = d36.kytkin_sv

	--Englanti
	,[Considered as a first-time applicant] = case f.ensikertalainen when 0 then 'Not considered as a first-time applicant' when 1 then 'Considered as a first-time applicant' else 'Missing data' end
	,[First-time applicant] = d18.kytkin_en
	,[Application to UAS/Univ.] = d21.selite_en
	--,[Application] = d1.haun_nimi_en
	,[Application period] = coalesce(d1.hakuaika_en,'Missing information') 
	,[Applied study programme] = d10.selite_en
	,[Applied study programme group specification] = d1.kohdejoukontarkenne_en
	,[Joint/separate application] = case when d1.hakutapa_fi = 'Jatkuva haku' then 'Separate application' else d1.hakutapa_en end --Application system
	,[Application round] = d1.hakutyyppi_en
	,[Higher education institution] = d5b.organisaatio_en
	,[Faculty/campus] = d5c.organisaatio_en--isnull(d5.toimipiste_EN,d5.oppilaitos_EN)
	,[Region of study programme] = d11.maakunta_EN
	,[Municipality of study programme] = d11.kunta_EN
	--,[Level of education] = d12.koulutusaste2002_EN
	--,[Field of ed. (2002)] = d12.koulutusala2002_en
	--,[Subfield of ed. (2002)] = d12.opintoala2002_EN
	--,[Field of ed. (1995)] = d12.opintoala1995_EN
	,[Level of ed., tier 1] = d12.koulutusastetaso1_en--coalesce(d12b.iscle2011_EN,'Unknown')--tier 1
	,[Level of ed., tier 2] = d12.koulutusastetaso2_en--coalesce(d12b.koulutusaste_taso2_EN,'Unknown')--tier 2
	,[Field of ed., level 1] = d12.koulutusalataso1_en--coalesce(d12b.iscfibroad1213_EN,'Unknown')--tier 1
	,[Field of ed., level 2] = d12.koulutusalataso2_en--coalesce(d12b.iscfinarrow2013_EN,'Unknown')--tier 2
	,[Field of ed., level 3] = d12.koulutusalataso3_en--coalesce(d12b.iscfi2013_EN,'Unknown')--tier 3
	,[Field of ed., HE steering] = d12.okmohjauksenala_en
	,[Preference of study programme] = f.hakutoive
	,[Main degree (applied study programme)] = d12.koulutusluokitus_en

	--,[HE institution_study programme] = d5b.organisaatio_en + '_' + d10.selite_en
	,[1 Study programme] = d24.selite_en
	,[1 Field of ed., tier 1] = d25.koulutusalataso1_en
	,[1 Field of ed., tier 2] = d25.koulutusalataso2_en
	,[1 Field of ed., tier 3] = d25.koulutusalataso3_en
	,[1 Sector] = d25.koulutussektori_en
	,[1 Beginning cycle] = d25b.selite_en
	,[1 HE institution] = d25a.organisaatio_en
	--,[1 HE institution_study programme] = d25a.organisaatio_en + '_' + d24.selite_en

	,[2 Study programme] = d26.selite_en
	,[2 Field of ed., tier 1] = d27.koulutusalataso1_en
	,[2 Field of ed., tier 2] = d27.koulutusalataso2_en
	,[2 Field of ed., tier 3] = d27.koulutusalataso3_en
	,[2 Sector] = d27.koulutussektori_en
	,[2 Beginning cycle] = d27b.selite_en
	,[2 HE institution] = d27a.organisaatio_en
	--,[2 HE institution_study programme] = d27a.organisaatio_en + '_' + d26.selite_en

	,[3 Study programme] = d28.selite_en
	,[3 Field of ed., tier 1] = d29.koulutusalataso1_en
	,[3 Field of ed., tier 2] = d29.koulutusalataso2_en
	,[3 Field of ed., tier 3] = d29.koulutusalataso3_en
	,[3 Sector] = d29.koulutussektori_en
	,[3 Beginning cycle] = d29b.selite_en
	,[3 HE institution] = d29a.organisaatio_en
	--,[3 HE institution_study programme] = d29a.organisaatio_en + '_' + d28.selite_en

	,[4 Study programme] = d30.selite_en
	,[4 Field of ed., tier 1] = d31.koulutusalataso1_en
	,[4 Field of ed., tier 2] = d31.koulutusalataso2_en
	,[4 Field of ed., tier 3] = d31.koulutusalataso3_en
	,[4 Sector] = d31.koulutussektori_en
	,[4 Beginning cycle] = d31b.selite_en
	,[4 HE institution] = d31a.organisaatio_en
	--,[4 HE institution_study programme] = d31a.organisaatio_en + '_' + d30.selite_en

	,[5 Study programme] = d32.selite_en
	,[5 Field of ed., tier 1] = d33.koulutusalataso1_en
	,[5 Field of ed., tier 2] = d33.koulutusalataso2_en
	,[5 Field of ed., tier 3] = d33.koulutusalataso3_en
	,[5 Sector] = d33.koulutussektori_en
	,[5 Beginning cycle] = d33b.selite_en
	,[5 HE institution] = d33a.organisaatio_en
	--,[5 HE institution_study programme] = d33a.organisaatio_en + '_' + d32.selite_en

	,[6 Study programme] = d34.selite_en
	,[6 Field of ed., tier 1] = d35.koulutusalataso1_en
	,[6 Field of ed., tier 2] = d35.koulutusalataso2_en
	,[6 Field of ed., tier 3] = d35.koulutusalataso3_en
	,[6 Sector] = d35.koulutussektori_en
	,[6 Beginning cycle] = d35b.selite_en
	,[6 HE institution] = d35a.organisaatio_en
	--,[6 HE institution_study programme] = d35a.organisaatio_en + '_' + d34.selite_en

	,[Type of admission queue] = d22.selite_en

	--,[Age] = d9.ika_EN
	,[Age group] = d9.ikaryhma2_en
	,[Nationality] = d16.maa_EN
	,[Nationality (continent)] = d15.maanosa5_en
	,[Nationality (group)] = d15.maanosa6_en
	,[Municipality of residence] = d6.kunta_EN
	,[Region of residence] = d6.maakunta_EN
	,[Year (start of studies)] = f.koulutuksen_alkamisvuosi
	,[Term (start of studies)] = d2.selite_en
	,[Language of education] = d14.selite_en
	,[Extent of the study programme] = coalesce(cast(f.laajuus as varchar), 'Missing information')
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
	,[Prior education] = d13.selite_en
	,[Vocat. upper sec. qualif., school-level qualif., post-sec. level qualif. or higher vocat. level qualif. cmpl. in Finland*] = d23a.kytkin_en
	,[Vocational upper secondary qualification completed in Finland (ammatillinen perustutkinto)*] = d23b.kytkin_en
	,[Further or specialist vocational qualification completed in Finland (ammatti- tai erikoisammattitutkinto)*] = d23c.kytkin_en
	,[Former vocational qualification completed in Finland (kouluasteen, opistoasteen tai ammatillisen korkea-asteen tutkinto)*] = d23d.kytkin_en
	,[Studies required by the higher education institution completed at open university or open polytechnic/UAS*] = d23e.kytkin_en
	,[Bachelor’s/Master’s/Doctoral degree completed in Finland*] = d23f.kytkin_en
	,[Bachelor’s/Master’s/Doctoral degree completed outside Finland*] = d23g.kytkin_en
	,[General upper secondary school syllabus completed in Finland (without matriculation examination)*] = d23h.kytkin_en
	,[Upper secondary education completed outside Finland (general or vocational)*] = d23i.kytkin_en
	,[Matriculation examination completed in Finland*] = d23j.kytkin_en
	,[Double upper secondary qualification completed in Finland (kaksoistutkinto)*] = d23k.kytkin_en
	,[International matriculation examination completed in Finland (IB, EB and RP/DIA)*] = d23l.kytkin_en
	,[International matriculation examination completed outside Finland (IB, EB and RP/DIA)*] = d23m.kytkin_en
	,[Other eligibility for higher education*] = d23n.kytkin_en

	,[Sector] = d12.koulutussektori_en--coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'University of applied sciences education' when f.sektori_kk = 'Ammattikorkeakoulutus' then 'University of applied sciences education' when f.sektori_kk = 'Yliopistokoulutus' then 'University education' else 'Unknown' end, 'Unknown')
	,[Gender] = d7.sukupuoli_EN
	,[Graduation year (upper secondary education)] = case f.toisen_asteen_koulutuksen_suoritusvuosi when '-1' then 'Unknown' else f.toisen_asteen_koulutuksen_suoritusvuosi end
	,[Level of degree] = d20.selite_en
	,[Beginning cycle of education] =  d19.selite_en
	,[Mother tongue] = d8.kieliryhma1_en
	,[International student] = d36.kytkin_en
	   
	--KOODIMUUTTUJAT
	,[Koodit Pääasiallinen koulutusnimike] = d12.koulutusluokitus_koodi
	,[Koodit Koulutusala, taso 1 (hakukohde)] = d12.koulutusalataso1_koodi
	,[Koodit Koulutusala, taso 2 (hakukohde)] = d12.koulutusalataso2_koodi
	,[Koodit Koulutusala, taso 3 (hakukohde)] = d12.koulutusalataso3_koodi
	,[Koodit OKM ohjauksen ala (hakukohde)] = d12.okmohjauksenala_koodi
	,[Koodit Koulutuksen järjestäjä] = d5a.organisaatio_koodi
	,[Koodit Korkeakoulu] = d5b.organisaatio_koodi
	,[Koodit Maakunta hakukohde] = d11.maakunta_koodi
	,[Koodit Kunta hakukohde] = d11.kunta_koodi
	,[Koodit Kotimaakunta hakija] = d6.maakunta_koodi
	,[Koodit Kotikunta hakija] = d6.kunta_koodi
	  

	--Apusarakkeet mittareille	    

	/* nettouttamatonta hakijamäärää varten valitaan yksi pohjakoulutus per hakija (per haku) */
	,[yksi_pk_per_hakija] = case when f.pk_rnk = 1 then 1 else 0 end
	,[Hakijat2] = 1 
	,[Ensisijaiset hakijat2] = case when hakutoive=1 then 1 else 0 end
	,[Valitut2] = case when f.loadtime>=s.valitut then f.valittu else 0 end
	,[Paikan vastaanottaneet2] = case when f.loadtime>=s.vastaanottaneet then f.vastaanottanut_paikan else 0 end		
	,[Aloittaneet2] = case when f.loadtime >= s.aloittaneet then f.ilmoittautunut else 0 end
	,[Valitut2_indikaattori] = case when f.loadtime >= coalesce(f.valitut_indikaattori, s.valitut) then f.valittu else 0 end
	,[Paikan vastaanottaneet2_indikaattori] = case when f.loadtime >= coalesce(f.vastaanottaneet_indikaattori, s.vastaanottaneet) then f.vastaanottanut_paikan else 0 end		
	,[uusi ylioppilas] = f.uusi_ylioppilas
	,f.aidosti_ensikertainen as [aidosti ensikertainen]
	,[sama kuin 1 hakukohteen sektori] = case when d25.koulutussektori_koodi = d12.koulutussektori_koodi then 1 else 0 end
	,[sama kuin 1 hakukohteen kk] = case when d25a.organisaatio_koodi = d5b.organisaatio_koodi then 1 else 0 end
	,[sama kuin 1 hakukohteen koulutusala1] = case when d25.koulutusalataso1_koodi = d12.koulutusalataso1_koodi then 1 else 0 end					
	,[ei vastaanottoa kaudella] = f.ei_vastaanottoa_kaudella
	,case when s.visualisoinnit <= cast(getdate() as date) then 1 else 0 end as visualisoinnit

	--Järjestys-kentät
	,[Ensikertainen hakija järjestys] = coalesce(f.ensikertalainen,2)
	,[Hakuaika järjestys] = 999--coalesce(d31.jarjestys2,999)
	,[Haku AMK/YO järjestys] = d21.jarjestys_koodi
	--,[Hakukohteen koulutusaste 2002 järjestys] = d12.jarjestys_koulutusaste2002_koodi
	--,[Hakukohteen koulutusala 2002 järjestys] = d12.jarjestys_koulutusala2002_koodi
	--,[Hakukohteen opintoala 2002 järjestys] = d12.jarjestys_opintoala2002_koodi
	--,[Hakukohteen opintoala 1995 järjestys] = d12.jarjestys_opintoala1995_koodi
	,[Koulutusaste, taso 1 järjestys] = d12.jarjestys_koulutusastetaso1_koodi
	,[Koulutusaste, taso 2 järjestys] = d12.jarjestys_koulutusastetaso2_koodi
	,[Koulutusala, taso 1 järjestys] = d12.jarjestys_koulutusalataso1_koodi
	,[Koulutusala, taso 2 järjestys] = d12.jarjestys_koulutusalataso2_koodi
	,[Koulutusala, taso 3 järjestys] = d12.jarjestys_koulutusalataso3_koodi
	,[OKM ohjauksen ala järjestys] = d12.jarjestys_okmohjauksenala_koodi
	,[Hakutoive järjestys] = f.hakutoive
	,[Hakukohteen maakunta järjestys] = d11.jarjestys_maakunta_koodi
	,[Hakutapa järjestys] = case when d1.hakutapa_fi = 'Jatkuva haku' then 2 else d1.jarjestys_hakutapa end
	,[Hakutyyppi järjestys] = d1.jarjestys_hakutyyppi
	,[Ikä järjestys] = d9.jarjestys_ika
	,[Ikä 5v järjestys] = d9.jarjestys_ikaryhma2
	,[Kansalaisuus järjestys] = d16.jarjestys
	,[Kansalaisuus maanosa järjestys] = d15.jarjestys_maanosa5_koodi
	,[Kansalaisuus ryhmä järjestys] = d15.jarjestys_maanosa6_koodi
	,[Kotipaikkakunta järjestys] = left(d6.kunta_fi, 4)
	,[Kotipaikan maakunta järjestys] = d6.jarjestys_maakunta_koodi
	--,[Kotipaikan AVI järjestys] = d6.jarjestys_avi_koodi
	--,[Kotipaikan ELY järjestys] = d6.jarjestys_ely_koodi
	,[Koulutuksen kieli järjestys] = d14.jarjestys
	,[Opiskelun laajuus järjestys] = coalesce(f.laajuus,999)
	,[Pohjakoulutuksen maa järjestys] = d4.jarjestys_kytkin_koodi
	,[Pohjakoulutus järjestys] = LEFT(d13.selite_fi,40)
	,[Sektori järjestys] = d12.jarjestys_koulutussektori_koodi
	,[Sukupuoli järjestys] = d7.jarjestys_sukupuoli_koodi
	,[Toisen asteen koulutuksen suoritusvuosi järjestys] = case when f.toisen_asteen_koulutuksen_suoritusvuosi is null then 9998 else 9999-f.toisen_asteen_koulutuksen_suoritusvuosi end
	,[Ylioppilastutkinnon suoritusvuosi järjestys] = case when d3.vuosi is null then 9998 else 9999-d3.vuosi end
	,[Tutkinnon taso (hakukohde) järjestys] = d20.jarjestys_koodi
	,[Tutkinnon aloitussykli (hakukohde) järjestys] = d19.jarjestys_koodi
	,[Äidinkieli versio1 järjestys] = d8.jarjestys_kieliryhma1
	,[1 Koulutusala, taso 1 järjestys] = d25.jarjestys_koulutusalataso1_koodi
	,[1 Koulutusala, taso 2 järjestys] = d25.jarjestys_koulutusalataso2_koodi
	,[1 Koulutusala, taso 3 järjestys] = d25.jarjestys_koulutusalataso3_koodi
	,[2 Koulutusala, taso 1 järjestys] = d27.jarjestys_koulutusalataso1_koodi
	,[2 Koulutusala, taso 2 järjestys] = d27.jarjestys_koulutusalataso2_koodi
	,[2 Koulutusala, taso 3 järjestys] = d27.jarjestys_koulutusalataso3_koodi
	,[3 Koulutusala, taso 1 järjestys] = d29.jarjestys_koulutusalataso1_koodi
	,[3 Koulutusala, taso 2 järjestys] = d29.jarjestys_koulutusalataso2_koodi
	,[3 Koulutusala, taso 3 järjestys] = d29.jarjestys_koulutusalataso3_koodi
	,[4 Koulutusala, taso 1 järjestys] = d31.jarjestys_koulutusalataso1_koodi
	,[4 Koulutusala, taso 2 järjestys] = d31.jarjestys_koulutusalataso2_koodi
	,[4 Koulutusala, taso 3 järjestys] = d31.jarjestys_koulutusalataso3_koodi
	,[5 Koulutusala, taso 1 järjestys] = d33.jarjestys_koulutusalataso1_koodi
	,[5 Koulutusala, taso 2 järjestys] = d33.jarjestys_koulutusalataso2_koodi
	,[5 Koulutusala, taso 3 järjestys] = d33.jarjestys_koulutusalataso3_koodi
	,[6 Koulutusala, taso 1 järjestys] = d35.jarjestys_koulutusalataso1_koodi
	,[6 Koulutusala, taso 2 järjestys] = d35.jarjestys_koulutusalataso2_koodi
	,[6 Koulutusala, taso 3 järjestys] = d35.jarjestys_koulutusalataso3_koodi
	,[Valintatapajono järjestys] = d22.jarjestys
	,d23a.jarjestys_kytkin_koodi as [pohjakoulutus_am järjestys]
	,d23b.jarjestys_kytkin_koodi as [pohjakoulutus_amp järjestys]
	,d23c.jarjestys_kytkin_koodi as [pohjakoulutus_amt järjestys]
	,d23d.jarjestys_kytkin_koodi as [pohjakoulutus_amv järjestys]
	,d23e.jarjestys_kytkin_koodi as [pohjakoulutus_avoin järjestys]
	,d23f.jarjestys_kytkin_koodi as [pohjakoulutus_kk järjestys]
	,d23g.jarjestys_kytkin_koodi as [pohjakoulutus_kk_ulk järjestys]
	,d23h.jarjestys_kytkin_koodi as [pohjakoulutus_lk järjestys]
	,d23i.jarjestys_kytkin_koodi as [pohjakoulutus_ulk järjestys]
	,d23j.jarjestys_kytkin_koodi as [pohjakoulutus_yo järjestys]
	,d23k.jarjestys_kytkin_koodi as [pohjakoulutus_yo_ammatillinen järjestys]
	,d23l.jarjestys_kytkin_koodi as [pohjakoulutus_yo_kansainvalinen_suomessa järjestys]
	,d23m.jarjestys_kytkin_koodi as [pohjakoulutus_yo_ulkomainen järjestys]
	,d23n.jarjestys_kytkin_koodi as [pohjakoulutus_muu järjestys]
	,d18.jarjestys_kytkin_koodi as jarjestys_ensikertainen_hakija

FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f 
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste s on s.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
LEFT JOIN ANTERO.dw.d_haku d1 ON d1.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_kalenteri d3 on d3.id = f.d_kalenteri_ylioppilastutkinnon_suorituspaivamaara_id
LEFT JOIN ANTERO.dw.d_kytkin d4 ON d4.id=f.d_kytkin_pohjakoulutus_ulkomaat_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5a ON d5a.id = f.d_organisaatioluokitus_koulutustoimija_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5b ON d5b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5c ON d5c.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.id = f.d_alueluokitus_kotikunta_id
LEFT JOIN ANTERO.dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_kieli d8 ON d8.id = f.d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_ika d9 ON d9.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_alueluokitus d11 ON d11.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d12 ON d12.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_pohjakoulutus d13 ON d13.id = f.d_pohjakoulutus_id
LEFT JOIN ANTERO.dw.d_oppilaitoksenopetuskieli d14 ON d14.id = f.d_oppilaitoksenopetuskieli_koulutuksen_kieli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d15 ON d15.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN VipunenTK.dbo.d_valtio d16 ON d16.valtio_avain = d15.maatjavaltiot2_koodi
LEFT JOIN ANTERO.dw.d_kytkin d18 on d18.kytkin_koodi = COALESCE(f.aidosti_ensikertainen,-1)
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d19 on d19.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d20 on d20.id=f.d_tutkinnon_taso_kk_id
LEFT JOIN ANTERO.dw.d_haku_amk_yo d21 on d21.id=f.d_haku_amk_yo_id
LEFT JOIN ANTERO.dw.d_valintatapajonon_tyyppi d22 on d22.id = f.d_valintatapajonon_tyyppi_id
LEFT JOIN ANTERO.dw.d_kytkin d23a on d23a.id = f.d_kytkin_pohjakoulutus_am_id
LEFT JOIN ANTERO.dw.d_kytkin d23b on d23b.id = f.d_kytkin_pohjakoulutus_amp_id
LEFT JOIN ANTERO.dw.d_kytkin d23c on d23c.id = f.d_kytkin_pohjakoulutus_amt_id
LEFT JOIN ANTERO.dw.d_kytkin d23d on d23d.id = f.d_kytkin_pohjakoulutus_amv_id
LEFT JOIN ANTERO.dw.d_kytkin d23e on d23e.id = f.d_kytkin_pohjakoulutus_avoin_id
LEFT JOIN ANTERO.dw.d_kytkin d23f on d23f.id = f.d_kytkin_pohjakoulutus_kk_id
LEFT JOIN ANTERO.dw.d_kytkin d23g on d23g.id = f.d_kytkin_pohjakoulutus_kk_ulk_id
LEFT JOIN ANTERO.dw.d_kytkin d23h on d23h.id = f.d_kytkin_pohjakoulutus_lk_id
LEFT JOIN ANTERO.dw.d_kytkin d23i on d23i.id = f.d_kytkin_pohjakoulutus_ulk_id
LEFT JOIN ANTERO.dw.d_kytkin d23j on d23j.id = f.d_kytkin_pohjakoulutus_yo_id
LEFT JOIN ANTERO.dw.d_kytkin d23k on d23k.id = f.d_kytkin_pohjakoulutus_yo_ammatillinen_id
LEFT JOIN ANTERO.dw.d_kytkin d23l on d23l.id = f.d_kytkin_pohjakoulutus_yo_kansainvalinen_suomessa_id
LEFT JOIN ANTERO.dw.d_kytkin d23m on d23m.id = f.d_kytkin_pohjakoulutus_yo_ulkomainen_id
LEFT JOIN ANTERO.dw.d_kytkin d23n on d23n.id = f.d_kytkin_pohjakoulutus_muu_id
--1
LEFT JOIN ANTERO.dw.d_hakukohde d24 ON d24.id=f.d_hakukohde_hakukohde1_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d25 ON d25.id=f.d_koulutusluokitus_hakukohde1_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d25a ON d25a.id=f.d_organisaatioluokitus_hakukohde1_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d25b ON d25b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde1_id
--2
LEFT JOIN ANTERO.dw.d_hakukohde d26 ON d26.id=f.d_hakukohde_hakukohde2_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d27 ON d27.id=f.d_koulutusluokitus_hakukohde2_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d27a ON d27a.id=f.d_organisaatioluokitus_hakukohde2_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d27b ON d27b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde2_id
--3
LEFT JOIN ANTERO.dw.d_hakukohde d28 ON d28.id=f.d_hakukohde_hakukohde3_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d29 ON d29.id=f.d_koulutusluokitus_hakukohde3_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d29a ON d29a.id=f.d_organisaatioluokitus_hakukohde3_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d29b ON d29b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde3_id
--4
LEFT JOIN ANTERO.dw.d_hakukohde d30 ON d30.id=f.d_hakukohde_hakukohde4_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d31 ON d31.id=f.d_koulutusluokitus_hakukohde4_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d31a ON d31a.id=f.d_organisaatioluokitus_hakukohde4_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d31b ON d31b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde4_id
--5
LEFT JOIN ANTERO.dw.d_hakukohde d32 ON d32.id=f.d_hakukohde_hakukohde5_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d33 ON d33.id=f.d_koulutusluokitus_hakukohde5_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d33a ON d33a.id=f.d_organisaatioluokitus_hakukohde5_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d33b ON d33b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde5_id
--6
LEFT JOIN ANTERO.dw.d_hakukohde d34 ON d34.id=f.d_hakukohde_hakukohde6_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d35 ON d35.id=f.d_koulutusluokitus_hakukohde6_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d35a ON d35a.id=f.d_organisaatioluokitus_hakukohde6_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d35b ON d35b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde6_id
--
LEFT JOIN ANTERO.dw.d_kytkin d36 on d36.kytkin_koodi = f.kansainvalinen_opiskelija
LEFT JOIN ANTERO.dw.d_kytkin d37 on d37.kytkin_koodi = f.aloittanut_opinnot_toisen_asteen_koulutuksen_suoritusvuonna
LEFT JOIN ANTERO.dw.d_kytkin d38 on d38.kytkin_koodi = f.aloittanut_opinnot_ilmoittamansa_pohjakoulutuksen_suoritusvuonna
LEFT JOIN ANTERO.dw.d_valintatapajono d39 on d39.id = f.d_valintatapajono_id