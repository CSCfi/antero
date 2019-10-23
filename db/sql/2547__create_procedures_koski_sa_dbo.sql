USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_eperusteet_liputa_usean_tutkinnon_tutkinnonosat]    Script Date: 23.10.2019 18:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_eperusteet_liputa_usean_tutkinnon_tutkinnonosat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_eperusteet_liputa_usean_tutkinnon_tutkinnonosat] AS' 
END
GO




ALTER PROCEDURE [dbo].[p_lataa_eperusteet_liputa_usean_tutkinnon_tutkinnonosat] AS

TRUNCATE TABLE [dbo].[eperusteet_liputa_usean_tutkinnon_tutkinnonosat]

INSERT INTO [dbo].[eperusteet_liputa_usean_tutkinnon_tutkinnonosat]

SELECT
	cast(koodiarvo as varchar(25)) as tutkinnonosa_koodi_char
	,koodiarvo as tutkinnonosa_koodi
	,count(koodiarvo) as lkm
	,case 
		when count(koodiarvo) > 1 then 1 
		else 0 
	 end as usean_tutkinnon_tutkinnonosa 
FROM (

	SELECT distinct [eperusteid],
		[koodiarvo] 
	FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat]

) t
GROUP BY koodiarvo





GO
/****** Object:  StoredProcedure [dbo].[p_lataa_eperusteet_osaamisalat_tutkinnonosat_laajuudet]    Script Date: 23.10.2019 18:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_eperusteet_osaamisalat_tutkinnonosat_laajuudet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_eperusteet_osaamisalat_tutkinnonosat_laajuudet] AS' 
END
GO







ALTER PROCEDURE [dbo].[p_lataa_eperusteet_osaamisalat_tutkinnonosat_laajuudet] AS


TRUNCATE TABLE [dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet]

INSERT INTO [dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet]

SELECT DISTINCT
-- jhe 23.5 2019 raskas distinct siksi, että eper virheen takia erään tutkinnonosakoodin takaa..
--.. löytyy useampaa kuin yhtä laajuutta ja tämä tuottaisi ylimääräisiä rivejä sp-laskennassa
--.. oikeat arvot tuodaa sp-laskennassa mukaan vastaavasti kovakoodattuna

-- jhe 4.6.2019, id komm pois
  t.eperusteid, 
  t.diaarinumero, 
  t.diaarivuosi, 
  --jhe 13.5.2019 yhdistelmäavaimet
  -- osaamisalan yhdistelmäavain, jos ei osaamisaloja, käytetään tutkinnon yhdistelmäavainta

  case when t.osaamisala_koodi is null then t.diaarinumero + '_' + cast(
    t.tutkinto_koodi as varchar(100))
   else diaarinumero + '_' + cast(
    t.tutkinto_koodi as varchar(100)
  )+ '_' + cast(
    t.osaamisala_koodi as varchar(100)
	  )+ '_' + cast(
    t.tutkinnonosa_koodi as varchar(100)
  ) end as diaarinumero_tutkinto_osaamisala_tutkinnonosa_koodi, 

  case when t.osaamisala_koodi is null then t.diaarinumero + '_' + cast(
    t.tutkinto_koodi as varchar(100))
   else diaarinumero + '_' + cast(
    t.tutkinto_koodi as varchar(100)
  )+ '_' + cast(
    t.osaamisala_koodi as varchar(100)
  ) end as diaarinumero_tutkinto_osaamisala_koodi, 

  --diaarinumeron ja tutkinnonosan yhdistelmäavain
  t.diaarinumero + '_' + cast(
    t.tutkinnonosa_koodi as varchar(100)
  ) as diaarinumero_tutkinnonosa_koodi, 
  
  --tutkinnon ja tutkinnonosan yhdistelmäavain
  t.diaarinumero + '_' + cast(
    t.tutkinto_koodi as varchar(100)
  )+ '_' + cast(
    t.tutkinnonosa_koodi as varchar(100)
  ) as diaarinumero_tutkinto_tutkinnonosa_koodi, 
  
  --tutkinnon yhdistelmäavain
  t.diaarinumero + '_' + cast(
    t.tutkinto_koodi as varchar(100)
  ) as diaarinumero_tutkinto_koodi, 
  
  CASE WHEN t.tutkinnonosa_koodi IS NULL THEN t.tutkinto_koodi ELSE CAST(
    t.tutkinto_koodi AS varchar(20)
  ) + '_' + CAST(
    t.tutkinnonosa_koodi AS varchar(20)
  ) END AS tutkinto_ja_tutkinnonosa_koodi, 


  kl.tutkintotyyppinimi AS tutkintotyyppi, 
  t.tutkinto_koodi, 
  t.tutkinto, 
  t.tutkinnon_laajuus, 
  t.osaamisala_koodi, 
  t.osaamisala, 
  t.tutkinnonosa, 
  t.tutkinnonosa_koodi, 

      	-- jhe 23.5. päättely, jolla ratkaistaan muutaman tutkintokoodin
	--.. kohdalle sattunut virhe, kaksi laajuutta samalla koodilla
	--.. tässä kovakoodataan niille tilapäisesti arvoksi 0, tämä oikaistaan myöhemmin 
	--AP 10.10.2019 korvattu alla nollat näkymän v_amos_spl_suoritepaatoslaskennan_tiedot_laajat arvoilla
	case 
		when t.diaarinumero='OPH-1224-2018' and t.tutkinnonosa_koodi=300400 then 50
		when t.diaarinumero='OPH-1224-2018' and t.tutkinnonosa_koodi=300403 then 50
		when t.diaarinumero='OPH-1396-2018' and t.tutkinnonosa_koodi=300400 then 30
		when t.diaarinumero='OPH-1396-2018' and t.tutkinnonosa_koodi=300403 then 30
		else t.tutkinnonosa_laajuus 
	end as tutkinnonosa_laajuus, 

--  t.tutkinnonosa_laajuus, 
  t.tutkinnonosa_pakollinen, 
  t.eperuste_tila, 
  t.eperuste_voimassaoloalkaa, 
  t.eperuste_voimassaololoppuu, 
  t.eperuste_paatospvm, 
  t.eperuste_siirtymapaattyy,

  rank() over (partition by tutkinnonosa_koodi order by osaamisala) as rnk,
  rank() over (partition by tutkinnonosa_koodi order by osaamisala, eperuste_voimassaoloalkaa desc, eperusteid desc,tutkinnonosa_pakollinen, coalesce(tutkinnonosa_laajuus,0) desc) as rnk2

/*--ks. 23.5 kommentit
  ,t.vanhan_tutkinnon_koodi,
  t.vanha_tutkinto*/
