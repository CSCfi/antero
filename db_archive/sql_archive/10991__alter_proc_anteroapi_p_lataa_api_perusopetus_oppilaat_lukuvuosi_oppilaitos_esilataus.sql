USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_perusopetus_oppilaat_lukuvuosi_oppilaitos_esilataus]    Script Date: 4.8.2025 12.27.42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER   PROCEDURE  [dw].[p_lataa_api_perusopetus_oppilaat_lukuvuosi_oppilaitos_esilataus] AS

DROP TABLE IF EXISTS [dw].[api_perusopetus_oppilaat_lukuvuosi_oppilaitos]

SELECT 
	defaultorder = ROW_NUMBER() OVER(ORDER BY f.lukuvuosi, f.koodit_opetuksen_jarjestajan_maakunta, f.opetuksen_jarjestaja, f.oppilaitos),
	* 
INTO AnteroAPI.dw.[api_perusopetus_oppilaat_lukuvuosi_oppilaitos]
FROM (
	SELECT 
		f.lukuvuosi,
		d12.maakunta_fi as opetuksen_jarjestajan_maakunta,
		d11.organisaatio_fi as opetuksen_jarjestaja,
		d5.organisaatio_fi as oppilaitos,
		d12.maakunta_koodi as koodit_opetuksen_jarjestajan_maakunta,
		d11.organisaatio_koodi as koodit_opetuksen_jarjestaja,
		d5.organisaatio_koodi as koodit_oppilaitos,
		oppilaat_lukuvuosi_lkm = COUNT(DISTINCT CASE WHEN opisk = 1 THEN master_oid ELSE NULL END),
		oppilaat_syyslukukausi_lkm = COUNT(DISTINCT CASE WHEN opisk = 1 and d14.koodi = 'S' THEN master_oid ELSE NULL END),
		oppilaat_kevatlukukausi_lkm = COUNT(DISTINCT CASE WHEN opisk = 1 and d14.koodi = 'K' THEN master_oid ELSE NULL END)
	FROM ANTERO.dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain f
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
	LEFT JOIN ANTERO.dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi 
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
	LEFT JOIN ANTERO.dw.d_alueluokitus d12 ON d12.kunta_koodi = d11.kunta_koodi
	LEFT JOIN ANTERO.dw.d_kausi d14 ON d14.id = f.d_kausi_id
	LEFT JOIN ANTERO.dw.d_vuosiluokka_tai_koulutus d24 ON d24.id = f.d_vuosiluokka_id
	WHERE kuutioon_1_0 = 1 and d24.koulutus_fi = 'Perusopetus'
	GROUP BY f.lukuvuosi, d12.maakunta_fi, d11.organisaatio_fi,
	d5.organisaatio_fi, d11.organisaatio_koodi, d12.maakunta_koodi, d5.organisaatio_koodi
) f
WHERE f.oppilaat_lukuvuosi_lkm > 0


GO


