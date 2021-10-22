USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain]    Script Date: 31.8.2021 21:28:36 ******/
DROP VIEW IF EXISTS [dw].[v_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain]
GO

/****** Object:  View [dw].[v_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain]    Script Date: 31.8.2021 21:28:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dw].[v_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain] AS

  SELECT 

    [opisk]
	,[tutk]
	,[tilastopaiva_1_0]

	,oppilaitos_oid
	,oppija_oid

  --aika
	,[Tilastovuosi] = f.vuosi
	,[Lukuvuosi] = f.lukuvuosi
	,[Lukukausi] = d14.selite_fi 

  --hlö
	,[Sukupuoli] = case d1.sukupuoli_koodi when '1' then 'Pojat' when '2' then 'Tytöt' else 'Tieto puuttuu' end --dimensioon?
	,[Ikä] = --dimensioon?
		case 
			when d3.ika_fi in ('0','1','2','3','4') then '4-vuotiaat ja sitä nuoremmat'
			when d3.ika_fi in ('5','6','7','8','9','10','11','12','13','14','15','16','17','18','19') then d3.ika_fi
			else d3.ikaryhma3_fi
		end
	,[Äidinkieli] = d2.kieli_fi
	,[Äidinkieli (ryhmä)] = d2.kieliryhma1_fi
	,[Kansalaisuus] = d22.maatjavaltiot2_fi 
	,[Kansalaisuus (ryhmä)] = --dimensioon?
		CASE 
			WHEN d22.maatjavaltiot2_koodi = '246' THEN d22.maatjavaltiot2_fi 
			WHEN d22.maatjavaltiot2_koodi <> '-1'  THEN 'Muu' 
			ELSE 'Tieto puuttuu' 
		END
	
  --koulutus
	,[Koulutusmuoto] = d24.koulutus_fi
	,[Perusopetuksen suoritustapa] = f.suoritustapa --dimensioon?
	,[Vuosiluokka tai koulutus] = d24.vuosiluokka_fi
	,[Vuosiluokkaryhmä tai koulutus] = d24.vuosiluokkaryhma_fi
	,[Suorituskieli] = case when d23.kieli_fi = 'pohjoissaame' then 'saame' else d23.kieli_fi end
	,[Muu suorituskieli] = case when d23b.kieli_fi = 'pohjoissaame' then 'saame' else d23b.kieli_fi end
	,[Kielikylpykieli] = case when d23c.kieli_fi = 'pohjoissaame' then 'saame' else d23c.kieli_fi end
	,[Erityinen tuki] = d25.perusopetuksen_tehostettu_tuki
	,[Erityisen tuen päätös] = d27.kytkin_fi
	,[Joustava perusopetus] = d28.kytkin_fi
	,[Koulukoti] = d29.kytkin_fi
	,[Kotiopetus] = d30.kytkin_fi
	,[Kuljetusetuus] = case when tutk > 0 or kuluva_lv_1_0 = 1 then d31.kytkin_fi end
	,[Pidennetty oppivelvollisuus] = d32.kytkin_fi
	,[Sisäoppilaitosmuotoinen majoitus] = d33.kytkin_fi
	,[Aikuisten perusop. alkuvaiheen opiskelija] = d34.kytkin_fi
	,[Vuosiluokkiin sitomaton opetus] = case when tutk > 0 or kuluva_lv_1_0 = 1 then d35.kytkin_fi end
	,[Tehostettu tuki] = d36.kytkin_fi
	,[Ulkomailla] = d37.kytkin_fi
	
  --org
	,[Oppilaitos] = d5.organisaatio_fi
	,[Oppilaitosnumero] = d5.organisaatio_koodi 
	,[Oppilaitoksen opetuskieli] = d5.oppilaitoksenopetuskieli_fi
	,[Oppilaitostyyppi] = d5.oppilaitostyyppi_fi
	,[Oppilaitoksen kunta] = d10.kunta_fi
	,[Oppilaitoksen maakunta] = d10.maakunta_fi
	,[Oppilaitoksen AVI] = d10.avi_fi
	,[Oppilaitoksen ELY] = d10.ely_fi 
	,[Opetuksen järjestäjä] = d11.organisaatio_fi
	,[Opet. järjestäjän yritysmuoto] = d11.koulutuksen_jarjestajan_yritysmuoto
	,[Opet. järjestäjän kunta] = d12.kunta_fi 
	,[Opet. järjestäjän maakunta] = d12.maakunta_fi 
	,[Opet. järjestäjän AVI] = d12.avi_fi 
	,[Opet. järjestäjän ELY] = d12.ely_fi 
	,[Toimipiste] = d21.organisaatio_fi
	
  --Järjestykset
	,d14.jarjestys2 AS jarj_lukukausi 
	,d1.jarjestys_sukupuoli_koodi AS jarj_sukupuoli
	,case 
		when d3.ika_fi in ('0','1','2','3','4') then '04'
		when d3.ika_fi in ('5','6','7','8','9') then '0'+d3.ika_fi 
		when d3.ika_fi in ('10','11','12','13','14','15','16','17','18','19') then d3.ika_fi
		else left(d3.ikaryhma3_fi, 2)
	end AS jarj_ika
	,d2.jarjestys_kieliryhma1 AS jarj_aidinkieli_ryhma
	--,d23.jarjestys_kieliryhma1 AS jarj_suorituskieli
	,d22.jarjestys_maatjavaltiot2_koodi AS jarj_kansalaisuus
	,CASE d22.maatjavaltiot2_fi WHEN 'Suomi' THEN 1 ELSE 2 END AS jarj_kansalaisuus_ryhma
	,d12.jarjestys_maakunta_koodi AS jarj_koul_jarj_maakunta
	,d12.jarjestys_avi_koodi AS jarj_koul_jarj_avi
	,d12.jarjestys_ely_koodi AS jarj_koul_jarj_ely
	,d10.jarjestys_maakunta_koodi AS jarj_oppilaitoksen_maakunta
	,d10.jarjestys_ely_koodi AS jarj_oppilaitoksen_ely
	,d10.jarjestys_avi_koodi AS jarj_oppilaitoksen_avi
	,d5.jarjestys_oppilaitoksenopetuskieli_koodi AS jarj_oppilaitoksen_opetuskieli
	,d5.jarjestys_oppilaitostyyppi_koodi AS jarj_oppilaitostyyppi
	,d24.jarjestys_vuosiluokka AS jarj_vuosiluokka
	,d24.jarjestys_vuosiluokkaryhma AS jarj_vuosiluokka_ryhma
	,d24.jarjestys_koulutus AS jarj_koulutus
	,d25.jarjestys AS jarj_erityinen_tuki

	FROM [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain] f
	LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
	LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
	LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
	LEFT JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
	LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi 
	LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
	LEFT JOIN dw.d_alueluokitus d12 ON d12.kunta_koodi = d11.kunta_koodi
	LEFT JOIN dw.d_kausi d14 ON d14.id = f.d_kausi_id
	LEFT JOIN dw.d_organisaatioluokitus d21 ON d21.id = f.d_organisaatioluokitus_toimipiste_id
	LEFT JOIN dw.d_maatjavaltiot2 d22 ON d22.id = f.d_maatjavaltiot2_kansalaisuus_id
	LEFT JOIN dw.d_kieli d23 ON d23.id = f.d_kieli_suorituskieli_id
	LEFT JOIN dw.d_kieli d23b ON d23b.id = f.d_kieli_muu_suorituskieli_id
	LEFT JOIN dw.d_kieli d23c ON d23c.id = f.d_kieli_kielikylpykieli_id
	LEFT JOIN dw.d_vuosiluokka_tai_koulutus d24 ON d24.id = f.d_vuosiluokka_id
	LEFT JOIN VipunenTK.dbo.d_perusopetuksen_tehostettu_tuki d25 on d25.id = f.d_erityinen_tuki_johdettu_id
  --1/0
	LEFT JOIN dw.d_kytkin d27 ON d27.kytkin_koodi = f.erityisen_tuen_paatos
	LEFT JOIN dw.d_kytkin d28 ON d28.kytkin_koodi = f.joustava_perusopetus
	LEFT JOIN dw.d_kytkin d29 ON d29.kytkin_koodi = f.koulukoti
	LEFT JOIN dw.d_kytkin d30 ON d30.kytkin_koodi = f.kotiopetus
	LEFT JOIN dw.d_kytkin d31 ON d31.kytkin_koodi = f.kuljetusetu 
	LEFT JOIN dw.d_kytkin d32 ON d32.kytkin_koodi = f.pidennetty_oppivelvollisuus
	LEFT JOIN dw.d_kytkin d33 ON d33.kytkin_koodi = f.sisaoppilaitosmainen_majoitus
	LEFT JOIN dw.d_kytkin d34 ON d34.kytkin_koodi = f.aikuisten_alkuvaihe_1_0
	LEFT JOIN dw.d_kytkin d35 ON d35.kytkin_koodi = f.vuosiluokkiin_sitoutumaton_opetus
	LEFT JOIN dw.d_kytkin d36 ON d36.kytkin_koodi = f.tehostettu_tuki
	LEFT JOIN dw.d_kytkin d37 ON d37.kytkin_koodi = f.ulkomailla





GO


