USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk]    Script Date: 23.6.2020 18:26:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dw].[v_haku_ja_valinta_kk] AS


SELECT --top 100
	cast(f.loadtime as date) as Päivitysaika
	,Lukumäärä = 1
	,[alpa] = 0
	,[valpa] = 0
	,[Pisteraja] = 0
	,[Ensikertaisena kohdeltava hakija] = f.ensikertainen_hakija	
	,[Hakemus OID] = f.hakemus_oid
	,[Haku AMK/YO] = d46.selite_fi
	,[Haku] = d25.haun_nimi_fi
	,[Haku OID] = d25.haku_oid
	,[Hakuaika] = coalesce(d31.selite_fi,'Tieto puuttuu')
	,[Hakukohde] = d10.selite_fi
	,[hakukohde OID] = d10.oid
	,[Hakutapa] = case d25.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d25.hakutapa_fi end
	,[Hakutyyppi] = d25.hakutyyppi_fi
	,[Hakukohteen koulutustoimija] = d16a.organisaatio_fi
	,[Hakukohteen oppilaitos] = d16b.organisaatio_fi
	,[Hakukohteen toimipiste] = d16c.organisaatio_fi
	,[Hakukohteen maakunta] = d19.maakunta_fi
	,[Hakukohteen kunta] = d19.kunta_fi
	,[Hakukohteen koulutusaste] = d20.koulutusaste2002_fi
	,[Hakukohteen koulutusala 2002] = d20.koulutusala2002_fi
	,[Hakukohteen opintoala 2002] = d20.opintoala2002_fi
	,[Hakukohteen koulutusala 1995] = d20.opintoala1995_fi
	,[Tutkinto (hakukohde)] = d20.koulutusluokitus_fi
	,[Koulutusaste, taso 1 (hakukohde)] = d20.koulutusastetaso1_fi
	,[Koulutusaste, taso 2 (hakukohde)] = d20.koulutusastetaso2_fi
	,[Koulutusala, taso 1 (hakukohde)] = d20.koulutusalataso1_fi
	,[Koulutusala, taso 2 (hakukohde)] = d20.koulutusalataso2_fi
	,[Koulutusala, taso 3 (hakukohde)] = d20.koulutusalataso3_fi
	,[OKM ohjauksen ala (hakukohde)] = d20.okmohjauksenala_fi
	,[Hakutoive] = f.hakutoive

	,[Korkeakoulu_hakukohde] = d16b.organisaatio_fi + '_' + d10.selite_fi
	,[1 Hakukohde] = d32.selite_fi
	,[1 Koulutusala, taso 1] = d33.koulutusalataso1_fi
	,[1 Koulutusala, taso 2] = d33.koulutusalataso2_fi
	,[1 Koulutusala, taso 3] = d33.koulutusalataso3_fi
	,[1 Sektori] = d33.koulutussektori_fi
	,[1 Aloitussykli] = d33b.selite_fi
	,[1 Korkeakoulu] = d33a.organisaatio_fi
	,[1 Korkeakoulu_hakukohde] = d33a.organisaatio_fi + '_' + d32.selite_fi

	,[2 Hakukohde] = d34.selite_fi
	,[2 Koulutusala, taso 1] = d35.koulutusalataso1_fi
	,[2 Koulutusala, taso 2] = d35.koulutusalataso2_fi
	,[2 Koulutusala, taso 3] = d35.koulutusalataso3_fi
	,[2 Sektori] = d35.koulutussektori_fi
	,[2 Aloitussykli] = d35b.selite_fi
	,[2 Korkeakoulu] = d35a.organisaatio_fi
	,[2 Korkeakoulu_hakukohde] = d35a.organisaatio_fi + '_' + d34.selite_fi

	,[3 Hakukohde] = d36.selite_fi
	,[3 Koulutusala, taso 1] = d37.koulutusalataso1_fi
	,[3 Koulutusala, taso 2] = d37.koulutusalataso2_fi
	,[3 Koulutusala, taso 3] = d37.koulutusalataso3_fi
	,[3 Sektori] = d37.koulutussektori_fi
	,[3 Aloitussykli] = d37b.selite_fi
	,[3 Korkeakoulu] = d37a.organisaatio_fi
	,[3 Korkeakoulu_hakukohde] = d37a.organisaatio_fi + '_' + d36.selite_fi

	,[4 Hakukohde] = d38.selite_fi
	,[4 Koulutusala, taso 1] = d39.koulutusalataso1_fi
	,[4 Koulutusala, taso 2] = d39.koulutusalataso2_fi
	,[4 Koulutusala, taso 3] = d39.koulutusalataso3_fi
	,[4 Sektori] = d39.koulutussektori_fi
	,[4 Aloitussykli] = d39b.selite_fi
	,[4 Korkeakoulu] = d39a.organisaatio_fi
	,[4 Korkeakoulu_hakukohde] = d39a.organisaatio_fi + '_' + d38.selite_fi

	,[5 Hakukohde] = d40.selite_fi
	,[5 Koulutusala, taso 1] = d41.koulutusalataso1_fi
	,[5 Koulutusala, taso 2] = d41.koulutusalataso2_fi
	,[5 Koulutusala, taso 3] = d41.koulutusalataso3_fi
	,[5 Sektori] = d41.koulutussektori_fi
	,[5 Aloitussykli] = d41b.selite_fi
	,[5 Korkeakoulu] = d41a.organisaatio_fi
	,[5 Korkeakoulu_hakukohde] = d41a.organisaatio_fi + '_' + d40.selite_fi

	,[6 Hakukohde] = d42.selite_fi
	,[6 Koulutusala, taso 1] = d43.koulutusalataso1_fi
	,[6 Koulutusala, taso 2] = d43.koulutusalataso2_fi
	,[6 Koulutusala, taso 3] = d43.koulutusalataso3_fi
	,[6 Sektori] = d43.koulutussektori_fi
	,[6 Aloitussykli] = d43b.selite_fi
	,[6 Korkeakoulu] = d43a.organisaatio_fi
	,[6 Korkeakoulu_hakukohde] = d43a.organisaatio_fi + '_' + d42.selite_fi

	,[Valintatapajonon tyyppi] = d47.selite_fi
	,[Valintatapajonon nimi] = f.valintatapajono_nimi
	,[Pisteet] = f.Kokonaispisteet

	,[Henkilö OID] = f.henkilo_oid
	,[Ikä] = d9.ika_fi
	,[Ikäryhmä] = d9.ikaryhma2_fi
	,[Kansalaisuus] = COALESCE(d28.maa,'Tieto puuttuu')
	,[Kansalaisuus (maanosa)] = d30.maanosa5_fi
	,[Kansalaisuus (ryhmä)] = d30.maanosa6_fi
	,[Kotipaikkakunta] = d6.kunta_fi
	,[Kotipaikan maakunta] = d6.maakunta_fi
	,[Hakijan kotimaakunta sama kuin hakukohteen maakunta] = 
		case
			when d6.maakunta_fi = 'Tieto puuttuu' or d6.maakunta_fi = 'Ei tiedossa (maakunta)' or d6.maakunta_fi is null then 'Tieto puuttuu'
			when d6.maakunta_fi = d19.maakunta_fi then 'Kyllä'
			else 'Ei'
		end
	,[Kotipaikan AVI] = d6.avi_fi
	,[Kotipaikan ELY] = d6.ely_fi
	,[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[Koulutuksen alkamiskausi] = d2.selite_fi
	,[Koulutuksen kieli] = d27.kieli_fi
	,[Opiskelun laajuus] = d3.selite_fi
	,[Pohjakoulutuksen maa] = 
		case 
			when d4.kytkin_koodi = 1 then 'Ulkomaat' 
			when d4.kytkin_koodi = 0 then 'Suomi' 
			else d4.kytkin_fi
		end
	,[Pohjakoulutus] = d22.selite_fi 
	,[Sektori] = case when d10.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d20.koulutussektori_fi end --coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'Ammattikorkeakoulutus' else f.sektori_kk end, 'Tuntematon')
	,[Sukupuoli] = d7.sukupuoli_fi
	,[Toisen asteen koulutuksen suoritusvuosi] = case f.toisen_asteen_koulutuksen_suoritusvuosi when '-1' then 'Tieto puuttuu' else f.toisen_asteen_koulutuksen_suoritusvuosi end
	,[Ylioppilastutkinnon suoritusvuosi] = f.ylioppilastutkinnon_suoritusvuosi
	,[Tutkinnon taso (hakukohde)] = d45.selite_fi
	,[Tutkinnon aloitussykli (hakukohde)] = d44.selite_fi 
	--,[Valinnan tila] = d23.valinnan_tila
	--,[Vastaanoton tila] = d24.vastaanoton_tila
	,[Äidinkieli] = d8.kieliryhma1_fi
	  
	,[Aloittanut opinnot toisen asteen koulutuksen suoritusvuonna] =
		case
			when (
				case d_pohjakoulutuskk_id 
					when '7' then  f.toisen_asteen_koulutuksen_suoritusvuosi 
					when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi 
					when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi 
					else 'Tieto puuttuu' 
				end) = 'Tieto puuttuu' AND f.ylioppilastutkinnon_suoritusvuosi = 'Tieto puuttuu' then 'Tieto puuttuu'
			else 
				case CAST(f.koulutuksen_alkamisvuosi as nvarchar)
					when (
						case d_pohjakoulutuskk_id 
							when '7' then f.toisen_asteen_koulutuksen_suoritusvuosi 
							when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi 
							when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi 
							else 'Tieto puuttuu' 
						end
					) then 'Kyllä' 
					when f.ylioppilastutkinnon_suoritusvuosi then 'Kyllä' 
					Else 'Ei'
				End 
		End
	  ,[Aloittanut opinnot ilmoittamansa pohjakoulutuksen suoritusvuonna] = --[Toisen asteen Pohjakoulutuksen suoritusvuosi sama kuin koulutuksen alkamisvuosi]
		case
			when (
				case d_pohjakoulutuskk_id 
					when '7' then f.toisen_asteen_koulutuksen_suoritusvuosi 
					when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi 
					when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi 
					Else 'Tieto puuttuu' 
				end 
			) = 'Tieto puuttuu' AND f.ylioppilastutkinnon_suoritusvuosi = 'Tieto puuttuu' then 'Tieto puuttuu'
			else 
				case CAST(f.koulutuksen_alkamisvuosi as nvarchar)
					when f.toisen_asteen_koulutuksen_suoritusvuosi then 'Kyllä' 
					when f.ylioppilastutkinnon_suoritusvuosi then 'Kyllä' 
					else 'Ei'
				end
		end  
	  
	--Ruotsi
	,[Förstagångssökande] = case f.ensikertainen_hakija when 'Ei ensikertainen hakija' then 'Ej förstagångssökande' when 'Ensikertainen hakija' then 'Förstagångssökande' else 'Information saknas' end
	,[Ansökan YH/Univ.] = d46.selite_sv	
	,[Ansökning] = d25.haun_nimi_sv
	,[Ansökningstiden] = coalesce(d31.selite_sv,'Information saknas')
	,[Sökobjekt] = d10.selite_sv
	,[Gemensam/separat ansökan] = case d25.hakutapa_sv when 'Fortgående ansökan' then 'Separata antagningar' else d25.hakutapa_sv end
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

	,[Högskola_sökobjekt] = d16b.organisaatio_sv + '_' + d10.selite_sv
	,[1 Sökobjekt] = d32.selite_sv
	,[1 Utb.område, nivå 1] = d33.koulutusalataso1_sv
	,[1 Utb.område, nivå 2] = d33.koulutusalataso2_sv
	,[1 Utb.område, nivå 3] = d33.koulutusalataso3_sv
	,[1 Sektor] = d33.koulutussektori_sv
	,[1 Cykeln] = d33b.selite_sv
	,[1 Högskola] = d33a.organisaatio_sv
	,[1 Högskola_sökobjekt] = d33a.organisaatio_sv + '_' + d32.selite_sv

	,[2 Sökobjekt] = d34.selite_sv
	,[2 Utb.område, nivå 1] = d35.koulutusalataso1_sv
	,[2 Utb.område, nivå 2] = d35.koulutusalataso2_sv
	,[2 Utb.område, nivå 3] = d35.koulutusalataso3_sv
	,[2 Sektor] = d35.koulutussektori_sv
	,[2 Cykeln] = d35b.selite_sv
	,[2 Högskola] = d35a.organisaatio_sv
	,[2 Högskola_sökobjekt] = d35a.organisaatio_sv + '_' + d34.selite_sv

	,[3 Sökobjekt] = d36.selite_sv
	,[3 Utb.område, nivå 1] = d37.koulutusalataso1_sv
	,[3 Utb.område, nivå 2] = d37.koulutusalataso2_sv
	,[3 Utb.område, nivå 3] = d37.koulutusalataso3_sv
	,[3 Sektor] = d37.koulutussektori_sv
	,[3 Cykeln] = d37b.selite_sv
	,[3 Högskola] = d37a.organisaatio_sv
	,[3 Högskola_sökobjekt] = d37a.organisaatio_sv + '_' + d36.selite_sv

	,[4 Sökobjekt] = d38.selite_sv
	,[4 Utb.område, nivå 1] = d39.koulutusalataso1_sv
	,[4 Utb.område, nivå 2] = d39.koulutusalataso2_sv
	,[4 Utb.område, nivå 3] = d39.koulutusalataso3_sv
	,[4 Sektor] = d39.koulutussektori_sv
	,[4 Cykeln] = d39b.selite_sv
	,[4 Högskola] = d39a.organisaatio_sv
	,[4 Högskola_sökobjekt] = d39a.organisaatio_sv + '_' + d38.selite_sv

	,[5 Sökobjekt] = d40.selite_sv
	,[5 Utb.område, nivå 1] = d41.koulutusalataso1_sv
	,[5 Utb.område, nivå 2] = d41.koulutusalataso2_sv
	,[5 Utb.område, nivå 3] = d41.koulutusalataso3_sv
	,[5 Sektor] = d41.koulutussektori_sv
	,[5 Cykeln] = d41b.selite_sv
	,[5 Högskola] = d41a.organisaatio_sv
	,[5 Högskola_sökobjekt] = d41a.organisaatio_sv + '_' + d40.selite_sv

	,[6 Sökobjekt] = d42.selite_sv
	,[6 Utb.område, nivå 1] = d43.koulutusalataso1_sv
	,[6 Utb.område, nivå 2] = d43.koulutusalataso2_sv
	,[6 Utb.område, nivå 3] = d43.koulutusalataso3_sv
	,[6 Sektor] = d43.koulutussektori_sv
	,[6 Cykeln] = d43b.selite_sv
	,[6 Högskola] = d43a.organisaatio_sv
	,[6 Högskola_sökobjekt] = d43a.organisaatio_sv + '_' + d42.selite_sv

	,[Typ av antagningskö] = d47.selite_sv
	,[Namnet på antagningskö] = f.valintatapajono_nimi

	,[Ålder] = d9.ika_SV
	,[Åldersgrupp] = d9.ikaryhma2_sv
	,[Medborgarskap] = d28.maa_SV
	,[Medborgarskap (världsdel)] = d30.maanosa5_sv
	,[Medborgarskap (gruppen)] = d30.maanosa6_sv
	,[Hemkommun] = d6.kunta_SV
	,[Hemlandskap] = d6.maakunta_SV
	,[Begynnelseår] = f.koulutuksen_alkamisvuosi
	,[Begynnelsetermin] = d2.selite_sv
	,[Utbildningens språk] = d27.kieli_SV
	,[Studiernas omfattning] = d3.selite_sv
	,[Grundutbildningens land] = 
		case 
			when d4.kytkin_koodi = 1 then 'Utomlands' 
			when d4.kytkin_koodi = 0 then 'Finland' 
			else d4.kytkin_fi
		end
	,[Grundutbildning] = d22.selite_sv
	,[Sektor] = d20.koulutussektori_sv--coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'Yrkeshögskoleutbildning' when f.sektori_kk = 'Ammattikorkeakoulutus' then 'Yrkeshögskoleutbildning' when f.sektori_kk = 'Yliopistokoulutus' then 'Universitetsutbildning' else 'Information saknas' end, 'Information saknas')
	,[Kön] = d7.sukupuoli_SV
	,[År då andra stadiets utbildning avlagts] = case f.toisen_asteen_koulutuksen_suoritusvuosi when '-1' then 'Information saknas' else f.toisen_asteen_koulutuksen_suoritusvuosi end
	,[Examensnivå (sökobjekt)] = d45.selite_sv
	,[Cykeln (sökobjekt)] = d44.selite_sv
	,[Modersmål] = d8.kieliryhma1_sv

	--Englanti
	,[First-time applicant] = case f.ensikertainen_hakija when 'Ei ensikertainen hakija' then 'Not considered as a first-time applicant' when 'Ensikertainen hakija' then 'Considered as a first-time applicant' else 'Missing data' end
	,[Application to UAS/Univ.] = d46.selite_en
	,[Application] = d25.haun_nimi_en
	,[Application period] = coalesce(d31.selite_en,'Missing data')
	,[Applied study programme] = d10.selite_en
	,[Joint/separate application] = case when d25.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 'Separate application' when d25.hakutapa_fi = 'Yhteishaku' then 'Joint application' end --Application system
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

	,[HE institution_study programme] = d16b.organisaatio_en + '_' + d10.selite_en
	,[1 Study programme] = d32.selite_en
	,[1 Field of ed., tier 1] = d33.koulutusalataso1_en
	,[1 Field of ed., tier 2] = d33.koulutusalataso2_en
	,[1 Field of ed., tier 3] = d33.koulutusalataso3_en
	,[1 Sector] = d33.koulutussektori_en
	,[1 Beginning cycle] = d33b.selite_en
	,[1 HE institution] = d33a.organisaatio_en
	,[1 HE institution_study programme] = d33a.organisaatio_en + '_' + d32.selite_en

	,[2 Study programme] = d34.selite_en
	,[2 Field of ed., tier 1] = d35.koulutusalataso1_en
	,[2 Field of ed., tier 2] = d35.koulutusalataso2_en
	,[2 Field of ed., tier 3] = d35.koulutusalataso3_en
	,[2 Sector] = d35.koulutussektori_en
	,[2 Beginning cycle] = d35b.selite_en
	,[2 HE institution] = d35a.organisaatio_en
	,[2 HE institution_study programme] = d35a.organisaatio_en + '_' + d34.selite_en

	,[3 Study programme] = d36.selite_en
	,[3 Field of ed., tier 1] = d37.koulutusalataso1_en
	,[3 Field of ed., tier 2] = d37.koulutusalataso2_en
	,[3 Field of ed., tier 3] = d37.koulutusalataso3_en
	,[3 Sector] = d37.koulutussektori_en
	,[3 Beginning cycle] = d37b.selite_en
	,[3 HE institution] = d37a.organisaatio_en
	,[3 HE institution_study programme] = d37a.organisaatio_en + '_' + d36.selite_en

	,[4 Study programme] = d38.selite_en
	,[4 Field of ed., tier 1] = d39.koulutusalataso1_en
	,[4 Field of ed., tier 2] = d39.koulutusalataso2_en
	,[4 Field of ed., tier 3] = d39.koulutusalataso3_en
	,[4 Sector] = d39.koulutussektori_en
	,[4 Beginning cycle] = d39b.selite_en
	,[4 HE institution] = d39a.organisaatio_en
	,[4 HE institution_study programme] = d39a.organisaatio_en + '_' + d38.selite_en

	,[5 Study programme] = d40.selite_en
	,[5 Field of ed., tier 1] = d41.koulutusalataso1_en
	,[5 Field of ed., tier 2] = d41.koulutusalataso2_en
	,[5 Field of ed., tier 3] = d41.koulutusalataso3_en
	,[5 Sector] = d41.koulutussektori_en
	,[5 Beginning cycle] = d41b.selite_en
	,[5 HE institution] = d41a.organisaatio_en
	,[5 HE institution_study programme] = d41a.organisaatio_en + '_' + d40.selite_en

	,[6 Study programme] = d42.selite_en
	,[6 Field of ed., tier 1] = d43.koulutusalataso1_en
	,[6 Field of ed., tier 2] = d43.koulutusalataso2_en
	,[6 Field of ed., tier 3] = d43.koulutusalataso3_en
	,[6 Sector] = d43.koulutussektori_en
	,[6 Beginning cycle] = d43b.selite_en
	,[6 HE institution] = d43a.organisaatio_en
	,[6 HE institution_study programme] = d43a.organisaatio_en + '_' + d42.selite_en

	,[Type of admission queue] = d47.selite_en

	,[Age] = d9.ika_EN
	,[Age group] = d9.ikaryhma2_en
	,[Nationality] = d28.maa_EN
	,[Nationality (continent)] = d30.maanosa5_en
	,[Nationality (group)] = d30.maanosa6_en
	,[Municipality of residence] = d6.kunta_EN
	,[Region of residence] = d6.maakunta_EN
	,[Year (start of studies)] = f.koulutuksen_alkamisvuosi
	,[Term (start of studies)] = d2.selite_en
	,[Language of education] = d27.kieli_EN
	,[Extent of the study programme] = d3.selite_en
	,[Country of prior education] = 
		case 
			when d4.kytkin_koodi = 1 then 'Abroad' 
			when d4.kytkin_koodi = 0 then 'Finland' 
			else d4.kytkin_fi
		end
	,[Prior education] = d22.selite_en
	,[Sector] = d20.koulutussektori_en--coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'University of applied sciences education' when f.sektori_kk = 'Ammattikorkeakoulutus' then 'University of applied sciences education' when f.sektori_kk = 'Yliopistokoulutus' then 'University education' else 'Unknown' end, 'Unknown')
	,[Gender] = d7.sukupuoli_EN
	,[Graduation year (upper secondary education)] = case f.toisen_asteen_koulutuksen_suoritusvuosi when '-1' then 'Unknown' else f.toisen_asteen_koulutuksen_suoritusvuosi end
	,[Level of degree] = d45.selite_en
	,[Beginning cycle of education] =  d44.selite_en
	,[Mother tongue] = d8.kieliryhma1_en
	   
	--KOODIMUUTTUJAT
	,[Koodit Tutkinto (hakukohde)] = d20.koulutusluokitus_koodi
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
	  

	--Apusarakkeet mittareille	    

	/* nettouttamatonta hakijamäärää varten valitaan yksi pohjakoulutus per hakija (per haku) */
	,[yksi_pk_per_hakija] = case 
								when f.d_pohjakoulutuskk_id in (select top 1 fh.d_pohjakoulutuskk_id from ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste fh where fh.henkilo_oid=f.henkilo_oid and fh.d_haku_id=f.d_haku_id order by fh.d_pohjakoulutuskk_id) then 1 
								else 0 
							end 
	  
	,[Hakijat2] = case when f.loadtime>=d1.hakijat then 1 else 0 end
	,[Ensisijaiset hakijat2] = case when f.loadtime>=d1.hakijat and hakutoive=1 then 1 else 0 end
	,[Valitut2] = case when f.loadtime>=d1.valitut and f.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1 else 0 end
	,[Paikan vastaanottaneet2] = case when f.loadtime>=d1.vastaanottaneet and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0	end		
	,[Aloittaneet2] = case when f.loadtime>=d1.aloittaneet and f.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end
	,[uusi ylioppilas] = 
		case 
			when d2.jarjestys=1 and f.ylioppilastutkinnon_suoritusvuosi != 'Tieto puuttuu' then case when f.ylioppilastutkinnon_suoritusvuosi = f.koulutuksen_alkamisvuosi-1 then 1 else 0 end
			when d2.jarjestys=2 and f.ylioppilastutkinnon_suoritusvuosi != 'Tieto puuttuu' then case when (f.ylioppilastutkinnon_suoritusvuosi = f.koulutuksen_alkamisvuosi and d5.jarjestys = 1) or (f.ylioppilastutkinnon_suoritusvuosi = f.koulutuksen_alkamisvuosi-1 and d5.jarjestys = 2) then 1 else 0 end
			else 0
		end
	,[aidosti ensikertainen] = case when f2.muu_alkamispvm is null and f2.aiempi_tutkinto_suorituspvm is null then 1 else 0 end
	,[sama kuin 1 hakukohteen sektori] = case when d33.koulutussektori_koodi = d20.koulutussektori_koodi then 1 else 0 end
	,[sama kuin 1 hakukohteen kk] = case when d33a.organisaatio_koodi = d16b.organisaatio_koodi then 1 else 0 end
	,[sama kuin 1 hakukohteen koulutusala1] = case when d33.koulutusalataso1_koodi = d20.koulutusalataso1_koodi then 1 else 0 end					
	,[ei vastaanottoa kaudella] = d99.ei_vast

	--Järjestys-kentät
	,[Ensikertainen hakija järjestys] = left(f.ensikertainen_hakija,2)
	,[Hakuaika järjestys] = coalesce(left(d31.selite_fi,3),'ööö')
	,[Haku AMK/YO järjestys] = d46.jarjestys_koodi
	,[Hakukohteen koulutusaste 2002 järjestys] = d20.jarjestys_koulutusaste2002_koodi
	,[Hakukohteen koulutusala 2002 järjestys] = d20.jarjestys_koulutusala2002_koodi
	,[Hakukohteen opintoala 2002 järjestys] = d20.jarjestys_opintoala2002_koodi
	,[Hakukohteen opintoala 1995 järjestys] = d20.jarjestys_opintoala1995_koodi
	,[Koulutusaste, taso 1 järjestys] = d20.jarjestys_koulutusastetaso1_koodi
	,[Koulutusaste, taso 2 järjestys] = d20.jarjestys_koulutusastetaso2_koodi
	,[Koulutusala, taso 1 järjestys] = d20.jarjestys_koulutusalataso1_koodi
	,[Koulutusala, taso 2 järjestys] = d20.jarjestys_koulutusalataso2_koodi
	,[Koulutusala, taso 3 järjestys] = d20.jarjestys_koulutusalataso3_koodi
	,[OKM ohjauksen ala järjestys] = d20.jarjestys_okmohjauksenala_koodi
	,[Hakutoive järjestys] = f.hakutoive
	,[Hakukohteen maakunta järjestys] = d19.jarjestys_maakunta_koodi
	,[Hakutapa järjestys] = case when d25.hakutapa_fi='Yhteishaku' then 1 when d25.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 2 else 99 end
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
	,[Koulutuksen kieli järjestys] = d27.kieli_koodi
	,[Opiskelun laajuus järjestys] = d3.jarjestys--case when f.Opiskelun_laajuus='' then 9999 when len(opiskelun_laajuus)=2 then '0'+opiskelun_laajuus else f.Opiskelun_laajuus end
	,[Pohjakoulutuksen maa järjestys] = d4.jarjestys_kytkin_koodi
	,[Pohjakoulutus järjestys] = LEFT(d22.selite_fi,40)--d22.jarjestys--case d22.jarjestys when '98' then 'yy' when 'yo' then 'aa' else d22.jarjestys end
	,[Sektori järjestys] = d20.jarjestys_koulutussektori_koodi
	,[Sukupuoli järjestys] = d7.jarjestys_sukupuoli_koodi
	,[Toisen asteen koulutuksen suoritusvuosi järjestys] = case when f.toisen_asteen_koulutuksen_suoritusvuosi in ('0','Tieto puuttuu') then 9998 else 9999-f.toisen_asteen_koulutuksen_suoritusvuosi end
	,[Ylioppilastutkinnon suoritusvuosi järjestys] = case when f.ylioppilastutkinnon_suoritusvuosi in ('0', 'Tieto puuttuu') then 9998 else 9999-f.ylioppilastutkinnon_suoritusvuosi end
	,[Tutkinnon taso (hakukohde) järjestys] = d45.jarjestys_koodi
	,[Tutkinnon aloitussykli (hakukohde) järjestys] = d44.jarjestys_koodi
	,[Äidinkieli versio1 järjestys] = d8.jarjestys_kieliryhma1
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
	,[Valintatapajono järjestys] = d47.jarjestys
	
