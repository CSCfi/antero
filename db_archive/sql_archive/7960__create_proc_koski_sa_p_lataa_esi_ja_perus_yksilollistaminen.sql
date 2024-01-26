USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_esi_ja_perus_yksilollistaminen]    Script Date: 8.8.2023 12:05:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE OR ALTER PROCEDURE [dbo].[p_lataa_esi_ja_perus_yksilollistaminen] AS

truncate table dbo.esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara
truncate table dbo.esi_ja_perus_yksilollistaminen_oppiainesuoritukset

declare @tilv int = 2020
declare @lv_alku date = datefromparts(@tilv-1, 8, 1)
declare @lv_loppu date = datefromparts(@tilv, 7, 31)

while @tilv <= year(getdate())
begin

	--perusjoukko ja äidinkielen oppimäärä(t)
	insert dbo.esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara

	select
		tilastovuosi = @tilv
		
		,ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,[vuosiluokka] = case when ps.suorituksen_tyyppi = 'perusopetuksenoppimaara' then '9' else ps.koulutusmoduuli_koodiarvo end
		
		,oo.oppilaitos_oid
		
		,h.oppija_oid
		,h.aidinkieli
		,h.sukupuoli 
		,kansalaisuus = left(h.kansalaisuus, 3)
		,ika = @tilv - year(h.syntymaaika)

		,erityisen_tuen_paatos = max(case when aj.erityinen_tuki = 1 or aj.hojks = 1 then 1 else 0 end)
		,erityinen_tuki_johdettu = --TK-dimensio
			max(
				case 
					when aj.vaikeasti_vammainen = 1 then 'ertu_v'
					when aj.vammainen = 1 or aj.vammainen_ja_avustaja = 1 then 'ertu_m'
					when aj.erityinen_tuki = 1 or aj.hojks = 1 then 'ertu_muu'
					else 'ertu_eiei'
				end
			)
		,pidennetty_oppivelvollisuus = max(case when aj.pidennetty_oppivelvollisuus = 1 then 1 else 0 end)
		,opiskelee_toiminta_alueittain = max(case when et.opiskelee_toiminta_alueittain = 1 then 1 else 0 end)

		,[AI_oppimaara] = os.kieli_koodiarvo
		,[AI_oppimaara_yksilollistetty] = max(cast(os.yksilollistetty_oppimaara as int))

	from sa.sa_koski_paatason_suoritus ps
	left join sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	left join sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	left join sa.sa_koski_opiskeluoikeus_aikajakso aj on aj.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and aj.alku <= @lv_loppu	and aj.loppu >= @lv_alku
	left join sa.sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos et on et.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and et.alku <= @lv_loppu and et.loppu >= @lv_alku
	left join sa.sa_koski_osasuoritus os 
		on os.paatason_suoritus_id = ps.paatason_suoritus_id
		and os.koulutusmoduuli_koodiarvo = 'AI'
		and os.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava'
		and os.suorituksen_tyyppi = 'perusopetuksenoppiaine'
		and os.arviointi_hyvaksytty = 1

	where ps.vahvistus_paiva between datefromparts(@tilv, 1, 1) and @lv_loppu
	and (
		(ps.suorituksen_tyyppi = 'perusopetuksenvuosiluokka' and ps.koulutusmoduuli_koodiarvo != '9')
		or ps.suorituksen_tyyppi = 'perusopetuksenoppimaara'
	)

	group by ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.suorituksen_tyyppi
		,ps.koulutusmoduuli_koodiarvo
		,oo.oppilaitos_oid
		,h.oppija_oid
		,h.aidinkieli
		,h.sukupuoli 
		,left(h.kansalaisuus, 3)
		,year(h.syntymaaika)
		,os.kieli_koodiarvo


	--yksilöllistäminen
	insert dbo.esi_ja_perus_yksilollistaminen_oppiainesuoritukset
	
	select 
		ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.vahvistus_paiva
		,[vuosiluokka] = case when ps.suorituksen_tyyppi = 'perusopetuksenoppimaara' then '9' else ps.koulutusmoduuli_koodiarvo end
		,[oppiaineita_yksilollistetty_lkm] = count(distinct case when os.yksilollistetty_oppimaara = 1 then os.koulutusmoduuli_koodiarvo end)
		,[ei_oppiainesuorituksia] = max(case when os.koulutusmoduuli_koodiarvo is null then 1 else 0 end)
		,[MA_yksilollistetty] = max(case when os.koulutusmoduuli_koodiarvo = 'MA' then 0 + os.yksilollistetty_oppimaara end)
		,[AI_yksilollistetty] = max(case when os.koulutusmoduuli_koodiarvo = 'AI' then 0 + os.yksilollistetty_oppimaara end)

	from sa.sa_koski_paatason_suoritus ps 
	left join sa.sa_koski_osasuoritus os 
		on os.paatason_suoritus_id = ps.paatason_suoritus_id
		and os.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava'
		and os.suorituksen_tyyppi = 'perusopetuksenoppiaine'
		and os.arviointi_hyvaksytty = 1

	where ps.vahvistus_paiva between datefromparts(@tilv, 1, 1) and @lv_loppu
	and (
		(ps.suorituksen_tyyppi = 'perusopetuksenvuosiluokka' and ps.koulutusmoduuli_koodiarvo != '9')
		or ps.suorituksen_tyyppi = 'perusopetuksenoppimaara'
	)

	group by ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.suorituksen_tyyppi
		,ps.koulutusmoduuli_koodiarvo
		,ps.vahvistus_paiva


	set @tilv += 1
	set @lv_alku = datefromparts(@tilv-1, 8, 1)
	set @lv_loppu = datefromparts(@tilv, 7, 31)

end

GO
