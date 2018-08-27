USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_3_2_Oppisopimus_jatko_opinnot]    Script Date: 9.8.2018 16:04:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_3_2_Oppisopimus_jatko_opinnot] AS
 

SELECT 
       tilastointivuosi = [tilv]
      ,tilv_date=[tilv_date]
	  ,oppisryh = [oppisryh]
      ,sukupuoli = [sp] 
      ,aidinkieli_versio1 = [aikielir1]
     ,ika = CAST(
	  (
		case
		when [ikar2] = '24' then 'ikar224'
		when [ikar2] = '25' then 'ikar225'
		else '-1'
		end)
	   as nvarchar(7))
      ,opetushallinnon_koulutusala = [opmala]
	  ,koulutusala_taso_1_avain=CAST (
	  (case
		when [iscfibroad2013] is null then '' else 'ISCFIBROAD'+[iscfibroad2013]
	   end)
	   as nvarchar(12))
      ,ammatillisen_koulutuksen_koulutuslaji = [tutklaja]
      ,koulutuksen_sijaintimaakunta = CAST(
	  (
		case
		when LEN([kmaak]) = 1 then '0'+[kmaak]
		else [kmaak]
		end)
	   as nvarchar(6))
	  ,jatko_opintojen_koulutusaste  = CAST(
	  (
		case
		when [jopmast] is NULL then ''
		else [jopmast]
		end)
	   as nvarchar(2))
	  ,jatko_opintojen_koulutusaste_taso_2_avain= CAST(
	  (
	  case 
		when [jkaste_t2] is null then '' else 'KASTET2'+[jkaste_t2]
	  end) as nvarchar(9))
      ,opiskelijat = [lkm]
	  ,[tietolahde] = [tietolahde]
      ,[rivinumero] = [rivinumero]
	  ,[jatko_opiskelu] =  CAST(
	  (
		case
		when ([jopmast] = '' or [jopmast] is NULL) AND ([jkaste_t2] = '' or [jkaste_t2] is NULL) then '2'
		else '1'
		end)
	   as nvarchar(2))
	,[koulutusaste2002] = CAST(
	  (
		case
		when [opmast] is NULL then ''
		else [opmast]
		end)
	   as nvarchar(2))
	,[jatko_opiskelun_koulutusala]= CAST(
	  (
		case
		when [jopmala] is NULL then ''
		else [jopmala]
		end)
	   as nvarchar(1))
	,koulutusaste_taso_2_avain=CAST(
	  (
	  case 
		when [kaste_t2] is null then '' else 'KASTET2'+[kaste_t2]
	  end) as nvarchar(9))
	,jatko_opintoje_koulutusala_taso_1_avain=CAST (
	  (case
		when [jiscfibroad2013] is null then '' else 'ISCFIBROAD'+[jiscfibroad2013]
	   end)
	   as nvarchar(12))
FROM [VipunenTK_DW].[dbo].[sa_3_2_Oppisopimuskoulutus]



GO


USE [ANTERO]