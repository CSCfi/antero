USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_ehoks_opiskelijat]    Script Date: 30.7.2025 11.38.18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_ehoks_opiskelijat] AS

DROP TABLE IF EXISTS sa.temp_ehoks_koski_aikajaksot
DROP TABLE IF EXISTS sa.temp_ehoks_hyto
DROP TABLE IF EXISTS sa.temp_f_ehoks_opiskelijat_MAIN_QUERY
DROP TABLE IF EXISTS dw.f_ehoks_opiskelijat

--aj
select
	opiskeluoikeus_oid
	,paivat = sum(datediff(day, alku, loppu)+1)
	--,paivat_kaikki_tilat = sum(datediff(day, alku, loppu)+1)
into sa.temp_ehoks_koski_aikajaksot
from Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso
where 1=1
and tila in ('lasna','loma','valmistunut') 
and loppu != '9999-12-31'
group by opiskeluoikeus_oid

CREATE UNIQUE CLUSTERED INDEX [idx_sa_temp_ehoks_koski_aikajaksot__opiskeluoikeus_oid] ON [sa].[temp_ehoks_koski_aikajaksot]
(
	opiskeluoikeus_oid ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]


--hyto
select distinct ehoks_id,tutkinnon_osa_koodi,[olennainen-seikka] 
into sa.temp_ehoks_hyto
from sa.sa_ehoks_hyto 
where tutkinnon_osa_koodi is not null

CREATE NONCLUSTERED INDEX [NC_idx_sa_temp_ehoks_koski_aikajaksot__opiskeluoikeus_oid] ON [sa].[temp_ehoks_hyto]
(
	ehoks_id ASC
)
INCLUDE (
	tutkinnon_osa_koodi,
	[olennainen-seikka]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]


--main query
SELECT DISTINCT
	coalesce(h.master_oid, ep.oppija_oid) as master_oid
	,ep.opiskeluoikeus_oid
	,ep.ehoks_id
	,ca.alkamispaiva
	,oo.paattymispaiva
	,oo.koulutustoimija_oid
	,ps.vahvistus_paiva
	,paivat = aj.paivat + case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then datediff(day,ps.suorituksen_alkamispaiva,oo.alkamispaiva)+1 else 0 end
	,paivat_kaikki_tilat = datediff(day, ca.alkamispaiva, ca.paattymispaiva)+1

	,ep.ensikertainen_hyvaksyminen
	,paivitetty
	,osaamisen_hankkimisen_tarve = cast(ep.osaamisen_hankkimisen_tarve as int)
	,opiskeluvalmiuksia_tukevat_opinnot  = cast(ep.opiskeluvalmiuksia_tukevat_opinnot as int)
	,ep.urasuunnitelma_koodi

	,osaamisen_hankkimistapa_koodi
	,hato_olennainen_seikka = coalesce(hato1.olennainen_seikka, 0)
	,vastuullinen_tyopaikkaohjaaja = case when hato1.vastuullinen_tyopaikkaohjaaja = 'true' then 1 else 0 end
	,hato1.tyopaikan_ytunnus
	,hato1.alku
	,hato1.loppu

	,hato2.osaamisen_hankkimistavat

	,oppilaitosmuotoinen_paivat = coalesce(hato2.oppilaitosmuotoinenkoulutus, 0)
	,koulutussopimus_paivat = coalesce(hato2.koulutussopimus, 0)
	,oppisopimus_paivat = coalesce(hato2.oppisopimus, 0)

	,hyto_olennainen_seikka = coalesce(hyto.[olennainen-seikka],0)
	,hyto.tutkinnon_osa_koodi

	,suorituksen_tyyppi =
		case
			when ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1	--koko tutkinto
			when ps.suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus' then 3 --tutkinnon osaa pienempi
			else 2 --tutkinnon osa/osia
		end
	,tutkinto_koodi = coalesce(ps.tutkinto_koodi, ps.koulutusmoduuli_koodiarvo)
	,muu_ammatillinen = case when ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then 1 else 0 end

	,ika_alkamisvuonna = year(ca.alkamispaiva) - year(syntymaaika)
	,h.sukupuoli
	,LEFT(h.kansalaisuus,3) as kansalaisuus
	,h.aidinkieli

