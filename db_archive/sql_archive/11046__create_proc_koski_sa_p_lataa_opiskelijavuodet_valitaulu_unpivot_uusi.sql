USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_uusi] AS

--HUOM. Käyttää samaa kohdetaulua kuin _uusi-päätteetön lataus, joten muutokset mahd. huomioitava siinäkin.

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
	,[ika] = year(tilv_date) - year(h.syntymaaika)
	,oa2.toisen_asteen_pohjakoulutus_2018
	,oa2b.toisen_asteen_tutkinto_2018
	,maksuttomuus = 
		case 
			when 
				maksuton = 1
				and year(h.syntymaaika) > 2003
				and coalesce(year(oa.perusopetuksen_paattymispaiva), 9999) > 2020
				and (
					year(tilv_date) - year(h.syntymaaika) < 21
					or (
						oikeutta_maksuttomuuteen_pidennetty = 1
						and year(alkamispaiva) - year(h.syntymaaika) < 21
					)
				)
				and (
					oa3.kotikunta_mannersuomessa_18v_mennessa = 1
					or h.turvakielto = 1
				)
				and oa4.vapautettu_oppivelvollisuudesta = 0
				and oa2.toisen_asteen_pohjakoulutus_2018 = ''
				and oa2b.toisen_asteen_tutkinto_2018 not like '%amm%'
				and suorituksen_tyyppi != 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
				and kustannusryhma != 'muu'
			then 1
			else 0
		end
	,maksuttomuus_simulointi = 
		case 
			when 
				(
					(
						--perustapaus, jolle pohjana Koski-tieto
						maksuton = 1
						and year(h.syntymaaika) >= 2004
						and coalesce(year(oa.perusopetuksen_paattymispaiva), 9999) >= 2021
					)
					or (
						--syntv puolesta juuri ja juuri lain piirissä, perusopetuksen suorv puolesta ei (toisin kuin samalla suoritusiällä syntv 2005 alkaen)
						year(h.syntymaaika) = 2004
						and year(oa.perusopetuksen_paattymispaiva) = 2020
					)
					or (
						--ei syntv puolesta lain piirissä; samalla perusopetuksen suoritusiällä syntv 2005 alkaen lain piirissä
						year(h.syntymaaika) < 2004
						and coalesce(year(oa.perusopetuksen_paattymispaiva), 9999) - year(h.syntymaaika) >= 16
					)
				)
				and (
					year(tilv_date) - year(h.syntymaaika) < 21
					or (
						oikeutta_maksuttomuuteen_pidennetty = 1
						and year(alkamispaiva) - year(h.syntymaaika) < 21
					)
				)
				and	(
					oa3.kotikunta_mannersuomessa_18v_mennessa = 1
					or h.turvakielto = 1
				)
				and oa4.vapautettu_oppivelvollisuudesta = 0
				and oa2.toisen_asteen_pohjakoulutus_2018 = ''
				and oa2b.toisen_asteen_tutkinto_2018 not like '%amm%'
				and suorituksen_tyyppi != 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
				and kustannusryhma != 'muu'
			then 1
			else 0
		end
	,maksuttomuus_koski = maksuton
	,perusopetuksen_suoritusvuosi = coalesce(year(oa.perusopetuksen_paattymispaiva), -1)
	,oa.keskiarvo_lahde
	,oa.keskiarvoluokka
	,oa.yksilollistaminen
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
			WHEN suorituksen_tyyppi = 'ammatillinentutkinto' then 1	--koko tutkinto
			WHEN suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus' then 3 --tutkinnon osaa pienempi
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
			when 'opiskelijavuosi_opva' then 'ot'
			else kustannusryhma
		end
	,[kustannusryhma_uusi] /*=
		case op_vuosi_tyyppi
			when 'opiskelijavuosi_opva' then 'ot'
			else kustannusryhma_uusi
		end
	*/
	
	,[hylkaamisen_peruste] =
		case op_vuosi_tyyppi
			when 'hylatty_opiskelijavuosi_heinakuu' then 0
			--when 'hylatty_opiskelijavuosi_loma' then 1
			when 'hylatty_opiskelijavuosi_paallekkainen_amm' then 2
			when 'hylatty_opiskelijavuosi_paallekkainen_lukio' then 3
			when 'hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus' then 4
			when 'hylatty_opiskelijavuosi_sisaltyy_toiseen' then 5
			when 'hylatty_opiskelijavuosi_paallekkainen_tuva_lukio' then 11
			when 'hylatty_opiskelijavuosi_paallekkainen_tuva_perusopetus' then 12
			else 9
		end
	,[hyvaksytaan] = 
		case
			when op_vuosi_tyyppi like 'hylatty_%' then 0
			else 1
		end
	,[op_vuodet] = op_paivat / 365.0
	
