USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_TK_K1_16_lahtotaso] AS 

--lopulta poiminnat (limittäin) rahoituskausittain, mikä tuolloin huomioitava alla sekä jatkolatausten liitoksissa.

SELECT 
	[suorituskausi] = [rahoituskausi]
	,ytunnus = coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)
	,opv = cast(sum([opiskelijavuodet]) as decimal (20,10))
	,opv_kerroin = cast(
		cast(
			sum(
				case pohjakoulutus_lahtotaso
					when 'lt_1' then 0.25
					when 'lt_2' then 0.50
					when 'lt_3' then 1.50
					when 'lt_4' then 2.00
					when 'lt_5' then 3.00
				end
				* [opiskelijavuodet]
			)
			as decimal(18,12)
		)
		/ 
		cast(sum([opiskelijavuodet]) as decimal(18,12))
		as decimal(20,19)
	)
	,opv_kerroin_kaikki = cast(
		cast(
			sum(
				sum(
					case pohjakoulutus_lahtotaso
						when 'lt_1' then 0.25
						when 'lt_2' then 0.50
						when 'lt_3' then 1.50
						when 'lt_4' then 2.00
						when 'lt_5' then 3.00
					end
					* [opiskelijavuodet]
				)
			)
			over (partition by rahoituskausi)
			as decimal(18,12)
		)
		/ 
		cast(sum(sum([opiskelijavuodet])) over (partition by rahoituskausi) as decimal(18,12))
		as decimal(20,19)
	)

FROM [dw].[v_TK_K1_16] v
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = v.jarj

WHERE coalesce([maksuttomuuden_piirissa],'2') != '1'

GROUP BY 
	[rahoituskausi]
	,coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)

GO
