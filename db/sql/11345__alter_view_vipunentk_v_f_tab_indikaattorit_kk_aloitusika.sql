USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_indikaattorit_kk_aloitusika]    Script Date: 31.10.2025 10.57.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_f_tab_indikaattorit_kk_aloitusika] AS

Select --top 1000
f.tilastointivuosi as [Tilastovuosi]
,d2.aidinkieli_versio1 as Äidinkieli --edellinen vuosi
,d4.sukupuoli as Sukupuoli
,d3.kansalaisuus_versio2 as Kansalaisuus
,d25.kylla_ei as "Kansainvälinen opiskelija"
,d5b.vuosiselite as Syntymävuosi
,d5c.kuukausiselite as Syntymäkuukausi
,d1.opiskelijan_olo as "Kirjoillaolo (syys)"
,d6.patevyyteen_tahtaavat_opinnot as "Pätevyyteen tähtäävät opinnot (amk)"
,d8.erikoislaakarikoulutus as "Erikoislääkärikoulutus (yo)"
,d7.koulutustyyppi as Koulutustyyppi
,d9.oppilaitos as Oppilaitos
,d9.opetuskieli as Opetuskieli
,d9.oppilaitoksen_omistajatyyppi as "Oppil. omistajatyyppi"
,d9.oppilaitostyyppi as Oppilaitostyyppi
,d9b.koulutuksen_jarjestaja as "Koulutuksen järjestäjä"
,d9b.koulutuksen_jarjestajan_omistajatyyppi as "Koul. järjestäjän omistajatyyppi"
,d10.lahde as Lähde
,d19.koulutussektori as Koulutussektori
,d21.koulutusaste2002 as Koulutusaste
,d21.koulutusala2002 as "Koulutusala"
,d21.koulutusala2002 as "Koulutusala (02 luokitus)"
,d21.opintoala1995 as "Koulutusala (95 luokitus)"
,d21.opintoala2002 as Opintoala
,d21.koulutus as Koulutusnimike
,d21b.koulutuslaji_okm as Koulutuslaji
,d21b.koulutuslaji_okm2 as Koulutuslaji2
,case 
	when d21.Koulutusaste_taso2_koodi IN ('62','63') OR (d21.Koulutusaste_taso2_koodi=72 AND d21.opintoala2002_koodi in (704,708)) then 'I sykli' 
	when d21.Koulutusaste_taso2_koodi IN ('71','72') then 'II sykli' 
	else 'Tuntematon' 
end as 'Tutkinnon aloitussykli'
,d22b.avi as "Koul. järjestäjän AVI"
,d22b.ely as "Koul. järjestäjän ELY"
,d22b.maakunta as "Koul. järjestäjän maakunta"
,d22b.kielisuhde as "Koul. järjestäjän kunnan kielisuhde"
,d22b.kunta as "Koul. järjestäjän kunta"
,d22c.avi as "Oppilaitoksen AVI"
,d22c.ely as "Oppilaitoksen ELY"
,d22c.maakunta as "Oppilaitoksen maakunta"
,d22c.kielisuhde as "Oppil. kunnan kielisuhde"
,d22c.kunta as "Oppilaitoksen kunta"
,d23.vuosiselite as "Kirjoihintulovuosi"
,d23b.lukukausiselite as "Kirjoihintulokausi"
,d24f.vuosiselite as "Kirjoihintulovuosi (korkeakoulu)" --Kirjoihintulovuosi (korkeakoulusektori)
,d26.eu_etamaat as"Toisen asteen tutk. suoritusmaa"

--Ruotsinkielinen käännös
,f.tilastointivuosi as [Statistikår]
,d2.aidinkieli_versio1_SV as Modersmål
,d4.sukupuoli_SV as Kön
,d3.kansalaisuus_versio2_SV as Medborgarskap
,d6.patevyyteen_tahtaavat_opinnot_SV as "Pätevyyteen tähtäävät opinnot (amk)SV"
,d8.erikoislaakarikoulutus_SV as "Erikoislääkärikoulutus (yo)SV"
,d7.koulutustyyppi_SV as "Typ av utbildning"
,d9.oppilaitos_SV as Läroanstalt
,d9.opetuskieli_SV as Undervisningsspråk
,d9.oppilaitoksen_omistajatyyppi_SV as "Läroanstaltens ägartyp"
,d9.oppilaitostyyppi_SV as Läroanstaltstyp
,d9b.koulutuksen_jarjestaja_SV as "Utbildningsanordnare"
,d9b.koulutuksen_jarjestajan_omistajatyyppi_SV as "Utbildningsanordnarens ägartyp"
,d19.koulutussektori_SV as Utbildningssektor
,d21.koulutusaste2002_SV as "Utbildningsnivå (2002)"
,d21.koulutusala2002_SV as "Utbildningsområde (2002)"
,d21.opintoala1995_SV as "Utbildningsområde (1995)"
,d21.opintoala2002_SV as Studieområde
,d21.koulutus_SV as Utbildningsbenämning
,d21b.koulutuslaji_okm_SV as Examensslag
,d21b.koulutuslaji_okm2_SV as Examensslag2
,case 
	when d21.Koulutusaste_taso2_koodi IN ('62','63') OR (d21.Koulutusaste_taso2_koodi=72 AND d21.opintoala2002_koodi in (704,708)) then 'Cykeln I' 
	when d21.Koulutusaste_taso2_koodi IN ('71','72') then 'Cykeln II' 
	else 'Okänd' 
