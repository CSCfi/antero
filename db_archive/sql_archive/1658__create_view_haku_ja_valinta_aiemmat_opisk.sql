USE [ANTERO]
GO
/****** Object:  View [dw].[v_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]    Script Date: 4.6.2018 14:42:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot]'))
EXEC dbo.sp_executesql @statement = N'
















CREATE VIEW [dw].[v_haku_ja_valinta_aiemmat_opiskeluoikeudet_tutkinnot] AS





WITH MAIN_QUERY AS (


SELECT  
	
	   [Haku AMK/YO] = d6.selite_fi
	  ,[Haku] = d25.haun_nimi_fi
	  ,[Hakuaika] = coalesce(d33.selite_fi,''Tuntematon'')
	  ,[HakuaikaId] = d33.hakuaikaId
	  ,[Hakuaika alku] = d33.alkuPvm
	  ,[Hakuaika loppu] = d33.loppuPvm
	  ,[Hakukohde] = d10.selite_fi
	  ,[Hakutapa] = case d25.hakutapa_fi when ''Jatkuva haku'' then ''Erillishaku'' else d25.hakutapa_fi end
	  ,[Hakutyyppi] = d25.hakutyyppi_fi
	  ,[Hakukohteen koulutustoimija] = d16a.organisaatio_fi
	  ,[Hakukohteen oppilaitos] = d16b.organisaatio_fi
	  ,[Hakukohteen toimipiste] = coalesce(d16c.organisaatio_fi,d16b.organisaatio_fi)
	  ,[Hakukohteen maakunta] = d19.maakunta_fi
	  ,[Hakukohteen kunta] = d19.kunta_fi
	  ,[Hakukohteen koulutusaste, taso 1] = d20.koulutusastetaso1_fi
	  ,[Hakukohteen koulutusaste, taso 2] = d20.koulutusastetaso2_fi
	  ,[Hakukohteen koulutusala, taso 1] = d20.koulutusalataso1_fi
	  ,[Hakukohteen koulutusala, taso 2] = d20.koulutusalataso2_fi
	  ,[Hakukohteen koulutusala, taso 3] = d20.koulutusalataso3_fi
	  ,[Hakukohteen koulutusaste] = d20.koulutusaste2002_fi
	  ,[Hakukohteen koulutusala 2002] = coalesce(d20.Koulutusala2002_fi,''Tuntematon'')
	  ,[Hakukohteen opintoala 2002] = d20.Opintoala2002_fi
	  ,[Hakukohteen koulutusala 1995] = d20.Opintoala1995_fi
	  ,[Hakukohteen tutkinnon taso] = d18.selite_fi
	  ,[Hakutoive] = f.hakutoive
	  ,[Henkilö OID] = f.henkilo_oid
	  ,[Ikäryhmä] = d26.ikaryhma2_fi
	  ,[Kansalaisuus (ryhmä)] =
				case 
					when d28.maa_koodi = ''246'' then ''Suomi'' 
					when d28.maa_koodi != ''246'' and (d28.eumaa_koodi = ''1'' or d28.etamaa_koodi = ''1'') then ''EU ja ETA''
					when d28.maa_koodi in (''-1'',999) then ''Tieto puuttuu''
					else ''Muut''
				 end
	  ,[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	  ,[Koulutuksen alkamiskausi] = d2.selite_fi
	  ,[Koulutuksen kieli] = d27.kieli_fi
	  ,[Opiskelun laajuus] = d21.selite_fi
	  ,[Pohjakoulutuksen maa] = 
				case 
					when d4.kytkin_koodi = 1 then ''Ulkomaat'' 
					when d4.kytkin_koodi = 0 then ''Suomi'' 
					else d4.kytkin_fi
				end
	  ,[Pohjakoulutus] = d22.selite_fi
	  ,[Sektori] = case when d10.selite_fi like ''Ammatillinen opettajankoulutus%'' then ''Ammattikorkeakoulukoulutus'' else d20.koulutussektori_fi end
	  ,[Sukupuoli] = d7.sukupuoli_fi
	  ,[Toisen asteen koulutuksen suoritusvuosi] = f.toisen_asteen_koulutuksen_suoritusvuosi
	  ,[Tutkinnon aloitussykli (hakukohde)] = d23.selite_fi
	  ,[Äidinkieli] = d8.kieliryhma1_fi
	  ,[Valinnan tila] = f.valinnan_tila
	
	/* Mittarit */
	  ,[Valitut2] = case when f.valinnan_tila in (''HYVAKSYTTY'',''VARASIJALTA_HYVAKSYTTY'',''PERUNUT'') then 1 else 0 end
	  ,[Paikan vastaanottaneet2] = case when f.vastaanoton_tila IN (''VASTAANOTTANUT_SITOVASTI'',''EHDOLLISESTI_VASTAANOTTANUT'') then 1 else 0 end
	  ,[Aloittaneet2] = case when f.ilmoittautumisen_tila in (''LASNA'',''LASNA_KOKO_LUKUVUOSI'',''LASNA_SYKSY'') then 1 else 0 end

	/* Järjestys-kentät */
	  ,[Ensikertainen hakija järjestys] = left(f.ensikertainen_hakija,2)
	  ,[Haku AMK/YO järjestys] = d6.jarjestys_koodi
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
	  ,[Hakutyyppi järjestys] = d25.jarjestys_hakutyyppi
	  ,[Ikä 5v järjestys] = d26.jarjestys_ikaryhma2
	  ,[Kansalaisuus ryhmä järjestys] = 
				case 
					when d28.maa_koodi = ''246'' then 1 
					when d28.maa_koodi != ''246'' and (d28.eumaa_koodi = ''1'' or d28.etamaa_koodi = ''1'') then 2
					when d28.maa_koodi in (''-1'',999) then 99
					else 3
				end
	  ,[Koulutuksen kieli järjestys] = d27.kieli_koodi
	  ,[Opiskelun laajuus järjestys] = d21.jarjestys
	  ,[Pohjakoulutus järjestys] = case d22.jarjestys when ''98'' then ''yy'' when ''yo'' then ''aa'' else d22.jarjestys end
	  ,[Sukupuoli järjestys] = d7.jarjestys_sukupuoli_koodi
	  ,[Toisen asteen koulutuksen suoritusvuosi järjestys] = case when f.toisen_asteen_koulutuksen_suoritusvuosi IN (''Tieto puuttuu'',''0'') then ''9999'' else 9999-CAST(f.toisen_asteen_koulutuksen_suoritusvuosi AS int) end
	  ,[Äidinkieli versio1 järjestys] = d8.jarjestys_kieliryhma1

     
  FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_korkea_aste] f
  LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
  LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
  INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on ((d1.haku_oid=d25.haku_oid and d1.haku_oid is not null) OR (d1.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d2.jarjestys as varchar) and d25.hakutapa_koodi <> ''01'' and d1.haku_oid is null)) and f.loadtime >= d1.hakijat	
  LEFT JOIN ANTERO.dw.d_kytkin d4 ON d4.id=f.d_kytkin_pohjakoulutuskk_ulkomaat_id
  LEFT JOIN ANTERO.dw.d_haku_amk_yo d6 on d6.id = f.d_haku_amk_yo_id
  LEFT JOIN ANTERO.dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
  LEFT JOIN ANTERO.dw.d_kieli d8 ON d8.id = f.d_kieli_aidinkieli_id
  LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16a ON d16a.id = f.d_organisaatio_koulutuksen_jarjestaja_id
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatio_toimipiste_id
  LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d18 ON d18.id = f.d_tutkinnon_taso_kk_id
  LEFT JOIN ANTERO.dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
  LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
  LEFT JOIN ANTERO.dw.d_opintojenlaajuus d21 ON d21.id = f.d_opintojen_laajuus_id
  LEFT JOIN ANTERO.dw.d_pohjakoulutus d22 ON d22.id = f.d_pohjakoulutuskk_id
  LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d23 ON d23.id = f.d_tutkinnon_aloitussykli_kk_id
  LEFT JOIN ANTERO.dw.d_ika d26 ON d26.id=f.d_ika_id
  LEFT JOIN ANTERO.dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id
  LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d30 ON d30.id=f.d_maatjavaltiot_kansalaisuus_id
  LEFT JOIN VipunenTK.dbo.d_valtio d28 ON d28.valtio_avain=d30.maatjavaltiot2_koodi
  LEFT JOIN ANTERO.dw.d_hakuaika d33 on d33.id=f.d_hakuaika_id


)

