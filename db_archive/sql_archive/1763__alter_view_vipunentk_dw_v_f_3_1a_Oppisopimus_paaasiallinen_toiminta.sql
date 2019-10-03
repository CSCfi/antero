USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_3_1a_Oppisopimus_paaasiallinen_toiminta]    Script Date: 7.8.2018 11:00:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_f_3_1a_Oppisopimus_paaasiallinen_toiminta] AS
 
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
      ,paaasiallinen_toiminta_versio3 = [ptoim1r3]
      ,ammattiasema = [amas]
      ,opiskelijat = [lkm]
	  ,tietolahde = [tietolahde]
	  ,rivinumero = [rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_3_1a_Oppisopimuskoulutus]


GO


USE[ANTERO]