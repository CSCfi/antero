USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[_v_aloittaneiden_lapaisy_sarakeryhmat_nykytila]    Script Date: 21.7.2020 13:27:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[_v_aloittaneiden_lapaisy_sarakeryhmat_nykytila] AS

SELECT [tilv]
      ,[lahde]
      ,[opp]
      ,[sp]
      ,[syntv]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[klaji]
      ,[ophal]
      ,[jarj]
      ,[kkun]
      ,[maak]
      ,[koulk]
      ,[opmala]
      ,[opmopa]
      ,[opmast]
      ,[opm95opa]
      ,[koulutussektori]
      ,[pohjkoulk]
      ,[alvv_kk]
      ,[allk_kk]
      ,[ololk]
      ,[rahlahde]
      ,[koulutuslaji2]
      ,[tutkintolaji] = Case when [koulutuslaji2] in ('21', '22') then 'lu'
							when [koulutuslaji2] in ('31', '32', '35', '36', '61', '64') then 'ampt'
							when [koulutuslaji2] in ('33', '34', '37', '38', '62', '63', '65', '66') then 'amlk'
							when [koulutuslaji2] in ('41', '42') then 'amk'
							when [koulutuslaji2] = '46' then 'ylamk'
							when [koulutuslaji2] = '51a' then 'alkk'
							when [koulutuslaji2] = '51b' then 'ylkk'
							when [koulutuslaji2] = '52' then 'tk' 
							else 'muu' end
      ,[tietolahde]
      ,[aineistorivinumero]
      ,[lkm_int]
      ,[Sarakeryhma1_ID]
      ,[Sarakeryhma1_tyyppi]
      ,[Sarakeryhma1_opp]
      ,[Sarakeryhma1_opmala]
      ,[Sarakeryhma1_opmopa]
      ,[Sarakeryhma1_opmast]
      ,[Sarakeryhma1_opm95opa]
      ,[Sarakeryhma1_koulutussektori]
      ,[Sarakeryhma1_suorv]
      ,[Sarakeryhma1_suorlk]
      ,[Sarakeryhma1_kmaak]
      ,[Sarakeryhma1_olotamm]
      ,[Sarakeryhma1_olosyys]
      ,[Sarakeryhma1_ptoim1r5]
      ,[Sarakeryhma1_amas]
      ,[Sarakeryhma1_koulk]
      ,[Sarakeryhma1_jarj]
      ,[Sarakeryhma1_tutkintolaji]
      ,[Sarakeryhma2_ID]
      ,[Sarakeryhma2_tyyppi]
      ,[Sarakeryhma2_opp]
      ,[Sarakeryhma2_opmala]
      ,[Sarakeryhma2_opmopa]
      ,[Sarakeryhma2_opmast]
      ,[Sarakeryhma2_opm95opa]
      ,[Sarakeryhma2_koulutussektori]
      ,[Sarakeryhma2_suorv]
      ,[Sarakeryhma2_suorlk]
      ,[Sarakeryhma2_kmaak]
      ,[Sarakeryhma2_olotamm]
      ,[Sarakeryhma2_olosyys]
      ,[Sarakeryhma2_ptoim1r5]
      ,[Sarakeryhma2_amas]
      ,[Sarakeryhma2_koulk]
      ,[Sarakeryhma2_jarj]
      ,[Sarakeryhma2_tutkintolaji]
      ,[Sarakeryhma3_ID]
      ,[Sarakeryhma3_tyyppi]
      ,[Sarakeryhma3_opp]
      ,[Sarakeryhma3_opmala]
      ,[Sarakeryhma3_opmopa]
      ,[Sarakeryhma3_opmast]
      ,[Sarakeryhma3_opm95opa]
      ,[Sarakeryhma3_koulutussektori]
      ,[Sarakeryhma3_suorv]
      ,[Sarakeryhma3_suorlk]
      ,[Sarakeryhma3_kmaak]
      ,[Sarakeryhma3_olotamm]
      ,[Sarakeryhma3_olosyys]
      ,[Sarakeryhma3_ptoim1r5]
      ,[Sarakeryhma3_amas]
      ,[Sarakeryhma3_koulk]
      ,[Sarakeryhma3_jarj]
      ,[Sarakeryhma3_tutkintolaji]
      ,[Sarakeryhma4_ID]
      ,[Sarakeryhma4_tyyppi]
      ,[Sarakeryhma4_opp]
      ,[Sarakeryhma4_opmala]
      ,[Sarakeryhma4_opmopa]
      ,[Sarakeryhma4_opmast]
      ,[Sarakeryhma4_opm95opa]
      ,[Sarakeryhma4_koulutussektori]
      ,[Sarakeryhma4_suorv]
      ,[Sarakeryhma4_suorlk]
      ,[Sarakeryhma4_kmaak]
      ,[Sarakeryhma4_olotamm]
      ,[Sarakeryhma4_olosyys]
      ,[Sarakeryhma4_ptoim1r5]
      ,[Sarakeryhma4_amas]
      ,[Sarakeryhma4_koulk]
      ,[Sarakeryhma4_jarj]
      ,[Sarakeryhma4_tutkintolaji]
      ,[Sarakeryhma5_ID]
      ,[Sarakeryhma5_tyyppi]
      ,[Sarakeryhma5_opp]
      ,[Sarakeryhma5_opmala]
      ,[Sarakeryhma5_opmopa]
      ,[Sarakeryhma5_opmast]
      ,[Sarakeryhma5_opm95opa]
      ,[Sarakeryhma5_koulutussektori]
      ,[Sarakeryhma5_suorv]
      ,[Sarakeryhma5_suorlk]
      ,[Sarakeryhma5_kmaak]
      ,[Sarakeryhma5_olotamm]
      ,[Sarakeryhma5_olosyys]
      ,[Sarakeryhma5_ptoim1r5]
      ,[Sarakeryhma5_amas]
      ,[Sarakeryhma5_koulk]
      ,[Sarakeryhma5_jarj]
      ,[Sarakeryhma5_tutkintolaji]
      ,[Sarakeryhma6_ID]
      ,[Sarakeryhma6_tyyppi]
      ,[Sarakeryhma6_opp]
      ,[Sarakeryhma6_opmala]
      ,[Sarakeryhma6_opmopa]
      ,[Sarakeryhma6_opmast]
      ,[Sarakeryhma6_opm95opa]
      ,[Sarakeryhma6_koulutussektori]
      ,[Sarakeryhma6_suorv]
      ,[Sarakeryhma6_suorlk]
      ,[Sarakeryhma6_kmaak]
      ,[Sarakeryhma6_olotamm]
      ,[Sarakeryhma6_olosyys]
      ,[Sarakeryhma6_ptoim1r5]
      ,[Sarakeryhma6_amas]
      ,[Sarakeryhma6_koulk]
      ,[Sarakeryhma6_jarj]
      ,[Sarakeryhma6_tutkintolaji]
      ,[Sarakeryhma7_ID]
      ,[Sarakeryhma7_tyyppi]
      ,[Sarakeryhma7_opp]
      ,[Sarakeryhma7_opmala]
      ,[Sarakeryhma7_opmopa]
      ,[Sarakeryhma7_opmast]
      ,[Sarakeryhma7_opm95opa]
      ,[Sarakeryhma7_koulutussektori]
      ,[Sarakeryhma7_suorv]
      ,[Sarakeryhma7_suorlk]
      ,[Sarakeryhma7_kmaak]
      ,[Sarakeryhma7_olotamm]
      ,[Sarakeryhma7_olosyys]
      ,[Sarakeryhma7_ptoim1r5]
      ,[Sarakeryhma7_amas]
      ,[Sarakeryhma7_koulk]
      ,[Sarakeryhma7_jarj]
      ,[Sarakeryhma7_tutkintolaji]
      ,[Sarakeryhma8_ID]
      ,[Sarakeryhma8_tyyppi]
      ,[Sarakeryhma8_opp]
      ,[Sarakeryhma8_opmala]
      ,[Sarakeryhma8_opmopa]
      ,[Sarakeryhma8_opmast]
      ,[Sarakeryhma8_opm95opa]
      ,[Sarakeryhma8_koulutussektori]
      ,[Sarakeryhma8_suorv]
      ,[Sarakeryhma8_suorlk]
      ,[Sarakeryhma8_kmaak]
      ,[Sarakeryhma8_olotamm]
      ,[Sarakeryhma8_olosyys]
      ,[Sarakeryhma8_ptoim1r5]
      ,[Sarakeryhma8_amas]
      ,[Sarakeryhma8_koulk]
      ,[Sarakeryhma8_jarj]
      ,[Sarakeryhma8_tutkintolaji]
      ,[Sarakeryhma9_ID]
      ,[Sarakeryhma9_tyyppi]
      ,[Sarakeryhma9_opp]
      ,[Sarakeryhma9_opmala]
      ,[Sarakeryhma9_opmopa]
      ,[Sarakeryhma9_opmast]
      ,[Sarakeryhma9_opm95opa]
      ,[Sarakeryhma9_koulutussektori]
      ,[Sarakeryhma9_suorv]
      ,[Sarakeryhma9_suorlk]
      ,[Sarakeryhma9_kmaak]
      ,[Sarakeryhma9_olotamm]
      ,[Sarakeryhma9_olosyys]
      ,[Sarakeryhma9_ptoim1r5]
      ,[Sarakeryhma9_amas]
      ,[Sarakeryhma9_koulk]
      ,[Sarakeryhma9_jarj]
      ,[Sarakeryhma9_tutkintolaji]
      ,[Sarakeryhma10_ID]
      ,[Sarakeryhma10_tyyppi]
      ,[Sarakeryhma10_opp]
      ,[Sarakeryhma10_opmala]
      ,[Sarakeryhma10_opmopa]
      ,[Sarakeryhma10_opmast]
      ,[Sarakeryhma10_opm95opa]
      ,[Sarakeryhma10_koulutussektori]
      ,[Sarakeryhma10_suorv]
      ,[Sarakeryhma10_suorlk]
      ,[Sarakeryhma10_kmaak]
      ,[Sarakeryhma10_olotamm]
      ,[Sarakeryhma10_olosyys]
      ,[Sarakeryhma10_ptoim1r5]
      ,[Sarakeryhma10_amas]
      ,[Sarakeryhma10_koulk]
      ,[Sarakeryhma10_jarj]
      ,[Sarakeryhma10_tutkintolaji]
      ,[Sarakeryhma11_ID]
      ,[Sarakeryhma11_tyyppi]
      ,[Sarakeryhma11_opp]
      ,[Sarakeryhma11_opmala]
      ,[Sarakeryhma11_opmopa]
      ,[Sarakeryhma11_opmast]
      ,[Sarakeryhma11_opm95opa]
      ,[Sarakeryhma11_koulutussektori]
      ,[Sarakeryhma11_suorv]
      ,[Sarakeryhma11_suorlk]
      ,[Sarakeryhma11_kmaak]
      ,[Sarakeryhma11_olotamm]
      ,[Sarakeryhma11_olosyys]
      ,[Sarakeryhma11_ptoim1r5]
      ,[Sarakeryhma11_amas]
      ,[Sarakeryhma11_koulk]
      ,[Sarakeryhma11_jarj]
      ,[Sarakeryhma11_tutkintolaji]
      ,[Sarakeryhma12_ID]
      ,[Sarakeryhma12_tyyppi]
      ,[Sarakeryhma12_opp]
      ,[Sarakeryhma12_opmala]
      ,[Sarakeryhma12_opmopa]
      ,[Sarakeryhma12_opmast]
      ,[Sarakeryhma12_opm95opa]
      ,[Sarakeryhma12_koulutussektori]
      ,[Sarakeryhma12_suorv]
      ,[Sarakeryhma12_suorlk]
      ,[Sarakeryhma12_kmaak]
      ,[Sarakeryhma12_olotamm]
      ,[Sarakeryhma12_olosyys]
      ,[Sarakeryhma12_ptoim1r5]
      ,[Sarakeryhma12_amas]
      ,[Sarakeryhma12_koulk]
      ,[Sarakeryhma12_jarj]
      ,[Sarakeryhma12_tutkintolaji]
      ,[Sarakeryhma13_ID]
      ,[Sarakeryhma13_tyyppi]
      ,[Sarakeryhma13_opp]
      ,[Sarakeryhma13_opmala]
      ,[Sarakeryhma13_opmopa]
      ,[Sarakeryhma13_opmast]
      ,[Sarakeryhma13_opm95opa]
      ,[Sarakeryhma13_koulutussektori]
      ,[Sarakeryhma13_suorv]
      ,[Sarakeryhma13_suorlk]
      ,[Sarakeryhma13_kmaak]
      ,[Sarakeryhma13_olotamm]
      ,[Sarakeryhma13_olosyys]
      ,[Sarakeryhma13_ptoim1r5]
      ,[Sarakeryhma13_amas]
      ,[Sarakeryhma13_koulk]
      ,[Sarakeryhma13_jarj]
      ,[Sarakeryhma13_tutkintolaji]
      ,[Sarakeryhma14_ID]
      ,[Sarakeryhma14_tyyppi]
      ,[Sarakeryhma14_opp]
      ,[Sarakeryhma14_opmala]
      ,[Sarakeryhma14_opmopa]
      ,[Sarakeryhma14_opmast]
      ,[Sarakeryhma14_opm95opa]
      ,[Sarakeryhma14_koulutussektori]
      ,[Sarakeryhma14_suorv]
      ,[Sarakeryhma14_suorlk]
      ,[Sarakeryhma14_kmaak]
      ,[Sarakeryhma14_olotamm]
      ,[Sarakeryhma14_olosyys]
      ,[Sarakeryhma14_ptoim1r5]
      ,[Sarakeryhma14_amas]
      ,[Sarakeryhma14_koulk]
      ,[Sarakeryhma14_jarj]
      ,[Sarakeryhma14_tutkintolaji]
      ,[Sarakeryhma15_ID]
      ,[Sarakeryhma15_tyyppi]
      ,[Sarakeryhma15_opp]
      ,[Sarakeryhma15_opmala]
      ,[Sarakeryhma15_opmopa]
      ,[Sarakeryhma15_opmast]
      ,[Sarakeryhma15_opm95opa]
      ,[Sarakeryhma15_koulutussektori]
      ,[Sarakeryhma15_suorv]
      ,[Sarakeryhma15_suorlk]
      ,[Sarakeryhma15_kmaak]
      ,[Sarakeryhma15_olotamm]
      ,[Sarakeryhma15_olosyys]
      ,[Sarakeryhma15_ptoim1r5]
      ,[Sarakeryhma15_amas]
      ,[Sarakeryhma15_koulk]
      ,[Sarakeryhma15_jarj]
      ,[Sarakeryhma15_tutkintolaji]
      ,[Sarakeryhma16_ID]
      ,[Sarakeryhma16_tyyppi]
      ,[Sarakeryhma16_opp]
      ,[Sarakeryhma16_opmala]
      ,[Sarakeryhma16_opmopa]
      ,[Sarakeryhma16_opmast]
      ,[Sarakeryhma16_opm95opa]
      ,[Sarakeryhma16_koulutussektori]
      ,[Sarakeryhma16_suorv]
      ,[Sarakeryhma16_suorlk]
      ,[Sarakeryhma16_kmaak]
      ,[Sarakeryhma16_olotamm]
      ,[Sarakeryhma16_olosyys]
      ,[Sarakeryhma16_ptoim1r5]
      ,[Sarakeryhma16_amas]
      ,[Sarakeryhma16_koulk]
      ,[Sarakeryhma16_jarj]
      ,[Sarakeryhma16_tutkintolaji]
      ,[Sarakeryhma17_ID]
      ,[Sarakeryhma17_tyyppi]
      ,[Sarakeryhma17_opp]
      ,[Sarakeryhma17_opmala]
      ,[Sarakeryhma17_opmopa]
      ,[Sarakeryhma17_opmast]
      ,[Sarakeryhma17_opm95opa]
      ,[Sarakeryhma17_koulutussektori]
      ,[Sarakeryhma17_suorv]
      ,[Sarakeryhma17_suorlk]
      ,[Sarakeryhma17_kmaak]
      ,[Sarakeryhma17_olotamm]
      ,[Sarakeryhma17_olosyys]
      ,[Sarakeryhma17_ptoim1r5]
      ,[Sarakeryhma17_amas]
      ,[Sarakeryhma17_koulk]
      ,[Sarakeryhma17_jarj]
      ,[Sarakeryhma17_tutkintolaji]
      ,[Sarakeryhma18_ID]
      ,[Sarakeryhma18_tyyppi]
      ,[Sarakeryhma18_opp]
      ,[Sarakeryhma18_opmala]
      ,[Sarakeryhma18_opmopa]
      ,[Sarakeryhma18_opmast]
      ,[Sarakeryhma18_opm95opa]
      ,[Sarakeryhma18_koulutussektori]
      ,[Sarakeryhma18_suorv]
      ,[Sarakeryhma18_suorlk]
      ,[Sarakeryhma18_kmaak]
      ,[Sarakeryhma18_olotamm]
      ,[Sarakeryhma18_olosyys]
      ,[Sarakeryhma18_ptoim1r5]
      ,[Sarakeryhma18_amas]
      ,[Sarakeryhma18_koulk]
      ,[Sarakeryhma18_jarj]
      ,[Sarakeryhma18_tutkintolaji]
      ,[Sarakeryhma19_ID]
      ,[Sarakeryhma19_tyyppi]
      ,[Sarakeryhma19_opp]
      ,[Sarakeryhma19_opmala]
      ,[Sarakeryhma19_opmopa]
      ,[Sarakeryhma19_opmast]
      ,[Sarakeryhma19_opm95opa]
      ,[Sarakeryhma19_koulutussektori]
      ,[Sarakeryhma19_suorv]
      ,[Sarakeryhma19_suorlk]
      ,[Sarakeryhma19_kmaak]
      ,[Sarakeryhma19_olotamm]
      ,[Sarakeryhma19_olosyys]
      ,[Sarakeryhma19_ptoim1r5]
      ,[Sarakeryhma19_amas]
      ,[Sarakeryhma19_koulk]
      ,[Sarakeryhma19_jarj]
      ,[Sarakeryhma19_tutkintolaji]
      ,[Sarakeryhma20_ID]
      ,[Sarakeryhma20_tyyppi]
      ,[Sarakeryhma20_opp]
      ,[Sarakeryhma20_opmala]
      ,[Sarakeryhma20_opmopa]
      ,[Sarakeryhma20_opmast]
      ,[Sarakeryhma20_opm95opa]
      ,[Sarakeryhma20_koulutussektori]
      ,[Sarakeryhma20_suorv]
      ,[Sarakeryhma20_suorlk]
      ,[Sarakeryhma20_kmaak]
      ,[Sarakeryhma20_olotamm]
      ,[Sarakeryhma20_olosyys]
      ,[Sarakeryhma20_ptoim1r5]
      ,[Sarakeryhma20_amas]
      ,[Sarakeryhma20_koulk]
      ,[Sarakeryhma20_jarj]
      ,[Sarakeryhma20_tutkintolaji]
      ,[Sarakeryhma21_ID]
      ,[Sarakeryhma21_tyyppi]
      ,[Sarakeryhma21_opp]
      ,[Sarakeryhma21_opmala]
      ,[Sarakeryhma21_opmopa]
      ,[Sarakeryhma21_opmast]
      ,[Sarakeryhma21_opm95opa]
      ,[Sarakeryhma21_koulutussektori]
      ,[Sarakeryhma21_suorv]
      ,[Sarakeryhma21_suorlk]
      ,[Sarakeryhma21_kmaak]
      ,[Sarakeryhma21_olotamm]
      ,[Sarakeryhma21_olosyys]
      ,[Sarakeryhma21_ptoim1r5]
      ,[Sarakeryhma21_amas]
      ,[Sarakeryhma21_koulk]
      ,[Sarakeryhma21_jarj]
      ,[Sarakeryhma21_tutkintolaji]
      ,[Sarakeryhma22_ID]
      ,[Sarakeryhma22_tyyppi]
      ,[Sarakeryhma22_opp]
      ,[Sarakeryhma22_opmala]
      ,[Sarakeryhma22_opmopa]
      ,[Sarakeryhma22_opmast]
      ,[Sarakeryhma22_opm95opa]
      ,[Sarakeryhma22_koulutussektori]
      ,[Sarakeryhma22_suorv]
      ,[Sarakeryhma22_suorlk]
      ,[Sarakeryhma22_kmaak]
      ,[Sarakeryhma22_olotamm]
      ,[Sarakeryhma22_olosyys]
      ,[Sarakeryhma22_ptoim1r5]
      ,[Sarakeryhma22_amas]
      ,[Sarakeryhma22_koulk]
      ,[Sarakeryhma22_jarj]
      ,[Sarakeryhma22_tutkintolaji]
      ,[Sarakeryhma23_ID]
      ,[Sarakeryhma23_tyyppi]
      ,[Sarakeryhma23_opp]
      ,[Sarakeryhma23_opmala]
      ,[Sarakeryhma23_opmopa]
      ,[Sarakeryhma23_opmast]
      ,[Sarakeryhma23_opm95opa]
      ,[Sarakeryhma23_koulutussektori]
      ,[Sarakeryhma23_suorv]
      ,[Sarakeryhma23_suorlk]
      ,[Sarakeryhma23_kmaak]
      ,[Sarakeryhma23_olotamm]
      ,[Sarakeryhma23_olosyys]
      ,[Sarakeryhma23_ptoim1r5]
      ,[Sarakeryhma23_amas]
      ,[Sarakeryhma23_koulk]
      ,[Sarakeryhma23_jarj]
      ,[Sarakeryhma23_tutkintolaji]
      ,[Sarakeryhma24_ID]
      ,[Sarakeryhma24_tyyppi]
      ,[Sarakeryhma24_opp]
      ,[Sarakeryhma24_opmala]
      ,[Sarakeryhma24_opmopa]
      ,[Sarakeryhma24_opmast]
      ,[Sarakeryhma24_opm95opa]
      ,[Sarakeryhma24_koulutussektori]
      ,[Sarakeryhma24_suorv]
      ,[Sarakeryhma24_suorlk]
      ,[Sarakeryhma24_kmaak]
      ,[Sarakeryhma24_olotamm]
      ,[Sarakeryhma24_olosyys]
      ,[Sarakeryhma24_ptoim1r5]
      ,[Sarakeryhma24_amas]
      ,[Sarakeryhma24_koulk]
      ,[Sarakeryhma24_jarj]
      ,[Sarakeryhma24_tutkintolaji]
      ,[Sarakeryhma25_ID]
      ,[Sarakeryhma25_tyyppi]
      ,[Sarakeryhma25_opp]
      ,[Sarakeryhma25_opmala]
      ,[Sarakeryhma25_opmopa]
      ,[Sarakeryhma25_opmast]
      ,[Sarakeryhma25_opm95opa]
      ,[Sarakeryhma25_koulutussektori]
      ,[Sarakeryhma25_suorv]
      ,[Sarakeryhma25_suorlk]
      ,[Sarakeryhma25_kmaak]
      ,[Sarakeryhma25_olotamm]
      ,[Sarakeryhma25_olosyys]
      ,[Sarakeryhma25_ptoim1r5]
      ,[Sarakeryhma25_amas]
      ,[Sarakeryhma25_koulk]
      ,[Sarakeryhma25_jarj]
      ,[Sarakeryhma25_tutkintolaji]
      ,[Sarakeryhma26_ID]
      ,[Sarakeryhma26_tyyppi]
      ,[Sarakeryhma26_opp]
      ,[Sarakeryhma26_opmala]
      ,[Sarakeryhma26_opmopa]
      ,[Sarakeryhma26_opmast]
      ,[Sarakeryhma26_opm95opa]
      ,[Sarakeryhma26_koulutussektori]
      ,[Sarakeryhma26_suorv]
      ,[Sarakeryhma26_suorlk]
      ,[Sarakeryhma26_kmaak]
      ,[Sarakeryhma26_olotamm]
      ,[Sarakeryhma26_olosyys]
      ,[Sarakeryhma26_ptoim1r5]
      ,[Sarakeryhma26_amas]
      ,[Sarakeryhma26_koulk]
      ,[Sarakeryhma26_jarj]
      ,[Sarakeryhma26_tutkintolaji]
      ,[Sarakeryhma27_ID]
      ,[Sarakeryhma27_tyyppi]
      ,[Sarakeryhma27_opp]
      ,[Sarakeryhma27_opmala]
      ,[Sarakeryhma27_opmopa]
      ,[Sarakeryhma27_opmast]
      ,[Sarakeryhma27_opm95opa]
      ,[Sarakeryhma27_koulutussektori]
      ,[Sarakeryhma27_suorv]
      ,[Sarakeryhma27_suorlk]
      ,[Sarakeryhma27_kmaak]
      ,[Sarakeryhma27_olotamm]
      ,[Sarakeryhma27_olosyys]
      ,[Sarakeryhma27_ptoim1r5]
      ,[Sarakeryhma27_amas]
      ,[Sarakeryhma27_koulk]
      ,[Sarakeryhma27_jarj]
      ,[Sarakeryhma27_tutkintolaji]
      ,[Sarakeryhma28_ID]
      ,[Sarakeryhma28_tyyppi]
      ,[Sarakeryhma28_opp]
      ,[Sarakeryhma28_opmala]
      ,[Sarakeryhma28_opmopa]
      ,[Sarakeryhma28_opmast]
      ,[Sarakeryhma28_opm95opa]
      ,[Sarakeryhma28_koulutussektori]
      ,[Sarakeryhma28_suorv]
      ,[Sarakeryhma28_suorlk]
      ,[Sarakeryhma28_kmaak]
      ,[Sarakeryhma28_olotamm]
      ,[Sarakeryhma28_olosyys]
      ,[Sarakeryhma28_ptoim1r5]
      ,[Sarakeryhma28_amas]
      ,[Sarakeryhma28_koulk]
      ,[Sarakeryhma28_jarj]
      ,[Sarakeryhma28_tutkintolaji]
      ,[Sarakeryhma29_ID]
      ,[Sarakeryhma29_tyyppi]
      ,[Sarakeryhma29_opp]
      ,[Sarakeryhma29_opmala]
      ,[Sarakeryhma29_opmopa]
      ,[Sarakeryhma29_opmast]
      ,[Sarakeryhma29_opm95opa]
      ,[Sarakeryhma29_koulutussektori]
      ,[Sarakeryhma29_suorv]
      ,[Sarakeryhma29_suorlk]
      ,[Sarakeryhma29_kmaak]
      ,[Sarakeryhma29_olotamm]
      ,[Sarakeryhma29_olosyys]
      ,[Sarakeryhma29_ptoim1r5]
      ,[Sarakeryhma29_amas]
      ,[Sarakeryhma29_koulk]
      ,[Sarakeryhma29_jarj]
      ,[Sarakeryhma29_tutkintolaji]
      ,[Sarakeryhma30_ID]
      ,[Sarakeryhma30_tyyppi]
      ,[Sarakeryhma30_opp]
      ,[Sarakeryhma30_opmala]
      ,[Sarakeryhma30_opmopa]
      ,[Sarakeryhma30_opmast]
      ,[Sarakeryhma30_opm95opa]
      ,[Sarakeryhma30_koulutussektori]
      ,[Sarakeryhma30_suorv]
      ,[Sarakeryhma30_suorlk]
      ,[Sarakeryhma30_kmaak]
      ,[Sarakeryhma30_olotamm]
      ,[Sarakeryhma30_olosyys]
      ,[Sarakeryhma30_ptoim1r5]
      ,[Sarakeryhma30_amas]
      ,[Sarakeryhma30_koulk]
      ,[Sarakeryhma30_jarj]
      ,[Sarakeryhma30_tutkintolaji]
      ,[Sarakeryhma31_ID]
      ,[Sarakeryhma31_tyyppi]
      ,[Sarakeryhma31_opp]
      ,[Sarakeryhma31_opmala]
      ,[Sarakeryhma31_opmopa]
      ,[Sarakeryhma31_opmast]
      ,[Sarakeryhma31_opm95opa]
      ,[Sarakeryhma31_koulutussektori]
      ,[Sarakeryhma31_suorv]
      ,[Sarakeryhma31_suorlk]
      ,[Sarakeryhma31_kmaak]
      ,[Sarakeryhma31_olotamm]
      ,[Sarakeryhma31_olosyys]
      ,[Sarakeryhma31_ptoim1r5]
      ,[Sarakeryhma31_amas]
      ,[Sarakeryhma31_koulk]
      ,[Sarakeryhma31_jarj]
      ,[Sarakeryhma31_tutkintolaji]
      ,[Sarakeryhma32_ID]
      ,[Sarakeryhma32_tyyppi]
      ,[Sarakeryhma32_opp]
      ,[Sarakeryhma32_opmala]
      ,[Sarakeryhma32_opmopa]
      ,[Sarakeryhma32_opmast]
      ,[Sarakeryhma32_opm95opa]
      ,[Sarakeryhma32_koulutussektori]
      ,[Sarakeryhma32_suorv]
      ,[Sarakeryhma32_suorlk]
      ,[Sarakeryhma32_kmaak]
      ,[Sarakeryhma32_olotamm]
      ,[Sarakeryhma32_olosyys]
      ,[Sarakeryhma32_ptoim1r5]
      ,[Sarakeryhma32_amas]
      ,[Sarakeryhma32_koulk]
      ,[Sarakeryhma32_jarj]
      ,[Sarakeryhma32_tutkintolaji]
      ,[Sarakeryhma33_ID]
      ,[Sarakeryhma33_tyyppi]
      ,[Sarakeryhma33_opp]
      ,[Sarakeryhma33_opmala]
      ,[Sarakeryhma33_opmopa]
      ,[Sarakeryhma33_opmast]
      ,[Sarakeryhma33_opm95opa]
      ,[Sarakeryhma33_koulutussektori]
      ,[Sarakeryhma33_suorv]
      ,[Sarakeryhma33_suorlk]
      ,[Sarakeryhma33_kmaak]
      ,[Sarakeryhma33_olotamm]
      ,[Sarakeryhma33_olosyys]
      ,[Sarakeryhma33_ptoim1r5]
      ,[Sarakeryhma33_amas]
      ,[Sarakeryhma33_koulk]
      ,[Sarakeryhma33_jarj]
      ,[Sarakeryhma33_tutkintolaji]
      ,[Sarakeryhma34_ID]
      ,[Sarakeryhma34_tyyppi]
      ,[Sarakeryhma34_opp]
      ,[Sarakeryhma34_opmala]
      ,[Sarakeryhma34_opmopa]
      ,[Sarakeryhma34_opmast]
      ,[Sarakeryhma34_opm95opa]
      ,[Sarakeryhma34_koulutussektori]
      ,[Sarakeryhma34_suorv]
      ,[Sarakeryhma34_suorlk]
      ,[Sarakeryhma34_kmaak]
      ,[Sarakeryhma34_olotamm]
      ,[Sarakeryhma34_olosyys]
      ,[Sarakeryhma34_ptoim1r5]
      ,[Sarakeryhma34_amas]
      ,[Sarakeryhma34_koulk]
      ,[Sarakeryhma34_jarj]
      ,[Sarakeryhma34_tutkintolaji]
      ,[Sarakeryhma35_ID]
      ,[Sarakeryhma35_tyyppi]
      ,[Sarakeryhma35_opp]
      ,[Sarakeryhma35_opmala]
      ,[Sarakeryhma35_opmopa]
      ,[Sarakeryhma35_opmast]
      ,[Sarakeryhma35_opm95opa]
      ,[Sarakeryhma35_koulutussektori]
      ,[Sarakeryhma35_suorv]
      ,[Sarakeryhma35_suorlk]
      ,[Sarakeryhma35_kmaak]
      ,[Sarakeryhma35_olotamm]
      ,[Sarakeryhma35_olosyys]
      ,[Sarakeryhma35_ptoim1r5]
      ,[Sarakeryhma35_amas]
      ,[Sarakeryhma35_koulk]
      ,[Sarakeryhma35_jarj]
      ,[Sarakeryhma35_tutkintolaji]
      ,[Sarakeryhma36_ID]
      ,[Sarakeryhma36_tyyppi]
      ,[Sarakeryhma36_opp]
      ,[Sarakeryhma36_opmala]
      ,[Sarakeryhma36_opmopa]
      ,[Sarakeryhma36_opmast]
      ,[Sarakeryhma36_opm95opa]
      ,[Sarakeryhma36_koulutussektori]
      ,[Sarakeryhma36_suorv]
      ,[Sarakeryhma36_suorlk]
      ,[Sarakeryhma36_kmaak]
      ,[Sarakeryhma36_olotamm]
      ,[Sarakeryhma36_olosyys]
      ,[Sarakeryhma36_ptoim1r5]
      ,[Sarakeryhma36_amas]
      ,[Sarakeryhma36_koulk]
      ,[Sarakeryhma36_jarj]
      ,[Sarakeryhma36_tutkintolaji]
      ,[Sarakeryhma37_ID]
      ,[Sarakeryhma37_tyyppi]
      ,[Sarakeryhma37_opp]
      ,[Sarakeryhma37_opmala]
      ,[Sarakeryhma37_opmopa]
      ,[Sarakeryhma37_opmast]
      ,[Sarakeryhma37_opm95opa]
      ,[Sarakeryhma37_koulutussektori]
      ,[Sarakeryhma37_suorv]
      ,[Sarakeryhma37_suorlk]
      ,[Sarakeryhma37_kmaak]
      ,[Sarakeryhma37_olotamm]
      ,[Sarakeryhma37_olosyys]
      ,[Sarakeryhma37_ptoim1r5]
      ,[Sarakeryhma37_amas]
      ,[Sarakeryhma37_koulk]
      ,[Sarakeryhma37_jarj]
      ,[Sarakeryhma37_tutkintolaji]
      ,[Sarakeryhma38_ID]
      ,[Sarakeryhma38_tyyppi]
      ,[Sarakeryhma38_opp]
      ,[Sarakeryhma38_opmala]
      ,[Sarakeryhma38_opmopa]
      ,[Sarakeryhma38_opmast]
      ,[Sarakeryhma38_opm95opa]
      ,[Sarakeryhma38_koulutussektori]
      ,[Sarakeryhma38_suorv]
      ,[Sarakeryhma38_suorlk]
      ,[Sarakeryhma38_kmaak]
      ,[Sarakeryhma38_olotamm]
      ,[Sarakeryhma38_olosyys]
      ,[Sarakeryhma38_ptoim1r5]
      ,[Sarakeryhma38_amas]
      ,[Sarakeryhma38_koulk]
      ,[Sarakeryhma38_jarj]
      ,[Sarakeryhma38_tutkintolaji]
      ,[Sarakeryhma39_ID]
      ,[Sarakeryhma39_tyyppi]
      ,[Sarakeryhma39_opp]
      ,[Sarakeryhma39_opmala]
      ,[Sarakeryhma39_opmopa]
      ,[Sarakeryhma39_opmast]
      ,[Sarakeryhma39_opm95opa]
      ,[Sarakeryhma39_koulutussektori]
      ,[Sarakeryhma39_suorv]
      ,[Sarakeryhma39_suorlk]
      ,[Sarakeryhma39_kmaak]
      ,[Sarakeryhma39_olotamm]
      ,[Sarakeryhma39_olosyys]
      ,[Sarakeryhma39_ptoim1r5]
      ,[Sarakeryhma39_amas]
      ,[Sarakeryhma39_koulk]
      ,[Sarakeryhma39_jarj]
      ,[Sarakeryhma39_tutkintolaji]
      ,[Sarakeryhma40_ID]
      ,[Sarakeryhma40_tyyppi]
      ,[Sarakeryhma40_opp]
      ,[Sarakeryhma40_opmala]
      ,[Sarakeryhma40_opmopa]
      ,[Sarakeryhma40_opmast]
      ,[Sarakeryhma40_opm95opa]
      ,[Sarakeryhma40_koulutussektori]
      ,[Sarakeryhma40_suorv]
      ,[Sarakeryhma40_suorlk]
      ,[Sarakeryhma40_kmaak]
      ,[Sarakeryhma40_olotamm]
      ,[Sarakeryhma40_olosyys]
      ,[Sarakeryhma40_ptoim1r5]
      ,[Sarakeryhma40_amas]
      ,[Sarakeryhma40_koulk]
      ,[Sarakeryhma40_jarj]
      ,[Sarakeryhma40_tutkintolaji]
      ,[Sarakeryhma41_ID]
      ,[Sarakeryhma41_tyyppi]
      ,[Sarakeryhma41_opp]
      ,[Sarakeryhma41_opmala]
      ,[Sarakeryhma41_opmopa]
      ,[Sarakeryhma41_opmast]
      ,[Sarakeryhma41_opm95opa]
      ,[Sarakeryhma41_koulutussektori]
      ,[Sarakeryhma41_suorv]
      ,[Sarakeryhma41_suorlk]
      ,[Sarakeryhma41_kmaak]
      ,[Sarakeryhma41_olotamm]
      ,[Sarakeryhma41_olosyys]
      ,[Sarakeryhma41_ptoim1r5]
      ,[Sarakeryhma41_amas]
      ,[Sarakeryhma41_koulk]
      ,[Sarakeryhma41_jarj]
      ,[Sarakeryhma41_tutkintolaji]
      ,[Sarakeryhma42_ID]
      ,[Sarakeryhma42_tyyppi]
      ,[Sarakeryhma42_opp]
      ,[Sarakeryhma42_opmala]
      ,[Sarakeryhma42_opmopa]
      ,[Sarakeryhma42_opmast]
      ,[Sarakeryhma42_opm95opa]
      ,[Sarakeryhma42_koulutussektori]
      ,[Sarakeryhma42_suorv]
      ,[Sarakeryhma42_suorlk]
      ,[Sarakeryhma42_kmaak]
      ,[Sarakeryhma42_olotamm]
      ,[Sarakeryhma42_olosyys]
      ,[Sarakeryhma42_ptoim1r5]
      ,[Sarakeryhma42_amas]
      ,[Sarakeryhma42_koulk]
      ,[Sarakeryhma42_jarj]
      ,[Sarakeryhma42_tutkintolaji]
      ,[Sarakeryhma43_ID]
      ,[Sarakeryhma43_tyyppi]
      ,[Sarakeryhma43_opp]
      ,[Sarakeryhma43_opmala]
      ,[Sarakeryhma43_opmopa]
      ,[Sarakeryhma43_opmast]
      ,[Sarakeryhma43_opm95opa]
      ,[Sarakeryhma43_koulutussektori]
      ,[Sarakeryhma43_suorv]
      ,[Sarakeryhma43_suorlk]
      ,[Sarakeryhma43_kmaak]
      ,[Sarakeryhma43_olotamm]
      ,[Sarakeryhma43_olosyys]
      ,[Sarakeryhma43_ptoim1r5]
      ,[Sarakeryhma43_amas]
      ,[Sarakeryhma43_koulk]
      ,[Sarakeryhma43_jarj]
      ,[Sarakeryhma43_tutkintolaji]
      ,[Sarakeryhma44_ID]
      ,[Sarakeryhma44_tyyppi]
      ,[Sarakeryhma44_opp]
      ,[Sarakeryhma44_opmala]
      ,[Sarakeryhma44_opmopa]
      ,[Sarakeryhma44_opmast]
      ,[Sarakeryhma44_opm95opa]
      ,[Sarakeryhma44_koulutussektori]
      ,[Sarakeryhma44_suorv]
      ,[Sarakeryhma44_suorlk]
      ,[Sarakeryhma44_kmaak]
      ,[Sarakeryhma44_olotamm]
      ,[Sarakeryhma44_olosyys]
      ,[Sarakeryhma44_ptoim1r5]
      ,[Sarakeryhma44_amas]
      ,[Sarakeryhma44_koulk]
      ,[Sarakeryhma44_jarj]
      ,[Sarakeryhma44_tutkintolaji]
      ,[Sarakeryhma45_ID]
      ,[Sarakeryhma45_tyyppi]
      ,[Sarakeryhma45_opp]
      ,[Sarakeryhma45_opmala]
      ,[Sarakeryhma45_opmopa]
      ,[Sarakeryhma45_opmast]
      ,[Sarakeryhma45_opm95opa]
      ,[Sarakeryhma45_koulutussektori]
      ,[Sarakeryhma45_suorv]
      ,[Sarakeryhma45_suorlk]
      ,[Sarakeryhma45_kmaak]
      ,[Sarakeryhma45_olotamm]
      ,[Sarakeryhma45_olosyys]
      ,[Sarakeryhma45_ptoim1r5]
      ,[Sarakeryhma45_amas]
      ,[Sarakeryhma45_koulk]
      ,[Sarakeryhma45_jarj]
      ,[Sarakeryhma45_tutkintolaji]
      ,[Sarakeryhma46_ID]
      ,[Sarakeryhma46_tyyppi]
      ,[Sarakeryhma46_opp]
      ,[Sarakeryhma46_opmala]
      ,[Sarakeryhma46_opmopa]
      ,[Sarakeryhma46_opmast]
      ,[Sarakeryhma46_opm95opa]
      ,[Sarakeryhma46_koulutussektori]
      ,[Sarakeryhma46_suorv]
      ,[Sarakeryhma46_suorlk]
      ,[Sarakeryhma46_kmaak]
      ,[Sarakeryhma46_olotamm]
      ,[Sarakeryhma46_olosyys]
      ,[Sarakeryhma46_ptoim1r5]
      ,[Sarakeryhma46_amas]
      ,[Sarakeryhma46_koulk]
      ,[Sarakeryhma46_jarj]
      ,[Sarakeryhma46_tutkintolaji]
      ,[Sarakeryhma47_ID]
      ,[Sarakeryhma47_tyyppi]
      ,[Sarakeryhma47_opp]
      ,[Sarakeryhma47_opmala]
      ,[Sarakeryhma47_opmopa]
      ,[Sarakeryhma47_opmast]
      ,[Sarakeryhma47_opm95opa]
      ,[Sarakeryhma47_koulutussektori]
      ,[Sarakeryhma47_suorv]
      ,[Sarakeryhma47_suorlk]
      ,[Sarakeryhma47_kmaak]
      ,[Sarakeryhma47_olotamm]
      ,[Sarakeryhma47_olosyys]
      ,[Sarakeryhma47_ptoim1r5]
      ,[Sarakeryhma47_amas]
      ,[Sarakeryhma47_koulk]
      ,[Sarakeryhma47_jarj]
      ,[Sarakeryhma47_tutkintolaji]
      ,[Sarakeryhma48_ID]
      ,[Sarakeryhma48_tyyppi]
      ,[Sarakeryhma48_opp]
      ,[Sarakeryhma48_opmala]
      ,[Sarakeryhma48_opmopa]
      ,[Sarakeryhma48_opmast]
      ,[Sarakeryhma48_opm95opa]
      ,[Sarakeryhma48_koulutussektori]
      ,[Sarakeryhma48_suorv]
      ,[Sarakeryhma48_suorlk]
      ,[Sarakeryhma48_kmaak]
      ,[Sarakeryhma48_olotamm]
      ,[Sarakeryhma48_olosyys]
      ,[Sarakeryhma48_ptoim1r5]
      ,[Sarakeryhma48_amas]
      ,[Sarakeryhma48_koulk]
      ,[Sarakeryhma48_jarj]
      ,[Sarakeryhma48_tutkintolaji]
      ,[Sarakeryhma49_ID]
      ,[Sarakeryhma49_tyyppi]
      ,[Sarakeryhma49_opp]
      ,[Sarakeryhma49_opmala]
      ,[Sarakeryhma49_opmopa]
      ,[Sarakeryhma49_opmast]
      ,[Sarakeryhma49_opm95opa]
      ,[Sarakeryhma49_koulutussektori]
      ,[Sarakeryhma49_suorv]
      ,[Sarakeryhma49_suorlk]
      ,[Sarakeryhma49_kmaak]
      ,[Sarakeryhma49_olotamm]
      ,[Sarakeryhma49_olosyys]
      ,[Sarakeryhma49_ptoim1r5]
      ,[Sarakeryhma49_amas]
      ,[Sarakeryhma49_koulk]
      ,[Sarakeryhma49_jarj]
      ,[Sarakeryhma49_tutkintolaji]
      ,[Sarakeryhma50_ID]
      ,[Sarakeryhma50_tyyppi]
      ,[Sarakeryhma50_opp]
      ,[Sarakeryhma50_opmala]
      ,[Sarakeryhma50_opmopa]
      ,[Sarakeryhma50_opmast]
      ,[Sarakeryhma50_opm95opa]
      ,[Sarakeryhma50_koulutussektori]
      ,[Sarakeryhma50_suorv]
      ,[Sarakeryhma50_suorlk]
      ,[Sarakeryhma50_kmaak]
      ,[Sarakeryhma50_olotamm]
      ,[Sarakeryhma50_olosyys]
      ,[Sarakeryhma50_ptoim1r5]
      ,[Sarakeryhma50_amas]
      ,[Sarakeryhma50_koulk]
      ,[Sarakeryhma50_jarj]
      ,[Sarakeryhma50_tutkintolaji]
      ,[Sarakeryhma51_ID]
      ,[Sarakeryhma51_tyyppi]
      ,[Sarakeryhma51_opp]
      ,[Sarakeryhma51_opmala]
      ,[Sarakeryhma51_opmopa]
      ,[Sarakeryhma51_opmast]
      ,[Sarakeryhma51_opm95opa]
      ,[Sarakeryhma51_koulutussektori]
      ,[Sarakeryhma51_suorv]
      ,[Sarakeryhma51_suorlk]
      ,[Sarakeryhma51_kmaak]
      ,[Sarakeryhma51_olotamm]
      ,[Sarakeryhma51_olosyys]
      ,[Sarakeryhma51_ptoim1r5]
      ,[Sarakeryhma51_amas]
      ,[Sarakeryhma51_koulk]
      ,[Sarakeryhma51_jarj]
      ,[Sarakeryhma51_tutkintolaji]
      ,[Sarakeryhma52_ID]
      ,[Sarakeryhma52_tyyppi]
      ,[Sarakeryhma52_opp]
      ,[Sarakeryhma52_opmala]
      ,[Sarakeryhma52_opmopa]
      ,[Sarakeryhma52_opmast]
      ,[Sarakeryhma52_opm95opa]
      ,[Sarakeryhma52_koulutussektori]
      ,[Sarakeryhma52_suorv]
      ,[Sarakeryhma52_suorlk]
      ,[Sarakeryhma52_kmaak]
      ,[Sarakeryhma52_olotamm]
      ,[Sarakeryhma52_olosyys]
      ,[Sarakeryhma52_ptoim1r5]
      ,[Sarakeryhma52_amas]
      ,[Sarakeryhma52_koulk]
      ,[Sarakeryhma52_jarj]
      ,[Sarakeryhma52_tutkintolaji]
      ,[Sarakeryhma53_ID]
      ,[Sarakeryhma53_tyyppi]
      ,[Sarakeryhma53_opp]
      ,[Sarakeryhma53_opmala]
      ,[Sarakeryhma53_opmopa]
      ,[Sarakeryhma53_opmast]
      ,[Sarakeryhma53_opm95opa]
      ,[Sarakeryhma53_koulutussektori]
      ,[Sarakeryhma53_suorv]
      ,[Sarakeryhma53_suorlk]
      ,[Sarakeryhma53_kmaak]
      ,[Sarakeryhma53_olotamm]
      ,[Sarakeryhma53_olosyys]
      ,[Sarakeryhma53_ptoim1r5]
      ,[Sarakeryhma53_amas]
      ,[Sarakeryhma53_koulk]
      ,[Sarakeryhma53_jarj]
      ,[Sarakeryhma53_tutkintolaji]
      ,[Sarakeryhma54_ID]
      ,[Sarakeryhma54_tyyppi]
      ,[Sarakeryhma54_opp]
      ,[Sarakeryhma54_opmala]
      ,[Sarakeryhma54_opmopa]
      ,[Sarakeryhma54_opmast]
      ,[Sarakeryhma54_opm95opa]
      ,[Sarakeryhma54_koulutussektori]
      ,[Sarakeryhma54_suorv]
      ,[Sarakeryhma54_suorlk]
      ,[Sarakeryhma54_kmaak]
      ,[Sarakeryhma54_olotamm]
      ,[Sarakeryhma54_olosyys]
      ,[Sarakeryhma54_ptoim1r5]
      ,[Sarakeryhma54_amas]
      ,[Sarakeryhma54_koulk]
      ,[Sarakeryhma54_jarj]
      ,[Sarakeryhma54_tutkintolaji]
      ,[Sarakeryhma55_ID]
      ,[Sarakeryhma55_tyyppi]
      ,[Sarakeryhma55_opp]
      ,[Sarakeryhma55_opmala]
      ,[Sarakeryhma55_opmopa]
      ,[Sarakeryhma55_opmast]
      ,[Sarakeryhma55_opm95opa]
      ,[Sarakeryhma55_koulutussektori]
      ,[Sarakeryhma55_suorv]
      ,[Sarakeryhma55_suorlk]
      ,[Sarakeryhma55_kmaak]
      ,[Sarakeryhma55_olotamm]
      ,[Sarakeryhma55_olosyys]
      ,[Sarakeryhma55_ptoim1r5]
      ,[Sarakeryhma55_amas]
      ,[Sarakeryhma55_koulk]
      ,[Sarakeryhma55_jarj]
      ,[Sarakeryhma55_tutkintolaji]

