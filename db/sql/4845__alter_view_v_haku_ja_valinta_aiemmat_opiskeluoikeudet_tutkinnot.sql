USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]    Script Date: 7.9.2021 15:40:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot] AS



SELECT --TOP 1000
	 
	/* Hakumuuttujat */
	 [Haku] = d1.haun_nimi_fi
	,[Hakuaika] = coalesce(d5.selite_fi,'Tieto puuttuu')
	,[hakuaikaId]
	,[Hakuaika alku] = d5.alkuPvm
	,[Hakuaika loppu] = d5.loppuPvm
	,[Hakukohde] = d10.selite_fi
	,[Hakutapa] = case d1.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d1.hakutapa_fi end
	,[Hakutoive]
	,[Hakutyyppi] = d1.hakutyyppi_fi

	/* Hakutoivemuuttujat */
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


	/* Henkilömuuttujat */
	,[Haku AMK/YO] = d4.selite_fi
	,[Henkilö OID] = f.henkilo_oid
	,[Ikäryhmä] = d26.ikaryhma2_fi
	,[Kansalaisuus] = COALESCE(d28.maa,'Tieto puuttuu')
	,[Kansalaisuus (ryhmä)] =
		case 
			when d28.maa_koodi = '246' then 'Suomi' 
			when d28.maa_koodi != '246' and (d28.eumaa_koodi = '1' or d28.etamaa_koodi = '1') then 'EU ja ETA'
			when d28.maa_koodi in ('-1',999) then 'Tieto puuttuu'
			else 'Muut'
		end
	,[Pohjakoulutuksen maa] = 
		case 
			when d11.kytkin_koodi = 1 then 'Ulkomaat' 
			when d11.kytkin_koodi = 0 then 'Suomi' 
			else d11.kytkin_fi
		end
	,[Pohjakoulutus] = d22.selite_fi
	,[Sukupuoli] = d7.sukupuoli_fi
	,[Toisen asteen koulutuksen suoritusvuosi] = htt.toisen_asteen_koulutuksen_suoritusvuosi
	,[Äidinkieli] = d8.kieliryhma1_fi
	,[Vastaanottaa korkeakoulupaikan 3 vuoden aikana] = 
		case
			when f.vastaanottaa_paikan_3v = 1 then 'Kyllä'
			else 'Ei'
		end

	,f.vastaanottaa_paikan_3v 

	/* Koulutusmuuttujat */
	,[Hakukohteen maakunta] = d19.maakunta_fi
	,[Hakukohteen kunta] = d19.kunta_fi
	,[Korkeakoulu_hakukohde] = d16b.organisaatio_fi + '_' + d10.selite_fi
	,[Tutkinto (hakukohde)] = d20.koulutusluokitus_fi
	,[Hakukohteen koulutusaste, taso 1] = d20.koulutusastetaso1_fi
	,[Hakukohteen koulutusaste, taso 2] = d20.koulutusastetaso2_fi
	,[Hakukohteen koulutusala, taso 1] = d20.koulutusalataso1_fi
	,[Hakukohteen koulutusala, taso 2] = d20.koulutusalataso2_fi
	,[Hakukohteen koulutusala, taso 3] = d20.koulutusalataso3_fi
	,[Hakukohteen koulutusaste] = d20.koulutusaste2002_fi
	,[Hakukohteen koulutusala 2002] = coalesce(d20.Koulutusala2002_fi,'Tieto puuttuu')
	,[Hakukohteen opintoala 2002] = d20.Opintoala2002_fi
	,[Hakukohteen koulutusala 1995] = d20.Opintoala1995_fi
	,[Hakukohteen tutkinnon taso] = d18.selite_fi
	,[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[Koulutuksen alkamiskausi] = d2.selite_fi
	,[Koulutuksen kieli] = d27.kieli_fi
	,[Opiskelun laajuus] = d21.selite_fi
	,[Sektori] = case when d10.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d20.koulutussektori_fi end
	,[Tutkinnon aloitussykli (hakukohde)] = d23.selite_fi

	/* Organisaatiomuuttujat */
	,[Hakukohteen koulutustoimija] = d16a.organisaatio_fi
	,[Hakukohteen oppilaitos] = d16b.organisaatio_fi
	,[Hakukohteen toimipiste] = coalesce(d16c.organisaatio_fi, d16b.organisaatio_fi)

	/* Muut opiskeluoikeudet */
	,[Muun opiskeluoikeuden tavoitetutkinto] = coalesce(d53.koulutusluokitus_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden koulutusaste, taso 1] = coalesce(d53.koulutusastetaso1_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden koulutusaste, taso 2] = coalesce(d53.koulutusastetaso2_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden koulutusala, taso 1] = coalesce(d53.koulutusalataso1_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden koulutusala, taso 2] = coalesce(d53.koulutusalataso2_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden koulutusala, taso 3] = coalesce(d53.koulutusalataso3_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden koulutusala (2002)] = coalesce(d53.koulutusala2002_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden koulutusala (1995)] = coalesce(d53.opintoala1995_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden opintoala (2002)] = coalesce(d53.opintoala2002_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden koulutusaste] = coalesce(d53.koulutusaste2002_fi,'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden aloitusvuosi] = coalesce(cast(year(f.muu_alkamispvm) as varchar(50)),'Ei aiempaa opiskeluoikeutta')
	,[Muun opiskeluoikeuden korkeakoulu] = coalesce(d51.organisaatio_fi,'Ei aiempaa opiskeluoikeutta') 
	,[Muu opiskeluoikeus voimassa] =  case 
										when muu_paattymispvm > d5.loppuPvm or (f.muu_alkamispvm is not null and muu_paattymispvm is null) then 'On voimassa' 
										when muu_paattymispvm <= d5.loppuPvm then 'Ei voimassa' 
										else 'Ei aiempaa opiskeluoikeutta' 
									end
	,[Muun opiskeluoikeuden alkupvm] = f.muu_alkamispvm
			
	/* Aiemmat tutkinnot */
	,[Aiempi tutkinto] = coalesce(d54.koulutusluokitus_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon koulutusaste, taso 1] = coalesce(d54.koulutusastetaso1_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon koulutusaste, taso 2] = coalesce(d54.koulutusastetaso2_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon koulutusala, taso 1] = coalesce(d54.koulutusalataso1_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon koulutusala, taso 2] = coalesce(d54.koulutusalataso2_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon koulutusala, taso 3] = coalesce(d54.koulutusalataso3_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon koulutusala (2002)] = coalesce(d54.koulutusala2002_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon koulutusala (1995)] = coalesce(d54.opintoala1995_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon opintoala (2002)] = coalesce(d54.opintoala2002_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon koulutusaste] = coalesce(d54.koulutusaste2002_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon suoritusvuosi] = coalesce(cast(YEAR(f.aiempi_tutkinto_suorituspvm) as varchar(50)),'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon korkeakoulu] = coalesce(d52.organisaatio_fi,'Ei aiempaa tutkintoa')
	,[Aiemman tutkinnon suorituspvm] = f.aiempi_tutkinto_suorituspvm

	,[Hakenut ensikertaa korkeakouluun] = 
		case
			when f.ensi_kertaa_hakeva = 0 then d56.kytkin_fi
			when f.koulutuksen_alkamisvuosi < 2018 then 'Tieto puuttuu'
			ELSE d56.kytkin_fi
		end
	
	,[aidosti_ensikertainen] = case when f.muu_alkamispvm is null and f.aiempi_tutkinto_suorituspvm is null then 1 else 0 end
	,[ensikertaa_hakeva] = f.ensi_kertaa_hakeva
	,[ensikertaisena_kohdeltava] = case when d55.op_oikeus_tai_tutkinto=1 then 0 else 1	end
	,[Ensikertaisena kohdeltava hakija] =	
		case 
			when d55.op_oikeus_tai_tutkinto=1 then 'Ei ensikertainen hakija' 
			else 'Ensikertainen hakija' 
		end
	/* Mittarit */
	,[Valitut2] = case when f.loadtime >= d44.valitut and ht.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1 else 0 end
	,[Paikan vastaanottaneet2] = case when f.loadtime >= d44.vastaanottaneet and ht.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0	end		
	,[Aloittaneet2] = case when f.loadtime >= d44.aloittaneet and ht.ilmoittautumisen_tila IN ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end

	/* Koodimuuttujat */
	,[Koodit Tutkinto (hakukohde)] = d20.koulutusluokitus_koodi
	,[Koodit Muun opiskeluoikeuden tavoitetutkinto] = d53.koulutusluokitus_koodi
	,[Koodit Aiempi tutkinto] = d35.koulutusluokitus_koodi

	/* Järjestys-kentät */
	,[Ensikertainen hakija järjestys] = left(f.ensikertainen_hakija,2)
	,[Haku AMK/YO järjestys] = d4.jarjestys_koodi
	,[Hakukohteen koulutusaste, taso 1 järjestys] = d20.jarjestys_koulutusastetaso1_koodi
	,[Hakukohteen koulutusaste, taso 2 järjestys] = d20.jarjestys_koulutusastetaso2_koodi
	,[Hakukohteen koulutusala, taso 1 järjestys] = d20.jarjestys_koulutusalataso1_koodi
	,[Hakukohteen koulutusala, taso 2 järjestys] = d20.jarjestys_koulutusalataso2_koodi
	,[Hakukohteen koulutusala, taso 3 järjestys] = d20.jarjestys_koulutusalataso3_koodi
	,[Hakukohteen koulutusaste 2002 järjestys] = d20.jarjestys_koulutusaste2002_koodi
	,[Hakukohteen koulutusala 2002 järjestys] = d20.jarjestys_koulutusala2002_koodi
	,[Hakukohteen opintoala 2002 järjestys] = d20.jarjestys_opintoala2002_koodi
	,[Hakukohteen koulutusala 1995 järjestys] = d20.jarjestys_opintoala1995_koodi
	,[Hakukohteen opintoala 1995 järjestys] = d20.jarjestys_opintoala1995_koodi
	,[Hakukohteen maakunta järjestys] = d19.jarjestys_maakunta_koodi
	,[Hakutyyppi järjestys] = d1.jarjestys_hakutyyppi
	,[Ikä 5v järjestys] = d26.jarjestys_ikaryhma2
	,[Kansalaisuus ryhmä järjestys] = 
			case 
				when d28.maa_koodi = '246' then 1 
				when d28.maa_koodi != '246' and (d28.eumaa_koodi = '1' or d28.etamaa_koodi = '1') then 2
				when d28.maa_koodi in ('-1',999) then 99
				else 3
			end
	,[Koulutuksen kieli järjestys] = d27.kieli_koodi
	,[Opiskelun laajuus järjestys] = d21.jarjestys
	,[Pohjakoulutus järjestys] = case d22.jarjestys when '98' then 'yy' when 'yo' then 'aa' else d22.jarjestys end
	,[Sukupuoli järjestys] = d7.jarjestys_sukupuoli_koodi
	,[Toisen asteen koulutuksen suoritusvuosi järjestys] = case when htt.toisen_asteen_koulutuksen_suoritusvuosi IN ('Tieto puuttuu','0') then '9999' else 9999-CAST(htt.toisen_asteen_koulutuksen_suoritusvuosi AS int) end
	,[Äidinkieli versio1 järjestys] = d8.jarjestys_kieliryhma1
	,[Muun opiskeluoikeuden koulutusala (2002) järjestys] = coalesce(d53.jarjestys_koulutusala2002_koodi,99)
	,[Muun opiskeluoikeuden koulutusaste, taso 1 järjestys] = coalesce(d53.jarjestys_koulutusastetaso1_koodi,99)
	,[Muun opiskeluoikeuden koulutusaste, taso 2 järjestys] = coalesce(d53.jarjestys_koulutusastetaso2_koodi,99)
	,[Muun opiskeluoikeuden koulutusala, taso 1 järjestys] = coalesce(d53.jarjestys_koulutusalataso1_koodi,99)
	,[Muun opiskeluoikeuden koulutusala, taso 2 järjestys] = coalesce(d53.jarjestys_koulutusalataso2_koodi,99)
	,[Muun opiskeluoikeuden koulutusala, taso 3 järjestys] = coalesce(d53.jarjestys_koulutusalataso3_koodi,99)
	,[Muun opiskeluoikeuden koulutusaste järjestys] = coalesce(d53.jarjestys_koulutusaste2002_koodi,99)
	,[Muun opiskeluoikeuden opintoala (2002) järjestys] = coalesce(d53.jarjestys_opintoala2002_koodi,99)
	,[Aiemman tutkinnon koulutusala (2002) järjestys] = coalesce(d54.jarjestys_koulutusala2002_koodi,99)
	,[Aiemman tutkinnon koulutusaste, taso 1 järjestys] = coalesce(d54.jarjestys_koulutusastetaso1_koodi,99)
	,[Aiemman tutkinnon koulutusaste, taso 2 järjestys] = coalesce(d54.jarjestys_koulutusastetaso2_koodi,99)
	,[Aiemman tutkinnon koulutusala, taso 1 järjestys] = coalesce(d54.jarjestys_koulutusalataso1_koodi,99)
	,[Aiemman tutkinnon koulutusala, taso 2 järjestys] = coalesce(d54.jarjestys_koulutusalataso2_koodi,99)
	,[Aiemman tutkinnon koulutusala, taso 3 järjestys] = coalesce(d54.jarjestys_koulutusalataso3_koodi,99)
	,[Aiemman tutkinnon koulutusaste järjestys] = coalesce(d54.jarjestys_koulutusaste2002_koodi,99)
	,[Aiemman tutkinnon opintoala (2002) järjestys] = coalesce(d54.jarjestys_opintoala2002_koodi,99)

FROM dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot f
LEFT JOIN dw.d_haku d1 ON d1.id = f.d_haku_id
LEFT JOIN dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN dw.d_haku_amk_yo d4 on d4.id = f.d_haku_amk_yo_id
LEFT JOIN dw.d_hakuaika d5 on d5.id=f.d_hakuaika_id
--muu opiskeluoikeus ja aiempi tutkinto
LEFT JOIN dw.d_organisaatioluokitus d51 on d51.id=f.d_organisaatioluokitus_muu_korkeakoulu_id
LEFT JOIN dw.d_organisaatioluokitus d52 on d52.id=f.d_organisaatioluokitus_aiempi_tutkinto_korkeakoulu_id
LEFT JOIN dw.d_koulutusluokitus d53 on d53.id=f.d_koulutusluokitus_muu_tutkinto_id
LEFT JOIN dw.d_koulutusluokitus d54 on d54.id=f.d_koulutusluokitus_aiempi_tutkinto_id
LEFT JOIN (
	SELECT 
		hakemus_oid
		,d_hakuaika_id
		,op_oikeus_tai_tutkinto = MAX(op_oikeus_tai_tutkinto) 
	FROM dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_aiemmat_opiskeluoikeudet_ja_tutkinnot
	GROUP BY hakemus_oid,d_hakuaika_id
) d55 on d55.hakemus_oid = f.hakemus_oid and d55.d_hakuaika_id = f.d_hakuaika_id
LEFT JOIN dw.d_kytkin d56 on d56.kytkin_koodi = f.ensi_kertaa_hakeva

--taustatiedot
LEFT JOIN dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_taustatiedot htt on htt.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id = f.f_haku_ja_valinta_hakeneet_korkea_aste_hakijat_id
LEFT JOIN dw.d_sukupuoli d7 ON d7.id = htt.d_sukupuoli_id
LEFT JOIN dw.d_kieli d8 ON d8.id = htt.d_kieli_aidinkieli_id
LEFT JOIN dw.d_pohjakoulutus d22 ON d22.id = htt.d_pohjakoulutuskk_id
LEFT JOIN dw.d_kytkin d11 ON d11.id=htt.d_kytkin_pohjakoulutuskk_ulkomaat_id
LEFT JOIN dw.d_ika d26 ON d26.id=htt.d_ika_id
LEFT JOIN dw.d_maatjavaltiot2 d30 ON d30.id=htt.d_maatjavaltiot_kansalaisuus_id
LEFT JOIN VipunenTK.dbo.d_valtio d28 ON d28.valtio_avain=d30.maatjavaltiot2_koodi
--hakukohde
LEFT JOIN dw.f_haku_ja_valinta_hakeneet_korkea_aste_hakutoiveet ht on ht.hakemus_oid = f.hakemus_oid
LEFT JOIN dw.d_hakukohde d10 ON d10.id = ht.d_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d16a ON d16a.id = ht.d_organisaatio_koulutuksen_jarjestaja_id
LEFT JOIN dw.d_organisaatioluokitus d16b ON d16b.id = ht.d_organisaatio_oppilaitos_id
LEFT JOIN dw.d_organisaatioluokitus d16c ON d16c.id = ht.d_organisaatio_toimipiste_id
LEFT JOIN dw.d_tutkinnon_taso_kk d18 ON d18.id = ht.d_tutkinnon_taso_kk_id
LEFT JOIN dw.d_alueluokitus d19 ON d19.id = ht.d_alueluokitus_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d20 ON d20.id = ht.d_koulutusluokitus_hakukohde_id
LEFT JOIN dw.d_opintojenlaajuus d21 ON d21.id = ht.d_opintojen_laajuus_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d23 ON d23.id = ht.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN dw.d_kieli d27 ON d27.id=ht.d_kieli_koulutus_id
--hakutoiveet
--1
LEFT JOIN dw.d_hakukohde d32 ON d32.id=ht.d_hakukohde_ensisijainen_id
LEFT JOIN dw.d_koulutusluokitus d33 ON d33.id=ht.d_koulutus_ensisijainen_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d33a ON d33a.id=ht.d_organisaatioluokitus_ensisijainen_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d33b ON d33b.id=ht.d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id
--2
LEFT JOIN dw.d_hakukohde d34 ON d34.id=ht.d_hakukohde_toinen_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d35 ON d35.id=ht.d_koulutus_toinen_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d35a ON d35a.id=ht.d_organisaatioluokitus_toinen_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d35b ON d35b.id=ht.d_tutkinnon_aloitussykli_toinen_hakukohde_id
--3
LEFT JOIN dw.d_hakukohde d36 ON d36.id=ht.d_hakukohde_kolmas_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d37 ON d37.id=ht.d_koulutus_kolmas_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d37a ON d37a.id=ht.d_organisaatioluokitus_kolmas_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d37b ON d37b.id=ht.d_tutkinnon_aloitussykli_kolmas_hakukohde_id
--4
LEFT JOIN dw.d_hakukohde d38 ON d38.id=ht.d_hakukohde_neljas_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d39 ON d39.id=ht.d_koulutus_neljas_hakukohde__id
LEFT JOIN dw.d_organisaatioluokitus d39a ON d39a.id=ht.d_organisaatioluokitus_neljas_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d39b ON d39b.id=ht.d_tutkinnon_aloitussykli_neljas_hakukohde_id
--5
LEFT JOIN dw.d_hakukohde d40 ON d40.id=ht.d_hakukohde_viides_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d41 ON d41.id=ht.d_koulutus_viides_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d41a ON d41a.id=ht.d_organisaatioluokitus_viides_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d41b ON d41b.id=ht.d_tutkinnon_aloitussykli_viides_hakukohde_id
--6
LEFT JOIN dw.d_hakukohde d42 ON d42.id=ht.d_hakukohde_kuudes_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d43 ON d43.id=ht.d_koulutus_kuudes_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d43a ON d43a.id=ht.d_organisaatioluokitus_kuudes_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d43b ON d43b.id=ht.d_tutkinnon_aloitussykli_kuudes_hakukohde_id
--vuosikello
LEFT JOIN sa.sa_haku_ja_valinta_vuosikello_korkea_aste d44 on (
	case
		when d1.hakutapa_koodi = '01' and d44.haku_oid = d1.haku_oid then 1
		when d1.hakutapa_koodi != '01' 
			and d44.haku = (CASE WHEN d1.kohdejoukontarkenne_koodi = '3' THEN 'Jatkotutkintohaku' ELSE  'Erillishaku' END)
			and d44.koulutuksen_alkamiskausi = concat(cast(f.koulutuksen_alkamisvuosi as varchar),cast(d2.jarjestys as varchar)) then 1
		else 0
	end
) = 1


WHERE f.loadtime >= COALESCE(d44.hakijat, '9999-12-31') 








GO


