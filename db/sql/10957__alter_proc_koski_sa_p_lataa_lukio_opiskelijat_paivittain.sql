USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_lukio_opiskelijat_paivittain]    Script Date: 30.7.2025 10.16.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dbo].[p_lataa_lukio_opiskelijat_paivittain] @alku as date = '2021-01-01', @loppu as date = null, @kk as int = 1   AS

DECLARE @pvm_alku as date
DECLARE @pvm_loppu as date
DECLARE @pvm_pv as date
DECLARE @pvm_vika as date
DECLARE @vali as int

SET @pvm_vika = CASE WHEN @loppu is null THEN EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)) ELSE @loppu END
SET @vali = @kk
SET @pvm_alku = @alku
SET @pvm_loppu = EOMONTH(DATEADD(MONTH, @vali-1, @pvm_alku))

--pohjana: p_lataa_amm_opiskelijat_paivittain

--EXEC [sa].[p_lataa_lukio_opiskelijat_paivittain]

TRUNCATE TABLE [dbo].[lukio_opiskelijat_paivittain]

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
	,tavoitetutkinto varchar(100)
	,oppimaara varchar(100)
	,koulutus varchar(100)
	,kansalaisuus varchar(25)
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
	,CASE WHEN ooa.alku >= ps.alku THEN ooa.alku ELSE ps.alku END as alku
	,ooa.loppu
	,oo_aloitusvuosi = YEAR(CASE WHEN oo.alkamispaiva >= ps.alku THEN oo.alkamispaiva ELSE ps.alku END)
	,oo_aloituskuukausi = MONTH(CASE WHEN oo.alkamispaiva >= ps.alku THEN oo.alkamispaiva ELSE ps.alku END)
	,ika_ryhma = YEAR(@pvm_alku) - YEAR(h.syntymaaika) 
	,ps.tavoitetutkinto
	,ps.oppimaara
	,ps.koulutus
	,kansalaisuus = LEFT(kansalaisuus, 3)
	INTO #taulu1

	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
	JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	JOIN sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid
	JOIN sa.sa_lukio_paatason_suoritus ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ps.rnk = 1

	WHERE ooa.tila in ('lasna','loma')
	AND CASE WHEN oo.alkamispaiva >= ps.alku THEN oo.alkamispaiva ELSE ps.alku END <= @pvm_loppu AND ooa.loppu >= @pvm_alku AND ooa.loppu > ps.alku
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL

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
			,tavoitetutkinto
			,oppimaara
			,koulutus
			,kansalaisuus
			,oppilaitos_oid
			,master_oid
		FROM #taulu1 t
		WHERE @pvm_pv between t.alku and t.loppu 

		SET @pvm_pv = DATEADD(DAY, 1, @pvm_pv)

	END

	DROP TABLE #taulu1

	--tiedot välitauluun
	INSERT INTO [dbo].[lukio_opiskelijat_paivittain]
	SELECT 
		vuosi 
		,kuukausi 
		,paiva
		,oo_aloitusvuosi
		,oo_aloituskuukausi
		,oo_alkanut_kuussa
		,oo_alkanut_aikaisintaan
		,ika_ryhma
		,tavoitetutkinto
		,oppimaara
		,koulutus
		,kansalaisuus
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
		,tavoitetutkinto
		,oppimaara
		,koulutus
		,kansalaisuus --d_maatjavaltiot2
		,oppilaitos_oid --d_organisaatioluokitus

	SET @pvm_alku = DATEADD(MONTH, @vali, @pvm_alku)
	SET @pvm_loppu = CASE WHEN @pvm_vika < EOMONTH(DATEADD(MONTH, @vali, @pvm_loppu)) THEN @pvm_vika ELSE EOMONTH(DATEADD(MONTH, @vali, @pvm_loppu)) END

END

DROP TABLE #taulu2

GO


