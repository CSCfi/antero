USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_TK_K1_16_sis_estimaatti] AS 

--HUOM. Lisää kohtaan 'toteuma' uudet aineistot ylimmäksi, korvaa kohtaan 'estimaatti' lähdetaulut uusilla.
--kala_t2 selitteet noudetaan dimensiosta, koska aineistossa englanniksi.

--estimaatti

SELECT
	generoitu = 1
	,[varainhoitovuosi] = right(rahoituskausi, 4) + 2
	,[rahoituskausi] = concat('01.07.', right([rahoituskausi],4) - 1, ' - ', '30.06.', right([rahoituskausi],4) + 1)
	,tarkastelukausi = concat('01.07.', right([rahoituskausi],4) - 2 + kausi_nro, ' - ', '30.06.', right([rahoituskausi],4) - 1 + kausi_nro)
	,[tilv] = tilv + kausi_nro - 1
	,[ikar8]
    ,[ikar20] = cast([ikar20] as varchar(1))
    ,[maksuttomuuden_piirissa] = maksuton_koulutus
    ,[aikielir1]
	,[jarj]
	,[jarjnim]
	,[tutktyyp]
	,[koulk] = nullif([koulk], 'NULL')
	,[alvv]
	,[rahoitus]
	,[pohjakoulutus]
	,[kustannusryhma] = nullif([kustannusryhma], 'NULL')
	,[kaste_t2_e]
	,[kaste_t2ni_e] = coalesce(nullif([kaste_t2ni_e], '9999'), 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon')
	,[kala_t2_e]
	,[kala_t2ni_e] = d.iscfinarrow2013
	,[pohjakoulutus_ulkom]
	,[kaste_t2_e_ulkom]
	,[kaste_t2ni_e_ulkom] = coalesce(nullif([kaste_t2ni_e_ulkom], '9999'), 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon')
	,[kala_t2_e_ulkom]
	,[kala_t2ni_e_ulkom] = db.iscfinarrow2013
	,[opiskelijavuodet]
	--ei maksuttomien lähtötaso
	,pohjakoulutus_lahtotaso =
		case 
			when [pohjakoulutus_ulkom] = '3' or [pohjakoulutus] = '3' then 'lt_1' --'Korkeakoulututkinto'
			when [pohjakoulutus_ulkom] = '2' or [pohjakoulutus] = '2' then 'lt_2' --'Muu kuin korkeakoulututkinto' 
			when [pohjakoulutus_ulkom] = '1' and [pohjakoulutus] = '1' then 
				case 
					when [tutktyyp] in ('1','2','3','4') then 'lt_3' --'Ei pohjakoulutusta, tutk.koul. & muu'
					when [tutktyyp] = '5' and [koulk] in ('999901', '999908') then 'lt_4' --'Ei pohjakoulutusta, TUVA/VALMA'
					when [tutktyyp] = '5' and [koulk] = '999903' then 'lt_5' --'Ei pohjakoulutusta, TELMA'
					else 'Ei pohjakoulutusta'
				end
		end
	,pohjakoulutus_lahtotaso_kerroin =
		case 
			when [pohjakoulutus_ulkom] = '3' or [pohjakoulutus] = '3' then 0.25 --'Korkeakoulututkinto'
			when [pohjakoulutus_ulkom] = '2' or [pohjakoulutus] = '2' then 0.50 --'Muu kuin korkeakoulututkinto' 
			when [pohjakoulutus_ulkom] = '1' and [pohjakoulutus] = '1' then 
				case 
					when [tutktyyp] in ('1','2','3','4') then 1.50 --'Ei pohjakoulutusta, tutk.koul. & muu'
					when [tutktyyp] = '5' and [koulk] in ('999901', '999908') then 2.00 --'Ei pohjakoulutusta, TUVA/VALMA'
					when [tutktyyp] = '5' and [koulk] = '999903' then 3.00 --'Ei pohjakoulutusta, TELMA'
					else null --virhetilanne
				end
		end

FROM [TK_H9098_CSC].[dbo].[TK_K1_16_sopv_25] t
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d ON d.koulutusluokitus_avain = 'ISCFINARROW' + [kala_t2_e]
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus db ON db.koulutusluokitus_avain = 'ISCFINARROW' + [kala_t2_e_ulkom]
CROSS APPLY (
	select kausi_nro = 1 
	union all
	select 2 
) ca
WHERE right([rahoituskausi],4) < year(getdate()) AND right([rahoituskausi],4) = right(tarkastelukausi,4) --viimeisin tilastokausi tuplana, kun alettu estimoida meneillään olevaa rahoituskautta

UNION ALL

SELECT
	generoitu = 1
	,[varainhoitovuosi] = right(rahoituskausi, 4) + 1
	,[rahoituskausi] = replace(rahoituskausi, '–', '-') --poimintaan pääsi eri viiva
	,tarkastelukausi
	,[tilv]
	,[ikar8]
    ,[ikar20] = cast([ikar20] as varchar(1))
    ,[maksuttomuuden_piirissa] = maksuton_koulutus
    ,[aikielir1]
	,[jarj]
	,[jarjnim]
	,[tutktyyp]
	,[koulk] = nullif([koulk], 'NULL')
	,[alvv]
	,[rahoitus]
	,[pohjakoulutus]
	,[kustannusryhma] = nullif([kustannusryhma], 'NULL')
	,[kaste_t2_e]
	,[kaste_t2ni_e] = coalesce(nullif([kaste_t2ni_e], '9999'), 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon')
	,[kala_t2_e]
	,[kala_t2ni_e] = d.iscfinarrow2013
	,[pohjakoulutus_ulkom]
	,[kaste_t2_e_ulkom]
	,[kaste_t2ni_e_ulkom] = coalesce(nullif([kaste_t2ni_e_ulkom], '9999'), 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon')
	,[kala_t2_e_ulkom]
	,[kala_t2ni_e_ulkom] = db.iscfinarrow2013
	,[opiskelijavuodet]
	--ei maksuttomien lähtötaso
	,pohjakoulutus_lahtotaso =
		case 
			when [pohjakoulutus_ulkom] = '3' or [pohjakoulutus] = '3' then 'lt_1' --'Korkeakoulututkinto'
			when [pohjakoulutus_ulkom] = '2' or [pohjakoulutus] = '2' then 'lt_2' --'Muu kuin korkeakoulututkinto' 
			when [pohjakoulutus_ulkom] = '1' and [pohjakoulutus] = '1' then 
				case 
					when [tutktyyp] in ('1','2','3','4') then 'lt_3' --'Ei pohjakoulutusta, tutk.koul. & muu'
					when [tutktyyp] = '5' and [koulk] in ('999901', '999908') then 'lt_4' --'Ei pohjakoulutusta, TUVA/VALMA'
					when [tutktyyp] = '5' and [koulk] = '999903' then 'lt_5' --'Ei pohjakoulutusta, TELMA'
					else 'Ei pohjakoulutusta'
				end
		end
	,pohjakoulutus_lahtotaso_kerroin =
		case 
			when [pohjakoulutus_ulkom] = '3' or [pohjakoulutus] = '3' then 0.25 --'Korkeakoulututkinto'
			when [pohjakoulutus_ulkom] = '2' or [pohjakoulutus] = '2' then 0.50 --'Muu kuin korkeakoulututkinto' 
			when [pohjakoulutus_ulkom] = '1' and [pohjakoulutus] = '1' then 
				case 
					when [tutktyyp] in ('1','2','3','4') then 1.50 --'Ei pohjakoulutusta, tutk.koul. & muu'
					when [tutktyyp] = '5' and [koulk] in ('999901', '999908') then 2.00 --'Ei pohjakoulutusta, TUVA/VALMA'
					when [tutktyyp] = '5' and [koulk] = '999903' then 3.00 --'Ei pohjakoulutusta, TELMA'
					else null --virhetilanne
				end
		end

FROM [TK_H9098_CSC].[dbo].[TK_K1_16_sopv_25] t
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d ON d.koulutusluokitus_avain = 'ISCFINARROW' + [kala_t2_e]
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus db ON db.koulutusluokitus_avain = 'ISCFINARROW' + [kala_t2_e_ulkom]
WHERE right([rahoituskausi],4) = year(getdate()) --sama kuin toteuma, koska ei vielä estimoida meneillään olevaa rahoituskautta


--toteuma

UNION ALL

SELECT
	generoitu = 0
	,[varainhoitovuosi] = right(rahoituskausi, 4) + 1
	,[rahoituskausi] = replace(rahoituskausi, '–', '-') --poimintaan pääsi eri viiva
	,tarkastelukausi
	,[tilv]
	,[ikar8]
    ,[ikar20] = cast([ikar20] as varchar(1))
    ,[maksuttomuuden_piirissa] = maksuton_koulutus
    ,[aikielir1]
	,[jarj]
	,[jarjnim]
	,[tutktyyp]
	,[koulk] = nullif([koulk], 'NULL')
	,[alvv]
	,[rahoitus]
	,[pohjakoulutus]
	,[kustannusryhma] = nullif([kustannusryhma], 'NULL')
	,[kaste_t2_e]
	,[kaste_t2ni_e] = coalesce(nullif([kaste_t2ni_e], '9999'), 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon')
	,[kala_t2_e]
	,[kala_t2ni_e] = d.iscfinarrow2013
	,[pohjakoulutus_ulkom]
	,[kaste_t2_e_ulkom]
	,[kaste_t2ni_e_ulkom] = coalesce(nullif([kaste_t2ni_e_ulkom], '9999'), 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon')
	,[kala_t2_e_ulkom]
	,[kala_t2ni_e_ulkom] = db.iscfinarrow2013
	,[opiskelijavuodet]
	--ei maksuttomien lähtötaso
	,pohjakoulutus_lahtotaso =
		case 
			when [pohjakoulutus_ulkom] = '3' or [pohjakoulutus] = '3' then 'lt_1' --'Korkeakoulututkinto'
			when [pohjakoulutus_ulkom] = '2' or [pohjakoulutus] = '2' then 'lt_2' --'Muu kuin korkeakoulututkinto' 
			when [pohjakoulutus_ulkom] = '1' and [pohjakoulutus] = '1' then 
				case 
					when [tutktyyp] in ('1','2','3','4') then 'lt_3' --'Ei pohjakoulutusta, tutk.koul. & muu'
					when [tutktyyp] = '5' and [koulk] in ('999901', '999908') then 'lt_4' --'Ei pohjakoulutusta, TUVA/VALMA'
					when [tutktyyp] = '5' and [koulk] = '999903' then 'lt_5' --'Ei pohjakoulutusta, TELMA'
					else 'Ei pohjakoulutusta'
				end
		end
	,pohjakoulutus_lahtotaso_kerroin =
		case 
			when [pohjakoulutus_ulkom] = '3' or [pohjakoulutus] = '3' then 0.25 --'Korkeakoulututkinto'
			when [pohjakoulutus_ulkom] = '2' or [pohjakoulutus] = '2' then 0.50 --'Muu kuin korkeakoulututkinto' 
			when [pohjakoulutus_ulkom] = '1' and [pohjakoulutus] = '1' then 
				case 
					when [tutktyyp] in ('1','2','3','4') then 1.50 --'Ei pohjakoulutusta, tutk.koul. & muu'
					when [tutktyyp] = '5' and [koulk] in ('999901', '999908') then 2.00 --'Ei pohjakoulutusta, TUVA/VALMA'
					when [tutktyyp] = '5' and [koulk] = '999903' then 3.00 --'Ei pohjakoulutusta, TELMA'
					else null --virhetilanne
				end
		end

FROM [TK_H9098_CSC].[dbo].[TK_K1_16_sopv_25] t
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d ON d.koulutusluokitus_avain = 'ISCFINARROW' + [kala_t2_e]
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus db ON db.koulutusluokitus_avain = 'ISCFINARROW' + [kala_t2_e_ulkom]

GO
