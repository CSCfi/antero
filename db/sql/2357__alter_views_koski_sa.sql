USE [Koski_SA]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'sa', N'VIEW',N'v_eperusteet_tutkintojen_laajuudet', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'sa', @level1type=N'VIEW',@level1name=N'v_eperusteet_tutkintojen_laajuudet'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'sa', N'VIEW',N'v_eperusteet_tutkintojen_laajuudet', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'sa', @level1type=N'VIEW',@level1name=N'v_eperusteet_tutkintojen_laajuudet'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'sa', N'VIEW',N'v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'sa', @level1type=N'VIEW',@level1name=N'v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'sa', N'VIEW',N'v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'sa', @level1type=N'VIEW',@level1name=N'v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat'

GO
/****** Object:  View [sa].[v_eperusteet_tutkinnot_osaamisalat]    Script Date: 9.8.2019 16:56:22 ******/
DROP VIEW IF EXISTS [sa].[v_eperusteet_tutkinnot_osaamisalat]
GO
/****** Object:  View [sa].[v_eperusteet_liputa_usean_tutkinnon_tutkinnonosat]    Script Date: 9.8.2019 16:56:22 ******/
DROP VIEW IF EXISTS [sa].[v_eperusteet_liputa_usean_tutkinnon_tutkinnonosat]
GO
/****** Object:  View [sa].[v_eperusteet_osaamisalat_tutkinnonosat_laajuudet]    Script Date: 9.8.2019 16:56:22 ******/
DROP VIEW IF EXISTS [sa].[v_eperusteet_osaamisalat_tutkinnonosat_laajuudet]
GO
/****** Object:  View [sa].[v_eperusteet_tutkintojen_laajuudet]    Script Date: 9.8.2019 16:56:22 ******/
DROP VIEW IF EXISTS [sa].[v_eperusteet_tutkintojen_laajuudet]
GO
/****** Object:  View [sa].[v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat]    Script Date: 9.8.2019 16:56:22 ******/
DROP VIEW IF EXISTS [sa].[v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat]
GO
/****** Object:  View [sa].[v_sa_eperusteet_suoritustavat_unpivot]    Script Date: 9.8.2019 16:56:22 ******/
DROP VIEW IF EXISTS [sa].[v_sa_eperusteet_suoritustavat_unpivot]
GO
/****** Object:  View [sa].[v_sa_eperusteet_suoritustavat_unpivot]    Script Date: 9.8.2019 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_sa_eperusteet_suoritustavat_unpivot]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [sa].[v_sa_eperusteet_suoritustavat_unpivot]
AS
SELECT        taso, eperusteid, kuvaus, laajuusyksikko, suoritustapakoodi, tunniste, tutkinto, osaamisalakoodi, maksimikoko, maksimilaajuus, minimikoko, minimilaajuus, osan_tunniste, COALESCE (pakollinen, 0) 
                         AS pakollinen, tutkinnonosa, tutkinnonosa_viite
FROM            

(
	SELECT        
		taso
		,eperusteid
		,kuvaus
		,laajuusyksikko
		,suoritustapakoodi
		,tunniste
		,tutkinto_fi AS tutkinto
		,maksimikoko_t1 AS maksimikoko
		,maksimilaajuus_t1 AS maksimilaajuus
		,minimikoko_t1 AS minimikoko
		,minimilaajuus_t1 AS minimilaajuus
		,osaamisalakoodi_t1 AS osaamisalakoodi
		,osan_tunniste_t1 AS osan_tunniste
		,pakollinen_t1 AS pakollinen
		,tutkinnonosa_fi_t1 AS tutkinnonosa
		,NULL AS tutkinnonosa_viite
	FROM sa.sa_eperusteet_suoritustavat
	WHERE (taso = 1)
                          
	UNION
                          
	SELECT        taso, eperusteid, kuvaus, laajuusyksikko, suoritustapakoodi, tunniste, tutkinto_fi, maksimikoko_t2 AS maksimikoko, maksimilaajuus_t2 AS maksimilaajuus, minimikoko_t2 AS minimikoko, 
							minimilaajuus_t2 AS minimilaajuus, osaamisalakoodi_t2 AS osaamisalakoodi, osan_tunniste_t2 AS osan_tunniste, pakollinen_t2 AS pakollinen, tutkinnonosa_fi_t2 AS tutkinnonosa, 
							tutkinnonosa_viite_t2 AS tutkinnonosa_viite
	FROM            sa.sa_eperusteet_suoritustavat AS sa_eperusteet_suoritustavat_3
	WHERE (taso = 2) 
	--AND (tutkinnonosa_viite_t2 IS NOT NULL)

	UNION

	SELECT        taso, eperusteid, kuvaus, laajuusyksikko, suoritustapakoodi, tunniste, tutkinto_fi AS tutkinto, maksimikoko_t3 AS maksimikoko, maksimilaajuus_t3 AS maksimilaajuus, minimikoko_t3 AS minimikoko, 
							minimilaajuus_t3 AS minimilaajuus, osaamisalakoodi_t3 AS osaamisalakoodi, osan_tunniste_t3 AS osan, pakollinen_t3 AS pakollinen, tutkinnonosa_fi_t3 AS tutkinnonosa, 
							tutkinnonosa_viite_t3 AS tutkinnonosa_viite
	FROM            sa.sa_eperusteet_suoritustavat AS sa_eperusteet_suoritustavat_2
	WHERE (taso = 3)
	--AND (tutkinnonosa_viite_t3 IS NOT NULL)

	UNION

	SELECT        taso, eperusteid, kuvaus, laajuusyksikko, suoritustapakoodi, tunniste, tutkinto_fi AS tutkinto, maksimikoko_t4 AS maksimikoko, maksimilaajuus_t4 AS maksimilaajuus, minimikoko_t4 AS minimikoko, 
							minimilaajuus_t4 AS minimilaajuus, osaamisalakoodi_t4 AS osaamisalakoodi, osan_tunniste_t4 AS osan_tunniste, pakollinen_t4 AS pakollinen, tutkinnonosa_fi_t4 AS tutkinnonosa, 
							tutkinnonosa_viite_t4 AS tutkinnonosa_viite
	FROM            sa.sa_eperusteet_suoritustavat AS sa_eperusteet_suoritustavat_1
	WHERE (taso = 4) 
	--AND (tutkinnonosa_viite_t4 IS NOT NULL)

) AS t





' 
GO
/****** Object:  View [sa].[v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat]    Script Date: 9.8.2019 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [sa].[v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat] AS

SELECT distinct  
	 eto.tutkinnonosaid AS eto_tutkinnonosaid
	,tov.tutkinnonosaid AS tov_tutkinnonosaid
	,tov.tutkinnonosaviiteid
	,epsu.tutkinnonosa_viite
	,tov.eperusteid AS tov_eperusteid
	,epsu.suoritustapakoodi
	,tov.laajuus AS tutkinnonosa_laajuus
	,epsu.pakollinen
FROM sa.v_sa_eperusteet_suoritustavat_unpivot AS epsu 
RIGHT JOIN sa.sa_eperusteet_tutkinnonosaviitteet AS tov ON epsu.tutkinnonosa_viite = tov.tutkinnonosaviiteid 
INNER JOIN sa.sa_eperusteet_tutkinnonosat AS eto ON tov.tutkinnonosaid = eto.tutkinnonosaid



' 
GO
/****** Object:  View [sa].[v_eperusteet_tutkintojen_laajuudet]    Script Date: 9.8.2019 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_eperusteet_tutkintojen_laajuudet]'))
EXEC dbo.sp_executesql @statement = N'

/*order by eperusteid*/
CREATE VIEW [sa].[v_eperusteet_tutkintojen_laajuudet] AS

