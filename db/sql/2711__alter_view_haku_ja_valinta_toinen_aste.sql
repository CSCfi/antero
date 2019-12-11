USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_toinen_aste]    Script Date: 11.12.2019 14:15:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dw].[v_haku_ja_valinta_toinen_aste] AS

SELECT --top 10
		cast(f.loadtime as date) as Päivitysaika
      ,Lukumäärä = 1
	  ,[Aloituspaikat2] = NULL
	  ,[Valintojen aloituspaikat] = NULL
	  ,[Pisteraja] = NULL
	  ,[Tilannepäivä] = f.loadtime
	  ,[Pohjakoulutuksen järjestäjä] = d30a.organisaatio_fi
      ,[Pohjakoulutuksen oppilaitos] = d30b.organisaatio_fi
	  ,[Pohjakoulutuksen oppilaitoksen opetuskieli] = d30b.oppilaitoksenopetuskieli_fi
      ,[Pohjakoulutuksen kunta] = d29.kunta_fi
	  ,[Pohjakoulutuksen maakunta] = d29.maakunta_fi
	  ,[Pohjakoulutuksen seutukunta] = d29.seutukunta_fi
	  ,[Pohjakoulutuksen suuralue (OKM)] = NULL--d29.suuralue_okm_
	  ,[Haku] = d25.hakuryhma_fi
	  ,[Haun nimi] = d25.haun_nimi_fi
	  ,[Hakukohde] = d10.selite_fi
	  ,[Kaksoistutkinto] = d10b.kytkin_fi
	  ,[Hakutapa] = case d25.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d25.hakutapa_fi end
	  ,[Hakutyyppi] = d25.hakutyyppi_fi
	  ,[Hakukohteen organisaatio] = d16a.organisaatio_fi
	  ,[Koulutuksen järjestäjä (hakukohde)] = d16a.organisaatio_fi
	  ,[Oppilaitos (hakukohde)] = d16b.organisaatio_fi
	  ,[Toimipiste (hakukohde)] = d16c.organisaatio_fi
	  ,[Koulutustyyppi (hakukohde)] = d18.selite_fi
	  ,[Suuralue (OKM) (hakukohde)] = NULL--d19.suuralue_okm
	  ,[Seutukunta (hakukohde)] = d19.seutukunta_fi
	  ,[Maakunta (hakukohde)] = d19.maakunta_fi
	  ,[Kunta (hakukohde)] = d19.kunta_fi
	  ,[Koulutusaste (hakukohde)] = d20.koulutusaste2002_fi
	  ,[Koulutusala (hakukohde)] = d20.koulutusala2002_fi
	  ,[Opintoala (hakukohde)] = opintoala2002_fi
	  ,[Koulutusaste, taso 1 (hakukohde)] = d20.koulutusastetaso1_fi
	  ,[Koulutusaste, taso 2 (hakukohde)] = d20.koulutusastetaso2_fi
	  ,[Koulutusala, taso 1 (hakukohde)] = d20.koulutusalataso1_fi
	  ,[Koulutusala, taso 2 (hakukohde)] = d20.koulutusalataso2_fi
	  ,[Koulutusala, taso 3 (hakukohde)] = d20.koulutusalataso3_fi
	  ,[Tutkinto (hakukohde)] = d20.koulutusluokitus_fi
	  ,[Hakutoive] = f.hakutoive
	  ,[Henkilö OID] = henkilo_oid
	  ,[Ikäryhmä] = d26.ikaryhma1_fi
	  ,[Kansalaisuus] = d33.maatjavaltiot2_fi
	  ,[Kansalaisuus (maanosa)] = d33.maanosa0_fi
	  ,[Kotipaikkakunta (hakija)] = d6.kunta_fi
	  ,[Kotipaikan maakunta (hakija)] = d6.maakunta_fi
	  ,[Kotipaikan seutukunta (hakija)] = d6.seutukunta_fi
	  ,[Kotipaikan suuralue (OKM) (hakija)] = NULL--d6.suuralue_okm
	  ,[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	  ,[Koulutuksen alkamiskausi] = d2.selite_fi
	  ,[Koulutuksen kieli] = d27.kieli_fi
	  ,[Pohjakoulutuksen päättövuosi] = case when f.pohjakoulutuksen_paattovuosi is null or f.pohjakoulutuksen_paattovuosi='0' then 'Tuntematon' else f.pohjakoulutuksen_paattovuosi end --coalesce(cast([perusopetuksen_paattovuosi] as varchar(50)), 'Tuntematon') -- tän vois fiksata latauksessa jo	 
	  ,[Pohjakoulutus] = case when d22.selite_fi in('Perusopetuksen oppimäärä','Perusopetuksen osittain yksilöllistetty oppimäärä','Perusopetuksen pääosin tai kokonaan yksilöllistetty oppimäärä','Perusopetuksen yksilöllistetty oppimäärä, opetus järjestetty toiminta-alueittain') then 'Perusopetuksen oppimäärä' else d22.selite_fi end
	  ,[Erityisopetuspohja] = case when d22.selite_fi not in ('Perusopetuksen osittain yksilöllistetty oppimäärä','Perusopetuksen pääosin tai kokonaan yksilöllistetty oppimäärä','Perusopetuksen yksilöllistetty oppimäärä, opetus järjestetty toiminta-alueittain') then 'Ei erityisopetuspohja' else d22.selite_fi end
	  ,[Pohjakoulutusvaatimus] = d5.selite_fi
	  ,[Päättöluokka] = case when f.paattoluokka in ('9','10') then f.paattoluokka else 'Muu' end
	  ,[Sukupuoli] = d7.sukupuoli_fi
	  ,[Äidinkieli] = d8.kieliryhma1_fi


--Ruotsi
	  ,[Tidpunkt] = convert(varchar(10),f.[loadtime],104)
	  ,[Grundutbildningens anordnare] = d30a.organisaatio_sv
      ,[Grundutbildningens läroanstalt] = d30b.organisaatio_sv
      ,[Grundutbildningens kommun] = d29.kunta_SV
	  ,[Grundutbildningens landskap] = d29.maakunta_SV
	  ,[Ansökning] = d25.hakuryhma_sv
	  ,[Sökobjekt] = d10.selite_sv
	  ,[Gemensam/separat ansökan] = case when d25.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 'Separata antagningar' else d25.hakutapa_sv end
	  ,[Typ av ansökan] = d25.hakutyyppi_sv
	  ,[Utbildningsanordnare (sökobjet)] = d16a.organisaatio_sv
	  ,[Läroanstalt (sökobjekt)] = d16b.organisaatio_sv
	  ,[Anstalt (sökobjekt)] = d16c.organisaatio_sv
	  ,[Utbildningstyp (sökobjekt)] = d18.selite_sv
	  ,[Landskap (sökobjekt)] = d19.maakunta_SV
	  ,[Kommun (sökobjekt)] = d19.kunta_SV
	  ,[Utbildningsnivå (sökobjekt)] = d20.koulutusaste2002_sv
	  ,[Utbildningsområde (sökobjekt)] = d20.koulutusala2002_SV
	  ,[Studieområde (sökobjekt)] = d20.opintoala2002_SV
	  ,[Utb.nivå, nivå 1 (sökobjekt)] = d20.koulutusastetaso1_sv
	  ,[Utb.nivå, nivå 2 (sökobjekt)] = d20.koulutusastetaso2_sv
	  ,[Utb.område, nivå 1 (sökobjekt)] = d20.koulutusalataso1_sv
	  ,[Utb.område, nivå 2 (sökobjekt)] = d20.koulutusalataso2_sv
	  ,[Utb.område, nivå 3 (sökobjekt)] = d20.koulutusalataso3_sv
	  ,[Examen (sökobjekt)] = d20.koulutusluokitus_sv
	  ,[Ansökningönskemål] = f.hakutoive--Ansökningsönskemål]
	  ,[Åldersgrupp] = d26.ikaryhma1_sv
	  ,[Medborgarskap] = d33.maatjavaltiot2_sv
	  ,[Medborgarskap (världsdel)] = d33.maanosa0_SV
	  ,[Intresserad av läroavtalsutbildningen] = d3.kytkin_sv--Intresserad av läroavtalsutbildning
	  ,[Hemkommun (sökande)] = d6.kunta_SV
	  ,[Hemlandskap (sökande)] = d6.maakunta_SV  
	  ,[Begynnelseår] = f.koulutuksen_alkamisvuosi
	  ,[Begynnelsetermin] = d2.selite_sv
	  ,[Utbildningens språk] = d27.kieli_SV
	  ,[År då grundutbildning avslutades] = case when f.pohjakoulutuksen_paattovuosi is null or f.pohjakoulutuksen_paattovuosi='0' then 'Okänd' else f.pohjakoulutuksen_paattovuosi end --coalesce(cast([perusopetuksen_paattovuosi] as varchar(50)), 'Tuntematon') -- tän vois fiksata latauksessa jo	 
	  ,[Grundutbildning] = case when d22.selite_fi in ('Perusopetuksen oppimäärä','Perusopetuksen osittain yksilöllistetty oppimäärä','Perusopetuksen pääosin tai kokonaan yksilöllistetty oppimäärä','Perusopetuksen yksilöllistetty oppimäärä, opetus järjestetty toiminta-alueittain') then 'Den grundläggande utbildningens lärokurs' else d22.selite_sv end
	  ,[Specialundervisningsgrund] = case when d22.selite_fi not in ('Perusopetuksen osittain yksilöllistetty oppimäärä','Perusopetuksen pääosin tai kokonaan yksilöllistetty oppimäärä','Perusopetuksen yksilöllistetty oppimäärä, opetus järjestetty toiminta-alueittain') then 'Ej specialundervisningsbakrund' else d22.selite_sv end
	  --Specialundervisningsbakgrund
	  ,[Grundutbildningskrav] = d5.selite_sv
	  ,[Avslutningsklass] = case when f.paattoluokka in ('9','10') then f.paattoluokka else 'Annan' end
	  --Sista klass
	  ,[Kön] = d7.sukupuoli_SV
	  ,[Modersmål] = d8.kieliryhma1_sv

