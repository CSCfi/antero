USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_arvo_osaamisen_hankkimistavat_amis]    Script Date: 7.4.2026 15.03.41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













ALTER   PROCEDURE  [sa].[p_lataa_arvo_osaamisen_hankkimistavat_amis] AS

DECLARE @arguments1 nvarchar(max)
DECLARE @arguments2 nvarchar(max)
DECLARE @query nvarchar(max)

SELECT 
	@arguments1 = COALESCE(@arguments1 + ', CASE WHEN kt.tutkinnon_osat_' + oht + ' is not NULL THEN ''' + oht + ''' ELSE NULL END', ', CASE WHEN kt.tutkinnon_osat_' + oht +' is not NULL THEN ''' + oht + ''' ELSE NULL END')
	,@arguments2 = COALESCE(@arguments2 + ', CASE WHEN tutkinnon_osat_' + oht + ' is not NULL THEN ''' + oht + ''' ELSE NULL END', ', CASE WHEN tutkinnon_osat_' + oht +' is not NULL THEN ''' + oht + ''' ELSE NULL END')
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
      ,osaamisen_hankkimistavat = Concat_ws(''_''' + @arguments2 + ')
	 FROM [Arvo_SA].[sa].[sa_arvo_v2_vastaajatunnukset]
     WHERE (tutkinnon_osat_koulutussopimus is not NULL or tutkinnon_osat_oppilaitosmuotoinenkoulutus is not NULL or tutkinnon_osat_oppisopimus is not NULL) AND YEAR(voimassa_alkupvm) > 2021
	 UNION 
	  SELECT
	   kt.vastaajatunnusid
      ,osaamisen_hankkimistavat = Concat_ws(''_''' + @arguments1 + ')
	 FROM [Arvo_SA].[sa].[sa_arvo_kohteet_taustatiedot] kt
	 LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kohteet] k on kt.vastaajatunnusid = k.vastaajatunnusid
     WHERE (kt.tutkinnon_osat_koulutussopimus is not NULL or kt.tutkinnon_osat_oppilaitosmuotoinenkoulutus is not NULL or kt.tutkinnon_osat_oppisopimus is not NULL) AND (vastaajatunnus_alkupvm) <= 2021) Q
'
EXEC SP_EXECUTESQL @query;