FROM dw.f_haku_ja_valinta_hakeneet_korkea_aste f
LEFT JOIN dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN (
	SELECT 
		henkilo_oid,koulutuksen_alkamisvuosi,d_kausi_koulutuksen_alkamiskausi_id
		,ei_vast=1-max(case when f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0 end)
	FROM dw.f_haku_ja_valinta_hakeneet_korkea_aste f
	GROUP BY henkilo_oid,koulutuksen_alkamisvuosi,d_kausi_koulutuksen_alkamiskausi_id
) d99 on d99.henkilo_oid = f.henkilo_oid and d99.koulutuksen_alkamisvuosi=f.koulutuksen_alkamisvuosi and d99.d_kausi_koulutuksen_alkamiskausi_id=f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN dw.d_kausi d5 ON d5.id = f.d_kausi_ylioppilastutkinto_id
INNER JOIN sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on ((d1.haku_oid=d25.haku_oid and d1.haku_oid is not null) OR (d1.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d2.jarjestys as varchar) and d25.hakutapa_koodi <> '01' and d1.haku_oid is null)) and f.loadtime >= d1.hakijat	
LEFT JOIN dw.d_opintojenlaajuus d3 ON d3.id=f.d_opintojen_laajuus_id
LEFT JOIN dw.d_kytkin d4 ON d4.id=f.d_kytkin_pohjakoulutuskk_ulkomaat_id
LEFT JOIN dw.d_alueluokitus d6 ON d6.id = f.d_alueluokitus_kotipaikka_id
LEFT JOIN dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d8 ON d8.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d9 ON d9.id = f.d_ika_id
LEFT JOIN dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatio_koulutuksen_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatio_toimipiste_id
LEFT JOIN dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
LEFT JOIN dw.d_pohjakoulutus d22 ON d22.id = f.d_pohjakoulutuskk_id
LEFT JOIN dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id
LEFT JOIN dw.d_maatjavaltiot2 d30 ON d30.id=f.d_maatjavaltiot_kansalaisuus_id
LEFT JOIN VipunenTK.dbo.d_valtio d28 ON d28.valtio_avain=d30.maatjavaltiot2_koodi
LEFT JOIN dw.d_hakuaika d31 ON d31.id=f.d_hakuaika_id
LEFT JOIN dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot f2 on f2.hakemus_oid = f.hakemus_oid and f2.d_hakuaika_id = f.d_hakuaika_id
--1
LEFT JOIN dw.d_hakukohde d32 ON d32.id=f.d_hakukohde_ensisijainen_id
LEFT JOIN dw.d_koulutusluokitus d33 ON d33.id=f.d_koulutus_ensisijainen_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d33a ON d33a.id=f.d_organisaatioluokitus_ensisijainen_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d33b ON d33b.id=f.d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id
--2
LEFT JOIN dw.d_hakukohde d34 ON d34.id=f.d_hakukohde_toinen_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d35 ON d35.id=f.d_koulutus_toinen_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d35a ON d35a.id=f.d_organisaatioluokitus_toinen_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d35b ON d35b.id=f.d_tutkinnon_aloitussykli_toinen_hakukohde_id
--3
LEFT JOIN dw.d_hakukohde d36 ON d36.id=f.d_hakukohde_kolmas_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d37 ON d37.id=f.d_koulutus_kolmas_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d37a ON d37a.id=f.d_organisaatioluokitus_kolmas_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d37b ON d37b.id=f.d_tutkinnon_aloitussykli_kolmas_hakukohde_id
--4
LEFT JOIN dw.d_hakukohde d38 ON d38.id=f.d_hakukohde_neljas_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d39 ON d39.id=f.d_koulutus_neljas_hakukohde__id
LEFT JOIN dw.d_organisaatioluokitus d39a ON d39a.id=f.d_organisaatioluokitus_neljas_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d39b ON d39b.id=f.d_tutkinnon_aloitussykli_neljas_hakukohde_id
--5
LEFT JOIN dw.d_hakukohde d40 ON d40.id=f.d_hakukohde_viides_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d41 ON d41.id=f.d_koulutus_viides_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d41a ON d41a.id=f.d_organisaatioluokitus_viides_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d41b ON d41b.id=f.d_tutkinnon_aloitussykli_viides_hakukohde_id
--6
LEFT JOIN dw.d_hakukohde d42 ON d42.id=f.d_hakukohde_kuudes_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d43 ON d43.id=f.d_koulutus_kuudes_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d43a ON d43a.id=f.d_organisaatioluokitus_kuudes_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d43b ON d43b.id=f.d_tutkinnon_aloitussykli_kuudes_hakukohde_id
--
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN dw.d_tutkinnon_taso_kk d45 on d45.id=f.d_tutkinnon_taso_kk_id
LEFT JOIN dw.d_haku_amk_yo d46 on d46.id=f.d_haku_amk_yo_id
LEFT JOIN dw.d_valintatapajono d47 on d47.id = f.d_valintatapajono_id

