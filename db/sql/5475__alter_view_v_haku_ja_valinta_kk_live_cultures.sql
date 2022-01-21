USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_live_cultures]    Script Date: 21.1.2022 16:37:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_haku_ja_valinta_kk_live_cultures] AS


SELECT --top 10
	   
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
	,[ensikertaisena_kohdeltava_hakija_fi] = f.ensikertainen_hakija	
	,[haku_AMK_YO_fi] = d46.selite_fi
	,[pohjakoulutus_ulkomailla_fi] = d4.kytkin_fi
	,[pohjakoulutus_fi] = d22.selite_fi 
	,[hakijan_ilmoittaman_pohjakoulutuksen_suoritusvuosi_fi] = f.toisen_asteen_koulutuksen_suoritusvuosi
	,[toisen_asteen_koulutuksen_suoritusvuosi_fi] = case d_pohjakoulutuskk_id when '7' then  f.toisen_asteen_koulutuksen_suoritusvuosi when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi Else 'Tieto puuttuu' end
	,[ylioppilastutkinnon_suoritusvuosi_fi] = f.ylioppilastutkinnon_suoritusvuosi

	,[haku_fi] = d25.haun_nimi_fi
	,[hakuaika_fi] = 
		coalesce(
			case 
				when f.d_hakuaika_id = '-1' then d31b.selite2_fi
				else d31.selite2_fi
			end
		,'Tieto puuttuu')
	,[hakukohde_fi] = d10.selite_fi
	,[haun_kohdejoukon_tarkenne_fi] = d25.kohdejoukontarkenne_fi
	,[hakutapa_fi] = d25.hakutapa2_fi
	,[hakutyyppi_fi] = d25.hakutyyppi_fi
	,[maakunta_hakukohde_fi] = d19.maakunta_fi
	,[kunta_hakukohde_fi] = d19.kunta_fi
	,[hakutoive_fi] = f.hakutoive
	,[valintatapajono_fi] = 
		Case
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
				then d47.valintatapajono_nimi
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
				then null
			Else d47.valintatapajono_nimi
		End
	,[valintatapajonon_tyyppi_fi] = 
		Case
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
				then coalesce(d48.selite_fi, 'Tieto puuttuu')
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
				then 'Ei valittu'
			Else coalesce(d48.selite_fi, 'Tieto puuttuu')
		End

	,[koulutusaste_taso_1_fi] = d20.koulutusastetaso1_fi
	,[koulutusaste_taso_2_fi] = d20.koulutusastetaso2_fi
	,[koulutusala_taso_1_fi] = d20.koulutusalataso1_fi
	,[koulutusala_taso_2_fi] = d20.koulutusalataso2_fi
	,[koulutusala_taso_3_fi] = d20.koulutusalataso3_fi
	,[tutkinto_fi] = d20.koulutusluokitus_fi
	,[okm_ohjauksen_ala_fi] = d20.okmohjauksenala_fi
	,[koulutuksen_kieli_fi] = d27.kieli_fi
	,[opiskelun_laajuus_fi] = d3.selite_fi
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
	,[ensikertaisena_kohdeltava_hakija_sv] = f.ensikertainen_hakija	
	,[haku_AMK_YO_sv] = d46.selite_sv
	,[pohjakoulutus_ulkomailla_sv] = d4.kytkin_sv
	,[pohjakoulutus_sv] = d22.selite_sv 
	,[hakijan_ilmoittaman_pohjakoulutuksen_suoritusvuosi_sv] = f.toisen_asteen_koulutuksen_suoritusvuosi
	,[toisen_asteen_koulutuksen_suoritusvuosi_sv] = case d_pohjakoulutuskk_id when '7' then  f.toisen_asteen_koulutuksen_suoritusvuosi when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi Else 'Information saknas' end
	,[ylioppilastutkinnon_suoritusvuosi_sv] = f.ylioppilastutkinnon_suoritusvuosi

	,[haku_sv] = d25.haun_nimi_sv
	,[hakuaika_sv] = 
		coalesce(
			case 
				when f.d_hakuaika_id = '-1' then d31b.selite2_sv
				else d31.selite2_sv
			end
		,'Information saknas')
	,[hakukohde_sv] = d10.selite_sv
	,[haun_kohdejoukon_tarkenne_sv] = d25.kohdejoukontarkenne_sv
	,[hakutapa_sv] = d25.hakutapa2_sv
	,[hakutyyppi_sv] = d25.hakutyyppi_sv
	,[maakunta_hakukohde_sv] = d19.maakunta_sv
	,[kunta_hakukohde_sv] = d19.kunta_sv
	,[hakutoive_sv] = f.hakutoive
	,[valintatapajono_sv] = 
		Case
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
				then d47.valintatapajono_nimi
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
				then null
			Else d47.valintatapajono_nimi
		End
	,[valintatapajonon_tyyppi_sv] = 
		Case
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
				then coalesce(d48.selite_sv, 'Information saknas')
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
				then 'Ei valittu'
			Else coalesce(d48.selite_sv, 'Information saknas')
		End

	,[koulutusaste_taso_1_sv] = d20.koulutusastetaso1_sv
	,[koulutusaste_taso_2_sv] = d20.koulutusastetaso2_sv
	,[koulutusala_taso_1_sv] = d20.koulutusalataso1_sv
	,[koulutusala_taso_2_sv] = d20.koulutusalataso2_sv
	,[koulutusala_taso_3_sv] = d20.koulutusalataso3_sv
	,[tutkinto_sv] = d20.koulutusluokitus_sv
	,[okm_ohjauksen_ala_sv] = d20.okmohjauksenala_sv
	,[koulutuksen_kieli_sv] = d27.kieli_sv
	,[opiskelun_laajuus_sv] = d3.selite_sv
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
	,[ensikertaisena_kohdeltava_hakija_en] = f.ensikertainen_hakija	
	,[haku_AMK_YO_en] = d46.selite_en
	,[pohjakoulutus_ulkomailla_en] = d4.kytkin_en
	,[pohjakoulutus_en] = d22.selite_en 
	,[hakijan_ilmoittaman_pohjakoulutuksen_suoritusvuosi_en] = f.toisen_asteen_koulutuksen_suoritusvuosi
	,[toisen_asteen_koulutuksen_suoritusvuosi_en] = case d_pohjakoulutuskk_id when '7' then  f.toisen_asteen_koulutuksen_suoritusvuosi when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi Else 'Missing data' end
	,[ylioppilastutkinnon_suoritusvuosi_en] = f.ylioppilastutkinnon_suoritusvuosi

	,[haku_en] = d25.haun_nimi_en
	,[hakuaika_en] = 
		coalesce(
			case 
				when f.d_hakuaika_id = '-1' then d31b.selite2_en
				else d31.selite2_en
			end
		,'Missing information')
	,[hakukohde_en] = d10.selite_en
	,[haun_kohdejoukon_tarkenne_en] = d25.kohdejoukontarkenne_en
	,[hakutapa_en] = d25.hakutapa2_en
	,[hakutyyppi_en] = d25.hakutyyppi_en
	,[maakunta_hakukohde_en] = d19.maakunta_en
	,[kunta_hakukohde_en] = d19.kunta_en
	,[hakutoive_en] = f.hakutoive
	,[valintatapajono_en] = 
		Case
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
				then d47.valintatapajono_nimi
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
				then null
			Else d47.valintatapajono_nimi
		End
	,[valintatapajonon_tyyppi_en] = 
		Case
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
				then coalesce(d48.selite_en, 'Missing information')
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
				then 'Ei valittu'
			Else coalesce(d48.selite_en, 'Missing information')
		End

	,[koulutusaste_taso_1_en] = d20.koulutusastetaso1_en
	,[koulutusaste_taso_2_en] = d20.koulutusastetaso2_en
	,[koulutusala_taso_1_en] = d20.koulutusalataso1_en
	,[koulutusala_taso_2_en] = d20.koulutusalataso2_en
	,[koulutusala_taso_3_en] = d20.koulutusalataso3_en
	,[tutkinto_en] = d20.koulutusluokitus_en
	,[okm_ohjauksen_ala_en] = d20.okmohjauksenala_en
	,[koulutuksen_kieli_en] = d27.kieli_en
	,[opiskelun_laajuus_en] = d3.selite_en
	,[sektori_en] = d20.koulutussektori_en 
	,[tutkinnon_taso_en] = d45.selite_en
	,[tutkinnon_aloitussykli_en] = d44.selite_en  
	 
	,[korkeakoulu_en] = d16b.organisaatio_en
	,[toimipiste_en] = d16c.organisaatio_en

	--Koodimuuttujat
	,[koodit_Tutkinto_hakukohde] = d20.koulutusluokitus_koodi
	,[koodit_Korkeakoulu] = d16b.organisaatio_koodi
	,[koodit_Kunta_hakukohde] = d19.kunta_koodi
	,[koodit_Kotipaikkakunta_hakija] = d6.kunta_koodi
	  
	--Apusarakkeet
	,apusarake_Lukumäärä = 1
	,[apusarake_alpa] = 0
	,[apusarake_Pisteraja] = NULL
	,[apusarake_Henkilö OID] = f.henkilo_oid
	,[apusarake_Hakukohde OID] = d10.oid

	/* nettouttamatonta hakijamäärää varten valitaan yksi pohjakoulutus per hakija (per haku) */
	,[apusarake_yksi_pk_per_hakija] = 
		case 
			when f.d_pohjakoulutuskk_id in (select top 1 fh.d_pohjakoulutuskk_id from ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste fh where fh.henkilo_oid=f.henkilo_oid and fh.d_haku_id=f.d_haku_id order by fh.d_pohjakoulutuskk_id) then 1 
			else 0 
		end 
	  
	,[apusarake_Ensisijaiset hakijat2] = case when hakutoive='1' then 1 else 0 end							
	,[apusarake_Valitut2] = case when f.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1	else 0 end
	,[apusarake_Paikan vastaanottaneet2] = case when f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0	end			
	,[apusarake_Aloittaneet2] = case when f.ilmoittautumisen_tila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end
	  			
	--Jarjestys-kentat
	,[jarjestys_ensikertainen_hakija] = left(f.ensikertainen_hakija,2)
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
	,[jarjestys_koulutuksen_kieli] = d27.kieli_koodi
	,[jarjestys_opiskelun_laajuus] = d3.jarjestys
	,[jarjestys_pohjakoulutuksen_maa] = d4.jarjestys_kytkin_koodi
	,[jarjestys_pohjakoulutus] = LEFT(d22.selite_fi,40)
	,[jarjestys_sektori] = d20.jarjestys_koulutussektori_koodi
	,[jarjestys_sukupuoli] = d7.jarjestys_sukupuoli_koodi
	,[jarjestys_toisen_asteen_koulutuksen_suoritusvuosi] = case when f.toisen_asteen_koulutuksen_suoritusvuosi in ('0','Tieto puuttuu') then 9998 else 9999-f.toisen_asteen_koulutuksen_suoritusvuosi end
	,[jarjestys_ylioppilastutkinnon_suoritusvuosi] = case when f.ylioppilastutkinnon_suoritusvuosi in ('0', 'Tieto puuttuu') then 9998 else 9999-f.ylioppilastutkinnon_suoritusvuosi end	  
	,[jarjestys_tutkinnon_taso] = d45.jarjestys_koodi
	,[jarjestys_tutkinnon_aloitussykli] = d44.jarjestys_koodi
	,[jarjestys_aidinkieli] = d8.jarjestys_kieliryhma1
	  
FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_opintojenlaajuus d3 ON d3.id=f.d_opintojen_laajuus_id
LEFT JOIN ANTERO.dw.d_kytkin d4 ON d4.id=f.d_kytkin_pohjakoulutuskk_ulkomaat_id
LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.id = f.d_alueluokitus_kotipaikka_id
LEFT JOIN ANTERO.dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_kieli d8 ON d8.id = f.d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_ika d9 ON d9.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatio_koulutuksen_jarjestaja_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatio_toimipiste_id
LEFT JOIN ANTERO.dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_pohjakoulutus d22 ON d22.id = f.d_pohjakoulutuskk_id
LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d30 ON d30.id=f.d_maatjavaltiot_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_hakuaika d31 ON d31.id=f.d_hakuaika_id
LEFT JOIN ANTERO.dw.d_hakuaika_kouta d31b ON d31b.id=f.d_hakuaika_kouta_id
--
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d45 on d45.id=f.d_tutkinnon_taso_kk_id
LEFT JOIN ANTERO.dw.d_haku_amk_yo d46 on d46.id=f.d_haku_amk_yo_id
LEFT JOIN ANTERO.dw.f_haku_ja_valinta_korkea_aste_valintatapajonot d47 on d47.henkilo_oid = f.henkilo_oid and d47.d_hakukohde_id = f.d_hakukohde_id and d47.haku_oid=d25.haku_oid
LEFT JOIN ANTERO.dw.d_valintatapajono d48 on d48.id = d47.d_valintatapajono_id


