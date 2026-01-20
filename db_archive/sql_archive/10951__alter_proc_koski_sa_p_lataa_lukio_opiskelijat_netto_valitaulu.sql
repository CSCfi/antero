USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_lukio_opiskelijat_netto_valitaulu]    Script Date: 30.7.2025 10.08.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_lukio_opiskelijat_netto_valitaulu] AS

--Korvattu päiväkohtainen luuppi opiskelijapäivien esisummauksellla; poiskommentoitu kuukautta pidempien poimintojen tarkastelu ei ilman muita muokkauksia enää toimisi. JS 4.4.2024

DECLARE @pvmAlku as date
DECLARE @pvmLoppu as date
DECLARE @pvmViimeinen as date
--DECLARE @vali as int

SET @pvmAlku = '2018-01-01'
SET @pvmViimeinen = EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)) --edellisen kuukauden vika päivä
--SET @vali = 1
SET @pvmLoppu = EOMONTH(@pvmAlku) --CASE WHEN @pvmViimeinen < EOMONTH(dateadd(month, @vali-1, @pvmAlku)) THEN @pvmViimeinen ELSE EOMONTH(dateadd(month, @vali-1, @pvmAlku)) END


TRUNCATE TABLE [dbo].[lukio_opiskelijat_netto_valitaulu] 

WHILE @pvmAlku < @pvmViimeinen

BEGIN

	--kalenteri
	DROP TABLE IF EXISTS sa.temp_lukio_netto_kalenteri

	SELECT 
		d.kalenteri_avain,
		vuosi = year(d.kalenteri_avain),
		kuukausi = month(d.kalenteri_avain),
		paiva = day(d.kalenteri_avain)
	INTO sa.temp_lukio_netto_kalenteri
	FROM antero.dw.d_kalenteri d 
	WHERE d.kalenteri_avain between @pvmAlku and @pvmLoppu

	CREATE NONCLUSTERED INDEX [NC_temp_lukio_netto_kalenteri] ON [sa].temp_lukio_netto_kalenteri
	(
		kalenteri_avain
		,vuosi
		,kuukausi
		,paiva
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	--opiskeluoikeudet
	DROP TABLE IF EXISTS sa.temp_lukio_opiskeluoikeudet

	SELECT * 
	INTO sa.temp_lukio_opiskeluoikeudet 
	FROM (
		SELECT DISTINCT
			oo.master_oid,
			alku = CASE WHEN ooa.alku >= ps.alku THEN ooa.alku ELSE ps.alku END,
			ooa.loppu,
			ooa.tila,
			majoitus =
				CASE					
					WHEN ooa.majoitus = 1 THEN 2
					WHEN ooa.sisaoppilaitosmainen_majoitus = 1 THEN 3
					WHEN ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 THEN 4
					ELSE 1
				END,
			ps.tavoitetutkinto,
			ps.oppimaara,
			ps.koulutus,
			ps.jarj_koulutus,
			ps.jarj_tavoitetutkinto,
			ps.suorituskieli_koodiarvo,
			ps.toimipiste_oid,
			oo.oppilaitos_oid,
			oo.koulutustoimija_oid,
			case when ov.master_oid is not null then 1 else 0 end as oppivelvollinen,
			h.sukupuoli,
			h.aidinkieli,
			syntymavuosi = year(h.syntymaaika),
			kansalaisuus = left(h.kansalaisuus, 3)
		FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
		JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
		JOIN sa.sa_lukio_paatason_suoritus ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ps.rnk = 1
		JOIN sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid
		LEFT JOIN sa.sa_oppivelvolliset ov on ov.master_oid = oo.master_oid and @pvmAlku between ov.alkuPvm and ov.loppuPvm
		WHERE ooa.alku <= @pvmLoppu 
		AND ooa.loppu >= @pvmAlku
		AND ooa.tila in ('lasna','loma') 
		AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL 
		AND ooa.loppu >= ps.alku
	) f

	CREATE NONCLUSTERED INDEX [NC_temp_lukio_opiskeluoikeudet] ON [sa].temp_lukio_opiskeluoikeudet
	(
		master_oid
		,alku
		,loppu
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


	--raakataulu
	DROP TABLE IF EXISTS sa.temp_lukio_netto_raaka

	SELECT --DISTINCT
		--,loo.alku
		--,loo.loppu
		--,loo.tila
		vuosi = year(@pvmLoppu)
		,kuukausi = month(@pvmLoppu)
		,kalenteripaivat = day(@pvmLoppu)
		,ca.opiskelijapaivat
		,loo.sukupuoli
		,loo.aidinkieli
		,ika = year(@pvmLoppu) - loo.syntymavuosi
		,loo.kansalaisuus
		,loo.oppivelvollinen 
		,loo.majoitus
		,loo.tavoitetutkinto
		,loo.oppimaara
		,loo.koulutus
		,loo.jarj_koulutus
		,loo.jarj_tavoitetutkinto
		,loo.suorituskieli_koodiarvo
		,loo.toimipiste_oid
		,loo.oppilaitos_oid
		,loo.koulutustoimija_oid
		,loo.master_oid
	INTO sa.temp_lukio_netto_raaka
	FROM sa.temp_lukio_opiskeluoikeudet loo
	CROSS APPLY (
		select count(*) opiskelijapaivat
		from sa.temp_lukio_netto_kalenteri kal
		where kalenteri_avain between loo.alku and loo.loppu
		and not exists (
			select 1 
			from sa.tuva_lasna_loma_jaksot tuvat 
			where kal.kalenteri_avain between tuvat.alku and tuvat.loppu
			and tuvat.master_oid = loo.master_oid 
			and loo.koulutus != 'Tutkintokoulutukseen valmentava koulutus'
		)
							  
	) ca
											

	--tiedot välitauluun
	--DROP TABLE IF EXISTS [dbo].[lukio_opiskelijat_netto_valitaulu]
	INSERT [dbo].[lukio_opiskelijat_netto_valitaulu] 
	SELECT 
		vuosi 
		,kuukausi 
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,oppivelvollinen
		,majoitus
		,tavoitetutkinto
		,oppimaara
		,koulutus
		,jarj_tavoitetutkinto
		,jarj_koulutus
		,suorituskieli_koodiarvo
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,ka = 1.0 * sum(opiskelijapaivat) / kalenteripaivat --count(master_oid) / (day(eomonth(datefromparts(vuosi, kuukausi, 1))) * 1.0)
	--INTO [dbo].[lukio_opiskelijat_netto_valitaulu] 
	FROM sa.temp_lukio_netto_raaka t
	GROUP BY 
		vuosi
		,kuukausi
		,kalenteripaivat
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,oppivelvollinen
		,majoitus
		,tavoitetutkinto
		,oppimaara
		,koulutus
		,jarj_tavoitetutkinto
		,jarj_koulutus
		,suorituskieli_koodiarvo
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid

	
	SET @pvmAlku = DATEADD(MONTH, 1, @pvmAlku) --DATEADD(MONTH, @vali, @pvmAlku)
	SET @pvmLoppu = EOMONTH(@pvmAlku) --CASE WHEN @pvmViimeinen < EOMONTH(dateadd(month, @vali-1, @pvmAlku)) THEN @pvmViimeinen ELSE EOMONTH(dateadd(month, @vali-1, @pvmAlku)) END

END

DROP TABLE sa.temp_lukio_netto_raaka
DROP TABLE sa.temp_lukio_opiskeluoikeudet
DROP TABLE sa.temp_lukio_netto_kalenteri

GO