FROM [dbo].[opiskelijavuodet_valitaulu] vt

JOIN (select 2021 as min_vuosi) v on v.min_vuosi <= vt.vuosi

UNPIVOT (
	op_paivat for op_vuosi_tyyppi in (
		[opiskelijavuosi_uusi]
		--,[opiskelijavuosi_lasna]
		--,[opiskelijavuosi_loma]
		--,[opiskelijavuosi_opva]
		,[hylatty_opiskelijavuosi_heinakuu]
		--,[hylatty_opiskelijavuosi_loma]
		,[hylatty_opiskelijavuosi_paallekkainen_amm]
		,[hylatty_opiskelijavuosi_paallekkainen_tuva_lukio]
		,[hylatty_opiskelijavuosi_paallekkainen_tuva_perusopetus]
		,[hylatty_opiskelijavuosi_paallekkainen_lukio]
		,[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus]
		,[hylatty_opiskelijavuosi_sisaltyy_toiseen]
	)
) unpvt

LEFT JOIN sa.sa_koski_henkilo_master h ON h.master_oid = unpvt.master_oid
OUTER APPLY (
	SELECT TOP 1
		perusopetuksen_paattymispaiva
		,keskiarvo_lahde
		,keskiarvoluokka
		,yksilollistaminen
	FROM sa.perusopetuksen_keskiarvot
	WHERE master_oid = h.master_oid
	AND tarkasteluajankohta < unpvt.alkamispaiva
	ORDER BY tarkasteluajankohta DESC 
) oa
OUTER APPLY (
	select 
		toisen_asteen_pohjakoulutus_2018 =
			concat(
				min(case when tat.sektori='ammatillinen' then 'amm' end)
				,min(case when tat.sektori='lukio' then 'yo' end)
			)
	from sa.toisen_asteen_tutkinnot tat
	where tat.master_oid = unpvt.master_oid
	and tat.vahvistus_paiva < unpvt.alkamispaiva
	and tat.vahvistus_paiva > '2017-12-31'
) oa2
OUTER APPLY (
	select 
		toisen_asteen_tutkinto_2018 = 
			concat(
				min(case when tat.sektori='ammatillinen' then 'amm' end)
				,min(case when tat.sektori='lukio' then 'yo' end)
			)
	from sa.toisen_asteen_tutkinnot tat
	where tat.master_oid = unpvt.master_oid
	and tat.vahvistus_paiva < unpvt.tilv_date
	and tat.vahvistus_paiva > '2017-12-31'
) oa2b
OUTER APPLY (
	select 
		kotikunta_mannersuomessa_18v_mennessa = coalesce(max(0+d.mannersuomessa), 0)
	from sa.sa_koski_kotikuntahistoria kkh
	left join ANTERO.dw.d_alueluokitus d on d.kunta_koodi = kkh.kotikunta
	where kkh.master_oid = h.master_oid
	and coalesce(kkh.muutto_pvm, '1900-01-01') < dateadd(year, 18, h.syntymaaika)
) oa3
OUTER APPLY (
	select 
		vapautettu_oppivelvollisuudesta = coalesce(max(1), 0)
	from sa.sa_valpas_oppivelvollisuudesta_vapautetut ovv
	left join sa.sa_koski_henkilo_master h2 on h2.master_oid = ovv.master_oid
	where h2.master_oid = h.master_oid
	and ovv.vapautettu < tilv_date
	and coalesce(year(ovv.mitatoity), 9999) = 9999
) oa4

WHERE [op_paivat] > 0.0000
 
GO