FROM (

    SELECT DISTINCT 
		
		ep.diaarinumero, 
		Cast(
		RIGHT(ep.diaarinumero, 4) AS INT
		) AS diaarivuosi, 
		ep.eperusteid AS eperusteid, 
		ep.tutkintokoodi AS tutkinto_koodi, 
		ep.nimi_fi AS tutkinto, 
		--jhe 14.5.2019 jos vanha tutkinto, laajuus vtl-taulusta, korjaus 23.5, ei otetakaan 
		/*isnull(vtl.tutkinnon_laajuus,eptl.minimilaajuus) AS tutkinnon_laajuus, */
		eptl.minimilaajuus AS tutkinnon_laajuus, 
		epo.osaamisala_koodi, 
		epo.nimi_fi AS osaamisala, 
		epto.nimi_fi AS tutkinnonosa, 
		epto.koodiarvo AS tutkinnonosa_koodi,
		--jhe 14.5.2019 jos vanha tutkinto, laajuus vtl-taulusta, korjaus 23.5, ei otetakaan 
		/*isnull(vtl.tutkinnonosa_laajuus,spst.tutkinnonosa_laajuus) as tutkinnonosa_laajuus, */

		spst.tutkinnonosa_laajuus as tutkinnonosa_laajuus, 
		spst.pakollinen AS tutkinnonosa_pakollinen, 
		ep.tila AS eperuste_tila, 
		ep.voimassaoloalkaa AS eperuste_voimassaoloalkaa, 
		ep.voimassaololoppuu AS eperuste_voimassaololoppuu, 
		ep.paatospvm AS eperuste_paatospvm, 
		ep.siirtymapaattyy AS eperuste_siirtymapaattyy
		-- ks. muut 235. kommentit 
		/*,vtl.tutkinto_koodi as vanhan_tutkinnon_koodi,
		case when vtl.tutkinto_koodi is null then 0 else 1 end as vanha_tutkinto*/ 
	  
    FROM [sa].[v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat] AS spst 
	INNER JOIN sa.sa_eperusteet_tutkinnonosat AS epto ON epto.tutkinnonosaid = spst.eto_tutkinnonosaid and epto.eperusteid=spst.tov_eperusteid
	LEFT JOIN sa.sa_eperusteet_osaamisalat AS epo ON epo.eperusteid = epto.eperusteid 
	RIGHT OUTER JOIN sa.sa_eperusteet AS ep ON ep.eperusteid = epto.eperusteid
	LEFT OUTER JOIN sa.v_eperusteet_tutkintojen_laajuudet AS eptl ON eptl.eperusteid = ep.eperusteid  
	--INNER JOIN sa.v_eperusteet_tutkintojen_laajuudet AS eptl 
      
	--jhe 23.5 Sepon uuden speksin mukaan vanhojen tutkintojen laajuus tuodaan diaarinumerolla
	--.. taulusta [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus]
	--.. tätä ei voi tehdä osasuoritustasolla, koska diaarinro on pääsuoritustasolla..
	--.. joten vanhojen laajuutta ei ketjutetakaan eperuste-kyselyyn kuten aiemmin speksattu:
	/*left JOIN sa.f_spl_vanhat_tutkinnot_laajuus vtl ON vtl.tutkinto_koodi=ep.tutkintokoodi*/

) AS t 