end as 'Cykeln'
--,d22b.avi_SV as "Koul. järjestäjän AVISV"
--,d22b.ely_SV as "Koul. järjestäjän ELYSV"
--,d22b.maakunta_SV as "Koul. järjestäjän maakuntaSV"
--,d22b.kielisuhde_SV as "Koul. järjestäjän kunnan kielisuhdeSV"
--,d22b.kunta_SV as "Koul. järjestäjän kuntaSV"
--,d22c.avi_SV as "Oppilaitoksen AVISV"
--,d22c.ely_SV as "Oppilaitoksen ELYSV"
--,d22c.maakunta_SV as "Oppilaitoksen maakuntaSV"
--,d22c.kielisuhde_SV as "Oppil. kunnan kielisuhdeSV"
--,d22c.kunta_SV as "Oppilaitoksen kuntaSV"
--,d23.vuosiselite_SV as "KirjoihintulovuosiSV"
--,d23b.lukukausiselite_SV as "KirjoihintulokausiSV"
--,d24f.vuosiselite_SV as "Kirjoihintulovuosi (korkeakoulu)SV"
--,d24f2.lukukausiselite_SV as "Kirjoihintulokausi (korkeakoulu)SV"
--,d37.vuosiselite_SV as "Tutkinnon suoritusvuosiSV"
--,d38.lukukausiselite_SV as "Tutk. suorituslukukausiSV"
--,d39.kuukausiselite_SV as "Tutk. suorituskuukausiSV"
--,d40.tutkinnon_toteuma_SV as "Tutkinnon toteumaSV"


--Englanninkielinen käännös
,f.tilastointivuosi as [Statistical year]
,d2.aidinkieli_versio1_EN as "Mother tongue"
,d4.sukupuoli_EN as Gender
,d3.kansalaisuus_versio2_EN as Nationality
--,d5b.vuosiselite_EN as SyntymävuosiEN
--,d5c.kuukausiselite_EN as SyntymäkuukausiEN
,d6.patevyyteen_tahtaavat_opinnot_EN as "Pätevyyteen tähtäävät opinnot (amk)EN"
,d8.erikoislaakarikoulutus_EN as "Erikoislääkärikoulutus (yo)EN"
,d7.koulutustyyppi_EN as "Education type"
,d9.oppilaitos_EN as "Educational institution"
,d9.opetuskieli_EN as "Language of education"
,d9.oppilaitoksen_omistajatyyppi_EN as "Type of ed. institution owner"
,d9.oppilaitostyyppi_EN as "Type of ed. institution"
,d9b.koulutuksen_jarjestaja_EN as "Education provider"
,d9b.koulutuksen_jarjestajan_omistajatyyppi_EN as "Type of ed. provider owner"
,d19.koulutussektori_EN as "Sector of education"
,d21.koulutusaste2002_EN as "Level of education (2002)"
,d21.koulutusala2002_EN as "Field of education (2002)"
,d21.opintoala1995_EN as "Field of education (1995)"
,d21.opintoala2002_EN as "Subfield of education (2002)"
,d21.koulutus_EN as "Name of education"
,d21b.koulutuslaji_okm_EN as "Form of education"
,d21b.koulutuslaji_okm2_EN as "Form of education2"
,case 
	when d21.Koulutusaste_taso2_koodi IN ('62','63')  OR (d21.Koulutusaste_taso2_koodi=72 AND d21.opintoala2002_koodi in (704,708)) then 'Cycle I' 
	when d21.Koulutusaste_taso2_koodi IN ('71','72') then 'Cycle II' 
	else 'Unknown' 