INTO sa.temp_f_ehoks_opiskelijat_MAIN_QUERY

FROM sa.sa_ehoks_perustiedot_laajempi ep
LEFT JOIN sa.sa_ehoks_hato hato1 on hato1.ehoks_id = ep.ehoks_id and hato1.osaamisen_hankkimistapa_koodi is not null
LEFT JOIN sa.sa_ehoks_osaamisen_hankkimistavat_paivat hato2 on hato2.ehoks_id = ep.ehoks_id 
LEFT JOIN sa.temp_ehoks_hyto hyto on hyto.ehoks_id = ep.ehoks_id
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on /*oo.master_oid = ep.master_oid and*/ oo.opiskeluoikeus_oid = ep.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = ep.opiskeluoikeus_oid 
LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = ep.oppija_oid
CROSS APPLY (
	select
		alkamispaiva = case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end
		,paattymispaiva = coalesce(oo.paattymispaiva, ps.vahvistus_paiva)
) ca
LEFT JOIN sa.temp_ehoks_koski_aikajaksot aj on aj.opiskeluoikeus_oid = ep.opiskeluoikeus_oid

WHERE ca.alkamispaiva between '2018-01-01' and getdate()
and (oo.koulutusmuoto = 'ammatillinenkoulutus' or oo.tuva_jarjestamislupa = 'ammatillinen')
and ps.rnk = 1


--f
SELECT
	 master_oid
	,ehoks_id
	,opiskeluoikeus_oid
	,alkamispaiva
	,alkamisvuosi = year(alkamispaiva)
	,paattymispaiva
	,paattymisvuosi = coalesce(cast(year(paattymispaiva) as char(4)), 'Ei päättynyt')
	,vahvistuspaiva = vahvistus_paiva
	,opiskeluoikeuden_kesto_paivia = paivat
	,opiskeluoikeuden_kesto_paivia_kaikki_tilat = paivat_kaikki_tilat
	,ensikertainen_hyvaksyminen_kk = floor(datediff(day,alkamispaiva,ensikertainen_hyvaksyminen) / 30.0)
	,d_organisaatioluokitus_jarj_id = coalesce(d10.id, -1)
	,d_kytkin_koulutus_paattynyt_id = coalesce(d12.id, -1)
	,d_kytkin_valmistunut_id = coalesce(d13.id, -1)

	,oppilaitosmuotoinen_paivat
	,koulutussopimus_paivat
	,oppisopimus_paivat

	,sopimusjakso_alku = alku
	,sopimusjakso_loppu = loppu
	,d_kytkin_tutkinnon_osakohtaisia_jaksoja_hoksissa_id = coalesce(d17.id, -1)
	,d_osaamisen_hankkimistapa_id = coalesce(d16.id, -1)
	,d_osaamisen_hankkimistavat_id = coalesce(d18.id, -1)
	,d_kytkin_olennainen_seikka_hato_id = coalesce(d6.id, -1)
	,d_kytkin_nimetty_vastuullinen_tyopaikkaohjaaja_id = coalesce(d8.id, -1)
	,d_kytkin_opiskeluvalmiuksia_tukevat_opinnot_id = coalesce(d5.id, -1)
	,d_kytkin_osaamisen_hankkimisen_tarve_id = coalesce(d4.id, -1)
	,d_kytkin_ehoks_paivitetty_id = coalesce(d11.id, -1)
	,urasuunnitelma = coalesce(k.nimi, 'Tieto puuttuu')
	,d_toimiala_id = coalesce(d14.id, -1)

	,d_kytkin_olennainen_seikka_hyto_id = coalesce(d7.id, -1)
	,d_tutkinnon_osat_id = coalesce(t.id, -1)

	,d_koulutusluokitus_id = coalesce(d1.id, -1)
	,d_suorituksen_tyyppi_id = coalesce(d9.id, -1)
	,d_kytkin_muu_ammatillinen_id = coalesce(d15.id, -1)

	,d_sukupuoli_id = coalesce(d2.id, -1)
	,d_kansalaisuus_id = coalesce(d20.id, -1)
	,d_aidinkieli_id = coalesce(d19.id, -1)
	,d_ika_alkamisvuonna_id = coalesce(d3.id, -1)

