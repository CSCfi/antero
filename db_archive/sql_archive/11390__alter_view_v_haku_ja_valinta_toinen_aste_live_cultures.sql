USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_toinen_aste_live_cultures]    Script Date: 17.11.2025 13.01.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_haku_ja_valinta_toinen_aste_live_cultures] AS

SELECT --top 10

--Suomi
	 [pohjakoulutuksen_jarjestaja_fi] = d30a.organisaatio_fi
	,[pohjakoulutuksen_oppilaitos_fi] = d30b.organisaatio_fi
	,[pohjakoulutuksen_oppilaitostyyppi_fi] = d30b.oppilaitostyyppi_fi
	,[pohjakoulutuksen_oppilaitoksen_opetuskieli_fi] = d30b.oppilaitoksenopetuskieli_fi
	,[pohjakoulutuksen_kunta_fi] = d29.kunta_fi
	,[pohjakoulutuksen_maakunta_fi] = d29.maakunta_fi
	,[haku_fi] = d25.hakuryhma_fi
	,[haun_nimi_fi] = d25.haun_nimi_fi
	,[hakukohde_fi] = d10.selite_fi
	,[hakutapa_fi] = d25.hakutapa_fi
	,[hakutyyppi_fi] = d25.hakutyyppi_fi
	,[koulutuksen_jarjestaja_hakukohde_fi] = d16a.organisaatio_fi
	,[oppilaitos_hakukohde_fi] = d16b.organisaatio_fi
	,[toimipiste_hakukohde_fi] = d16c.organisaatio_fi
	,[koulutustyyppi_hakukohde_fi] = d18.selite_fi
	,[maakunta_hakukohde_fi] = d19.maakunta_fi
	,[kunta_hakukohde_fi] = d19.kunta_fi
	,koulutusaste_taso_1_hakukohde_fi = d20.koulutusastetaso1_fi
	,koulutusaste_taso_2_hakukohde_fi = d20.koulutusastetaso2_fi
	,[koulutusala_taso_1_hakukohde_fi] = d20.koulutusalataso1_fi
	,[koulutusala_taso_2_hakukohde_fi] = d20.koulutusalataso2_fi
	,[koulutusala_taso_3_hakukohde_fi] = d20.koulutusalataso3_fi
	,[tutkinto_hakukohde_fi] = d20.koulutusluokitus_fi
	,[hakutoive_fi] = f.hakutoive
	,[ikaryhma_fi] = d26.ikaryhma1_fi
	,[kansalaisuus_fi] = d33.maatjavaltiot2_fi
	,[kansalaisuus_maanosa_fi] = d33.maanosa0_fi
	,[kotipaikkakunta_hakija_fi] = d6.kunta_fi
	,[kotipaikan_maakunta_hakija_fi] = d6.maakunta_fi
	,[koulutuksen_alkamisvuosi_fi] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi_fi] = d2.selite_fi
	,[koulutuksen_kieli_fi] = d27.kieli_fi
	,[pohjakoulutuksen_paattovuosi_fi] = case when f.pohjakoulutuksen_paattovuosi is null or f.pohjakoulutuksen_paattovuosi='0' then 'Tieto puuttuu' else cast(f.pohjakoulutuksen_paattovuosi as varchar(4)) end 
	,[pohjakoulutus_fi] = d22.pohjakoulutus2_fi
	,[erityisopetuspohja_fi] = d22.erityisopetuspohja_fi
	,[pohjakoulutusvaatimus_fi] = d5.selite_fi
	,[paattoluokka_fi] = case when f.paattoluokka in ('9','10') then f.paattoluokka else 'Muu' end
	,[sukupuoli_fi] = d7.sukupuoli_fi
	,[aidinkieli_fi] = d8.kieliryhma1_fi
	,[vaativa_erityinen_tuki_fi] = d12.kytkin_fi

