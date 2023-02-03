USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]    Script Date: 23.12.2022 16:01:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--truncate table dbo.f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat
--insert into dbo.f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat select * from [dbo].[v_f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]
--drop table dbo.f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat
--select * into dbo.f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat from [dbo].[v_f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]

CREATE OR ALTER VIEW [dbo].[v_f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat] AS

SELECT 
	[tilv]
	,[tilv_date]
	,[lahde]
	,[aineisto]

	,[ikar8]
	,[sp]
	,[tilvaskunsuuraluer2]
	,[tilvaskunryh]
	,[syntyp2]
	,[sosee]
	,[ptoim1r6e]
	,[pientul]
	,[tol2008_1_v2]
	
	,[kaste_t2_3] --78 sis. tohtorit ja lis.
	,[iscfi2013]
	,[eitutkjoht]
	,[tyov]
	,[tavoite]
		
	,[aikyo]
	,[aikpt]
	,[aikateat]
	,[aikamk]
	,[aikalkk]
	,[aikylamk]
	,[aikylkk]

	,[lkm]


  --johdetut

	,ika_25_64_vuotta = case when ikar8 between 25 and 64 then '1' when ikar8 != -1 then '0' end

	,sektori = cast(
		(
			case
				when lahde = '1' /*Koski*/ or lahde = '36' then '3' --amm
				when lahde = '41' then '4' --amk
				when lahde = '51' then '5' --yo
				when lahde = '2' /*Virta*/ then '45' --amk/yo
				else '-1'
			end
		)
		as nvarchar(2))

	,korkein_aiempi_tutkinto = 
		case 
			when [aikylkk] = 1 then 'ylkk'
			when [aikylamk] = 1 then 'ylamk'
			when [aikalkk] = 1 then 'alkk'
			when [aikamk] = 1 then 'amk'
			when [aikateat] = 1 then 'ateat'
			when [aikpt] = 1 then 'pt'
			when [aikyo] = 1 then 'yo'
			else 'eiper'
		end

	--aineistossa suorv 11 ja 20 karkeistettuja arvoja
	,korkein_aiempi_tutkinto_vuotta_kulunut =
		case 
			when [aikylkk] = 1 then case [suorvylkk] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvylkk] as varchar), 2) end
			when [aikylamk] = 1 then case [suorvylamk] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvylamk] as varchar), 2) end
			when [aikalkk] = 1 then case [suorvalkk] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvalkk] as varchar), 2) end
			when [aikamk] = 1 then case [suorvamk] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvamk] as varchar), 2) end
			when [aikateat] = 1 then case [suorvateat] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvateat] as varchar), 2) end 
			when [aikpt] = 1 then case [suorvpt] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvpt] as varchar), 2) end
			when [aikyo] = 1 then case [suorvyo] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvyo] as varchar), 2) end
		end
	
	,[aikyo_vuotta_kulunut] = case [suorvyo] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvyo] as varchar), 2) end
	,[aikpt_vuotta_kulunut] = case [suorvpt] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvpt] as varchar), 2) end
	,[aikateat_vuotta_kulunut] = case [suorvateat] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvateat] as varchar), 2) end
	,[aikamk_vuotta_kulunut] = case [suorvamk] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvamk] as varchar), 2) end
	,[aikalkk_vuotta_kulunut] = case [suorvalkk] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvalkk] as varchar), 2) end
	,[aikylamk_vuotta_kulunut] = case [suorvylamk] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvylamk] as varchar), 2) end
	,[aikylkk_vuotta_kulunut] = case [suorvylkk] when '11' then '11–20' when '20' then '21–' else right(' ' + cast(0+tilv-[suorvylkk] as varchar), 2) end

FROM [VipunenTK_DW].[dbo].[sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]

GO
