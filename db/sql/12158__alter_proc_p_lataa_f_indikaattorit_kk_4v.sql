USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_4v]    Script Date: 26.8.2026 9.53.03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_4v] as

DECLARE @alkuVuosi as int
DECLARE @loppuVuosi as int
DECLARE @julkaisuPvm as date

SET @alkuVuosi = 2018
SET @loppuVuosi = YEAR(GETDATE())
SET @julkaisuPvm = (SELECT MAX(aloittaneet) FROM ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt WHERE haku = 'Erillishaku' and koulutuksen_alkamiskausi = CONCAT(@loppuVuosi,2))

TRUNCATE TABLE ANTERO.dw.f_indikaattorit_kk_4v

-- Julkaistaan uusi nelivuotiskausi erillishakujen lopullisten tietojen julkaisun yhteydessä
WHILE @alkuVuosi + 3 < @loppuVuosi OR (@alkuVuosi + 3 = @loppuVuosi AND GETDATE() >= COALESCE(@julkaisuPvm,'9999-12-31'))
BEGIN

	INSERT INTO ANTERO.dw.f_indikaattorit_kk_4v
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		f.arvo_sektori,
		f.indikaattori,
		CONCAT(@alkuvuosi, '-', @alkuVuosi + 3) as nelivuotiskausi,
		GETDATE() as loadtime,
		SUSER_NAME() as username,
		'ETL: p_lataa_f_indikaattorit_kk_4v' as source
	FROM ANTERO.dw.f_indikaattorit_kk f
	WHERE f.tilastovuosi BETWEEN @alkuVuosi and @alkuVuosi + 3

	SET @alkuVuosi = @alkuVuosi + 1

END

UPDATE ANTERO.dbo.pbi_dataset_tabular
SET PendingRefresh = 1
WHERE tabular = 'Korkeakoulujen indikaattorit'