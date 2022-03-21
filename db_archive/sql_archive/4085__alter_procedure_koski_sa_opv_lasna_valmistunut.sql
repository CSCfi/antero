USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]    Script Date: 1.11.2020 16:15:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut] @date as date = '2018-01-01' as


DROP INDEX IF EXISTS [NonClusteredIndex-20200704-203729] ON [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]

TRUNCATE TABLE sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut


;WITH ed_jaksot AS (
	SELECT 
		 ooa.opiskeluoikeus_oid
		,alku
		,loppu
		,case when ooa.tila = 'lasna' then osa_aikaisuus else null end as osa_aikaisuus
		,case when ooa.tila = 'lasna' then opintojen_rahoitus else null end as opintojen_rahoitus
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
)

INSERT INTO sa.temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut

SELECT 
	@date
	,ooa.opiskeluoikeus_oid
	,ooa.tila
	,alku
	,loppu
	,alku_ei_muokattu
	,loppu_ei_muokattu
	,opintojen_rahoitus
	,majoitus
	,sisaoppilaitosmainen_majoitus
	,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
	,erityinen_tuki
	,vaativan_erityisen_tuen_erityinen_tehtava
	,hojks
	,vaikeasti_vammainen
	,vammainen_ja_avustaja
	,osa_aikaisuus
	,vankilaopetuksessa
	,oppisopimus_jossain_paatason_suorituksessa
	,opiskeluvalmiuksia_tukevat_opinnot
	,alkanut_samana_paivana_hylataan
	,toisen_opiskeluoikeuden_sisalla
	,sisaltyy_toiseen_opiskeluoikeuteen
	,aiempi_koulutusmuoto
	,lasna_pv_hyv = 
		case 
			when sisaltyy_toiseen_opiskeluoikeuteen = 1 
				 or alkanut_samana_paivana_hylataan = 1
				 or (toisen_opiskeluoikeuden_sisalla = 1 and valiaikainen_keskeytys = 0)
				 or (ed_jatkuu = 1 and valiaikainen_keskeytys = 0)  then 0.0
			else (osa_aikaisuus / 100.0) * (datediff(
					day,
					(select maxValue from dbo.Maximum (@date, alku, default)),
					(select minValue from dbo.Minimum (eomonth(@date),loppu, default))
				) + 1)
		end
	,lasna_pv_hyv_ei_muokattu = 
		 (osa_aikaisuus / 100.0) * (datediff(
					day,
					(select maxValue from dbo.Maximum (@date, alku_ei_muokattu, default)),
					(select minValue from dbo.Minimum (eomonth(@date),loppu_ei_muokattu, default))
				) + 1)
		
	,loma_pv_hyv = 0
	,loma_pv_hyv_ei_muokattu = 0
	,loma_pv_nyk = 0
	,loma_pv_nyk_ei_muokattu = 0
	,loma_pv_hist = 0
	,loma_pv_hist_ei_muokattu = 0
	,opva_pv_hyv = 0
	,opva_pv_hyv_ei_muokattu = 0
	,opva_pv_nyk = 0
	,opva_pv_nyk_ei_muokattu = 0
	,opva_pv_hist = 0