--Ruotsi
	,[pohjakoulutuksen_jarjestaja_sv] = d30a.organisaatio_sv
	,[pohjakoulutuksen_oppilaitos_sv] = d30b.organisaatio_sv
	,[pohjakoulutuksen_oppilaitostyyppi_sv] = d30b.oppilaitostyyppi_sv
	,[pohjakoulutuksen_oppilaitoksen_opetuskieli_sv] = d30b.oppilaitoksenopetuskieli_sv
	,[pohjakoulutuksen_kunta_sv] = d29.kunta_sv
	,[pohjakoulutuksen_maakunta_sv] = d29.maakunta_sv
	,[haku_sv] = d25.hakuryhma_sv
	,[haun_nimi_sv] = d25.haun_nimi_sv
	,[hakukohde_sv] = d10.selite_sv
	,[hakutapa_sv] = d25.hakutapa_sv
	,[hakutyyppi_sv] = d25.hakutyyppi_sv
	,[koulutuksen_jarjestaja_hakukohde_sv] = d16a.organisaatio_sv
	,[oppilaitos_hakukohde_sv] = d16b.organisaatio_sv
	,[toimipiste_hakukohde_sv] = d16c.organisaatio_sv
	,[koulutustyyppi_hakukohde_sv] = d18.selite_sv
	,[maakunta_hakukohde_sv] = d19.maakunta_sv
	,[kunta_hakukohde_sv] = d19.kunta_sv
	,koulutusaste_taso_1_hakukohde_sv = d20.koulutusastetaso1_sv
	,koulutusaste_taso_2_hakukohde_sv = d20.koulutusastetaso2_sv
	,[koulutusala_taso_1_hakukohde_sv] = d20.koulutusalataso1_sv
	,[koulutusala_taso_2_hakukohde_sv] = d20.koulutusalataso2_sv
	,[koulutusala_taso_3_hakukohde_sv] = d20.koulutusalataso3_sv
	,[tutkinto_hakukohde_sv] = d20.koulutusluokitus_sv
	,[hakutoive_sv] = f.hakutoive
	,[ikaryhma_sv] = d26.ikaryhma1_sv
	,[kansalaisuus_sv] = d33.maatjavaltiot2_sv
	,[kansalaisuus_maanosa_sv] = d33.maanosa0_sv
	,[kotipaikkakunta_hakija_sv] = d6.kunta_sv
	,[kotipaikan_maakunta_hakija_sv] = d6.maakunta_sv
	,[koulutuksen_alkamisvuosi_sv] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi_sv] = d2.selite_sv
	,[koulutuksen_kieli_sv] = d27.kieli_sv
	,[pohjakoulutuksen_paattovuosi_sv] = case when f.pohjakoulutuksen_paattovuosi is null or f.pohjakoulutuksen_paattovuosi='0' then 'Information saknas' else cast(f.pohjakoulutuksen_paattovuosi as char(4)) end 
	,[pohjakoulutus_sv] = d22.pohjakoulutus2_sv
	,[erityisopetuspohja_sv] = d22.erityisopetuspohja_sv
	,[pohjakoulutusvaatimus_sv] = d5.selite_sv
	,[paattoluokka_sv] = case when f.paattoluokka in ('9','10') then f.paattoluokka else 'Annat' end
	,[sukupuoli_sv] = d7.sukupuoli_sv
	,[aidinkieli_sv] = d8.kieliryhma1_sv  
	,[vaativa_erityinen_tuki_sv] = d12.kytkin_sv