end as 'Beginning cycle of education'
--,d22b.avi_EN as "Koul. järjestäjän AVI"
--,d22b.ely_EN as "Koul. järjestäjän ELY"
--,d22b.maakunta_EN as "Koul. järjestäjän maakunta"
--,d22b.kielisuhde_EN as "Koul. järjestäjän kunnan kielisuhde"
--,d22b.kunta_EN as "Koul. järjestäjän kunta"
--,d22c.avi_EN as "Oppilaitoksen AVI"
--,d22c.ely_EN as "Oppilaitoksen ELY"
--,d22c.maakunta_EN as "Oppilaitoksen maakunta"
--,d22c.kielisuhde_EN as "Oppil. kunnan kielisuhde"
--,d22c.kunta_EN as "Oppilaitoksen kunta"
--,d23.vuosiselite_EN as "Kirjoihintulovuosi"
--,d23b.lukukausiselite_EN as "Kirjoihintulokausi"
--,d24f.vuosiselite_EN as "Kirjoihintulovuosi (korkeakoulu)"
--,d24f2.lukukausiselite_EN as "Kirjoihintulokausi (korkeakoulu)"
--,d37.vuosiselite_EN as "Tutkinnon suoritusvuosi"
--,d38.lukukausiselite_EN as "Tutk. suorituslukukausi"
--,d39.kuukausiselite_EN as "Tutk. suorituskuukausi"
--,d40.tutkinnon_toteuma_EN as "Tutkinnon toteuma"


--Järjestysmuuttujat
,d1.jarjestys
,d2.jarjestys as jarj_aidinkieli
,d3.jarjestys as jarj_kansalaisuus
,d5b.jarjestys as jarj_syntv
,d6.jarjestys as jarj_patevyys
,d8.jarjestys as jarj_erikoislaakari
,d7.jarjestys as jarj_koultyyppi
,d9.jarjestys_oppilaitos
,d9.jarjestys_opetuskieli
,d9.jarjestys_omistajatyyppi
,d9.jarjestys_oppilaitostyyppi
,d19.jarjestys as jarj_koulsek
,d21.jarjestys_koulutusaste2002
,d21.jarjestys_koulutusala2002
,d21.jarjestys_opintoala1995
,d21.jarjestys_opintoala2002
,d21.jarjestys as jarj_koulnimike
,d21b.jarjestys as jarj_koullaji
,d21b.jarjestys2 as jarj_koullaji2
,case 
	when d21.Koulutusaste_taso2_koodi IN ('62','63') OR (d21.Koulutusaste_taso2_koodi=72 AND d21.opintoala2002_koodi in (704,708)) then '1' 
	when d21.Koulutusaste_taso2_koodi IN ('71','72') then '2' 
	else '9' 
end as jarj_aloitussykli
,d22b.jarjestys_avi as jarjestys_avi2
,d22b.jarjestys_ely as jarjestys_ely2
,d22b.jarjestys_maakunta as jarjestys_maakunta2
,d22b.jarjestys_kielisuhde as jarjestys_kielisuhde2
,d22b.jarjestys as jarj_kunta2
,d22c.jarjestys_avi as jarjestys_avi3
,d22c.jarjestys_ely as jarjestys_ely3
,d22c.jarjestys_maakunta as jarjestys_maakunta3
,d22c.jarjestys_kielisuhde as jarjestys_kielisuhde3
,d22c.jarjestys as jarj_kunta3
,d23b.jarjestys as jarj_lukukausi
,d25.jarjestys as jarj_kansvainvalinen_opiskelija
,d26.jarjestys as jarj_toisen_asteen_tutk_suoritusmaa


--Koodimuuttujat
,d2.aidinkieli_versio1_koodi as aidinkieli_koodi
,d5c.kuukausi as syntk
,d7.koulutustyyppi_koodi as 'Koodit Koulutustyyppi'
,d9.oppilaitoskoodi as 'Koodit Oppilaitos'
,d9b.koulutuksen_jarjestajan_omistajatyyppikoodi as 'Koodit Koul. järjestäjän omistajatyyppi'
,d9b.koulutuksen_jarjestajakoodi as 'Koodit Koulutuksen järjestäjä'
,d10.lahde_koodi
,d21.koulutusaste2002_koodi as 'Koodit Koulutusaste'
,d21.koulutusala2002_koodi as 'Koodit Koulutusala (02)'
,d21.opintoala1995_koodi as 'Koodit Koulutusala (95)'
,d21.opintoala2002_koodi as 'Koodit Opintoala (02)'
,d21.koulutus_koodi as 'Koodit Koulutusnimike'
,d22b.maakunta_koodi as 'Koodit Koul. järj. maakunta'
,d22b.kunta_koodi as 'Koodit Koul. järj. kunta'
,d22c.maakunta_koodi as 'Koodit Oppil. maakunta'
,d22c.kunta_koodi as 'Koodit Oppil. kunta'
,d23.vuosi as alvv
,d23b.lukukausi as alkk
,d24f.vuosi as alvv_kk
,d21.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
,d21.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
,d21.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
,d21.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
,d21.iscfi2013_koodi as "Koodit Koulutusala, taso 3"
,d21.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala, korkeak."


