USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 8.4.2020 13:21:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] AS
 
SELECT 
       tilastointivuosi = [tilv]
      ,tilv_date=[tilv_date]
      ,sukupuoli = [sp] 
      ,syntymavuosi = [syntv]
      ,aidinkieli_versio1x = [aikielir1x]
      ,kotikunta = [tilvaskun]
      ,kotikunta1x = [tilvaskunx]
      ,sosioekonominen_asema_1_isa = [sose_isa1]
      ,sosioekonominen_asema_1_aiti = [sose_aiti1]
      ,sosioekonominen_asema_2_isa = [sose_isa2]
      ,sosioekonominen_asema_2_aiti = [sose_aiti2]
      ,koulutusluokitus_isa = CAST(
	  (
		case
		when [koulk_isa] = '999999' then 'SA9999'
		else koulk_isa
		end
	  )
		as nvarchar(6))
      ,koulutusluokitus_aiti = CAST(
      (
		case
		when [koulk_aiti] = '999999' then 'SA9999'
		else koulk_aiti
		end
	  )
		as nvarchar(6))
      ,tulodesiili_isa = [tulo_isa]
      ,tulodesiili_aiti = [tulo_aiti]  
	  ,sosioekonominen_tausta = CAST(
		Case when sose_isa2 in ('20', '31', '32', '33', '34') then 1 else 0 end
		+ Case when sose_aiti2 in ('20', '31', '32', '33', '34') then 1 else 0 end
		+ Case when left(koulk_isa,1) in ('7','8') then 1 else 0 end
		+ Case when left(koulk_aiti,1) in ('7','8') then 1 else 0 end
		+ Case when tulo_isa in ('08', '09', '10') then 1 else 0 end
		+ Case when tulo_aiti in ('08', '09', '10') then 1 else 0 end
	   as int)
      ,koulutuslaji = [klaji]
      ,opetushallinnon_koulutus = CAST(
      (
		case
		when [ophal] IS NULL then ''
		else [ophal]
		end
	  )
		as nvarchar(6))
      ,koulutusluokitus = [koulk]
      ,koulutuksen_kieli = [kkieli]
      ,koulutuksen_maakunta= [kmaak]
      ,kirjoihintulovuosi = [alvv]
      ,kirjoillaolo_olosyys =[olosyys]
      ,opetushallinnon_koulutus2 = CAST(
      (
		case
		when [ophal] = '' then '1'
		when [ophal] IS NULL then '1'
		else ophal
		end
	   )
		as nvarchar(2))	
      ,uudet_opiskelijat = [uusi]
      ,opiskelijat = [opisk]
      ,tutkinnot = [tutk]
      ,tietolahde = [tietolahde]
      ,rivinumero = [rivinumero]
      ,ika_1v = cast ((cast(tilv as int) - cast(syntv as int)) as nvarchar (10))
      ,ika_5v =cast(
       (
		case
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
		
		end
	   ) as nvarchar (10))
     

		
FROM [VipunenTK_DW].[dbo].[sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]



GO


USE [ANTERO]