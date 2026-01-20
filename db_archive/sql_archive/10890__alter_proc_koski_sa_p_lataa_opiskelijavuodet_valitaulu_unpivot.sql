USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot]    Script Date: 30.7.2025 16.21.36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



IF @@SERVERNAME like '%pvipu%'
EXEC (
'ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot] AS

TRUNCATE TABLE [dbo].[opiskelijavuodet_valitaulu_unpivot]

INSERT INTO [dbo].[opiskelijavuodet_valitaulu_unpivot]

SELECT 
	 [vuosi]
	,[kuukausi]
	,[tilv_date]
	,unpvt.[master_oid]
	,[opiskeluoikeus_oid]
	,h.[sukupuoli]
	,h.[aidinkieli]
	,[ika] = YEAR(tilv_date)-YEAR(h.syntymaaika)
	,[osa_aikaisuus]
	,[oppis]
	,[erityisopetus]
	,[majoitus]
	,[vankilaopetus]
	,[henkilostokoulutus]
	,[tyovoimakoulutus]
	,[koulk]
	,[diaarinumero]
	,[koulk_pihvi]
	,[diaarinumero_pihvi]
	,[koulutusmuoto_pihvi]
	,[tunn_oid]
	,[jarj_oid]
	,[jarj_oid_hist]
	,[jarj_oid_pihvi]
	,[jarj_oid_pihvi_hist]
	,[toim_oid]
	,[suorituksen_tyyppi] = 
		CASE
			WHEN suorituksen_tyyppi = ''ammatillinentutkinto'' then 1	--koko tutkinto
			WHEN suorituksen_tyyppi = ''tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'' then 3 --tutkinnon osaa pienempi
			ELSE 2 --tutkinnon osa/osia
		END
	,[suorituksen_kieli]
	,[opintojen_rahoitus]
	,[osaamisala]
	,[muu_ammatillinen_tarkenne]
	,[alkamispaiva]
	,[tutkosaa_pienempi_tt]
	,[kustannusryhma] =
		case op_vuosi_tyyppi
			when ''opiskelijavuosi_opva'' then ''ot''
			else kustannusryhma
		end
	
	,[hylkaamisen_peruste] =
		case op_vuosi_tyyppi
			when ''hylatty_opiskelijavuosi_loma'' then 1
			when ''hylatty_opiskelijavuosi_paallekkainen_amm'' then 2
			when ''hylatty_opiskelijavuosi_paallekkainen_lukio'' then 3
			when ''hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus'' then 4
			when ''hylatty_opiskelijavuosi_sisaltyy_toiseen'' then 5
			when ''hylatty_opiskelijavuosi_paallekkainen_tuva_lukio'' then 11
			when ''hylatty_opiskelijavuosi_paallekkainen_tuva_perusopetus'' then 12
			else 9
		end
	,[hyvaksytaan] = 
		case
			when op_vuosi_tyyppi like ''hylatty_%'' then 0
			else 1
		end

	,[op_vuodet] = op_paivat / 365.0

FROM [dbo].[opiskelijavuodet_valitaulu] vt

UNPIVOT (
	op_paivat for op_vuosi_tyyppi in (
		 [opiskelijavuosi_lasna]
		,[opiskelijavuosi_loma]
		,[opiskelijavuosi_opva]
		,[hylatty_opiskelijavuosi_loma]
		,[hylatty_opiskelijavuosi_paallekkainen_amm]
		,[hylatty_opiskelijavuosi_paallekkainen_tuva_lukio]
		,[hylatty_opiskelijavuosi_paallekkainen_tuva_perusopetus]
		,[hylatty_opiskelijavuosi_paallekkainen_lukio]
		,[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus]
		,[hylatty_opiskelijavuosi_sisaltyy_toiseen]
	)
) unpvt

LEFT JOIN sa.sa_koski_henkilo_master h ON h.master_oid = unpvt.master_oid

WHERE [op_paivat] > 0.0000
'
)
 
GO