--isced
,d21.iscle2011 as "Koulutusaste, taso 1"
,d21.Koulutusaste_taso2 as "Koulutusaste, taso 2"
,d21.iscfibroad2013 as "Koulutusala, taso 1"
,d21.iscfinarrow2013 as "Koulutusala, taso 2"
,d21.iscfi2013 as "Koulutusala, taso 3"
,d21.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak."
,d21.iscle2011_SV as "Utbildn.nivå, nivå 1"
,d21.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
,d21.iscfibroad2013_SV as "Utbildn.område, nivå 1"
,d21.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
,d21.iscfi2013_SV as "Utbildn.område, nivå 3"
,d21.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor"
,d21.iscle2011_EN as "Level of education, tier 1"
,d21.Koulutusaste_taso2_EN as "Level of education, tier 2"
,d21.iscfibroad2013_EN as "Field of education, tier 1"
,d21.iscfinarrow2013_EN as "Field of education, tier 2"
,d21.iscfi2013_EN as "Field of education, tier 3"
,d21.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"
,d21.jarjestys_iscle2011 as jarj_isced_koulast1
,d21.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
,d21.jarjestys_iscfibroad2013 as jarj_isced_koulala1
,d21.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
,d21.jarjestys_iscfi2013 as jarj_isced_koulala3
,d21.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1
--Lukumäärämuuttujat
,[aloittaneet] as aloit2
,[aloittaneet_korkeakoulusektori] as aloit2_sek
,[aloitusika]
,[jarjestys_aloitusika]


FROM dbo.f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat f

	INNER JOIN [dbo].d_opiskelijan_olo d1 ON d1.id=f.opiskelijan_olo_syys_id
	INNER JOIN [dbo].d_aidinkieli_versio1 d2 ON d2.id = f.aidinkieli_versio1_id
	INNER JOIN [dbo].d_kansalaisuus_versio2 d3 on d3.id=f.kansalaisuus_versio2_id
	INNER JOIN [dbo].d_sukupuoli d4 ON d4.id = f.sukupuoli_id
	INNER JOIN [dbo].d_kausi d5b ON d5b.kausi_id = f.syntymavuosi_id
	INNER JOIN [dbo].d_kausi d5c ON d5c.kausi_id = f.syntymakuukausi_id
	INNER JOIN [dbo].d_patevyyteen_tahtaavat_opinnot_amk d6 on d6.id=f.patevyyteen_tahtaavat_opinnot_amk_id
	INNER JOIN [dbo].d_koulutustyyppi d7 ON d7.id = f.koulutustyyppi_id
	INNER JOIN [dbo].d_erikoislaakarikoulutus d8 on d8.id=f.erikoislaakarikoulutus_id
	INNER JOIN [dbo].d_oppilaitoksen_taustatiedot d9 ON d9.id = f.oppilaitos_id
	INNER JOIN [dbo].d_oppilaitoksen_taustatiedot d9b ON d9b.id = f.koulutuksen_jarjestaja_id
	INNER JOIN [dbo].d_lahde d10 ON d10.id = f.lahde_id
	INNER JOIN [dbo].d_koulutussektori d19 ON d19.id = f.koulutussektori_id

	INNER JOIN [dbo].d_koulutusluokitus d21 ON d21.id = f.koulutusluokitus_id
	INNER JOIN [dbo].d_koulutuslaji_okm d21b ON d21b.id = f.koulutuslaji_OKM_id
	INNER JOIN [dbo].d_alueluokitus d22b ON d22b.alueluokitus_avain = d9b.sijaintikuntakoodi
	INNER JOIN [dbo].d_alueluokitus d22c ON d22c.alueluokitus_avain = d9.sijaintikuntakoodi
	INNER JOIN [dbo].d_kausi d23 ON d23.kausi_id = f.kirjoihintulovuosi_id
	INNER JOIN [dbo].d_kausi d23b ON d23b.kausi_id = f.kirjoihintulokausi_id
	INNER JOIN [dbo].d_kausi d24f ON d24f.kausi_id = f.kirjoihintulovuosi_korkeakoulu_id
	INNER JOIN [dbo].d_kylla_ei d25 ON d25.id = f.kvopisk_id
	INNER JOIN dbo.d_eu_etamaat d26 on d26.id = f.suormaa_id
	
WHERE d9.oppilaitoskoodi NOT IN ('02557','10031','02358') 
AND aloitusika <> '-1' 
AND (d21.koulutusaste2002_koodi in ('62','63','71','72') or d21.Koulutusaste_taso2_koodi in ('62','63','71','72'))
AND (f.aloittaneet>0 OR f.aloittaneet_korkeakoulusektori>0)



GO