--Englanti
	  ,[Date] = convert(varchar(10),f.[loadtime],104)
	  ,[Provider of prior education] = d30a.organisaatio_en
      ,[Institution of prior education] = d30b.organisaatio_en
      ,[Municipality of prior education] = d29.kunta_EN
	  ,[Region of prior education] = d29.maakunta_EN
	  ,[Application] = d25.hakuryhma_en
	  ,[Applied study programme] = d10.selite_en
	  ,[Joint/separate application] = case when d25.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 'Separate application' when d25.hakutapa_fi='Yhteishaku' then 'Joint application' end --Application system
	  ,[Application round] = d25.hakutyyppi_en
	  ,[Education provider (study programme)] = d16a.organisaatio_en
	  ,[Ed. institution (study programme)] = d16b.organisaatio_en
	  ,[Campus (study programme)] = d16a.organisaatio_en
	  ,[Type of education (study programme)] = d18.selite_en
	  ,[Region (study programme)] = d19.maakunta_EN
	  ,[Municipality (study programme)] = d19.kunta_EN
	  ,[Level of ed. (study programme)] = d20.koulutusaste2002_EN
	  ,[Field of ed. (study programme)] = d20.koulutusala2002_EN
	  ,[Subfield of ed. (study programme)] = d20.opintoala2002_EN
	  ,[Level of ed., tier 1] = d20.koulutusastetaso1_en
	  ,[Level of ed., tier 2] = d20.koulutusastetaso2_en
	  ,[Field of ed., tier 1] = d20.koulutusalataso1_en
	  ,[Field of ed., tier 2] = d20.koulutusalataso2_en
	  ,[Field of ed., tier 3] = d20.koulutusalataso3_en
	  ,[Degree (study programme)] = d20.koulutusluokitus_EN
	  ,[Preference of study programme] = f.hakutoive
	  ,[Age group] = d26.ikaryhma1_en
	  ,[Nationality] = d33.maatjavaltiot2_en
	  ,[Nationality (continent)] = d33.maanosa0_EN
	  ,[Interested in apprenticeship training] = d3.kytkin_en
	  ,[Municipality of residence] = d6.kunta_EN
	  ,[Region of residence] = d6.maakunta_EN  
	  ,[Year (start of studies)] = f.koulutuksen_alkamisvuosi
	  ,[Term (start of studies)] = d2.selite_en
	  ,[Language of education] = d27.kieli_EN
	  ,[Graduation year (prior education)] = case when f.pohjakoulutuksen_paattovuosi is null or f.pohjakoulutuksen_paattovuosi='0' then 'Unknown' else f.pohjakoulutuksen_paattovuosi end --coalesce(cast([perusopetuksen_paattovuosi] as varchar(50)), 'Tuntematon') -- tän vois fiksata latauksessa jo	 
	  ,[Prior education] = case when d22.selite_fi in ('Perusopetuksen oppimäärä','Perusopetuksen osittain yksilöllistetty oppimäärä','Perusopetuksen pääosin tai kokonaan yksilöllistetty oppimäärä','Perusopetuksen yksilöllistetty oppimäärä, opetus järjestetty toiminta-alueittain') then '-' else d22.selite_en end
	  ,[Special needs ed. background] = case when d22.selite_fi not in ('Perusopetuksen osittain yksilöllistetty oppimäärä','Perusopetuksen pääosin tai kokonaan yksilöllistetty oppimäärä','Perusopetuksen yksilöllistetty oppimäärä, opetus järjestetty toiminta-alueittain') then 'No special needs ed. background' else d22.selite_en end
	  ,[Admission criteria] = d5.selite_en
	  ,[Last year of comprehensive school] = case when f.paattoluokka in ('9','10') then f.paattoluokka else 'Other' end
	  ,[Gender] = d7.sukupuoli_EN
	  ,[Mother tongue] = d8.kieliryhma1_en

	/* Koodimuuttujat */

	  ,[Koodit Hakukohde] = d10.oid
	  ,[Koodit Koulutuksen järjestäjä] = d16a.organisaatio_koodi
	  ,[Koodit Oppilaitos] = d16b.organisaatio_koodi
	  ,[Koodit Koulutusaste] = d20.koulutusaste2002_koodi
	  ,[Koodit Koulutusala] = d20.koulutusala2002_koodi
	  ,[Koodit Opintoala] = d20.opintoala2002_koodi
	  ,[Koodit Tutkinto] = d20.koulutusluokitus_koodi


	 /* Mittarit */

	  ,[Hakijat3] = case when f.loadtime>=d1.hakijat then 1 else 0 end
	  ,[Ensisijaiset hakijat3] = case when f.loadtime>=d1.hakijat and hakutoive=1 then 1 else 0 end
	  ,[Valitut3] = case when f.loadtime>=d1.valitut and f.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1 else 0 end
	  ,[Paikan vastaanottaneet3] = case when f.loadtime>=d1.vastaanottaneet and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0	end		
	  ,[Aloittaneet3] = case when f.loadtime>=d1.aloittaneet and f.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end

	  --Suomi
	  ,[Hakeutuminen] = coalesce(d32.haut, 'Tieto puuttuu')
	  ,[Valinta] = coalesce(d32.valinnat, 'Tieto puuttuu')
	  ,[Paikan vastaanotto] = coalesce(d32.vastaanotto, 'Tieto puuttuu')
	  --Ruotsi
	  ,[Sökning] = d32.haut_SV
	  ,[Antagning] = d32.valinnat_SV
	  ,[Mottagande] = d32.vastaanotto_SV
	  --Englanti
	  ,[Applications] = d32.haut_EN
	  ,[Selection] = d32.valinnat_EN
	  ,[Acceptance] = d32.vastaanotto_EN
	

	  /* Järjestys-kentät */


      ,[Erityisopetuspohja järjestys] = case when d22.selite_fi not in ('Perusopetuksen osittain yksilöllistetty oppimäärä','Perusopetuksen pääosin tai kokonaan yksilöllistetty oppimäärä','Perusopetuksen yksilöllistetty oppimäärä, opetus järjestetty toiminta-alueittain') then 99 else d22.jarjestys end
	  ,[Haku järjestys] = d25.hakuryhma_koodi
	  ,[Hakutoive järjestys] = f.hakutoive
      ,[Hakijan pohjakoulutuksen maakunta järjestys] = d29.jarjestys_maakunta_koodi
 	  ,[Hakukohteen koulutusaste 2002 järjestys] = d20.jarjestys_koulutusaste2002_koodi
 	  ,[Hakukohteen koulutusala 2002 järjestys] = d20.jarjestys_koulutusala2002_koodi
 	  ,[Hakukohteen opintoala 2002 järjestys] = d20.jarjestys_opintoala2002_koodi
	  ,[Hakukohteen koulutusaste 1 järjestys] = d20.jarjestys_koulutusastetaso1_koodi
	  ,[Hakukohteen koulutusaste 2 järjestys] = d20.jarjestys_koulutusastetaso2_koodi
	  ,[Hakukohteen koulutusala 1 järjestys] = d20.jarjestys_koulutusalataso1_koodi
	  ,[Hakukohteen koulutusala 2 järjestys] = d20.jarjestys_koulutusalataso2_koodi
	  ,[Hakukohteen koulutusala 3 järjestys] = d20.jarjestys_koulutusalataso3_koodi
 	  ,[Hakukohteen maakunta järjestys] = d19.jarjestys_maakunta_koodi
	  ,[Hakukohteen koulutustyyppi järjestys] = d18.jarjestys
	  ,[Hakukohteen toimipiste järjestys] = case when d16c.organisaatio_fi='Tieto puuttuu' then 'ööö' else left(d16c.organisaatio_fi,20) end
	  ,[Hakutyyppi järjestys] = d25.jarjestys_hakutyyppi
	  ,[Ikä 5v järjestys] = d26.jarjestys_ikaryhma1
	  ,[Kansalaisuus (maanosa) järjestys] = d33.jarjestys_maanosa0_koodi
	  ,[Kansalaisuus järjestys] = d33.jarjestys_maatjavaltiot2_koodi
	  ,[Kotipaikan maakunta järjestys] = d6.jarjestys_maakunta_koodi
	  ,[Kotipaikan kunta järjestys] = d6.jarjestys_kunta_koodi
	  ,[Kotipaikan AVI järjestys] = d6.jarjestys_avi_koodi
	  ,[Kotipaikan ELY järjestys] = d6.jarjestys_ely_koodi
	  ,[Kotipaikan suuralue (OKM) järjestys] = NULL--d6.jarjestys_suuralue_okm
	  ,[Koulutuksen kieli järjestys] = d27.kieli_koodi
	  ,[Pohjakoulutus järjestys] = case when d22.selite_fi in('Perusopetuksen oppimäärä','Perusopetuksen osittain yksilöllistetty oppimäärä','Perusopetuksen pääosin tai kokonaan yksilöllistetty oppimäärä','Perusopetuksen yksilöllistetty oppimäärä, opetus järjestetty toiminta-alueittain') then '1' else d22.jarjestys end
	  ,[Pohjakoulutuksen suuralue (OKM) järjestys] = NULL--d29.jarjestys_suuralue_okm
	  ,[Pohjakoulutuksen maakunta järjestys] = d29.jarjestys_maakunta_koodi
	  ,[Pohjakoulutuksen kunta järjestys] = case d29.kunta_koodi when '-1' then '9998' else d29.kunta_koodi end
	  ,[Pohjakoulutuksen järjestäjä järjestys] = case when NULLIF(d30a.organisaatio_fi,'') is null then 'ööö' else left(d30a.organisaatio_en,15) end
	  ,[Pohjakoulutuksen oppilaitos järjestys] = case when NULLIF(d30b.organisaatio_fi,'') is null then 'ööö' else left(d30b.organisaatio_fi,15) end
	  ,[Pohjakoulutusvaatimus järjestys] = d5.jarjestys
	  ,[Pohjakoulutuksen päättövuosi järjestys] = case when f.pohjakoulutuksen_paattovuosi in ('Tieto puuttuu','0') then '9999' else 2050-f.pohjakoulutuksen_paattovuosi end
	  ,[Päättöluokka järjestys] = case when f.paattoluokka in ('9','10') then f.paattoluokka else '998' end
	  ,[Sukupuoli järjestys] = d7.jarjestys_sukupuoli_koodi
	  ,[Äidinkieli versio1 järjestys] = d8.jarjestys_kieliryhma1
	  ,[Hakeutuminen järjestys] = coalesce(d32.haut_jarjestys, 99)
	  ,[Valinta järjestys] = coalesce(d32.valinnat_jarjestys, 99)
	  ,[Vastaanotto järjestys] = coalesce(d32.vastaanotto_jarjestys, 99)

     
  FROM dw.f_haku_ja_valinta_hakeneet_toinen_aste f

  LEFT JOIN dw.d_haku d25 ON d25.id = f.d_haku_id
  LEFT JOIN dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
  INNER JOIN sa.sa_haku_ja_valinta_vuosikello_toinen_aste d1 on d1.haku_oid=d25.haku_oid and d1.haku_oid is not null and f.loadtime >= d1.hakijat
  --LEFT JOIN dw.d_kausi d1 ON d1.id = f.[hakukausi_id]
  LEFT JOIN dw.d_kytkin d3 ON d3.id=f.d_kytkin_kiinnostunut_oppisopimuksesta_id
  --LEFT JOIN dw.d_paattoluokka d4 ON d4.id = f.paattoluokka_id
  LEFT JOIN dw.d_pohjakoulutusvaatimus d5 ON d5.id = f.d_pohjakoulutusvaatimus_id
  LEFT JOIN dw.d_alueluokitus d6 ON d6.id = f.d_alueluokitus_kotipaikka_id
  LEFT JOIN dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
  LEFT JOIN dw.d_kieli d8 ON d8.id = f.d_kieli_aidinkieli_id
  LEFT JOIN dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
  LEFT JOIN dw.d_kytkin d10b ON d10b.kytkin_koodi = d10.kaksoistutkinto
  LEFT JOIN dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatio_koulutuksen_jarjestaja_id
  LEFT JOIN dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
  LEFT JOIN dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatio_toimipiste_id
  LEFT JOIN dw.d_koulutustyyppi d18 ON d18.id = f.d_koulutustyyppi_id
  LEFT JOIN dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
  LEFT JOIN dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
  --LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d20 ON d20.koulutusluokitus_avain = d20b.koulutus_koodi
  --LEFT JOIN dw.d_hakutoive d21 ON d21.id = f.hakutoive_id
  LEFT JOIN dw.d_pohjakoulutus d22 ON d22.id = f.d_pohjakoulutus_id
  --LEFT JOIN dw.d_valinnan_tila d23 ON d23.id = f.valinnan_tila_id
  --LEFT JOIN dw.d_vastaanoton_tila d24 ON d24.id = f.vastaanoton_tila_id
  LEFT JOIN dw.d_ika d26 ON d26.id=f.d_ika_id
  LEFT JOIN dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id
  --LEFT JOIN dw.d_organisaatioluokitus d28 ON d28.id = f.d_organisaatio_lahtokoulu_id
  LEFT JOIN dw.d_alueluokitus d29 ON d29.id = f.d_alueluokitus_lahtokoulun_kunta_id
  LEFT JOIN dw.d_organisaatioluokitus d30a ON d30a.id = f.d_organisaatio_lahtokoulu_koulutuksen_jarjestaja_id
  LEFT JOIN dw.d_organisaatioluokitus d30b ON d30b.id = f.d_organisaatio_lahtokoulu_oppilaitos_id
  LEFT JOIN sa.sa_haku_ja_valinta_hakijat_toinen_aste d32 ON d32.oid=f.henkilo_oid and d32.vuosi=f.koulutuksen_alkamisvuosi
  LEFT JOIN dw.d_maatjavaltiot2 d33 on d33.id=f.d_maatjavaltiot_kansalaisuus_id

