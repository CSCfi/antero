USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_koski_esi_ja_perus_yksilollistaminen_cultures] AS

SELECT 
	apusarake_oppija_oid = f.master_oid
	,lukuvuosi = concat(f.tilastovuosi-1, '/', f.tilastovuosi)

  --FI
	,sukupuoli_fi = case d1.sukupuoli_koodi when '1' then 'Pojat' when '2' then 'Tytöt' else 'Tieto puuttuu' end
	,ika_fi =
		case 
			when d3.ika_fi in ('0','1','2','3','4') then '4-vuotiaat ja sitä nuoremmat'
			when d3.ika_fi in ('5','6','7','8','9','10','11','12','13','14','15','16','17','18','19') then d3.ika_fi
			else d3.ikaryhma3_fi
		end
	,aidinkieli_fi = d2.kieli_fi
	,aidinkieli_ryhma_fi = d2.kieliryhma2_fi
	,kansalaisuus_fi = d22.maatjavaltiot2_fi 
	,kansalaisuus_ryhma_fi =
		case 
			when d22.maatjavaltiot2_koodi = '246' THEN d22.maatjavaltiot2_fi 
			when d22.maatjavaltiot2_koodi <> '-1'  THEN 'Muu' 
			else 'Tieto puuttuu' 
		end
	,d24.vuosiluokka_fi
	,d24.vuosiluokkaryhma_fi
	,erityinen_tuki_fi = d25.perusopetuksen_tehostettu_tuki
	,erityisen_tuen_paatos_fi = d27.kytkin_fi
	,pidennetty_oppivelvollisuus_fi = d32.kytkin_fi
	,opiskelee_toiminta_alueittain_fi = d38.kytkin_fi
	,aidinkielen_oppimaara_fi = coalesce(d26b.nimi, 'Tieto puuttuu')
	,aidinkielen_oppim_yksilollistetty_fi = d39.kytkin_fi
	,matematiikan_oppim_yksilollistetty_fi = d40.kytkin_fi
	,oppimaaran_yksilollistaminen_fi = 
		case
			when opiskelee_toiminta_alueittain = 0 and ei_oppiainesuorituksia = 1 then 'Ei tietoa oppiainesuorituksista'
			else d26.perusopetuksen_oppimaaran_yksilollistaminen
		end
	--,oppilaitos_fi = d5.organisaatio_fi
	--,oppilaitosnumero_fi = d5.organisaatio_koodi 
	--,oppilaitoksen_opetuskieli_fi = d5.oppilaitoksenopetuskieli_fi
	--,oppilaitostyyppi_fi = d5.oppilaitostyyppi_fi
	--,oppilaitoksen_kunta_fi = d10.kunta_fi
	,oppilaitoksen_maakunta_fi = d10.maakunta_fi
	--,oppilaitoksen_avi_fi = d10.avi_fi
	--,oppilaitoksen_ely_fi = d10.ely_fi 

  --SV
	,sukupuoli_sv = case d1.sukupuoli_koodi when '1' then 'Pojkar' when '2' then 'Flickor' else 'Information saknas' end
	,ika_sv =
		case 
			when d3.ika_sv in ('0','1','2','3','4') then '4 år eller yngre'
			when d3.ika_sv in ('5','6','7','8','9','10','11','12','13','14','15','16','17','18','19') then d3.ika_sv
			else d3.ikaryhma3_sv
		end
	,aidinkieli_sv = d2.kieli_sv
	,aidinkieli_ryhma_sv = d2.kieliryhma2_sv
	,kansalaisuus_sv = d22.maatjavaltiot2_sv 
	,kansalaisuus_ryhma_sv =
		case 
			when d22.maatjavaltiot2_koodi = '246' THEN d22.maatjavaltiot2_sv 
			when d22.maatjavaltiot2_koodi <> '-1'  THEN 'Övrigt' 
			else 'Information saknas' 
		end
	,d24.vuosiluokka_sv
	,d24.vuosiluokkaryhma_sv
	,erityinen_tuki_sv = d25.perusopetuksen_tehostettu_tuki_sv
	,erityisen_tuen_paatos_sv = d27.kytkin_sv
	,pidennetty_oppivelvollisuus_sv = d32.kytkin_sv
	,opiskelee_toiminta_alueittain_sv = d38.kytkin_sv
	,aidinkielen_oppimaara_sv = coalesce(d26b.nimi_sv, 'Information saknas')
	,aidinkielen_oppim_yksilollistetty_sv = d39.kytkin_sv
	,matematiikan_oppim_yksilollistetty_sv = d40.kytkin_sv
	,oppimaaran_yksilollistaminen_sv = 
		case
			when opiskelee_toiminta_alueittain = 0 and ei_oppiainesuorituksia = 1 then 'Information om läroämnesprestationer saknas'
			else d26.perusopetuksen_oppimaaran_yksilollistaminen_sv
		end
	,oppilaitoksen_maakunta_sv = d10.maakunta_sv

  --EN
	,sukupuoli_en = case d1.sukupuoli_koodi when '1' then 'Pojkar' when '2' then 'Flickor' else 'Information saknas' end
	,ika_en =
		case 
			when d3.ika_en in ('0','1','2','3','4') then 'Aged 4 or under'
			when d3.ika_en in ('5','6','7','8','9','10','11','12','13','14','15','16','17','18','19') then d3.ika_en
			else d3.ikaryhma3_en
		end
	,aidinkieli_en = d2.kieli_en
	,aidinkieli_ryhma_en = d2.kieliryhma2_en
	,kansalaisuus_en = d22.maatjavaltiot2_en 
	,kansalaisuus_ryhma_en =
		case 
			when d22.maatjavaltiot2_koodi = '246' THEN d22.maatjavaltiot2_en 
			when d22.maatjavaltiot2_koodi <> '-1'  THEN 'Other' 
			else 'Missing data' 
		end
	,d24.vuosiluokka_en
	,d24.vuosiluokkaryhma_en
	,erityinen_tuki_en = d25.perusopetuksen_tehostettu_tuki_en
	,erityisen_tuen_paatos_en = d27.kytkin_en
	,pidennetty_oppivelvollisuus_en = d32.kytkin_en
	,opiskelee_toiminta_alueittain_en = d38.kytkin_en
	,aidinkielen_oppimaara_en = coalesce(d26b.nimi_en, 'Missing data')
	,aidinkielen_oppim_yksilollistetty_en = d39.kytkin_en
	,matematiikan_oppim_yksilollistetty_en = d40.kytkin_en
	,oppimaaran_yksilollistaminen_en = 
		case
			when opiskelee_toiminta_alueittain = 0 and ei_oppiainesuorituksia = 1 then 'Missing data on passed subjects'
			else d26.perusopetuksen_oppimaaran_yksilollistaminen_en
		end
	,oppilaitoksen_maakunta_en = d10.maakunta_en

  --JARJESTYS
	,jarjestys_sukupuoli = d1.jarjestys_sukupuoli_koodi
	,jarjestys_ika = 
		case 
			when d3.ika_fi in ('0','1','2','3','4') then '04'
			when d3.ika_fi in ('5','6','7','8','9') then '0'+d3.ika_fi 
			when d3.ika_fi in ('10','11','12','13','14','15','16','17','18','19') then d3.ika_fi
			else left(d3.ikaryhma3_fi, 2)
		end
	,jarjestys_aidinkieli_ryhma = d2.jarjestys_kieliryhma2
	,jarjestys_kansalaisuus = d22.jarjestys_maatjavaltiot2_koodi
	,jarjestys_kansalaisuus_ryhma = case d22.maatjavaltiot2_fi when 'Suomi' THEN 1 else 2 end
	,jarjestys_oppilaitoksen_maakunta = d10.jarjestys_maakunta_koodi
	,d24.jarjestys_vuosiluokka
	,d24.jarjestys_vuosiluokkaryhma
	,jarjestys_erityinen_tuki = d25.jarjestys
	,jarjestys_oppimaaran_yksilollistaminen = 999999 - case when opiskelee_toiminta_alueittain = 0 and ei_oppiainesuorituksia = 1 then 0 else d26.jarjestys end
	,jarjestys_aidinkielen_oppimaara = coalesce(d26b.jarjestys, 'öööö')