--Englanti
	,[pohjakoulutuksen_jarjestaja_en] = d30a.organisaatio_en
	,[pohjakoulutuksen_oppilaitos_en] = d30b.organisaatio_en
	,[pohjakoulutuksen_oppilaitostyyppi_en] = d30b.oppilaitostyyppi_en
	,[pohjakoulutuksen_oppilaitoksen_opetuskieli_en] = d30b.oppilaitoksenopetuskieli_en
	,[pohjakoulutuksen_kunta_en] = d29.kunta_en
	,[pohjakoulutuksen_maakunta_en] = d29.maakunta_en
	,[haku_en] = d25.hakuryhma_en
	,[haun_nimi_en] = d25.haun_nimi_en
	,[hakukohde_en] = d10.selite_en
	,[hakutapa_en] = d25.hakutapa_en
	,[hakutyyppi_en] = d25.hakutyyppi_en
	,[koulutuksen_jarjestaja_hakukohde_en] = d16a.organisaatio_en
	,[oppilaitos_hakukohde_en] = d16b.organisaatio_en
	,[toimipiste_hakukohde_en] = d16c.organisaatio_en
	,[koulutustyyppi_hakukohde_en] = d18.selite_en
	,[maakunta_hakukohde_en] = d19.maakunta_en
	,[kunta_hakukohde_en] = d19.kunta_en
	,koulutusaste_taso_1_hakukohde_en = d20.koulutusastetaso1_en
	,koulutusaste_taso_2_hakukohde_en = d20.koulutusastetaso2_en
	,[koulutusala_taso_1_hakukohde_en] = d20.koulutusalataso1_en
	,[koulutusala_taso_2_hakukohde_en] = d20.koulutusalataso2_en
	,[koulutusala_taso_3_hakukohde_en] = d20.koulutusalataso3_en
	,[tutkinto_hakukohde_en] = d20.koulutusluokitus_en
	,[hakutoive_en] = f.hakutoive
	,[ikaryhma_en] = d26.ikaryhma1_en
	,[kansalaisuus_en] = d33.maatjavaltiot2_en
	,[kansalaisuus_maanosa_en] = d33.maanosa0_en
	,[kotipaikkakunta_hakija_en] = d6.kunta_en
	,[kotipaikan_maakunta_hakija_en] = d6.maakunta_en
	,[koulutuksen_alkamisvuosi_en] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi_en] = d2.selite_en
	,[koulutuksen_kieli_en] = d27.kieli_en
	,[pohjakoulutuksen_paattovuosi_en] = case when f.pohjakoulutuksen_paattovuosi is null or f.pohjakoulutuksen_paattovuosi='0' then 'Missing data' else cast(f.pohjakoulutuksen_paattovuosi as char(4)) end 
	,[pohjakoulutus_en] = d22.pohjakoulutus2_en
	,[erityisopetuspohja_en] = d22.erityisopetuspohja_en
	,[pohjakoulutusvaatimus_en] = d5.selite_en
	,[paattoluokka_en] = case when f.paattoluokka in ('9','10') then f.paattoluokka else 'Other' end
	,[sukupuoli_en] = d7.sukupuoli_en
	,[aidinkieli_en] = d8.kieliryhma1_en  
	,[vaativa_erityinen_tuki_en] = d12.kytkin_en
	
/* Koodit */
	,[koodit_hakukohde] = d10.oid
	,[koodit_koulutuksen_jarjestaja] = d16a.organisaatio_koodi
	,[koodit_oppilaitos] = d16b.organisaatio_koodi
	,[koodit_tutkinto] = d20.koulutusluokitus_koodi

/* Mittarit */

	,[apusarake_lukumäärä] = 1
	,[apusarake_Henkilö OID] = henkilo_oid
	,[apusarake_Aloituspaikat2] = NULL
	,[apusarake_Ensisijaiset hakijat3] = case when f.hakutoive=1 then 1 else 0 end
	,[apusarake_Valitut3] = case when f.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1 else 0 end
	,[apusarake_Paikan vastaanottaneet3] = case when f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0	end		
	,[apusarake_Aloittaneet3] = case when f.ilmoittautumisen_tila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end
	,[apusarake_pisteraja] = NULL

