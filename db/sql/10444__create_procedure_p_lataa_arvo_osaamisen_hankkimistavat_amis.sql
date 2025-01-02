USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_arvo_osaamisen_hankkimistavat_amis]    Script Date: 27.12.2024 15.44.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE  [sa].[p_lataa_arvo_osaamisen_hankkimistavat_amis] AS

DECLARE @arguments nvarchar(max)
DECLARE @query nvarchar(max)

SELECT 
	@arguments = COALESCE(@arguments + ', CASE WHEN tutkinnon_osat_' + oht + ' is not NULL THEN ''' + oht + ''' ELSE NULL END', ', CASE WHEN tutkinnon_osat_' + oht +' is not NULL THEN ''' + oht + ''' ELSE NULL END')
FROM (
	SELECT DISTINCT 
		oht = koodi
		,jarjestys
		,rnk = cast(rank() over (order by jarjestys) as char(1))
	FROM dw.d_osaamisen_hankkimistapa
	WHERE koodi != '-1'
) PV  
ORDER BY rnk

SET @query = 
' DROP TABLE IF EXISTS sa.sa_arvo_osaamisen_hankkimistavat_amis
	SELECT 
		*	
	INTO sa.sa_arvo_osaamisen_hankkimistavat_amis

	FROM ( 
	 SELECT
	   vastaajatunnusid
      ,osaamisen_hankkimistavat = Concat_ws(''_''' + @arguments + ')
	 FROM [Arvo_SA].[sa].[sa_arvo_kohteet_taustatiedot]
     WHERE tutkinnon_osat_koulutussopimus is not NULL or tutkinnon_osat_oppilaitosmuotoinenkoulutus is not NULL or tutkinnon_osat_oppisopimus is not NULL) Q
'
EXEC SP_EXECUTESQL @query;
