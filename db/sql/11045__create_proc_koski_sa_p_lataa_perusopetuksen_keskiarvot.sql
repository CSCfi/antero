USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_perusopetuksen_keskiarvot]    Script Date: 22.8.2025 20.50.15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROC [sa].[p_lataa_perusopetuksen_keskiarvot] AS

/*
SYNOPSIS
1: perusopetuksesta valmistuneet
2: ajoitettavissa olevat arvosanat
3: tarkasteluajankohdat valmistuneille
4: maksimiarvosanat tarkasteluajankohdittain
5: keskiarvojen laskenta tarkasteluajankohdittain
6: indeksin luonti
7: siivous
*/

--1: perusopetuksesta valmistuneet
DROP TABLE IF EXISTS sa.temp_perusopetuksesta_valmistuneet

select 
	oo.master_oid
	,min_perusopetuksen_suorituspaiva = min(ps.vahvistus_paiva)
	,max_opiskelee_toiminta_alueittain = max(et.opiskelee_toiminta_alueittain)
into sa.temp_perusopetuksesta_valmistuneet
from sa.sa_koski_paatason_suoritus ps 
join sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
left join sa.sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos et on et.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
where 1=1
and ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara')
and ps.vahvistus_paiva is not null
group by oo.master_oid


--2: ajoitettavissa olevat arvosanat (huom. sisältää aina myös perusopetuksesta valmistumisen arvosanat)
DROP TABLE IF EXISTS sa.temp_perusopetuksen_pakollisten_lukuaineiden_arvosanat

--osasuoritukset
select 
	oo.master_oid
	,arviointi_paiva = least(oo.paattymispaiva, ps.vahvistus_paiva, os.arviointi_paiva)
	,aine = os.koulutusmoduuli_koodiarvo
	--,kieli_tai_oppimaara = os.kieli_koodiarvo
	,arvosana = os.arviointi_arvosana_koodiarvo
	,yksilollistetty = coalesce(os.yksilollistetty_oppimaara, 0)
into sa.temp_perusopetuksen_pakollisten_lukuaineiden_arvosanat
from sa.sa_koski_paatason_suoritus ps 
join sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id
join sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
where (
	(
		ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara')
		and ps.vahvistus_paiva is not null --huomioidaan vain varmuudella päättötodistusta koskevat
	)
	or ps.suorituksen_tyyppi = 'perusopetuksenlisaopetus'
)
and os.suorituksen_tyyppi in ('perusopetuksenoppiaine', 'aikuistenperusopetuksenoppiaine', 'perusopetuksenlisaopetuksenoppiaine')
and os.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava' 
and os.koulutusmoduuli_koodiarvo not in ('MU', 'KS', 'LI', 'KO', 'KU', 'FI', 'PS', 'OP', 'OPA', 'XX') --AOM, B3
and os.koulutusmoduuli_pakollinen = 1
and (
	os.arviointi_arvosana_koodiarvo in ('5','6','7','8','9','10')
	or (
		os.yksilollistetty_oppimaara = 1
		and os.arviointi_arvosana_koodiarvo = 'S'
	)
)
--päätason suoritukset
insert sa.temp_perusopetuksen_pakollisten_lukuaineiden_arvosanat
select 
	oo.master_oid
	,arviointi_paiva = least(oo.paattymispaiva, ps.vahvistus_paiva, ps.arviointi_paiva)
	,aine = ps.koulutusmoduuli_koodiarvo
	--,kieli_tai_oppimaara = ps.kieli_koodiarvo
	,arvosana = ps.arviointi_arvosana_koodiarvo
	,yksilollistetty = 0
from [sa].[sa_koski_paatason_suoritus] ps 
join sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
where 1=1
and ps.suorituksen_tyyppi in ('nuortenperusopetuksenoppiaineenoppimaara', 'perusopetuksenoppiaineenoppimaara')
and ps.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava' 
and coalesce(oo.paattymispaiva, ps.vahvistus_paiva, ps.arviointi_paiva) is not null
and ps.koulutusmoduuli_koodiarvo not in ('MU', 'KS', 'LI', 'KO', 'KU', 'FI', 'PS', 'OP', 'OPA', 'XX') --AOM, B3
and ps.koulutusmoduuli_pakollinen = 1
and ps.arviointi_arvosana_koodiarvo in ('5','6','7','8','9','10')
and ps.luokkaaste_koodiarvo is null


--3: tarkasteluajankohdat valmistuneille
DROP TABLE IF EXISTS sa.temp_perusopetuksesta_valmistuneet_tarkasteluajankohdat

--valmistumishetki
select 
	master_oid
	,tarkasteluajankohta = min_perusopetuksen_suorituspaiva
	,min_perusopetuksen_suorituspaiva
	,max_opiskelee_toiminta_alueittain
into sa.temp_perusopetuksesta_valmistuneet_tarkasteluajankohdat
from sa.temp_perusopetuksesta_valmistuneet t

--myöhemmät korotusajankohdat
insert sa.temp_perusopetuksesta_valmistuneet_tarkasteluajankohdat
select 
	t.master_oid
	,tarkasteluajankohta = oa.arviointi_paiva
	,min_perusopetuksen_suorituspaiva
	,max_opiskelee_toiminta_alueittain
from sa.temp_perusopetuksesta_valmistuneet t
cross apply (
	select distinct 
		arviointi_paiva
	from sa.temp_perusopetuksen_pakollisten_lukuaineiden_arvosanat
	where 1=1
	and master_oid = t.master_oid
	and arviointi_paiva > t.min_perusopetuksen_suorituspaiva
) oa