SELECT DISTINCT 
	eperusteid
	,minimilaajuus
	,maksimilaajuus
	,minimilaajuus - maksimilaajuus AS min_maks_ero
FROM sa.sa_eperusteet_suoritustavat
WHERE (minimilaajuus IS NOT NULL)



' 
GO
/****** Object:  View [sa].[v_eperusteet_osaamisalat_tutkinnonosat_laajuudet]    Script Date: 9.8.2019 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_eperusteet_osaamisalat_tutkinnonosat_laajuudet]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [sa].[v_eperusteet_osaamisalat_tutkinnonosat_laajuudet] AS
/*
jhe 23.4.2019, 14.5.2019, 23.5.2019,4.6.2019 
AP 23.6.2019 lisätty rank

drop table [sa].[f_eperusteet_osaamisalat_tutkinnonosat_laajuudet]
select *
into [sa].[f_eperusteet_osaamisalat_tutkinnonosat_laajuudet]
from [sa].[v_eperusteet_osaamisalat_tutkinnonosat_laajuudet]


select tutkinnonosa_koodi, count(distinct tutkinnonosa_laajuus) as laajuuksia_kpl
from [sa].[f_eperusteet_osaamisalat_tutkinnonosat_laajuudet]
group by tutkinnonosa_koodi
order by count(distinct tutkinnonosa_laajuus) desc

*/

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

  case when t.osaamisala_koodi is null then t.diaarinumero + ''_'' + cast(
    t.tutkinto_koodi as varchar(100))
   else diaarinumero + ''_'' + cast(
    t.tutkinto_koodi as varchar(100)
  )+ ''_'' + cast(
    t.osaamisala_koodi as varchar(100)
	  )+ ''_'' + cast(
    t.tutkinnonosa_koodi as varchar(100)
  ) end as diaarinumero_tutkinto_osaamisala_tutkinnonosa_koodi, 

  case when t.osaamisala_koodi is null then t.diaarinumero + ''_'' + cast(
    t.tutkinto_koodi as varchar(100))
   else diaarinumero + ''_'' + cast(
    t.tutkinto_koodi as varchar(100)
  )+ ''_'' + cast(
    t.osaamisala_koodi as varchar(100)
  ) end as diaarinumero_tutkinto_osaamisala_koodi, 

  --diaarinumeron ja tutkinnonosan yhdistelmäavain
  t.diaarinumero + ''_'' + cast(
    t.tutkinnonosa_koodi as varchar(100)
  ) as diaarinumero_tutkinnonosa_koodi, 
  
  --tutkinnon ja tutkinnonosan yhdistelmäavain
  t.diaarinumero + ''_'' + cast(
    t.tutkinto_koodi as varchar(100)
  )+ ''_'' + cast(
    t.tutkinnonosa_koodi as varchar(100)
  ) as diaarinumero_tutkinto_tutkinnonosa_koodi, 
  
  --tutkinnon yhdistelmäavain
  t.diaarinumero + ''_'' + cast(
    t.tutkinto_koodi as varchar(100)
  ) as diaarinumero_tutkinto_koodi, 
  
  CASE WHEN t.tutkinnonosa_koodi IS NULL THEN t.tutkinto_koodi ELSE CAST(
    t.tutkinto_koodi AS varchar(20)
  ) + ''_'' + CAST(
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
	case 
		when t.diaarinumero=''OPH-1224-2018'' and t.tutkinnonosa_koodi=300400 then 0
		when t.diaarinumero=''OPH-1224-2018'' and t.tutkinnonosa_koodi=300403 then 0
		when t.diaarinumero=''OPH-1396-2018'' and t.tutkinnonosa_koodi=300400 then 0
		when t.diaarinumero=''OPH-1396-2018'' and t.tutkinnonosa_koodi=300403 then 0
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



















' 
GO
/****** Object:  View [sa].[v_eperusteet_liputa_usean_tutkinnon_tutkinnonosat]    Script Date: 9.8.2019 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_eperusteet_liputa_usean_tutkinnon_tutkinnonosat]'))
EXEC dbo.sp_executesql @statement = N'

CREATE view [sa].[v_eperusteet_liputa_usean_tutkinnon_tutkinnonosat]
as
select 
	cast(koodiarvo as varchar(25)) as tutkinnonosa_koodi_char
	,koodiarvo as tutkinnonosa_koodi
	,count(koodiarvo) as lkm
	,case 
		when count(koodiarvo) > 1 then 1 
		else 0 
	 end as usean_tutkinnon_tutkinnonosa 
from (

	SELECT distinct [eperusteid],
		[koodiarvo] 
	FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat]

) t
group by koodiarvo


' 
GO
/****** Object:  View [sa].[v_eperusteet_tutkinnot_osaamisalat]    Script Date: 9.8.2019 16:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_eperusteet_tutkinnot_osaamisalat]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [sa].[v_eperusteet_tutkinnot_osaamisalat]


/*
jhe 8.5.2019, 12.5 
-- tässä luodaan yhdistelmäavain, joka tarvitaan kustannusryhmien määrittelyssä sp-laskennassa
-- ks Anteron näkymä [dw].[v_amos_spl_koski_paatason_suoritukset_ja_kustannusryhmat]

select count(*) as lkm
from [sa].[v_eperusteet_tutkinnot_osaamisalat]

select top 10 *
from [sa].[v_eperusteet_tutkinnot_osaamisalat]
where tutkinnonosa_laajuus is not null


select * 
from [sa].[v_eperusteet_tutkinnot_osaamisalat]

*/

AS

select 	   
-- 12.5.2019 lisätään diaarinumero yhdistelmäavaimeen, Sepon speksi
t.diaarinumero+''_''+CASE WHEN t.osaamisala_koodi IS NULL THEN t.tutkinto_koodi ELSE CAST(t.tutkinto_koodi AS varchar(20)) + ''_'' + CAST(t.osaamisala_koodi AS varchar(20)) END as diaarinumero_tutkinto_ja_osaamisala_koodi,
CASE 
	WHEN t.osaamisala_koodi IS NULL THEN t.tutkinto_koodi 
	ELSE CAST(t.tutkinto_koodi AS varchar(20)) + ''_'' + CAST(t.osaamisala_koodi AS varchar(20)) 
END AS tutkinto_ja_osaamisala_koodi,tutkinto_koodi
,osaamisala_koodi
from (
	SELECT DISTINCT 
		ep.diaarinumero,ep.tutkintokoodi as tutkinto_koodi
		,epo.osaamisala_koodi
	FROM sa.sa_eperusteet ep 
	left outer JOIN sa.sa_eperusteet_osaamisalat epo ON ep.eperusteid = epo.eperusteid
) t
where tutkinto_koodi is not null


' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'sa', N'VIEW',N'v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[9] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "epsu"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "tov"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 177
               Right = 525
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "eto"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 3420
         Width = 3135
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'sa', @level1type=N'VIEW',@level1name=N'v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'sa', N'VIEW',N'v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'sa', @level1type=N'VIEW',@level1name=N'v_eperusteet_tutkinnonosat_tutkinnonosaviitteet_suoritustavat'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'sa', N'VIEW',N'v_eperusteet_tutkintojen_laajuudet', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sa_eperusteet_suoritustavat (sa)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'sa', @level1type=N'VIEW',@level1name=N'v_eperusteet_tutkintojen_laajuudet'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'sa', N'VIEW',N'v_eperusteet_tutkintojen_laajuudet', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'sa', @level1type=N'VIEW',@level1name=N'v_eperusteet_tutkintojen_laajuudet'
GO
USE [ANTERO]