USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]    Script Date: 9.1.2025 16.22.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







--drop table if exists dbo.f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan
--select * into dbo.f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan from [dbo].[v_f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]

ALTER VIEW [dbo].[v_f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan] AS

SELECT 
      [tilv]
      ,[tilv_date]
	  ,[suorv]
	  ,[sp]
      ,[kansalr1]
      ,[syntyp2]
      ,[tilvasmaak]
      ,[tutkmaak]
	  ,[rahlahde_v2]
	  ,[kvopisk]
      ,[iscfi2013]
      ,[kaste_t2]
      ,[kouljat]
      ,[oppis] 
      ,[tutklaja_tr] 
      ,[ptoim1r6] 
      ,[maassaolo] 
      ,[amas]

      ,[lkm] 
      
	  ,[tietolahde]
      ,[rivinumero]

	  --johdetut
      ,tutkintolaji_tyollistymiseen = cast( 
		(
			case
			-- eka
				when (kaste_t2 = '21')
				and tutklaja_tr='9'
				and kouljat='1'
				then '01'
			-- toinen
				when (kaste_t2 = '31')
				and tutklaja_tr='9'
				and kouljat='1'
				then '02' 
			-- kolmas
				when (kaste_t2 = '31')
				and tutklaja_tr='9'
				and kouljat='3'
				then '03'
			-- ent. neljäs ja viides (ei enää amm. kouljat-erottelua)
				when (kaste_t2= '32')
				and tutklaja_tr='1'
				then '45'
			/*
			-- neljas
				when (d.koulutusaste_taso2_koodi = '32' or d.koulutusaste2002_koodi = '32')
				and l.tutklaja_tr='1'
				and l.kouljat='1'
			    then '04' 
			-- viides
				when (d.koulutusaste_taso2_koodi = '32' or d.koulutusaste2002_koodi = '32')
				and l.tutklaja_tr='1'
				and l.kouljat='8'
			    then '05'
			*/
			-- kuudes
				when (kaste_t2 = '33')
				and tutklaja_tr='2'
				then '06'
			-- seitsemas
				when (kaste_t2 = '41')
				and tutklaja_tr='3'
				then '07'
			-- kahdeksas
				when (kaste_t2 = '61' or kaste_t2 = '51')
				then '08'
			-- yhdeksän
				when (kaste_t2 = '62')
				and tutklaja_tr='9'
				and kouljat = '1'
			    then '09'
			-- kymmenen
				when (kaste_t2 = '62')
				and tutklaja_tr='9'
				and kouljat = '3'
				then '10'
			-- yksitoista
				when (kaste_t2 = '71')
				and tutklaja_tr='9'
				and kouljat = '3'
				then '11'
			-- kaksitoista
				when (kaste_t2 = '63')
				and tutklaja_tr='9'
				and kouljat = '1'
				then '12'
			-- kolmetoista
				when (kaste_t2 = '72')
				and tutklaja_tr='9'
				and kouljat = '1'
			    then '13'
			-- neljatoista
				when (kaste_t2 = '73')
				and tutklaja_tr='9'
				and kouljat = '1'
				then '14'
			-- viisitoista
				when (kaste_t2 = '81')
				and tutklaja_tr='9'
				and kouljat = '1'
				then '15'
			-- kuusitoista
				when (kaste_t2 = '82')
				and tutklaja_tr='9'
				and kouljat = '1'
				then '16'
			-- seitsemantoista
				when (kaste_t2 = '91')
			    then '17'
			end
	   ) as nvarchar(2))

	,sijoittuminen_1v_tutkinnon_jalkeen = case when cast(suorv as int) = (cast(tilv as int) - 1) then cast(lkm as int) else '' end 
	,sijoittuminen_3v_tutkinnon_jalkeen = case when cast(suorv as int) = (cast(tilv as int) - 3) then cast(lkm as int) else '' end
	,sijoittuminen_5v_tutkinnon_jalkeen = case when cast(suorv as int) = (cast(tilv as int) - 5) then cast(lkm as int) else '' end  

	,paaasiallinen_toiminta_ja_maasta_muuttaneet = cast(
		(
			case
				when maassaolo = '2' then '8'
				when ptoim1r6 = '10' then '1'
				when ptoim1r6 = '12' then '4'
				when ptoim1r6 = '13' then '2'
				when ptoim1r6 = '22' then '3'
				when ptoim1r6 = '25' then '5'
				when ptoim1r6 = '26' then '6'
				when ptoim1r6 = '99' then '7'
				else '9'
			end
		)
		as nvarchar(2))
	,paaasiallinen_toiminta_okm= cast(
		(
			case
				when maassaolo = '2' then '5'	
				when (ptoim1r6 = '10' or ptoim1r6 = '13') then '1'
				when ptoim1r6 = '22'  then '2'
				when ptoim1r6 = '12'  then '3'
				when (ptoim1r6 = '25' or ptoim1r6 = '26'or ptoim1r6 = '28' or ptoim1r6 = '99') then '4'
				else '-1'
			end
		)
		as nvarchar(2))
	,sektori = cast(
		(
			case
				when kaste_t2 = '21' then '1'
				when kaste_t2 = '31' then '2'
				when kaste_t2 in ('32','33','41') then '3'
				when kaste_t2 in ('62','71') then '4'
				when kaste_t2 in ('63','72','73','81','82') then '5'
				else '-1'
			end
		)
		as nvarchar(2))
		
FROM [VipunenTK_DW].[dbo].[sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]

GO


