USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_3_1b_Oppisopimus_koulutuksen_kesto]    Script Date: 8.8.2018 15:45:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_f_3_1b_Oppisopimus_koulutuksen_kesto] AS
 
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
      ,opetushallinnon_koulutusaste = [opmast]
	  ,koulutusala_taso_1_avain='ISCFIBROAD'+[iscfibroad2013]
	  ,koulutusaste_taso_2_avain='KASTET2'+[kaste_t2]
      ,ammatillisen_koulutuksen_koulutuslaji = [tutklaja]
      ,koulutuksen_sijaintimaakunta = CAST(
	  (
		case
		when LEN([kmaak]) = 1 then '0'+[kmaak]
		else [kmaak]
		end)
	   as nvarchar(6))
	  ,koulutuksen_arvioitu_kesto = CAST(
	  (
		case
		when [kesto] = '' then 'XX'
		when [kesto] is NULL then 'XX'
		else [kesto]
		end)
	   as nvarchar(6))
	  ,koulutuksen_toteutunut_kesto = CAST(
	  (
		case
		when [kestotot] = '' then 'XX'
		when [kestotot] is NULL then 'XX'
		else [kestotot]
		end)
	   as nvarchar(6))
      ,opiskelijat = [lkm]
	  ,[tietolahde] = [tietolahde]
      ,[rivinumero] = [rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_3_1b_Oppisopimuskoulutus]






GO

USE [ANTERO]