--4: maksimiarvosanat tarkasteluajankohdittain (huom. yksilöllistetyt vasta liputtaen)
DROP TABLE IF EXISTS sa.temp_perusopetuksesta_valmistuneet_tarkasteluajankohdat_arvosanat

select 
	t.master_oid
	,t.tarkasteluajankohta
	,t.min_perusopetuksen_suorituspaiva
	,t.max_opiskelee_toiminta_alueittain
	,t2.aine
	,yksilollistetty = max(t2.yksilollistetty)
	,arvosana = max(case when t2.arvosana='S' then null else 0+t2.arvosana end) 
into sa.temp_perusopetuksesta_valmistuneet_tarkasteluajankohdat_arvosanat
from sa.temp_perusopetuksesta_valmistuneet_tarkasteluajankohdat t
left join sa.temp_perusopetuksen_pakollisten_lukuaineiden_arvosanat t2 on t2.master_oid = t.master_oid and t2.arviointi_paiva <= t.tarkasteluajankohta
group by 
	t.master_oid
	,t.tarkasteluajankohta
	,t.min_perusopetuksen_suorituspaiva
	,t.max_opiskelee_toiminta_alueittain
	,t2.aine


--5: keskiarvojen laskenta tarkasteluajankohdittain (huom. toiminta-alueittain opiskelleet vasta liputtaen)
DROP TABLE IF EXISTS sa.perusopetuksen_keskiarvot

SELECT
	t.master_oid
	,t.tarkasteluajankohta
	,[perusopetuksen_paattymispaiva] = min(t.min_perusopetuksen_suorituspaiva)
	,[opiskelee_toiminta_alueittain] = max(t.max_opiskelee_toiminta_alueittain)
	,[oppiaineita_lkm] = count(distinct t.aine)
	,[oppiaineita_yksilollistetty_lkm] = coalesce(count(distinct case when t.yksilollistetty=1 then t.aine end), 0)
	,[yksilollistaminen] = cast(null as int)
	,[yksilollistaminen_fi] = cast(null as varchar(50))
	,[keskiarvo] = cast(avg(cast(case when t.yksilollistetty=1 then 5 else t.arvosana end as decimal)) as decimal(10,5))
	,[keskiarvoluokka] = cast(null as int)
	,[keskiarvo_lahde] = 'KOSKI'
	,loadtime = getdate()
	,username = suser_name()
INTO sa.perusopetuksen_keskiarvot
FROM sa.temp_perusopetuksesta_valmistuneet_tarkasteluajankohdat_arvosanat t
GROUP BY 
	t.master_oid
	,t.tarkasteluajankohta

--päivitetään toiminta-alueittain opiskelleiden keskiarvo 
UPDATE sa.perusopetuksen_keskiarvot
SET [keskiarvo] = 5
WHERE [opiskelee_toiminta_alueittain] = 1

--päivitetään keskiarvoluokka (antero.dw.d_opintojen_kulku_keskiarvot) sekä yksilöllistämisen kategoria 
UPDATE sa.perusopetuksen_keskiarvot
SET [keskiarvoluokka] = coalesce(20 - cast(keskiarvo / 0.5 as int), 99)
	,[yksilollistaminen] = 
		CASE
			WHEN [opiskelee_toiminta_alueittain] = 1 THEN 1
			WHEN [oppiaineita_yksilollistetty_lkm] > 0 AND 2 * [oppiaineita_yksilollistetty_lkm] >= [oppiaineita_lkm] THEN 2
			WHEN [oppiaineita_yksilollistetty_lkm] > 0 AND 2 * [oppiaineita_yksilollistetty_lkm] < [oppiaineita_lkm] THEN 3
			WHEN [oppiaineita_yksilollistetty_lkm] = 0 THEN 4
		END
	,[yksilollistaminen_fi] = 
		CASE
			WHEN [opiskelee_toiminta_alueittain] = 1 THEN 'Alueittain'
			WHEN [oppiaineita_yksilollistetty_lkm] > 0 AND 2 * [oppiaineita_yksilollistetty_lkm] >= [oppiaineita_lkm] THEN 'Kokonaan'
			WHEN [oppiaineita_yksilollistetty_lkm] > 0 AND 2 * [oppiaineita_yksilollistetty_lkm] < [oppiaineita_lkm] THEN 'Osittain'
			WHEN [oppiaineita_yksilollistetty_lkm] = 0 THEN 'Ei'
		END


--6: indeksin luonti
DROP INDEX IF EXISTS [NC_perusopetuksen_keskiarvot] ON [sa].[perusopetuksen_keskiarvot]

CREATE NONCLUSTERED INDEX [NC_perusopetuksen_keskiarvot] ON [sa].[perusopetuksen_keskiarvot]
(
	[master_oid]
	,tarkasteluajankohta
) 
INCLUDE 
(
	[keskiarvoluokka]
	,[perusopetuksen_paattymispaiva]
	,[yksilollistaminen]
	,[yksilollistaminen_fi]
	,[keskiarvo_lahde]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


--7: siivous
DROP TABLE sa.temp_perusopetuksesta_valmistuneet
DROP TABLE sa.temp_perusopetuksen_pakollisten_lukuaineiden_arvosanat
DROP TABLE sa.temp_perusopetuksesta_valmistuneet_tarkasteluajankohdat
DROP TABLE sa.temp_perusopetuksesta_valmistuneet_tarkasteluajankohdat_arvosanat

GO