FROM [dw].[f_koski_esi_ja_perus_yksilollistaminen] f
LEFT JOIN dw.d_sukupuoli d1 ON d1.id = f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_id_oppilaitos
LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi
LEFT JOIN dw.d_maatjavaltiot2 d22 ON d22.id = f.d_maatjavaltiot2_id
LEFT JOIN dw.d_vuosiluokka_tai_koulutus d24 ON d24.id = f.d_vuosiluokka_tai_koulutus_id
LEFT JOIN VipunenTK.dbo.d_perusopetuksen_tehostettu_tuki d25 ON d25.id = f.d_erityinen_tuki_johdettu_id
LEFT JOIN VipunenTK.dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d26 ON d26.id = f.d_perusopetuksen_oppimaaran_yksilollistaminen_id
LEFT JOIN dw.d_perusopetus_oppiaine_ja_oppimaara d26b ON d26b.id = f.d_perusopetus_oppiaine_ja_oppimaara_id_AI_oppimaara
LEFT JOIN dw.d_kytkin d27 ON d27.id = f.d_kytkin_id_erityisen_tuen_paatos
LEFT JOIN dw.d_kytkin d32 ON d32.id = f.d_kytkin_id_pidennetty_oppivelvollisuus
LEFT JOIN dw.d_kytkin d38 ON d38.id = f.d_kytkin_id_opiskelee_toiminta_alueittain
LEFT JOIN dw.d_kytkin d39 ON d39.id = f.d_kytkin_id_AI_oppimaara_yksilollistetty
LEFT JOIN dw.d_kytkin d40 ON d40.id = f.d_kytkin_id_MA_yksilollistetty

GO