/* Jarjestykset */
	,[jarjestys_pohjakoulutuksen_oppilaitoksen_opetuskieli] = d30b.jarjestys_oppilaitoksenopetuskieli_koodi
	,[jarjestys_pohjakoulutuksen_oppilaitostyyppi] = d30b.jarjestys_oppilaitostyyppi_koodi
	,[jarjestys_pohjakoulutuksen_maakunta] = d29.jarjestys_maakunta_koodi
	,[jarjestys_haku] = d25.hakuryhma_koodi
	,[jarjestys_hakutapa] = d25.jarjestys_hakutapa
	,[jarjestys_hakutyyppi] = d25.jarjestys_hakutyyppi
	,[jarjestys_koulutustyyppi_hakukohde] = d18.jarjestys
	,[jarjestys_maakunta_hakukohde] = d19.jarjestys_maakunta_koodi
	,jarjestys_koulutusaste_taso_1_hakukohde = d20.jarjestys_koulutusastetaso1_koodi
	,jarjestys_koulutusaste_taso_2_hakukohde = d20.jarjestys_koulutusastetaso2_koodi
	,[jarjestys_koulutusala_taso_1_hakukohde] = d20.jarjestys_koulutusalataso1_koodi
	,[jarjestys_koulutusala_taso_2_hakukohde] = d20.jarjestys_koulutusalataso2_koodi
	,[jarjestys_koulutusala_taso_3_hakukohde] = d20.jarjestys_koulutusalataso3_koodi
	,[jarjestys_hakutoive] = f.hakutoive
	,[jarjestys_ikaryhma] = d26.jarjestys_ikaryhma1
	,[jarjestys_kansalaisuus] = d33.jarjestys_maatjavaltiot2_koodi
	,[jarjestys_kansalaisuus_maanosa] = d33.jarjestys_maanosa0_koodi
	,[jarjestys_kotipaikan_maakunta_hakija] = d6.jarjestys_maakunta_koodi
	,[jarjestys_koulutuksen_alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[jarjestys_koulutuksen_alkamiskausi] = d2.jarjestys3
	,[jarjestys_koulutuksen_kieli] = d27.jarjestys_kieliryhma1
	,[jarjestys_pohjakoulutuksen_paattovuosi] = case when f.pohjakoulutuksen_paattovuosi in ('Tieto puuttuu','0') then '9999' else 2050-f.pohjakoulutuksen_paattovuosi end
	,[jarjestys_pohjakoulutus] = d22.jarjestys_pohjakoulutus2
	,[jarjestys_erityisopetuspohja] = d22.jarjestys_erityisopetuspohja
	,[jarjestys_pohjakoulutusvaatimus] = d5.jarjestys
	,[jarjestys_paattoluokka] = case when f.paattoluokka in ('9','10') then f.paattoluokka else '998' end
	,[jarjestys_sukupuoli] = d7.jarjestys_sukupuoli_koodi
	,[jarjestys_aidinkieli] = d8.jarjestys_kieliryhma1
	,[jarjestys_vaativa_erityinen_tuki] = d12.jarjestys_kytkin_koodi
   
FROM dw.f_haku_ja_valinta_hakeneet_toinen_aste f
LEFT JOIN dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN dw.d_kytkin d3 ON d3.id=f.d_kytkin_kiinnostunut_oppisopimuksesta_id
LEFT JOIN dw.d_pohjakoulutusvaatimus d5 ON d5.id = f.d_pohjakoulutusvaatimus_id
LEFT JOIN dw.d_alueluokitus d6 ON d6.id = f.d_alueluokitus_kotipaikka_id
LEFT JOIN dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d8 ON d8.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN dw.d_kytkin d12 ON d12.id = f.d_kytkin_ammatillinen_perustutkinto_erityisopetuksena_id
LEFT JOIN dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatio_koulutuksen_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatio_toimipiste_id
LEFT JOIN dw.d_koulutustyyppi d18 ON d18.id = f.d_koulutustyyppi_id
LEFT JOIN dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
LEFT JOIN dw.d_pohjakoulutus d22 ON d22.id = f.d_pohjakoulutus_id
LEFT JOIN dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN dw.d_ika d26 ON d26.id=f.d_ika_id
LEFT JOIN dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id
LEFT JOIN dw.d_alueluokitus d29 ON d29.id = f.d_alueluokitus_lahtokoulun_kunta_id
LEFT JOIN dw.d_organisaatioluokitus d30a ON d30a.id = f.d_organisaatio_lahtokoulu_koulutuksen_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d30b ON d30b.id = f.d_organisaatio_lahtokoulu_oppilaitos_id
LEFT JOIN dw.d_maatjavaltiot2 d33 on d33.id=f.d_maatjavaltiot_kansalaisuus_id

WHERE f.koulutuksen_alkamisvuosi > 2013
and d25.korkeakouluhaku=0
and d25.hakutapa_koodi in ('01','03')


UNION ALL


SELECT 

--Suomi
	 [pohjakoulutuksen_jarjestaja_fi] = d30a.organisaatio_fi
	,[pohjakoulutuksen_oppilaitos_fi] = d30b.organisaatio_fi
	,[pohjakoulutuksen_oppilaitostyyppi_fi] = d30b.oppilaitostyyppi_fi
	,[pohjakoulutuksen_oppilaitoksen_opetuskieli_fi] = d30b.oppilaitoksenopetuskieli_fi
	,[pohjakoulutuksen_kunta_fi] = d29.kunta_fi
	,[pohjakoulutuksen_maakunta_fi] = d29.maakunta_fi
	,[haku_fi] = d25.hakuryhma_fi
	,[haun_nimi_fi] = d25.haun_nimi_fi
	,[hakukohde_fi] = d10.selite_fi
	,[hakutapa_fi] = d25.hakutapa_fi
	,[hakutyyppi_fi] = d25.hakutyyppi_fi
	,[koulutuksen_jarjestaja_hakukohde_fi] = d16a.organisaatio_fi
	,[oppilaitos_hakukohde_fi] = d16b.organisaatio_fi
	,[toimipiste_hakukohde_fi] = d16c.organisaatio_fi
	,[koulutustyyppi_hakukohde_fi] = d18.selite_fi
	,[maakunta_hakukohde_fi] = d19.maakunta_fi
	,[kunta_hakukohde_fi] = d19.kunta_fi
	,koulutusaste_taso_1_hakukohde_fi = d20.koulutusastetaso1_fi
	,koulutusaste_taso_2_hakukohde_fi = d20.koulutusastetaso2_fi
	,[koulutusala_taso_1_hakukohde_fi] = d20.koulutusalataso1_fi
	,[koulutusala_taso_2_hakukohde_fi] = d20.koulutusalataso2_fi
	,[koulutusala_taso_3_hakukohde_fi] = d20.koulutusalataso3_fi
	,[tutkinto_hakukohde_fi] = d20.koulutusluokitus_fi
	,[hakutoive_fi] = NULL
	,[ikaryhma_fi] = d26.ikaryhma1_fi
	,[kansalaisuus_fi] = d33.maatjavaltiot2_fi
	,[kansalaisuus_maanosa_fi] = d33.maanosa0_fi
	,[kotipaikkakunta_hakija_fi] = d6.kunta_fi
	,[kotipaikan_maakunta_hakija_fi] = d6.maakunta_fi
	,[koulutuksen_alkamisvuosi_fi] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi_fi] = d2.selite_fi
	,[koulutuksen_kieli_fi] = d27.kieli_fi
	,[pohjakoulutuksen_paattovuosi_fi] = NULL
	,[pohjakoulutus_fi] = d22.pohjakoulutus2_fi
	,[erityisopetuspohja_fi] = d22.erityisopetuspohja_fi
	,[pohjakoulutusvaatimus_fi] = d5.selite_fi
	,[paattoluokka_fi] = NULL
	,[sukupuoli_fi] = d7.sukupuoli_fi
	,[aidinkieli_fi] = d8.kieliryhma1_fi
	,[vaativa_erityinen_tuki_fi] = d12.kytkin_fi

