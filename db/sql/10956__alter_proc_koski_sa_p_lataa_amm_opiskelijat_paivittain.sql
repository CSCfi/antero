USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_amm_opiskelijat_paivittain]    Script Date: 30.7.2025 10.15.07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dbo].[p_lataa_amm_opiskelijat_paivittain] @alku as date = '2021-01-01', @loppu as date = null, @kk as int = 1   AS

DECLARE @pvm_alku as date
DECLARE @pvm_loppu as date
DECLARE @pvm_pv as date
DECLARE @pvm_vika as date
DECLARE @vali as int

SET @pvm_vika = CASE WHEN @loppu is null THEN EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)) ELSE @loppu END
SET @vali = @kk
SET @pvm_alku = @alku
SET @pvm_loppu = EOMONTH(DATEADD(MONTH, @vali-1, @pvm_alku))

--pohjana: p_lataa_amm_opiskelijat_netto_valitaulu

--EXEC [sa].[p_lataa_amm_amm_opiskelijat_paivittain]

TRUNCATE TABLE [dbo].[amm_opiskelijat_paivittain]

DROP TABLE IF EXISTS #taulu1
DROP TABLE IF EXISTS #taulu2

CREATE TABLE #taulu2 (
	vuosi int
	,kuukausi int
	,paiva int
	,oo_aloitusvuosi int
	,oo_aloituskuukausi int
	,oo_alkanut_kuussa int
	,oo_alkanut_aikaisintaan int
	,ika_ryhma varchar(3)
	,kansalaisuus varchar(25)
	,suorituksen_tyyppi int
	,tutkintotyyppi varchar(500)
	,oppilaitos_oid varchar(100)
	,master_oid varchar(100)
)

WHILE @pvm_alku < @pvm_vika 

BEGIN
	--antero.dw.d_organisaatioluokitus
	--antero.dw.d_koulutusluokitus
	TRUNCATE TABLE #taulu2

	SELECT
	oo.master_oid
	,oo.oppilaitos_oid
	,ooa.alku
	,ooa.loppu
	,oo_aloitusvuosi = YEAR(oo.alkamispaiva)
	,oo_aloituskuukausi = MONTH(oo.alkamispaiva)
	,ika_ryhma = YEAR(@pvm_alku) - YEAR(h.syntymaaika) 
	,kansalaisuus = LEFT(kansalaisuus, 3)
	,suorituksen_tyyppi =
					CASE
						WHEN ps.suorituksen_tyyppi='ammatillinentutkinto' THEN 1 --koko tutkinto
						WHEN ps.suorituksen_tyyppi='tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus' THEN 3 --tutkinnon osaa pienempi
						ELSE 2 --tutkinnon osa/osia
					END
	,tutkintotyyppi =
					CASE
						WHEN suorituksen_tyyppi='valma' THEN 'VALMA'
						WHEN suorituksen_tyyppi='telma' THEN 'TELMA'
						WHEN suorituksen_tyyppi='tuvakoulutuksensuoritus' THEN 'TUVA'
						WHEN suorituksen_tyyppi='muuammatillinenkoulutus' THEN 'Muu ammatillinen koulutus'
						ELSE d.tutkintotyyppi_fi
					END
	INTO #taulu1

	FROM sa.sa_koski_opiskeluoikeus oo
	LEFT JOIN [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	LEFT JOIN sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid
	LEFT JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d on d.koulutusluokitus_koodi = ps.tutkinto_koodi
	--LEFT JOIN sa.sa_lukio_paatason_suoritus

	WHERE (oo.koulutusmuoto = 'ammatillinenkoulutus' OR oo.tuva_jarjestamislupa = 'ammatillinen')
	--lukiolle hieman monimutkaisempi
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
	AND ooa.tila in ('lasna','loma')
	AND ooa.alku <= @pvm_loppu AND ooa.loppu >= @pvm_alku
	AND ps.rnk = 1
	
	--jakson ekasta päivästä viimeiseen 
	SET @pvm_pv = @pvm_alku

	WHILE @pvm_pv <= @pvm_loppu

	BEGIN

		INSERT INTO #taulu2

		SELECT distinct
			 vuosi = YEAR(@pvm_pv)
			,kuukausi = MONTH(@pvm_pv)
			,paiva = DAY(@pvm_pv)
			,oo_aloitusvuosi	
			,oo_aloituskuukausi
			,oo_alkanut_kuussa =
				case
					when oo_aloitusvuosi = YEAR(@pvm_pv) and oo_aloituskuukausi = MONTH(@pvm_pv) then 1
					when YEAR(oo_aloitusvuosi) != YEAR(@pvm_pv) or oo_aloituskuukausi != MONTH(@pvm_pv) then 0
				end
			,oo_alkanut_aikaisintaan =
				case
					when oo_aloitusvuosi = 2022 and oo_aloituskuukausi >= 3 then 1
					when oo_aloitusvuosi > 2022 then 1
					when oo_aloitusvuosi = 2022 and oo_aloituskuukausi < 3 then 0
					when oo_aloitusvuosi < 2022 then 0
				end
			,ika_ryhma = 
				case
					when ika_ryhma < 19 then 1
					when ika_ryhma IN (19, 20) then 2
					when ika_ryhma > 20 then 3
				end
			,kansalaisuus
			,suorituksen_tyyppi
			,tutkintotyyppi
			,oppilaitos_oid
			,master_oid
		FROM #taulu1 t
		WHERE @pvm_pv between t.alku and t.loppu 

		SET @pvm_pv = DATEADD(DAY, 1, @pvm_pv)

	END

	DROP TABLE #taulu1

	--tiedot välitauluun
	INSERT INTO [dbo].[amm_opiskelijat_paivittain]
	SELECT 
		vuosi 
		,kuukausi 
		,paiva
		,oo_aloitusvuosi
		,oo_aloituskuukausi
		,oo_alkanut_kuussa
		,oo_alkanut_aikaisintaan
		,ika_ryhma
		,kansalaisuus
		,suorituksen_tyyppi
		,tutkintotyyppi
		,oppilaitos_oid
		,lkm = COUNT(DISTINCT(master_oid))
		,pv_kk = DAY(EOMONTH(DATEFROMPARTS(vuosi, kuukausi, paiva)))
	FROM #taulu2 t
	GROUP BY 
		vuosi
		,kuukausi
		,paiva
		,oo_aloitusvuosi
		,oo_aloituskuukausi
		,oo_alkanut_kuussa
		,oo_alkanut_aikaisintaan
		,ika_ryhma
		,kansalaisuus --d_maatjavaltiot2
		,suorituksen_tyyppi
		,tutkintotyyppi --d_koulutusluokitus
		,oppilaitos_oid --d_organisaatioluokitus

	SET @pvm_alku = DATEADD(MONTH, @vali, @pvm_alku)
	SET @pvm_loppu = CASE WHEN @pvm_vika < EOMONTH(DATEADD(MONTH, @vali, @pvm_loppu)) THEN @pvm_vika ELSE EOMONTH(DATEADD(MONTH, @vali, @pvm_loppu)) END

END

DROP TABLE #taulu2




GO


