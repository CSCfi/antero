USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki]    Script Date: 10.10.2019 16:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki] AS

TRUNCATE TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]

INSERT INTO [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki] (
	   [vuosi]
      ,[ytunnus]
      ,[koulutuksen_jarjestaja]
      ,[ei_pohjakoul_pt_kr1]
      ,[ei_pohjakoul_pt_kr2]
      ,[ei_pohjakoul_pt_kr3]
      ,[ei_pohjakoul_pt_kr4]
      ,[ei_pohjakoul_pt_kr5]
      ,[ei_pohjakoul_at_eat_kr1]
      ,[ei_pohjakoul_at_eat_kr2]
      ,[ei_pohjakoul_at_eat_kr3]
      ,[ei_pohjakoul_at_eat_kr4]
      ,[ei_pohjakoul_at_eat_kr5]
      ,[pohjakoul_pt_kr1]
      ,[pohjakoul_pt_kr2]
      ,[pohjakoul_pt_kr3]
      ,[pohjakoul_pt_kr4]
      ,[pohjakoul_pt_kr5]
      ,[pohjakoul_at_eat_kr1]
      ,[pohjakoul_at_eat_kr2]
      ,[pohjakoul_at_eat_kr3]
      ,[pohjakoul_at_eat_kr4]
      ,[pohjakoul_at_eat_kr5]
	  ,source
)

-- 

SELECT 
	q.*
	,'p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki'
FROM (

	SELECT * FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_2017]

	UNION ALL

	SELECT * FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_2018]

) q
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot]    Script Date: 10.10.2019 16:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] AS

TRUNCATE TABLE sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot

INSERT INTO sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot (
	   [vuosi]
      ,[ytunnus]
      ,[koulutuksen_jarjestaja]
      ,[tutktyyppi]
      ,[kr]
      ,[tutk_pohjakoul]
      ,[tutk_ei_pohjakoul]
      ,[osuus_pohjakoul]
      ,[osuus_ei_pohjakoul]
      ,[sum_tutk_pohjakoul]
      ,[sum_tutk_ei_pohjakoul]
      ,[osuus_pohjakoul_koko]
      ,[osuus_ei_pohjakoul_koko]
      ,[source]
)

SELECT 
	 vuosi
	,ytunnus
	,koulutuksen_jarjestaja
	,tutktyyppi
	,kr
	,tutk_pohjakoul = sum(tutk_pohjakoul)
	,tutk_ei_pohjakoul = sum(tutk_ei_pohjakoul)
	,osuus_pohjakoul = case when sum(tutk_pohjakoul) + sum(tutk_ei_pohjakoul) > 0 then sum(tutk_pohjakoul) / (sum(tutk_pohjakoul) + sum(tutk_ei_pohjakoul)) else null end
	,osuus_ei_pohjakoul = case when sum(tutk_pohjakoul) + sum(tutk_ei_pohjakoul) > 0 then sum(tutk_ei_pohjakoul) / (sum(tutk_pohjakoul) + sum(tutk_ei_pohjakoul)) else null end
	,sum_tutk_pohjakoul
	,sum_tutk_ei_pohjakoul
	,osuus_pohjakoul_koko = case when sum_tutk_pohjakoul + sum_tutk_ei_pohjakoul > 0 then sum_tutk_pohjakoul / (sum_tutk_pohjakoul + sum_tutk_ei_pohjakoul) else sum_tutk_pohjakoul_tutktyyppi / (sum_tutk_pohjakoul_tutktyyppi + sum_tutk_ei_pohjakoul_tutktyyppi) end
	,osuus_ei_pohjakoul_koko = case when sum_tutk_pohjakoul + sum_tutk_ei_pohjakoul > 0 then sum_tutk_ei_pohjakoul / (sum_tutk_pohjakoul + sum_tutk_ei_pohjakoul) else sum_tutk_ei_pohjakoul_tutktyyppi / (sum_tutk_pohjakoul_tutktyyppi + sum_tutk_ei_pohjakoul_tutktyyppi) end
	,source = 'p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot'

FROM (

	SELECT
		 vuosi
		,ytunnus
		,koulutuksen_jarjestaja
		,tutktyyppi
		,kr
		,tutk_pohjakoul = sum(pohjak_lkm)
		,tutk_ei_pohjakoul = sum(ei_pohjak_lkm)		
		,sum_tutk_pohjakoul = sum(pohjak_lkm) OVER (partition by tutktyyppi, kr)					
		,sum_tutk_ei_pohjakoul = sum(ei_pohjak_lkm) OVER (partition by tutktyyppi, kr)
		,sum_tutk_pohjakoul_tutktyyppi = sum(pohjak_lkm) OVER (partition by tutktyyppi)
		,sum_tutk_ei_pohjakoul_tutktyyppi = sum(ei_pohjak_lkm) OVER (partition by tutktyyppi)

	FROM (

		SELECT 
				 vuosi
				,ytunnus
				,koulutuksen_jarjestaja
				,tutktyyppi = 
				case 
					when tutk like '%_pt_%' then '02'
					else '19_20'
				end
				,kr = 
				case 
					when tutk like '%kr1' then 1
					when tutk like '%kr2' then 2
					when tutk like '%kr3' then 3
					when tutk like '%kr4' then 4
					when tutk like '%kr5' then 5
					else null
				end
				,pohjak_lkm = cast(
				case
					when tutk like 'ei_pohjakoul%' then 0
					else lkm
				end
				as decimal(20,10))
				,ei_pohjak_lkm = cast(
				case
					when tutk like 'ei_pohjakoul%' then lkm
					else 0
				end 
				as decimal(20,10))
	  

		FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]
		unpivot
		(
			lkm for tutk in (
				[ei_pohjakoul_pt_kr1]
				,[ei_pohjakoul_pt_kr2]
				,[ei_pohjakoul_pt_kr3]
				,[ei_pohjakoul_pt_kr4]
				,[ei_pohjakoul_pt_kr5]
				,[ei_pohjakoul_at_eat_kr1]
				,[ei_pohjakoul_at_eat_kr2]
				,[ei_pohjakoul_at_eat_kr3]
				,[ei_pohjakoul_at_eat_kr4]
				,[ei_pohjakoul_at_eat_kr5]
				,[pohjakoul_pt_kr1]
				,[pohjakoul_pt_kr2]
				,[pohjakoul_pt_kr3]
				,[pohjakoul_pt_kr4]
				,[pohjakoul_pt_kr5]
				,[pohjakoul_at_eat_kr1]
				,[pohjakoul_at_eat_kr2]
				,[pohjakoul_at_eat_kr3]
				,[pohjakoul_at_eat_kr4]
				,[pohjakoul_at_eat_kr5]
			)
		) as unPvt

	) q1

	group by vuosi,ytunnus,koulutuksen_jarjestaja,tutktyyppi,kr,pohjak_lkm,ei_pohjak_lkm

) q2

group by vuosi,ytunnus,koulutuksen_jarjestaja,tutktyyppi,kr,sum_tutk_pohjakoul,sum_tutk_ei_pohjakoul,sum_tutk_pohjakoul_tutktyyppi,sum_tutk_ei_pohjakoul_tutktyyppi

order by tutktyyppi,kr
GO
USE [ANTERO]