--Ruotsi
	,[pohjakoulutuksen_jarjestaja_sv] = d30a.organisaatio_sv
	,[pohjakoulutuksen_oppilaitos_sv] = d30b.organisaatio_sv
	,[pohjakoulutuksen_oppilaitostyyppi_sv] = d30b.oppilaitostyyppi_sv
	,[pohjakoulutuksen_oppilaitoksen_opetuskieli_sv] = d30b.oppilaitoksenopetuskieli_sv
	,[pohjakoulutuksen_kunta_sv] = d29.kunta_sv
	,[pohjakoulutuksen_maakunta_sv] = d29.maakunta_sv
	,[haku_sv] = d25.hakuryhma_sv
	,[haun_nimi_sv] = d25.haun_nimi_sv
	,[hakukohde_sv] = d10.selite_sv
	,[hakutapa_sv] = d25.hakutapa_sv
	,[hakutyyppi_sv] = d25.hakutyyppi_sv
	,[koulutuksen_jarjestaja_hakukohde_sv] = d16a.organisaatio_sv
	,[oppilaitos_hakukohde_sv] = d16b.organisaatio_sv
	,[toimipiste_hakukohde_sv] = d16c.organisaatio_sv
	,[koulutustyyppi_hakukohde_sv] = d18.selite_sv
	,[maakunta_hakukohde_sv] = d19.maakunta_sv
	,[kunta_hakukohde_sv] = d19.kunta_sv
	,koulutusaste_taso_1_hakukohde_sv = d20.koulutusastetaso1_sv
	,koulutusaste_taso_2_hakukohde_sv = d20.koulutusastetaso2_sv
	,[koulutusala_taso_1_hakukohde_sv] = d20.koulutusalataso1_sv
	,[koulutusala_taso_2_hakukohde_sv] = d20.koulutusalataso2_sv
	,[koulutusala_taso_3_hakukohde_sv] = d20.koulutusalataso3_sv
	,[tutkinto_hakukohde_sv] = d20.koulutusluokitus_sv
	,[hakutoive_sv] = NULL
	,[ikaryhma_sv] = d26.ikaryhma1_sv
	,[kansalaisuus_sv] = d33.maatjavaltiot2_sv
	,[kansalaisuus_maanosa_sv] = d33.maanosa0_sv
	,[kotipaikkakunta_hakija_sv] = d6.kunta_sv
	,[kotipaikan_maakunta_hakija_sv] = d6.maakunta_sv
	,[koulutuksen_alkamisvuosi_sv] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi_sv] = d2.selite_sv
	,[koulutuksen_kieli_sv] = d27.kieli_sv
	,[pohjakoulutuksen_paattovuosi_sv] = NULL
	,[pohjakoulutus_sv] = d22.pohjakoulutus2_sv
	,[erityisopetuspohja_sv] = d22.erityisopetuspohja_sv
	,[pohjakoulutusvaatimus_sv] = d5.selite_sv
	,[paattoluokka_sv] = NULL
	,[sukupuoli_sv] = d7.sukupuoli_sv
	,[aidinkieli_sv] = d8.kieliryhma1_sv  
	,[vaativa_erityinen_tuki_sv] = d12.kytkin_sv