SELECT 	   
	 
	 /* Hakumuuttujat */
	   [Haku]
	  ,[Hakuaika]
	  ,[Hakukohde]
	  ,[Hakutapa]
	  ,[Hakutyyppi] 

	 /* Henkilömuuttujat */
	  ,[Ensikertaisena kohdeltava hakija] =	case when (max_opisk_alkamisPvm between ''2014-08-01'' and MAIN_QUERY.[Hakuaika loppu]) or (max_tutk_suoritusPvm <= MAIN_QUERY.[Hakuaika loppu]) then ''Ei ensikertainen hakija'' else ''Ensikertainen hakija'' end
	  /* case when ((select max(REPLACE(convert(varchar(10), DATEADD(MILLISECOND, alkamispaivamaara % 86400000, DATEADD(DAY, alkamispaivamaara / 86400000, ''1970-01-01'')),102),''.'',''-'')) from ANTERO.sa.sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet where oid=MAIN_QUERY.henkilo_oid and REPLACE(convert(varchar(10), DATEADD(MILLISECOND, alkamispaivamaara % 86400000, DATEADD(DAY, alkamispaivamaara / 86400000, ''1970-01-01'')),102),''.'',''-'')<=[Hakuaika loppu]) between ''2014-08-01'' and [Hakuaika loppu]) or ((select max(REPLACE(convert(varchar(10), dateadd(S, suorituspaivamaara/1000, ''1970-01-01''),102),''.'',''-'')) from ANTERO.sa.sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot where oid=MAIN_QUERY.henkilo_oid and REPLACE(convert(varchar(10), dateadd(S, suorituspaivamaara/1000, ''1970-01-01''),102),''.'',''-'') <= [Hakuaika loppu]) <= [Hakuaika loppu]) then ''Ei ensikertainen hakija'' else ''Ensikertainen hakija'' end  */
	  ,[Haku AMK/YO]
	  ,MAIN_QUERY.[Henkilö OID]
	  ,[Ikäryhmä]
	  ,[Kansalaisuus (ryhmä)]
	  ,[Sukupuoli]
	  ,[Pohjakoulutuksen maa] 
	  ,[Pohjakoulutus] 
	  ,[Toisen asteen koulutuksen suoritusvuosi]
	  ,[Äidinkieli]

	 /* Koulutusmuuttujat */
	  ,[Hakukohteen maakunta]
	  ,[Hakukohteen kunta]
	  ,[Hakukohteen koulutusaste, taso 1]
	  ,[Hakukohteen koulutusaste, taso 2]
	  ,[Hakukohteen koulutusala, taso 1]
	  ,[Hakukohteen koulutusala, taso 2]
	  ,[Hakukohteen koulutusala, taso 3]
	  ,[Hakukohteen koulutusaste] 
	  ,[Hakukohteen koulutusala 2002] 
	  ,[Hakukohteen opintoala 2002] 
	  ,[Hakukohteen koulutusala 1995]
	  ,[Hakukohteen tutkinnon taso]
	  ,[Hakutoive]
	  ,[Koulutuksen alkamisvuosi]
	  ,[Koulutuksen alkamiskausi] 
	  ,[Koulutuksen kieli]
	  ,[Opiskelun laajuus] 
	  ,[Sektori]
	  ,[Tutkinnon aloitussykli (hakukohde)]

	 /* Organisaatiomuuttujat */
	  ,[Hakukohteen koulutustoimija] 
	  ,[Hakukohteen oppilaitos]
	  ,[Hakukohteen toimipiste] 

	/* Muut opiskeluoikeudet */
	  ,[Muun opiskeluoikeuden tavoitetutkinto] = coalesce(d34.koulutusluokitus_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden koulutusaste, taso 1] = coalesce(d34.koulutusastetaso1_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden koulutusaste, taso 2] = coalesce(d34.koulutusastetaso2_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden koulutusala, taso 1] = coalesce(d34.koulutusalataso1_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden koulutusala, taso 2] = coalesce(d34.koulutusalataso2_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden koulutusala, taso 3] = coalesce(d34.koulutusalataso3_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden koulutusala (2002)] = coalesce(d34.koulutusala2002_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden koulutusala (1995)] = coalesce(d34.opintoala1995_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden opintoala (2002)] = coalesce(d34.opintoala2002_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden koulutusaste] = coalesce(d34.koulutusaste2002_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden aloitusvuosi] = coalesce(cast(year(opisk_alkamisPvm) as varchar(50)),''Ei aiempaa opiskeluoikeutta'')
	  ,[Muun opiskeluoikeuden korkeakoulu] = coalesce(d28a.organisaatio_fi,''Ei aiempaa opiskeluoikeutta'') 
  	  ,[Muu opiskeluoikeus voimassa] =  case when opisk_paattymisPvm > MAIN_QUERY.[Hakuaika loppu] or (opisk_alkamisPvm is not null and opisk_paattymisPvm is null) then ''On voimassa'' when opisk_paattymisPvm <= MAIN_QUERY.[Hakuaika loppu] then ''Ei voimassa'' else ''Ei aiempaa opiskeluoikeutta'' end
			
	/* Aiemmat tutkinnot */
	  ,[Aiempi tutkinto] = coalesce(d35.koulutusluokitus_fi,''Ei aiempaa tutkintoa'')
	  ,[Aiemman tutkinnon koulutusaste, taso 1] = coalesce(d35.koulutusastetaso1_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Aiemman tutkinnon koulutusaste, taso 2] = coalesce(d35.koulutusastetaso2_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Aiemman tutkinnon koulutusala, taso 1] = coalesce(d35.koulutusalataso1_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Aiemman tutkinnon koulutusala, taso 2] = coalesce(d35.koulutusalataso2_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Aiemman tutkinnon koulutusala, taso 3] = coalesce(d35.koulutusalataso3_fi,''Ei aiempaa opiskeluoikeutta'')
	  ,[Aiemman tutkinnon koulutusala (2002)] = coalesce(d35.koulutusala2002_fi,''Ei aiempaa tutkintoa'')
	  ,[Aiemman tutkinnon koulutusala (1995)] = coalesce(d35.opintoala1995_fi,''Ei aiempaa tutkintoa'')
	  ,[Aiemman tutkinnon opintoala (2002)] = coalesce(d35.opintoala2002_fi,''Ei aiempaa tutkintoa'')
	  ,[Aiemman tutkinnon koulutusaste] = coalesce(d35.koulutusaste2002_fi,''Ei aiempaa tutkintoa'')
	  ,[Aiemman tutkinnon suoritusvuosi] = coalesce(cast(YEAR(tutk_suoritusPvm) as varchar(50)),''Ei aiempaa tutkintoa'')
	  ,[Aiemman tutkinnon korkeakoulu] = coalesce(d29a.organisaatio_fi,''Ei aiempaa tutkintoa'')
	
	/* Mittarit */
	  ,[Valitut2] 
	  ,[Paikan vastaanottaneet2] 
	  ,[Aloittaneet2]

	/* Järjestys-kentät */
	  ,[Ensikertainen hakija järjestys]
	  ,[Haku AMK/YO järjestys] 
	  ,[Hakukohteen koulutusaste, taso 1 järjestys] 
	  ,[Hakukohteen koulutusaste, taso 2 järjestys]
	  ,[Hakukohteen koulutusala, taso 1 järjestys] 
	  ,[Hakukohteen koulutusala, taso 2 järjestys] 
	  ,[Hakukohteen koulutusala, taso 3 järjestys]
 	  ,[Hakukohteen koulutusaste 2002 järjestys]
 	  ,[Hakukohteen koulutusala 2002 järjestys]
 	  ,[Hakukohteen opintoala 2002 järjestys] 
 	  ,[Hakukohteen koulutusala 1995 järjestys]
 	  ,[Hakukohteen opintoala 1995 järjestys]
 	  ,[Hakukohteen maakunta järjestys]
	  ,[Hakutyyppi järjestys]
	  ,[Ikä 5v järjestys]
	  ,[Kansalaisuus ryhmä järjestys]
	  ,[Koulutuksen kieli järjestys]
	  ,[Opiskelun laajuus järjestys]
	  ,[Pohjakoulutus järjestys]
	  ,[Sukupuoli järjestys]
	  ,[Toisen asteen koulutuksen suoritusvuosi järjestys]
	  ,[Äidinkieli versio1 järjestys]
	  ,[Muun opiskeluoikeuden koulutusala (2002) järjestys] = coalesce(d34.jarjestys_koulutusala2002_koodi,99)
	  ,[Muun opiskeluoikeuden koulutusaste, taso 1 järjestys] = coalesce(d34.jarjestys_koulutusastetaso1_koodi,99)
	  ,[Muun opiskeluoikeuden koulutusaste, taso 2 järjestys] = coalesce(d34.jarjestys_koulutusastetaso2_koodi,99)
	  ,[Muun opiskeluoikeuden koulutusala, taso 1 järjestys] = coalesce(d34.jarjestys_koulutusalataso1_koodi,99)
	  ,[Muun opiskeluoikeuden koulutusala, taso 2 järjestys] = coalesce(d34.jarjestys_koulutusalataso2_koodi,99)
	  ,[Muun opiskeluoikeuden koulutusala, taso 3 järjestys] = coalesce(d34.jarjestys_koulutusalataso3_koodi,99)
	  ,[Muun opiskeluoikeuden koulutusaste järjestys] = coalesce(d34.jarjestys_koulutusaste2002_koodi,99)
	  ,[Muun opiskeluoikeuden opintoala (2002) järjestys] = coalesce(d34.jarjestys_opintoala2002_koodi,99)
	  ,[Aiemman tutkinnon koulutusala (2002) järjestys] = coalesce(d35.jarjestys_koulutusala2002_koodi,99)
	  ,[Aiemman tutkinnon koulutusaste, taso 1 järjestys] = coalesce(d35.jarjestys_koulutusastetaso1_koodi,99)
	  ,[Aiemman tutkinnon koulutusaste, taso 2 järjestys] = coalesce(d35.jarjestys_koulutusastetaso2_koodi,99)
	  ,[Aiemman tutkinnon koulutusala, taso 1 järjestys] = coalesce(d35.jarjestys_koulutusalataso1_koodi,99)
	  ,[Aiemman tutkinnon koulutusala, taso 2 järjestys] = coalesce(d35.jarjestys_koulutusalataso2_koodi,99)
	  ,[Aiemman tutkinnon koulutusala, taso 3 järjestys] = coalesce(d35.jarjestys_koulutusalataso3_koodi,99)
	  ,[Aiemman tutkinnon koulutusaste järjestys] = coalesce(d35.jarjestys_koulutusaste2002_koodi,99)
	  ,[Aiemman tutkinnon opintoala (2002) järjestys] = coalesce(d35.jarjestys_opintoala2002_koodi,99)

