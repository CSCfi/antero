USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]    Script Date: 3.10.2025 10.22.36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot] AS

SELECT 
	 
	/* Hakumuuttujat */
	 [Haku] = d1.haun_nimi_fi
	,[Hakuaika] = coalesce(coalesce(d5.selite_fi,d5b.selite_fi),'Tieto puuttuu')
	,d5.[hakuaikaId]
	,[Hakuaika alku] = coalesce(d5.alkuPvm, d5b.alkuPvm)
	,[Hakuaika loppu] = coalesce(d5.loppuPvm, d5b.loppuPvm)
	,[Hakukohde] = d10.selite_fi
	,[Hakutapa] = case d1.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d1.hakutapa_fi end
	,f.hakutoive as Hakutoive
	,[Hakutyyppi] = d1.hakutyyppi_fi
	,f.[hakemus_oid]
	,d5.id as d_hakuaika_id
	,CASE
		WHEN [Valitut2] = 1 or [Paikan vastaanottaneet2] = 1 THEN d90.selite_fi
		ELSE 'Ei valittu'
	END as 'Valintatapajonon tyyppi'

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
	,[Pohjakoulutuksen maa (priorisoitu)*] = 
		case 
			when d11b.kytkin_koodi = 1 then 'Suomi' 
			when d11b.kytkin_koodi = 0 then 'Ulkomaat' 
			else coalesce(d11b.kytkin_fi, 'Tieto puuttuu')
		end
	,[Kansainvälinen opiskelija] = 
		case
			when d11b.kytkin_koodi = 1 then 'Ei' 
			when d11b.kytkin_koodi = 0 then 'Kyllä' 
			when d28.maa = 'Suomi' then 'Ei'
			when COALESCE(d28.maa, 'Tieto puuttuu') = 'Tieto puuttuu' then 'Tieto puuttuu'
			when d28.maa <> 'Suomi' then 'Kyllä'
			else 'Tieto puuttuu'
		end
	,[Pohjakoulutus] = d22.selite_fi
	,[Sukupuoli] = d7.sukupuoli_fi
	,[Toisen asteen koulutuksen suoritusvuosi] = f.toisen_asteen_koulutuksen_suoritusvuosi
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
	,[Pääasiallinen tutkinto (hakukohde)] = d20.koulutusluokitus_fi
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
										when (muu_paattymispvm > coalesce(d5.loppuPvm, d5b.loppuPvm)) or (f.muu_alkamispvm is not null and muu_paattymispvm is null) then 'On voimassa' 
										when (muu_paattymispvm <= coalesce(d5.loppuPvm, d5b.loppuPvm)) then 'Ei voimassa' 
										else 'Ei aiempaa opiskeluoikeutta' 
									end
	,[Muu opiskeluoikeus voimassa (priorisoitu)] =  case 
										when (muu_paattymispvm_prio > coalesce(d5.loppuPvm, d5b.loppuPvm)) or (f.muu_alkamispvm is not null and muu_paattymispvm_prio is null) then 'On voimassa' 
										when (muu_paattymispvm_prio <= coalesce(d5.loppuPvm, d5b.loppuPvm)) then 'Ei voimassa' 
										else 'Ei aiempaa opiskeluoikeutta' 
									end
	,[Muun opiskeluoikeuden alkupvm] = f.muu_alkamispvm
	,[Tuorein muun opiskeluoikeuden aloitusvuosi] = coalesce(cast(year(f.tuorein_muu_oo_alkamispvm) as varchar(50)),'Ei aiempaa opiskeluoikeutta')

	,CASE WHEN d51.id is null THEN 'Ei aiempaa opiskeluoikeutta' ELSE d70.kytkin_fi END as 'Muun opiskeluoikeuden koulutusala, taso 1 sama kuin hakukohteen koulutusala, taso 1'
	,CASE WHEN d51.id is null THEN 'Ei aiempaa opiskeluoikeutta' ELSE d71.kytkin_fi END as 'Muun opiskeluoikeuden koulutusala, taso 2 sama kuin hakukohteen koulutusala, taso 2'
	,CASE WHEN d51.id is null THEN 'Ei aiempaa opiskeluoikeutta' ELSE d72.kytkin_fi END as 'Muun opiskeluoikeuden koulutusala, taso 3 sama kuin hakukohteen koulutusala, taso 3'
	,CASE WHEN d51.id is null THEN 'Ei aiempaa opiskeluoikeutta' ELSE d73.kytkin_fi END as 'Muun opiskeluoikeuden koulutusaste, taso 2 sama kuin hakukohteen koulutusaste, taso 2'
	,CASE WHEN d51.id is null THEN 'Ei aiempaa opiskeluoikeutta' ELSE d74.kytkin_fi END as 'Muun opiskeluoikeuden tavoitetutkinto sama kuin hakukohteen tavoitetutkinto'
	,CASE WHEN d51.id is null THEN 'Ei aiempaa opiskeluoikeutta' ELSE d75.kytkin_fi END as 'Muun opiskeluoikeuden korkeakoulu sama kuin hakukohteen korkeakoulu'
	,CASE 
		WHEN muun_opintooikeuden_vertailu = 6 THEN 'Aiemmassa opiskeluoikeudessa sama tutkinto, sama korkeakoulu'
		WHEN muun_opintooikeuden_vertailu = 5 THEN 'Aiemmassa opiskeluoikeudessa sama ala, sama korkeakoulu'
		WHEN muun_opintooikeuden_vertailu = 4 THEN 'Aiemmassa opiskeluoikeudessa eri ala, sama korkeakoulu'
		WHEN muun_opintooikeuden_vertailu = 3 THEN 'Aiemmassa opiskeluoikeudessa sama ala, eri korkeakoulu'
		WHEN muun_opintooikeuden_vertailu = 2 THEN 'Aiemmassa opiskeluoikeudessa eri ala, eri korkeakoulu'
		WHEN muun_opintooikeuden_vertailu = 1 THEN 'Ei aiempaa opiskeluoikeutta'
	END as 'Muun opiskeluoikeuden vertailu'	
		
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
	,[Tuorein aiemman tutkinnon suoritusvuosi] = coalesce(cast(YEAR(f.tuorein_aiempi_tutkinto_suorituspvm) as varchar(50)),'Ei aiempaa tutkintoa')

	,CASE WHEN d52.id is null THEN 'Ei aiempaa tutkintoa' ELSE d70.kytkin_fi END as 'Aiemman tutkinnon koulutusala, taso 1 sama kuin hakukohteen koulutusala, taso 1'
	,CASE WHEN d52.id is null THEN 'Ei aiempaa tutkintoa' ELSE d71.kytkin_fi END as 'Aiemman tutkinnon koulutusala, taso 2 sama kuin hakukohteen koulutusala, taso 2'
	,CASE WHEN d52.id is null THEN 'Ei aiempaa tutkintoa' ELSE d72.kytkin_fi END as 'Aiemman tutkinnon koulutusala, taso 3 sama kuin hakukohteen koulutusala, taso 3'
	,CASE WHEN d52.id is null THEN 'Ei aiempaa tutkintoa' ELSE d73.kytkin_fi END as 'Aiemman tutkinnon koulutusaste, taso 2 sama kuin hakukohteen koulutusaste, taso 2'
	,CASE WHEN d52.id is null THEN 'Ei aiempaa tutkintoa' ELSE d74.kytkin_fi END as 'Aiempi tutkinto sama kuin hakukohteen tavoitetutkinto'
	,CASE WHEN d52.id is null THEN 'Ei aiempaa tutkintoa' ELSE d75.kytkin_fi END as 'Aiemman tutkinnon korkeakoulu sama kuin hakukohteen korkeakoulu'
	,CASE 
		WHEN aiemman_tutkinnon_vertailu = 6 THEN 'Sama aiempi tutkinto, sama korkeakoulu'
		WHEN aiemman_tutkinnon_vertailu = 5 THEN 'Aiemmalla tutkinnolla sama ala, sama korkeakoulu'
		WHEN aiemman_tutkinnon_vertailu = 4 THEN 'Aiemmalla tutkinnolla eri ala, sama korkeakoulu'
		WHEN aiemman_tutkinnon_vertailu = 3 THEN 'Aiemmalla tutkinnolla sama ala, eri korkeakoulu'
		WHEN aiemman_tutkinnon_vertailu = 2 THEN 'Aiemmalla tutkinnolla eri ala, eri korkeakoulu'
		WHEN aiemman_tutkinnon_vertailu = 1 THEN 'Ei aiempaa tutkintoa'
	END as 'Aiemman tutkinnon vertailu'	

	,[Hakenut ensikertaa korkeakouluun] = 
		case
			when f.ensi_kertaa_hakeva = 0 then d56.kytkin_fi
			when f.koulutuksen_alkamisvuosi < 2018 then 'Tieto puuttuu'
			ELSE d56.kytkin_fi
		end
	
	,[aidosti_ensikertainen]
	,ensi_kertaa_hakeva as ensikertaa_hakeva
	,[ensikertaisena_kohdeltava]
	,[Ensikertaisena kohdeltava hakija] =	
		case 
			when ensikertaisena_kohdeltava <> 1 then 'Ei ensikertainen hakija' 
			else 'Ensikertainen hakija' 
		end
	/* Mittarit */
	,[Valitut2]
	,[Paikan vastaanottaneet2]
	,[Aloittaneet2]

	/* Koodimuuttujat */
	,[Koodit Pääasiallinen koulutusnimike] = d20.koulutusluokitus_koodi
	,[Koodit Muun opiskeluoikeuden tavoitetutkinto] = d53.koulutusluokitus_koodi
	,[Koodit Aiempi tutkinto] = d35.koulutusluokitus_koodi

	/* Järjestys-kentät */
	,CASE
		WHEN [Valitut2] = 1 or [Paikan vastaanottaneet2] = 1 THEN d90.jarjestys
		ELSE 'zz'
	END as 'Valintatapajonon tyyppi järjestys'
	,[Ensikertainen hakija järjestys] = NULL --eft(f.ensikertainen_hakija,2)
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
	,[Toisen asteen koulutuksen suoritusvuosi järjestys] = case when f.toisen_asteen_koulutuksen_suoritusvuosi IN ('Tieto puuttuu','0') then '9999' else 9999-CAST(f.toisen_asteen_koulutuksen_suoritusvuosi AS int) end
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
	,[Aiemman tutkinnon vertailu järjestys] = f.aiemman_tutkinnon_vertailu
	,[Muun opiskeluoikeuden vertailu järjestys] = f.muun_opintooikeuden_vertailu
	,CASE WHEN d52.id is null THEN 3 ELSE d70.jarjestys_kytkin_koodi END as 'Aiemman tutkinnon koulutusala, taso 1 sama kuin hakukohteen koulutusala, taso 1 järjestys'
	,CASE WHEN d52.id is null THEN 3 ELSE d71.jarjestys_kytkin_koodi END as 'Aiemman tutkinnon koulutusala, taso 2 sama kuin hakukohteen koulutusala, taso 2 järjestys'
	,CASE WHEN d52.id is null THEN 3 ELSE d72.jarjestys_kytkin_koodi END as 'Aiemman tutkinnon koulutusala, taso 3 sama kuin hakukohteen koulutusala, taso 3 järjestys'
	,CASE WHEN d52.id is null THEN 3 ELSE d73.jarjestys_kytkin_koodi END as 'Aiemman tutkinnon koulutusaste, taso 2 sama kuin hakukohteen koulutusaste, taso 2 järjestys'
	,CASE WHEN d52.id is null THEN 3 ELSE d74.jarjestys_kytkin_koodi END as 'Aiempi tutkinto sama kuin hakukohteen tavoitetutkinto järjestys'
	,CASE WHEN d52.id is null THEN 3 ELSE d75.jarjestys_kytkin_koodi END as 'Aiemman tutkinnon korkeakoulu sama kuin hakukohteen korkeakoulu järjestys'
	,CASE WHEN d51.id is null THEN 3 ELSE d70.jarjestys_kytkin_koodi END as 'Muun opiskeluoikeuden koulutusala, taso 1 sama kuin hakukohteen koulutusala, taso 1 järjestys'
	,CASE WHEN d51.id is null THEN 3 ELSE d71.jarjestys_kytkin_koodi END as 'Muun opiskeluoikeuden koulutusala, taso 2 sama kuin hakukohteen koulutusala, taso 2 järjestys'
	,CASE WHEN d51.id is null THEN 3 ELSE d72.jarjestys_kytkin_koodi END as 'Muun opiskeluoikeuden koulutusala, taso 3 sama kuin hakukohteen koulutusala, taso 3 järjestys'
	,CASE WHEN d51.id is null THEN 3 ELSE d73.jarjestys_kytkin_koodi END as 'Muun opiskeluoikeuden koulutusaste, taso 2 sama kuin hakukohteen koulutusaste, taso 2 järjestys'
	,CASE WHEN d51.id is null THEN 3 ELSE d74.jarjestys_kytkin_koodi END as 'Muun opiskeluoikeuden tavoitetutkinto sama kuin hakukohteen tavoitetutkinto järjestys'
	,CASE WHEN d51.id is null THEN 3 ELSE d75.jarjestys_kytkin_koodi END as 'Muun opiskeluoikeuden korkeakoulu sama kuin hakukohteen korkeakoulu järjestys'
	
