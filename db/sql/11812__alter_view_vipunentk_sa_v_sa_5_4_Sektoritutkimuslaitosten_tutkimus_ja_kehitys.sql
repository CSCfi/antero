USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]    Script Date: 25.3.2026 12.13.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER   VIEW [dbo].[v_sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] AS

/*
Aineisto muuttui K-aineistoksi 2016. K-koodia ei lisätty näkymän nimeen. /18.1.2016 CSC Jarmo
K poistettu /16.2.2016 CSC Jarmo

Drop table [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]
Select * into [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] FROM VipunenTK_SA.[dbo].[v_sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]

Truncate table [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]
Insert into [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi] = Cast(Right('00000' + kaikkivuodet.TK_koodi, 5) as varchar(5))
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm]
      ,[dittv]
      ,[INSLKM]
      ,[Nyhtlkm]
      ,[insttv]
      ,[yhtlkm]
      ,[ninslkm]
      ,[YHTTTV]
      ,[palme]
      ,[ostpa]
      ,[ysyht]
      ,[TEKES]
      ,[mktm]
      ,[AKATEMIA]
      ,[GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys]
      ,[auys]
      ,[aeus]
	  ,[EUPUITE]
      ,[amus]
      ,[Uyhtlkm]
      ,[K_NRO1] = Cast(Nullif(Right('000'+Cast(K_NRO1 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO2] = Cast(Nullif(Right('000'+Cast(K_NRO2 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO3] = Cast(Nullif(Right('000'+Cast(K_NRO3 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO4] = Cast(Nullif(Right('000'+Cast(K_NRO4 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO5] = Cast(Nullif(Right('000'+Cast(K_NRO5 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO6] = Cast(Nullif(Right('000'+Cast(K_NRO6 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO7] = Cast(Nullif(Right('000'+Cast(K_NRO7 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO8] = Cast(Nullif(Right('000'+Cast(K_NRO8 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO9] = Cast(Nullif(Right('000'+Cast(K_NRO9 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO10] = Cast(Nullif(Right('000'+Cast(K_NRO10 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO11] = Cast(Nullif(Right('000'+Cast(K_NRO11 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO12] = Cast(Nullif(Right('000'+Cast(K_NRO12 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO13] = Cast(Nullif(Right('000'+Cast(K_NRO13 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO14] = Cast(Nullif(Right('000'+Cast(K_NRO14 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO15] = Cast(Nullif(Right('000'+Cast(K_NRO15 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO16] = Cast(Nullif(Right('000'+Cast(K_NRO16 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO17] = Cast(Nullif(Right('000'+Cast(K_NRO17 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO18] = Cast(Nullif(Right('000'+Cast(K_NRO18 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO19] = Cast(Nullif(Right('000'+Cast(K_NRO19 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO20] = Cast(Nullif(Right('000'+Cast(K_NRO20 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO21] = Cast(Nullif(Right('000'+Cast(K_NRO21 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO22] = Cast(Nullif(Right('000'+Cast(K_NRO22 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO23] = Cast(Nullif(Right('000'+Cast(K_NRO23 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO24] = Cast(Nullif(Right('000'+Cast(K_NRO24 as varchar(3)),3),'000') as varchar(3))
      ,[K_NRO25] = Cast(Nullif(Right('000'+Cast(K_NRO25 as varchar(3)),3),'000') as varchar(3))
	  ,[K_NRO26] = Cast(Nullif(Right('000'+Cast(K_NRO26 as varchar(3)),3),'000') as varchar(3))
	  ,[K_NRO27] = Cast(Nullif(Right('000'+Cast(K_NRO27 as varchar(3)),3),'000') as varchar(3))
	  ,[K_NRO28] = Cast(Nullif(Right('000'+Cast(K_NRO28 as varchar(3)),3),'000') as varchar(3))
	  ,[K_NRO29] = Cast(Nullif(Right('000'+Cast(K_NRO29 as varchar(3)),3),'000') as varchar(3))
	  ,[K_NRO30] = Cast(Nullif(Right('000'+Cast(K_NRO30 as varchar(3)),3),'000') as varchar(3))
	  ,[K_NRO31] = Cast(Nullif(Right('000'+Cast(K_NRO31 as varchar(3)),3),'000') as varchar(3))
	  ,[K_NRO32] = Cast(Nullif(Right('000'+Cast(K_NRO32 as varchar(3)),3),'000') as varchar(3))
	  ,[K_NRO33] = Cast(Nullif(Right('000'+Cast(K_NRO33 as varchar(3)),3),'000') as varchar(3))
      ,[YHTHY]
      ,[TTVY]
      ,[A_YSY]
      ,[YHTH1]
      ,[YHTH2]
      ,[YHTH3]
      ,[YHTH4]
      ,[YHTH5]
      ,[YHTH6]
      ,[YHTH7]
      ,[YHTH8]
      ,[YHTH9]
      ,[YHTH10]
      ,[YHTH11]
      ,[YHTH12]
      ,[YHTH13]
      ,[YHTH14]
      ,[YHTH15]
      ,[YHTH16]
      ,[YHTH17]
      ,[YHTH18]
      ,[YHTH19]
      ,[YHTH20]
      ,[YHTH21]
      ,[YHTH22]
      ,[YHTH23]
      ,[YHTH24]
      ,[YHTH25]
	  ,[YHTH26]
	  ,[YHTH27]
	  ,[YHTH28]
	  ,[YHTH29]
	  ,[YHTH30]
	  ,[YHTH31]
	  ,[YHTH32]
	  ,[YHTH33]
      ,[TTV1]
      ,[TTV2]
      ,[TTV3]
      ,[TTV4]
      ,[TTV5]
      ,[TTV6]
      ,[TTV7]
      ,[TTV8]
      ,[TTV9]
      ,[TTV10]
      ,[TTV11]
      ,[TTV12]
      ,[TTV13]
      ,[TTV14]
      ,[TTV15]
      ,[TTV16]
      ,[TTV17]
      ,[TTV18]
      ,[TTV19]
      ,[TTV20]
      ,[TTV21]
      ,[TTV22]
      ,[TTV23]
      ,[TTV24]
      ,[TTV25]
	  ,[TTV26]
	  ,[TTV27]
	  ,[TTV28]
	  ,[TTV29]
	  ,[TTV30]
	  ,[TTV31]
	  ,[TTV32]
	  ,[TTV33]
      ,[A_YS1]
      ,[A_YS2]
      ,[A_YS3]
      ,[A_YS4]
      ,[A_YS5]
      ,[A_YS6]
      ,[A_YS7]
      ,[A_YS8]
      ,[A_YS9]
      ,[A_YS10]
      ,[A_YS11]
      ,[A_YS12]
      ,[A_YS13]
      ,[A_YS14]
      ,[A_YS15]
      ,[A_YS16]
      ,[A_YS17]
      ,[A_YS18]
      ,[A_YS19]
      ,[A_YS20]
      ,[A_YS21]
      ,[A_YS22]
      ,[A_YS23]
      ,[A_YS24]
      ,[A_YS25]
	  ,[A_YS26]
	  ,[A_YS27]
	  ,[A_YS28]
	  ,[A_YS29]
	  ,[A_YS30]
	  ,[A_YS31]
	  ,[A_YS32]
	  ,[A_YS33]
      ,[TA1] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA1 as varchar(4)), '0') as varchar(10))
      ,[TA2] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA2 as varchar(4)), '0') as varchar(10))
      ,[TA3] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA3 as varchar(4)), '0') as varchar(10))
      ,[TA4] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA4 as varchar(4)), '0') as varchar(10))
      ,[TA5] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA5 as varchar(4)), '0') as varchar(10))
      ,[TA6] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA6 as varchar(4)), '0') as varchar(10))
      ,[TA7] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA7 as varchar(4)), '0') as varchar(10))
      ,[TA8] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA8 as varchar(4)), '0') as varchar(10))
      ,[TA9] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA9 as varchar(4)), '0') as varchar(10))
      ,[TA10] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA10 as varchar(4)), '0') as varchar(10))
      ,[TA11] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA11 as varchar(4)), '0') as varchar(10))
      ,[TA12] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA12 as varchar(4)), '0') as varchar(10))
      ,[TA13] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA13 as varchar(4)), '0') as varchar(10))
      ,[TA14] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA14 as varchar(4)), '0') as varchar(10))
      ,[TA15] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA15 as varchar(4)), '0') as varchar(10))
      ,[TA16] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA16 as varchar(4)), '0') as varchar(10))
      ,[TA17] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA17 as varchar(4)), '0') as varchar(10))
      ,[TA18] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA18 as varchar(4)), '0') as varchar(10))
	  ,[TA19] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA19 as varchar(4)), '0') as varchar(10))
	  ,[TA20] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA20 as varchar(4)), '0') as varchar(10))
	  ,[TA21] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA21 as varchar(4)), '0') as varchar(10))
	  ,[TA22] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA22 as varchar(4)), '0') as varchar(10))
	  ,[TA23] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA23 as varchar(4)), '0') as varchar(10))
	  ,[TA24] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA24 as varchar(4)), '0') as varchar(10))
	  ,[TA25] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA25 as varchar(4)), '0') as varchar(10))
	  ,[TA26] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA26 as varchar(4)), '0') as varchar(10))
	  ,[TA27] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA27 as varchar(4)), '0') as varchar(10))
	  ,[TA28] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA28 as varchar(4)), '0') as varchar(10))
	  ,[TA29] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA29 as varchar(4)), '0') as varchar(10))
	  ,[TA30] = Cast(tieteenalakoodisto + '_' + Nullif(Cast(TA30 as varchar(4)), '0') as varchar(10))
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P]
	  ,[TA20P]
	  ,[TA21P]
	  ,[TA22P]
	  ,[TA23P]
	  ,[TA24P]
	  ,[TA25P]
	  ,[TA26P]
	  ,[TA27P]
	  ,[TA28P]
	  ,[TA29P]
	  ,[TA30P]
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,[YHTE2]
      ,[NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,[OPISTLKM]
      ,[NOPISTLKM]
      ,[OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[OKMRAHAS] -- vanha [ORAHAS]
	  ,[BUDJETTI]
	  ,[orahas]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
	  ,[RKORK]
	  ,CAST([halue] as decimal(10,3)) as halue
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)

FROM ( --kaikkivuodet

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,[GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,[YHTE2]
      ,[NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,[OPISTLKM]
      ,[NOPISTLKM]
      ,[OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[ORAHAS] AS [OKMRAHAS]
	  ,NULL AS [BUDJETTI]
	  ,NULL AS [orahas]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]=NULL
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA07'
      ,[tietolahde]='TK_5_4_sopv_12_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_5_4_sopv_12_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,[GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE]=0.0
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,[YHTE2]
      ,[NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,[OPISTLKM]
      ,[NOPISTLKM]
      ,[OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[ORAHAS] AS [OKMRAHAS]
	  ,NULL AS [BUDJETTI]
	  ,NULL AS [orahas]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]=NULL
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_13_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_5_4_sopv_13_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,[GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE]=0.0
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,[YHTE2]
      ,[NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,[OPISTLKM]
      ,[NOPISTLKM]
      ,[OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[ORAHAS] AS [OKMRAHAS]
	  ,NULL AS [BUDJETTI]
	  ,NULL AS [orahas]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]=NULL
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_14_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_5_4_sopv_14_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,[GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE]  = NULL
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,[YHTE2]
      ,[NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,[OPISTLKM]
      ,[NOPISTLKM]
      ,[OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[ORAHAS] AS [OKMRAHAS]
	  ,NULL AS [BUDJETTI]
	  ,NULL AS [orahas]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]=NULL
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_15_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
  FROM [TK_H9098_CSC].[dbo].[TK_5_4_sopv_15_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,NULL AS [MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[ORAHAS] AS [OKMRAHAS]
	  ,NULL AS [BUDJETTI]
	  ,NULL AS [orahas]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_16_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
  FROM [TK_H9098_CSC].[dbo].[TK_5_4_sopv_16_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,NULL AS [MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[ORAHAS] AS [OKMRAHAS]
	  ,NULL AS [BUDJETTI]
	  ,NULL AS [orahas]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_17_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_5_4_sopv_17_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[OKMRAHAS] = null --coalesce(BUDJETTI,0) + coalesce(AORAHAS,0)
	  ,[BUDJETTI]
	  ,[orahas] = [AORAHAS]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_18_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_5_4_sopv_18_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL	  
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[OKMRAHAS] = null --coalesce(BUDJETTI,0) + coalesce(AORAHAS,0)
	  ,[BUDJETTI]
	  ,[orahas] = [AORAHAS]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_19_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_K5_4_sopv_19_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[OKMRAHAS] = null --coalesce(BUDJETTI,0) + coalesce(AORAHAS,0)
	  ,[BUDJETTI]
	  ,[orahas] = [AORAHAS]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_20_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_K5_4_sopv_20_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[OKMRAHAS] = null --coalesce(BUDJETTI,0) + coalesce(AORAHAS,0)
	  ,[BUDJETTI]
	  ,[orahas] = [AORAHAS]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_21_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_K5_4_sopv_21_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[OKMRAHAS] = null --coalesce(BUDJETTI,0) + coalesce(AORAHAS,0)
	  ,[BUDJETTI]
	  ,[orahas] = [AORAHAS]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_22_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_K5_4_sopv_22_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL 
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[OKMRAHAS] = null --coalesce(BUDJETTI,0) + coalesce(AORAHAS,0)
	  ,[BUDJETTI]
	  ,[orahas] = [AORAHAS]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue] = NULL
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_23_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_K5_4_sopv_23_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm] = [NDIPLKM]
      ,[dittv] = [DIPTTV]
      ,[INSLKM]
      ,[Nyhtlkm] = [NOPINS]
      ,[insttv] = [OPINSTTV]
      ,[yhtlkm] = [YHTE]
      ,[ninslkm] = [NYHTE]
      ,[YHTTTV]
      ,[palme] = [PAME]
      ,[ostpa] = [OSTPAL]
      ,[ysyht] = [YHME]
      ,[TEKES]
      ,[mktm] = [MTEM]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys] = [KOTIM]
      ,[auys] = [ULKOY]
      ,[aeus] = [UEU]
	  ,[EUPUITE] = NULL
      ,[amus] = [MULKO]
      ,[Uyhtlkm] = [UYHTE]
      ,[K_NRO1] = [KUNTA1]
      ,[K_NRO2] = [KUNTA2]
      ,[K_NRO3] = [KUNTA3]
      ,[K_NRO4] = [KUNTA4]
      ,[K_NRO5] = [KUNTA5]
      ,[K_NRO6] = [KUNTA6]
      ,[K_NRO7] = [KUNTA7]
      ,[K_NRO8] = [KUNTA8]
      ,[K_NRO9] = [KUNTA9]
      ,[K_NRO10] = [KUNTA10]
      ,[K_NRO11] = [KUNTA11]
      ,[K_NRO12] = [KUNTA12]
      ,[K_NRO13] = [KUNTA13]
      ,[K_NRO14] = [KUNTA14]
      ,[K_NRO15] = [KUNTA15]
      ,[K_NRO16] = [KUNTA16]
      ,[K_NRO17] = [KUNTA17]
      ,[K_NRO18] = [KUNTA18]
      ,[K_NRO19] = [KUNTA19]
      ,[K_NRO20] = [KUNTA20]
      ,[K_NRO21] = [KUNTA21]
      ,[K_NRO22] = [KUNTA22]
      ,[K_NRO23] = [KUNTA23]
      ,[K_NRO24] = [KUNTA24]
      ,[K_NRO25] = [KUNTA25]
	  ,[K_NRO26] = NULL
	  ,[K_NRO27] = NULL
	  ,[K_NRO28] = NULL
	  ,[K_NRO29] = NULL
	  ,[K_NRO30] = NULL
	  ,[K_NRO31] = NULL
	  ,[K_NRO32] = NULL
	  ,[K_NRO33] = NULL
      ,[YHTHY] = [HENLKMY]
      ,[TTVY] = [TYOVY]
      ,[A_YSY] = [TKMENOY]
      ,[YHTH1] = [HENLKM1]
      ,[YHTH2] = [HENLKM2]
      ,[YHTH3] = [HENLKM3]
      ,[YHTH4] = [HENLKM4]
      ,[YHTH5] = [HENLKM5]
      ,[YHTH6] = [HENLKM6]
      ,[YHTH7] = [HENLKM7]
      ,[YHTH8] = [HENLKM8]
      ,[YHTH9] = [HENLKM9]
      ,[YHTH10] = [HENLKM10]
      ,[YHTH11] = [HENLKM11]
      ,[YHTH12] = [HENLKM12]
      ,[YHTH13] = [HENLKM13]
      ,[YHTH14] = [HENLKM14]
      ,[YHTH15] = [HENLKM15]
      ,[YHTH16] = [HENLKM16]
      ,[YHTH17] = [HENLKM17]
      ,[YHTH18] = [HENLKM18]
      ,[YHTH19] = [HENLKM19]
      ,[YHTH20] = [HENLKM20]
      ,[YHTH21] = [HENLKM21]
      ,[YHTH22] = [HENLKM22]
      ,[YHTH23] = [HENLKM23]
      ,[YHTH24] = [HENLKM24]
      ,[YHTH25] = [HENLKM25]
	  ,[YHTH26] = NULL
	  ,[YHTH27] = NULL
	  ,[YHTH28] = NULL
	  ,[YHTH29] = NULL
	  ,[YHTH30] = NULL
	  ,[YHTH31] = NULL
	  ,[YHTH32] = NULL
	  ,[YHTH33] = NULL
      ,[TTV1] = [TYOV1]
      ,[TTV2] = [TYOV2]
      ,[TTV3] = [TYOV3]
      ,[TTV4] = [TYOV4]
      ,[TTV5] = [TYOV5]
      ,[TTV6] = [TYOV6]
      ,[TTV7] = [TYOV7]
      ,[TTV8] = [TYOV8]
      ,[TTV9] = [TYOV9]
      ,[TTV10] = [TYOV10]
      ,[TTV11] = [TYOV11]
      ,[TTV12] = [TYOV12]
      ,[TTV13] = [TYOV13]
      ,[TTV14] = [TYOV14]
      ,[TTV15] = [TYOV15]
      ,[TTV16] = [TYOV16]
      ,[TTV17] = [TYOV17]
      ,[TTV18] = [TYOV18]
      ,[TTV19] = [TYOV19]
      ,[TTV20] = [TYOV20]
      ,[TTV21] = [TYOV21]
      ,[TTV22] = [TYOV22]
      ,[TTV23] = [TYOV23]
      ,[TTV24] = [TYOV24]
      ,[TTV25] = [TYOV25]
	  ,[TTV26] = NULL
	  ,[TTV27] = NULL
	  ,[TTV28] = NULL
	  ,[TTV29] = NULL
	  ,[TTV30] = NULL
	  ,[TTV31] = NULL
	  ,[TTV32] = NULL
	  ,[TTV33] = NULL
      ,[A_YS1] = [TKMENO1]
      ,[A_YS2] = [TKMENO2]
      ,[A_YS3] = [TKMENO3]
      ,[A_YS4] = [TKMENO4]
      ,[A_YS5] = [TKMENO5]
      ,[A_YS6] = [TKMENO6]
      ,[A_YS7] = [TKMENO7]
      ,[A_YS8] = [TKMENO8]
      ,[A_YS9] = [TKMENO9]
      ,[A_YS10] = [TKMENO10]
      ,[A_YS11] = [TKMENO11]
      ,[A_YS12] = [TKMENO12]
      ,[A_YS13] = [TKMENO13]
      ,[A_YS14] = [TKMENO14]
      ,[A_YS15] = [TKMENO15]
      ,[A_YS16] = [TKMENO16]
      ,[A_YS17] = [TKMENO17]
      ,[A_YS18] = [TKMENO18]
      ,[A_YS19] = [TKMENO19]
      ,[A_YS20] = [TKMENO20]
      ,[A_YS21] = [TKMENO21]
      ,[A_YS22] = [TKMENO22]
      ,[A_YS23] = [TKMENO23]
      ,[A_YS24] = [TKMENO24]
      ,[A_YS25] = [TKMENO25]
	  ,[A_YS26] = NULL
	  ,[A_YS27] = NULL
	  ,[A_YS28] = NULL
	  ,[A_YS29] = NULL
	  ,[A_YS30] = NULL
	  ,[A_YS31] = NULL
	  ,[A_YS32] = NULL
	  ,[A_YS33] = NULL
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19] = NULL
	  ,[TA20] = NULL
	  ,[TA21] = NULL
	  ,[TA22] = NULL
	  ,[TA23] = NULL
	  ,[TA24] = NULL
	  ,[TA25] = NULL
	  ,[TA26] = NULL
	  ,[TA27] = NULL
	  ,[TA28] = NULL
	  ,[TA29] = NULL
	  ,[TA30] = NULL
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P] = NULL
	  ,[TA20P] = NULL
	  ,[TA21P] = NULL
	  ,[TA22P] = NULL
	  ,[TA23P] = NULL
	  ,[TA24P] = NULL
	  ,[TA25P] = NULL
	  ,[TA26P] = NULL
	  ,[TA27P] = NULL
	  ,[TA28P] = NULL
	  ,[TA29P] = NULL
	  ,[TA30P] = NULL
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[OKMRAHAS] = null --coalesce(BUDJETTI,0) + coalesce(AORAHAS,0)
	  ,[BUDJETTI]
	  ,[orahas] = [AORAHAS]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue]
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_24_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_K5_4_sopv_24_sekt]

UNION ALL

SELECT [tilv]
      ,[NIMI]
      ,[NIMI2]
      ,[TK_koodi]
      ,[TOLKM]
      ,[NTOLKM]
      ,[TOTTV]
      ,[LISLKM]
      ,[NLISLKM]
      ,[LISTTV]
      ,[DILKM]
      ,[ndilkm]
      ,[dittv]
      ,[INSLKM]
      ,[Nyhtlkm]
      ,[insttv]
      ,[yhtlkm]
      ,[ninslkm]
      ,[YHTTTV]
      ,[palme]
      ,[ostpa]
      ,[ysyht]
      ,[TEKES]
      ,[mktm]
      ,[AKATEMIA]
      ,NULL AS [GRAD]
      ,[MOPEM]
      ,[LIIKM]
      ,[MAAM]
      ,[OM]
      ,[PM]
      ,[SISAM]
      ,[SOSM]
      ,[UM]
      ,[VN]
      ,[VM]
      ,[YMP]
      ,[MUUJU]
      ,[RAHAS]
      ,[akys]
      ,[auys]
      ,[aeus]
	  ,[EUPUITE] = null
      ,[amus]
      ,[Uyhtlkm]
      ,[K_NRO1]
      ,[K_NRO2]
      ,[K_NRO3]
      ,[K_NRO4]
      ,[K_NRO5]
      ,[K_NRO6]
      ,[K_NRO7]
      ,[K_NRO8]
      ,[K_NRO9]
      ,[K_NRO10]
      ,[K_NRO11]
      ,[K_NRO12]
      ,[K_NRO13]
      ,[K_NRO14]
      ,[K_NRO15]
      ,[K_NRO16]
      ,[K_NRO17]
      ,[K_NRO18]
      ,[K_NRO19]
      ,[K_NRO20]
      ,[K_NRO21]
      ,[K_NRO22]
      ,[K_NRO23]
      ,[K_NRO24]
      ,[K_NRO25]
	  ,[K_NRO26]
	  ,[K_NRO27]
	  ,[K_NRO28]
	  ,[K_NRO29]
	  ,[K_NRO30]
	  ,[K_NRO31]
	  ,[K_NRO32]
	  ,[K_NRO33]
      ,[YHTHY]
      ,[TTVY]
      ,[A_YSY]
      ,[YHTH1]
      ,[YHTH2]
      ,[YHTH3]
      ,[YHTH4]
      ,[YHTH5]
      ,[YHTH6]
      ,[YHTH7]
      ,[YHTH8]
      ,[YHTH9]
      ,[YHTH10]
      ,[YHTH11]
      ,[YHTH12]
      ,[YHTH13]
      ,[YHTH14]
      ,[YHTH15]
      ,[YHTH16]
      ,[YHTH17]
      ,[YHTH18]
      ,[YHTH19]
      ,[YHTH20]
      ,[YHTH21]
      ,[YHTH22]
      ,[YHTH23]
      ,[YHTH24]
      ,[YHTH25]
	  ,[YHTH26]
	  ,[YHTH27]
	  ,[YHTH28]
	  ,[YHTH29]
	  ,[YHTH30]
	  ,[YHTH31]
	  ,[YHTH32]
	  ,[YHTH33]
      ,[TTV1]
      ,[TTV2]
      ,[TTV3]
      ,[TTV4]
      ,[TTV5]
      ,[TTV6]
      ,[TTV7]
      ,[TTV8]
      ,[TTV9]
      ,[TTV10]
      ,[TTV11]
      ,[TTV12]
      ,[TTV13]
      ,[TTV14]
      ,[TTV15]
      ,[TTV16]
      ,[TTV17]
      ,[TTV18]
      ,[TTV19]
      ,[TTV20]
      ,[TTV21]
      ,[TTV22]
      ,[TTV23]
      ,[TTV24]
      ,[TTV25]
	  ,[TTV26]
	  ,[TTV27]
	  ,[TTV28]
	  ,[TTV29]
	  ,[TTV30]
	  ,[TTV31]
	  ,[TTV32]
	  ,[TTV33]
      ,[A_YS1]
      ,[A_YS2]
      ,[A_YS3]
      ,[A_YS4]
      ,[A_YS5]
      ,[A_YS6]
      ,[A_YS7]
      ,[A_YS8]
      ,[A_YS9]
      ,[A_YS10]
      ,[A_YS11]
      ,[A_YS12]
      ,[A_YS13]
      ,[A_YS14]
      ,[A_YS15]
      ,[A_YS16]
      ,[A_YS17]
      ,[A_YS18]
      ,[A_YS19]
      ,[A_YS20]
      ,[A_YS21]
      ,[A_YS22]
      ,[A_YS23]
      ,[A_YS24]
      ,[A_YS25]
	  ,[A_YS26]
	  ,[A_YS27]
	  ,[A_YS28]
	  ,[A_YS29]
	  ,[A_YS30]
	  ,[A_YS31]
	  ,[A_YS32]
	  ,[A_YS33]
      ,[TA1]
      ,[TA2]
      ,[TA3]
      ,[TA4]
      ,[TA5]
      ,[TA6]
      ,[TA7]
      ,[TA8]
      ,[TA9]
      ,[TA10]
      ,[TA11]
      ,[TA12]
      ,[TA13]
      ,[TA14]
      ,[TA15]
      ,[TA16]
      ,[TA17]
      ,[TA18]
	  ,[TA19]
	  ,[TA20]
	  ,[TA21]
	  ,[TA22]
	  ,[TA23]
	  ,[TA24]
	  ,[TA25]
	  ,[TA26]
	  ,[TA27]
	  ,[TA28]
	  ,[TA29]
	  ,[TA30]
      ,[TA1P]
      ,[TA2P]
      ,[TA3P]
      ,[TA4P]
      ,[TA5P]
      ,[TA6P]
      ,[TA7P]
      ,[TA8P]
      ,[TA9P]
      ,[TA10P]
      ,[TA11P]
      ,[TA12P]
      ,[TA13P]
      ,[TA14P]
      ,[TA15P]
      ,[TA16P]
      ,[TA17P]
      ,[TA18P]
	  ,[TA19P]
	  ,[TA20P]
	  ,[TA21P]
	  ,[TA22P]
	  ,[TA23P]
	  ,[TA24P]
	  ,[TA25P]
	  ,[TA26P]
	  ,[TA27P]
	  ,[TA28P]
	  ,[TA29P]
	  ,[TA30P]
      ,[tk_arvio]
      ,[tk_arvioe]
      ,[KMENO]
      ,[HMENO]
      ,[TUTLKM]
      ,[NTUTLKM]
      ,[TUTTTV]
      ,[MTKLKM]
      ,[NMTKLKM]
      ,[MTKTTV]
      ,NULL AS [YHTE2]
      ,NULL AS [NYHTE2]
      ,[MKOULKM]
      ,[NMKOULKM]
      ,[MKOUTTV]
      ,NULL AS [OPISTLKM]
      ,NULL AS [NOPISTLKM]
      ,NULL AS [OPISTTTV]
      ,[KUNNAT]
      ,[MKVJ]
      ,[OKMRAHAS] = null --coalesce(BUDJETTI,0) + coalesce(AORAHAS,0)
	  ,[BUDJETTI]
	  ,[orahas]
      ,[phy1]
      ,[phy2]
      ,[phy3]
      ,[phy4]
      ,[phy5]
      ,[phy6]
      ,[phyy]
      ,[phn1]
      ,[phn2]
      ,[phn3]
      ,[phn4]
      ,[phn5]
      ,[phn6]
      ,[phny]
      ,[pty1]
      ,[pty2]
      ,[pty3]
      ,[pty4]
      ,[pty5]
      ,[pty6]
      ,[ptyy]
      ,[ptn1]
      ,[ptn2]
      ,[ptn3]
      ,[ptn4]
      ,[ptn5]
      ,[ptn6]
      ,[ptny]
      ,[RKORK]
	  ,[halue]
	  ,[luontipvm]
	  ,tieteenalakoodisto='TA10'
      ,[tietolahde]='TK_5_4_sopv_25_sekt'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY TK_Koodi)
FROM [TK_H9098_CSC].[dbo].[TK_K5_4_sopv_25_sekt]

) kaikkivuodet

GO