WHERE f.koulutuksen_alkamisvuosi > year(getdate())-4
 

UNION ALL


SELECT --top 10
	   
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
	,[kotipaikan_maakunta_fi] = d6.maakunta_fi
	,[ensikertaisena_kohdeltava_hakija_fi] = NULL
	,[haku_AMK_YO_fi] = d46.selite_fi
	,[pohjakoulutus_ulkomailla_fi] = d4.kytkin_fi
	,[pohjakoulutus_fi] = d22.selite_fi 
	,[hakijan_ilmoittaman pohjakoulutuksen_koulutuksen_suoritusvuosi_fi] = NULL
	,[toisen_asteen_koulutuksen_suoritusvuosi_fi] = NULL
	,[ylioppilastutkinnon_suoritusvuosi_fi] = NULL

	,[haku_fi] = d25.haun_nimi_fi
	,[hakuaika_fi] = 
		coalesce(
			case 
				when f.d_hakuaika_id = '-1' then d31b.selite2_fi
				else d31.selite2_fi
			end
		,'Tieto puuttuu')
	,[hakukohde_fi] = d10.selite_fi
	,[haun_kohdejoukon_tarkenne_fi] = d25.kohdejoukontarkenne_fi
	,[hakutapa_fi] = d25.hakutapa2_fi
	,[hakutyyppi_fi] = d25.hakutyyppi_fi
	,[maakunta_hakukohde_fi] = d19.maakunta_fi
	,[kunta_hakukohde_fi] = d19.kunta_fi
	,[hakutoive_fi] = NULL
	,[valintatapajono_fi] = NULL
	,[valintatapajonon_tyyppi_fi] = NULL

	,[koulutusaste_taso1_fi] = d20.koulutusastetaso1_fi
	,[koulutusaste_taso2_fi] = d20.koulutusastetaso2_fi
	,[koulutusala_taso1_fi] = d20.koulutusalataso1_fi
	,[koulutusala_taso2_fi] = d20.koulutusalataso2_fi
	,[koulutusala_taso3_fi] = d20.koulutusalataso3_fi
	,[tutkinto_fi] = d20.koulutusluokitus_fi
	,[okm_ohjauksen_ala_fi] = d20.okmohjauksenala_fi
	,[koulutuksen_kieli_fi] = d27.kieli_fi
	,[opiskelun_laajuus_fi] = d3.selite_fi
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
	,[kotipaikan_maakunta_sv] = d6.maakunta_sv
	,[ensikertaisena_kohdeltava_hakija_sv] = NULL
	,[haku_AMK_YO_sv] = d46.selite_sv
	,[pohjakoulutus_ulkomailla_sv] = d4.kytkin_sv
	,[pohjakoulutus_sv] = d22.selite_sv 
	,[hakijan_ilmoittaman pohjakoulutuksen_koulutuksen_suoritusvuosi_sv] = NULL
	,[toisen_asteen_koulutuksen_suoritusvuosi_sv] = NULL
	,[ylioppilastutkinnon_suoritusvuosi_sv] = NULL

	,[haku_sv] = d25.haun_nimi_sv
	,[hakuaika_sv] = 
		coalesce(
			case 
				when f.d_hakuaika_id = '-1' then d31b.selite2_sv
				else d31.selite2_sv
			end
		,'Information saknas')
	,[hakukohde_sv] = d10.selite_sv
	,[haun_kohdejoukon_tarkenne_sv] = d25.kohdejoukontarkenne_sv
	,[hakutapa_sv] = d25.hakutapa2_sv
	,[hakutyyppi_sv] = d25.hakutyyppi_sv
	,[maakunta_hakukohde_sv] = d19.maakunta_sv
	,[kunta_hakukohde_sv] = d19.kunta_sv
	,[hakutoive_sv] = NULL
	,[valintatapajono_sv] = NULL
	,[valintatapajonon_tyyppi_sv] = NULL

	,[koulutusaste_taso1_sv] = d20.koulutusastetaso1_sv
	,[koulutusaste_taso2_sv] = d20.koulutusastetaso2_sv
	,[koulutusala_taso1_sv] = d20.koulutusalataso1_sv
	,[koulutusala_taso2_sv] = d20.koulutusalataso2_sv
	,[koulutusala_taso3_sv] = d20.koulutusalataso3_sv
	,[tutkinto_sv] = d20.koulutusluokitus_sv
	,[okm_ohjauksen_ala_sv] = d20.okmohjauksenala_sv
	,[koulutuksen_kieli_sv] = d27.kieli_sv
	,[opiskelun_laajuus_sv] = d3.selite_sv
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
	,[kotipaikan_maakunta_en] = d6.maakunta_en
	,[ensikertaisena_kohdeltava_hakija_en] = NULL
	,[haku_AMK_YO_en] = d46.selite_en
	,[pohjakoulutus_ulkomailla_en] = d4.kytkin_en
	,[pohjakoulutus_en] = d22.selite_en 
	,[hakijan_ilmoittaman pohjakoulutuksen_koulutuksen_suoritusvuosi_en] = NULL
	,[toisen_asteen_koulutuksen_suoritusvuosi_en] = NULL
	,[ylioppilastutkinnon_suoritusvuosi_en] = NULL

	,[haku_en] = d25.haun_nimi_en
	,[hakuaika_en] = 
		coalesce(
			case 
				when f.d_hakuaika_id = '-1' then d31b.selite2_en
				else d31.selite2_en
			end
		,'Missing information')
	,[hakukohde_en] = d10.selite_en
	,[haun_kohdejoukon_tarkenne_en] = d25.kohdejoukontarkenne_en
	,[hakutapa_en] = d25.hakutapa2_en
	,[hakutyyppi_en] = d25.hakutyyppi_en
	,[maakunta_hakukohde_en] = d19.maakunta_en
	,[kunta_hakukohde_en] = d19.kunta_en
	,[hakutoive_en] = NULL
	,[valintatapajono_en] = NULL
	,[valintatapajonon_tyyppi_en] = NULL

	,[koulutusaste_taso1_en] = d20.koulutusastetaso1_en
	,[koulutusaste_taso2_en] = d20.koulutusastetaso2_en
	,[koulutusala_taso1_en] = d20.koulutusalataso1_en
	,[koulutusala_taso2_en] = d20.koulutusalataso2_en
	,[koulutusala_taso3_en] = d20.koulutusalataso3_en
	,[tutkinto_en] = d20.koulutusluokitus_en
	,[okm_ohjauksen_ala_en] = d20.okmohjauksenala_en
	,[koulutuksen_kieli_en] = d27.kieli_en
	,[opiskelun_laajuus_en] = d3.selite_en
	,[sektori_en] = d20.koulutussektori_en 
	,[tutkinnon_taso_en] = d45.selite_en
	,[tutkinnon_aloitussykli_en] = d44.selite_en  
	 
	,[korkeakoulu_en] = d16b.organisaatio_en
	,[toimipiste_en] = d16c.organisaatio_en

	--Koodimuuttujat
	,[koodit_Tutkinto_hakukohde] = d20.koulutusluokitus_koodi
	,[koodit_Korkeakoulu] = d16b.organisaatio_koodi
	,[koodit_Kunta_hakukohde] = d19.kunta_koodi
	,[koodit_Kotikunta_hakija] = d6.kunta_koodi
	  
	--Apusarakkeet
	,apusarake_Lukumäärä = 1
	,[apusarake_alpa] = f.aloituspaikat
	,[apusarake_Pisteraja] = f.alin_laskettuvalintapistemaara
	,[apusarake_Henkilö OID] = NULL
	,[apusarake_Hakukohde OID] = d10.oid

	/* nettouttamatonta hakijamäärää varten valitaan yksi pohjakoulutus per hakija (per haku) */
	,[apusarake_yksi_pk_per_hakija] = 0
	,[apusarake_Ensisijaiset hakijat2] = NULL						
	,[apusarake_Valitut2] = NULL
	,[apusarake_Paikan vastaanottaneet2] = NULL
	,[apusarake_Aloittaneet2] = NULL
	  			
	--Jarjestys-kentat
	,[jarjestys_Ensikertainen_hakija] = 'ÖÖ'
	,[jarjestys_Haku_AMK_YO] = d46.jarjestys_koodi
	,[jarjestys_Koulutusaste_taso1] = d20.jarjestys_koulutusastetaso1_koodi
	,[jarjestys_Koulutusaste_taso2] = d20.jarjestys_koulutusastetaso2_koodi
	,[jarjestys_Koulutusala_taso1] = d20.jarjestys_koulutusalataso1_koodi
	,[jarjestys_Koulutusala_taso2] = d20.jarjestys_koulutusalataso2_koodi
	,[jarjestys_Koulutusala_taso3] = d20.jarjestys_koulutusalataso3_koodi
	,[jarjestys_OKM_ohjauksen_ala] = d20.jarjestys_okmohjauksenala_koodi
	,[jarjestys_Hakutoive] = 9
	,[jarjestys_Hakukohteen_maakunta] = d19.jarjestys_maakunta_koodi
	,[jarjestys_Hakutapa] = d25.jarjestys_hakutapa2
	,[jarjestys_Hakutyyppi] = d25.jarjestys_hakutyyppi
	,[jarjestys_Ika] = d9.jarjestys_ika
	,[jarjestys_Ikaryhma] = d9.jarjestys_ikaryhma2
	,[jarjestys_Kansalaisuus] = d30.jarjestys_maatjavaltiot2_koodi
	,[jarjestys_Kansalaisuus_maanosa] = d30.jarjestys_maanosa5_koodi
	,[jarjestys_Kansalaisuus_ryhma] = d30.jarjestys_maanosa6_koodi
	,[jarjestys_Kotipaikkakunta_hakija] = left(d6.kunta_fi, 4)
	,[jarjestys_Kotipaikan_maakunta] = d6.jarjestys_maakunta_koodi
	,[jarjestys_Koulutuksen_kieli] = d27.kieli_koodi
	,[jarjestys_Opiskelun_laajuus] = d3.jarjestys
	,[jarjestys_Pohjakoulutuksen_maa] = d4.jarjestys_kytkin_koodi
	,[jarjestys_Pohjakoulutus] = LEFT(d22.selite_fi,40)
	,[jarjestys_Sektori] = d20.jarjestys_koulutussektori_koodi
	,[jarjestys_Sukupuoli] = d7.jarjestys_sukupuoli_koodi
	,[jarjestys_Toisen_asteen_koulutuksen_suoritusvuosi] = 9999
	,[jarjestys_Ylioppilastutkinnon_suoritusvuosi] = 9999
	,[jarjestys_Tutkinnon taso (hakukohde)] = d45.jarjestys_koodi
	,[jarjestys_Tutkinnon aloitussykli_hakukohde] = d44.jarjestys_koodi
	,[jarjestys_aidinkieli] = d8.jarjestys_kieliryhma1
	  