--Englanti
	,[pohjakoulutuksen_jarjestaja_en] = d30a.organisaatio_en
	,[pohjakoulutuksen_oppilaitos_en] = d30b.organisaatio_en
	,[pohjakoulutuksen_oppilaitostyyppi_en] = d30b.oppilaitostyyppi_en
	,[pohjakoulutuksen_oppilaitoksen_opetuskieli_en] = d30b.oppilaitoksenopetuskieli_en
	,[pohjakoulutuksen_kunta_en] = d29.kunta_en
	,[pohjakoulutuksen_maakunta_en] = d29.maakunta_en
	,[haku_en] = d25.hakuryhma_en
	,[haun_nimi_en] = d25.haun_nimi_en
	,[hakukohde_en] = d10.selite_en
	,[hakutapa_en] = d25.hakutapa_en
	,[hakutyyppi_en] = d25.hakutyyppi_en
	,[koulutuksen_jarjestaja_hakukohde_en] = d16a.organisaatio_en
	,[oppilaitos_hakukohde_en] = d16b.organisaatio_en
	,[toimipiste_hakukohde_en] = d16c.organisaatio_en
	,[koulutustyyppi_hakukohde_en] = d18.selite_en
	,[maakunta_hakukohde_en] = d19.maakunta_en
	,[kunta_hakukohde_en] = d19.kunta_en
	,koulutusaste_taso_1_hakukohde_en = d20.koulutusastetaso1_en
	,koulutusaste_taso_2_hakukohde_en = d20.koulutusastetaso2_en
	,[koulutusala_taso_1_hakukohde_en] = d20.koulutusalataso1_en
	,[koulutusala_taso_2_hakukohde_en] = d20.koulutusalataso2_en
	,[koulutusala_taso_3_hakukohde_en] = d20.koulutusalataso3_en
	,[tutkinto_hakukohde_en] = d20.koulutusluokitus_en
	,[hakutoive_en] = NULL
	,[ikaryhma_en] = d26.ikaryhma1_en
	,[kansalaisuus_en] = d33.maatjavaltiot2_en
	,[kansalaisuus_maanosa_en] = d33.maanosa0_en
	,[kotipaikkakunta_hakija_en] = d6.kunta_en
	,[kotipaikan_maakunta_hakija_en] = d6.maakunta_en
	,[koulutuksen_alkamisvuosi_en] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi_en] = d2.selite_en
	,[koulutuksen_kieli_en] = d27.kieli_en
	,[pohjakoulutuksen_paattovuosi_en] = NULL
	,[pohjakoulutus_en] = d22.pohjakoulutus2_en
	,[erityisopetuspohja_en] = d22.erityisopetuspohja_en
	,[pohjakoulutusvaatimus_en] = d5.selite_en
	,[paattoluokka_en] = NULL
	,[sukupuoli_en] = d7.sukupuoli_en
	,[aidinkieli_en] = d8.kieliryhma1_en  
	,[vaativa_erityinen_tuki_en] = d12.kytkin_en
	
