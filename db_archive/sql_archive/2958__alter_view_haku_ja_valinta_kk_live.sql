USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_live]    Script Date: 2.4.2020 12:04:55 ******/
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
	  ,[Ensikertaisena kohdeltava hakija] = f.ensikertainen_hakija	
	  ,[Hakemus OID] = f.hakemus_oid
	  ,[Haku AMK/YO] = d46.selite_fi
	  ,[Haku] = d25.haun_nimi_fi
	  ,[Hakuaika] = 
			case 
				when d25.hakutapa_koodi = '01' and d25.hakutyyppi_koodi = '01' and d2.koodi = 'S' /* d31.selite_fi in ('Haku 1 / Hakuaika 1','Haku 2 / Hakuaika 2')*/ then d31.selite_fi 
				else 'Muu kuin kevään yhteishaun varsinainen haku'
			end
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

	  ,[Henkilö OID] = henkilo_oid
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
	  ,[Koulutuksen kieli] = d27.kieli_fi
	  ,[Opiskelun laajuus] = d3.selite_fi
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
	  ,[Toisen asteen koulutuksen suoritusvuosi] = case d_pohjakoulutuskk_id when '7' then  f.toisen_asteen_koulutuksen_suoritusvuosi when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi Else 'Tieto puuttuu' end
	  ,[Ylioppilastutkinnon suoritusvuosi] = f.ylioppilastutkinnon_suoritusvuosi
	  ,[Aloittanut opinnot toisen asteen koulutuksen suoritusvuonna]=
	  Case
		when (case d_pohjakoulutuskk_id when '7' then  f.toisen_asteen_koulutuksen_suoritusvuosi when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi Else 'Tieto puuttuu' end )='Tieto puuttuu' AND f.ylioppilastutkinnon_suoritusvuosi ='Tieto puuttuu' 
			then 'Tieto puuttuu'
		else
		  Case CAST(koulutuksen_alkamisvuosi as nvarchar)
			when (case d_pohjakoulutuskk_id when '7' then  f.toisen_asteen_koulutuksen_suoritusvuosi when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi Else 'Tieto puuttuu' end)
				then 'Kyllä' 
			when f.ylioppilastutkinnon_suoritusvuosi
				then 'Kyllä' 
			Else 'Ei'
		  End 
	  End
	  	  ,[Aloittanut opinnot ilmoittamansa pohjakoulutuksen suoritusvuonna]=
	  Case
		when (case d_pohjakoulutuskk_id when '7' then  f.toisen_asteen_koulutuksen_suoritusvuosi when '8' then f.toisen_asteen_koulutuksen_suoritusvuosi when '15' then f.toisen_asteen_koulutuksen_suoritusvuosi Else 'Tieto puuttuu' end )='Tieto puuttuu' AND f.ylioppilastutkinnon_suoritusvuosi ='Tieto puuttuu' 
			then 'Tieto puuttuu'
		else
		  Case CAST(koulutuksen_alkamisvuosi as nvarchar)
			when  f.toisen_asteen_koulutuksen_suoritusvuosi
				then 'Kyllä' 
			when f.ylioppilastutkinnon_suoritusvuosi
				then 'Kyllä' 
			Else 'Ei'
		  End 
	  End
	  ,[Tutkinnon taso (hakukohde)] = d45.selite_fi
	  ,[Tutkinnon aloitussykli (hakukohde)] = d44.selite_fi
	  --,[Valinnan tila] = d23.valinnan_tila
	  --,[Vastaanoton tila] = d24.vastaanoton_tila
	  ,[Äidinkieli] = d8.kieliryhma1_fi
	  ,[Valintatapajono] = f.valintatapajono_nimi
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
	  ,[yksi_pk_per_hakija] = case 
									when f.d_pohjakoulutuskk_id in (select top 1 fh.d_pohjakoulutuskk_id from ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste fh where fh.henkilo_oid=f.henkilo_oid and fh.d_haku_id=f.d_haku_id order by fh.d_pohjakoulutuskk_id) then 1 
									else 0 
							  end 
	  
	  ,[Ensisijaiset hakijat2] = case when hakutoive='1' then 1 else 0 end							
	  ,[Valitut2] = case when f.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1	else 0 end
	  ,[Paikan vastaanottaneet2] = case when f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0	end			
	  ,[Aloittaneet2] = case when f.ilmoittautumisen_tila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end
	  

					

	  --Järjestys-kentät
	  ,[Ensikertainen hakija järjestys] = left(f.ensikertainen_hakija,2)
	  ,[Hakuaika järjestys] = 
			case 
				when d25.hakutapa_koodi = '01' and d31.selite_fi = 'Haku 1 / Hakuaika 1' then 1 
				when d25.hakutapa_koodi = '01' and d31.selite_fi = 'Haku 2 / Hakuaika 2' then 2
				else 9
			end
	
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
	  ,[Koulutuksen kieli järjestys] = d27.kieli_koodi
	  ,[Opiskelun laajuus järjestys] = d3.jarjestys--case when f.Opiskelun_laajuus='' then 9999 when len(opiskelun_laajuus)=2 then '0'+opiskelun_laajuus else f.Opiskelun_laajuus end
	  ,[Pohjakoulutuksen maa järjestys] = d4.jarjestys_kytkin_koodi
	  ,[Pohjakoulutus järjestys] = LEFT(d22.selite_fi,40)
	  ,[Sektori järjestys] = d20.jarjestys_koulutussektori_koodi
	  ,[Sukupuoli järjestys] = d7.jarjestys_sukupuoli_koodi
	  ,[Toisen asteen koulutuksen suoritusvuosi järjestys] = case when f.toisen_asteen_koulutuksen_suoritusvuosi in ('0','Tieto puuttuu') then 9998 else 9999-f.toisen_asteen_koulutuksen_suoritusvuosi end
	  ,[Ylioppilastutkinnon suoritusvuosi järjestys] = case when f.ylioppilastutkinnon_suoritusvuosi in ('0', 'Tieto puuttuu') then 9998 else 9999-f.ylioppilastutkinnon_suoritusvuosi end	  ,[Tutkinnon taso (hakukohde) järjestys] = d45.jarjestys_koodi
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
  LEFT JOIN VipunenTK.dbo.d_valtio d28 ON d28.valtio_avain=d30.maatjavaltiot2_koodi
  LEFT JOIN ANTERO.dw.d_hakuaika d31 ON d31.id=f.d_hakuaika_id
   --1
  LEFT JOIN ANTERO.dw.d_hakukohde d32 ON d32.id=f.d_hakukohde_ensisijainen_id
  LEFT JOIN ANTERO.dw.d_koulutusluokitus d33 ON d33.id=f.d_koulutus_ensisijainen_hakukohde_id
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d33a ON d33a.id=f.d_organisaatioluokitus_ensisijainen_hakukohde_id
  LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d33b ON d33b.id=f.d_tutkinnon_aloitussykli_ensisijainen_hakukohde_id
  --2
  LEFT JOIN ANTERO.dw.d_hakukohde d34 ON d34.id=f.d_hakukohde_toinen_hakukohde_id
  LEFT JOIN ANTERO.dw.d_koulutusluokitus d35 ON d35.id=f.d_koulutus_toinen_hakukohde_id
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d35a ON d35a.id=f.d_organisaatioluokitus_toinen_hakukohde_id
  LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d35b ON d35b.id=f.d_tutkinnon_aloitussykli_toinen_hakukohde_id
  --3
  LEFT JOIN ANTERO.dw.d_hakukohde d36 ON d36.id=f.d_hakukohde_kolmas_hakukohde_id
  LEFT JOIN ANTERO.dw.d_koulutusluokitus d37 ON d37.id=f.d_koulutus_kolmas_hakukohde_id
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d37a ON d37a.id=f.d_organisaatioluokitus_kolmas_hakukohde_id
  LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d37b ON d37b.id=f.d_tutkinnon_aloitussykli_kolmas_hakukohde_id
  --4
  LEFT JOIN ANTERO.dw.d_hakukohde d38 ON d38.id=f.d_hakukohde_neljas_hakukohde_id
  LEFT JOIN ANTERO.dw.d_koulutusluokitus d39 ON d39.id=f.d_koulutus_neljas_hakukohde__id
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d39a ON d39a.id=f.d_organisaatioluokitus_neljas_hakukohde_id
  LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d39b ON d39b.id=f.d_tutkinnon_aloitussykli_neljas_hakukohde_id
  --5
  LEFT JOIN ANTERO.dw.d_hakukohde d40 ON d40.id=f.d_hakukohde_viides_hakukohde_id
  LEFT JOIN ANTERO.dw.d_koulutusluokitus d41 ON d41.id=f.d_koulutus_viides_hakukohde_id
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d41a ON d41a.id=f.d_organisaatioluokitus_viides_hakukohde_id
  LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d41b ON d41b.id=f.d_tutkinnon_aloitussykli_viides_hakukohde_id
  --6
  LEFT JOIN ANTERO.dw.d_hakukohde d42 ON d42.id=f.d_hakukohde_kuudes_hakukohde_id
  LEFT JOIN ANTERO.dw.d_koulutusluokitus d43 ON d43.id=f.d_koulutus_kuudes_hakukohde_id
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d43a ON d43a.id=f.d_organisaatioluokitus_kuudes_hakukohde_id
  LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d43b ON d43b.id=f.d_tutkinnon_aloitussykli_kuudes_hakukohde_id
  --
  LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
  LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d45 on d45.id=f.d_tutkinnon_taso_kk_id
  LEFT JOIN ANTERO.dw.d_haku_amk_yo d46 on d46.id=f.d_haku_amk_yo_id
  LEFT JOIN ANTERO.dw.d_valintatapajono d47 on d47.id = f.d_valintatapajono_id

 where f.koulutuksen_alkamisvuosi > 2014 
 