INTO dw.f_ehoks_opiskelijat

FROM sa.temp_f_ehoks_opiskelijat_MAIN_QUERY Q
LEFT JOIN dw.d_koulutusluokitus d1a on d1a.koulutusluokitus_koodi = Q.tutkinto_koodi
LEFT JOIN dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = coalesce(d1a.uusi_eat_koodi, d1a.koulutusluokitus_koodi)
LEFT JOIN dw.d_sukupuoli d2 on d2.sukupuoli_koodi = Q.sukupuoli
LEFT JOIN dw.d_ika d3 on d3.ika_avain = Q.ika_alkamisvuonna
LEFT JOIN dw.d_kytkin d4 on d4.kytkin_koodi = Q.osaamisen_hankkimisen_tarve
LEFT JOIN dw.d_kytkin d5 on d5.kytkin_koodi = Q.opiskeluvalmiuksia_tukevat_opinnot
LEFT JOIN dw.d_kytkin d6 on d6.kytkin_koodi = Q.hato_olennainen_seikka
LEFT JOIN dw.d_kytkin d7 on d7.kytkin_koodi = Q.hyto_olennainen_seikka
LEFT JOIN dw.d_kytkin d8 on d8.kytkin_koodi = Q.vastuullinen_tyopaikkaohjaaja
LEFT JOIN dw.d_suorituksen_tyyppi d9 on d9.koodi = Q.suorituksen_tyyppi
LEFT JOIN dw.d_organisaatioluokitus d10 on d10.organisaatio_oid = Q.koulutustoimija_oid
LEFT JOIN dw.d_kytkin d11 on d11.kytkin_koodi = (case when Q.paivitetty is not null then 1 else 0 end)
LEFT JOIN dw.d_kytkin d12 on d12.kytkin_koodi = (case when coalesce(Q.paattymispaiva, '9999-12-31') <= getdate() then 1 else 0 end)
LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = (case when coalesce(Q.vahvistus_paiva, '9999-12-31') <= getdate() then 1 else 0 end)
LEFT JOIN Koski_SA.sa.sa_ytj_yritystiedot ytj on ytj.ytunnus = Q.tyopaikan_ytunnus
LEFT JOIN dw.d_toimialaluokitus2008 d14 on d14.toimiala_koodi = ytj.toimiala_koodi
LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = Q.muu_ammatillinen
LEFT JOIN dw.d_osaamisen_hankkimistapa d16 on d16.koodi = Q.osaamisen_hankkimistapa_koodi
LEFT JOIN dw.d_kytkin d17 on d17.kytkin_koodi = (case when oppilaitosmuotoinen_paivat+koulutussopimus_paivat+oppisopimus_paivat = 0 then 0 else 1 end)
LEFT JOIN dw.d_osaamisen_hankkimistavat d18 on d18.koodi = Q.osaamisen_hankkimistavat
LEFT JOIN dw.d_kieli d19 on d19.kieli_koodi = Q.aidinkieli
LEFT JOIN dw.d_maatjavaltiot2 d20 on d20.maatjavaltiot2_koodi = Q.kansalaisuus

LEFT JOIN sa.sa_koodistot k on k.koodi = Q.urasuunnitelma_koodi and k.koodisto='urasuunnitelma'
LEFT JOIN (select koodiarvo, id=min(id) from Koski_SA.sa.sa_eperusteet_tutkinnonosat GROUP BY koodiarvo) t on t.koodiarvo = Q.tutkinnon_osa_koodi


DROP TABLE sa.temp_ehoks_koski_aikajaksot
DROP TABLE sa.temp_ehoks_hyto
DROP TABLE sa.temp_f_ehoks_opiskelijat_MAIN_QUERY

GO