FROM ANTERO.dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat f
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_opintojenlaajuus d3 ON d3.id=f.d_opintojen_laajuus_id
LEFT JOIN ANTERO.dw.d_kytkin d4 ON d4.id = '-1'
LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.id = '-1'
LEFT JOIN ANTERO.dw.d_sukupuoli d7 ON d7.id = '-1'
LEFT JOIN ANTERO.dw.d_kieli d8 ON d8.id = '-1'
LEFT JOIN ANTERO.dw.d_ika d9 ON d9.id = '-1'
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatio_koulutuksen_jarjestaja_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatio_toimipiste_id
LEFT JOIN ANTERO.dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_pohjakoulutus d22 ON d22.id = '-1'
LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d30 ON d30.id = '-1'
LEFT JOIN ANTERO.dw.d_hakuaika d31 ON d31.id=f.d_hakuaika_id
LEFT JOIN ANTERO.dw.d_hakuaika_kouta d31b ON d31b.id=f.d_hakuaika_kouta_id
--
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d45 on d45.id=f.d_tutkinnon_taso_kk_id
LEFT JOIN ANTERO.dw.d_haku_amk_yo d46 on d46.id = '-1'
LEFT JOIN ANTERO.dw.d_valintatapajono d47 on d47.id = '-1'

WHERE f.koulutuksen_alkamisvuosi > year(getdate())-4 AND d25.korkeakouluhaku=1

GO

USE [ANTERO]