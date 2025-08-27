USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 25.8.2025 14.05.04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













ALTER  VIEW [dbo].[v_f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] AS
 
SELECT 
    [tilastointivuosi]= [tilv]
    ,[tilv_date]=[tilv_date]
    ,[aineisto]= [aineisto] 
    ,[sukupuoli]=[sp]
    ,[aidinkieli_versio1]= [aikielir1]
    ,[syntymavuosi]= [syntv]
    ,[asuinmaakunta]= [tilvasmaak]
    ,[kansalaisuus_versio1]= [kansalr1]
    ,[pohjoismaa]= [pohjmaa]
    ,[eumaa]=[eumaa]
    ,[etamaa]=[etamaa]
    ,[tutkinnon_suoritusvuosi]=[suorv]
    ,[tutkinnon_suoritusmaakunta]=[suormaak]
	,[koulutuksen_opetuskieli] = [kkieli]
    ,[koulutusluokitus] = CAST(
		(case
			when [koulk] = '999999' then 'SA9999'
			when [koulk] = ' ' then 'SA9999'
			when [koulk]  IS NULL then 'SA9999'
			else [koulk]
		end) 
		as nvarchar(6))
    ,[koulutusmuoto]= [kouljat]
    ,[oppisopimuskoulutus] = CAST(
		(case
			when [oppis]  IS NULL then '2'
			when [oppis]= '' then '2'
			when [oppis]= 'XX' then '2'
			else [oppis]
		end)
		as nvarchar(2))
    ,[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]=[tutklaja_tr]
    ,[paaasiallinen_toiminta_versio6]=[ptoim1r6]
    ,[ammattiluokitus_2001]=[amm2001]
    ,[ammattiluokitus_2010] = CAST(
		(case
			when [amm2010] = 'XX' then ' '
			when [amm2010]  IS NULL then ' '
			else [amm2010]
		end)
		as nvarchar(2))
    ,[tyossakayntitilaston_tyonantajasektori] = CAST(
		(case
			when [tsekt] = '9' then ' '
			else [tsekt]
		end)
		as nvarchar(2))
	--,[koulutusluokitus_korkein_viimeisin_aloitettu] = opiskkoulk
	,[koulutusluokitus_korkein_viimeisin_aloitettu_ka] = ka_opiskkoulk
	,[koulutusluokitus_korkein_viimeisin_aloitettu_ta] = ta_opiskkoulk
	,[koulutusluokitus_korkein_viimeisin_aloitettu_sama] =
		case 
			when (nullif(ka_opiskkoulk,'') != '999999' and ka_opiskkoulk = koulk) or
				 (nullif(ta_opiskkoulk,'') != '999999' and ta_opiskkoulk = koulk) then '1'
			else '0'
		end

	--,[koulutusluokitus_korkein_viimeisin_aloitettu_sama] =
	--	case 
	--		when (nullif(opiskkoulk,'') != '999999' and opiskkoulk = koulk) then '1'
	--		when nullif(opiskkoulk,'') != '999999' and opiskkoulk != koulk then '0'
	--	end
	
	--,[aloittanut_ka_koulutuksen] = 
	--	case 
	--		when (ka_opiskkoulk is null) or (ka_opiskkoulk = '999999') then '0' 
	--		else '1'
	--	end
	--,[aloittanut_ta_koulutuksen] = 
	--	case 
	--		when (ta_opiskkoulk is null) or (ta_opiskkoulk = '999999') then '0'
	--		else '1'
	--	end

    ,[aloittanut_ka_koulutuksen] = 
		case 
			when ((ka_opiskkoulk is not null) and (ka_opiskkoulk != '999999')) or d.iscle2011_koodi in ('5', '6', '7', '8')
			then '1' 
			else '0'
		end
    ,[aloittanut_ta_koulutuksen] = 
		case 
			when ((ta_opiskkoulk is not null) and (ta_opiskkoulk != '999999')) or d.iscle2011_koodi in ('3', '4') then '1'
			else '0'
		end
	,[tutkintoon_johtavassa_koulutuksessa] = tutkjoht
	,[kk_ensim_koulutusaste] = kk_haku_kaste
	,[kk_ensim_hakuvuosi] = kk_haku_vuosi
	,[ta_ensim_koulutusaste] = ta_haku_kaste
	,[ta_ensim_hakuvuosi] = ta_haku_vuosi
	,[tutkinto_suoritettu_ulkomailla] = ulkom
    ,[lukumaara]=[lkm]
    ,[tietolahde]=f.[tietolahde]
    ,[rivinumero]=[rivinumero]
    ,[vaeston_ika_1v] = cast ((cast(tilv as int) - cast(syntv as int)) as nvarchar (10))
    ,[vaeston_ika_5v] = cast(
		(case
			when (cast(tilv as int) - cast(syntv as int)) < 15 then '5v10'
			when ((cast(tilv as int) - cast(syntv as int)) >= 15 and (cast(tilv as int) - cast(syntv as int)) <= 19) then '5v15'
			when ((cast(tilv as int) - cast(syntv as int)) >= 20 and (cast(tilv as int) - cast(syntv as int)) <= 24) then '5v20'
			when ((cast(tilv as int) - cast(syntv as int)) >= 25 and (cast(tilv as int) - cast(syntv as int)) <= 29) then '5v25'
			when ((cast(tilv as int) - cast(syntv as int)) >= 30 and (cast(tilv as int) - cast(syntv as int)) <= 34) then '5v30'
			when ((cast(tilv as int) - cast(syntv as int)) >= 35 and (cast(tilv as int) - cast(syntv as int)) <= 39) then '5v35'
			when ((cast(tilv as int) - cast(syntv as int)) >= 40 and (cast(tilv as int) - cast(syntv as int)) <= 44) then '5v40'
			when ((cast(tilv as int) - cast(syntv as int)) >= 45 and (cast(tilv as int) - cast(syntv as int)) <= 49) then '5v45'
			when ((cast(tilv as int) - cast(syntv as int)) >= 50 and (cast(tilv as int) - cast(syntv as int)) <= 54) then '5v50'
			when ((cast(tilv as int) - cast(syntv as int)) >= 55 and (cast(tilv as int) - cast(syntv as int)) <= 59) then '5v55'
			when ((cast(tilv as int) - cast(syntv as int)) >= 60 and (cast(tilv as int) - cast(syntv as int)) <= 64) then '5v60'
			when ((cast(tilv as int) - cast(syntv as int)) >= 65 and (cast(tilv as int) - cast(syntv as int)) <= 69) then '5v65'
			when ((cast(tilv as int) - cast(syntv as int)) >= 70 and (cast(tilv as int) - cast(syntv as int)) <= 74) then '5v70'
			when ((cast(tilv as int) - cast(syntv as int)) >= 75 and (cast(tilv as int) - cast(syntv as int)) <= 79) then '5v75'
			when ((cast(tilv as int) - cast(syntv as int)) >= 80 and (cast(tilv as int) - cast(syntv as int)) <= 84) then '5v80'
			when ((cast(tilv as int) - cast(syntv as int)) >= 85 and (cast(tilv as int) - cast(syntv as int)) <= 89) then '5v85'
			when ((cast(tilv as int) - cast(syntv as int)) >= 90 and (cast(tilv as int) - cast(syntv as int)) <= 94) then '5v90'
			when ((cast(tilv as int) - cast(syntv as int)) >= 95) then '5v95'
		end) 
		as nvarchar (10))
     
    ,[tutkinnon_suoritusika_1v] = cast(
		(case
			when suorv != '' then cast ((cast(suorv as int) - cast(syntv as int)) as nvarchar (10))
			else ''
		end) 
		as nvarchar (10))
    ,[tutkinnon_ika_1v] = cast(
		(case
			when suorv != '' then cast ((cast(tilv as int) - cast(suorv as int)) as nvarchar (10))
			else ''
		end) 
		as nvarchar (10))
		
FROM [VipunenTK_DW].[dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] f
LEFT JOIN vipunentk..d_koulutusluokitus d on d.koulutusluokitus_avain = f.koulk


GO