FROM MAIN_QUERY 

LEFT JOIN ( 
               SELECT 
					 oid as henkilo_oid
					,korkeakoulu
					,tavoitetutkinto
					,REPLACE(convert(varchar(10), dateadd(S, alkamispaivamaara/1000, ''1970-01-01''),102),''.'',''-'') as opisk_alkamisPvm
					,case when paattymispaivamaara is not null then REPLACE(convert(varchar(10), DATEADD(MILLISECOND, paattymispaivamaara % 86400000, DATEADD(DAY, paattymispaivamaara / 86400000, ''1970-01-01'')),102),''.'',''-'') else null end as opisk_paattymisPvm
               FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet] 
           )   AS OP ON OP.henkilo_oid = MAIN_QUERY.[Henkilö OID] and opisk_alkamisPvm<=MAIN_QUERY.[Hakuaika loppu] --tähän hakuaika

LEFT JOIN (
				SELECT distinct
					 [Henkilö OID]
					,HakuaikaId
					,MAX(REPLACE(convert(varchar(10), dateadd(S, alkamispaivamaara/1000, ''1970-01-01''),102),''.'',''-'')) AS max_opisk_alkamisPvm
					,MAX(REPLACE(convert(varchar(10), dateadd(S, suorituspaivamaara/1000, ''1970-01-01''),102),''.'',''-'')) AS max_tutk_suoritusPvm
				FROM MAIN_QUERY
				LEFT JOIN ANTERO.sa.sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet o on o.oid=[Henkilö OID] and REPLACE(convert(varchar(10), dateadd(S, alkamispaivamaara/1000, ''1970-01-01''),102),''.'',''-'') <= [Hakuaika loppu]
				LEFT JOIN ANTERO.sa.sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot t on t.oid=[Henkilö OID] and REPLACE(convert(varchar(10), dateadd(S, suorituspaivamaara/1000, ''1970-01-01''),102),''.'',''-'') <= [Hakuaika loppu] 
				GROUP BY [Henkilö OID],HakuaikaId
		  ) AS OPTU ON OPTU.[Henkilö OID] = MAIN_QUERY.[Henkilö OID] and OPTU.HakuaikaId=MAIN_QUERY.HakuaikaId

LEFT JOIN (
               SELECT 
					 oid as henkilo_oid
					,korkeakoulu
					,tutkinto
					,REPLACE(convert(varchar(10), dateadd(S, suorituspaivamaara/1000, ''1970-01-01''),102),''.'',''-'') as tutk_suoritusPvm
               FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot]
          )	   AS TU ON TU.henkilo_oid = MAIN_QUERY.[Henkilö OID] and tutk_suoritusPvm<=MAIN_QUERY.[Hakuaika loppu]

LEFT JOIN ANTERO.dw.d_organisaatio d28a on d28a.organisaatio_koodi=OP.korkeakoulu
LEFT JOIN ANTERO.dw.d_organisaatio d29a on d29a.organisaatio_koodi=TU.korkeakoulu
LEFT JOIN ANTERO.dw.d_koulutusluokitus d34 on d34.koulutusluokitus_koodi=OP.tavoitetutkinto
LEFT JOIN ANTERO.dw.d_koulutusluokitus d35 on d35.koulutusluokitus_koodi=TU.tutkinto




' 