FROM ( 
	SELECT
		 sa1.opiskeluoikeus_oid
		,sa1.tila
		,alku = (select maxValue from dbo.Maximum (@date, sa1.alku, 
						case
							when dateadd(day,1,coalesce(ed_paattyi,dateadd(day,-1,oo_l.alku))) > oo_l.loppu then '1900-01-01' 
							else dateadd(day,1,coalesce(ed_paattyi,dateadd(day,-1,oo_l.alku)))
						end
				))
		,loppu = (select minValue from dbo.Minimum (eomonth(@date), sa1.loppu, oo_l.loppu))
		,alku_ei_muokattu = (select maxValue from dbo.Maximum (@date, coalesce(oo_l.alku_tod, sa1.alku), default))
		,loppu_ei_muokattu = (select minValue from dbo.Minimum (eomonth(@date), coalesce(oo_l.loppu,sa1.loppu), default))
		,opintojen_rahoitus = coalesce(sa1.opintojen_rahoitus, sa2.opintojen_rahoitus, sa3.opintojen_rahoitus, sa4.opintojen_rahoitus)
		,majoitus
		,sisaoppilaitosmainen_majoitus
		,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
		,erityinen_tuki
		,vaativan_erityisen_tuen_erityinen_tehtava
		,hojks
		,vaikeasti_vammainen
		,vammainen_ja_avustaja
		,osa_aikaisuus = coalesce(sa1.osa_aikaisuus,sa2.osa_aikaisuus,sa3.osa_aikaisuus,sa4.osa_aikaisuus)
		,vankilaopetuksessa
		,oppisopimus_jossain_paatason_suorituksessa
		,opiskeluvalmiuksia_tukevat_opinnot
		,toisen_opiskeluoikeuden_sisalla
		,aiempi_koulutusmuoto = coalesce(oo_l.aiempi_koulutusmuoto,'')
		,ed_jatkuu
		,valiaikainen_keskeytys
		--,alkanut_samana_paivana_hylataan
		--,sisaltyy_toiseen_opiskeluoikeuteen
	FROM Koski_SA.[sa].[sa_koski_opiskeluoikeus_aikajakso] sa1
	
	--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta
	LEFT JOIN ed_jaksot sa2 on sa2.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and datediff(day,sa2.loppu,sa1.tila_alkanut) = 1

	--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta (jos ei löytynyt edellisessä)
	LEFT JOIN ed_jaksot sa3 on sa3.opiskeluoikeus_oid = sa2.opiskeluoikeus_oid and datediff(day,sa3.loppu,sa2.alku) = 1

	--valmistumisen rahoitus otetaan edellisestä läsnäolojaksosta (jos ei löytynyt edellisesssä)
	LEFT JOIN ed_jaksot sa4 on sa4.opiskeluoikeus_oid = sa3.opiskeluoikeus_oid and datediff(day,sa4.loppu,sa3.alku) = 1

	--Opiskelijat, joilla useampi voimassa oleva opiskeluoikeus. Jos osa aiemmista opiskeluoikeuksista on päättynyt ja osa ei, huomioidaan vain voimassa oleva.
	LEFT JOIN (
		SELECT 
			opiskeluoikeus_oid
			,aiempi_koulutusmuoto
			,alku
			,loppu = coalesce(max(loppu),'')
			--,loppu = coalesce(loppu,'')
			,alku_tod
			,ed_paattyi
			,ed_jatkuu
			,toisen_opiskeluoikeuden_sisalla
			,valiaikainen_keskeytys
		FROM sa.temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet
		WHERE ed_paattyi_ennen_jakson_alkua = 0
		GROUP BY opiskeluoikeus_oid,ed_paattyi,ed_jatkuu,aiempi_koulutusmuoto,toisen_opiskeluoikeuden_sisalla,valiaikainen_keskeytys,alku,alku_tod
	--AP 13.7.2019 lisätty ao ehto jakson ajankohdalle
	) oo_l on oo_l.opiskeluoikeus_oid = sa1.opiskeluoikeus_oid and oo_l.alku between sa1.alku and sa1.loppu

	WHERE sa1.tila in ('lasna','valmistunut') 
	and opiskeluvalmiuksia_tukevat_opinnot = 0
	and (sa1.alku <= eomonth(@date) and sa1.loppu >= @date)
	--aiempi ei jatku tai väliaikainen keskeytys:
	and (coalesce(oo_l.ed_jatkuu,0) = 0	or (coalesce(oo_l.ed_jatkuu,1) = 1 and coalesce(oo_l.loppu,'a') != ''))	   
	--aiempi loppunut samana päivänä tai myöhemmin kuin nykyinen:
	and coalesce(oo_l.loppu,'9999-12-31') != '1900-01-01'															
	--AP 10.7.2019 ao otettu pois
	--ei päällekkäistä opiskeluoikeutta tai aiempi päättynyt:
	--and sa1.loppu > coalesce(oo_l.ed_paattyi,'1900-01-01')				

) ooa 

--Rajataan tarkastelujakson opiskeluoikeuksiin
INNER JOIN sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oid on oid.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid


				
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200704-203729] ON [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]
(
	[opiskeluoikeus_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO
USE ANTERO