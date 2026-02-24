USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_live]    Script Date: 5.2.2026 8.51.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_haku_ja_valinta_kk_live] AS


SELECT --top 10
	   cast(f.loadtime as date) as Päivitysaika
	  ,Lukumäärä = 1
	  ,[alpa] = 0
      ,[valpa] = 0
	  ,[Pisteraja] = NULL
	  ,[Ensikertaisena kohdeltava hakija] = CASE f.ensikertalainen WHEN 0 THEN 'Ei ensikertainen hakija ' WHEN 1 THEN 'Ensikertainen hakija' ELSE 'Tieto puuttuu' END	
	  ,[Hakemus OID] = f.hakemus_oid
	  ,[Haku AMK/YO] = d46.selite_fi
	  ,[Haku] = d25.haun_nimi_fi
	  ,[Hakuaika] = coalesce(d25.hakuaika_fi,'Tieto puutuu')
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
	  ,[Koulutusaste, taso 1 (hakukohde)] = d20.koulutusastetaso1_fi
	  ,[Koulutusaste, taso 2 (hakukohde)] = d20.koulutusastetaso2_fi
	  ,[Koulutusala, taso 1 (hakukohde)] = d20.koulutusalataso1_fi
	  ,[Koulutusala, taso 2 (hakukohde)] = d20.koulutusalataso2_fi
	  ,[Koulutusala, taso 3 (hakukohde)] = d20.koulutusalataso3_fi
	  ,[Tutkinto (hakukohde)] = d20.koulutusluokitus_fi
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

	  ,[Henkilö OID] = f.master_oid
	  ,[Ikä] = d9.ika_fi
	  ,[Ikäryhmä] = d9.ikaryhma2_fi
	  ,[Kansalaisuus] = COALESCE(d28.maa,'Tuntematon')
	  ,[Kansalaisuus (maanosa)] = 
				case 
					when d28.maa_koodi = '246' then 'Suomi' 
					when d28.maa_koodi in ('-1','999') then 'Tieto puuttuu' 
					when d28.maanosa_koodi = '1' then 'Eurooppa (pl. Suomi)'
					else d28.maanosa 
				end
	  ,[Kansalaisuus (ryhmä)] = 
				case 
					when d28.maa_koodi = '246' then 'Suomi' 
					when d28.maa_koodi != '246' and (d28.eumaa_koodi = '1' or d28.etamaa_koodi = '1') then 'EU ja ETA'
					when d28.maa_koodi in ('-1',999) then 'Tieto puuttuu'
					else 'Muut'
				 end
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
			when d4.kytkin_koodi = 1 then 'Ulkomaat' 
			when d4.kytkin_koodi = 0 then 'Suomi' 
			else d4.kytkin_fi
		end
	  ,[Pohjakoulutus] = d22.selite_fi 
	  ,[Sektori] = d20.koulutussektori_fi --coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'Ammattikorkeakoulutus' else f.sektori_kk end, 'Tuntematon')
	  ,[Sukupuoli] = d7.sukupuoli_fi
		-- Alkuperäinen  ,[Toisen asteen koulutuksen suoritusvuosi] = case f.toisen_asteen_koulutuksen_suoritusvuosi when '-1' then 'Tieto puuttuu' else f.toisen_asteen_koulutuksen_suoritusvuosi end 
	  ,[Hakijan ilmoittaman pohjakoulutuksen koulutuksen suoritusvuosi]=f.toisen_asteen_koulutuksen_suoritusvuosi
	  ,[Toisen asteen koulutuksen suoritusvuosi] = f.toisen_asteen_koulutuksen_suoritusvuosi
	  ,[Ylioppilastutkinnon suoritusvuosi] = d3.vuosi
	 ,[Aloittanut opinnot toisen asteen koulutuksen suoritusvuonna] = f.aloittanut_opinnot_toisen_asteen_koulutuksen_suoritusvuonna
	  ,[Aloittanut opinnot ilmoittamansa pohjakoulutuksen suoritusvuonna] = f.aloittanut_opinnot_ilmoittamansa_pohjakoulutuksen_suoritusvuonna
	  ,[Tutkinnon taso (hakukohde)] = d45.selite_fi
	  ,[Tutkinnon aloitussykli (hakukohde)] = d44.selite_fi
	  --,[Valinnan tila] = d23.valinnan_tila
	  --,[Vastaanoton tila] = d24.vastaanoton_tila
	  ,[Äidinkieli] = d8.kieliryhma1_fi
	  ,[Valintatapajono] = d48.selite_fi
	  ,[Valintatapajonon tyyppi] = d47.selite_fi
	 
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
	  ,[yksi_pk_per_hakija] = case when f.pk_rnk = 1 then 1 else 0 end
	  
	  ,[Ensisijaiset hakijat2] = case when hakutoive='1' then 1 else 0 end							
	  ,[Valitut2] = f.valittu
	  ,[Paikan vastaanottaneet2] = f.vastaanottanut_paikan			
	  ,[Aloittaneet2] = f.ilmoittautunut
	  			

	  --Järjestys-kentät
	  ,[Ensikertainen hakija järjestys] = coalesce(ensikertalainen,3)
	  ,[Hakuaika järjestys] = d25.jarjestys_hakuaika
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
	  ,[Hakutapa järjestys] = case when d25.hakutapa_fi='Yhteishaku' then 1 when d25.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 2 else 99 end
	  ,[Hakutyyppi järjestys] = d25.jarjestys_hakutyyppi
	  ,[Ikä järjestys] = d9.jarjestys_ika
	  ,[Ikä 5v järjestys] = d9.jarjestys_ikaryhma2
	  ,[Kansalaisuus järjestys] = coalesce(d28.jarjestys, 9998)
	  ,[Kansalaisuus maanosa järjestys] = coalesce(
				case 
					when d28.maa_koodi = '246' then 1
					when d28.maa_koodi in ('-1','999') then 9998 
					when d28.maanosa_koodi = '1' then 2
					else cast(d28.jarjestys_maanosa as int)+1
				end
		,9999)
	  ,[Kansalaisuus ryhmä järjestys] = 
				case 
					when d28.maa_koodi = '246' then 1 
					when d28.maa_koodi != '246' and (d28.eumaa_koodi = '1' or d28.etamaa_koodi = '1') then 2
					when d28.maa_koodi in ('-1',999) then 99
					else 3
				 end
	  ,[Kotipaikkakunta järjestys] = left(d6.kunta_fi, 4)
	  ,[Kotipaikan maakunta järjestys] = d6.jarjestys_maakunta_koodi
	  ,[Kotipaikan AVI järjestys] = d6.jarjestys_avi_koodi
	  ,[Kotipaikan ELY järjestys] = d6.jarjestys_ely_koodi
	  ,[Koulutuksen kieli järjestys] = d27.jarjestys
	  ,[Opiskelun laajuus järjestys] = f.laajuus
	  ,[Pohjakoulutuksen maa järjestys] = d4.jarjestys_kytkin_koodi
	  ,[Pohjakoulutus järjestys] = LEFT(d22.selite_fi,40)
	  ,[Sektori järjestys] = d20.jarjestys_koulutussektori_koodi
	  ,[Sukupuoli järjestys] = d7.jarjestys_sukupuoli_koodi
	  ,[Toisen asteen koulutuksen suoritusvuosi järjestys] = case when f.toisen_asteen_koulutuksen_suoritusvuosi = 0 then 9998 else 9999-f.toisen_asteen_koulutuksen_suoritusvuosi end
	  ,[Ylioppilastutkinnon suoritusvuosi järjestys] = case when d3.vuosi = 0 then 9998 else 9999-d3.vuosi end	  
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
	  ,[Valintatapajonon tyyppi järjestys] = d47.jarjestys
	  
FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_kalenteri d3 on d3.id = f.d_kalenteri_ylioppilastutkinnon_suorituspaivamaara_id
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
LEFT JOIN VipunenTK.dbo.d_valtio d28 ON d28.valtio_avain=d30.maatjavaltiot2_koodi
--1
LEFT JOIN ANTERO.dw.d_hakukohde d32 ON d32.id=f.d_hakukohde_hakukohde1_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d33 ON d33.id=f.d_koulutusluokitus_hakukohde1_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d33a ON d33a.id=f.d_organisaatioluokitus_hakukohde1_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d33b ON d33b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde1_id
--2
LEFT JOIN ANTERO.dw.d_hakukohde d34 ON d34.id=f.d_hakukohde_hakukohde2_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d35 ON d35.id=f.d_koulutusluokitus_hakukohde2_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d35a ON d35a.id=f.d_organisaatioluokitus_hakukohde2_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d35b ON d35b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde2_id
--3
LEFT JOIN ANTERO.dw.d_hakukohde d36 ON d36.id=f.d_hakukohde_hakukohde3_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d37 ON d37.id=f.d_koulutusluokitus_hakukohde3_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d37a ON d37a.id=f.d_organisaatioluokitus_hakukohde3_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d37b ON d37b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde3_id
--4
LEFT JOIN ANTERO.dw.d_hakukohde d38 ON d38.id=f.d_hakukohde_hakukohde4_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d39 ON d39.id=f.d_koulutusluokitus_hakukohde4_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d39a ON d39a.id=f.d_organisaatioluokitus_hakukohde4_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d39b ON d39b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde4_id
--5
LEFT JOIN ANTERO.dw.d_hakukohde d40 ON d40.id=f.d_hakukohde_hakukohde5_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d41 ON d41.id=f.d_koulutusluokitus_hakukohde5_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d41a ON d41a.id=f.d_organisaatioluokitus_hakukohde5_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d41b ON d41b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde5_id
--6
LEFT JOIN ANTERO.dw.d_hakukohde d42 ON d42.id=f.d_hakukohde_hakukohde6_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d43 ON d43.id=f.d_koulutusluokitus_hakukohde6_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d43a ON d43a.id=f.d_organisaatioluokitus_hakukohde6_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d43b ON d43b.id=f.d_tutkinnon_aloitussykli_kk_hakukohde6_id
--
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d45 on d45.id=f.d_tutkinnon_taso_kk_id
LEFT JOIN ANTERO.dw.d_haku_amk_yo d46 on d46.id=f.d_haku_amk_yo_id
LEFT JOIN ANTERO.dw.d_valintatapajonon_tyyppi d47 on d47.id = f.d_valintatapajonon_tyyppi_id
LEFT JOIN ANTERO.dw.d_valintatapajono d48 on d48.id = f.d_valintatapajono_id
WHERE f.koulutuksen_alkamisvuosi > year(getdate())-4