--where f.koulutuksen_alkamisvuosi >= 2019
  



UNION ALL


--ALOITUSPAIKAT 
Select distinct --top 0
	cast(f.loadtime as date) as Päivitysaika
	,Lukumäärä = 0
	,case when f.loadtime>=d4.aloituspaikat then f.[aloituspaikat] else null end as alpa
	,case when f.loadtime>=d4.aloituspaikat then f.[valintojen_aloituspaikat] else null end as valpa
	,coalesce(f.alin_laskettuvalintapistemaara,0) as pisteraja
	,[Ensikertaisena kohdeltava hakija] = NULL
	,[Hakemus OID] = null
	,[Haku AMK/YO] = NULL
	,[Haku] = d1.haun_nimi_fi
	,[Haku OID] = d1.haku_oid
	,[Hakuaika] = coalesce(d13.selite_fi,'Tieto puuttuu')
	,[Hakukohde] = d3.selite_fi
	,[Hakukohde OID] = d3.oid
	,[Hakutapa] = case d1.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d1.hakutapa_fi end
	,[Hakutyyppi] = d1.hakutyyppi_fi
	,[Hakukohteen koulutustoimija] = d8a.organisaatio_fi
	,[Hakukohteen oppilaitos] = d8b.organisaatio_fi 
	,[Hakukohteen toimipiste] = d8c.organisaatio_fi
	,[Hakukohteen maakunta] = d5.maakunta_fi
	,[Hakukohteen kunta] = d5.kunta_fi
	,[Hakukohteen koulutusaste] = d6.koulutusaste2002_fi
	,[Hakukohteen koulutusala 2002] = d6.koulutusala2002_fi
	,[Hakukohteen opintoala 2002] = d6.opintoala2002_fi
	,[Hakukohteen koulutusala 1995] = d6.opintoala1995_fi
	,[Tutkinto (hakukohde)] = d6.koulutusluokitus_fi
	,[Koulutusaste, taso 1 (hakukohde)] = d6.koulutusastetaso1_fi
	,[Koulutusaste, taso 2 (hakukohde)] = d6.koulutusastetaso2_fi
	,[Koulutusala, taso 1 (hakukohde)] = d6.koulutusalataso1_fi
	,[Koulutusala, taso 2 (hakukohde)] = d6.koulutusalataso2_fi
	,[Koulutusala, taso 3 (hakukohde)] = d6.koulutusalataso3_fi
	,[OKM ohjauksen ala (hakukohde)] = d6.okmohjauksenala_fi
	,[Hakutoive] = NULL

	,[Korkeakoulu_hakukohde] = d8b.organisaatio_fi + '_' + d3.selite_fi
	,[1 hakukohde] = NULL -- d32.hakukohde
	,[1 Koulutusala, taso 1] = NULL -- d33b.iscfibroad2013
	,[1 Koulutusala, taso 2] = NULL -- d33b.iscfinarrow2013
	,[1 Koulutusala, taso 3] = NULL -- d33b.iscfi2013
	,[1 Sektori] = NULL 
	,[1 Aloitussykli] = NULL
	,[1 Korkeakoulu] = NULL
	,[1 Korkeakoulu_hakukohde] = NULL
	,[2 hakukohde] = NULL -- d34.hakukohde
	,[2 Koulutusala, taso 1] = NULL -- d35b.iscfibroad2013
	,[2 Koulutusala, taso 2] = NULL -- d35b.iscfinarrow2013
	,[2 Koulutusala, taso 3] = NULL -- d35b.iscfi2013
	,[2 Sektori] = NULL 
	,[2 Aloitussykli] = NULL
	,[2 Korkeakoulu] = NULL
	,[2 Korkeakoulu_hakukohde] = NULL
	,[3 hakukohde] = NULL -- d36.hakukohde
	,[3 Koulutusala, taso 1] = NULL -- d37b.iscfibroad2013
	,[3 Koulutusala, taso 2] = NULL -- d37b.iscfinarrow2013
	,[3 Koulutusala, taso 3] = NULL -- d37b.iscfi2013
	,[3 Sektori] = NULL 
	,[3 Aloitussykli] = NULL
	,[3 Korkeakoulu] = NULL
	,[3 Korkeakoulu_hakukohde] = NULL
	,[4 hakukohde] = NULL -- d38.hakukohde
	,[4 Koulutusala, taso 1] = NULL -- d39b.iscfibroad2013
	,[4 Koulutusala, taso 2] = NULL -- d39b.iscfinarrow2013
	,[4 Koulutusala, taso 3] = NULL -- d39b.iscfi2013
	,[4 Sektori] = NULL
	,[4 Aloitussykli] = NULL
	,[4 Korkeakoulu] = NULL 
	,[4 Korkeakoulu_hakukohde] = NULL
	,[5 hakukohde] = NULL -- d40.hakukohde
	,[5 Koulutusala, taso 1] = NULL -- d41b.iscfibroad2013
	,[5 Koulutusala, taso 2] = NULL -- d41b.iscfinarrow2013
	,[5 Koulutusala, taso 3] = NULL -- d41b.iscfi2013
	,[5 Sektori] = NULL
	,[5 Aloitussykli] = NULL
	,[5 Korkeakoulu] = NULL 
	,[5 Korkeakoulu_hakukohde] = NULL
	,[6 hakukohde] = NULL -- d42.hakukohde
	,[6 Koulutusala, taso 1] = NULL -- d43b.iscfibroad2013
	,[6 Koulutusala, taso 2] = NULL -- d43b.iscfinarrow2013
	,[6 Koulutusala, taso 3] = NULL -- d43b.iscfi2013
	,[6 Sektori] = NULL 
	,[6 Aloitussykli] = NULL
	,[6 Korkeakoulu] = NULL 
	,[6 Korkeakoulu_hakukohde] = NULL
	,[Valintatapajono] = NULL
	,[Valintatapajonon nimi] = NULL
	,[Pisteet] = NULL
	,[Henkilö OID] = NULL
	,[Ikä] = NULL
	,[Ikäryhmä] = NULL
	,[Kansalaisuus] = NULL
	,[Kansalaisuus (maanosa)] = null
	,[Kansalaisuus (ryhmä)] = null
	,[Kotipaikkakunta] = NULL
	,[Kotipaikan maakunta] = NULL
	,[Hakijan kotimaakunta sama kuin hakukohteen maakunta] = NULL
	,[Kotipaikan AVI] = NULL
	,[Kotipaikan ELY] = NULL
	,[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[Koulutuksen alkamiskausi] = d9.selite_fi
	,[Koulutuksen kieli] = d7.kieli_fi
	,[Opiskelun laajuus] = d2.selite_fi
	,[Pohjakoulutuksen maa] = NULL
	,[Pohjakoulutus] = NULL 
	,[Sektori] = case when d3.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d6.koulutussektori_fi end--case when d3.selite_fi='Elintarviketieteet, elintarviketieteiden kandidaatti ja maisteri' then 'Yliopistokoulutus' else d6.koulutussektori_fi end
	,[Sukupuoli] = NULL
	,[Toisen asteen koulutuksen suoritusvuosi] = null
	,[Ylioppilastutkinnon suoritusvuosi] = null
	,[Tutkinnon taso (hakukohde)] = d45.selite_fi
	,[Tutkinnon aloitussykli (hakukohde)] = d44.selite_fi
	--,[Valinnan tila] = NULL
	--,[Vastaanoton tila] = NULL
	,[Äidinkieli] = NULL

	,[Aloittanut opinnot toisen asteen koulutuksen suoritusvuonna] = null
	,[Aloittanut opinnot ilmoittamansa pohjakoulutuksen suoritusvuonna] = null

	--Ruotsi
	,[Förstagångssökande] = null
	,[Ansökan YH/Univ.] = null
	,[Ansökning] = d1.haun_nimi_sv
	,[Ansökningstiden] = coalesce(d13.selite_SV,'Information saknas')
	,[Sökobjekt] = d3.selite_sv
	,[Gemensam/separat ansökan] = case when d1.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 'Separat ansökan' when d1.hakutapa_fi='Yhteishaku' then 'Gemensam ansökan' end
	,[Typ av ansökan] = d1.hakutyyppi_SV
	,[Högskola (sökobjekt)] = d8b.organisaatio_sv
	,[Anstalt (sökobjekt)] = coalesce(d8c.organisaatio_sv,d8b.organisaatio_sv)
	,[Landskap (sökobjekt)] = d5.maakunta_SV
	,[Kommun (sökobjekt)] = d5.kunta_SV
	,[Utb.nivå (sökobjekt)] = d6.koulutusaste2002_SV
	,[Utb.område (2002) (sökobjekt)] = d6.koulutusala2002_sv
	,[Studieområde (2002) (sökobjekt)] = d6.opintoala2002_SV
	,[Utb.område (1995) (sökobjekt)] = d6.opintoala1995_SV
	,[Utb.nivå, nivå 1 (sökobjekt)] = d6.koulutusastetaso1_sv
	,[Utb.nivå, nivå 2 (sökobjekt)] = d6.koulutusastetaso2_sv
	,[Utb.område, nivå 1 (sökobjekt)] = d6.koulutusalataso1_sv
	,[Utb.område, nivå 2 (sökobjekt)] = d6.koulutusalataso2_sv
	,[Utb.område, nivå 3 (sökobjekt)] = d6.koulutusalataso3_sv
	,[UKM-styrningsområde (sökobjekt)] = d6.okmohjauksenala_sv
	,[Ansökningsönskemål] = null

	,[Högskola_sökobjekt] = d8b.organisaatio_sv + '_' + d3.selite_sv
	,[1 Sökobjekt] = NULL -- d32.hakukohde_SV
	,[1 Utb.område, nivå 1] = NULL -- d33b.iscfibroad2013_SV
	,[1 Utb.område, nivå 2] = NULL -- d33b.iscfinarrow2013_SV
	,[1 Utb.område, nivå 3] = NULL -- d33b.iscfi2013_SV
	,[1 Sektor] = NULL
	,[1 Cykeln] = NULL
	,[1 Högskola] = NULL
	,[1 Högskola_sökobjekt] = NULL
	,[2 Sökobjekt] = NULL -- d34.hakukohde_SV
	,[2 Utb.område, nivå 1] = NULL -- d35b.iscfibroad2013_SV
	,[2 Utb.område, nivå 2] = NULL -- d35b.iscfinarrow2013_SV
	,[2 Utb.område, nivå 3] = NULL -- d35b.iscfi2013_SV
	,[2 Sektor] = NULL
	,[2 Cykeln] = NULL
	,[2 Högskola] = NULL
	,[2 Högskola_sökobjekt] = NULL
	,[3 Sökobjekt] = NULL -- d36.hakukohde_SV
	,[3 Utb.område, nivå 1] = NULL -- d37b.iscfibroad2013_SV
	,[3 Utb.område, nivå 2] = NULL -- d37b.iscfinarrow2013_SV
	,[3 Utb.område, nivå 3] = NULL -- d37b.iscfi2013_SV
	,[3 Sektor] = NULL
	,[3 Cykeln] = NULL
	,[3 Högskola] = NULL
	,[3 Högskola_sökobjekt] = NULL
	,[4 Sökobjekt] = NULL -- d38.hakukohde_SV
	,[4 Utb.område, nivå 1] = NULL -- d39b.iscfibroad2013_SV
	,[4 Utb.område, nivå 2] = NULL -- d39b.iscfinarrow2013_SV
	,[4 Utb.område, nivå 3] = NULL -- d39b.iscfi2013_SV
	,[4 Sektor] = NULL
	,[4 Cykeln] = NULL
	,[4 Högskola] = NULL
	,[4 Högskola_sökobjekt] = NULL
	,[5 Sökobjekt] = NULL -- d40.hakukohde_SV
	,[5 Utb.område, nivå 1] = NULL -- d41b.iscfibroad2013_SV
	,[5 Utb.område, nivå 2] = NULL -- d41b.iscfinarrow2013_SV
	,[5 Utb.område, nivå 3] = NULL -- d41b.iscfi2013_SV
	,[5 Sektor] = NULL
	,[5 Cykeln] = NULL
	,[5 Högskola] = NULL
	,[5 Högskola_sökobjekt] = NULL
	,[6 Sökobjekt] = NULL -- d42.hakukohde_SV
	,[6 Utb.område, nivå 1] = NULL -- d43b.iscfibroad2013_SV
	,[6 Utb.område, nivå 2] = NULL -- d43b.iscfinarrow2013_SV
	,[6 Utb.område, nivå 3] = NULL -- d43b.iscfi2013_SV
	,[6 Sektor] = NULL
	,[6 Cykeln] = NULL
	,[6 Högskola] = NULL
	,[6 Högskola_sökobjekt] = NULL
	,[Typ av antagninskö] = NULL
	,[Namnet på antagningskö] = NULL
	,[Ålder] = null
	,[Åldersgrupp] = null
	,[Medborgarskap] = null
	,[Medborgarskap (världsdel)] = null
	,[Medborgarskap (gruppen)] = null
	,[Hemkommun] = null
	,[Hemlandskap] = null
	,[Begynnelseår] = f.koulutuksen_alkamisvuosi
	,[Begynnelsetermin] = d9.selite_sv
	,[Utbildningens språk] = d7.kieli_SV
	,[Studiernas omfattning] = d2.selite_fi
	,[Grundutbildningens land] = null
	,[Grundutbildning] = null
	,[Sektor] = d6.koulutussektori_sv--coalesce(case when d3.selite_fi like 'Ammatillinen opettajankoulutus%' or d3.selite_fi in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'Yrkeshögskoleutbildning' when d6.koulutussektori_fi = 'Ammattikorkeakoulutus' then 'Yrkeshögskoleutbildning' when d6.koulutussektori_fi = 'Yliopistokoulutus' then 'Universitetsutbildning' else 'Information saknas' end, 'Information saknas')
	,[Kön] = null
	,[År då andra stadiets utbildning avlagts] = null
	,[Examensnivå (sökobjekt)] = d45.selite_sv
	,[Cykeln (sökobjekt)] = d44.selite_sv
	,[Modersmål] = null

	--Englanti
	,[First-time applicant] = null
	,[Application to UAS/Univ.] = null		
	,[Application] = d1.haun_nimi_EN
	,[Application period] = coalesce(d13.selite_EN,'Missing data')
	,[Applied study programme] = d3.selite_EN
	,[Joint/separate application] = case when d1.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 'Separate application' when d1.hakutapa_fi='Yhteishaku' then 'Joint application' end
	,[Application round] = d1.hakutyyppi_EN
	,[Higher education institution] = d8b.organisaatio_EN
	,[Faculty/campus] = coalesce(d8c.organisaatio_EN,d8b.organisaatio_EN)
	,[Region of study programme] = d5.maakunta_EN
	,[Municipality of study programme] = d5.kunta_EN
	,[Level of education] = d6.koulutusaste2002_EN
	,[Field of ed. (2002)] = d6.Koulutusala2002_EN
	,[Subfield of ed. (2002)] = d6.opintoala2002_EN
	,[Field of ed. (1995)] = d6.opintoala1995_EN
	,[Level of ed., tier 1] = d6.koulutusastetaso1_en
	,[Level of ed., tier 2] = d6.koulutusastetaso2_en
	,[Field of ed., level 1] = d6.koulutusalataso1_en
	,[Field of ed., level 2] = d6.koulutusalataso2_en
	,[Field of ed., level 3] = d6.koulutusalataso3_en
	,[Field of ed., HE steering] = d6.okmohjauksenala_EN
	,[Preference of study programme] = null

	,[HE institution_study programme] = d8b.organisaatio_en + '_' + d3.selite_en
	,[1 Study programme] = NULL -- d32.hakukohde_EN
	,[1 Field of ed., tier 1] = NULL -- d33b.iscfibroad2013_EN
	,[1 Field of ed., tier 2] = NULL -- d33b.iscfinarrow2013_EN
	,[1 Field of ed., tier 3] = NULL -- d33b.iscfi2013_EN
	,[1 Sector] = NULL
	,[1 Beginning cycle] = NULL
	,[1 HE institution] = NULL
	,[1 HE institution_study programme] = NULL
	,[2 Study programme] = NULL -- d34.hakukohde_EN
	,[2 Field of ed., tier 1] = NULL -- d35b.iscfibroad2013_EN
	,[2 Field of ed., tier 2] = NULL -- d35b.iscfinarrow2013_EN
	,[2 Field of ed., tier 3] = NULL -- d35b.iscfi2013_EN
	,[2 Sector] = NULL
	,[2 Beginning cycle] = NULL
	,[2 HE institution] = NULL
	,[2 HE institution_study programme] = NULL
	,[3 Study programme] = NULL -- d36.hakukohde_EN
	,[3 Field of ed., tier 1] = NULL -- d37b.iscfibroad2013_EN
	,[3 Field of ed., tier 2] = NULL -- d37b.iscfinarrow2013_EN
	,[3 Field of ed., tier 3] = NULL -- d37b.iscfi2013_EN
	,[3 Sector] = NULL
	,[3 Beginning cycle] = NULL
	,[3 HE institution] = NULL
	,[3 HE institution_study programme] = NULL
	,[4 Study programme] = NULL -- d38.hakukohde_EN
	,[4 Field of ed., tier 1] = NULL -- d39b.iscfibroad2013_EN
	,[4 Field of ed., tier 2] = NULL -- d39b.iscfinarrow2013_EN
	,[4 Field of ed., tier 3] = NULL -- d39b.iscfi2013_EN
	,[4 Sector] = NULL
	,[4 Beginning cycle] = NULL
	,[4 HE institution] = NULL
	,[4 HE institution_study programme] = NULL
	,[5 Study programme] = NULL -- d40.hakukohde_EN
	,[5 Field of ed., tier 1] = NULL -- d41b.iscfibroad2013_EN
	,[5 Field of ed., tier 2] = NULL -- d41b.iscfinarrow2013_EN
	,[5 Field of ed., tier 3] = NULL -- d41b.iscfi2013_EN
	,[5 Sector] = NULL
	,[5 Beginning cycle] = NULL
	,[5 HE institution] = NULL
	,[5 HE institution_study programme] = NULL
	,[6 Study programme] = NULL -- d42.hakukohde_EN
	,[6 Field of ed., tier 1] = NULL -- d43b.iscfibroad2013_EN
	,[6 Field of ed., tier 2] = NULL -- d43b.iscfinarrow2013_EN
	,[6 Field of ed., tier 3] = NULL -- d43b.iscfi2013_EN
	,[6 Sector] = NULL
	,[6 Beginning cycle] = NULL
	,[6 HE institution] = NULL
	,[6 HE institution_study programme] = NULL
	,[Type of admission queue] = NULL
	,[Age] = null
	,[Age group] = null
	,[Nationality] = null
	,[Nationality (continent)] = null
	,[Nationality (group)] = null				
	,[Municipality of residence] = null
	,[Region of residence] = null
	,[Year (start of studies)] = f.koulutuksen_alkamisvuosi
	,[Term (start of studies)] = d9.selite_EN
	,[Language of education] = d7.kieli_EN
	,[Extent of the study programme] = d2.selite_fi
	,[Country of prior education] = null
	,[Prior education] = null
	,[Sector] = d6.koulutussektori_en--coalesce(case when d3.selite_fi like 'Ammatillinen opettajankoulutus%' or d3.selite_fi in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'University of applied sciences education' when d6.koulutussektori_fi = 'Ammattikorkeakoulutus' then 'University of applied sciences education' when d6.koulutussektori_fi = 'Yliopistokoulutus' then 'University education' else 'Unknown' end, 'Unknown')
	,[Gender] = null
	,[Graduation year (upper secondary education)] = null
	,[Level of degree] = d45.selite_en
	,[Beginning cycle of education] = d44.selite_en
	,[Mother tongue] = null

	--KOODIMUUTTUJAT
	,[Koodit Tutkinto (hakukohde)] = d6.koulutusluokitus_koodi
	,[Koodit Koulutusala, taso 1 (hakukohde)] = d6.koulutusalataso1_koodi
	,[Koodit Koulutusala, taso 2 (hakukohde)] = d6.koulutusalataso2_koodi
	,[Koodit Koulutusala, taso 3 (hakukohde)] = d6.koulutusalataso3_koodi
	,[Koodit OKM ohjauksen ala (hakukohde)] = d6.okmohjauksenala_koodi
	,[Koodit Koulutuksen järjestäjä] = d8a.organisaatio_koodi
	,[Koodit Korkeakoulu] = d8b.organisaatio_koodi
	,[Koodit Maakunta hakukohde] = d5.maakunta_koodi
	,[Koodit Kunta hakukohde] = d5.kunta_koodi
	,[Koodit Kotimaakunta hakija] = null
	,[Koodit Kotikunta hakija] = null

	,[yksi_pk_per_hakija] = 0

	,[Hakijat2] = 0
	,[Ensisijaiset hakijat2] = 0
	,[Valitut2] = 0
	,[Paikan vastaanottaneet2] = 0
	,[Aloittaneet2] = 0
	,[Uusi ylioppilas] = -1
	,[Aidosti ensikertainen2] = -1
	,[1 hakukohteen sektori] = -1
	,[1 hakukohteen kk] = -1
	,[1 hakukohteen koulutusala1] = -1
	,[ei vastaanottoa kaudella] = -1

	,[Ensikertainen hakija järjestys] = 'öö'
	,[Hakuaika järjestys] = coalesce(left(d13.selite_fi,3),'ööö')--case when coalesce(isnull(d13.selite_fi,''),'')='' then 'ööö' else d13.selite_fi end
	,[Haku AMK/YO järjestys] = 99
	,[Hakukohteen koulutusaste 2002 järjestys] = d6.jarjestys_koulutusaste2002_koodi
	,[Hakukohteen koulutusala 2002 järjestys] = d6.jarjestys_koulutusala2002_koodi
	,[Hakukohteen opintoala 2002 järjestys] = d6.jarjestys_opintoala2002_koodi
	,[Hakukohteen koulutusala 1995 järjestys] = d6.jarjestys_opintoala1995_koodi
	,[Koulutusaste, taso 1 järjestys] = d6.jarjestys_koulutusastetaso1_koodi
	,[Koulutusaste, taso 2 järjestys] = d6.jarjestys_koulutusastetaso2_koodi
	,[Koulutusala, taso 1 järjestys] = d6.jarjestys_koulutusalataso1_koodi
	,[Koulutusala, taso 2 järjestys] = d6.jarjestys_koulutusalataso2_koodi
	,[Koulutusala, taso 3 järjestys] = d6.jarjestys_koulutusalataso3_koodi
	,[OKM ohjauksen ala järjestys] = d6.jarjestys_okmohjauksenala_koodi
	,[Hakutoive järjestys] = 99
	,[Hakukohteen maakunta järjestys] = d5.jarjestys_maakunta_koodi
	,[Hakutapa järjestys] = case when d1.hakutapa_fi='Yhteishaku' then 1 when d1.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 2 else 99 end
	,[Hakutyyppi järjestys] = d1.jarjestys_hakutyyppi
	,[Ikä järjestys] = 9999
	,[Ikä 5v järjestys] = 9999
	,[Kansalaisuus järjestys] = 99999
	,[Kansalaisuus maanosa järjestys] = 9999
	,[Kansalaisuus ryhmä järjestys] = 999999
	,[Kotipaikkakunta järjestys] = 'ööö'
	,[Kotipaikan maakunta järjestys] = 999999
	,[Kotipaikan AVI järjestys] = 9999
	,[Kotipaikan ELY järjestys] = 9999
	,[Koulutuksen kieli järjestys] = d7.kieli_koodi
	,[Opiskelun laajuus järjestys] = d2.jarjestys--case when f.Opiskelun_laajuus='' then 9999 when len(opiskelun_laajuus)=2 then '0'+opiskelun_laajuus else f.Opiskelun_laajuus end
	,[Pohjakoulutuksen maa järjestys] = 999
	,[Pohjakoulutus järjestys] = 'ööö'
	,[Sektori järjestys] = d6.jarjestys_koulutussektori_koodi
	,[Sukupuoli järjestys] = 999999
	,[Toisen asteen koulutuksen suoritusvuosi järjestys] = 9999
	,[Ylioppilastutkinnon suoritusvuosi järjestys] = 9999
	,[Tutkinnon taso (hakukohde) järjestys] = d45.jarjestys_koodi
	,[Tutkinnon aloitussykli (hakukohde) järjestys] = d44.jarjestys_koodi
	,[Äidinkieli versio1 järjestys] = 999999
	,[1 Koulutusala, taso 1 järjestys] = 999 
	,[1 Koulutusala, taso 2 järjestys] = 999
	,[1 Koulutusala, taso 3 järjestys] = 999
	,[2 Koulutusala, taso 1 järjestys] = 999
	,[2 Koulutusala, taso 2 järjestys] = 999
	,[2 Koulutusala, taso 3 järjestys] = 999
	,[3 Koulutusala, taso 1 järjestys] = 999
	,[3 Koulutusala, taso 2 järjestys] = 999
	,[3 Koulutusala, taso 3 järjestys] = 999
	,[4 Koulutusala, taso 1 järjestys] = 999
	,[4 Koulutusala, taso 2 järjestys] = 999
	,[4 Koulutusala, taso 3 järjestys] = 999
	,[5 Koulutusala, taso 1 järjestys] = 999
	,[5 Koulutusala, taso 2 järjestys] = 999
	,[5 Koulutusala, taso 3 järjestys] = 999
	,[6 Koulutusala, taso 1 järjestys] = 999
	,[6 Koulutusala, taso 2 järjestys] = 999
	,[6 Koulutusala, taso 3 järjestys] = 999
	,[Valintatapajono järjestys] = 'ööö'

FROM [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat] f
LEFT JOIN dw.d_haku d1 on d1.id=f.d_haku_id
LEFT JOIN dw.d_kausi d9 on d9.id=f.d_kausi_koulutuksen_alkamiskausi_id
INNER JOIN sa.sa_haku_ja_valinta_vuosikello_korkea_aste d4 on ((d4.haku_oid=d1.haku_oid and d4.haku_oid is not null) OR (d4.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d9.jarjestys as varchar) and d1.hakutapa_koodi <> '01' and d4.haku_oid is null)) and f.loadtime >= d4.aloituspaikat	
LEFT JOIN dw.d_opintojenlaajuus d2 on d2.id=f.d_opintojen_laajuus_id
LEFT JOIN dw.d_hakukohde d3 on d3.id=f.d_hakukohde_id
LEFT JOIN dw.d_alueluokitus d5 on d5.id=f.d_alueluokitus_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d6 on d6.id=f.d_koulutusluokitus_hakukohde_id
LEFT JOIN dw.d_kieli d7 on d7.id=f.d_kieli_koulutus_id
LEFT JOIN dw.d_organisaatioluokitus d8a on d8a.id=d_organisaatio_koulutuksen_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d8b on d8b.id=d_organisaatio_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d8c on d8c.id=d_organisaatio_toimipiste_id
LEFT JOIN dw.d_hakuaika d13 on d13.id=f.d_hakuaika_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN dw.d_tutkinnon_taso_kk d45 on d45.id=f.d_tutkinnon_taso_kk_id


where (f.koulutuksen_alkamisvuosi > 2016 OR (f.koulutuksen_alkamisvuosi = 2016 and d9.selite_fi = 'Syksy'))
and d1.korkeakouluhaku = 1 and d8b.oppilaitostyyppi_koodi in ('41','42')


