USE [ANTERO]
GO

/****** Object:  View [dw].[v_ovara_haku_ja_valinta_kk_live_cultures]    Script Date: 5.2.2026 8.42.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW [dw].[v_haku_ja_valinta_kk_live_cultures] AS

SELECT 
	   
	--FI
	[koulutuksen_alkamisvuosi_fi] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi_fi] = d2.selite_fi

	,[sukupuoli_fi] = d7.sukupuoli_fi
	,[ika_fi] = d9.ika_fi
	,[ikaryhma_fi] = d9.ikaryhma2_fi
	,[aidinkieli_fi] = d8.kieliryhma1_fi
	,[kansalaisuus_fi] = d30.maatjavaltiot2_fi
	,[kansalaisuus_maanosa_fi] = d30.maanosa5_fi
	,[kansalaisuus_ryhma_fi] = d30.maanosa6_fi
	,[kotipaikkakunta_hakija_fi] = d6.kunta_fi
	,[kotipaikan_maakunta_hakija_fi] = d6.maakunta_fi
	,[ensikertaisena_kohdeltava_hakija_fi] = CASE f.ensikertalainen WHEN 0 THEN 'Ei ensikertainen hakija ' WHEN 1 THEN 'Ensikertainen hakija' ELSE 'Tieto puuttuu' END
	,[ensikertainen_hakija_fi] = d18.kytkin_fi
	,[ensikertaisuuden_lahde_fi] = CASE WHEN f.ensikertaisuuden_lahde = 1 THEN 'ODW' WHEN f.ensikertaisuuden_lahde = 2 THEN 'Ovara' WHEN f.ensikertaisuuden_lahde = 3 THEN 'Virta-OTP' END
	,[haku_AMK_YO_fi] = d46.selite_fi
	,[pohjakoulutus_ulkomailla_fi] = d4.kytkin_fi
	,[pohjakoulutuksen_maa_priorisoitu_fi] = 
		case 
			when f.pohjakoulutus_suomessa_priorisoitu = 1 then ' Suomi' 
			when f.pohjakoulutus_suomessa_priorisoitu = 0 then ' Ulkomaat' 
			else 'Tieto puuttuu'
		end
	,[kansainvalinen_opiskelija_fi] = d50.kytkin_fi
	,[pohjakoulutus_fi] = d22.selite_fi 
	,[hakijan_ilmoittaman_pohjakoulutuksen_suoritusvuosi_fi] = f.toisen_asteen_koulutuksen_suoritusvuosi
	,[toisen_asteen_koulutuksen_suoritusvuosi_fi] = f.toisen_asteen_koulutuksen_suoritusvuosi
	,[ylioppilastutkinnon_suoritusvuosi_fi] = d49.vuosi

	,[haku_fi] = d25.haun_nimi_fi
	,[hakuaika_fi] = coalesce(d25.hakuaika_fi ,'Tieto puuttuu')
	,[hakukohde_fi] = d10.selite_fi
	,[haun_kohdejoukon_tarkenne_fi] = d25.kohdejoukontarkenne_fi
	,[hakutapa_fi] = d25.hakutapa2_fi
	,[hakutyyppi_fi] = d25.hakutyyppi_fi
	,[maakunta_hakukohde_fi] = d19.maakunta_fi
	,[kunta_hakukohde_fi] = d19.kunta_fi
	,[hakutoive_fi] = f.hakutoive
	,[valintatapajono_fi] = d47.selite_fi
	,[valintatapajonon_tyyppi_fi] = d48.selite_fi

	,[koulutusaste_taso_1_fi] = d20.koulutusastetaso1_fi
	,[koulutusaste_taso_2_fi] = d20.koulutusastetaso2_fi
	,[koulutusala_taso_1_fi] = d20.koulutusalataso1_fi
	,[koulutusala_taso_2_fi] = d20.koulutusalataso2_fi
	,[koulutusala_taso_3_fi] = d20.koulutusalataso3_fi
	,[paaasiallinen_tutkinto_hakukohde_fi] = d20.koulutusluokitus_fi
	,[okm_ohjauksen_ala_fi] = d20.okmohjauksenala_fi
	,[koulutuksen_kieli_fi] = d27.selite_fi
	,[opiskelun_laajuus_fi] = f.laajuus
	,[sektori_fi] = d20.koulutussektori_fi 
	,[tutkinnon_taso_fi] = d45.selite_fi
	,[tutkinnon_aloitussykli_fi] = d44.selite_fi  
	 
	,[korkeakoulu_fi] = d16b.organisaatio_fi
	,[toimipiste_fi] = d16c.organisaatio_fi

	--SV
	,[koulutuksen_alkamisvuosi_sv] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi_sv] = d2.selite_sv

	,[sukupuoli_sv] = d7.sukupuoli_sv
	,[ika_sv] = d9.ika_sv
	,[ikaryhma_sv] = d9.ikaryhma2_sv
	,[aidinkieli_sv] = d8.kieliryhma1_sv
	,[kansalaisuus_sv] = d30.maatjavaltiot2_sv
	,[kansalaisuus_maanosa_sv] = d30.maanosa5_sv
	,[kansalaisuus_ryhma_sv] = d30.maanosa6_sv
	,[kotipaikkakunta_hakija_sv] = d6.kunta_sv
	,[kotipaikan_maakunta_hakija_sv] = d6.maakunta_sv
	,[ensikertaisena_kohdeltava_hakija_sv] = case f.ensikertalainen when 0 then 'Ej förstagångssökande' when 1 then 'Förstagångssökande' else 'Information saknas' end
	,[ensikertainen_hakija_sv] = d18.kytkin_sv
	,[haku_AMK_YO_sv] = d46.selite_sv
	,[pohjakoulutus_ulkomailla_sv] = d4.kytkin_sv
	,[pohjakoulutuksen_maa_priorisoitu_sv] = 
		case 
			when f.pohjakoulutus_suomessa_priorisoitu = 1 then ' Finland' 
			when f.pohjakoulutus_suomessa_priorisoitu = 0 then ' Utomlands' 
			else 'Information saknas'
		end
	,[kansainvalinen_opiskelija_sv] = d50.kytkin_sv
	,[pohjakoulutus_sv] = d22.selite_sv 
	,[hakijan_ilmoittaman_pohjakoulutuksen_suoritusvuosi_sv] = f.toisen_asteen_koulutuksen_suoritusvuosi
	,[toisen_asteen_koulutuksen_suoritusvuosi_sv] = f.toisen_asteen_koulutuksen_suoritusvuosi
	,[ylioppilastutkinnon_suoritusvuosi_sv] = d49.vuosi

	,[haku_sv] = d25.haun_nimi_sv
	,[hakuaika_sv] = coalesce(d25.hakuaika_sv,'Information saknas')
	,[hakukohde_sv] = d10.selite_sv
	,[haun_kohdejoukon_tarkenne_sv] = d25.kohdejoukontarkenne_sv
	,[hakutapa_sv] = d25.hakutapa2_sv
	,[hakutyyppi_sv] = d25.hakutyyppi_sv
	,[maakunta_hakukohde_sv] = d19.maakunta_sv
	,[kunta_hakukohde_sv] = d19.kunta_sv
	,[hakutoive_sv] = f.hakutoive
	,[valintatapajono_sv] = d47.selite_sv
	,[valintatapajonon_tyyppi_sv] = d48.selite_sv

	,[koulutusaste_taso_1_sv] = d20.koulutusastetaso1_sv
	,[koulutusaste_taso_2_sv] = d20.koulutusastetaso2_sv
	,[koulutusala_taso_1_sv] = d20.koulutusalataso1_sv
	,[koulutusala_taso_2_sv] = d20.koulutusalataso2_sv
	,[koulutusala_taso_3_sv] = d20.koulutusalataso3_sv
	,[paaasiallinen_tutkinto_hakukohde_sv] = d20.koulutusluokitus_sv
	,[okm_ohjauksen_ala_sv] = d20.okmohjauksenala_sv
	,[koulutuksen_kieli_sv] = d27.selite_sv
	,[opiskelun_laajuus_sv] = f.laajuus
	,[sektori_sv] = d20.koulutussektori_sv 
	,[tutkinnon_taso_sv] = d45.selite_sv
	,[tutkinnon_aloitussykli_sv] = d44.selite_sv  
	 
	,[korkeakoulu_sv] = d16b.organisaatio_sv
	,[toimipiste_sv] = d16c.organisaatio_sv

	--EN
	,[koulutuksen_alkamisvuosi_en] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi_en] = d2.selite_en

	,[sukupuoli_en] = d7.sukupuoli_en
	,[ika_en] = d9.ika_en
	,[ikaryhma_en] = d9.ikaryhma2_en
	,[aidinkieli_en] = d8.kieliryhma1_en
	,[kansalaisuus_en] = d30.maatjavaltiot2_en
	,[kansalaisuus_maanosa_en] = d30.maanosa5_en
	,[kansalaisuus_ryhma_en] = d30.maanosa6_en
	,[kotipaikkakunta_hakija_en] = d6.kunta_en
	,[kotipaikan_maakunta_hakija_en] = d6.maakunta_en
	,[ensikertaisena_kohdeltava_hakija_en] = case f.ensikertalainen when 0 then 'Not considered as a first-time applicant' when 1 then 'Considered as a first-time applicant' else 'Missing data' end
	,[ensikertainen_hakija_en] = d18.kytkin_en
	,[haku_AMK_YO_en] = d46.selite_en
	,[pohjakoulutus_ulkomailla_en] = d4.kytkin_en
	,[pohjakoulutuksen_maa_priorisoitu_en] = 
		case 
			when f.pohjakoulutus_suomessa_priorisoitu = 1 then ' Finland' 
			when f.pohjakoulutus_suomessa_priorisoitu = 0 then 'Abroad' 
			else 'Missing information'
		end
	,[kansainvalinen_opiskelija_en] = d50.kytkin_en
	,[pohjakoulutus_en] = d22.selite_en 
	,[hakijan_ilmoittaman_pohjakoulutuksen_suoritusvuosi_en] = f.toisen_asteen_koulutuksen_suoritusvuosi
	,[toisen_asteen_koulutuksen_suoritusvuosi_en] = f.toisen_asteen_koulutuksen_suoritusvuosi
	,[ylioppilastutkinnon_suoritusvuosi_en] = d49.vuosi

	,[haku_en] = d25.haun_nimi_en
	,[hakuaika_en] = coalesce(d25.hakuaika_en,'Missing information')
	,[hakukohde_en] = d10.selite_en
	,[haun_kohdejoukon_tarkenne_en] = d25.kohdejoukontarkenne_en
	,[hakutapa_en] = d25.hakutapa2_en
	,[hakutyyppi_en] = d25.hakutyyppi_en
	,[maakunta_hakukohde_en] = d19.maakunta_en
	,[kunta_hakukohde_en] = d19.kunta_en
	,[hakutoive_en] = f.hakutoive
	,[valintatapajono_en] = d47.selite_en
	,[valintatapajonon_tyyppi_en] = d48.selite_en

	,[koulutusaste_taso_1_en] = d20.koulutusastetaso1_en
	,[koulutusaste_taso_2_en] = d20.koulutusastetaso2_en
	,[koulutusala_taso_1_en] = d20.koulutusalataso1_en
	,[koulutusala_taso_2_en] = d20.koulutusalataso2_en
	,[koulutusala_taso_3_en] = d20.koulutusalataso3_en
	,[paaasiallinen_tutkinto_hakukohde_en] = d20.koulutusluokitus_en
	,[okm_ohjauksen_ala_en] = d20.okmohjauksenala_en
	,[koulutuksen_kieli_en] = d27.selite_en
	,[opiskelun_laajuus_en] = f.laajuus
	,[sektori_en] = d20.koulutussektori_en 
	,[tutkinnon_taso_en] = d45.selite_en
	,[tutkinnon_aloitussykli_en] = d44.selite_en  
	 
	,[korkeakoulu_en] = d16b.organisaatio_en
	,[toimipiste_en] = d16c.organisaatio_en

	--Koodimuuttujat
	,[koodit_paaasiallinen_koulutusnimike] = d20.koulutusluokitus_koodi
	,[koodit_Korkeakoulu] = d16b.organisaatio_koodi
	,[koodit_Kunta_hakukohde] = d19.kunta_koodi
	,[koodit_Kotipaikkakunta_hakija] = d6.kunta_koodi
	  
	--Apusarakkeet
	,apusarake_Lukumäärä = case when f.master_oid is not null then 1 else 0 end
	,[apusarake_alpa] = coalesce(f.alpa,0)
	,[apusarake_Pisteraja] = f.pisteraja
	,[apusarake_Henkilö OID] = f.master_oid
	,[apusarake_Hakukohde OID] = d10.oid

	/* nettouttamatonta hakijamäärää varten valitaan yksi pohjakoulutus per hakija (per haku) */
	,[apusarake_yksi_pk_per_hakija] = case when f.pk_rnk = 1 then 1 else 0 end
	,[apusarake_Ensisijaiset hakijat2] = case when hakutoive='1' then 1 else 0 end							
	,[apusarake_Valitut2] = f.valittu
	,[apusarake_Paikan vastaanottaneet2] = f.vastaanottanut_paikan
	,[apusarake_Aloittaneet2] = f.ilmoittautunut
	  			
	--Jarjestys-kentat
	,[jarjestys_ensikertaisena_kohdeltava_hakija] = f.ensikertalainen
	,[jarjestys_haku_AMK_YO] = d46.jarjestys_koodi
	,[jarjestys_koulutusaste_taso_1] = d20.jarjestys_koulutusastetaso1_koodi
	,[jarjestys_koulutusaste_taso_2] = d20.jarjestys_koulutusastetaso2_koodi
	,[jarjestys_koulutusala_taso_1] = d20.jarjestys_koulutusalataso1_koodi
	,[jarjestys_koulutusala_taso_2] = d20.jarjestys_koulutusalataso2_koodi
	,[jarjestys_koulutusala_taso_3] = d20.jarjestys_koulutusalataso3_koodi
	,[jarjestys_oKM_ohjauksen_ala] = d20.jarjestys_okmohjauksenala_koodi
	,[jarjestys_hakutoive] = f.hakutoive
	,[jarjestys_hakukohteen_maakunta] = d19.jarjestys_maakunta_koodi
	,[jarjestys_hakutapa] = d25.jarjestys_hakutapa2
	,[jarjestys_hakutyyppi] = d25.jarjestys_hakutyyppi
	,[jarjestys_ika] = d9.jarjestys_ika
	,[jarjestys_ikaryhma] = d9.jarjestys_ikaryhma2
	,[jarjestys_kansalaisuus] = d30.jarjestys_maatjavaltiot2_koodi
	,[jarjestys_kansalaisuus_maanosa] = d30.jarjestys_maanosa5_koodi
	,[jarjestys_kansalaisuus_ryhma] = d30.jarjestys_maanosa6_koodi
	,[jarjestys_kotipaikkakunta_hakija] = left(d6.kunta_fi, 4)
	,[jarjestys_kotipaikan_maakunta_hakija] = d6.jarjestys_maakunta_koodi
	,[jarjestys_koulutuksen_kieli] = d27.jarjestys
	,[jarjestys_opiskelun_laajuus] = f.laajuus
	,[jarjestys_pohjakoulutuksen_maa] = d4.jarjestys_kytkin_koodi
	,[jarjestys_pohjakoulutus] = LEFT(d22.selite_fi,40)
	,[jarjestys_sektori] = d20.jarjestys_koulutussektori_koodi
	,[jarjestys_sukupuoli] = d7.jarjestys_sukupuoli_koodi
	,[jarjestys_toisen_asteen_koulutuksen_suoritusvuosi] = case when f.toisen_asteen_koulutuksen_suoritusvuosi = 0 then 9998 else 9999-f.toisen_asteen_koulutuksen_suoritusvuosi end
	,[jarjestys_ylioppilastutkinnon_suoritusvuosi] = case when d49.vuosi is null then 9998 else 9999-d49.vuosi end	  
	,[jarjestys_tutkinnon_taso] = d45.jarjestys_koodi
	,[jarjestys_tutkinnon_aloitussykli] = d44.jarjestys_koodi
	,[jarjestys_aidinkieli] = d8.jarjestys_kieliryhma1
	,[jarjestys_ensikertainen_hakija] = d18.jarjestys_kytkin_koodi

FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
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
LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_oppilaitoksenopetuskieli d27 ON d27.id=f.d_oppilaitoksenopetuskieli_koulutuksen_kieli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d30 ON d30.id=f.d_maatjavaltiot2_kansalaisuus_id
--
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d45 on d45.id=f.d_tutkinnon_taso_kk_id
LEFT JOIN ANTERO.dw.d_haku_amk_yo d46 on d46.id=f.d_haku_amk_yo_id
LEFT JOIN ANTERO.dw.d_valintatapajono d47 on d47.id = f.d_valintatapajono_id
LEFT JOIN ANTERO.dw.d_valintatapajonon_tyyppi d48 on d48.id = f.d_valintatapajonon_tyyppi_id
LEFT JOIN ANTERO.dw.d_kytkin d18 on d18.kytkin_koodi = COALESCE(f.aidosti_ensikertainen,-1)
LEFT JOIN ANTERO.dw.d_kalenteri d49 on d49.id = f.d_kalenteri_ylioppilastutkinnon_suorituspaivamaara_id
LEFT JOIN ANTERO.dw.d_kytkin d50 on d50.kytkin_koodi = f.kansainvalinen_opiskelija