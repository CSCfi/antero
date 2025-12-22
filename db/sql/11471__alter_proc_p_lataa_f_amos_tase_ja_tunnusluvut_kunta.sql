USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kunta]    Script Date: 22.12.2025 7.29.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


























ALTER PROCEDURE [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kunta] AS

/*
*/



EXEC [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely]



	TRUNCATE TABLE dw.f_amos_tase_ja_tunnusluvut_kunta

	;WITH puuttuvat AS (		
		SELECT DISTINCT
			 [vuosi]
			,[ytunnus]
			,[omistajatyyppi_nimi]
		FROM [dw].[f_amos_tase_ja_tunnusluvut_kustannuskysely]
		WHERE omistajatyyppi_nimi= 'Kuntayhtymä')

	INSERT INTO dw.f_amos_tase_ja_tunnusluvut_kunta

	SELECT
		 p.vuosi
		,f.ytunnus 
		,tili = t.tunnusluku
		,t.sarake
		,p.omistajatyyppi_nimi
		,maara_euroa = f.arvo


	FROM [sa].[sa_kuntatalous] f
    JOIN [dw].[d_amos_tase_ja_tunnusluvut_kunta] t on t.koodi = f.tunnusluku and t.versio = SUBSTRING(f.taksonomia, 1, 11) and t.vuosi = SUBSTRING(f.taksonomia, 13, 4)
	JOIN puuttuvat p on p.vuosi = SUBSTRING(f.raportointikausi, 1, 4) and p.ytunnus= f.ytunnus
	WHERE t.koodi !='Tieto puuttuu'