where f.koulutuksen_alkamisvuosi>2013 and d25.korkeakouluhaku=0




UNION ALL



SELECT distinct
		cast(f.loadtime as date) as Päivitysaika
	  ,Lukumäärä = 0
      ,case when f.loadtime>=d4.aloituspaikat then f.[aloituspaikat] else null end as alpa
      ,case when f.loadtime>=d4.aloituspaikat then f.[valintojen_aloituspaikat] else null end as valpa
	  ,case when f.loadtime>=d4.pisterajat then f.alin_laskettuvalintapistemaara else null end as pisteraja
	  ,f.loadtime
      ,[Pohjakoulutuksen järjestäjä] = NULL
      ,[Pohjakoulutuksen oppilaitos] = NULL
	  ,[Pohjakoulutuksen oppilaitoksen opetuskieli] = NULL
      ,[Pohjakoulutuksen kunta] = NULL
	  ,[Pohjakoulutuksen maakunta] = NULL
	  ,[Pohjakoulutuksen seutukunta] = NULL
	  ,[Pohjakoulutuksen suuralue (OKM)] = NULL
	  ,[Haku] = d1.hakuryhma_fi
	  ,[Haun nimi] = d1.haun_nimi_fi
	  ,[Hakukohde] = d3.selite_fi
	  ,[Kaksoistutkinto] = d3b.kytkin_fi
	  ,[Hakutapa] = case d1.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d1.hakutapa_fi end
      ,Hakutyyppi = d1.hakutyyppi_fi
	  ,d8a.organisaatio_fi
	  ,d8a.organisaatio_fi 
	  ,d8b.organisaatio_fi
	  ,d8c.organisaatio_fi
	  ,Koulutustyyppi = d10.selite_fi
	  ,[Suuralue (OKM) (hakukohde)] = NULL--d5.suuralue_okm
	  ,[Seutukunta (hakukohde)] = d5.seutukunta_fi
	  ,[Maakunta (hakukohde)] = d5.maakunta_fi
	  ,[Kunta (hakukohde)] = d5.kunta_fi
	  ,[Hakukohteen koulutusaste] = d6.Koulutusaste2002_fi
	  ,[Koulutusala (hakukohde)] = d6.Koulutusala2002_fi
	  ,[Opintoala (hakukohde)] = d6.Opintoala2002_fi
	  ,[Koulutusaste, taso 1 (hakukohde)] = d6.koulutusastetaso1_fi
	  ,[Koulutusaste, taso 2 (hakukohde)] = d6.koulutusastetaso2_fi
	  ,[Koulutusala, taso 1 (hakukohde)] = d6.koulutusalataso1_fi
	  ,[Koulutusala, taso 2 (hakukohde)] = d6.koulutusalataso2_fi
	  ,[Koulutusala, taso 3 (hakukohde)] = d6.koulutusalataso3_fi
	  ,[Tutkinto (hakukohde)] = d6.koulutusluokitus_fi
	  ,[Hakutoive] = NULL
	  ,[Henkilö OID] = NULL
	  ,[Ikäryhmä] = NULL
	  ,[Kansalaisuus] = NULL
	  ,[Kansalaisuus (maanosa)] = NULL
	  ,[Kotipaikkakunta (hakija)] = NULL
	  ,[Kotipaikan maakunta (hakija)] = NULL
	  ,[Kotipaikan seutukunta (hakija)] = NULL
	  ,[Kotipaikan suuralue (OKM) (hakija)] = NULL
	  ,[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	  ,[Koulutuksen alkamiskausi] = d9.selite_fi
	  ,[Koulutuksen kieli] = d7.kieli_fi
	  ,[Pohjakoulutuksen päättövuosi] = NULL
	  ,[Pohjakoulutus] = NULL
	  ,[Erityisopetuspohja] = NULL
	  ,Pohjakoulutusvaatimus = d11.selite_fi
	  ,[Päättöluokka] = NULL
	  ,[Sukupuoli] = NULL
	  ,[Äidinkieli] = NULL
	

--Ruotsi
	  ,[Tidpunkt] = convert(varchar(10),f.[loadtime],104)
	  ,[Grundutbildningens anordnare] = null
      ,[Grundutbildningens läroanstalt] = null
      ,[Grundutbildningens kommun] = null
	  ,[Grundutbildningens landskap] = null
	  ,[Ansökning] = d1.hakuryhma_sv
	  ,[Sökobjekt] = d3.selite_sv
	  ,[Gemensam/separat ansökan] = case when d1.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 'Separata antagningar' when d1.hakutapa_fi='Yhteishaku' then d1.hakutapa_sv end
	  ,[Typ av ansökan] = d1.hakutyyppi_sv
	  ,[Utbildningsanordnare (sökobjet)] = d8a.organisaatio_sv
	  ,[Läroanstalt (sökobjekt)] = d8b.organisaatio_sv
	  ,[Anstalt (sökobjekt)] = d8c.organisaatio_sv
	  ,[Utbildningstyp (sökobjekt)] = d10.selite_sv
	  ,[Landskap (sökobjekt)] = d5.maakunta_SV
	  ,[Kommun (sökobjekt)] = d5.kunta_SV
	  ,[Utbildningsnivå (sökobjekt)] = d6.koulutusaste2002_SV
	  ,[Utbildningsområde (sökobjekt)] = d6.koulutusala2002_SV
	  ,[Studieområde (sökobjekt)] = d6.opintoala2002_SV
	  ,[Utb.nivå, nivå 1 (sökobjekt)] = d6.koulutusastetaso1_sv
	  ,[Utb.nivå, nivå 2 (sökobjekt)] = d6.koulutusastetaso2_sv
	  ,[Utb.område, nivå 1 (sökobjekt)] = d6.koulutusalataso1_sv
	  ,[Utb.område, nivå 2 (sökobjekt)] = d6.koulutusalataso2_sv
	  ,[Utb.område, nivå 3 (sökobjekt)] = d6.koulutusalataso3_sv
	  ,[Examen (sökobjekt)] = d6.koulutusluokitus_sv
	  ,[Ansökningönskemål] = null
	  ,[Åldersgrupp] = null
	  ,[Medborgarskap] = null
	  ,[Medborgarskap (världsdel)] = null
	  ,[Intresserad av läroavtalsutbildningen] = null
	  ,[Hemkommun (sökande)] = null
	  ,[Hemlandskap (sökande)] = null
	  ,[Begynnelseår] = f.koulutuksen_alkamisvuosi
	  ,[Begynnelsetermin] = d9.selite_sv
	  ,[Utbildningens språk] = d7.kieli_SV
	  ,[År då grundutbildning avslutades] = null
	  ,[Grundutbildning] = null
	  ,[Specialundervisningsgrund] = null
	  ,[Grundutbildningskrav] = d11.selite_sv
	  ,[Avslutningsklass] = null
	  ,[Kön] = null
	  ,[Modersmål] = null

--Englanti
	  ,[Date] = convert(varchar(10),f.[loadtime],104)
	  ,[Provider of prior education] = null
      ,[Institution of prior education] = null
      ,[Municipality of prior education] = null
	  ,[Region of prior education] = null
	  ,[Application] = d1.hakuryhma_en
	  ,[Applied study programme] = d3.selite_en
	  ,[Joint/separate application] = case when d1.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 'Separate application' when d1.hakutapa_fi='Yhteishaku' then 'Joint application' end --Application system
	  ,[Application round] = d1.hakutyyppi_EN
	  ,[Education provider (study programme)] = d8a.organisaatio_en
	  ,[Ed. institution (study programme)] = d8b.organisaatio_en
	  ,[Campus (study programme)] = d8c.organisaatio_en
	  ,[Type of education (study programme)] = d10.selite_en
	  ,[Region (study programme)] = d5.maakunta_EN
	  ,[Municipality (study programme)] = d5.kunta_EN
	  ,[Level of ed. (study programme)] = d6.koulutusaste2002_EN
	  ,[Field of ed. (study programme)] = d6.koulutusala2002_EN
	  ,[Subfield of ed. (study programme)] = d6.opintoala2002_EN
	  ,[Level of ed., tier 1] = d6.koulutusastetaso1_en
	  ,[Level of ed., tier 2] = d6.koulutusastetaso2_en
	  ,[Field of ed., tier 1] = d6.koulutusalataso1_en
	  ,[Field of ed., tier 2] = d6.koulutusalataso2_en
	  ,[Field of ed., tier 3] = d6.koulutusalataso3_en
	  ,[Degree (study programme)] = d6.koulutusluokitus_en
	  ,[Preference of study programme] = null
	  ,[Age group] = null
	  ,[Nationality] = null
	  ,[Nationality (continent)] = null
	  ,[Interested in apprenticeship training] = null
	  ,[Municipality of residence] = null
	  ,[Region of residence] = null 
	  ,[Year (start of studies)] = f.koulutuksen_alkamisvuosi
	  ,[Term (start of studies)] = d9.selite_en
	  ,[Language of education] = d7.kieli_EN
	  ,[Graduation year (comprehensive shcool)] = null
	  ,[Prior education] = null
	  ,[Special needs ed. background] = null
	  ,[Admission criteria] = d11.selite_en
	  ,[Last year of comprehensive school] = null
	  ,[Gender] = null
	  ,[Mother tongue] = null

	/* Koodimuuttujat */

	  ,[Koodit Hakukohde] = d3.oid
	  ,[Koodit Koulutuksen järjestäjä] = d8a.organisaatio_koodi
	  ,[Koodit Oppilaitos] = d8b.organisaatio_koodi
	  ,[Koodit Koulutusaste] = d6.koulutusaste2002_koodi
	  ,[Koodit Koulutusala] = d6.koulutusala2002_koodi
	  ,[Koodit Opintoala] = d6.opintoala2002_koodi
	  ,[Koodit Tutkinto] = d6.koulutusluokitus_koodi
	
	  ,[Hakijat3] = 0
	  ,[Ensisijaiset hakijat3] = 0
	  ,[Valitut3] = 0
	  ,[Paikan vastaanottaneet3] = 0
	  ,[Aloittaneet3] = 0

	  --Suomi
	  ,[Hakeutuminen] = null
	  ,[Valinta] = null
	  ,[Paikan vastaanotto] = null
	  --Ruotsi
	  ,[Sökning] = null
	  ,[Antagning] = null
	  ,[Mottagande] = null
	  --Englanti
	  ,[Applications] = null
	  ,[Selection] = null
	  ,[Acceptance] = null


	  ,[Erityisopetuspohja järjestys] = 999
	  ,[Haku järjestys] = d1.hakuryhma_koodi
	  ,[Hakutoive järjestys] = 99
      ,[Hakijan pohjakoulutuksen maakunta järjestys] = '99'
 	  ,[Hakukohteen koulutusaste 2002 järjestys] = d6.jarjestys_koulutusaste2002_koodi
 	  ,[Hakukohteen koulutusala 2002 järjestys] = d6.jarjestys_koulutusala2002_koodi
 	  ,[Hakukohteen opintoala 2002 järjestys] = d6.jarjestys_opintoala2002_koodi
	  ,[Hakukohteen koulutusaste 1 järjestys] = d6.jarjestys_koulutusastetaso1_koodi
	  ,[Hakukohteen koulutusaste 2 järjestys] = d6.jarjestys_koulutusastetaso2_koodi
	  ,[Hakukohteen koulutusala 1 järjestys] = d6.jarjestys_koulutusalataso1_koodi
	  ,[Hakukohteen koulutusala 2 järjestys] = d6.jarjestys_koulutusalataso2_koodi
	  ,[Hakukohteen koulutusala 3 järjestys] = d6.jarjestys_koulutusalataso3_koodi
 	  ,[Hakukohteen maakunta järjestys] = d5.jarjestys_maakunta_koodi
	  ,[Hakukohteen koulutustyyppi järjestys] = d10.jarjestys
	  ,[Hakukohteen toimipiste järjestys] = case when d8c.organisaatio_fi='Tieto puuttuu' then 'ööö' else left(d8c.organisaatio_fi,20) end
	  ,[Hakutyyppi järjestys] = d1.jarjestys_hakutyyppi
	  ,[Ikä 5v järjestys] = '999999'
	  ,[Kansalaisuus (maanosa) järjestys] = 'ööööö'
	  ,[Kansalaisuus järjestys] = 'ööö'
	  ,[Kotipaikan maakunta järjestys] = '999999'
	  ,[Kotipaikan kunta järjestys] = 'ööö'
	  ,[Kotipaikan AVI järjestys] = NULL
	  ,[Kotipaikan ELY järjestys] = NULL
	  ,[Kotipaikan suuralue (OKM) järjestys] = NULL--'999999'
	  ,[Koulutuksen kieli järjestys] = d7.kieli_koodi
	  ,[Pohjakoulutus järjestys] = 'ööö'
	  ,[Pohjakoulutuksen suuralue (OKM) järjestys] = NULL--'999999'
	  ,[Pohjakoulutuksen maakunta järjestys] = '999999'
	  ,[Pohjakoulutuksen kunta järjestys] = '999999'
	  ,[Pohjakoulutuksen järjestäjä järjestys] = 'ööö'
	  ,[Pohjakoulutuksen oppilaitos järjestys] = 'ööö'
	  ,[Pohjakoulutusvaatimus järjestys] = '99'
	  ,[Pohjakoulutuksen päättövuosi järjestys] = '9999'
	  ,[Päättöluokka järjestys] = '999'
	  ,[Sukupuoli järjestys] = 999999
	  ,[Äidinkieli versio1 järjestys] = 999999
	  ,[Hakeutuminen järjestys] = 99
	  ,[Valinta järjestys] = 99
	  ,[Vastaanotto järjestys] = 99


FROM dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat f
	  LEFT JOIN dw.d_haku d1 on d1.id=f.d_haku_id
	  LEFT JOIN dw.d_kausi d9 on d9.id=f.d_kausi_koulutuksen_alkamiskausi_id
	  INNER JOIN sa.sa_haku_ja_valinta_vuosikello_toinen_aste d4 on d4.haku_oid=d1.haku_oid and d4.haku_oid is not null and f.loadtime >= d4.hakijat	
	  LEFT JOIN dw.d_hakukohde d3 on d3.id=f.d_hakukohde_id
	  LEFT JOIN dw.d_kytkin d3b ON d3b.kytkin_koodi = d3.kaksoistutkinto
	  --LEFT JOIN d_hakutyyppi d4 on d4.id=f.hakutyyppi_id
	  LEFT JOIN dw.d_alueluokitus d5 on d5.id=f.d_alueluokitus_hakukohde_id
	  LEFT JOIN dw.d_koulutusluokitus d6 on d6.id=f.d_koulutusluokitus_hakukohde_id
	  --LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d6 on d6.koulutusluokitus_avain=d6b.koulutus_koodi
	  LEFT JOIN dw.d_kieli d7 on d7.id=f.d_kieli_koulutus_id
	  LEFT JOIN dw.d_organisaatioluokitus d8a on d8a.id=d_organisaatio_koulutuksen_jarjestaja_id
	  LEFT JOIN dw.d_organisaatioluokitus d8b on d8b.id=d_organisaatio_oppilaitos_id
	  LEFT JOIN dw.d_organisaatioluokitus d8c on d8c.id=d_organisaatio_toimipiste_id
	  LEFT JOIN dw.d_koulutustyyppi d10 on d10.id=f.d_koulutustyyppi_id
	  LEFT JOIN dw.d_pohjakoulutusvaatimus d11 on d11.id=f.d_pohjakoulutusvaatimus_id
	  --LEFT JOIN OPHV_SA.dbo.organisaatioluokitus d34 on d34.organisaatio_oid=d8.Oid
	  --LEFT JOIN dw.d_alueluokitus d35 on d35.alueluokitus_avain=d34.kunta_koodi
WHERE d1.korkeakouluhaku=0 and f.koulutuksen_alkamisvuosi>2013
	