/* Koodit */
	,[koodit_hakukohde] = d10.oid
	,[koodit_koulutuksen_jarjestaja] = d16a.organisaatio_koodi
	,[koodit_oppilaitos] = d16b.organisaatio_koodi
	,[koodit_tutkinto] = d20.koulutusluokitus_koodi

/* Mittarit */
	,lukumaara = 0
	,[Henkilö OID] = NULL
	,[apusarake_Aloituspaikat2] = f.aloituspaikat
	,[apusarake_Ensisijaiset hakijat3] = 0
	,[apusarake_Valitut3] = 0
	,[apusarake_Paikan vastaanottaneet3] = 0
	,[apusarake_Aloittaneet3] = 0
	,[apusarake_pisteraja] = f.alin_laskettuvalintapistemaara

/* Jarjestykset */
	,[jarjestys_pohjakoulutuksen_oppilaitoksen_opetuskieli] = d30b.jarjestys_oppilaitoksenopetuskieli_koodi
	,[jarjestys_pohjakoulutuksen_oppilaitostyyppi] = d30b.jarjestys_oppilaitostyyppi_koodi
	,[jarjestys_pohjakoulutuksen_maakunta] = d29.jarjestys_maakunta_koodi
	,[jarjestys_haku] = d25.hakuryhma_koodi
	,[jarjestys_hakutapa] = d25.jarjestys_hakutapa
	,[jarjestys_hakutyyppi] = d25.jarjestys_hakutyyppi
	,[jarjestys_koulutustyyppi_hakukohde] = d18.jarjestys
	,[jarjestys_maakunta_hakukohde] = d19.jarjestys_maakunta_koodi
	,jarjestys_koulutusaste_taso_1_hakukohde = d20.jarjestys_koulutusastetaso1_koodi
	,jarjestys_koulutusaste_taso_2_hakukohde = d20.jarjestys_koulutusastetaso2_koodi
	,[jarjestys_koulutusala_taso_1_hakukohde] = d20.jarjestys_koulutusalataso1_koodi
	,[jarjestys_koulutusala_taso_2_hakukohde] = d20.jarjestys_koulutusalataso2_koodi
	,[jarjestys_koulutusala_taso_3_hakukohde] = d20.jarjestys_koulutusalataso3_koodi
	,[jarjestys_hakutoive] = '9'
	,[jarjestys_ikaryhma] = d26.jarjestys_ikaryhma1
	,[jarjestys_kansalaisuus] = d33.jarjestys_maatjavaltiot2_koodi
	,[jarjestys_kansalaisuus_maanosa] = d33.jarjestys_maanosa0_koodi
	,[jarjestys_kotipaikan_maakunta_hakija] = d6.jarjestys_maakunta_koodi
	,[jarjestys_koulutuksen_alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[jarjestys_koulutuksen_alkamiskausi] = d2.jarjestys3
	,[jarjestys_koulutuksen_kieli] = d27.jarjestys_kieliryhma1
	,[jarjestys_pohjakoulutuksen_paattovuosi] = '999999'
	,[jarjestys_pohjakoulutus] = d22.jarjestys_pohjakoulutus2
	,[jarjestys_erityisopetuspohja] = d22.jarjestys_erityisopetuspohja
	,[jarjestys_pohjakoulutusvaatimus] = d5.jarjestys
	,[jarjestys_paattoluokka] = '999'
	,[jarjestys_sukupuoli] = d7.jarjestys_sukupuoli_koodi
	,[jarjestys_aidinkieli] = d8.jarjestys_kieliryhma1
	,[jarjestys_vaativa_erityinen_tuki] = d12.jarjestys_kytkin_koodi
   
FROM dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat f
LEFT JOIN dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN dw.d_kytkin d3 ON d3.id='-1'
LEFT JOIN dw.d_pohjakoulutusvaatimus d5 ON d5.id = f.d_pohjakoulutusvaatimus_id
LEFT JOIN dw.d_alueluokitus d6 ON d6.id = '-1'
LEFT JOIN dw.d_sukupuoli d7 ON d7.id = '-1'
LEFT JOIN dw.d_kieli d8 ON d8.id = '-1'
LEFT JOIN dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN dw.d_kytkin d12 ON d12.id = f.d_kytkin_ammatillinen_perustutkinto_erityisopetuksena_id
LEFT JOIN dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatio_koulutuksen_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatio_toimipiste_id
LEFT JOIN dw.d_koulutustyyppi d18 ON d18.id = f.d_koulutustyyppi_id
LEFT JOIN dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
LEFT JOIN dw.d_pohjakoulutus d22 ON d22.id = '-1'
LEFT JOIN dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN dw.d_ika d26 ON d26.id='-1'
LEFT JOIN dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id
LEFT JOIN dw.d_alueluokitus d29 ON d29.id = '-1'
LEFT JOIN dw.d_organisaatioluokitus d30a ON d30a.id = '-1'
LEFT JOIN dw.d_organisaatioluokitus d30b ON d30b.id = '-1'
LEFT JOIN dw.d_maatjavaltiot2 d33 on d33.id = '-1'

WHERE f.koulutuksen_alkamisvuosi > 2013
and d25.korkeakouluhaku=0
and d25.hakutapa_koodi in ('01','03')


GO