UNION ALL


--ALOITUSPAIKAT 
Select distinct --top 0
	   cast(f.loadtime as date) as Päivitysaika
	  ,Lukumäärä = 0
      ,f.[aloituspaikat] as alpa
      ,[valintojen_aloituspaikat] as valpa
	  ,f.alin_laskettuvalintapistemaara as pisteraja
	  ,[Ensikertaisena kohdeltava hakija] = NULL
	  ,[Hakemus OID] = null
	  ,[Haku AMK/YO] = NULL
      ,[Haku] = d1.haun_nimi_fi
	  ,[Hakuaika] = 
			case 
				when d1.hakutapa_koodi = '01' and d1.hakutyyppi_koodi = '01' and d9.koodi = 'S' /* d31.selite_fi in ('Haku 1 / Hakuaika 1','Haku 2 / Hakuaika 2')*/ then d13.selite_fi 
				else 'Muu kuin kevään yhteishaun varsinainen haku'
			end
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
	  ,[Koulutusaste, taso 1 (hakukohde)] = d6.koulutusastetaso1_fi
	  ,[Koulutusaste, taso 2 (hakukohde)] = d6.koulutusastetaso2_fi
	  ,[Koulutusala, taso 1 (hakukohde)] = d6.koulutusalataso1_fi
	  ,[Koulutusala, taso 2 (hakukohde)] = d6.koulutusalataso2_fi
	  ,[Koulutusala, taso 3 (hakukohde)] = d6.koulutusalataso3_fi
	  ,[Tutkinto (hakukohde)] = d6.koulutusluokitus_fi
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
	  ,[Henkilö OID] = NULL
	  ,[Ikä] = NULL
	  ,[Ikäryhmä] = NULL
	  ,[Kansalaisuus] = NULL
	  ,[Kansalaisuus (maanosa)] = null
	  ,[Kansalaisuus (ryhmä)] = null
	  ,[Kotipaikkakunta] = NULL
	  ,[Kotipaikan maakunta] = NULL
	  ,[Kotipaikan AVI] = NULL
	  ,[Kotipaikan ELY] = NULL
	  ,[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	  ,[Koulutuksen alkamiskausi] = d9.selite_fi
	  ,[Koulutuksen kieli] = d7.kieli_fi
	  ,[Opiskelun laajuus] = d2.selite_fi
	  ,[Pohjakoulutuksen maa] = NULL
	  ,[Pohjakoulutus] = NULL 
	  ,[Sektori] = d6.koulutussektori_fi--case when d3.selite_fi='Elintarviketieteet, elintarviketieteiden kandidaatti ja maisteri' then 'Yliopistokoulutus' else d6.koulutussektori_fi end
	  ,[Sukupuoli] = NULL
	  ,[Hakijan ilmoittaman pohjakoulutuksen koulutuksen suoritusvuosi]=null
	  ,[Toisen asteen koulutuksen suoritusvuosi] = null
	  ,[Ylioppilastutkinnon suoritusvuosi]=null
	  ,[Aloittanut opinnot toisen asteen koulutuksen suoritusvuonna]=null
	  ,[Aloittanut opinnot ilmoittamansa pohjakoulutuksen suoritusvuonna]=null
	  ,[Tutkinnon taso (hakukohde)] = d45.selite_fi
	  ,[Tutkinnon aloitussykli (hakukohde)] = d44.selite_fi
	  --,[Valinnan tila] = NULL
	  --,[Vastaanoton tila] = NULL
	  ,[Äidinkieli] = NULL
	  ,[Valintatapajono] = NULL
	  ,[Valintatapajonon tyyppi] = NULL

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
	  ,[Ensisijaiset hakijat2] = null
	  ,[Valitut2] = null
	  ,[Paikan vastaanottaneet2] = null
	  ,[Aloittaneet2] = null
					

	  ,[Ensikertainen hakija järjestys] = 'öö'
	  ,[Hakuaika järjestys] = 
			case 
				when d1.hakutapa_koodi = '01' and d13.selite_fi = 'Haku 1 / Hakuaika 1' then 1 
				when d1.hakutapa_koodi = '01' and d13.selite_fi = 'Haku 2 / Hakuaika 2' then 2
				else 9
			end
	  ,[Haku AMK/YO järjestys] = 999
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
	  ,[Kotipaikan maakunta järjestys] = 9999
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
	  ,[Valintatapajonon tyyppi järjestys] = 'ööö'

FROM [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat] f
	  LEFT JOIN d_haku d1 on d1.id=f.d_haku_id
	  LEFT JOIN d_opintojenlaajuus d2 on d2.id=f.d_opintojen_laajuus_id
	  LEFT JOIN d_hakukohde d3 on d3.id=f.d_hakukohde_id
	  
	  LEFT JOIN d_alueluokitus d5 on d5.id=f.d_alueluokitus_hakukohde_id
	  LEFT JOIN d_koulutusluokitus d6 on d6.id=f.d_koulutusluokitus_hakukohde_id
	  LEFT JOIN d_kieli d7 on d7.id=f.d_kieli_koulutus_id
	  LEFT JOIN d_organisaatioluokitus d8a on d8a.id=d_organisaatio_koulutuksen_jarjestaja_id
	  LEFT JOIN d_organisaatioluokitus d8b on d8b.id=d_organisaatio_oppilaitos_id 
	  LEFT JOIN d_organisaatioluokitus d8c on d8c.id=d_organisaatio_toimipiste_id
	  LEFT JOIN d_kausi d9 on d9.id=f.d_kausi_koulutuksen_alkamiskausi_id
	  LEFT JOIN d_hakuaika d13 on d13.id=f.d_hakuaika_id
	  LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
	  LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d45 on d45.id=f.d_tutkinnon_taso_kk_id
  

where (f.koulutuksen_alkamisvuosi > 2016 OR (f.koulutuksen_alkamisvuosi = 2016 and d9.selite_fi = 'Syksy'))
and d1.korkeakouluhaku = 1 and d8b.oppilaitostyyppi_koodi in ('41','42')