/*
SELECT [tilv]
      ,[lahde]
      ,[opp]
      ,[sp]
      ,[syntv]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[klaji]
      ,[ophal]
      ,[jarj]
      ,[kkun]
      ,[maak]
      ,[koulk]
      ,[opmala]
      ,[opmopa]
      ,[opmast]
      ,[opm95opa]
      ,[koulutussektori]
      ,[pohjkoulk]
      ,[alvv_kk]
      ,[allk_kk]
      ,[ololk]
      ,[rahlahde]
      ,[koulutuslaji2]
      ,[tutkintolaji] = Case when [koulutuslaji2] in ('21', '22') then 'lu'
							when [koulutuslaji2] in ('31', '32', '35', '36') then 'ampt'
							when [koulutuslaji2] in ('33', '34', '37', '38') then 'amlk'
							when [koulutuslaji2] in ('41', '42') then 'amk'
							when [koulutuslaji2] = '46' then 'ylamk'
							when [koulutuslaji2] = '51a' then 'alkk'
							when [koulutuslaji2] = '51b' then 'ylkk'
							when [koulutuslaji2] = '52' then 'tk' 
							else 'muu' end
      ,[tietolahde]
      ,[aineistorivinumero]
      ,[lkm_int]
      ,[Sarakeryhma1_ID]
      ,[Sarakeryhma1_tyyppi]
      ,[Sarakeryhma1_opp]
      ,[Sarakeryhma1_opmala]
      ,[Sarakeryhma1_opmopa]
      ,[Sarakeryhma1_opmast]
      ,[Sarakeryhma1_opm95opa]
      ,[Sarakeryhma1_koulutussektori]
      ,[Sarakeryhma1_suorv]
      ,[Sarakeryhma1_suorlk]
      ,[Sarakeryhma1_kmaak]
      ,[Sarakeryhma1_olotamm]
      ,[Sarakeryhma1_olosyys]
      ,[Sarakeryhma1_ptoim1r5]
      ,[Sarakeryhma1_amas]
      ,[Sarakeryhma1_koulk]
      ,[Sarakeryhma1_tutkintolaji]
      ,[Sarakeryhma2_ID]
      ,[Sarakeryhma2_tyyppi]
      ,[Sarakeryhma2_opp]
      ,[Sarakeryhma2_opmala]
      ,[Sarakeryhma2_opmopa]
      ,[Sarakeryhma2_opmast]
      ,[Sarakeryhma2_opm95opa]
      ,[Sarakeryhma2_koulutussektori]
      ,[Sarakeryhma2_suorv]
      ,[Sarakeryhma2_suorlk]
      ,[Sarakeryhma2_kmaak]
      ,[Sarakeryhma2_olotamm]
      ,[Sarakeryhma2_olosyys]
      ,[Sarakeryhma2_ptoim1r5]
      ,[Sarakeryhma2_amas]
      ,[Sarakeryhma2_koulk]
      ,[Sarakeryhma2_tutkintolaji]
      ,[Sarakeryhma3_ID]
      ,[Sarakeryhma3_tyyppi]
      ,[Sarakeryhma3_opp]
      ,[Sarakeryhma3_opmala]
      ,[Sarakeryhma3_opmopa]
      ,[Sarakeryhma3_opmast]
      ,[Sarakeryhma3_opm95opa]
      ,[Sarakeryhma3_koulutussektori]
      ,[Sarakeryhma3_suorv]
      ,[Sarakeryhma3_suorlk]
      ,[Sarakeryhma3_kmaak]
      ,[Sarakeryhma3_olotamm]
      ,[Sarakeryhma3_olosyys]
      ,[Sarakeryhma3_ptoim1r5]
      ,[Sarakeryhma3_amas]
      ,[Sarakeryhma3_koulk]
      ,[Sarakeryhma3_tutkintolaji]
      ,[Sarakeryhma4_ID]
      ,[Sarakeryhma4_tyyppi]
      ,[Sarakeryhma4_opp]
      ,[Sarakeryhma4_opmala]
      ,[Sarakeryhma4_opmopa]
      ,[Sarakeryhma4_opmast]
      ,[Sarakeryhma4_opm95opa]
      ,[Sarakeryhma4_koulutussektori]
      ,[Sarakeryhma4_suorv]
      ,[Sarakeryhma4_suorlk]
      ,[Sarakeryhma4_kmaak]
      ,[Sarakeryhma4_olotamm]
      ,[Sarakeryhma4_olosyys]
      ,[Sarakeryhma4_ptoim1r5]
      ,[Sarakeryhma4_amas]
      ,[Sarakeryhma4_koulk]
      ,[Sarakeryhma4_tutkintolaji]
      ,[Sarakeryhma5_ID]
      ,[Sarakeryhma5_tyyppi]
      ,[Sarakeryhma5_opp]
      ,[Sarakeryhma5_opmala]
      ,[Sarakeryhma5_opmopa]
      ,[Sarakeryhma5_opmast]
      ,[Sarakeryhma5_opm95opa]
      ,[Sarakeryhma5_koulutussektori]
      ,[Sarakeryhma5_suorv]
      ,[Sarakeryhma5_suorlk]
      ,[Sarakeryhma5_kmaak]
      ,[Sarakeryhma5_olotamm]
      ,[Sarakeryhma5_olosyys]
      ,[Sarakeryhma5_ptoim1r5]
      ,[Sarakeryhma5_amas]
      ,[Sarakeryhma5_koulk]
      ,[Sarakeryhma5_tutkintolaji]
      ,[Sarakeryhma6_ID]
      ,[Sarakeryhma6_tyyppi]
      ,[Sarakeryhma6_opp]
      ,[Sarakeryhma6_opmala]
      ,[Sarakeryhma6_opmopa]
      ,[Sarakeryhma6_opmast]
      ,[Sarakeryhma6_opm95opa]
      ,[Sarakeryhma6_koulutussektori]
      ,[Sarakeryhma6_suorv]
      ,[Sarakeryhma6_suorlk]
      ,[Sarakeryhma6_kmaak]
      ,[Sarakeryhma6_olotamm]
      ,[Sarakeryhma6_olosyys]
      ,[Sarakeryhma6_ptoim1r5]
      ,[Sarakeryhma6_amas]
      ,[Sarakeryhma6_koulk]
      ,[Sarakeryhma6_tutkintolaji]
      ,[Sarakeryhma7_ID]
      ,[Sarakeryhma7_tyyppi]
      ,[Sarakeryhma7_opp]
      ,[Sarakeryhma7_opmala]
      ,[Sarakeryhma7_opmopa]
      ,[Sarakeryhma7_opmast]
      ,[Sarakeryhma7_opm95opa]
      ,[Sarakeryhma7_koulutussektori]
      ,[Sarakeryhma7_suorv]
      ,[Sarakeryhma7_suorlk]
      ,[Sarakeryhma7_kmaak]
      ,[Sarakeryhma7_olotamm]
      ,[Sarakeryhma7_olosyys]
      ,[Sarakeryhma7_ptoim1r5]
      ,[Sarakeryhma7_amas]
      ,[Sarakeryhma7_koulk]
      ,[Sarakeryhma7_tutkintolaji]
      ,[Sarakeryhma8_ID]
      ,[Sarakeryhma8_tyyppi]
      ,[Sarakeryhma8_opp]
      ,[Sarakeryhma8_opmala]
      ,[Sarakeryhma8_opmopa]
      ,[Sarakeryhma8_opmast]
      ,[Sarakeryhma8_opm95opa]
      ,[Sarakeryhma8_koulutussektori]
      ,[Sarakeryhma8_suorv]
      ,[Sarakeryhma8_suorlk]
      ,[Sarakeryhma8_kmaak]
      ,[Sarakeryhma8_olotamm]
      ,[Sarakeryhma8_olosyys]
      ,[Sarakeryhma8_ptoim1r5]
      ,[Sarakeryhma8_amas]
      ,[Sarakeryhma8_koulk]
      ,[Sarakeryhma8_tutkintolaji]
      ,[Sarakeryhma9_ID]
      ,[Sarakeryhma9_tyyppi]
      ,[Sarakeryhma9_opp]
      ,[Sarakeryhma9_opmala]
      ,[Sarakeryhma9_opmopa]
      ,[Sarakeryhma9_opmast]
      ,[Sarakeryhma9_opm95opa]
      ,[Sarakeryhma9_koulutussektori]
      ,[Sarakeryhma9_suorv]
      ,[Sarakeryhma9_suorlk]
      ,[Sarakeryhma9_kmaak]
      ,[Sarakeryhma9_olotamm]
      ,[Sarakeryhma9_olosyys]
      ,[Sarakeryhma9_ptoim1r5]
      ,[Sarakeryhma9_amas]
      ,[Sarakeryhma9_koulk]
      ,[Sarakeryhma9_tutkintolaji]
      ,[Sarakeryhma10_ID]
      ,[Sarakeryhma10_tyyppi]
      ,[Sarakeryhma10_opp]
      ,[Sarakeryhma10_opmala]
      ,[Sarakeryhma10_opmopa]
      ,[Sarakeryhma10_opmast]
      ,[Sarakeryhma10_opm95opa]
      ,[Sarakeryhma10_koulutussektori]
      ,[Sarakeryhma10_suorv]
      ,[Sarakeryhma10_suorlk]
      ,[Sarakeryhma10_kmaak]
      ,[Sarakeryhma10_olotamm]
      ,[Sarakeryhma10_olosyys]
      ,[Sarakeryhma10_ptoim1r5]
      ,[Sarakeryhma10_amas]
      ,[Sarakeryhma10_koulk]
      ,[Sarakeryhma10_tutkintolaji]
      ,[Sarakeryhma11_ID]
      ,[Sarakeryhma11_tyyppi]
      ,[Sarakeryhma11_opp]
      ,[Sarakeryhma11_opmala]
      ,[Sarakeryhma11_opmopa]
      ,[Sarakeryhma11_opmast]
      ,[Sarakeryhma11_opm95opa]
      ,[Sarakeryhma11_koulutussektori]
      ,[Sarakeryhma11_suorv]
      ,[Sarakeryhma11_suorlk]
      ,[Sarakeryhma11_kmaak]
      ,[Sarakeryhma11_olotamm]
      ,[Sarakeryhma11_olosyys]
      ,[Sarakeryhma11_ptoim1r5]
      ,[Sarakeryhma11_amas]
      ,[Sarakeryhma11_koulk]
      ,[Sarakeryhma11_tutkintolaji]
      ,[Sarakeryhma12_ID]
      ,[Sarakeryhma12_tyyppi]
      ,[Sarakeryhma12_opp]
      ,[Sarakeryhma12_opmala]
      ,[Sarakeryhma12_opmopa]
      ,[Sarakeryhma12_opmast]
      ,[Sarakeryhma12_opm95opa]
      ,[Sarakeryhma12_koulutussektori]
      ,[Sarakeryhma12_suorv]
      ,[Sarakeryhma12_suorlk]
      ,[Sarakeryhma12_kmaak]
      ,[Sarakeryhma12_olotamm]
      ,[Sarakeryhma12_olosyys]
      ,[Sarakeryhma12_ptoim1r5]
      ,[Sarakeryhma12_amas]
      ,[Sarakeryhma12_koulk]
      ,[Sarakeryhma12_tutkintolaji]
      ,[Sarakeryhma13_ID]
      ,[Sarakeryhma13_tyyppi]
      ,[Sarakeryhma13_opp]
      ,[Sarakeryhma13_opmala]
      ,[Sarakeryhma13_opmopa]
      ,[Sarakeryhma13_opmast]
      ,[Sarakeryhma13_opm95opa]
      ,[Sarakeryhma13_koulutussektori]
      ,[Sarakeryhma13_suorv]
      ,[Sarakeryhma13_suorlk]
      ,[Sarakeryhma13_kmaak]
      ,[Sarakeryhma13_olotamm]
      ,[Sarakeryhma13_olosyys]
      ,[Sarakeryhma13_ptoim1r5]
      ,[Sarakeryhma13_amas]
      ,[Sarakeryhma13_koulk]
      ,[Sarakeryhma13_tutkintolaji]
      ,[Sarakeryhma14_ID]
      ,[Sarakeryhma14_tyyppi]
      ,[Sarakeryhma14_opp]
      ,[Sarakeryhma14_opmala]
      ,[Sarakeryhma14_opmopa]
      ,[Sarakeryhma14_opmast]
      ,[Sarakeryhma14_opm95opa]
      ,[Sarakeryhma14_koulutussektori]
      ,[Sarakeryhma14_suorv]
      ,[Sarakeryhma14_suorlk]
      ,[Sarakeryhma14_kmaak]
      ,[Sarakeryhma14_olotamm]
      ,[Sarakeryhma14_olosyys]
      ,[Sarakeryhma14_ptoim1r5]
      ,[Sarakeryhma14_amas]
      ,[Sarakeryhma14_koulk]
      ,[Sarakeryhma14_tutkintolaji]
      ,[Sarakeryhma15_ID]
      ,[Sarakeryhma15_tyyppi]
      ,[Sarakeryhma15_opp]
      ,[Sarakeryhma15_opmala]
      ,[Sarakeryhma15_opmopa]
      ,[Sarakeryhma15_opmast]
      ,[Sarakeryhma15_opm95opa]
      ,[Sarakeryhma15_koulutussektori]
      ,[Sarakeryhma15_suorv]
      ,[Sarakeryhma15_suorlk]
      ,[Sarakeryhma15_kmaak]
      ,[Sarakeryhma15_olotamm]
      ,[Sarakeryhma15_olosyys]
      ,[Sarakeryhma15_ptoim1r5]
      ,[Sarakeryhma15_amas]
      ,[Sarakeryhma15_koulk]
      ,[Sarakeryhma15_tutkintolaji]
      ,[Sarakeryhma16_ID]
      ,[Sarakeryhma16_tyyppi]
      ,[Sarakeryhma16_opp]
      ,[Sarakeryhma16_opmala]
      ,[Sarakeryhma16_opmopa]
      ,[Sarakeryhma16_opmast]
      ,[Sarakeryhma16_opm95opa]
      ,[Sarakeryhma16_koulutussektori]
      ,[Sarakeryhma16_suorv]
      ,[Sarakeryhma16_suorlk]
      ,[Sarakeryhma16_kmaak]
      ,[Sarakeryhma16_olotamm]
      ,[Sarakeryhma16_olosyys]
      ,[Sarakeryhma16_ptoim1r5]
      ,[Sarakeryhma16_amas]
      ,[Sarakeryhma16_koulk]
      ,[Sarakeryhma16_tutkintolaji]
      ,[Sarakeryhma17_ID]
      ,[Sarakeryhma17_tyyppi]
      ,[Sarakeryhma17_opp]
      ,[Sarakeryhma17_opmala]
      ,[Sarakeryhma17_opmopa]
      ,[Sarakeryhma17_opmast]
      ,[Sarakeryhma17_opm95opa]
      ,[Sarakeryhma17_koulutussektori]
      ,[Sarakeryhma17_suorv]
      ,[Sarakeryhma17_suorlk]
      ,[Sarakeryhma17_kmaak]
      ,[Sarakeryhma17_olotamm]
      ,[Sarakeryhma17_olosyys]
      ,[Sarakeryhma17_ptoim1r5]
      ,[Sarakeryhma17_amas]
      ,[Sarakeryhma17_koulk]
      ,[Sarakeryhma17_tutkintolaji]
      ,[Sarakeryhma18_ID]
      ,[Sarakeryhma18_tyyppi]
      ,[Sarakeryhma18_opp]
      ,[Sarakeryhma18_opmala]
      ,[Sarakeryhma18_opmopa]
      ,[Sarakeryhma18_opmast]
      ,[Sarakeryhma18_opm95opa]
      ,[Sarakeryhma18_koulutussektori]
      ,[Sarakeryhma18_suorv]
      ,[Sarakeryhma18_suorlk]
      ,[Sarakeryhma18_kmaak]
      ,[Sarakeryhma18_olotamm]
      ,[Sarakeryhma18_olosyys]
      ,[Sarakeryhma18_ptoim1r5]
      ,[Sarakeryhma18_amas]
      ,[Sarakeryhma18_koulk]
      ,[Sarakeryhma18_tutkintolaji]
      ,[Sarakeryhma19_ID]
      ,[Sarakeryhma19_tyyppi]
      ,[Sarakeryhma19_opp]
      ,[Sarakeryhma19_opmala]
      ,[Sarakeryhma19_opmopa]
      ,[Sarakeryhma19_opmast]
      ,[Sarakeryhma19_opm95opa]
      ,[Sarakeryhma19_koulutussektori]
      ,[Sarakeryhma19_suorv]
      ,[Sarakeryhma19_suorlk]
      ,[Sarakeryhma19_kmaak]
      ,[Sarakeryhma19_olotamm]
      ,[Sarakeryhma19_olosyys]
      ,[Sarakeryhma19_ptoim1r5]
      ,[Sarakeryhma19_amas]
      ,[Sarakeryhma19_koulk]
      ,[Sarakeryhma19_tutkintolaji]
      ,[Sarakeryhma20_ID]
      ,[Sarakeryhma20_tyyppi]
      ,[Sarakeryhma20_opp]
      ,[Sarakeryhma20_opmala]
      ,[Sarakeryhma20_opmopa]
      ,[Sarakeryhma20_opmast]
      ,[Sarakeryhma20_opm95opa]
      ,[Sarakeryhma20_koulutussektori]
      ,[Sarakeryhma20_suorv]
      ,[Sarakeryhma20_suorlk]
      ,[Sarakeryhma20_kmaak]
      ,[Sarakeryhma20_olotamm]
      ,[Sarakeryhma20_olosyys]
      ,[Sarakeryhma20_ptoim1r5]
      ,[Sarakeryhma20_amas]
      ,[Sarakeryhma20_koulk]
      ,[Sarakeryhma20_tutkintolaji]
      ,[Sarakeryhma21_ID]
      ,[Sarakeryhma21_tyyppi]
      ,[Sarakeryhma21_opp]
      ,[Sarakeryhma21_opmala]
      ,[Sarakeryhma21_opmopa]
      ,[Sarakeryhma21_opmast]
      ,[Sarakeryhma21_opm95opa]
      ,[Sarakeryhma21_koulutussektori]
      ,[Sarakeryhma21_suorv]
      ,[Sarakeryhma21_suorlk]
      ,[Sarakeryhma21_kmaak]
      ,[Sarakeryhma21_olotamm]
      ,[Sarakeryhma21_olosyys]
      ,[Sarakeryhma21_ptoim1r5]
      ,[Sarakeryhma21_amas]
      ,[Sarakeryhma21_koulk]
      ,[Sarakeryhma21_tutkintolaji]
      ,[Sarakeryhma22_ID]
      ,[Sarakeryhma22_tyyppi]
      ,[Sarakeryhma22_opp]
      ,[Sarakeryhma22_opmala]
      ,[Sarakeryhma22_opmopa]
      ,[Sarakeryhma22_opmast]
      ,[Sarakeryhma22_opm95opa]
      ,[Sarakeryhma22_koulutussektori]
      ,[Sarakeryhma22_suorv]
      ,[Sarakeryhma22_suorlk]
      ,[Sarakeryhma22_kmaak]
      ,[Sarakeryhma22_olotamm]
      ,[Sarakeryhma22_olosyys]
      ,[Sarakeryhma22_ptoim1r5]
      ,[Sarakeryhma22_amas]
      ,[Sarakeryhma22_koulk]
      ,[Sarakeryhma22_tutkintolaji]
      ,[Sarakeryhma23_ID]
      ,[Sarakeryhma23_tyyppi]
      ,[Sarakeryhma23_opp]
      ,[Sarakeryhma23_opmala]
      ,[Sarakeryhma23_opmopa]
      ,[Sarakeryhma23_opmast]
      ,[Sarakeryhma23_opm95opa]
      ,[Sarakeryhma23_koulutussektori]
      ,[Sarakeryhma23_suorv]
      ,[Sarakeryhma23_suorlk]
      ,[Sarakeryhma23_kmaak]
      ,[Sarakeryhma23_olotamm]
      ,[Sarakeryhma23_olosyys]
      ,[Sarakeryhma23_ptoim1r5]
      ,[Sarakeryhma23_amas]
      ,[Sarakeryhma23_koulk]
      ,[Sarakeryhma23_tutkintolaji]
      ,[Sarakeryhma24_ID]
      ,[Sarakeryhma24_tyyppi]
      ,[Sarakeryhma24_opp]
      ,[Sarakeryhma24_opmala]
      ,[Sarakeryhma24_opmopa]
      ,[Sarakeryhma24_opmast]
      ,[Sarakeryhma24_opm95opa]
      ,[Sarakeryhma24_koulutussektori]
      ,[Sarakeryhma24_suorv]
      ,[Sarakeryhma24_suorlk]
      ,[Sarakeryhma24_kmaak]
      ,[Sarakeryhma24_olotamm]
      ,[Sarakeryhma24_olosyys]
      ,[Sarakeryhma24_ptoim1r5]
      ,[Sarakeryhma24_amas]
      ,[Sarakeryhma24_koulk]
      ,[Sarakeryhma24_tutkintolaji]
      ,[Sarakeryhma25_ID]
      ,[Sarakeryhma25_tyyppi]
      ,[Sarakeryhma25_opp]
      ,[Sarakeryhma25_opmala]
      ,[Sarakeryhma25_opmopa]
      ,[Sarakeryhma25_opmast]
      ,[Sarakeryhma25_opm95opa]
      ,[Sarakeryhma25_koulutussektori]
      ,[Sarakeryhma25_suorv]
      ,[Sarakeryhma25_suorlk]
      ,[Sarakeryhma25_kmaak]
      ,[Sarakeryhma25_olotamm]
      ,[Sarakeryhma25_olosyys]
      ,[Sarakeryhma25_ptoim1r5]
      ,[Sarakeryhma25_amas]
      ,[Sarakeryhma25_koulk]
      ,[Sarakeryhma25_tutkintolaji]
      ,[Sarakeryhma26_ID]
      ,[Sarakeryhma26_tyyppi]
      ,[Sarakeryhma26_opp]
      ,[Sarakeryhma26_opmala]
      ,[Sarakeryhma26_opmopa]
      ,[Sarakeryhma26_opmast]
      ,[Sarakeryhma26_opm95opa]
      ,[Sarakeryhma26_koulutussektori]
      ,[Sarakeryhma26_suorv]
      ,[Sarakeryhma26_suorlk]
      ,[Sarakeryhma26_kmaak]
      ,[Sarakeryhma26_olotamm]
      ,[Sarakeryhma26_olosyys]
      ,[Sarakeryhma26_ptoim1r5]
      ,[Sarakeryhma26_amas]
      ,[Sarakeryhma26_koulk]
      ,[Sarakeryhma26_tutkintolaji]
      ,[Sarakeryhma27_ID]
      ,[Sarakeryhma27_tyyppi]
      ,[Sarakeryhma27_opp]
      ,[Sarakeryhma27_opmala]
      ,[Sarakeryhma27_opmopa]
      ,[Sarakeryhma27_opmast]
      ,[Sarakeryhma27_opm95opa]
      ,[Sarakeryhma27_koulutussektori]
      ,[Sarakeryhma27_suorv]
      ,[Sarakeryhma27_suorlk]
      ,[Sarakeryhma27_kmaak]
      ,[Sarakeryhma27_olotamm]
      ,[Sarakeryhma27_olosyys]
      ,[Sarakeryhma27_ptoim1r5]
      ,[Sarakeryhma27_amas]
      ,[Sarakeryhma27_koulk]
      ,[Sarakeryhma27_tutkintolaji]
      ,[Sarakeryhma28_ID]
      ,[Sarakeryhma28_tyyppi]
      ,[Sarakeryhma28_opp]
      ,[Sarakeryhma28_opmala]
      ,[Sarakeryhma28_opmopa]
      ,[Sarakeryhma28_opmast]
      ,[Sarakeryhma28_opm95opa]
      ,[Sarakeryhma28_koulutussektori]
      ,[Sarakeryhma28_suorv]
      ,[Sarakeryhma28_suorlk]
      ,[Sarakeryhma28_kmaak]
      ,[Sarakeryhma28_olotamm]
      ,[Sarakeryhma28_olosyys]
      ,[Sarakeryhma28_ptoim1r5]
      ,[Sarakeryhma28_amas]
      ,[Sarakeryhma28_koulk]
      ,[Sarakeryhma28_tutkintolaji]
      ,[Sarakeryhma29_ID]
      ,[Sarakeryhma29_tyyppi]
      ,[Sarakeryhma29_opp]
      ,[Sarakeryhma29_opmala]
      ,[Sarakeryhma29_opmopa]
      ,[Sarakeryhma29_opmast]
      ,[Sarakeryhma29_opm95opa]
      ,[Sarakeryhma29_koulutussektori]
      ,[Sarakeryhma29_suorv]
      ,[Sarakeryhma29_suorlk]
      ,[Sarakeryhma29_kmaak]
      ,[Sarakeryhma29_olotamm]
      ,[Sarakeryhma29_olosyys]
      ,[Sarakeryhma29_ptoim1r5]
      ,[Sarakeryhma29_amas]
      ,[Sarakeryhma29_koulk]
      ,[Sarakeryhma29_tutkintolaji]
      ,[Sarakeryhma30_ID]
      ,[Sarakeryhma30_tyyppi]
      ,[Sarakeryhma30_opp]
      ,[Sarakeryhma30_opmala]
      ,[Sarakeryhma30_opmopa]
      ,[Sarakeryhma30_opmast]
      ,[Sarakeryhma30_opm95opa]
      ,[Sarakeryhma30_koulutussektori]
      ,[Sarakeryhma30_suorv]
      ,[Sarakeryhma30_suorlk]
      ,[Sarakeryhma30_kmaak]
      ,[Sarakeryhma30_olotamm]
      ,[Sarakeryhma30_olosyys]
      ,[Sarakeryhma30_ptoim1r5]
      ,[Sarakeryhma30_amas]
      ,[Sarakeryhma30_koulk]
      ,[Sarakeryhma30_tutkintolaji]
      ,[Sarakeryhma31_ID]
      ,[Sarakeryhma31_tyyppi]
      ,[Sarakeryhma31_opp]
      ,[Sarakeryhma31_opmala]
      ,[Sarakeryhma31_opmopa]
      ,[Sarakeryhma31_opmast]
      ,[Sarakeryhma31_opm95opa]
      ,[Sarakeryhma31_koulutussektori]
      ,[Sarakeryhma31_suorv]
      ,[Sarakeryhma31_suorlk]
      ,[Sarakeryhma31_kmaak]
      ,[Sarakeryhma31_olotamm]
      ,[Sarakeryhma31_olosyys]
      ,[Sarakeryhma31_ptoim1r5]
      ,[Sarakeryhma31_amas]
      ,[Sarakeryhma31_koulk]
      ,[Sarakeryhma31_tutkintolaji]
      ,[Sarakeryhma32_ID]
      ,[Sarakeryhma32_tyyppi]
      ,[Sarakeryhma32_opp]
      ,[Sarakeryhma32_opmala]
      ,[Sarakeryhma32_opmopa]
      ,[Sarakeryhma32_opmast]
      ,[Sarakeryhma32_opm95opa]
      ,[Sarakeryhma32_koulutussektori]
      ,[Sarakeryhma32_suorv]
      ,[Sarakeryhma32_suorlk]
      ,[Sarakeryhma32_kmaak]
      ,[Sarakeryhma32_olotamm]
      ,[Sarakeryhma32_olosyys]
      ,[Sarakeryhma32_ptoim1r5]
      ,[Sarakeryhma32_amas]
      ,[Sarakeryhma32_koulk]
      ,[Sarakeryhma32_tutkintolaji]
      ,[Sarakeryhma33_ID]
      ,[Sarakeryhma33_tyyppi]
      ,[Sarakeryhma33_opp]
      ,[Sarakeryhma33_opmala]
      ,[Sarakeryhma33_opmopa]
      ,[Sarakeryhma33_opmast]
      ,[Sarakeryhma33_opm95opa]
      ,[Sarakeryhma33_koulutussektori]
      ,[Sarakeryhma33_suorv]
      ,[Sarakeryhma33_suorlk]
      ,[Sarakeryhma33_kmaak]
      ,[Sarakeryhma33_olotamm]
      ,[Sarakeryhma33_olosyys]
      ,[Sarakeryhma33_ptoim1r5]
      ,[Sarakeryhma33_amas]
      ,[Sarakeryhma33_koulk]
      ,[Sarakeryhma33_tutkintolaji]
      ,[Sarakeryhma34_ID]
      ,[Sarakeryhma34_tyyppi]
      ,[Sarakeryhma34_opp]
      ,[Sarakeryhma34_opmala]
      ,[Sarakeryhma34_opmopa]
      ,[Sarakeryhma34_opmast]
      ,[Sarakeryhma34_opm95opa]
      ,[Sarakeryhma34_koulutussektori]
      ,[Sarakeryhma34_suorv]
      ,[Sarakeryhma34_suorlk]
      ,[Sarakeryhma34_kmaak]
      ,[Sarakeryhma34_olotamm]
      ,[Sarakeryhma34_olosyys]
      ,[Sarakeryhma34_ptoim1r5]
      ,[Sarakeryhma34_amas]
      ,[Sarakeryhma34_koulk]
      ,[Sarakeryhma34_tutkintolaji]
      ,[Sarakeryhma35_ID]
      ,[Sarakeryhma35_tyyppi]
      ,[Sarakeryhma35_opp]
      ,[Sarakeryhma35_opmala]
      ,[Sarakeryhma35_opmopa]
      ,[Sarakeryhma35_opmast]
      ,[Sarakeryhma35_opm95opa]
      ,[Sarakeryhma35_koulutussektori]
      ,[Sarakeryhma35_suorv]
      ,[Sarakeryhma35_suorlk]
      ,[Sarakeryhma35_kmaak]
      ,[Sarakeryhma35_olotamm]
      ,[Sarakeryhma35_olosyys]
      ,[Sarakeryhma35_ptoim1r5]
      ,[Sarakeryhma35_amas]
      ,[Sarakeryhma35_koulk]
      ,[Sarakeryhma35_tutkintolaji]
*/
  FROM (

SELECT --TOP 0
	   alo.[tilv]
      ,alo.[lahde]
      ,opp = (SELECT case
			when alo.lahde in (41,42,46,51,52) then 
				isnull(case when CHARINDEX('K3.10',alo.tietolahde)>0 then isnull(d17.oppilaitoskoodi,'') else ''end, '')		
				--isnull(dop.oppilaitoskoodi,'')
			else ''
			end)

      ,alo.[sp]
      ,alo.[syntv]
      ,alo.[aikielir1]
      ,alo.[alvv]
      ,alo.[allk]
      ,alo.[klaji]
      ,alo.[ophal] --vain K3.9
      ,alo.[jarj]
      ,alo.[kkun]
	  ,maak = isnull(dal.maakunta_koodi,'')
      ,alo.[koulk]
	  ,opmala = isnull(dko.koulutusala2002_koodi,'')
	  ,opmopa = isnull(dko.opintoala2002_koodi,'')
	  ,opmast = isnull(dko.koulutusaste2002_koodi,'')
	  ,opm95opa = isnull(dko.opintoala1995_koodi,'')
	  ,koulutussektori = (SELECT
				CASE isnull(dko.koulutusaste2002_koodi,'')
					when '' then ''
					when '31' then 'Lukiokoulutus'
					when '32' then 'Ammatillinen koulutus'
					when '62' then 'Ammattikorkeakoulukoulutus'
					when '71' then 'Ammattikorkeakoulukoulutus'
					when '63' then 'Yiopistokoulutus'
					when '72' then 'Yiopistokoulutus'
					when '73' then 'Yiopistokoulutus'
					when '81' then 'Yiopistokoulutus' 
					when '82' then 'Yiopistokoulutus'
					else 'Virhetilanne'
				END )
      ,alo.[pohjkoulk]
	  ,alo.alvv_kk -- vain K3.10
	  ,alo.allk_kk -- vain K3.10
	  ,alo.ololk -- vain K3.10
	  ,alo.rahlahde -- vain K3.10
	  ,koulutuslaji2 = (select	
		  case 
			-- Virhetilanne
			when (isnull(alo.klaji,'')='' or ISNULL(alo.koulk,'')='') then 'virhetilanne'
			-- Muut klajit
			when (isnull(alo.klaji,'')!='' and ISNULL(alo.koulk,'')!='' and alo.klaji != '51') then (SELECT alo.klaji)
			-- Alempaan korkeakoulututkintoon thtv koulutus
			-- Lisätty koulk 742704 käsittely, jolle ei tilastovuonna vielä koodia luokituksessa
			when (alo.klaji = '51' and alo.koulk = '742704') then '51b'
			when (alo.klaji = '51' and alo.koulk != '742704') then
				case (select coalesce(nullif(d.koulutusaste2002_koodi,'-1'), d.koulutusaste_taso2_koodi)
					  from d_koulutusluokitus d 
-- Siirretty uuteen koulutusluokitus-dimensioon / Jarmo 10.5.2013
-- vipunen_tk.d_koulutusluokitus d
					  where d.koulutus_koodi = alo.koulk
							and alo.tilv between YEAR(alkaa) and YEAR(isnull(paattyy,'9999-01-01')))
					  when '63' then
						case
							when (alo.koulk='612101' or alo.koulk='634101' or alo.koulk='672401') then '51a'
							when (alo.koulk!='612101' and alo.koulk!='634101' and alo.koulk!='672401') then '51b'
							else ''
						end
				when '72' then '51b'
				else ''
				end
			-- Virhetilanne
			else ''
		  end -- end of case
		)
      ,alo.[tietolahde]
      --,alo.[rivinumero]
      ,alo.[aineistorivinumero]
      ,alo.[lkm_int]
      
      ,'Sarakeryhma1_ID' = alo.[Sarakeryhma_ID1]
      ,'Sarakeryhma1_tyyppi' = ava1.tyyppi
      --,[Sarakeryhma_arvo1]
      ,'Sarakeryhma1_opp' = ava1.opp
      ,'Sarakeryhma1_opmala' = ava1.opmala
      ,'Sarakeryhma1_opmopa' = ava1.opmopa
      ,'Sarakeryhma1_opmast' = ava1.opmast
      ,'Sarakeryhma1_opm95opa' = ava1.opm95opa
      ,'Sarakeryhma1_koulutussektori' = ava1.koulutussektori
      ,'Sarakeryhma1_suorv' = ava1.suorv
      ,'Sarakeryhma1_suorlk' = ava1.suorlk
      ,'Sarakeryhma1_kmaak' = Case when ava1.tutkmaak is not null then ava1.tutkmaak
								when ava1.kmaak is not null then ava1.kmaak
								when ava1.kmaak_2 is not null then ava1.kmaak_2 else null end
      ,'Sarakeryhma1_olotamm' = ava1.olotamm_2
      ,'Sarakeryhma1_olosyys' = ava1.olosyys_2
      ,'Sarakeryhma1_ptoim1r5' = ava1.ptoim1r5
      ,'Sarakeryhma1_amas' = ava1.amas
      ,'Sarakeryhma1_koulk' = Case when ava1.tutkkoulk is not null then ava1.tutkkoulk
								when ava1.opiskkoulk is not null then ava1.opiskkoulk
								when ava1.opiskkoulk_2 is not null then ava1.opiskkoulk_2 else null end
      ,'Sarakeryhma1_jarj' = Case when ava1.tutkjarj is not null then ava1.tutkjarj
								when ava1.opiskjarj is not null then ava1.opiskjarj
								when ava1.opiskjarj_2 is not null then ava1.opiskjarj_2 else null end
      ,'Sarakeryhma1_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID1],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID1],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID1],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID1],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID1],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID1],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID1],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID1],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID1],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID1],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID1] is null then null
								else 'muu' end
      
      ,'Sarakeryhma2_ID' = alo.[Sarakeryhma_ID2]
      ,'Sarakeryhma2_tyyppi' = ava2.tyyppi
      --,[Sarakeryhma_arvo2]
      ,'Sarakeryhma2_opp' = ava2.opp
      ,'Sarakeryhma2_opmala' = ava2.opmala
      ,'Sarakeryhma2_opmopa' = ava2.opmopa
      ,'Sarakeryhma2_opmast' = ava2.opmast
      ,'Sarakeryhma2_opm95opa' = ava2.opm95opa
      ,'Sarakeryhma2_koulutussektori' = ava2.koulutussektori
      ,'Sarakeryhma2_suorv' = ava2.suorv
      ,'Sarakeryhma2_suorlk' = ava2.suorlk
      ,'Sarakeryhma2_kmaak' = Case when ava2.tutkmaak is not null then ava2.tutkmaak
								when ava2.kmaak is not null then ava2.kmaak
								when ava2.kmaak_2 is not null then ava2.kmaak_2 else null end
      ,'Sarakeryhma2_olotamm' = ava2.olotamm_2
      ,'Sarakeryhma2_olosyys' = ava2.olosyys_2
      ,'Sarakeryhma2_ptoim1r5' = ava2.ptoim1r5
      ,'Sarakeryhma2_amas' = ava2.amas
      ,'Sarakeryhma2_koulk' = Case when ava2.tutkkoulk is not null then ava2.tutkkoulk
								when ava2.opiskkoulk is not null then ava2.opiskkoulk
								when ava2.opiskkoulk_2 is not null then ava2.opiskkoulk_2 else null end
      ,'Sarakeryhma2_jarj' = Case when ava2.tutkjarj is not null then ava2.tutkjarj
								when ava2.opiskjarj is not null then ava2.opiskjarj
								when ava2.opiskjarj_2 is not null then ava2.opiskjarj_2 else null end
      ,'Sarakeryhma2_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID2],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID2],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID2],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID2],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID2],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID2],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID2],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID2],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID2],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID2],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID2] is null then null
								else 'muu' end
      
      ,'Sarakeryhma3_ID' = alo.[Sarakeryhma_ID3]
      ,'Sarakeryhma3_tyyppi' = ava3.tyyppi
      --,[Sarakeryhma_arvo3]
      ,'Sarakeryhma3_opp' = ava3.opp
      ,'Sarakeryhma3_opmala' = ava3.opmala
      ,'Sarakeryhma3_opmopa' = ava3.opmopa
      ,'Sarakeryhma3_opmast' = ava3.opmast
      ,'Sarakeryhma3_opm95opa' = ava3.opm95opa
      ,'Sarakeryhma3_koulutussektori' = ava3.koulutussektori
      ,'Sarakeryhma3_suorv' = ava3.suorv
      ,'Sarakeryhma3_suorlk' = ava3.suorlk
      ,'Sarakeryhma3_kmaak' = Case when ava3.tutkmaak is not null then ava3.tutkmaak
								when ava3.kmaak is not null then ava3.kmaak
								when ava3.kmaak_2 is not null then ava3.kmaak_2 else null end
      ,'Sarakeryhma3_olotamm' = ava3.olotamm_2
      ,'Sarakeryhma3_olosyys' = ava3.olosyys_2
      ,'Sarakeryhma3_ptoim1r5' = ava3.ptoim1r5
      ,'Sarakeryhma3_amas' = ava3.amas
      ,'Sarakeryhma3_koulk' = Case when ava3.tutkkoulk is not null then ava3.tutkkoulk
								when ava3.opiskkoulk is not null then ava3.opiskkoulk
								when ava3.opiskkoulk_2 is not null then ava3.opiskkoulk_2 else null end
      ,'Sarakeryhma3_jarj' = Case when ava3.tutkjarj is not null then ava3.tutkjarj
								when ava3.opiskjarj is not null then ava3.opiskjarj
								when ava3.opiskjarj_2 is not null then ava3.opiskjarj_2 else null end
      ,'Sarakeryhma3_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID3],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID3],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID3],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID3],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID3],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID3],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID3],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID3],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID3],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID3],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID3] is null then null
								else 'muu' end
      
      ,'Sarakeryhma4_ID' = alo.[Sarakeryhma_ID4]
      ,'Sarakeryhma4_tyyppi' = ava4.tyyppi
      --,[Sarakeryhma_arvo4]
      ,'Sarakeryhma4_opp' = ava4.opp
      ,'Sarakeryhma4_opmala' = ava4.opmala
      ,'Sarakeryhma4_opmopa' = ava4.opmopa
      ,'Sarakeryhma4_opmast' = ava4.opmast
      ,'Sarakeryhma4_opm95opa' = ava4.opm95opa
      ,'Sarakeryhma4_koulutussektori' = ava4.koulutussektori
      ,'Sarakeryhma4_suorv' = ava4.suorv
      ,'Sarakeryhma4_suorlk' = ava4.suorlk
      ,'Sarakeryhma4_kmaak' = Case when ava4.tutkmaak is not null then ava4.tutkmaak
								when ava4.kmaak is not null then ava4.kmaak
								when ava4.kmaak_2 is not null then ava4.kmaak_2 else null end
      ,'Sarakeryhma4_olotamm' = ava4.olotamm_2
      ,'Sarakeryhma4_olosyys' = ava4.olosyys_2
      ,'Sarakeryhma4_ptoim1r5' = ava4.ptoim1r5
      ,'Sarakeryhma4_amas' = ava4.amas
      ,'Sarakeryhma4_koulk' = Case when ava4.tutkkoulk is not null then ava4.tutkkoulk
								when ava4.opiskkoulk is not null then ava4.opiskkoulk
								when ava4.opiskkoulk_2 is not null then ava4.opiskkoulk_2 else null end
      ,'Sarakeryhma4_jarj' = Case when ava4.tutkjarj is not null then ava4.tutkjarj
								when ava4.opiskjarj is not null then ava4.opiskjarj
								when ava4.opiskjarj_2 is not null then ava4.opiskjarj_2 else null end
      ,'Sarakeryhma4_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID4],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID4],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID4],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID4],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID4],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID4],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID4],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID4],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID4],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID4],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID4] is null then null
								else 'muu' end
      
      ,'Sarakeryhma5_ID' = alo.[Sarakeryhma_ID5]
      ,'Sarakeryhma5_tyyppi' = ava5.tyyppi
      --,[Sarakeryhma_arvo5]
      ,'Sarakeryhma5_opp' = ava5.opp
      ,'Sarakeryhma5_opmala' = ava5.opmala
      ,'Sarakeryhma5_opmopa' = ava5.opmopa
      ,'Sarakeryhma5_opmast' = ava5.opmast
      ,'Sarakeryhma5_opm95opa' = ava5.opm95opa
      ,'Sarakeryhma5_koulutussektori' = ava5.koulutussektori
      ,'Sarakeryhma5_suorv' = ava5.suorv
      ,'Sarakeryhma5_suorlk' = ava5.suorlk
      ,'Sarakeryhma5_kmaak' = Case when ava5.tutkmaak is not null then ava5.tutkmaak
								when ava5.kmaak is not null then ava5.kmaak
								when ava5.kmaak_2 is not null then ava5.kmaak_2 else null end
      ,'Sarakeryhma5_olotamm' = ava5.olotamm_2
      ,'Sarakeryhma5_olosyys' = ava5.olosyys_2
      ,'Sarakeryhma5_ptoim1r5' = ava5.ptoim1r5
      ,'Sarakeryhma5_amas' = ava5.amas
      ,'Sarakeryhma5_koulk' = Case when ava5.tutkkoulk is not null then ava5.tutkkoulk
								when ava5.opiskkoulk is not null then ava5.opiskkoulk
								when ava5.opiskkoulk_2 is not null then ava5.opiskkoulk_2 else null end
      ,'Sarakeryhma5_jarj' = Case when ava5.tutkjarj is not null then ava5.tutkjarj
								when ava5.opiskjarj is not null then ava5.opiskjarj
								when ava5.opiskjarj_2 is not null then ava5.opiskjarj_2 else null end
      ,'Sarakeryhma5_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID5],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID5],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID5],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID5],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID5],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID5],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID5],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID5],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID5],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID5],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID5] is null then null
								else 'muu' end
      
      ,'Sarakeryhma6_ID' = alo.[Sarakeryhma_ID6]
      ,'Sarakeryhma6_tyyppi' = ava6.tyyppi
      --,[Sarakeryhma_arvo6]
      ,'Sarakeryhma6_opp' = ava6.opp
      ,'Sarakeryhma6_opmala' = ava6.opmala
      ,'Sarakeryhma6_opmopa' = ava6.opmopa
      ,'Sarakeryhma6_opmast' = ava6.opmast
      ,'Sarakeryhma6_opm95opa' = ava6.opm95opa
      ,'Sarakeryhma6_koulutussektori' = ava6.koulutussektori
      ,'Sarakeryhma6_suorv' = ava6.suorv
      ,'Sarakeryhma6_suorlk' = ava6.suorlk
      ,'Sarakeryhma6_kmaak' = Case when ava6.tutkmaak is not null then ava6.tutkmaak
								when ava6.kmaak is not null then ava6.kmaak
								when ava6.kmaak_2 is not null then ava6.kmaak_2 else null end
      ,'Sarakeryhma6_olotamm' = ava6.olotamm_2
      ,'Sarakeryhma6_olosyys' = ava6.olosyys_2
      ,'Sarakeryhma6_ptoim1r5' = ava6.ptoim1r5
      ,'Sarakeryhma6_amas' = ava6.amas
      ,'Sarakeryhma6_koulk' = Case when ava6.tutkkoulk is not null then ava6.tutkkoulk
								when ava6.opiskkoulk is not null then ava6.opiskkoulk
								when ava6.opiskkoulk_2 is not null then ava6.opiskkoulk_2 else null end
      ,'Sarakeryhma6_jarj' = Case when ava6.tutkjarj is not null then ava6.tutkjarj
								when ava6.opiskjarj is not null then ava6.opiskjarj
								when ava6.opiskjarj_2 is not null then ava6.opiskjarj_2 else null end
      ,'Sarakeryhma6_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID6],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID6],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID6],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID6],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID6],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID6],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID6],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID6],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID6],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID6],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID6] is null then null
								else 'muu' end
      
      ,'Sarakeryhma7_ID' = alo.[Sarakeryhma_ID7]
      ,'Sarakeryhma7_tyyppi' = ava7.tyyppi
      --,[Sarakeryhma_arvo7]
      ,'Sarakeryhma7_opp' = ava7.opp
      ,'Sarakeryhma7_opmala' = ava7.opmala
      ,'Sarakeryhma7_opmopa' = ava7.opmopa
      ,'Sarakeryhma7_opmast' = ava7.opmast
      ,'Sarakeryhma7_opm95opa' = ava7.opm95opa
      ,'Sarakeryhma7_koulutussektori' = ava7.koulutussektori
      ,'Sarakeryhma7_suorv' = ava7.suorv
      ,'Sarakeryhma7_suorlk' = ava7.suorlk
      ,'Sarakeryhma7_kmaak' = Case when ava7.tutkmaak is not null then ava7.tutkmaak
								when ava7.kmaak is not null then ava7.kmaak
								when ava7.kmaak_2 is not null then ava7.kmaak_2 else null end
      ,'Sarakeryhma7_olotamm' = ava7.olotamm_2
      ,'Sarakeryhma7_olosyys' = ava7.olosyys_2
      ,'Sarakeryhma7_ptoim1r5' = ava7.ptoim1r5
      ,'Sarakeryhma7_amas' = ava7.amas
      ,'Sarakeryhma7_koulk' = Case when ava7.tutkkoulk is not null then ava7.tutkkoulk
								when ava7.opiskkoulk is not null then ava7.opiskkoulk
								when ava7.opiskkoulk_2 is not null then ava7.opiskkoulk_2 else null end
      ,'Sarakeryhma7_jarj' = Case when ava7.tutkjarj is not null then ava7.tutkjarj
								when ava7.opiskjarj is not null then ava7.opiskjarj
								when ava7.opiskjarj_2 is not null then ava7.opiskjarj_2 else null end
      ,'Sarakeryhma7_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID7],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID7],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID7],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID7],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID7],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID7],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID7],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID7],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID7],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID7],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID7] is null then null
								else 'muu' end
      
      ,'Sarakeryhma8_ID' = alo.[Sarakeryhma_ID8]
      ,'Sarakeryhma8_tyyppi' = ava8.tyyppi
      --,[Sarakeryhma_arvo8]
      ,'Sarakeryhma8_opp' = ava8.opp
      ,'Sarakeryhma8_opmala' = ava8.opmala
      ,'Sarakeryhma8_opmopa' = ava8.opmopa
      ,'Sarakeryhma8_opmast' = ava8.opmast
      ,'Sarakeryhma8_opm95opa' = ava8.opm95opa
      ,'Sarakeryhma8_koulutussektori' = ava8.koulutussektori
      ,'Sarakeryhma8_suorv' = ava8.suorv
      ,'Sarakeryhma8_suorlk' = ava8.suorlk
      ,'Sarakeryhma8_kmaak' = Case when ava8.tutkmaak is not null then ava8.tutkmaak
								when ava8.kmaak is not null then ava8.kmaak
								when ava8.kmaak_2 is not null then ava8.kmaak_2 else null end
      ,'Sarakeryhma8_olotamm' = ava8.olotamm_2
      ,'Sarakeryhma8_olosyys' = ava8.olosyys_2
      ,'Sarakeryhma8_ptoim1r5' = ava8.ptoim1r5
      ,'Sarakeryhma8_amas' = ava8.amas
      ,'Sarakeryhma8_koulk' = Case when ava8.tutkkoulk is not null then ava8.tutkkoulk
								when ava8.opiskkoulk is not null then ava8.opiskkoulk
								when ava8.opiskkoulk_2 is not null then ava8.opiskkoulk_2 else null end
      ,'Sarakeryhma8_jarj' = Case when ava8.tutkjarj is not null then ava8.tutkjarj
								when ava8.opiskjarj is not null then ava8.opiskjarj
								when ava8.opiskjarj_2 is not null then ava8.opiskjarj_2 else null end
      ,'Sarakeryhma8_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID8],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID8],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID8],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID8],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID8],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID8],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID8],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID8],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID8],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID8],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID8] is null then null
								else 'muu' end
      
      ,'Sarakeryhma9_ID' = alo.[Sarakeryhma_ID9]
      ,'Sarakeryhma9_tyyppi' = ava9.tyyppi
      --,[Sarakeryhma_arvo9]
      ,'Sarakeryhma9_opp' = ava9.opp
      ,'Sarakeryhma9_opmala' = ava9.opmala
      ,'Sarakeryhma9_opmopa' = ava9.opmopa
      ,'Sarakeryhma9_opmast' = ava9.opmast
      ,'Sarakeryhma9_opm95opa' = ava9.opm95opa
      ,'Sarakeryhma9_koulutussektori' = ava9.koulutussektori
      ,'Sarakeryhma9_suorv' = ava9.suorv
      ,'Sarakeryhma9_suorlk' = ava9.suorlk
      ,'Sarakeryhma9_kmaak' = Case when ava9.tutkmaak is not null then ava9.tutkmaak
								when ava9.kmaak is not null then ava9.kmaak
								when ava9.kmaak_2 is not null then ava9.kmaak_2 else null end
      ,'Sarakeryhma9_olotamm' = ava9.olotamm_2
      ,'Sarakeryhma9_olosyys' = ava9.olosyys_2
      ,'Sarakeryhma9_ptoim1r5' = ava9.ptoim1r5
      ,'Sarakeryhma9_amas' = ava9.amas
      ,'Sarakeryhma9_koulk' = Case when ava9.tutkkoulk is not null then ava9.tutkkoulk
								when ava9.opiskkoulk is not null then ava9.opiskkoulk
								when ava9.opiskkoulk_2 is not null then ava9.opiskkoulk_2 else null end
      ,'Sarakeryhma9_jarj' = Case when ava9.tutkjarj is not null then ava9.tutkjarj
								when ava9.opiskjarj is not null then ava9.opiskjarj
								when ava9.opiskjarj_2 is not null then ava9.opiskjarj_2 else null end
      ,'Sarakeryhma9_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID9],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID9],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID9],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID9],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID9],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID9],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID9],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID9],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID9],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID9],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID9] is null then null
								else 'muu' end
      
      ,'Sarakeryhma10_ID' = alo.[Sarakeryhma_ID10]
      ,'Sarakeryhma10_tyyppi' = ava10.tyyppi
      --,[Sarakeryhma_arvo10]
      ,'Sarakeryhma10_opp' = ava10.opp
      ,'Sarakeryhma10_opmala' = ava10.opmala
      ,'Sarakeryhma10_opmopa' = ava10.opmopa
      ,'Sarakeryhma10_opmast' = ava10.opmast
      ,'Sarakeryhma10_opm95opa' = ava10.opm95opa
      ,'Sarakeryhma10_koulutussektori' = ava10.koulutussektori
      ,'Sarakeryhma10_suorv' = ava10.suorv
      ,'Sarakeryhma10_suorlk' = ava10.suorlk
      ,'Sarakeryhma10_kmaak' = Case when ava10.tutkmaak is not null then ava10.tutkmaak
								when ava10.kmaak is not null then ava10.kmaak
								when ava10.kmaak_2 is not null then ava10.kmaak_2 else null end
      ,'Sarakeryhma10_olotamm' = ava10.olotamm_2
      ,'Sarakeryhma10_olosyys' = ava10.olosyys_2
      ,'Sarakeryhma10_ptoim1r5' = ava10.ptoim1r5
      ,'Sarakeryhma10_amas' = ava10.amas
      ,'Sarakeryhma10_koulk' = Case when ava10.tutkkoulk is not null then ava10.tutkkoulk
								when ava10.opiskkoulk is not null then ava10.opiskkoulk
								when ava10.opiskkoulk_2 is not null then ava10.opiskkoulk_2 else null end
      ,'Sarakeryhma10_jarj' = Case when ava10.tutkjarj is not null then ava10.tutkjarj
								when ava10.opiskjarj is not null then ava10.opiskjarj
								when ava10.opiskjarj_2 is not null then ava10.opiskjarj_2 else null end
      ,'Sarakeryhma10_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID10],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID10],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID10],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID10],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID10],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID10],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID10],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID10],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID10],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID10],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID10] is null then null
								else 'muu' end
      
      ,'Sarakeryhma11_ID' = alo.[Sarakeryhma_ID11]
      ,'Sarakeryhma11_tyyppi' = ava11.tyyppi
      --,[Sarakeryhma_arvo11]
      ,'Sarakeryhma11_opp' = ava11.opp
      ,'Sarakeryhma11_opmala' = ava11.opmala
      ,'Sarakeryhma11_opmopa' = ava11.opmopa
      ,'Sarakeryhma11_opmast' = ava11.opmast
      ,'Sarakeryhma11_opm95opa' = ava11.opm95opa
      ,'Sarakeryhma11_koulutussektori' = ava11.koulutussektori
      ,'Sarakeryhma11_suorv' = ava11.suorv
      ,'Sarakeryhma11_suorlk' = ava11.suorlk
      ,'Sarakeryhma11_kmaak' = Case when ava11.tutkmaak is not null then ava11.tutkmaak
								when ava11.kmaak is not null then ava11.kmaak
								when ava11.kmaak_2 is not null then ava11.kmaak_2 else null end
      ,'Sarakeryhma11_olotamm' = ava11.olotamm_2
      ,'Sarakeryhma11_olosyys' = ava11.olosyys_2
      ,'Sarakeryhma11_ptoim1r5' = ava11.ptoim1r5
      ,'Sarakeryhma11_amas' = ava11.amas
      ,'Sarakeryhma11_koulk' = Case when ava11.tutkkoulk is not null then ava11.tutkkoulk
								when ava11.opiskkoulk is not null then ava11.opiskkoulk
								when ava11.opiskkoulk_2 is not null then ava11.opiskkoulk_2 else null end
      ,'Sarakeryhma11_jarj' = Case when ava11.tutkjarj is not null then ava11.tutkjarj
								when ava11.opiskjarj is not null then ava11.opiskjarj
								when ava11.opiskjarj_2 is not null then ava11.opiskjarj_2 else null end
      ,'Sarakeryhma11_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID11],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID11],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID11],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID11],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID11],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID11],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID11],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID11],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID11],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID11],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID11] is null then null
								else 'muu' end
      
      ,'Sarakeryhma12_ID' = alo.[Sarakeryhma_ID12]
      ,'Sarakeryhma12_tyyppi' = ava12.tyyppi
      --,[Sarakeryhma_arvo12]
      ,'Sarakeryhma12_opp' = ava12.opp
      ,'Sarakeryhma12_opmala' = ava12.opmala
      ,'Sarakeryhma12_opmopa' = ava12.opmopa
      ,'Sarakeryhma12_opmast' = ava12.opmast
      ,'Sarakeryhma12_opm95opa' = ava12.opm95opa
      ,'Sarakeryhma12_koulutussektori' = ava12.koulutussektori
      ,'Sarakeryhma12_suorv' = ava12.suorv
      ,'Sarakeryhma12_suorlk' = ava12.suorlk
      ,'Sarakeryhma12_kmaak' = Case when ava12.tutkmaak is not null then ava12.tutkmaak
								when ava12.kmaak is not null then ava12.kmaak
								when ava12.kmaak_2 is not null then ava12.kmaak_2 else null end
      ,'Sarakeryhma12_olotamm' = ava12.olotamm_2
      ,'Sarakeryhma12_olosyys' = ava12.olosyys_2
      ,'Sarakeryhma12_ptoim1r5' = ava12.ptoim1r5
      ,'Sarakeryhma12_amas' = ava12.amas
      ,'Sarakeryhma12_koulk' = Case when ava12.tutkkoulk is not null then ava12.tutkkoulk
								when ava12.opiskkoulk is not null then ava12.opiskkoulk
								when ava12.opiskkoulk_2 is not null then ava12.opiskkoulk_2 else null end
      ,'Sarakeryhma12_jarj' = Case when ava12.tutkjarj is not null then ava12.tutkjarj
								when ava12.opiskjarj is not null then ava12.opiskjarj
								when ava12.opiskjarj_2 is not null then ava12.opiskjarj_2 else null end
      ,'Sarakeryhma12_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID12],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID12],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID12],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID12],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID12],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID12],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID12],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID12],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID12],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID12],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID12] is null then null
								else 'muu' end
      
      ,'Sarakeryhma13_ID' = alo.[Sarakeryhma_ID13]
      ,'Sarakeryhma13_tyyppi' = ava13.tyyppi
      --,[Sarakeryhma_arvo13]
      ,'Sarakeryhma13_opp' = ava13.opp
      ,'Sarakeryhma13_opmala' = ava13.opmala
      ,'Sarakeryhma13_opmopa' = ava13.opmopa
      ,'Sarakeryhma13_opmast' = ava13.opmast
      ,'Sarakeryhma13_opm95opa' = ava13.opm95opa
      ,'Sarakeryhma13_koulutussektori' = ava13.koulutussektori
      ,'Sarakeryhma13_suorv' = ava13.suorv
      ,'Sarakeryhma13_suorlk' = ava13.suorlk
      ,'Sarakeryhma13_kmaak' = Case when ava13.tutkmaak is not null then ava13.tutkmaak
								when ava13.kmaak is not null then ava13.kmaak
								when ava13.kmaak_2 is not null then ava13.kmaak_2 else null end
      ,'Sarakeryhma13_olotamm' = ava13.olotamm_2
      ,'Sarakeryhma13_olosyys' = ava13.olosyys_2
      ,'Sarakeryhma13_ptoim1r5' = ava13.ptoim1r5
      ,'Sarakeryhma13_amas' = ava13.amas
      ,'Sarakeryhma13_koulk' = Case when ava13.tutkkoulk is not null then ava13.tutkkoulk
								when ava13.opiskkoulk is not null then ava13.opiskkoulk
								when ava13.opiskkoulk_2 is not null then ava13.opiskkoulk_2 else null end
      ,'Sarakeryhma13_jarj' = Case when ava13.tutkjarj is not null then ava13.tutkjarj
								when ava13.opiskjarj is not null then ava13.opiskjarj
								when ava13.opiskjarj_2 is not null then ava13.opiskjarj_2 else null end
      ,'Sarakeryhma13_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID13],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID13],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID13],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID13],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID13],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID13],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID13],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID13],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID13],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID13],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID13] is null then null
								else 'muu' end
     
      ,'Sarakeryhma14_ID' = alo.[Sarakeryhma_ID14]
      ,'Sarakeryhma14_tyyppi' = ava14.tyyppi
      --,[Sarakeryhma_arvo14]
      ,'Sarakeryhma14_opp' = ava14.opp
      ,'Sarakeryhma14_opmala' = ava14.opmala
      ,'Sarakeryhma14_opmopa' = ava14.opmopa
      ,'Sarakeryhma14_opmast' = ava14.opmast
      ,'Sarakeryhma14_opm95opa' = ava14.opm95opa
      ,'Sarakeryhma14_koulutussektori' = ava14.koulutussektori
      ,'Sarakeryhma14_suorv' = ava14.suorv
      ,'Sarakeryhma14_suorlk' = ava14.suorlk
      ,'Sarakeryhma14_kmaak' = Case when ava14.tutkmaak is not null then ava14.tutkmaak
								when ava14.kmaak is not null then ava14.kmaak
								when ava14.kmaak_2 is not null then ava14.kmaak_2 else null end
      ,'Sarakeryhma14_olotamm' = ava14.olotamm_2
      ,'Sarakeryhma14_olosyys' = ava14.olosyys_2
      ,'Sarakeryhma14_ptoim1r5' = ava14.ptoim1r5
      ,'Sarakeryhma14_amas' = ava14.amas
      ,'Sarakeryhma14_koulk' = Case when ava14.tutkkoulk is not null then ava14.tutkkoulk
								when ava14.opiskkoulk is not null then ava14.opiskkoulk
								when ava14.opiskkoulk_2 is not null then ava14.opiskkoulk_2 else null end
      ,'Sarakeryhma14_jarj' = Case when ava14.tutkjarj is not null then ava14.tutkjarj
								when ava14.opiskjarj is not null then ava14.opiskjarj
								when ava14.opiskjarj_2 is not null then ava14.opiskjarj_2 else null end
      ,'Sarakeryhma14_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID14],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID14],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID14],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID14],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID14],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID14],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID14],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID14],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID14],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID14],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID14] is null then null
								else 'muu' end
      
      ,'Sarakeryhma15_ID' = alo.[Sarakeryhma_ID15]
      ,'Sarakeryhma15_tyyppi' = ava15.tyyppi
      --,[Sarakeryhma_arvo15]
      ,'Sarakeryhma15_opp' = ava15.opp
      ,'Sarakeryhma15_opmala' = ava15.opmala
      ,'Sarakeryhma15_opmopa' = ava15.opmopa
      ,'Sarakeryhma15_opmast' = ava15.opmast
      ,'Sarakeryhma15_opm95opa' = ava15.opm95opa
      ,'Sarakeryhma15_koulutussektori' = ava15.koulutussektori
      ,'Sarakeryhma15_suorv' = ava15.suorv
      ,'Sarakeryhma15_suorlk' = ava15.suorlk
      ,'Sarakeryhma15_kmaak' = Case when ava15.tutkmaak is not null then ava15.tutkmaak
								when ava15.kmaak is not null then ava15.kmaak
								when ava15.kmaak_2 is not null then ava15.kmaak_2 else null end
      ,'Sarakeryhma15_olotamm' = ava15.olotamm_2
      ,'Sarakeryhma15_olosyys' = ava15.olosyys_2
      ,'Sarakeryhma15_ptoim1r5' = ava15.ptoim1r5
      ,'Sarakeryhma15_amas' = ava15.amas
      ,'Sarakeryhma15_koulk' = Case when ava15.tutkkoulk is not null then ava15.tutkkoulk
								when ava15.opiskkoulk is not null then ava15.opiskkoulk
								when ava15.opiskkoulk_2 is not null then ava15.opiskkoulk_2 else null end
      ,'Sarakeryhma15_jarj' = Case when ava15.tutkjarj is not null then ava15.tutkjarj
								when ava15.opiskjarj is not null then ava15.opiskjarj
								when ava15.opiskjarj_2 is not null then ava15.opiskjarj_2 else null end
      ,'Sarakeryhma15_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID15],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID15],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID15],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID15],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID15],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID15],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID15],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID15],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID15],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID15],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID15] is null then null
								else 'muu' end
      
      ,'Sarakeryhma16_ID' = alo.[Sarakeryhma_ID16]
      ,'Sarakeryhma16_tyyppi' = ava16.tyyppi
      --,[Sarakeryhma_arvo16]
      ,'Sarakeryhma16_opp' = ava16.opp
      ,'Sarakeryhma16_opmala' = ava16.opmala
      ,'Sarakeryhma16_opmopa' = ava16.opmopa
      ,'Sarakeryhma16_opmast' = ava16.opmast
      ,'Sarakeryhma16_opm95opa' = ava16.opm95opa
      ,'Sarakeryhma16_koulutussektori' = ava16.koulutussektori
      ,'Sarakeryhma16_suorv' = ava16.suorv
      ,'Sarakeryhma16_suorlk' = ava16.suorlk
      ,'Sarakeryhma16_kmaak' = Case when ava16.tutkmaak is not null then ava16.tutkmaak
								when ava16.kmaak is not null then ava16.kmaak
								when ava16.kmaak_2 is not null then ava16.kmaak_2 else null end
      ,'Sarakeryhma16_olotamm' = ava16.olotamm_2
      ,'Sarakeryhma16_olosyys' = ava16.olosyys_2
      ,'Sarakeryhma16_ptoim1r5' = ava16.ptoim1r5
      ,'Sarakeryhma16_amas' = ava16.amas
      ,'Sarakeryhma16_koulk' = Case when ava16.tutkkoulk is not null then ava16.tutkkoulk
								when ava16.opiskkoulk is not null then ava16.opiskkoulk
								when ava16.opiskkoulk_2 is not null then ava16.opiskkoulk_2 else null end
      ,'Sarakeryhma16_jarj' = Case when ava16.tutkjarj is not null then ava16.tutkjarj
								when ava16.opiskjarj is not null then ava16.opiskjarj
								when ava16.opiskjarj_2 is not null then ava16.opiskjarj_2 else null end
      ,'Sarakeryhma16_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID16],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID16],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID16],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID16],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID16],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID16],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID16],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID16],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID16],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID16],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID16] is null then null
								else 'muu' end
      
      ,'Sarakeryhma17_ID' = alo.[Sarakeryhma_ID17]
      ,'Sarakeryhma17_tyyppi' = ava17.tyyppi
      --,[Sarakeryhma_arvo17]
      ,'Sarakeryhma17_opp' = ava17.opp
      ,'Sarakeryhma17_opmala' = ava17.opmala
      ,'Sarakeryhma17_opmopa' = ava17.opmopa
      ,'Sarakeryhma17_opmast' = ava17.opmast
      ,'Sarakeryhma17_opm95opa' = ava17.opm95opa
      ,'Sarakeryhma17_koulutussektori' = ava17.koulutussektori
      ,'Sarakeryhma17_suorv' = ava17.suorv
      ,'Sarakeryhma17_suorlk' = ava17.suorlk
      ,'Sarakeryhma17_kmaak' = Case when ava17.tutkmaak is not null then ava17.tutkmaak
								when ava17.kmaak is not null then ava17.kmaak
								when ava17.kmaak_2 is not null then ava17.kmaak_2 else null end
      ,'Sarakeryhma17_olotamm' = ava17.olotamm_2
      ,'Sarakeryhma17_olosyys' = ava17.olosyys_2
      ,'Sarakeryhma17_ptoim1r5' = ava17.ptoim1r5
      ,'Sarakeryhma17_amas' = ava17.amas
      ,'Sarakeryhma17_koulk' = Case when ava17.tutkkoulk is not null then ava17.tutkkoulk
								when ava17.opiskkoulk is not null then ava17.opiskkoulk
								when ava17.opiskkoulk_2 is not null then ava17.opiskkoulk_2 else null end
      ,'Sarakeryhma17_jarj' = Case when ava17.tutkjarj is not null then ava17.tutkjarj
								when ava17.opiskjarj is not null then ava17.opiskjarj
								when ava17.opiskjarj_2 is not null then ava17.opiskjarj_2 else null end
      ,'Sarakeryhma17_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID17],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID17],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID17],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID17],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID17],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID17],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID17],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID17],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID17],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID17],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID17] is null then null
								else 'muu' end
      
      ,'Sarakeryhma18_ID' = alo.[Sarakeryhma_ID18]
      ,'Sarakeryhma18_tyyppi' = ava18.tyyppi
      --,[Sarakeryhma_arvo18]
      ,'Sarakeryhma18_opp' = ava18.opp
      ,'Sarakeryhma18_opmala' = ava18.opmala
      ,'Sarakeryhma18_opmopa' = ava18.opmopa
      ,'Sarakeryhma18_opmast' = ava18.opmast
      ,'Sarakeryhma18_opm95opa' = ava18.opm95opa
      ,'Sarakeryhma18_koulutussektori' = ava18.koulutussektori
      ,'Sarakeryhma18_suorv' = ava18.suorv
      ,'Sarakeryhma18_suorlk' = ava18.suorlk
      ,'Sarakeryhma18_kmaak' = Case when ava18.tutkmaak is not null then ava18.tutkmaak
								when ava18.kmaak is not null then ava18.kmaak
								when ava18.kmaak_2 is not null then ava18.kmaak_2 else null end
      ,'Sarakeryhma18_olotamm' = ava18.olotamm_2
      ,'Sarakeryhma18_olosyys' = ava18.olosyys_2
      ,'Sarakeryhma18_ptoim1r5' = ava18.ptoim1r5
      ,'Sarakeryhma18_amas' = ava18.amas
      ,'Sarakeryhma18_koulk' = Case when ava18.tutkkoulk is not null then ava18.tutkkoulk
								when ava18.opiskkoulk is not null then ava18.opiskkoulk
								when ava18.opiskkoulk_2 is not null then ava18.opiskkoulk_2 else null end
      ,'Sarakeryhma18_jarj' = Case when ava18.tutkjarj is not null then ava18.tutkjarj
								when ava18.opiskjarj is not null then ava18.opiskjarj
								when ava18.opiskjarj_2 is not null then ava18.opiskjarj_2 else null end
      ,'Sarakeryhma18_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID18],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID18],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID18],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID18],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID18],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID18],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID18],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID18],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID18],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID18],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID18] is null then null
								else 'muu' end
      
      ,'Sarakeryhma19_ID' = alo.[Sarakeryhma_ID19]
      ,'Sarakeryhma19_tyyppi' = ava19.tyyppi
      --,[Sarakeryhma_arvo19]
      ,'Sarakeryhma19_opp' = ava19.opp
      ,'Sarakeryhma19_opmala' = ava19.opmala
      ,'Sarakeryhma19_opmopa' = ava19.opmopa
      ,'Sarakeryhma19_opmast' = ava19.opmast
      ,'Sarakeryhma19_opm95opa' = ava19.opm95opa
      ,'Sarakeryhma19_koulutussektori' = ava19.koulutussektori
      ,'Sarakeryhma19_suorv' = ava19.suorv
      ,'Sarakeryhma19_suorlk' = ava19.suorlk
      ,'Sarakeryhma19_kmaak' = Case when ava19.tutkmaak is not null then ava19.tutkmaak
								when ava19.kmaak is not null then ava19.kmaak
								when ava19.kmaak_2 is not null then ava19.kmaak_2 else null end
      ,'Sarakeryhma19_olotamm' = ava19.olotamm_2
      ,'Sarakeryhma19_olosyys' = ava19.olosyys_2
      ,'Sarakeryhma19_ptoim1r5' = ava19.ptoim1r5
      ,'Sarakeryhma19_amas' = ava19.amas
      ,'Sarakeryhma19_koulk' = Case when ava19.tutkkoulk is not null then ava19.tutkkoulk
								when ava19.opiskkoulk is not null then ava19.opiskkoulk
								when ava19.opiskkoulk_2 is not null then ava19.opiskkoulk_2 else null end
      ,'Sarakeryhma19_jarj' = Case when ava19.tutkjarj is not null then ava19.tutkjarj
								when ava19.opiskjarj is not null then ava19.opiskjarj
								when ava19.opiskjarj_2 is not null then ava19.opiskjarj_2 else null end
      ,'Sarakeryhma19_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID19],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID19],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID19],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID19],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID19],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID19],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID19],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID19],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID19],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID19],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID19] is null then null
								else 'muu' end
      
      ,'Sarakeryhma20_ID' = alo.[Sarakeryhma_ID20]
      ,'Sarakeryhma20_tyyppi' = ava20.tyyppi
      --,[Sarakeryhma_arvo20]
      ,'Sarakeryhma20_opp' = ava20.opp
      ,'Sarakeryhma20_opmala' = ava20.opmala
      ,'Sarakeryhma20_opmopa' = ava20.opmopa
      ,'Sarakeryhma20_opmast' = ava20.opmast
      ,'Sarakeryhma20_opm95opa' = ava20.opm95opa
      ,'Sarakeryhma20_koulutussektori' = ava20.koulutussektori
      ,'Sarakeryhma20_suorv' = ava20.suorv
      ,'Sarakeryhma20_suorlk' = ava20.suorlk
      ,'Sarakeryhma20_kmaak' = Case when ava20.tutkmaak is not null then ava20.tutkmaak
								when ava20.kmaak is not null then ava20.kmaak
								when ava20.kmaak_2 is not null then ava20.kmaak_2 else null end
      ,'Sarakeryhma20_olotamm' = ava20.olotamm_2
      ,'Sarakeryhma20_olosyys' = ava20.olosyys_2
      ,'Sarakeryhma20_ptoim1r5' = ava20.ptoim1r5
      ,'Sarakeryhma20_amas' = ava20.amas
      ,'Sarakeryhma20_koulk' = Case when ava20.tutkkoulk is not null then ava20.tutkkoulk
								when ava20.opiskkoulk is not null then ava20.opiskkoulk
								when ava20.opiskkoulk_2 is not null then ava20.opiskkoulk_2 else null end
      ,'Sarakeryhma20_jarj' = Case when ava20.tutkjarj is not null then ava20.tutkjarj
								when ava20.opiskjarj is not null then ava20.opiskjarj
								when ava20.opiskjarj_2 is not null then ava20.opiskjarj_2 else null end
      ,'Sarakeryhma20_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID20],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID20],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID20],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID20],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID20],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID20],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID20],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID20],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID20],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID20],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID20] is null then null
								else 'muu' end
      
      ,'Sarakeryhma21_ID' = alo.[Sarakeryhma_ID21]
      ,'Sarakeryhma21_tyyppi' = ava21.tyyppi
      --,[Sarakeryhma_arvo21]
      ,'Sarakeryhma21_opp' = ava21.opp
      ,'Sarakeryhma21_opmala' = ava21.opmala
      ,'Sarakeryhma21_opmopa' = ava21.opmopa
      ,'Sarakeryhma21_opmast' = ava21.opmast
      ,'Sarakeryhma21_opm95opa' = ava21.opm95opa
      ,'Sarakeryhma21_koulutussektori' = ava21.koulutussektori
      ,'Sarakeryhma21_suorv' = ava21.suorv
      ,'Sarakeryhma21_suorlk' = ava21.suorlk
      ,'Sarakeryhma21_kmaak' = Case when ava21.tutkmaak is not null then ava21.tutkmaak
								when ava21.kmaak is not null then ava21.kmaak
								when ava21.kmaak_2 is not null then ava21.kmaak_2 else null end
      ,'Sarakeryhma21_olotamm' = ava21.olotamm_2
      ,'Sarakeryhma21_olosyys' = ava21.olosyys_2
      ,'Sarakeryhma21_ptoim1r5' = ava21.ptoim1r5
      ,'Sarakeryhma21_amas' = ava21.amas
      ,'Sarakeryhma21_koulk' = Case when ava21.tutkkoulk is not null then ava21.tutkkoulk
								when ava21.opiskkoulk is not null then ava21.opiskkoulk
								when ava21.opiskkoulk_2 is not null then ava21.opiskkoulk_2 else null end
      ,'Sarakeryhma21_jarj' = Case when ava21.tutkjarj is not null then ava21.tutkjarj
								when ava21.opiskjarj is not null then ava21.opiskjarj
								when ava21.opiskjarj_2 is not null then ava21.opiskjarj_2 else null end
      ,'Sarakeryhma21_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID21],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID21],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID21],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID21],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID21],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID21],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID21],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID21],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID21],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID21],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID21] is null then null
								else 'muu' end
      
      ,'Sarakeryhma22_ID' = alo.[Sarakeryhma_ID22]
      ,'Sarakeryhma22_tyyppi' = ava22.tyyppi
      --,[Sarakeryhma_arvo22]
      ,'Sarakeryhma22_opp' = ava22.opp
      ,'Sarakeryhma22_opmala' = ava22.opmala
      ,'Sarakeryhma22_opmopa' = ava22.opmopa
      ,'Sarakeryhma22_opmast' = ava22.opmast
      ,'Sarakeryhma22_opm95opa' = ava22.opm95opa
      ,'Sarakeryhma22_koulutussektori' = ava22.koulutussektori
      ,'Sarakeryhma22_suorv' = ava22.suorv
      ,'Sarakeryhma22_suorlk' = ava22.suorlk
      ,'Sarakeryhma22_kmaak' = Case when ava22.tutkmaak is not null then ava22.tutkmaak
								when ava22.kmaak is not null then ava22.kmaak
								when ava22.kmaak_2 is not null then ava22.kmaak_2 else null end
      ,'Sarakeryhma22_olotamm' = ava22.olotamm_2
      ,'Sarakeryhma22_olosyys' = ava22.olosyys_2
      ,'Sarakeryhma22_ptoim1r5' = ava22.ptoim1r5
      ,'Sarakeryhma22_amas' = ava22.amas
      ,'Sarakeryhma22_koulk' = Case when ava22.tutkkoulk is not null then ava22.tutkkoulk
								when ava22.opiskkoulk is not null then ava22.opiskkoulk
								when ava22.opiskkoulk_2 is not null then ava22.opiskkoulk_2 else null end
      ,'Sarakeryhma22_jarj' = Case when ava22.tutkjarj is not null then ava22.tutkjarj
								when ava22.opiskjarj is not null then ava22.opiskjarj
								when ava22.opiskjarj_2 is not null then ava22.opiskjarj_2 else null end
      ,'Sarakeryhma22_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID22],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID22],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID22],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID22],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID22],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID22],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID22],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID22],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID22],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID22],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID22] is null then null
								else 'muu' end
      
      ,'Sarakeryhma23_ID' = alo.[Sarakeryhma_ID23]
      ,'Sarakeryhma23_tyyppi' = ava23.tyyppi
      --,[Sarakeryhma_arvo23]
      ,'Sarakeryhma23_opp' = ava23.opp
      ,'Sarakeryhma23_opmala' = ava23.opmala
      ,'Sarakeryhma23_opmopa' = ava23.opmopa
      ,'Sarakeryhma23_opmast' = ava23.opmast
      ,'Sarakeryhma23_opm95opa' = ava23.opm95opa
      ,'Sarakeryhma23_koulutussektori' = ava23.koulutussektori
      ,'Sarakeryhma23_suorv' = ava23.suorv
      ,'Sarakeryhma23_suorlk' = ava23.suorlk
      ,'Sarakeryhma23_kmaak' = Case when ava23.tutkmaak is not null then ava23.tutkmaak
								when ava23.kmaak is not null then ava23.kmaak
								when ava23.kmaak_2 is not null then ava23.kmaak_2 else null end
      ,'Sarakeryhma23_olotamm' = ava23.olotamm_2
      ,'Sarakeryhma23_olosyys' = ava23.olosyys_2
      ,'Sarakeryhma23_ptoim1r5' = ava23.ptoim1r5
      ,'Sarakeryhma23_amas' = ava23.amas
      ,'Sarakeryhma23_koulk' = Case when ava23.tutkkoulk is not null then ava23.tutkkoulk
								when ava23.opiskkoulk is not null then ava23.opiskkoulk
								when ava23.opiskkoulk_2 is not null then ava23.opiskkoulk_2 else null end
      ,'Sarakeryhma23_jarj' = Case when ava23.tutkjarj is not null then ava23.tutkjarj
								when ava23.opiskjarj is not null then ava23.opiskjarj
								when ava23.opiskjarj_2 is not null then ava23.opiskjarj_2 else null end
      ,'Sarakeryhma23_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID23],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID23],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID23],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID23],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID23],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID23],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID23],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID23],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID23],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID23],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID23] is null then null
								else 'muu' end
      
      ,'Sarakeryhma24_ID' = alo.[Sarakeryhma_ID24]
      ,'Sarakeryhma24_tyyppi' = ava24.tyyppi
      --,[Sarakeryhma_arvo24]
      ,'Sarakeryhma24_opp' = ava24.opp
      ,'Sarakeryhma24_opmala' = ava24.opmala
      ,'Sarakeryhma24_opmopa' = ava24.opmopa
      ,'Sarakeryhma24_opmast' = ava24.opmast
      ,'Sarakeryhma24_opm95opa' = ava24.opm95opa
      ,'Sarakeryhma24_koulutussektori' = ava24.koulutussektori
      ,'Sarakeryhma24_suorv' = ava24.suorv
      ,'Sarakeryhma24_suorlk' = ava24.suorlk
      ,'Sarakeryhma24_kmaak' = Case when ava24.tutkmaak is not null then ava24.tutkmaak
								when ava24.kmaak is not null then ava24.kmaak
								when ava24.kmaak_2 is not null then ava24.kmaak_2 else null end
      ,'Sarakeryhma24_olotamm' = ava24.olotamm_2
      ,'Sarakeryhma24_olosyys' = ava24.olosyys_2
      ,'Sarakeryhma24_ptoim1r5' = ava24.ptoim1r5
      ,'Sarakeryhma24_amas' = ava24.amas
      ,'Sarakeryhma24_koulk' = Case when ava24.tutkkoulk is not null then ava24.tutkkoulk
								when ava24.opiskkoulk is not null then ava24.opiskkoulk
								when ava24.opiskkoulk_2 is not null then ava24.opiskkoulk_2 else null end
      ,'Sarakeryhma24_jarj' = Case when ava24.tutkjarj is not null then ava24.tutkjarj
								when ava24.opiskjarj is not null then ava24.opiskjarj
								when ava24.opiskjarj_2 is not null then ava24.opiskjarj_2 else null end
      ,'Sarakeryhma24_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID24],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID24],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID24],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID24],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID24],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID24],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID24],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID24],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID24],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID24],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID24] is null then null
								else 'muu' end
      
      ,'Sarakeryhma25_ID' = alo.[Sarakeryhma_ID25]
      ,'Sarakeryhma25_tyyppi' = ava25.tyyppi
      --,[Sarakeryhma_arvo25]
      ,'Sarakeryhma25_opp' = ava25.opp
      ,'Sarakeryhma25_opmala' = ava25.opmala
      ,'Sarakeryhma25_opmopa' = ava25.opmopa
      ,'Sarakeryhma25_opmast' = ava25.opmast
      ,'Sarakeryhma25_opm95opa' = ava25.opm95opa
      ,'Sarakeryhma25_koulutussektori' = ava25.koulutussektori
      ,'Sarakeryhma25_suorv' = ava25.suorv
      ,'Sarakeryhma25_suorlk' = ava25.suorlk
      ,'Sarakeryhma25_kmaak' = Case when ava25.tutkmaak is not null then ava25.tutkmaak
								when ava25.kmaak is not null then ava25.kmaak
								when ava25.kmaak_2 is not null then ava25.kmaak_2 else null end
      ,'Sarakeryhma25_olotamm' = ava25.olotamm_2
      ,'Sarakeryhma25_olosyys' = ava25.olosyys_2
      ,'Sarakeryhma25_ptoim1r5' = ava25.ptoim1r5
      ,'Sarakeryhma25_amas' = ava25.amas
      ,'Sarakeryhma25_koulk' = Case when ava25.tutkkoulk is not null then ava25.tutkkoulk
								when ava25.opiskkoulk is not null then ava25.opiskkoulk
								when ava25.opiskkoulk_2 is not null then ava25.opiskkoulk_2 else null end
      ,'Sarakeryhma25_jarj' = Case when ava25.tutkjarj is not null then ava25.tutkjarj
								when ava25.opiskjarj is not null then ava25.opiskjarj
								when ava25.opiskjarj_2 is not null then ava25.opiskjarj_2 else null end
      ,'Sarakeryhma25_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID25],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID25],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID25],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID25],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID25],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID25],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID25],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID25],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID25],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID25],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID25] is null then null
								else 'muu' end
      
      ,'Sarakeryhma26_ID' = alo.[Sarakeryhma_ID26]
      ,'Sarakeryhma26_tyyppi' = ava26.tyyppi
      --,[Sarakeryhma_arvo26]
      ,'Sarakeryhma26_opp' = ava26.opp
      ,'Sarakeryhma26_opmala' = ava26.opmala
      ,'Sarakeryhma26_opmopa' = ava26.opmopa
      ,'Sarakeryhma26_opmast' = ava26.opmast
      ,'Sarakeryhma26_opm95opa' = ava26.opm95opa
      ,'Sarakeryhma26_koulutussektori' = ava26.koulutussektori
      ,'Sarakeryhma26_suorv' = ava26.suorv
      ,'Sarakeryhma26_suorlk' = ava26.suorlk
      ,'Sarakeryhma26_kmaak' = Case when ava26.tutkmaak is not null then ava26.tutkmaak
								when ava26.kmaak is not null then ava26.kmaak
								when ava26.kmaak_2 is not null then ava26.kmaak_2 else null end
      ,'Sarakeryhma26_olotamm' = ava26.olotamm_2
      ,'Sarakeryhma26_olosyys' = ava26.olosyys_2
      ,'Sarakeryhma26_ptoim1r5' = ava26.ptoim1r5
      ,'Sarakeryhma26_amas' = ava26.amas
      ,'Sarakeryhma26_koulk' = Case when ava26.tutkkoulk is not null then ava26.tutkkoulk
								when ava26.opiskkoulk is not null then ava26.opiskkoulk
								when ava26.opiskkoulk_2 is not null then ava26.opiskkoulk_2 else null end
      ,'Sarakeryhma26_jarj' = Case when ava26.tutkjarj is not null then ava26.tutkjarj
								when ava26.opiskjarj is not null then ava26.opiskjarj
								when ava26.opiskjarj_2 is not null then ava26.opiskjarj_2 else null end
      ,'Sarakeryhma26_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID26],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID26],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID26],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID26],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID26],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID26],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID26],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID26],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID26],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID26],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID26] is null then null
								else 'muu' end
      
      ,'Sarakeryhma27_ID' = alo.[Sarakeryhma_ID27]
      ,'Sarakeryhma27_tyyppi' = ava27.tyyppi
      --,[Sarakeryhma_arvo27]
      ,'Sarakeryhma27_opp' = ava27.opp
      ,'Sarakeryhma27_opmala' = ava27.opmala
      ,'Sarakeryhma27_opmopa' = ava27.opmopa
      ,'Sarakeryhma27_opmast' = ava27.opmast
      ,'Sarakeryhma27_opm95opa' = ava27.opm95opa
      ,'Sarakeryhma27_koulutussektori' = ava27.koulutussektori
      ,'Sarakeryhma27_suorv' = ava27.suorv
      ,'Sarakeryhma27_suorlk' = ava27.suorlk
      ,'Sarakeryhma27_kmaak' = Case when ava27.tutkmaak is not null then ava27.tutkmaak
								when ava27.kmaak is not null then ava27.kmaak
								when ava27.kmaak_2 is not null then ava27.kmaak_2 else null end
      ,'Sarakeryhma27_olotamm' = ava27.olotamm_2
      ,'Sarakeryhma27_olosyys' = ava27.olosyys_2
      ,'Sarakeryhma27_ptoim1r5' = ava27.ptoim1r5
      ,'Sarakeryhma27_amas' = ava27.amas
      ,'Sarakeryhma27_koulk' = Case when ava27.tutkkoulk is not null then ava27.tutkkoulk
								when ava27.opiskkoulk is not null then ava27.opiskkoulk
								when ava27.opiskkoulk_2 is not null then ava27.opiskkoulk_2 else null end
      ,'Sarakeryhma27_jarj' = Case when ava27.tutkjarj is not null then ava27.tutkjarj
								when ava27.opiskjarj is not null then ava27.opiskjarj
								when ava27.opiskjarj_2 is not null then ava27.opiskjarj_2 else null end
      ,'Sarakeryhma27_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID27],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID27],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID27],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID27],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID27],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID27],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID27],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID27],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID27],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID27],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID27] is null then null
								else 'muu' end
      
      ,'Sarakeryhma28_ID' = alo.[Sarakeryhma_ID28]
      ,'Sarakeryhma28_tyyppi' = ava28.tyyppi
      --,[Sarakeryhma_arvo28]
      ,'Sarakeryhma28_opp' = ava28.opp
      ,'Sarakeryhma28_opmala' = ava28.opmala
      ,'Sarakeryhma28_opmopa' = ava28.opmopa
      ,'Sarakeryhma28_opmast' = ava28.opmast
      ,'Sarakeryhma28_opm95opa' = ava28.opm95opa
      ,'Sarakeryhma28_koulutussektori' = ava28.koulutussektori
      ,'Sarakeryhma28_suorv' = ava28.suorv
      ,'Sarakeryhma28_suorlk' = ava28.suorlk
      ,'Sarakeryhma28_kmaak' = Case when ava28.tutkmaak is not null then ava28.tutkmaak
								when ava28.kmaak is not null then ava28.kmaak
								when ava28.kmaak_2 is not null then ava28.kmaak_2 else null end
      ,'Sarakeryhma28_olotamm' = ava28.olotamm_2
      ,'Sarakeryhma28_olosyys' = ava28.olosyys_2
      ,'Sarakeryhma28_ptoim1r5' = ava28.ptoim1r5
      ,'Sarakeryhma28_amas' = ava28.amas
      ,'Sarakeryhma28_koulk' = Case when ava28.tutkkoulk is not null then ava28.tutkkoulk
								when ava28.opiskkoulk is not null then ava28.opiskkoulk
								when ava28.opiskkoulk_2 is not null then ava28.opiskkoulk_2 else null end
      ,'Sarakeryhma28_jarj' = Case when ava28.tutkjarj is not null then ava28.tutkjarj
								when ava28.opiskjarj is not null then ava28.opiskjarj
								when ava28.opiskjarj_2 is not null then ava28.opiskjarj_2 else null end
      ,'Sarakeryhma28_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID28],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID28],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID28],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID28],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID28],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID28],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID28],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID28],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID28],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID28],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID28] is null then null
								else 'muu' end
      
      ,'Sarakeryhma29_ID' = alo.[Sarakeryhma_ID29]
      ,'Sarakeryhma29_tyyppi' = ava29.tyyppi
      --,[Sarakeryhma_arvo29]
      ,'Sarakeryhma29_opp' = ava29.opp
      ,'Sarakeryhma29_opmala' = ava29.opmala
      ,'Sarakeryhma29_opmopa' = ava29.opmopa
      ,'Sarakeryhma29_opmast' = ava29.opmast
      ,'Sarakeryhma29_opm95opa' = ava29.opm95opa
      ,'Sarakeryhma29_koulutussektori' = ava29.koulutussektori
      ,'Sarakeryhma29_suorv' = ava29.suorv
      ,'Sarakeryhma29_suorlk' = ava29.suorlk
      ,'Sarakeryhma29_kmaak' = Case when ava29.tutkmaak is not null then ava29.tutkmaak
								when ava29.kmaak is not null then ava29.kmaak
								when ava29.kmaak_2 is not null then ava29.kmaak_2 else null end
      ,'Sarakeryhma29_olotamm' = ava29.olotamm_2
      ,'Sarakeryhma29_olosyys' = ava29.olosyys_2
      ,'Sarakeryhma29_ptoim1r5' = ava29.ptoim1r5
      ,'Sarakeryhma29_amas' = ava29.amas
      ,'Sarakeryhma29_koulk' = Case when ava29.tutkkoulk is not null then ava29.tutkkoulk
								when ava29.opiskkoulk is not null then ava29.opiskkoulk
								when ava29.opiskkoulk_2 is not null then ava29.opiskkoulk_2 else null end
      ,'Sarakeryhma29_jarj' = Case when ava29.tutkjarj is not null then ava29.tutkjarj
								when ava29.opiskjarj is not null then ava29.opiskjarj
								when ava29.opiskjarj_2 is not null then ava29.opiskjarj_2 else null end
      ,'Sarakeryhma29_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID29],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID29],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID29],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID29],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID29],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID29],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID29],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID29],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID29],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID29],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID29] is null then null
								else 'muu' end
      
      ,'Sarakeryhma30_ID' = alo.[Sarakeryhma_ID30]
      ,'Sarakeryhma30_tyyppi' = ava30.tyyppi
      --,[Sarakeryhma_arvo30]
      ,'Sarakeryhma30_opp' = ava30.opp
      ,'Sarakeryhma30_opmala' = ava30.opmala
      ,'Sarakeryhma30_opmopa' = ava30.opmopa
      ,'Sarakeryhma30_opmast' = ava30.opmast
      ,'Sarakeryhma30_opm95opa' = ava30.opm95opa
      ,'Sarakeryhma30_koulutussektori' = ava30.koulutussektori
      ,'Sarakeryhma30_suorv' = ava30.suorv
      ,'Sarakeryhma30_suorlk' = ava30.suorlk
      ,'Sarakeryhma30_kmaak' = Case when ava30.tutkmaak is not null then ava30.tutkmaak
								when ava30.kmaak is not null then ava30.kmaak
								when ava30.kmaak_2 is not null then ava30.kmaak_2 else null end
      ,'Sarakeryhma30_olotamm' = ava30.olotamm_2
      ,'Sarakeryhma30_olosyys' = ava30.olosyys_2
      ,'Sarakeryhma30_ptoim1r5' = ava30.ptoim1r5
      ,'Sarakeryhma30_amas' = ava30.amas
      ,'Sarakeryhma30_koulk' = Case when ava30.tutkkoulk is not null then ava30.tutkkoulk
								when ava30.opiskkoulk is not null then ava30.opiskkoulk
								when ava30.opiskkoulk_2 is not null then ava30.opiskkoulk_2 else null end
      ,'Sarakeryhma30_jarj' = Case when ava30.tutkjarj is not null then ava30.tutkjarj
								when ava30.opiskjarj is not null then ava30.opiskjarj
								when ava30.opiskjarj_2 is not null then ava30.opiskjarj_2 else null end
      ,'Sarakeryhma30_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID30],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID30],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID30],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID30],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID30],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID30],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID30],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID30],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID30],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID30],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID30] is null then null
								else 'muu' end
      
      ,'Sarakeryhma31_ID' = alo.[Sarakeryhma_ID31]
      ,'Sarakeryhma31_tyyppi' = ava31.tyyppi
      --,[Sarakeryhma_arvo31]
      ,'Sarakeryhma31_opp' = ava31.opp
      ,'Sarakeryhma31_opmala' = ava31.opmala
      ,'Sarakeryhma31_opmopa' = ava31.opmopa
      ,'Sarakeryhma31_opmast' = ava31.opmast
      ,'Sarakeryhma31_opm95opa' = ava31.opm95opa
      ,'Sarakeryhma31_koulutussektori' = ava31.koulutussektori
      ,'Sarakeryhma31_suorv' = ava31.suorv
      ,'Sarakeryhma31_suorlk' = ava31.suorlk
      ,'Sarakeryhma31_kmaak' = Case when ava31.tutkmaak is not null then ava31.tutkmaak
								when ava31.kmaak is not null then ava31.kmaak
								when ava31.kmaak_2 is not null then ava31.kmaak_2 else null end
      ,'Sarakeryhma31_olotamm' = ava31.olotamm_2
      ,'Sarakeryhma31_olosyys' = ava31.olosyys_2
      ,'Sarakeryhma31_ptoim1r5' = ava31.ptoim1r5
      ,'Sarakeryhma31_amas' = ava31.amas
      ,'Sarakeryhma31_koulk' = Case when ava31.tutkkoulk is not null then ava31.tutkkoulk
								when ava31.opiskkoulk is not null then ava31.opiskkoulk
								when ava31.opiskkoulk_2 is not null then ava31.opiskkoulk_2 else null end
      ,'Sarakeryhma31_jarj' = Case when ava31.tutkjarj is not null then ava31.tutkjarj
								when ava31.opiskjarj is not null then ava31.opiskjarj
								when ava31.opiskjarj_2 is not null then ava31.opiskjarj_2 else null end
      ,'Sarakeryhma31_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID31],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID31],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID31],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID31],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID31],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID31],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID31],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID31],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID31],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID31],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID31] is null then null
								else 'muu' end
      
      ,'Sarakeryhma32_ID' = alo.[Sarakeryhma_ID32]
      ,'Sarakeryhma32_tyyppi' = ava32.tyyppi
      --,[Sarakeryhma_arvo32]
      ,'Sarakeryhma32_opp' = ava32.opp
      ,'Sarakeryhma32_opmala' = ava32.opmala
      ,'Sarakeryhma32_opmopa' = ava32.opmopa
      ,'Sarakeryhma32_opmast' = ava32.opmast
      ,'Sarakeryhma32_opm95opa' = ava32.opm95opa
      ,'Sarakeryhma32_koulutussektori' = ava32.koulutussektori
      ,'Sarakeryhma32_suorv' = ava32.suorv
      ,'Sarakeryhma32_suorlk' = ava32.suorlk
      ,'Sarakeryhma32_kmaak' = Case when ava32.tutkmaak is not null then ava32.tutkmaak
								when ava32.kmaak is not null then ava32.kmaak
								when ava32.kmaak_2 is not null then ava32.kmaak_2 else null end
      ,'Sarakeryhma32_olotamm' = ava32.olotamm_2
      ,'Sarakeryhma32_olosyys' = ava32.olosyys_2
      ,'Sarakeryhma32_ptoim1r5' = ava32.ptoim1r5
      ,'Sarakeryhma32_amas' = ava32.amas
      ,'Sarakeryhma32_koulk' = Case when ava32.tutkkoulk is not null then ava32.tutkkoulk
								when ava32.opiskkoulk is not null then ava32.opiskkoulk
								when ava32.opiskkoulk_2 is not null then ava32.opiskkoulk_2 else null end
      ,'Sarakeryhma32_jarj' = Case when ava32.tutkjarj is not null then ava32.tutkjarj
								when ava32.opiskjarj is not null then ava32.opiskjarj
								when ava32.opiskjarj_2 is not null then ava32.opiskjarj_2 else null end
      ,'Sarakeryhma32_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID32],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID32],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID32],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID32],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID32],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID32],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID32],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID32],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID32],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID32],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID32] is null then null
								else 'muu' end
      
      ,'Sarakeryhma33_ID' = alo.[Sarakeryhma_ID33]
      ,'Sarakeryhma33_tyyppi' = ava33.tyyppi
      --,[Sarakeryhma_arvo33]
      ,'Sarakeryhma33_opp' = ava33.opp
      ,'Sarakeryhma33_opmala' = ava33.opmala
      ,'Sarakeryhma33_opmopa' = ava33.opmopa
      ,'Sarakeryhma33_opmast' = ava33.opmast
      ,'Sarakeryhma33_opm95opa' = ava33.opm95opa
      ,'Sarakeryhma33_koulutussektori' = ava33.koulutussektori
      ,'Sarakeryhma33_suorv' = ava33.suorv
      ,'Sarakeryhma33_suorlk' = ava33.suorlk
      ,'Sarakeryhma33_kmaak' = Case when ava33.tutkmaak is not null then ava33.tutkmaak
								when ava33.kmaak is not null then ava33.kmaak
								when ava33.kmaak_2 is not null then ava33.kmaak_2 else null end
      ,'Sarakeryhma33_olotamm' = ava33.olotamm_2
      ,'Sarakeryhma33_olosyys' = ava33.olosyys_2
      ,'Sarakeryhma33_ptoim1r5' = ava33.ptoim1r5
      ,'Sarakeryhma33_amas' = ava33.amas
      ,'Sarakeryhma33_koulk' = Case when ava33.tutkkoulk is not null then ava33.tutkkoulk
								when ava33.opiskkoulk is not null then ava33.opiskkoulk
								when ava33.opiskkoulk_2 is not null then ava33.opiskkoulk_2 else null end
      ,'Sarakeryhma33_jarj' = Case when ava33.tutkjarj is not null then ava33.tutkjarj
								when ava33.opiskjarj is not null then ava33.opiskjarj
								when ava33.opiskjarj_2 is not null then ava33.opiskjarj_2 else null end
      ,'Sarakeryhma33_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID33],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID33],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID33],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID33],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID33],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID33],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID33],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID33],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID33],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID33],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID33] is null then null
								else 'muu' end
      
      ,'Sarakeryhma34_ID' = alo.[Sarakeryhma_ID34]
      ,'Sarakeryhma34_tyyppi' = ava34.tyyppi
      --,[Sarakeryhma_arvo34]
      ,'Sarakeryhma34_opp' = ava34.opp
      ,'Sarakeryhma34_opmala' = ava34.opmala
      ,'Sarakeryhma34_opmopa' = ava34.opmopa
      ,'Sarakeryhma34_opmast' = ava34.opmast
      ,'Sarakeryhma34_opm95opa' = ava34.opm95opa
      ,'Sarakeryhma34_koulutussektori' = ava34.koulutussektori
      ,'Sarakeryhma34_suorv' = ava34.suorv
      ,'Sarakeryhma34_suorlk' = ava34.suorlk
      ,'Sarakeryhma34_kmaak' = Case when ava34.tutkmaak is not null then ava34.tutkmaak
								when ava34.kmaak is not null then ava34.kmaak
								when ava34.kmaak_2 is not null then ava34.kmaak_2 else null end
      ,'Sarakeryhma34_olotamm' = ava34.olotamm_2
      ,'Sarakeryhma34_olosyys' = ava34.olosyys_2
      ,'Sarakeryhma34_ptoim1r5' = ava34.ptoim1r5
      ,'Sarakeryhma34_amas' = ava34.amas
      ,'Sarakeryhma34_koulk' = Case when ava34.tutkkoulk is not null then ava34.tutkkoulk
								when ava34.opiskkoulk is not null then ava34.opiskkoulk
								when ava34.opiskkoulk_2 is not null then ava34.opiskkoulk_2 else null end
      ,'Sarakeryhma34_jarj' = Case when ava34.tutkjarj is not null then ava34.tutkjarj
								when ava34.opiskjarj is not null then ava34.opiskjarj
								when ava34.opiskjarj_2 is not null then ava34.opiskjarj_2 else null end
      ,'Sarakeryhma34_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID34],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID34],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID34],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID34],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID34],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID34],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID34],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID34],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID34],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID34],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID34] is null then null
								else 'muu' end
      
      ,'Sarakeryhma35_ID' = alo.[Sarakeryhma_ID35]
      ,'Sarakeryhma35_tyyppi' = ava35.tyyppi
      --,[Sarakeryhma_arvo35]
      ,'Sarakeryhma35_opp' = ava35.opp
      ,'Sarakeryhma35_opmala' = ava35.opmala
      ,'Sarakeryhma35_opmopa' = ava35.opmopa
      ,'Sarakeryhma35_opmast' = ava35.opmast
      ,'Sarakeryhma35_opm95opa' = ava35.opm95opa
      ,'Sarakeryhma35_koulutussektori' = ava35.koulutussektori
      ,'Sarakeryhma35_suorv' = ava35.suorv
      ,'Sarakeryhma35_suorlk' = ava35.suorlk
      ,'Sarakeryhma35_kmaak' = Case when ava35.tutkmaak is not null then ava35.tutkmaak
								when ava35.kmaak is not null then ava35.kmaak
								when ava35.kmaak_2 is not null then ava35.kmaak_2 else null end
      ,'Sarakeryhma35_olotamm' = ava35.olotamm_2
      ,'Sarakeryhma35_olosyys' = ava35.olosyys_2
      ,'Sarakeryhma35_ptoim1r5' = ava35.ptoim1r5
      ,'Sarakeryhma35_amas' = ava35.amas
      ,'Sarakeryhma35_koulk' = Case when ava35.tutkkoulk is not null then ava35.tutkkoulk
								when ava35.opiskkoulk is not null then ava35.opiskkoulk
								when ava35.opiskkoulk_2 is not null then ava35.opiskkoulk_2 else null end
      ,'Sarakeryhma35_jarj' = Case when ava35.tutkjarj is not null then ava35.tutkjarj
								when ava35.opiskjarj is not null then ava35.opiskjarj
								when ava35.opiskjarj_2 is not null then ava35.opiskjarj_2 else null end
      ,'Sarakeryhma35_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID35],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID35],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID35],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID35],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID35],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID35],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID35],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID35],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID35],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID35],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID35] is null then null
								else 'muu' end
      
      ,'Sarakeryhma36_ID' = alo.[Sarakeryhma_ID36]
      ,'Sarakeryhma36_tyyppi' = ava36.tyyppi
      --,[Sarakeryhma_arvo36]
      ,'Sarakeryhma36_opp' = ava36.opp
      ,'Sarakeryhma36_opmala' = ava36.opmala
      ,'Sarakeryhma36_opmopa' = ava36.opmopa
      ,'Sarakeryhma36_opmast' = ava36.opmast
      ,'Sarakeryhma36_opm95opa' = ava36.opm95opa
      ,'Sarakeryhma36_koulutussektori' = ava36.koulutussektori
      ,'Sarakeryhma36_suorv' = ava36.suorv
      ,'Sarakeryhma36_suorlk' = ava36.suorlk
      ,'Sarakeryhma36_kmaak' = Case when ava36.tutkmaak is not null then ava36.tutkmaak
								when ava36.kmaak is not null then ava36.kmaak
								when ava36.kmaak_2 is not null then ava36.kmaak_2 else null end
      ,'Sarakeryhma36_olotamm' = ava36.olotamm_2
      ,'Sarakeryhma36_olosyys' = ava36.olosyys_2
      ,'Sarakeryhma36_ptoim1r5' = ava36.ptoim1r5
      ,'Sarakeryhma36_amas' = ava36.amas
      ,'Sarakeryhma36_koulk' = Case when ava36.tutkkoulk is not null then ava36.tutkkoulk
								when ava36.opiskkoulk is not null then ava36.opiskkoulk
								when ava36.opiskkoulk_2 is not null then ava36.opiskkoulk_2 else null end
      ,'Sarakeryhma36_jarj' = Case when ava36.tutkjarj is not null then ava36.tutkjarj
								when ava36.opiskjarj is not null then ava36.opiskjarj
								when ava36.opiskjarj_2 is not null then ava36.opiskjarj_2 else null end
      ,'Sarakeryhma36_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID36],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID36],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID36],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID36],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID36],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID36],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID36],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID36],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID36],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID36],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID36] is null then null
								else 'muu' end
      
      ,'Sarakeryhma37_ID' = alo.[Sarakeryhma_ID37]
      ,'Sarakeryhma37_tyyppi' = ava37.tyyppi
      --,[Sarakeryhma_arvo37]
      ,'Sarakeryhma37_opp' = ava37.opp
      ,'Sarakeryhma37_opmala' = ava37.opmala
      ,'Sarakeryhma37_opmopa' = ava37.opmopa
      ,'Sarakeryhma37_opmast' = ava37.opmast
      ,'Sarakeryhma37_opm95opa' = ava37.opm95opa
      ,'Sarakeryhma37_koulutussektori' = ava37.koulutussektori
      ,'Sarakeryhma37_suorv' = ava37.suorv
      ,'Sarakeryhma37_suorlk' = ava37.suorlk
      ,'Sarakeryhma37_kmaak' = Case when ava37.tutkmaak is not null then ava37.tutkmaak
								when ava37.kmaak is not null then ava37.kmaak
								when ava37.kmaak_2 is not null then ava37.kmaak_2 else null end
      ,'Sarakeryhma37_olotamm' = ava37.olotamm_2
      ,'Sarakeryhma37_olosyys' = ava37.olosyys_2
      ,'Sarakeryhma37_ptoim1r5' = ava37.ptoim1r5
      ,'Sarakeryhma37_amas' = ava37.amas
      ,'Sarakeryhma37_koulk' = Case when ava37.tutkkoulk is not null then ava37.tutkkoulk
								when ava37.opiskkoulk is not null then ava37.opiskkoulk
								when ava37.opiskkoulk_2 is not null then ava37.opiskkoulk_2 else null end
      ,'Sarakeryhma37_jarj' = Case when ava37.tutkjarj is not null then ava37.tutkjarj
								when ava37.opiskjarj is not null then ava37.opiskjarj
								when ava37.opiskjarj_2 is not null then ava37.opiskjarj_2 else null end
      ,'Sarakeryhma37_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID37],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID37],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID37],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID37],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID37],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID37],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID37],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID37],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID37],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID37],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID37] is null then null
								else 'muu' end
      
      ,'Sarakeryhma38_ID' = alo.[Sarakeryhma_ID38]
      ,'Sarakeryhma38_tyyppi' = ava38.tyyppi
      --,[Sarakeryhma_arvo38]
      ,'Sarakeryhma38_opp' = ava38.opp
      ,'Sarakeryhma38_opmala' = ava38.opmala
      ,'Sarakeryhma38_opmopa' = ava38.opmopa
      ,'Sarakeryhma38_opmast' = ava38.opmast
      ,'Sarakeryhma38_opm95opa' = ava38.opm95opa
      ,'Sarakeryhma38_koulutussektori' = ava38.koulutussektori
      ,'Sarakeryhma38_suorv' = ava38.suorv
      ,'Sarakeryhma38_suorlk' = ava38.suorlk
      ,'Sarakeryhma38_kmaak' = Case when ava38.tutkmaak is not null then ava38.tutkmaak
								when ava38.kmaak is not null then ava38.kmaak
								when ava38.kmaak_2 is not null then ava38.kmaak_2 else null end
      ,'Sarakeryhma38_olotamm' = ava38.olotamm_2
      ,'Sarakeryhma38_olosyys' = ava38.olosyys_2
      ,'Sarakeryhma38_ptoim1r5' = ava38.ptoim1r5
      ,'Sarakeryhma38_amas' = ava38.amas
      ,'Sarakeryhma38_koulk' = Case when ava38.tutkkoulk is not null then ava38.tutkkoulk
								when ava38.opiskkoulk is not null then ava38.opiskkoulk
								when ava38.opiskkoulk_2 is not null then ava38.opiskkoulk_2 else null end
      ,'Sarakeryhma38_jarj' = Case when ava38.tutkjarj is not null then ava38.tutkjarj
								when ava38.opiskjarj is not null then ava38.opiskjarj
								when ava38.opiskjarj_2 is not null then ava38.opiskjarj_2 else null end
      ,'Sarakeryhma38_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID38],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID38],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID38],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID38],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID38],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID38],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID38],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID38],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID38],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID38],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID38] is null then null
								else 'muu' end
      
      ,'Sarakeryhma39_ID' = alo.[Sarakeryhma_ID39]
      ,'Sarakeryhma39_tyyppi' = ava39.tyyppi
      --,[Sarakeryhma_arvo39]
      ,'Sarakeryhma39_opp' = ava39.opp
      ,'Sarakeryhma39_opmala' = ava39.opmala
      ,'Sarakeryhma39_opmopa' = ava39.opmopa
      ,'Sarakeryhma39_opmast' = ava39.opmast
      ,'Sarakeryhma39_opm95opa' = ava39.opm95opa
      ,'Sarakeryhma39_koulutussektori' = ava39.koulutussektori
      ,'Sarakeryhma39_suorv' = ava39.suorv
      ,'Sarakeryhma39_suorlk' = ava39.suorlk
      ,'Sarakeryhma39_kmaak' = Case when ava39.tutkmaak is not null then ava39.tutkmaak
								when ava39.kmaak is not null then ava39.kmaak
								when ava39.kmaak_2 is not null then ava39.kmaak_2 else null end
      ,'Sarakeryhma39_olotamm' = ava39.olotamm_2
      ,'Sarakeryhma39_olosyys' = ava39.olosyys_2
      ,'Sarakeryhma39_ptoim1r5' = ava39.ptoim1r5
      ,'Sarakeryhma39_amas' = ava39.amas
      ,'Sarakeryhma39_koulk' = Case when ava39.tutkkoulk is not null then ava39.tutkkoulk
								when ava39.opiskkoulk is not null then ava39.opiskkoulk
								when ava39.opiskkoulk_2 is not null then ava39.opiskkoulk_2 else null end
      ,'Sarakeryhma39_jarj' = Case when ava39.tutkjarj is not null then ava39.tutkjarj
								when ava39.opiskjarj is not null then ava39.opiskjarj
								when ava39.opiskjarj_2 is not null then ava39.opiskjarj_2 else null end
      ,'Sarakeryhma39_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID39],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID39],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID39],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID39],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID39],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID39],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID39],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID39],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID39],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID39],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID39] is null then null
								else 'muu' end
      
      ,'Sarakeryhma40_ID' = alo.[Sarakeryhma_ID40]
      ,'Sarakeryhma40_tyyppi' = ava40.tyyppi
      --,[Sarakeryhma_arvo40]
      ,'Sarakeryhma40_opp' = ava40.opp
      ,'Sarakeryhma40_opmala' = ava40.opmala
      ,'Sarakeryhma40_opmopa' = ava40.opmopa
      ,'Sarakeryhma40_opmast' = ava40.opmast
      ,'Sarakeryhma40_opm95opa' = ava40.opm95opa
      ,'Sarakeryhma40_koulutussektori' = ava40.koulutussektori
      ,'Sarakeryhma40_suorv' = ava40.suorv
      ,'Sarakeryhma40_suorlk' = ava40.suorlk
      ,'Sarakeryhma40_kmaak' = Case when ava40.tutkmaak is not null then ava40.tutkmaak
								when ava40.kmaak is not null then ava40.kmaak
								when ava40.kmaak_2 is not null then ava40.kmaak_2 else null end
      ,'Sarakeryhma40_olotamm' = ava40.olotamm_2
      ,'Sarakeryhma40_olosyys' = ava40.olosyys_2
      ,'Sarakeryhma40_ptoim1r5' = ava40.ptoim1r5
      ,'Sarakeryhma40_amas' = ava40.amas
      ,'Sarakeryhma40_koulk' = Case when ava40.tutkkoulk is not null then ava40.tutkkoulk
								when ava40.opiskkoulk is not null then ava40.opiskkoulk
								when ava40.opiskkoulk_2 is not null then ava40.opiskkoulk_2 else null end
      ,'Sarakeryhma40_jarj' = Case when ava40.tutkjarj is not null then ava40.tutkjarj
								when ava40.opiskjarj is not null then ava40.opiskjarj
								when ava40.opiskjarj_2 is not null then ava40.opiskjarj_2 else null end
      ,'Sarakeryhma40_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID40],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID40],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID40],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID40],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID40],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID40],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID40],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID40],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID40],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID40],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID40] is null then null
								else 'muu' end
      
      ,'Sarakeryhma41_ID' = alo.[Sarakeryhma_ID41]
      ,'Sarakeryhma41_tyyppi' = ava41.tyyppi
      --,[Sarakeryhma_arvo41]
      ,'Sarakeryhma41_opp' = ava41.opp
      ,'Sarakeryhma41_opmala' = ava41.opmala
      ,'Sarakeryhma41_opmopa' = ava41.opmopa
      ,'Sarakeryhma41_opmast' = ava41.opmast
      ,'Sarakeryhma41_opm95opa' = ava41.opm95opa
      ,'Sarakeryhma41_koulutussektori' = ava41.koulutussektori
      ,'Sarakeryhma41_suorv' = ava41.suorv
      ,'Sarakeryhma41_suorlk' = ava41.suorlk
      ,'Sarakeryhma41_kmaak' = Case when ava41.tutkmaak is not null then ava41.tutkmaak
								when ava41.kmaak is not null then ava41.kmaak
								when ava41.kmaak_2 is not null then ava41.kmaak_2 else null end
      ,'Sarakeryhma41_olotamm' = ava41.olotamm_2
      ,'Sarakeryhma41_olosyys' = ava41.olosyys_2
      ,'Sarakeryhma41_ptoim1r5' = ava41.ptoim1r5
      ,'Sarakeryhma41_amas' = ava41.amas
      ,'Sarakeryhma41_koulk' = Case when ava41.tutkkoulk is not null then ava41.tutkkoulk
								when ava41.opiskkoulk is not null then ava41.opiskkoulk
								when ava41.opiskkoulk_2 is not null then ava41.opiskkoulk_2 else null end
      ,'Sarakeryhma41_jarj' = Case when ava41.tutkjarj is not null then ava41.tutkjarj
								when ava41.opiskjarj is not null then ava41.opiskjarj
								when ava41.opiskjarj_2 is not null then ava41.opiskjarj_2 else null end
      ,'Sarakeryhma41_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID41],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID41],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID41],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID41],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID41],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID41],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID41],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID41],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID41],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID41],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID41] is null then null
								else 'muu' end
      
      ,'Sarakeryhma42_ID' = alo.[Sarakeryhma_ID42]
      ,'Sarakeryhma42_tyyppi' = ava42.tyyppi
      --,[Sarakeryhma_arvo42]
      ,'Sarakeryhma42_opp' = ava42.opp
      ,'Sarakeryhma42_opmala' = ava42.opmala
      ,'Sarakeryhma42_opmopa' = ava42.opmopa
      ,'Sarakeryhma42_opmast' = ava42.opmast
      ,'Sarakeryhma42_opm95opa' = ava42.opm95opa
      ,'Sarakeryhma42_koulutussektori' = ava42.koulutussektori
      ,'Sarakeryhma42_suorv' = ava42.suorv
      ,'Sarakeryhma42_suorlk' = ava42.suorlk
      ,'Sarakeryhma42_kmaak' = Case when ava42.tutkmaak is not null then ava42.tutkmaak
								when ava42.kmaak is not null then ava42.kmaak
								when ava42.kmaak_2 is not null then ava42.kmaak_2 else null end
      ,'Sarakeryhma42_olotamm' = ava42.olotamm_2
      ,'Sarakeryhma42_olosyys' = ava42.olosyys_2
      ,'Sarakeryhma42_ptoim1r5' = ava42.ptoim1r5
      ,'Sarakeryhma42_amas' = ava42.amas
      ,'Sarakeryhma42_koulk' = Case when ava42.tutkkoulk is not null then ava42.tutkkoulk
								when ava42.opiskkoulk is not null then ava42.opiskkoulk
								when ava42.opiskkoulk_2 is not null then ava42.opiskkoulk_2 else null end
      ,'Sarakeryhma42_jarj' = Case when ava42.tutkjarj is not null then ava42.tutkjarj
								when ava42.opiskjarj is not null then ava42.opiskjarj
								when ava42.opiskjarj_2 is not null then ava42.opiskjarj_2 else null end
      ,'Sarakeryhma42_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID42],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID42],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID42],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID42],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID42],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID42],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID42],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID42],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID42],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID42],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID42] is null then null
								else 'muu' end
      
      ,'Sarakeryhma43_ID' = alo.[Sarakeryhma_ID43]
      ,'Sarakeryhma43_tyyppi' = ava43.tyyppi
      --,[Sarakeryhma_arvo43]
      ,'Sarakeryhma43_opp' = ava43.opp
      ,'Sarakeryhma43_opmala' = ava43.opmala
      ,'Sarakeryhma43_opmopa' = ava43.opmopa
      ,'Sarakeryhma43_opmast' = ava43.opmast
      ,'Sarakeryhma43_opm95opa' = ava43.opm95opa
      ,'Sarakeryhma43_koulutussektori' = ava43.koulutussektori
      ,'Sarakeryhma43_suorv' = ava43.suorv
      ,'Sarakeryhma43_suorlk' = ava43.suorlk
      ,'Sarakeryhma43_kmaak' = Case when ava43.tutkmaak is not null then ava43.tutkmaak
								when ava43.kmaak is not null then ava43.kmaak
								when ava43.kmaak_2 is not null then ava43.kmaak_2 else null end
      ,'Sarakeryhma43_olotamm' = ava43.olotamm_2
      ,'Sarakeryhma43_olosyys' = ava43.olosyys_2
      ,'Sarakeryhma43_ptoim1r5' = ava43.ptoim1r5
      ,'Sarakeryhma43_amas' = ava43.amas
      ,'Sarakeryhma43_koulk' = Case when ava43.tutkkoulk is not null then ava43.tutkkoulk
								when ava43.opiskkoulk is not null then ava43.opiskkoulk
								when ava43.opiskkoulk_2 is not null then ava43.opiskkoulk_2 else null end
      ,'Sarakeryhma43_jarj' = Case when ava43.tutkjarj is not null then ava43.tutkjarj
								when ava43.opiskjarj is not null then ava43.opiskjarj
								when ava43.opiskjarj_2 is not null then ava43.opiskjarj_2 else null end
      ,'Sarakeryhma43_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID43],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID43],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID43],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID43],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID43],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID43],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID43],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID43],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID43],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID43],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID43] is null then null
								else 'muu' end
      
      ,'Sarakeryhma44_ID' = alo.[Sarakeryhma_ID44]
      ,'Sarakeryhma44_tyyppi' = ava44.tyyppi
      --,[Sarakeryhma_arvo44]
      ,'Sarakeryhma44_opp' = ava44.opp
      ,'Sarakeryhma44_opmala' = ava44.opmala
      ,'Sarakeryhma44_opmopa' = ava44.opmopa
      ,'Sarakeryhma44_opmast' = ava44.opmast
      ,'Sarakeryhma44_opm95opa' = ava44.opm95opa
      ,'Sarakeryhma44_koulutussektori' = ava44.koulutussektori
      ,'Sarakeryhma44_suorv' = ava44.suorv
      ,'Sarakeryhma44_suorlk' = ava44.suorlk
      ,'Sarakeryhma44_kmaak' = Case when ava44.tutkmaak is not null then ava44.tutkmaak
								when ava44.kmaak is not null then ava44.kmaak
								when ava44.kmaak_2 is not null then ava44.kmaak_2 else null end
      ,'Sarakeryhma44_olotamm' = ava44.olotamm_2
      ,'Sarakeryhma44_olosyys' = ava44.olosyys_2
      ,'Sarakeryhma44_ptoim1r5' = ava44.ptoim1r5
      ,'Sarakeryhma44_amas' = ava44.amas
      ,'Sarakeryhma44_koulk' = Case when ava44.tutkkoulk is not null then ava44.tutkkoulk
								when ava44.opiskkoulk is not null then ava44.opiskkoulk
								when ava44.opiskkoulk_2 is not null then ava44.opiskkoulk_2 else null end
      ,'Sarakeryhma44_jarj' = Case when ava44.tutkjarj is not null then ava44.tutkjarj
								when ava44.opiskjarj is not null then ava44.opiskjarj
								when ava44.opiskjarj_2 is not null then ava44.opiskjarj_2 else null end
      ,'Sarakeryhma44_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID44],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID44],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID44],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID44],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID44],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID44],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID44],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID44],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID44],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID44],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID44] is null then null
								else 'muu' end
      
      ,'Sarakeryhma45_ID' = alo.[Sarakeryhma_ID45]
      ,'Sarakeryhma45_tyyppi' = ava45.tyyppi
      --,[Sarakeryhma_arvo45]
      ,'Sarakeryhma45_opp' = ava45.opp
      ,'Sarakeryhma45_opmala' = ava45.opmala
      ,'Sarakeryhma45_opmopa' = ava45.opmopa
      ,'Sarakeryhma45_opmast' = ava45.opmast
      ,'Sarakeryhma45_opm95opa' = ava45.opm95opa
      ,'Sarakeryhma45_koulutussektori' = ava45.koulutussektori
      ,'Sarakeryhma45_suorv' = ava45.suorv
      ,'Sarakeryhma45_suorlk' = ava45.suorlk
      ,'Sarakeryhma45_kmaak' = Case when ava45.tutkmaak is not null then ava45.tutkmaak
								when ava45.kmaak is not null then ava45.kmaak
								when ava45.kmaak_2 is not null then ava45.kmaak_2 else null end
      ,'Sarakeryhma45_olotamm' = ava45.olotamm_2
      ,'Sarakeryhma45_olosyys' = ava45.olosyys_2
      ,'Sarakeryhma45_ptoim1r5' = ava45.ptoim1r5
      ,'Sarakeryhma45_amas' = ava45.amas
      ,'Sarakeryhma45_koulk' = Case when ava45.tutkkoulk is not null then ava45.tutkkoulk
								when ava45.opiskkoulk is not null then ava45.opiskkoulk
								when ava45.opiskkoulk_2 is not null then ava45.opiskkoulk_2 else null end
      ,'Sarakeryhma45_jarj' = Case when ava45.tutkjarj is not null then ava45.tutkjarj
								when ava45.opiskjarj is not null then ava45.opiskjarj
								when ava45.opiskjarj_2 is not null then ava45.opiskjarj_2 else null end
      ,'Sarakeryhma45_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID45],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID45],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID45],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID45],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID45],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID45],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID45],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID45],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID45],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID45],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID45] is null then null
								else 'muu' end
      
      ,'Sarakeryhma46_ID' = alo.[Sarakeryhma_ID46]
      ,'Sarakeryhma46_tyyppi' = ava46.tyyppi
      --,[Sarakeryhma_arvo46]
      ,'Sarakeryhma46_opp' = ava46.opp
      ,'Sarakeryhma46_opmala' = ava46.opmala
      ,'Sarakeryhma46_opmopa' = ava46.opmopa
      ,'Sarakeryhma46_opmast' = ava46.opmast
      ,'Sarakeryhma46_opm95opa' = ava46.opm95opa
      ,'Sarakeryhma46_koulutussektori' = ava46.koulutussektori
      ,'Sarakeryhma46_suorv' = ava46.suorv
      ,'Sarakeryhma46_suorlk' = ava46.suorlk
      ,'Sarakeryhma46_kmaak' = Case when ava46.tutkmaak is not null then ava46.tutkmaak
								when ava46.kmaak is not null then ava46.kmaak
								when ava46.kmaak_2 is not null then ava46.kmaak_2 else null end
      ,'Sarakeryhma46_olotamm' = ava46.olotamm_2
      ,'Sarakeryhma46_olosyys' = ava46.olosyys_2
      ,'Sarakeryhma46_ptoim1r5' = ava46.ptoim1r5
      ,'Sarakeryhma46_amas' = ava46.amas
      ,'Sarakeryhma46_koulk' = Case when ava46.tutkkoulk is not null then ava46.tutkkoulk
								when ava46.opiskkoulk is not null then ava46.opiskkoulk
								when ava46.opiskkoulk_2 is not null then ava46.opiskkoulk_2 else null end
      ,'Sarakeryhma46_jarj' = Case when ava46.tutkjarj is not null then ava46.tutkjarj
								when ava46.opiskjarj is not null then ava46.opiskjarj
								when ava46.opiskjarj_2 is not null then ava46.opiskjarj_2 else null end
      ,'Sarakeryhma46_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID46],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID46],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID46],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID46],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID46],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID46],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID46],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID46],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID46],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID46],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID46] is null then null
								else 'muu' end
      
      ,'Sarakeryhma47_ID' = alo.[Sarakeryhma_ID47]
      ,'Sarakeryhma47_tyyppi' = ava47.tyyppi
      --,[Sarakeryhma_arvo47]
      ,'Sarakeryhma47_opp' = ava47.opp
      ,'Sarakeryhma47_opmala' = ava47.opmala
      ,'Sarakeryhma47_opmopa' = ava47.opmopa
      ,'Sarakeryhma47_opmast' = ava47.opmast
      ,'Sarakeryhma47_opm95opa' = ava47.opm95opa
      ,'Sarakeryhma47_koulutussektori' = ava47.koulutussektori
      ,'Sarakeryhma47_suorv' = ava47.suorv
      ,'Sarakeryhma47_suorlk' = ava47.suorlk
      ,'Sarakeryhma47_kmaak' = Case when ava47.tutkmaak is not null then ava47.tutkmaak
								when ava47.kmaak is not null then ava47.kmaak
								when ava47.kmaak_2 is not null then ava47.kmaak_2 else null end
      ,'Sarakeryhma47_olotamm' = ava47.olotamm_2
      ,'Sarakeryhma47_olosyys' = ava47.olosyys_2
      ,'Sarakeryhma47_ptoim1r5' = ava47.ptoim1r5
      ,'Sarakeryhma47_amas' = ava47.amas
      ,'Sarakeryhma47_koulk' = Case when ava47.tutkkoulk is not null then ava47.tutkkoulk
								when ava47.opiskkoulk is not null then ava47.opiskkoulk
								when ava47.opiskkoulk_2 is not null then ava47.opiskkoulk_2 else null end
      ,'Sarakeryhma47_jarj' = Case when ava47.tutkjarj is not null then ava47.tutkjarj
								when ava47.opiskjarj is not null then ava47.opiskjarj
								when ava47.opiskjarj_2 is not null then ava47.opiskjarj_2 else null end
      ,'Sarakeryhma47_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID47],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID47],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID47],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID47],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID47],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID47],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID47],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID47],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID47],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID47],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID47] is null then null
								else 'muu' end
      
      ,'Sarakeryhma48_ID' = alo.[Sarakeryhma_ID48]
      ,'Sarakeryhma48_tyyppi' = ava48.tyyppi
      --,[Sarakeryhma_arvo48]
      ,'Sarakeryhma48_opp' = ava48.opp
      ,'Sarakeryhma48_opmala' = ava48.opmala
      ,'Sarakeryhma48_opmopa' = ava48.opmopa
      ,'Sarakeryhma48_opmast' = ava48.opmast
      ,'Sarakeryhma48_opm95opa' = ava48.opm95opa
      ,'Sarakeryhma48_koulutussektori' = ava48.koulutussektori
      ,'Sarakeryhma48_suorv' = ava48.suorv
      ,'Sarakeryhma48_suorlk' = ava48.suorlk
      ,'Sarakeryhma48_kmaak' = Case when ava48.tutkmaak is not null then ava48.tutkmaak
								when ava48.kmaak is not null then ava48.kmaak
								when ava48.kmaak_2 is not null then ava48.kmaak_2 else null end
      ,'Sarakeryhma48_olotamm' = ava48.olotamm_2
      ,'Sarakeryhma48_olosyys' = ava48.olosyys_2
      ,'Sarakeryhma48_ptoim1r5' = ava48.ptoim1r5
      ,'Sarakeryhma48_amas' = ava48.amas
      ,'Sarakeryhma48_koulk' = Case when ava48.tutkkoulk is not null then ava48.tutkkoulk
								when ava48.opiskkoulk is not null then ava48.opiskkoulk
								when ava48.opiskkoulk_2 is not null then ava48.opiskkoulk_2 else null end
      ,'Sarakeryhma48_jarj' = Case when ava48.tutkjarj is not null then ava48.tutkjarj
								when ava48.opiskjarj is not null then ava48.opiskjarj
								when ava48.opiskjarj_2 is not null then ava48.opiskjarj_2 else null end
      ,'Sarakeryhma48_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID48],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID48],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID48],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID48],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID48],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID48],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID48],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID48],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID48],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID48],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID48] is null then null
								else 'muu' end
      
      ,'Sarakeryhma49_ID' = alo.[Sarakeryhma_ID49]
      ,'Sarakeryhma49_tyyppi' = ava49.tyyppi
      --,[Sarakeryhma_arvo49]
      ,'Sarakeryhma49_opp' = ava49.opp
      ,'Sarakeryhma49_opmala' = ava49.opmala
      ,'Sarakeryhma49_opmopa' = ava49.opmopa
      ,'Sarakeryhma49_opmast' = ava49.opmast
      ,'Sarakeryhma49_opm95opa' = ava49.opm95opa
      ,'Sarakeryhma49_koulutussektori' = ava49.koulutussektori
      ,'Sarakeryhma49_suorv' = ava49.suorv
      ,'Sarakeryhma49_suorlk' = ava49.suorlk
      ,'Sarakeryhma49_kmaak' = Case when ava49.tutkmaak is not null then ava49.tutkmaak
								when ava49.kmaak is not null then ava49.kmaak
								when ava49.kmaak_2 is not null then ava49.kmaak_2 else null end
      ,'Sarakeryhma49_olotamm' = ava49.olotamm_2
      ,'Sarakeryhma49_olosyys' = ava49.olosyys_2
      ,'Sarakeryhma49_ptoim1r5' = ava49.ptoim1r5
      ,'Sarakeryhma49_amas' = ava49.amas
      ,'Sarakeryhma49_koulk' = Case when ava49.tutkkoulk is not null then ava49.tutkkoulk
								when ava49.opiskkoulk is not null then ava49.opiskkoulk
								when ava49.opiskkoulk_2 is not null then ava49.opiskkoulk_2 else null end
      ,'Sarakeryhma49_jarj' = Case when ava49.tutkjarj is not null then ava49.tutkjarj
								when ava49.opiskjarj is not null then ava49.opiskjarj
								when ava49.opiskjarj_2 is not null then ava49.opiskjarj_2 else null end
      ,'Sarakeryhma49_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID49],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID49],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID49],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID49],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID49],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID49],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID49],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID49],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID49],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID49],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID49] is null then null
								else 'muu' end
      
      ,'Sarakeryhma50_ID' = alo.[Sarakeryhma_ID50]
      ,'Sarakeryhma50_tyyppi' = ava50.tyyppi
      --,[Sarakeryhma_arvo50]
      ,'Sarakeryhma50_opp' = ava50.opp
      ,'Sarakeryhma50_opmala' = ava50.opmala
      ,'Sarakeryhma50_opmopa' = ava50.opmopa
      ,'Sarakeryhma50_opmast' = ava50.opmast
      ,'Sarakeryhma50_opm95opa' = ava50.opm95opa
      ,'Sarakeryhma50_koulutussektori' = ava50.koulutussektori
      ,'Sarakeryhma50_suorv' = ava50.suorv
      ,'Sarakeryhma50_suorlk' = ava50.suorlk
      ,'Sarakeryhma50_kmaak' = Case when ava50.tutkmaak is not null then ava50.tutkmaak
								when ava50.kmaak is not null then ava50.kmaak
								when ava50.kmaak_2 is not null then ava50.kmaak_2 else null end
      ,'Sarakeryhma50_olotamm' = ava50.olotamm_2
      ,'Sarakeryhma50_olosyys' = ava50.olosyys_2
      ,'Sarakeryhma50_ptoim1r5' = ava50.ptoim1r5
      ,'Sarakeryhma50_amas' = ava50.amas
      ,'Sarakeryhma50_koulk' = Case when ava50.tutkkoulk is not null then ava50.tutkkoulk
								when ava50.opiskkoulk is not null then ava50.opiskkoulk
								when ava50.opiskkoulk_2 is not null then ava50.opiskkoulk_2 else null end
      ,'Sarakeryhma50_jarj' = Case when ava50.tutkjarj is not null then ava50.tutkjarj
								when ava50.opiskjarj is not null then ava50.opiskjarj
								when ava50.opiskjarj_2 is not null then ava50.opiskjarj_2 else null end
      ,'Sarakeryhma50_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID50],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID50],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID50],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID50],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID50],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID50],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID50],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID50],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID50],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID50],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID50] is null then null
								else 'muu' end
      
      ,'Sarakeryhma51_ID' = alo.[Sarakeryhma_ID51]
      ,'Sarakeryhma51_tyyppi' = ava51.tyyppi
      --,[Sarakeryhma_arvo51]
      ,'Sarakeryhma51_opp' = ava51.opp
      ,'Sarakeryhma51_opmala' = ava51.opmala
      ,'Sarakeryhma51_opmopa' = ava51.opmopa
      ,'Sarakeryhma51_opmast' = ava51.opmast
      ,'Sarakeryhma51_opm95opa' = ava51.opm95opa
      ,'Sarakeryhma51_koulutussektori' = ava51.koulutussektori
      ,'Sarakeryhma51_suorv' = ava51.suorv
      ,'Sarakeryhma51_suorlk' = ava51.suorlk
      ,'Sarakeryhma51_kmaak' = Case when ava51.tutkmaak is not null then ava51.tutkmaak
								when ava51.kmaak is not null then ava51.kmaak
								when ava51.kmaak_2 is not null then ava51.kmaak_2 else null end
      ,'Sarakeryhma51_olotamm' = ava51.olotamm_2
      ,'Sarakeryhma51_olosyys' = ava51.olosyys_2
      ,'Sarakeryhma51_ptoim1r5' = ava51.ptoim1r5
      ,'Sarakeryhma51_amas' = ava51.amas
      ,'Sarakeryhma51_koulk' = Case when ava51.tutkkoulk is not null then ava51.tutkkoulk
								when ava51.opiskkoulk is not null then ava51.opiskkoulk
								when ava51.opiskkoulk_2 is not null then ava51.opiskkoulk_2 else null end
      ,'Sarakeryhma51_jarj' = Case when ava51.tutkjarj is not null then ava51.tutkjarj
								when ava51.opiskjarj is not null then ava51.opiskjarj
								when ava51.opiskjarj_2 is not null then ava51.opiskjarj_2 else null end
      ,'Sarakeryhma51_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID51],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID51],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID51],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID51],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID51],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID51],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID51],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID51],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID51],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID51],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID51] is null then null
								else 'muu' end
      
      ,'Sarakeryhma52_ID' = alo.[Sarakeryhma_ID52]
      ,'Sarakeryhma52_tyyppi' = ava52.tyyppi
      --,[Sarakeryhma_arvo52]
      ,'Sarakeryhma52_opp' = ava52.opp
      ,'Sarakeryhma52_opmala' = ava52.opmala
      ,'Sarakeryhma52_opmopa' = ava52.opmopa
      ,'Sarakeryhma52_opmast' = ava52.opmast
      ,'Sarakeryhma52_opm95opa' = ava52.opm95opa
      ,'Sarakeryhma52_koulutussektori' = ava52.koulutussektori
      ,'Sarakeryhma52_suorv' = ava52.suorv
      ,'Sarakeryhma52_suorlk' = ava52.suorlk
      ,'Sarakeryhma52_kmaak' = Case when ava52.tutkmaak is not null then ava52.tutkmaak
								when ava52.kmaak is not null then ava52.kmaak
								when ava52.kmaak_2 is not null then ava52.kmaak_2 else null end
      ,'Sarakeryhma52_olotamm' = ava52.olotamm_2
      ,'Sarakeryhma52_olosyys' = ava52.olosyys_2
      ,'Sarakeryhma52_ptoim1r5' = ava52.ptoim1r5
      ,'Sarakeryhma52_amas' = ava52.amas
      ,'Sarakeryhma52_koulk' = Case when ava52.tutkkoulk is not null then ava52.tutkkoulk
								when ava52.opiskkoulk is not null then ava52.opiskkoulk
								when ava52.opiskkoulk_2 is not null then ava52.opiskkoulk_2 else null end
      ,'Sarakeryhma52_jarj' = Case when ava52.tutkjarj is not null then ava52.tutkjarj
								when ava52.opiskjarj is not null then ava52.opiskjarj
								when ava52.opiskjarj_2 is not null then ava52.opiskjarj_2 else null end
      ,'Sarakeryhma52_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID52],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID52],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID52],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID52],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID52],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID52],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID52],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID52],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID52],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID52],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID52] is null then null
								else 'muu' end
      
      ,'Sarakeryhma53_ID' = alo.[Sarakeryhma_ID53]
      ,'Sarakeryhma53_tyyppi' = ava53.tyyppi
      --,[Sarakeryhma_arvo53]
      ,'Sarakeryhma53_opp' = ava53.opp
      ,'Sarakeryhma53_opmala' = ava53.opmala
      ,'Sarakeryhma53_opmopa' = ava53.opmopa
      ,'Sarakeryhma53_opmast' = ava53.opmast
      ,'Sarakeryhma53_opm95opa' = ava53.opm95opa
      ,'Sarakeryhma53_koulutussektori' = ava53.koulutussektori
      ,'Sarakeryhma53_suorv' = ava53.suorv
      ,'Sarakeryhma53_suorlk' = ava53.suorlk
      ,'Sarakeryhma53_kmaak' = Case when ava53.tutkmaak is not null then ava53.tutkmaak
								when ava53.kmaak is not null then ava53.kmaak
								when ava53.kmaak_2 is not null then ava53.kmaak_2 else null end
      ,'Sarakeryhma53_olotamm' = ava53.olotamm_2
      ,'Sarakeryhma53_olosyys' = ava53.olosyys_2
      ,'Sarakeryhma53_ptoim1r5' = ava53.ptoim1r5
      ,'Sarakeryhma53_amas' = ava53.amas
      ,'Sarakeryhma53_koulk' = Case when ava53.tutkkoulk is not null then ava53.tutkkoulk
								when ava53.opiskkoulk is not null then ava53.opiskkoulk
								when ava53.opiskkoulk_2 is not null then ava53.opiskkoulk_2 else null end
      ,'Sarakeryhma53_jarj' = Case when ava53.tutkjarj is not null then ava53.tutkjarj
								when ava53.opiskjarj is not null then ava53.opiskjarj
								when ava53.opiskjarj_2 is not null then ava53.opiskjarj_2 else null end
      ,'Sarakeryhma53_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID53],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID53],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID53],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID53],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID53],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID53],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID53],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID53],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID53],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID53],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID53] is null then null
								else 'muu' end
      
      ,'Sarakeryhma54_ID' = alo.[Sarakeryhma_ID54]
      ,'Sarakeryhma54_tyyppi' = ava54.tyyppi
      --,[Sarakeryhma_arvo54]
      ,'Sarakeryhma54_opp' = ava54.opp
      ,'Sarakeryhma54_opmala' = ava54.opmala
      ,'Sarakeryhma54_opmopa' = ava54.opmopa
      ,'Sarakeryhma54_opmast' = ava54.opmast
      ,'Sarakeryhma54_opm95opa' = ava54.opm95opa
      ,'Sarakeryhma54_koulutussektori' = ava54.koulutussektori
      ,'Sarakeryhma54_suorv' = ava54.suorv
      ,'Sarakeryhma54_suorlk' = ava54.suorlk
      ,'Sarakeryhma54_kmaak' = Case when ava54.tutkmaak is not null then ava54.tutkmaak
								when ava54.kmaak is not null then ava54.kmaak
								when ava54.kmaak_2 is not null then ava54.kmaak_2 else null end
      ,'Sarakeryhma54_olotamm' = ava54.olotamm_2
      ,'Sarakeryhma54_olosyys' = ava54.olosyys_2
      ,'Sarakeryhma54_ptoim1r5' = ava54.ptoim1r5
      ,'Sarakeryhma54_amas' = ava54.amas
      ,'Sarakeryhma54_koulk' = Case when ava54.tutkkoulk is not null then ava54.tutkkoulk
								when ava54.opiskkoulk is not null then ava54.opiskkoulk
								when ava54.opiskkoulk_2 is not null then ava54.opiskkoulk_2 else null end
      ,'Sarakeryhma54_jarj' = Case when ava54.tutkjarj is not null then ava54.tutkjarj
								when ava54.opiskjarj is not null then ava54.opiskjarj
								when ava54.opiskjarj_2 is not null then ava54.opiskjarj_2 else null end
      ,'Sarakeryhma54_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID54],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID54],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID54],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID54],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID54],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID54],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID54],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID54],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID54],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID54],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID54] is null then null
								else 'muu' end
      
      ,'Sarakeryhma55_ID' = alo.[Sarakeryhma_ID55]
      ,'Sarakeryhma55_tyyppi' = ava55.tyyppi
      --,[Sarakeryhma_arvo55]
      ,'Sarakeryhma55_opp' = ava55.opp
      ,'Sarakeryhma55_opmala' = ava55.opmala
      ,'Sarakeryhma55_opmopa' = ava55.opmopa
      ,'Sarakeryhma55_opmast' = ava55.opmast
      ,'Sarakeryhma55_opm95opa' = ava55.opm95opa
      ,'Sarakeryhma55_koulutussektori' = ava55.koulutussektori
      ,'Sarakeryhma55_suorv' = ava55.suorv
      ,'Sarakeryhma55_suorlk' = ava55.suorlk
      ,'Sarakeryhma55_kmaak' = Case when ava55.tutkmaak is not null then ava55.tutkmaak
								when ava55.kmaak is not null then ava55.kmaak
								when ava55.kmaak_2 is not null then ava55.kmaak_2 else null end
      ,'Sarakeryhma55_olotamm' = ava55.olotamm_2
      ,'Sarakeryhma55_olosyys' = ava55.olosyys_2
      ,'Sarakeryhma55_ptoim1r5' = ava55.ptoim1r5
      ,'Sarakeryhma55_amas' = ava55.amas
      ,'Sarakeryhma55_koulk' = Case when ava55.tutkkoulk is not null then ava55.tutkkoulk
								when ava55.opiskkoulk is not null then ava55.opiskkoulk
								when ava55.opiskkoulk_2 is not null then ava55.opiskkoulk_2 else null end
      ,'Sarakeryhma55_jarj' = Case when ava55.tutkjarj is not null then ava55.tutkjarj
								when ava55.opiskjarj is not null then ava55.opiskjarj
								when ava55.opiskjarj_2 is not null then ava55.opiskjarj_2 else null end
      ,'Sarakeryhma55_tutkintolaji' = Case when LEFT(alo.[Sarakeryhma_ID55],2)='lu' then 'lu'
								when LEFT(alo.[Sarakeryhma_ID55],4)='ampt' then 'ampt'
								when LEFT(alo.[Sarakeryhma_ID55],4)='amlk' then 'amlk'
								when LEFT(alo.[Sarakeryhma_ID55],3)='amk' then 'amk'
								when LEFT(alo.[Sarakeryhma_ID55],5)='ylamk' then 'ylamk'
								when LEFT(alo.[Sarakeryhma_ID55],4)='alkk' then 'alkk'
								when LEFT(alo.[Sarakeryhma_ID55],4)='ylkk' then 'ylkk'
								when LEFT(alo.[Sarakeryhma_ID55],2)='tk' then 'tk'
								when LEFT(alo.[Sarakeryhma_ID55],5)='muuta' then 'muuta'
								when LEFT(alo.[Sarakeryhma_ID55],5)='muukk' then 'muukk'
								when alo.[Sarakeryhma_ID55] is null then null
								else 'muu' end
      
      --,'SarakeryhmaXX_ID' = alo.[Sarakeryhma_IDXX]
      ----,[Sarakeryhma_arvoXX]
      --,'SarakeryhmaXX_opp' = avaXX.opp
      --,'SarakeryhmaXX_opmala' = avaXX.opmala
      --,'SarakeryhmaXX_opmopa' = avaXX.opmopa
      --,'SarakeryhmaXX_opmast' = avaXX.opmast
      --,'SarakeryhmaXX_opm95opa' = avaXX.opm95opa
      --,'SarakeryhmaXX_koulutussektori' = avaXX.koulutussektori
  --INTO vipunen_ETL.aloittaneiden_lapaisy_tiivistetty
  FROM _sa_K3_9_ja_K3_10_surrogaattiavaimet_PIVOT alo
  --LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot dop ON koulutuksen_jarjestajakoodi=alo.jarj and oppilaitostyyppikoodi in (41,42) --and alo.tilv between YEAR(dop.alkaa) and YEAR(dop.paattyy)
  LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1
	ON d1.oppilaitos_avain=alo.jarj --AND f.tilv_date between d1.alkaa and d1.paattyy
  LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d17
	ON d17.oppilaitos_avain=d1.koulutuksen_jarjestajan_ainoa_oppilaitos --AND d1.alkaa between d17.alkaa and d17.paattyy

  LEFT JOIN d_koulutusluokitus dko ON koulutus_koodi=alo.koulk and alo.tilv between YEAR(dko.alkaa) and YEAR(dko.paattyy)
  LEFT JOIN VipunenTK.dbo.d_alueluokitus dal ON kunta_koodi=alo.kkun --and alo.tilv between YEAR(dal.alkaa) and YEAR(dal.paattyy)
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava1 ON ava1.id = alo.Sarakeryhma_arvo1
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava2 ON ava2.id = alo.Sarakeryhma_arvo2
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava3 ON ava3.id = alo.Sarakeryhma_arvo3
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava4 ON ava4.id = alo.Sarakeryhma_arvo4
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava5 ON ava5.id = alo.Sarakeryhma_arvo5
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava6 ON ava6.id = alo.Sarakeryhma_arvo6
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava7 ON ava7.id = alo.Sarakeryhma_arvo7
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava8 ON ava8.id = alo.Sarakeryhma_arvo8
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava9 ON ava9.id = alo.Sarakeryhma_arvo9
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava10 ON ava10.id = alo.Sarakeryhma_arvo10
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava11 ON ava11.id = alo.Sarakeryhma_arvo11
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava12 ON ava12.id = alo.Sarakeryhma_arvo12
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava13 ON ava13.id = alo.Sarakeryhma_arvo13
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava14 ON ava14.id = alo.Sarakeryhma_arvo14
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava15 ON ava15.id = alo.Sarakeryhma_arvo15
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava16 ON ava16.id = alo.Sarakeryhma_arvo16
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava17 ON ava17.id = alo.Sarakeryhma_arvo17
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava18 ON ava18.id = alo.Sarakeryhma_arvo18
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava19 ON ava19.id = alo.Sarakeryhma_arvo19
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava20 ON ava20.id = alo.Sarakeryhma_arvo20
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava21 ON ava21.id = alo.Sarakeryhma_arvo21
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava22 ON ava22.id = alo.Sarakeryhma_arvo22
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava23 ON ava23.id = alo.Sarakeryhma_arvo23
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava24 ON ava24.id = alo.Sarakeryhma_arvo24
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava25 ON ava25.id = alo.Sarakeryhma_arvo25
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava26 ON ava26.id = alo.Sarakeryhma_arvo26
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava27 ON ava27.id = alo.Sarakeryhma_arvo27
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava28 ON ava28.id = alo.Sarakeryhma_arvo28
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava29 ON ava29.id = alo.Sarakeryhma_arvo29
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava30 ON ava30.id = alo.Sarakeryhma_arvo30
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava31 ON ava31.id = alo.Sarakeryhma_arvo31
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava32 ON ava32.id = alo.Sarakeryhma_arvo32
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava33 ON ava33.id = alo.Sarakeryhma_arvo33
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava34 ON ava34.id = alo.Sarakeryhma_arvo34
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava35 ON ava35.id = alo.Sarakeryhma_arvo35
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava36 ON ava36.id = alo.Sarakeryhma_arvo36
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava37 ON ava37.id = alo.Sarakeryhma_arvo37
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava38 ON ava38.id = alo.Sarakeryhma_arvo38
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava39 ON ava39.id = alo.Sarakeryhma_arvo39
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava40 ON ava40.id = alo.Sarakeryhma_arvo40
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava41 ON ava41.id = alo.Sarakeryhma_arvo41
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava42 ON ava42.id = alo.Sarakeryhma_arvo42
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava43 ON ava43.id = alo.Sarakeryhma_arvo43
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava44 ON ava44.id = alo.Sarakeryhma_arvo44
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava45 ON ava45.id = alo.Sarakeryhma_arvo45
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava46 ON ava46.id = alo.Sarakeryhma_arvo46
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava47 ON ava47.id = alo.Sarakeryhma_arvo47
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava48 ON ava48.id = alo.Sarakeryhma_arvo48
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava49 ON ava49.id = alo.Sarakeryhma_arvo49
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava50 ON ava50.id = alo.Sarakeryhma_arvo50
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava51 ON ava51.id = alo.Sarakeryhma_arvo51
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava52 ON ava52.id = alo.Sarakeryhma_arvo52
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava53 ON ava53.id = alo.Sarakeryhma_arvo53
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava54 ON ava54.id = alo.Sarakeryhma_arvo54
  LEFT JOIN _aloittaneiden_lapaisy_avaimet ava55 ON ava55.id = alo.Sarakeryhma_arvo55
) sarakeryhmat


GO


USE [ANTERO]