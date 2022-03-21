
USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_koski_perusaste_keskiarvot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_koski_perusaste_keskiarvot] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_koski_perusaste_keskiarvot] AS

TRUNCATE TABLE dw.f_koski_perusaste_keskiarvot
INSERT INTO dw.f_koski_perusaste_keskiarvot (	
	oppija_oid,
	keskiarvo,
	keskiarvo_lukuaineet
)
SELECT f.oppija_oid, f.keskiarvo, f2.keskiarvo_lukuaineet FROM (
  SELECT f.oppija_oid
      ,cast(avg(cast(f.arvosana as decimal(10,5))) as decimal(10,5)) as 'keskiarvo'
  FROM (
	SELECT d.oppija_oid, f.koulutusmoduuli_koodiarvo, max(f.arviointi_arvosana_koodiarvo) as 'arvosana' FROM [Koski_SA].[sa].[sa_koski_osasuoritus] f
	left join [Koski_SA].[sa].[sa_koski_opiskeluoikeus] d on d.opiskeluoikeus_oid = f.opiskeluoikeus_oid
	left join [Koski_SA].[sa].[sa_koski_paatason_suoritus] d2 on d2.paatason_suoritus_id = f.paatason_suoritus_id
	where		f.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava' 
			and f.arviointi_arvosana_koodiarvo not in ('S', 'H', 'O') 
			and f.arviointi_arvosana_koodiarvo is not null 
			and d2.vahvistus_paiva is not null 
			and d2.suorituksen_tyyppi = 'perusopetuksenoppimaara'
			and f.koulutusmoduuli_pakollinen = 1
	group by d.oppija_oid, f.koulutusmoduuli_koodiarvo) f
  group by f.oppija_oid) f
  left join (
SELECT f.oppija_oid
      ,cast(avg(cast(f.arvosana as decimal(10,5))) as decimal(10,5)) as 'keskiarvo_lukuaineet'
  FROM (
	SELECT d.oppija_oid, f.koulutusmoduuli_koodiarvo, max(f.arviointi_arvosana_koodiarvo) as 'arvosana' FROM [Koski_SA].[sa].[sa_koski_osasuoritus] f
	left join [Koski_SA].[sa].[sa_koski_opiskeluoikeus] d on d.opiskeluoikeus_oid = f.opiskeluoikeus_oid
	left join [Koski_SA].[sa].[sa_koski_paatason_suoritus] d2 on d2.paatason_suoritus_id = f.paatason_suoritus_id
	where		f.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava' 
			and f.arviointi_arvosana_koodiarvo not in ('S', 'H', 'O') 
			and f.arviointi_arvosana_koodiarvo is not null 
			and f.koulutusmoduuli_koodiarvo not in ('MU', 'KS', 'LI', 'KO', 'KU') 
			and d2.vahvistus_paiva is not null 
			and d2.suorituksen_tyyppi = 'perusopetuksenoppimaara' 
			and f.koulutusmoduuli_pakollinen = 1
	group by d.oppija_oid, f.koulutusmoduuli_koodiarvo) f
  group by f.oppija_oid) f2 on f2.oppija_oid = f.oppija_oid



GO


USE [ANTERO]