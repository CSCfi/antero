USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot]    Script Date: 23.8.2020 19:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot] AS


TRUNCATE TABLE [Koski_SA].[dbo].[opiskelijavuodet_valitaulu_unpivot]

INSERT INTO [Koski_SA].[dbo].[opiskelijavuodet_valitaulu_unpivot]

SELECT distinct
	 [vuosi]
	,[kuukausi]
	,[tilv_date]
	,[oppija_oid]
	,[opiskeluoikeus_oid]
	,[sukupuoli]
	,[aidinkieli]
	,[ika]
	,[osa_aikaisuus]
	,[oppis]
	,[erityisopetus]
	,[majoitus]
	,[vankilaopetus]
	,[henkilostokoulutus]
	,[tyovoimakoulutus]
	,[koulk]
	,[koulk_pihvi]
	,[koulutusmuoto_pihvi]
	,[tunn_oid]
	,[jarj_oid]
	,[jarj_oid_hist]
	,[jarj_oid_pihvi]
	,[jarj_oid_pihvi_hist]
	,[toim_oid]
	,[suorituksen_tyyppi] = 
		CASE
			WHEN suorituksen_tyyppi = 'ammatillinentutkinto' then 1		--koko tutkinto
			ELSE 2														--tutkinnon osa/osia
		END
	,[opintojen_rahoitus]
	,[osaamisala]
	,[muu_ammatillinen_tarkenne]
	,[alkamispaiva]
	,[kustannusryhma] =
		case 
			when op_vuosi_tyyppi = 'opiskelijavuosi_opva' then 'ot'
			when suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN coalesce(kr_os.kr, okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
			when suorituksen_tyyppi = 'muuammatillinenkoulutus' then 'muu'
			else coalesce(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi) 
		end
	,[hylkaamisen_peruste] =
		case op_vuosi_tyyppi
			when 'hylatty_opiskelijavuosi_loma' then 1
			when 'hylatty_opiskelijavuosi_paallekkainen_amm' then 2
			when 'hylatty_opiskelijavuosi_paallekkainen_lukio' then 3
			when 'hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus' then 4
			when 'hylatty_opiskelijavuosi_sisaltyy_toiseen' then 5
			else 9
		end
	,[hyvaksytaan] = 
		case
			when op_vuosi_tyyppi like 'hylatty_%' then 0
			else 1
		end
	,[op_vuodet] = op_paivat / 365.0
	  
FROM [Koski_SA].[dbo].[opiskelijavuodet_valitaulu] vt

unpivot (
	op_paivat for op_vuosi_tyyppi in (
		 [opiskelijavuosi_lasna]
		,[opiskelijavuosi_loma]
		,[opiskelijavuosi_opva]
		,[hylatty_opiskelijavuosi_loma]
		,[hylatty_opiskelijavuosi_paallekkainen_amm]
		,[hylatty_opiskelijavuosi_paallekkainen_lukio]
		,[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus]
		,[hylatty_opiskelijavuosi_sisaltyy_toiseen]
	)
) unpvt

--koko tutkinto
left join ANTERO.dw.d_koulutusluokitus k3 ON k3.koulutusluokitus_koodi = unpvt.koulk
left join ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = unpvt.osaamisala
left join ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = coalesce(k3.uusi_eat_koodi, k3.koulutusluokitus_koodi)

--osatutkinto
left join dbo.kustannusryhma_osasuoritus kr_os on cast(kr_os.tutkinnonosa_koodi as varchar(10)) = unpvt.tutkinnonosa_koodi

WHERE [op_paivat] > 0.0000
 
GO
USE ANTERO