USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_4v]    Script Date: 8.4.2025 7.40.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_4v] as

DECLARE @alkuVuosi as int
DECLARE @loppuVuosi as int

SET @alkuVuosi = 2018
SET @loppuVuosi = YEAR(GETDATE())

TRUNCATE TABLE ANTERO.dw.f_indikaattorit_kk_4v

-- Julkaistaan vuodesta 2026 alkaen uusi nelivuotiskausi vasta huhtikuun puolessa välissä
WHILE @alkuVuosi + 3 < @loppuVuosi AND (@loppuVuosi < 2026 OR GETDATE() >= DATEFROMPARTS(@alkuVuosi + 4, 4, 15))
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

GO

USE [ANTERO]