INNER JOIN antero.sa.sa_koulutusluokitus AS kl ON t.tutkinto_koodi = kl.koodi



GO
/****** Object:  StoredProcedure [dbo].[p_lataa_eperusteet_tutkinnonosa_tutkinto_kustannusryhma]    Script Date: 23.10.2019 18:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_eperusteet_tutkinnonosa_tutkinto_kustannusryhma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_eperusteet_tutkinnonosa_tutkinto_kustannusryhma] AS' 
END
GO


ALTER PROCEDURE [dbo].[p_lataa_eperusteet_tutkinnonosa_tutkinto_kustannusryhma] AS

TRUNCATE TABLE dbo.eperusteet_tutkinnonosa_tutkinto_kustannusryhma

INSERT INTO dbo.eperusteet_tutkinnonosa_tutkinto_kustannusryhma

--uloin select tarvitaan sellaisten tutkinnonosakoodien takia, joihin liittyy monta osaamisalaa ja vain osa löytyy kustannusryhmä taulusta
SELECT 
	tutkinnonosa_koodi
	,tutkinto_koodi
	,osaamisala_koodi = case max(coalesce(osaamisala,0)) when 0 then null else max(coalesce(osaamisala,0)) end
	,kuuluu_useaan_tutkintoon
	,kuuluu_eri_kustannusryhmiin
	,kuuluu_useaan_tutkintoon_yksi_kustannusryhma
FROM (

	SELECT DISTINCT
		 q.tutkinnonosa_koodi
		,tutkinto_koodi = e2.tutkintokoodi
		,osaamisala = CASE WHEN e2.osaamisala_koodi IN (SELECT osaamisala_koodi FROM ANTERO.sa.sa_amos_osaamisala_kustannusryhma) THEN e2.osaamisala_koodi ELSE 0 END
		,kuuluu_useaan_tutkintoon
		,kuuluu_eri_kustannusryhmiin
		,kuuluu_useaan_tutkintoon_yksi_kustannusryhma = kustannusryhma
	FROM (
	--tutkinnonosat jotka kuuluu useaan tutkintoon
		SELECT 
			tutkinnonosa_koodi = eto.koodiarvo
			,kuuluu_useaan_tutkintoon = case when count(distinct e.tutkintokoodi) > 1 then 1 else 0 end
		FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] eto
		JOIN Koski_SA.sa.sa_eperusteet e on e.eperusteid=eto.eperusteid
		group by eto.koodiarvo
	) q

	--haetaan niille tutkinnonosakoodeille tutkintokoodi, jotka eivät kuulu useaan tutkintoon
	left join (
		SELECT distinct
			eto.koodiarvo 
			,e.tutkintokoodi
			,eoa.osaamisala_koodi
		FROM [sa].[sa_eperusteet_tutkinnonosat] eto
		JOIN Koski_SA.sa.sa_eperusteet e on e.eperusteid = eto.eperusteid
		LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat eoa on eoa.eperusteid = eto.eperusteid
	) e2 on e2.koodiarvo = q.tutkinnonosa_koodi AND kuuluu_useaan_tutkintoon = 0

	--haetaan niille tutkinnonosakoodeille "kuuluu eri kustannusryhmiin" -tieto, jotka kuuluvat useaan tutkintoon
	left join (
		SELECT 
			tutkinnonosa_koodi
			,kuuluu_eri_kustannusryhmiin = CASE WHEN min(kustannusryhma) != max(kustannusryhma) THEN 1 ELSE 0 END
			,kustannusryhma = CASE WHEN min(kustannusryhma) = max(kustannusryhma) THEN min(kustannusryhma) ELSE NULL END
		FROM (

			SELECT DISTINCT
				tutkinnonosa_koodi = eto.koodiarvo
				,tutkinto_koodi = e.tutkintokoodi
				,eoa.osaamisala_koodi
				,kustannusryhma = CASE WHEN okr.kustannusryhma_koodi IS NULL THEN tkr.kustannusryhma_koodi ELSE okr.kustannusryhma_koodi END
			FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] eto
			JOIN Koski_SA.sa.sa_eperusteet e ON e.eperusteid = eto.eperusteid
			LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat eoa ON eoa.eperusteid = eto.eperusteid
			LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = e.tutkintokoodi
			LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = eoa.osaamisala_koodi
			WHERE eto.koodiarvo IN (
				SELECT 
					tutkinnonosa_koodi = eto.koodiarvo
				FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] eto
				JOIN Koski_SA.sa.sa_eperusteet e on e.eperusteid=eto.eperusteid
				group by eto.koodiarvo
				having count(distinct e.tutkintokoodi) > 1
			)

		) q
		GROUP BY tutkinnonosa_koodi

	) e3 ON e3.tutkinnonosa_koodi = q.tutkinnonosa_koodi AND kuuluu_useaan_tutkintoon = 1

	WHERE tutkintokoodi IS NOT NULL OR osaamisala_koodi IS NOT NULL OR kuuluu_useaan_tutkintoon = 1


) q2
GROUP BY tutkinnonosa_koodi
	,tutkinto_koodi
	,kuuluu_useaan_tutkintoon
	,kuuluu_eri_kustannusryhmiin
	,kuuluu_useaan_tutkintoon_yksi_kustannusryhma
ORDER BY tutkinnonosa_koodi
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_kustannusryhma_osasuoritus]    Script Date: 23.10.2019 18:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_kustannusryhma_osasuoritus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_kustannusryhma_osasuoritus] AS' 
END
GO



ALTER procedure [dbo].[p_lataa_kustannusryhma_osasuoritus] AS

TRUNCATE TABLE dbo.kustannusryhma_osasuoritus

INSERT INTO dbo.kustannusryhma_osasuoritus

SELECT DISTINCT
	 tutkinnonosa_koodi = epe_to.[koodiarvo]
	,tutkinnonosa_nimi_fi = epe_to.[nimi_fi]
	,tutkinto_koodi = epe.tutkintokoodi
	,tutkinto_nimi_fi = epe.nimi_fi
	,osaamisala_koodi = oa.osaamisala_koodi
	,osaamisala_nimi_fi = oa.nimi_fi
	,COALESCE(kr1.kustannusryhma_koodi, kr2.kustannusryhma_koodi)
FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] epe_to
LEFT JOIN Koski_SA.sa.sa_eperusteet epe on epe.eperusteid = epe_to.eperusteid
LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat oa on oa.eperusteid = epe_to.eperusteid
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = epe.tutkintokoodi
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma kr1 on kr1.osaamisala_koodi = oa.osaamisala_koodi
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma kr2 on kr2.tutkinto_koodi = COALESCE(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

WHERE RIGHT(diaarinumero,4) = (SELECT MAX(RIGHT(diaarinumero,4)) FROM Koski_SA.SA.sa_eperusteet epe2 WHERE epe2.tutkintokoodi = epe.tutkintokoodi)

ORDER BY tutkinnonosa_koodi


GO
/****** Object:  StoredProcedure [dbo].[p_lataa_kustannusryhma_tutkinto_ja_osaamisala]    Script Date: 23.10.2019 18:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_kustannusryhma_tutkinto_ja_osaamisala]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_kustannusryhma_tutkinto_ja_osaamisala] AS' 
END
GO






ALTER PROCEDURE [dbo].[p_lataa_kustannusryhma_tutkinto_ja_osaamisala] AS

TRUNCATE TABLE [dbo].[kustannusryhma_tutkinto_ja_osaamisala]

INSERT INTO [dbo].[kustannusryhma_tutkinto_ja_osaamisala]

SELECT distinct  
	diaarinumero_tutkinto_ja_osaamisala_koodi,
	CASE 
		WHEN osaamisala_koodi IS NULL THEN tutkinto_koodi 
		ELSE CAST(tutkinto_koodi AS varchar(20)) + '_' + CAST(osaamisala_koodi AS varchar(20)) 
	END AS tutkinto_ja_osaamisala_koodi, tutkinto_koodi
	,osaamisala_koodi
	,tutkinto_kustannusryhma_koodi
	,osaamisala_kustannusryhma_koodi
FROM (
	SELECT DISTINCT 
		epto.diaarinumero_tutkinto_ja_osaamisala_koodi
		,epto.tutkinto_koodi
		,okr.osaamisala_koodi
		,CASE 
			WHEN tkr.kustannusryhma_koodi = 'vt' THEN '1' 
			ELSE tkr.kustannusryhma_koodi 
		END AS tutkinto_kustannusryhma_koodi
		,CASE 
			WHEN epto.osaamisala_koodi IS NULL THEN NULL 
			ELSE ISNULL(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi) 
		END AS osaamisala_kustannusryhma_koodi
                          
	FROM Koski_SA.sa.v_eperusteet_tutkinnot_osaamisalat AS epto 
	LEFT OUTER JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma AS okr ON epto.osaamisala_koodi = okr.osaamisala_koodi 
	LEFT OUTER JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma AS tkr ON epto.tutkinto_koodi = tkr.tutkinto_koodi
    --WHERE tkr.kustannusryhma_koodi IS NOT NULL --AP 19.6.2019 onko tämä tarpeellinen
) AS t









GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 23.10.2019 18:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu] AS' 
END
GO




ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu] AS

TRUNCATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]

;WITH CTE AS (
	SELECT
		opiskeluoikeus_oid
		,sisaltyy_opiskeluoikeuteen_oid
		,koulutustoimija_oid
		,oppilaitos_oid
		,alkamispaiva
		,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
	FROM koski_sa.sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
)

INSERT INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]

SELECT 
	ptkr.toimipiste_oid, 
	ptkr.koulutustoimija_oid as koulutustoimija_oid,
	ptkr.opiskeluoikeus_oid, 
	ptkr.paatason_suoritus_id, 
	NULL AS suoritustason_tunniste,
	NULL AS koulutusmoduuli_koodiarvo,
	NULL AS koulutusmoduuli_koodiarvo_numeerinen,
	ptkr.diaarinumero,
	NULL as diaarinumero_tutkinnonosa_koodi,
 
	--lisattu laajuusyksikko 14.5.2019
	NULL AS koulutusmoduuli_laajuus_yksikko, 

	-- jhe 10.6.2019 vanhojen tutkintojen laajuudet haetaan diaarinumeron perusteella Sepon aputaulusta, tos-arvo jätetään vertailutiedoksi
	0 as koulutusmoduuli_laajuus_arvo_alkup,
	0 as tos_koulutusmoduuli_laajuus_arvo, 
	0 as koulutusmoduuli_laajuus_arvo,

	ptkr.tutkinto_koodi, 
	ptkr.osaamisala_koodiarvo,
	ptkr.tutkinto_ja_osaamisala_koodi,
	ptkr.diaarinumero_tutkinto_koodi,
	ptkr.diaarinumero_tutkinto_ja_osaamisala_koodi,

	ptkr.kustannusryhma_koodi,
	ptkr.alkup_kustannusryhmakoodi, 

	--jhe 10.5.2019 lisätty liputus, tarvitaan kustannusryhmittelyssä
	NULL AS ep_usean_tutkinnon_tutkinnonosa,
	NULL AS yhteinen_tutkinnon_osa, 
	NULL AS toisesta_tutkinnosta_sisallytetty_tutkinnonosa, 
	ptkr.suorittaa_koko_tutkintoa, 
	NULL AS arviointi_paiva, 
	ptkr.vahvistus_paiva

	,coalesce(op2.opintojen_rahoitus_koodi,op.opintojen_rahoitus_koodi) as opintojen_rahoitus_koodi

	,ptkr.[suorituksen_tyyppi]
	,op.[oppisopimus] as oppisopimus_koodi
	,op.erityisopetus_koodi
	,paataso = 1

FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] as ptkr  
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op ON op.opiskeluoikeus_oid = ptkr.opiskeluoikeus_oid AND ptkr.vahvistus_paiva between op.alku and op.loppu--AP 20.6.2019 n. 400 oidia tulee tuplana, koska kaksi päätason suoritus (kokotutkinto x2 tai koko+osittainen)
LEFT JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op2 ON op2.opiskeluoikeus_oid = ptkr.ylempi_opiskeluoikeus_oid AND ptkr.vahvistus_paiva between op2.alku and op2.loppu

WHERE ptkr.vahvistus_paiva_kohdevuonna = 1
AND tutkintotyyppi_koodi IN ('02','19','20')
AND ptkr.opiskeluoikeus_oid NOT IN (select sisaltyy_opiskeluoikeuteen_oid from CTE where sisaltyy_opiskeluoikeuteen_oid is not null)


UNION



SELECT 
	ptkr.toimipiste_oid, 
	tos.koulutustoimija_oid,
	tos.opiskeluoikeus_oid, 
	tos.paatason_suoritus_id, 
	tos.suoritustason_tunniste,
	NULL AS koulutusmoduuli_koodiarvo, --tos.koulutusmoduuli_koodiarvo,
	NULL AS koulutusmoduuli_koodiarvo_numeerinen, --tos.koulutusmoduuli_koodiarvo_numeerinen,

	op.diaarinumero,
	NULL as diaarinumero_tutkinnonosa_koodi, --op.diaarinumero+'_'+cast(tos.koulutusmoduuli_koodiarvo_numeerinen as varchar(25)) as diaarinumero_tutkinnonosa_koodi,
 
	--lisattu laajuusyksikko 14.5.2019
	NULL, --tos.koulutusmoduuli_laajuus_yksikko, 

	-- jhe 10.6.2019 vanhojen tutkintojen laajuudet haetaan diaarinumeron perusteella Sepon aputaulusta, tos-arvo jätetään vertailutiedoksi
	koulutusmoduuli_laajuus_arvo_alkup,
	tos.koulutusmoduuli_laajuus_arvo as tos_koulutusmoduuli_laajuus_arvo, 
	case 
		when vtl.diaarinumero is null then tos.koulutusmoduuli_laajuus_arvo 
		else vtl.tutkinnonosa_laajuus 
	end as koulutusmoduuli_laajuus_arvo,

	tos.koulutusmoduuli_koodiarvo_paataso as tutkinto_koodi, 
	ptkr.osaamisala_koodiarvo,
	ptkr.tutkinto_ja_osaamisala_koodi,
	
	ptkr.diaarinumero_tutkinto_koodi,
	ptkr.diaarinumero_tutkinto_ja_osaamisala_koodi,
	
	COALESCE(
	CASE 
		WHEN tos.yhteinen_tutkinnon_osa = 1 THEN '1' 
		WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 AND tos.suorittaa_koko_tutkintoa = 0  THEN '1'
		WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 AND tos.suorittaa_koko_tutkintoa = 1  THEN cast(ptkr.kustannusryhma_koodi as varchar)
		WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 0 THEN cast(tos.kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhmia as varchar)
		WHEN usean_tutkinnon_tutkinnonosa = 0 THEN coalesce(okr.kustannusryhma_koodi,tkr.kustannusryhma_koodi)
		ELSE coalesce(okr.kustannusryhma_koodi,tkr.kustannusryhma_koodi)
	END
	,ptkr.kustannusryhma_koodi) AS kustannusryhma_koodi, 
	/*
	CASE 
		WHEN ((tos.usean_tutkinnon_tutkinnonosa = 1 AND ptkr.suorittaa_koko_tutkintoa = 0)
			OR
			(tos.yhteinen_tutkinnon_osa = 1 AND ptkr.suorittaa_koko_tutkintoa = 0)) THEN '1' 
		ELSE ptkr.kustannusryhma_koodi 
	END AS kustannusryhma_koodi, 
	*/
	ptkr.alkup_kustannusryhmakoodi, 
	--jhe 10.5.2019 lisätty liputus, tarvitaan kustannusryhmittelyssä
	tos.usean_tutkinnon_tutkinnonosa,
	tos.yhteinen_tutkinnon_osa, 
	tos.toisesta_tutkinnosta_sisallytetty_tutkinnonosa, 
	ptkr.suorittaa_koko_tutkintoa, 
	tos.arviointi_paiva, 
	ptkr.vahvistus_paiva

	,coalesce(op2.opintojen_rahoitus_koodi,op.opintojen_rahoitus_koodi) as opintojen_rahoitus_koodi

	,tos.[suorituksen_tyyppi]
	,op.[oppisopimus] as oppisopimus_koodi
	,op.erityisopetus_koodi
	,paataso = 0

FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] tos
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op ON op.opiskeluoikeus_oid = tos.opiskeluoikeus_oid AND (tos.arviointi_paiva between op.alku and op.loppu) AND tos.paatason_suoritus_id = op.paatason_suoritus_id
LEFT JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op2 ON op2.opiskeluoikeus_oid = tos.ylempi_opiskeluoikeus_oid AND tos.arviointi_paiva between op2.alku and op2.loppu
LEFT JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] ptkr ON ptkr.paatason_suoritus_id = tos.paatason_suoritus_id
LEFT JOIN [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus] vtl on vtl.diaarinumero = op.diaarinumero
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr on okr.osaamisala_koodi = coalesce(tos.osaamisala_johon_tutkinnonosa_kuuluu,'')
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = tos.tutkinto_johon_tutkinnonosa_kuuluu
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr on tkr.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)

--AP 19.6.2019 lisätty ehto arviointipäivälle
WHERE tos.arviointi_paiva_kohdevuonna = 1











































GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]    Script Date: 23.10.2019 18:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus] AS' 
END
GO






ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus] AS

TRUNCATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]

INSERT INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]


SELECT DISTINCT
	 ol_organisaatio_koodi
	,opintojen_rahoitus_koodi
	,suorituksen_tyyppi_koodi = case f.suorituksen_tyyppi when 'ammatillinentutkinto' then 1 when 'ammatillinentutkintoosittainen' then 2 else -1 end
	,kustannusryhma_koodi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,tutkinto_koodi
	,paatason_suoritus_id
	,count_tutkinnot_ml_oppisopimuskoulutus = case when paataso=1 and suorituksen_tyyppi = 'ammatillinentutkinto' then opiskeluoikeus_oid else null end
	,count_tutkinnon_osat = suoritustason_tunniste
	,sum_osaamispisteet = koulutusmoduuli_laajuus_arvo

FROM [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu] f
left join ANTERO.[dw].[d_amos_spl_koski_suorite_organisaatio_linkki] ol on ol.oo_koulutustoimija_oid = f.koulutustoimija_oid and rnk_kt=1

WHERE ol.amos_spl_master_ytunnus IS NOT NULL

































GO
USE [ANTERO]