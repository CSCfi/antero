USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit]    Script Date: 30.7.2025 15.19.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_opiskeluoikeus_oidit] @date2 as date = '2018-01-01' as

DECLARE @date as date = @date2
/*
	Hakee opiskeluoikeudet, joilla on lasna-, valmistunut- tai lomajakso tarkastelukuukauden aikana.
*/

DROP INDEX IF EXISTS [NonClusteredIndex-20200704-203543] ON [sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit]

TRUNCATE TABLE sa.temp_opiskelijavuodet_opiskeluoikeus_oidit

INSERT INTO sa.temp_opiskelijavuodet_opiskeluoikeus_oidit
(
	 pvm
	,master_oid
	,opiskeluoikeus_oid
	,alkamispaiva
	,paattymispaiva
	,osatutkinto
	,alkanut_samana_paivana_hylataan
	,sisaltyy_toiseen_opiskeluoikeuteen
	,sisaltyy_oid
)

SELECT
	 @date
	,master_oid
	,opiskeluoikeus_oid
	,alkamispaiva
	,paattymispaiva
	,osatutkinto =	
		case
			when a_oid is null and ao_oid is not null then 1 
			else 0 
		end
	,alkanut_samana_paivana_hylataan = 
		case 
			when opiskeluoikeus_oid_hylataan is not null then 1
			else 0
		end
	,sisaltyy_toiseen_opiskeluoikeuteen = 
		case 
			when sisaltyy_opiskeluoikeuteen_oid is not null then 1
			else 0
		end
	,sisaltyy_oid = sisaltyy_opiskeluoikeuteen_oid
FROM (

	select distinct
		 oo1.master_oid
		,oo1.opiskeluoikeus_oid
		,oo1.alkamispaiva
		,oo1.paattymispaiva
		,a_oid = atutk.opiskeluoikeus_oid
		,ao_oid = atutko.opiskeluoikeus_oid
		,opiskeluoikeus_oid_hylataan = null --hyl.opiskeluoikeus_oid_hylataan
		,oo1.sisaltyy_opiskeluoikeuteen_oid
	from sa.sa_koski_opiskeluoikeus oo1
	inner join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo1.opiskeluoikeus_oid 
	left join (
		select 
			opiskeluoikeus_oid
		from sa.sa_koski_paatason_suoritus
		where suorituksen_tyyppi = 'ammatillinentutkinto'
	) atutk on atutk.opiskeluoikeus_oid = oo1.opiskeluoikeus_oid
	left join (
		select 
			opiskeluoikeus_oid
		from sa.sa_koski_paatason_suoritus
		where suorituksen_tyyppi = 'ammatillinentutkintoosittainen'
	) atutko on atutko.opiskeluoikeus_oid = oo1.opiskeluoikeus_oid
	--varmistus että myös mahdollinen pihvikoulutus ammatillista
	--left join sa.sa_koski_opiskeluoikeus oo2 on oo2.sisaltyy_opiskeluoikeuteen_oid = oo1.opiskeluoikeus_oid

	--left join Koski_SA.sa.temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat hyl on hyl.opiskeluoikeus_oid_hylataan = oo.opiskeluoikeus_oid

	where (
		oo1.koulutusmuoto = 'ammatillinenkoulutus' -- and coalesce(oo2.koulutusmuoto,'ammatillinenkoulutus') = 'ammatillinenkoulutus'
		or (oo1.tuva_jarjestamislupa = 'ammatillinen' and oo1.alkamispaiva > '2022-07-31')
	) --and oo.sisaltyy_opiskeluoikeuteen_oid is null
	and ooa.tila in ('loma','lasna','valmistunut')
	and (ooa.alku <= eomonth(@date) and ooa.loppu >= @date)

) q


CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200704-203543] ON [sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit]
(
	[master_oid] ASC,
	[opiskeluoikeus_oid] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]

GO
