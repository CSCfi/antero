USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_koski_esi_ja_perus_oppilaat_ja_paattaneet_kk_cultures] AS

SELECT 
	apusarake_opisk = opisk
	,apusarake_tutk = tutk
	,apusarake_tilastopaiva_1_0 = tilastopaiva_1_0
	
	,apusarake_oppilaitos_oid = oppilaitos_oid
	,apusarake_oppija_oid = master_oid
	,apusarake_opiskeluoikeus_oid = opiskeluoikeus_oid
	,apusarake_tuen_paatos = tuen_paatos
	
	--aika
	,tilastovuosi = f.vuosi
	,d14.lukuvuosi
	,opiskeluoikeuden_alkamisvuosi = d14b.vuosi
	,opiskeluoikeuden_alkamisajankohta = f.oo_alkamisajankohta

  --FI
	,lukukausi_fi = d14.lukukausi_fi 
	,tilastokuukausi_fi = d14.kuukausi_fi
	,opiskeluoikeuden_alkamiskuukausi_fi = d14b.kuukausi_fi
	,opiskeluoikeus_alkanut_tilastokuukauden_aikana_fi = d38.kytkin_fi

	--hlö
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
	,kotikunta_manner_suomessa_fi = d39.kytkin_fi
	,oppivelvollinen_fi = d40.kytkin_fi
	,opiskelee_toiminta_alueittain_fi = d41.kytkin_fi
	
	--koulutus
	,koulutusmuoto_fi = d24.koulutus_fi
	,perusopetuksen_suoritustapa_fi = f.suoritustapa
	,vuosiluokka_tai_koulutus_fi = d24.vuosiluokka_fi
	,koulutus_fi = d24.vuosiluokka_fi --eri nimellä suorittaneet-raporttia varten
	,vuosiluokkaryhma_tai_koulutus_fi = d24.vuosiluokkaryhma_fi
	,suorituskieli_fi = d23.suorituskieli_yleissivistava_fi
	,muu_suorituskieli_fi = d23b.suorituskieli_yleissivistava_fi
	,kielikylpykieli_fi = d23c.suorituskieli_yleissivistava_fi
	,erityinen_tuki_fi = d25.perusopetuksen_tehostettu_tuki
	,erityisen_tuen_paatos_fi = d27.kytkin_fi
	,joustava_perusopetus_fi = d28.kytkin_fi
	,koulukoti_fi = d29.kytkin_fi
	,kuljetusetuus_fi = case when tutk > 0 or kuluva_lv_1_0 = 1 then d31.kytkin_fi else 'Tieto puuttuu' end
	,pidennetty_oppivelvollisuus_fi = d32.kytkin_fi
	,sisaoppilaitosmuotoinen_majoitus_fi = d33.kytkin_fi
	,aikuisten_perusopetuksen_alkuvaiheen_opiskelija_fi = d34.kytkin_fi
	,vuosiluokkiin_sitomaton_opetus_fi = case when tutk > 0 or kuluva_lv_1_0 = 1 then d35.kytkin_fi else 'Tieto puuttuu' end
	,ulkomailla_fi = d37.kytkin_fi
	
	--org
	,opetuksen_jarjestaja_fi = d11.organisaatio_fi
	,opetuksen_jarjestajan_yritysmuoto_fi = d11.koulutuksen_jarjestajan_yritysmuoto
	,opetuksen_jarjestajan_kunta_fi = d12.kunta_fi 
	,opetuksen_jarjestajan_maakunta_fi = d12.maakunta_fi 
	,opetuksen_jarjestajan_hyvinvointialue_fi = d12.hyvinvointialue_fi 
	,opetuksen_jarjestajan_avi_fi = d12.avi_fi 
	,opetuksen_jarjestajan_ely_fi = d12.ely_fi 
	,erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma_fi = coalesce(d26.selite_fi, 'Ei erityisen maailmankatsomuksen tai kasvatusopillisen järjestelmän tehtävää')
	,oppilaitos_fi = d9.organisaatio_fi
	,oppilaitosnumero_fi = d9.organisaatio_koodi 
	,oppilaitoksen_opetuskieli_fi = d9.oppilaitoksenopetuskieli_fi
	,oppilaitostyyppi_fi = d9.oppilaitostyyppi_fi
	,oppilaitoksen_kunta_fi = d10.kunta_fi
	,oppilaitoksen_maakunta_fi = d10.maakunta_fi
	,oppilaitoksen_hyvinvointialue_fi = d10.hyvinvointialue_fi
	,oppilaitoksen_avi_fi = d10.avi_fi
	,oppilaitoksen_ely_fi = d10.ely_fi 
	,toimipiste_fi = d7.organisaatio_fi
	,toimipisteen_kunta_fi = d8.kunta_fi
	,toimipisteen_maakunta_fi = d8.maakunta_fi

  --SV
	,lukukausi_sv = d14.lukukausi_sv 
	,tilastokuukausi_sv = d14.kuukausi_sv
	,opiskeluoikeuden_alkamiskuukausi_sv = d14b.kuukausi_sv
	,opiskeluoikeus_alkanut_tilastokuukauden_aikana_sv = d38.kytkin_sv

	--hlö
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
	,kotikunta_manner_suomessa_sv = d39.kytkin_sv
	,oppivelvollinen_sv = d40.kytkin_sv
	,opiskelee_toiminta_alueittain_sv = d41.kytkin_sv
	
	--koulutus
	,koulutusmuoto_sv = d24.koulutus_sv
	,perusopetuksen_suoritustapa_sv = f.suoritustapa
	,vuosiluokka_tai_koulutus_sv = d24.vuosiluokka_sv
	,koulutus_sv = d24.vuosiluokka_sv --eri nimellä suorittaneet-raporttia varten
	,vuosiluokkaryhma_tai_koulutus_sv = d24.vuosiluokkaryhma_sv
	,suorituskieli_sv = d23.suorituskieli_yleissivistava_sv
	,muu_suorituskieli_sv = d23b.suorituskieli_yleissivistava_sv
	,kielikylpykieli_sv = d23c.suorituskieli_yleissivistava_sv
	,erityinen_tuki_sv = d25.perusopetuksen_tehostettu_tuki_sv
	,erityisen_tuen_paatos_sv = d27.kytkin_sv
	,joustava_perusopetus_sv = d28.kytkin_sv
	,koulukoti_sv = d29.kytkin_sv
	,kuljetusetuus_sv = case when tutk > 0 or kuluva_lv_1_0 = 1 then d31.kytkin_sv else 'Information saknas' end
	,pidennetty_oppivelvollisuus_sv = d32.kytkin_sv
	,sisaoppilaitosmuotoinen_majoitus_sv = d33.kytkin_sv
	,aikuisten_perusopetuksen_alkuvaiheen_opiskelija_sv = d34.kytkin_sv
	,vuosiluokkiin_sitomaton_opetus_sv = case when tutk > 0 or kuluva_lv_1_0 = 1 then d35.kytkin_sv else 'Information saknas' end
	,ulkomailla_sv = d37.kytkin_sv
	
	--org
	,opetuksen_jarjestaja_sv = d11.organisaatio_sv
	,opetuksen_jarjestajan_yritysmuoto_sv = d11.koulutuksen_jarjestajan_yritysmuoto_sv
	,opetuksen_jarjestajan_kunta_sv = d12.kunta_sv 
	,opetuksen_jarjestajan_maakunta_sv = d12.maakunta_sv 
	,opetuksen_jarjestajan_hyvinvointialue_sv = d12.hyvinvointialue_sv 
	,opetuksen_jarjestajan_avi_sv = d12.avi_sv 
	,opetuksen_jarjestajan_ely_sv = d12.ely_sv 
	,erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma_sv = coalesce(d26.selite_sv, 'Ingen uppgift som bygger på särskild världsåskådning eller pedagogiskt system')
	,oppilaitos_sv = d9.organisaatio_sv
	,oppilaitosnumero_sv = d9.organisaatio_koodi 
	,oppilaitoksen_opetuskieli_sv = d9.oppilaitoksenopetuskieli_sv
	,oppilaitostyyppi_sv = d9.oppilaitostyyppi_sv
	,oppilaitoksen_kunta_sv = d10.kunta_sv
	,oppilaitoksen_maakunta_sv = d10.maakunta_sv
	,oppilaitoksen_hyvinvointialue_sv = d10.hyvinvointialue_sv
	,oppilaitoksen_avi_sv = d10.avi_sv
	,oppilaitoksen_ely_sv = d10.ely_sv 
	,toimipiste_sv = d7.organisaatio_sv
	,toimipisteen_kunta_sv = d8.kunta_sv
	,toimipisteen_maakunta_sv = d8.maakunta_sv

  --KOODIT
	,koodit_opetuksen_jarjestaja = d11.organisaatio_koodi
	,koodit_oppilaitos = d9.organisaatio_koodi

  --JARJESTYS
	,jarjestys_lukukausi = d14.jarjestys_lukukausi_reverse
	,jarjestys_tilastokuukausi = d14.kuukausi
	,jarjestys_opiskeluoikeuden_alkamiskuukausi = d14b.kuukausi
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
	,jarjestys_kansalaisuus_ryhma = d22.jarjestys_maanosa1_koodi
	,jarjestys_opetuksen_jarjestajan_maakunta = d12.jarjestys_maakunta_koodi
	,jarjestys_opetuksen_jarjestajan_hyvinvointialue = d12.jarjestys_hyvinvointialue_koodi
	,jarjestys_opetuksen_jarjestajan_avi = d12.jarjestys_avi_koodi
	,jarjestys_opetuksen_jarjestajan_ely = d12.jarjestys_ely_koodi
	,jarjestys_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma = coalesce(d26.koodi, 99)
	,jarjestys_oppilaitoksen_maakunta = d10.jarjestys_maakunta_koodi
	,jarjestys_oppilaitoksen_hyvinvointialue = d10.jarjestys_hyvinvointialue_koodi
	,jarjestys_oppilaitoksen_ely = d10.jarjestys_ely_koodi
	,jarjestys_oppilaitoksen_avi = d10.jarjestys_avi_koodi
	,jarjestys_oppilaitoksen_opetuskieli = d9.jarjestys_oppilaitoksenopetuskieli_koodi
	,jarjestys_oppilaitostyyppi = d9.jarjestys_oppilaitostyyppi_koodi
	,jarjestys_toimipisteen_maakunta = d8.jarjestys_maakunta_koodi
	,jarjestys_vuosiluokka_tai_koulutus = d24.jarjestys_vuosiluokka
	,jarjestys_koulutus = d24.jarjestys_vuosiluokka
	,jarjestys_vuosiluokkaryhma_tai_koulutus = d24.jarjestys_vuosiluokkaryhma
	,jarjestys_koulutusmuoto = d24.jarjestys_koulutus
	,jarjestys_erityinen_tuki = d25.jarjestys

