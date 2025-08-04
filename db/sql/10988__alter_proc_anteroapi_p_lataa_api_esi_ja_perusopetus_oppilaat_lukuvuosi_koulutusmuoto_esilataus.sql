USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto_esilataus]    Script Date: 4.8.2025 12.24.41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER   PROCEDURE [dw].[p_lataa_api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto_esilataus] AS

TRUNCATE TABLE [dw].[api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto]

INSERT INTO [dw].[api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto]

SELECT 
	defaultorder = ROW_NUMBER() OVER(ORDER BY d3.lukuvuosi, d2.koulutus_fi, d1.organisaatio_fi),
	lukuvuosi = d3.lukuvuosi,
	koulutusmuoto = d2.koulutus_fi,
	opetuksen_jarjestaja = d1.organisaatio_fi,
	oppilaatLkm = COUNT(DISTINCT CASE WHEN opisk = 1 THEN master_oid ELSE NULL END),
	d1.organisaatio_koodi as koodiOpetuksenJarjestaja
FROM ANTERO.dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_kuukausittain f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN ANTERO.dw.d_vuosiluokka_tai_koulutus d2 ON d2.id = f.d_vuosiluokka_id
LEFT JOIN ANTERO.dw.d_kalenteri d3 ON d3.id = f.d_kalenteri_id
WHERE kuutioon_1_0 = 1 and CAST(LEFT(d3.lukuvuosi,4) as int) > 2019
GROUP BY d3.lukuvuosi, d2.koulutus_fi, d1.organisaatio_fi, d1.organisaatio_koodi

GO


