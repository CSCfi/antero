USE [Koski_SA]
GO

/****** Object:  View [sa].[v_eperusteet_osaamisalat_tutkinnonosat_laajuudet]    Script Date: 10.10.2019 10:48:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [sa].[v_eperusteet_osaamisalat_tutkinnonosat_laajuudet] AS
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

USE [ANTERO]


