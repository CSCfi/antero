USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen]    Script Date: 27.8.2025 10.53.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen] as

TRUNCATE TABLE [dw].[f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen]

INSERT INTO [dw].[f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen] 

SELECT 

	f.aloitusvuosi,
	f.tutkinnon_suoritusvuosi,
	CASE
		WHEN f.tutkinnon_suoritusvuosi < f.ensimmaisen_vaihdon_alkamisvuosi or f.aloitusvuosi > f.ensimmaisen_vaihdon_alkamisvuosi THEN NULL
		ELSE f.ensimmaisen_vaihdon_alkamisvuosi
	END as vaihtovuosi,
	CASE
		WHEN f.tutkinnon_suoritusvuosi < f.ensimmaisen_vaihdon_alkamisvuosi or f.aloitusvuosi > f.ensimmaisen_vaihdon_alkamisvuosi THEN NULL
		ELSE d6.id 
	END as d_kalenteri_vaihto_alkanut_id,

	d1.id as d_organisaatioluokitus_id,
	s.koodi as 'korkeakoulun_lyhenne',
	d2.id as d_koulutusluokitus_id,
	d3.id as d_sukupuoli_id,
	d4.id as d_maatjavaltiot2_kansalaisuus_id,
	d5.id as d_kieli_aidinkieli_id,
	d7a.id as d_ika_aloittaessa_id,
	d7b.id as d_ika_valmistuessa_id,

	CASE 
		WHEN f.vaihtojakso = 0 OR f.tutkinnon_suoritusvuosi < f.ensimmaisen_vaihdon_alkamisvuosi or f.opintopisteet_vaihdossa = 0 or f.aloitusvuosi > f.ensimmaisen_vaihdon_alkamisvuosi THEN 0
		ELSE f.opintopisteet_vaihdossa
	END as opintopisteet_vaihdossa,
	f.opintopisteet_yhteensa,
	f.tavoiteajassa_valmistunut,
	f.enintaan_12kk_yli_tavoitteen,
	f.yli_12kk_tavoitteesta,
	f.on_aiempi_tutkinto,
	CASE
		WHEN f.tutkinnon_suoritusvuosi < f.ensimmaisen_vaihdon_alkamisvuosi or f.aloitusvuosi > f.ensimmaisen_vaihdon_alkamisvuosi THEN 0
		ELSE f.vaihtojakso
	END as vaihtojakso,
	CASE
		WHEN f.tutkinnon_suoritusvuosi < f.ensimmaisen_vaihdon_alkamisvuosi or f.aloitusvuosi > f.ensimmaisen_vaihdon_alkamisvuosi THEN NULL
		WHEN f.vaihtolukuvuoden_jarjestysluku > f.ensimmaisen_vaihdon_alkamisvuosi - f.aloitusvuosi + 1 or f.vaihtolukukauden_jarjestysluku = 0 THEN f.ensimmaisen_vaihdon_alkamisvuosi - f.aloitusvuosi + 1
		ELSE f.vaihtolukuvuoden_jarjestysluku
	END as vaihtolukuvuoden_jarjestysluku,
	CASE
		WHEN f.tutkinnon_suoritusvuosi < f.ensimmaisen_vaihdon_alkamisvuosi or f.aloitusvuosi > f.ensimmaisen_vaihdon_alkamisvuosi THEN NULL
		ELSE f.vaihtolukukauden_jarjestysluku
	END as vaihtolukukauden_jarjestysluku,
	f.opiskelijaAvain,
	f.opiskeluoikeusAvain,
	CONCAT(f.opiskelijaAvain,f.opiskeluoikeusAvain,f.organisaatiokoodi) as avain,

	getdate() as loadtime,
	SUSER_SNAME() as username,
	'ETL: p_lataa_f_virta_otp_vaihtojaksojen_vaikutus_valmistumiseen' as source

FROM [VirtaSiirto].[dbo].[VaihtojaksojenVaikutusTutkinnonSuoritusAikaan] f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = f.organisaatiokoodi
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutuskoodi
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi = f.sukupuoli
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = f.kansalaisuus
LEFT JOIN ANTERO.dw.d_kieli d5 on d5.kieli_koodi = aidinkieli
LEFT JOIN ANTERO.dw.d_kalenteri d6 on d6.kalenteri_avain = DATEFROMPARTS(f.ensimmaisen_vaihdon_alkamisvuosi, f.ensimmaisen_vaihdon_alkamiskausi, 1)
LEFT JOIN ANTERO.dw.d_ika d7a on d7a.ika_avain = f.aloitusvuosi - YEAR(f.syntymaaika)
LEFT JOIN ANTERO.dw.d_ika d7b on d7b.ika_avain = f.tutkinnon_suoritusvuosi - YEAR(f.syntymaaika)
LEFT JOIN ANTERO.sa.sa_koodistot s on s.nimi = f.organisaatiokoodi and s.koodisto = 'virtakorkeakoulutunnus'
WHERE f.aloitusvuosi - YEAR(f.syntymaaika) <= 25 and d4.maanosa4_fi = 'Suomi' and d5.kieli_fi in ('suomi', 'ruotsi') and
f.tutkinnon_suoritusvuosi < YEAR(GETDATE()) and f.aloitusvuosi >= 2010
GO