FROM dw.f_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot f
LEFT JOIN dw.d_haku d1 ON d1.id = f.d_haku_id
LEFT JOIN dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN dw.d_haku_amk_yo d4 on d4.id = f.d_haku_amk_yo_id
LEFT JOIN dw.d_hakuaika d5 on d5.id=f.d_hakuaika_id
LEFT JOIN dw.d_hakuaika_kouta d5b on f.d_hakuaika_kouta_id=d5b.id
--muu opiskeluoikeus ja aiempi tutkinto
LEFT JOIN dw.d_organisaatioluokitus d51 on d51.id=f.d_organisaatioluokitus_muu_oo_id
LEFT JOIN dw.d_organisaatioluokitus d52 on d52.id=f.d_organisaatioluokitus_aiempi_tutk_id
LEFT JOIN dw.d_koulutusluokitus d53 on d53.id=f.d_koulutusluokitus_muu_oo_id
LEFT JOIN dw.d_koulutusluokitus d54 on d54.id=f.d_koulutusluokitus_aiempi_tutk_id
LEFT JOIN dw.d_kytkin d56 on d56.kytkin_koodi = f.ensi_kertaa_hakeva
--taustatiedot
LEFT JOIN dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d8 ON d8.id = f.d_aidinkieli_id
LEFT JOIN dw.d_pohjakoulutus d22 ON d22.id = f.d_pohjakoulutus_id
LEFT JOIN dw.d_kytkin d11 ON d11.id=f.d_kytkin_pohjakoulutuksen_maa_id
LEFT JOIN dw.d_kytkin d11b ON d11b.id=f.d_kytkin_pohjakoulutuksen_maa_priorisoitu_id
LEFT JOIN dw.d_ika d26 ON d26.id=f.d_ika_id
LEFT JOIN VipunenTK.dbo.d_valtio d28 ON d28.id=f.d_kansalaisuus_id
--hakukohde
LEFT JOIN dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatioluokitus_koulutustoimija_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatioluokitus_oppilaitos_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatioluokitus_toimipiste_hakukohde_id
LEFT JOIN dw.d_tutkinnon_taso_kk d18 ON d18.id = f.d_tutkinnon_taso_hakukohde_id
LEFT JOIN dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
LEFT JOIN dw.d_opintojenlaajuus d21 ON d21.id = f.d_opiskelun_laajuus_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d23 ON d23.id = f.d_aloitussykli_hakukohde_id
LEFT JOIN dw.d_kieli d27 ON d27.id=f.d_koulutuksen_kieli_id
--hakutoiveet
--1
LEFT JOIN dw.d_hakukohde d32 ON d32.id=f.d_hakukohde_1_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d33 ON d33.id=f.d_koulutusluokitus_1_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d33a ON d33a.id=f.d_organisaatioluokitus_1_hakukohde_id  
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d33b ON d33b.id=f.d_aloitussykli_1_hakukohde_id
--2
LEFT JOIN dw.d_hakukohde d34 ON d34.id=f.d_hakukohde_2_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d35 ON d35.id=f.d_koulutusluokitus_2_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d35a ON d35a.id=f.d_organisaatioluokitus_2_hakukohde_id 
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d35b ON d35b.id=f.d_aloitussykli_2_hakukohde_id
--3
LEFT JOIN dw.d_hakukohde d36 ON d36.id=f.d_hakukohde_3_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d37 ON d37.id=f.d_koulutusluokitus_3_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d37a ON d37a.id=f.d_organisaatioluokitus_3_hakukohde_id 
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d37b ON d37b.id=f.d_aloitussykli_3_hakukohde_id
--4
LEFT JOIN dw.d_hakukohde d38 ON d38.id=f.d_hakukohde_4_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d39 ON d39.id=f.d_koulutusluokitus_4_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d39a ON d39a.id=f.d_organisaatioluokitus_4_hakukohde_id 
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d39b ON d39b.id=f.d_aloitussykli_4_hakukohde_id
--5
LEFT JOIN dw.d_hakukohde d40 ON d40.id=f.d_hakukohde_5_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d41 ON d41.id=f.d_koulutusluokitus_5_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d41a ON d41a.id=f.d_organisaatioluokitus_5_hakukohde_id 
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d41b ON d41b.id=f.d_aloitussykli_5_hakukohde_id
--6
LEFT JOIN dw.d_hakukohde d42 ON d42.id=f.d_hakukohde_6_hakukohde_id
LEFT JOIN dw.d_koulutusluokitus d43 ON d43.id=f.d_koulutusluokitus_6_hakukohde_id
LEFT JOIN dw.d_organisaatioluokitus d43a ON d43a.id=f.d_organisaatioluokitus_6_hakukohde_id 
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d43b ON d43b.id=f.d_aloitussykli_6_hakukohde_id

