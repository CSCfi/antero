USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_4v]    Script Date: 17.4.2024 12:09:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_4v] as

DECLARE @alkuVuosi as int
DECLARE @loppuVuosi as int

SET @alkuVuosi = 2018
SET @loppuVuosi = YEAR(GETDATE()) - 1

TRUNCATE TABLE ANTERO.dw.f_indikaattorit_kk_4v

WHILE @alkuVuosi + 3 <= @loppuVuosi
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