FROM [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_kuukausittain] f
LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_organisaatioluokitus d7 ON d7.id = f.d_organisaatioluokitus_toimipiste_id
LEFT JOIN dw.d_alueluokitus d8 ON d8.kunta_koodi = d7.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d9 ON d9.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d9.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d12 ON d12.kunta_koodi = d11.kunta_koodi
LEFT JOIN dw.d_kalenteri d14 ON d14.id = f.d_kalenteri_id
LEFT JOIN dw.d_kalenteri d14b ON d14b.id = f.d_kalenteri_oo_id
LEFT JOIN dw.d_maatjavaltiot2 d22 ON d22.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN dw.d_kieli d23 ON d23.id = f.d_kieli_suorituskieli_id
LEFT JOIN dw.d_kieli d23b ON d23b.id = f.d_kieli_muu_suorituskieli_id
LEFT JOIN dw.d_kieli d23c ON d23c.id = f.d_kieli_kielikylpykieli_id
LEFT JOIN dw.d_vuosiluokka_tai_koulutus d24 ON d24.id = f.d_vuosiluokka_id
LEFT JOIN VipunenTK.dbo.d_perusopetuksen_tehostettu_tuki d25 on d25.id = f.d_erityinen_tuki_johdettu_id
LEFT JOIN dw.d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma d26 on d26.organisaatio_koodi = d11.organisaatio_koodi
--1/0
LEFT JOIN dw.d_kytkin d27 ON d27.kytkin_koodi = coalesce(f.erityisen_tuen_paatos, -1)
LEFT JOIN dw.d_kytkin d28 ON d28.kytkin_koodi = coalesce(f.joustava_perusopetus, -1)
LEFT JOIN dw.d_kytkin d29 ON d29.kytkin_koodi = coalesce(f.koulukoti, -1)
LEFT JOIN dw.d_kytkin d31 ON d31.kytkin_koodi = coalesce(f.kuljetusetu, -1)
LEFT JOIN dw.d_kytkin d32 ON d32.kytkin_koodi = coalesce(f.pidennetty_oppivelvollisuus, -1)
LEFT JOIN dw.d_kytkin d33 ON d33.kytkin_koodi = coalesce(f.sisaoppilaitosmainen_majoitus, -1)
LEFT JOIN dw.d_kytkin d34 ON d34.kytkin_koodi = coalesce(f.aikuisten_alkuvaihe_1_0, -1)
LEFT JOIN dw.d_kytkin d35 ON d35.kytkin_koodi = coalesce(f.vuosiluokkiin_sitoutumaton_opetus, -1)
LEFT JOIN dw.d_kytkin d37 ON d37.kytkin_koodi = coalesce(f.ulkomailla, -1)
LEFT JOIN dw.d_kytkin d38 ON d38.kytkin_koodi = coalesce(f.oo_alkanut_kuussa_1_0, -1)
LEFT JOIN dw.d_kytkin d39 ON d39.kytkin_koodi = coalesce(f.kotikunta_manner_suomessa, -1)
LEFT JOIN dw.d_kytkin d40 ON d40.kytkin_koodi = coalesce(f.oppivelvollinen, -1)
LEFT JOIN dw.d_kytkin d41 ON d41.kytkin_koodi = coalesce(f.opiskelee_toiminta_alueittain, -1)

WHERE kuutioon_1_0 = 1

GO