LEFT JOIN dw.d_kytkin d70 on d70.kytkin_koodi = f.muu_oo_koulutusala_taso_1_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d71 on d71.kytkin_koodi = f.muu_oo_koulutusala_taso_2_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d72 on d72.kytkin_koodi = f.muu_oo_koulutusala_taso_3_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d73 on d73.kytkin_koodi = f.muu_oo_koulutusaste_taso_2_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d74 on d74.kytkin_koodi = f.muu_oo_tavoitetutkinto_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d75 on d75.kytkin_koodi = f.muu_oo_korkeakoulu_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d76 on d76.kytkin_koodi = f.aiempi_tutk_koulutusala_taso_1_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d77 on d77.kytkin_koodi = f.aiempi_tutk_koulutusala_taso_2_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d78 on d78.kytkin_koodi = f.aiempi_tutk_koulutusala_taso_3_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d79 on d79.kytkin_koodi = f.aiempi_tutk_koulutusaste_taso_2_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d80 on d80.kytkin_koodi = f.aiempi_tutk_tavoitetutkinto_sama_kuin_hakukohde
LEFT JOIN dw.d_kytkin d81 on d81.kytkin_koodi = f.aiempi_tutk_korkeakoulu_sama_kuin_hakukohde
LEFT JOIN dw.f_haku_ja_valinta_korkea_aste_valintatapajonot f3 on f3.henkilo_oid = f.henkilo_oid and f3.d_hakukohde_id = f.d_hakukohde_id
LEFT JOIN dw.d_valintatapajono d90 on d90.id = f3.d_valintatapajono_id

GO


