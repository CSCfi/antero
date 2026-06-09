USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[_v_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet_nykytila_taulusta]    Script Date: 9.1.2026 13.39.11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












--amas, olosyys ja olotamm kommentoitu latauksesta ja liitoksista, koska eivät käytössä; sarakeryhmien tilalle latauksen myöhemmässä vaiheessa kalat1-3 / CSC Juha 17.9.2021

ALTER VIEW [dbo].[_v_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet_nykytila_taulusta] as

/****** Script for SelectTopNRows command from SSMS  ******/
--Select * from [okm].[okm_ktpo_tiedontuotanto_in].f --> 6588 rows
--Select * from [vipunen_ETL].[v_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet] --> 6588 rows

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[syntv]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[alvv_kk]
      ,[allk_kk]
      ,[ololk]
      ,[klaji]
      --,[ophal]
      ,f.[jarj]
      ,[kkun]
      ,[koulk]
      ,[pohjkoulk]
      ,[rahlahde]
      ,f.[tietolahde]
      ,f.[rivinumero]
      ,f.[aineistorivinumero]

      ,f.[lkm]


--2009
      ,'amk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2009] AND
      suorlk = [amksuorlk_2009] AND
      tutkmaak = [amktutkkmaak_2009] AND
      tutkjarj = [amktutkjarj_2009] AND
      tutkkoulk = [amktutkkoulk_2009]  )
      ,'ylamk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2009] AND
      suorlk = [ylamksuorlk_2009] AND
      tutkmaak = [ylamktutkkmaak_2009] AND
      tutkjarj = [ylamktutkjarj_2009] AND
      tutkkoulk = [ylamktutkkoulk_2009]  )
      ,'alkk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2009] AND
      suorlk = [alkksuorlk_2009] AND
      tutkmaak = [alkktutkkmaak_2009] AND
      tutkjarj = [alkktutkjarj_2009] AND
      tutkkoulk = [alkktutkkoulk_2009]  )
      ,'ylkk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2009] AND
      suorlk = [ylkksuorlk_2009] AND
      tutkmaak = [ylkktutkkmaak_2009] AND
      tutkjarj = [ylkktutkjarj_2009] AND
      tutkkoulk = [ylkktutkkoulk_2009]  )
      ,'tk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2009] AND
      suorlk = [tksuorlk_2009] AND
      tutkmaak = [tktutkkmaak_2009] AND
      tutkjarj = [tktutkjarj_2009] AND
      tutkkoulk = [tktutkkoulk_2009]  )
      ,'muuta_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2009] AND
      suorlk = [muutasuorlk_2009] AND
      tutkmaak = [muutatutkkmaak_2009] AND
      tutkjarj = [muutatutkjarj_2009] AND
      tutkkoulk = [muutatutkkoulk_2009]  )
      ,'amkopisk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2009] AND
      opiskjarj_2 = [amkopiskjarj_2009] AND
      kmaak_2 = [amkkmaak_2009] --AND
      --olotamm_2 = [amkolotamm_2009] AND
      --olosyys_2 = [amkolosyys_2009]  
      )
      ,'ylamkopisk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2009] AND
      opiskjarj_2 = [ylamkopiskjarj_2009] AND
      kmaak_2 = [ylamkkmaak_2009] --AND
      --olotamm_2 = [ylamkolotamm_2009] AND
      --olosyys_2 = [ylamkolosyys_2009]  
      )
      ,'alkkopisk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2009] AND
      opiskjarj_2 = [alkkopiskjarj_2009] AND
      kmaak_2 = [alkkkmaak_2009] --AND
      --olotamm_2 = [alkkolotamm_2009] AND
      --olosyys_2 = [alkkolosyys_2009]  
      )
      ,'ylkkopisk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2009] AND
      opiskjarj_2 = [ylkkopiskjarj_2009] AND
      kmaak_2 = [ylkkkmaak_2009] --AND
      --olotamm_2 = [ylkkolotamm_2009] AND
      --olosyys_2 = [ylkkolosyys_2009]  
      )
      ,'tkopisk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2009] AND
      opiskjarj_2 = [tkopiskjarj_2009] AND
      kmaak_2 = [tkkmaak_2009] --AND
      --olotamm_2 = [tkolotamm_2009] AND
      --olosyys_2 = [tkolosyys_2009]  
      )
      ,'muutaopisk_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2009] AND
      opiskjarj_2 = [muutaopiskjarj_2009] AND
      kmaak_2 = [muutakmaak_2009] --AND
      --olotamm_2 = [muutaolotamm_2009] AND
      --olosyys_2 = [muutaolosyys_2009]  
      )
      ,'ptoim1r5_2009' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2009]  )
      --amas = [amas_2009]  )
--2010
      ,'amk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2010] AND
      suorlk = [amksuorlk_2010] AND
      tutkmaak = [amktutkkmaak_2010] AND
      tutkjarj = [amktutkjarj_2010] AND
      tutkkoulk = [amktutkkoulk_2010]  )
      ,'ylamk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2010] AND
      suorlk = [ylamksuorlk_2010] AND
      tutkmaak = [ylamktutkkmaak_2010] AND
      tutkjarj = [ylamktutkjarj_2010] AND
      tutkkoulk = [ylamktutkkoulk_2010]  )
      ,'alkk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2010] AND
      suorlk = [alkksuorlk_2010] AND
      tutkmaak = [alkktutkkmaak_2010] AND
      tutkjarj = [alkktutkjarj_2010] AND
      tutkkoulk = [alkktutkkoulk_2010]  )
      ,'ylkk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2010] AND
      suorlk = [ylkksuorlk_2010] AND
      tutkmaak = [ylkktutkkmaak_2010] AND
      tutkjarj = [ylkktutkjarj_2010] AND
      tutkkoulk = [ylkktutkkoulk_2010]  )
      ,'tk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2010] AND
      suorlk = [tksuorlk_2010] AND
      tutkmaak = [tktutkkmaak_2010] AND
      tutkjarj = [tktutkjarj_2010] AND
      tutkkoulk = [tktutkkoulk_2010]  )
      ,'muuta_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2010] AND
      suorlk = [muutasuorlk_2010] AND
      tutkmaak = [muutatutkkmaak_2010] AND
      tutkjarj = [muutatutkjarj_2010] AND
      tutkkoulk = [muutatutkkoulk_2010]  )
      ,'amkopisk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2010] AND
      opiskjarj_2 = [amkopiskjarj_2010] AND
      kmaak_2 = [amkkmaak_2010] --AND
      --olotamm_2 = [amkolotamm_2010] AND
      --olosyys_2 = [amkolosyys_2010]  
      )
      ,'ylamkopisk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2010] AND
      opiskjarj_2 = [ylamkopiskjarj_2010] AND
      kmaak_2 = [ylamkkmaak_2010] --AND
      --olotamm_2 = [ylamkolotamm_2010] AND
      --olosyys_2 = [ylamkolosyys_2010]  
      )
      ,'alkkopisk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2010] AND
      opiskjarj_2 = [alkkopiskjarj_2010] AND
      kmaak_2 = [alkkkmaak_2010] --AND
      --olotamm_2 = [alkkolotamm_2010] AND
      --olosyys_2 = [alkkolosyys_2010]  
      )
      ,'ylkkopisk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2010] AND
      opiskjarj_2 = [ylkkopiskjarj_2010] AND
      kmaak_2 = [ylkkkmaak_2010] --AND
      --olotamm_2 = [ylkkolotamm_2010] AND
      --olosyys_2 = [ylkkolosyys_2010]  
      )
      ,'tkopisk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2010] AND
      opiskjarj_2 = [tkopiskjarj_2010] AND
      kmaak_2 = [tkkmaak_2010] --AND
      --olotamm_2 = [tkolotamm_2010] AND
      --olosyys_2 = [tkolosyys_2010]  
      )
      ,'muutaopisk_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2010] AND
      opiskjarj_2 = [muutaopiskjarj_2010] AND
      kmaak_2 = [muutakmaak_2010] --AND
      --olotamm_2 = [muutaolotamm_2010] AND
      --olosyys_2 = [muutaolosyys_2010]  
      )
      ,'ptoim1r5_2010' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2010]  )
      --amas = [amas_2010]  )
--2011
      ,'amk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2011] AND
      suorlk = [amksuorlk_2011] AND
      tutkmaak = [amktutkkmaak_2011] AND
      tutkjarj = [amktutkjarj_2011] AND
      tutkkoulk = [amktutkkoulk_2011]  )
      ,'ylamk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2011] AND
      suorlk = [ylamksuorlk_2011] AND
      tutkmaak = [ylamktutkkmaak_2011] AND
      tutkjarj = [ylamktutkjarj_2011] AND
      tutkkoulk = [ylamktutkkoulk_2011]  )
      ,'alkk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2011] AND
      suorlk = [alkksuorlk_2011] AND
      tutkmaak = [alkktutkkmaak_2011] AND
      tutkjarj = [alkktutkjarj_2011] AND
      tutkkoulk = [alkktutkkoulk_2011]  )
      ,'ylkk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2011] AND
      suorlk = [ylkksuorlk_2011] AND
      tutkmaak = [ylkktutkkmaak_2011] AND
      tutkjarj = [ylkktutkjarj_2011] AND
      tutkkoulk = [ylkktutkkoulk_2011]  )
      ,'tk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2011] AND
      suorlk = [tksuorlk_2011] AND
      tutkmaak = [tktutkkmaak_2011] AND
      tutkjarj = [tktutkjarj_2011] AND
      tutkkoulk = [tktutkkoulk_2011]  )
      ,'muuta_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2011] AND
      suorlk = [muutasuorlk_2011] AND
      tutkmaak = [muutatutkkmaak_2011] AND
      tutkjarj = [muutatutkjarj_2011] AND
      tutkkoulk = [muutatutkkoulk_2011]  )
      ,'amkopisk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2011] AND
      opiskjarj_2 = [amkopiskjarj_2011] AND
      kmaak_2 = [amkkmaak_2011] --AND
      --olotamm_2 = [amkolotamm_2011] AND
      --olosyys_2 = [amkolosyys_2011]  
      )
      ,'ylamkopisk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2011] AND
      opiskjarj_2 = [ylamkopiskjarj_2011] AND
      kmaak_2 = [ylamkkmaak_2011] --AND
      --olotamm_2 = [ylamkolotamm_2011] AND
      --olosyys_2 = [ylamkolosyys_2011]  
      )
      ,'alkkopisk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2011] AND
      opiskjarj_2 = [alkkopiskjarj_2011] AND
      kmaak_2 = [alkkkmaak_2011] --AND
      --olotamm_2 = [alkkolotamm_2011] AND
      --olosyys_2 = [alkkolosyys_2011]  
      )
      ,'ylkkopisk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2011] AND
      opiskjarj_2 = [ylkkopiskjarj_2011] AND
      kmaak_2 = [ylkkkmaak_2011] --AND
      --olotamm_2 = [ylkkolotamm_2011] AND
      --olosyys_2 = [ylkkolosyys_2011]  
      )
      ,'tkopisk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2011] AND
      opiskjarj_2 = [tkopiskjarj_2011] AND
      kmaak_2 = [tkkmaak_2011] --AND
      --olotamm_2 = [tkolotamm_2011] AND
      --olosyys_2 = [tkolosyys_2011]  
      )
      ,'muutaopisk_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2011] AND
      opiskjarj_2 = [muutaopiskjarj_2011] AND
      kmaak_2 = [muutakmaak_2011] --AND
      --olotamm_2 = [muutaolotamm_2011] AND
      --olosyys_2 = [muutaolosyys_2011]  
      )
      ,'ptoim1r5_2011' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2011]  )
      --amas = [amas_2011]  )
--2012
      ,'amk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2012] AND
      suorlk = [amksuorlk_2012] AND
      tutkmaak = [amktutkkmaak_2012] AND
      tutkjarj = [amktutkjarj_2012] AND
      tutkkoulk = [amktutkkoulk_2012]  )
      ,'ylamk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2012] AND
      suorlk = [ylamksuorlk_2012] AND
      tutkmaak = [ylamktutkkmaak_2012] AND
      tutkjarj = [ylamktutkjarj_2012] AND
      tutkkoulk = [ylamktutkkoulk_2012]  )
      ,'alkk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2012] AND
      suorlk = [alkksuorlk_2012] AND
      tutkmaak = [alkktutkkmaak_2012] AND
      tutkjarj = [alkktutkjarj_2012] AND
      tutkkoulk = [alkktutkkoulk_2012]  )
      ,'ylkk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2012] AND
      suorlk = [ylkksuorlk_2012] AND
      tutkmaak = [ylkktutkkmaak_2012] AND
      tutkjarj = [ylkktutkjarj_2012] AND
      tutkkoulk = [ylkktutkkoulk_2012]  )
      ,'tk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2012] AND
      suorlk = [tksuorlk_2012] AND
      tutkmaak = [tktutkkmaak_2012] AND
      tutkjarj = [tktutkjarj_2012] AND
      tutkkoulk = [tktutkkoulk_2012]  )
      ,'muuta_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2012] AND
      suorlk = [muutasuorlk_2012] AND
      tutkmaak = [muutatutkkmaak_2012] AND
      tutkjarj = [muutatutkjarj_2012] AND
      tutkkoulk = [muutatutkkoulk_2012]  )
      ,'amkopisk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2012] AND
      opiskjarj_2 = [amkopiskjarj_2012] AND
      kmaak_2 = [amkkmaak_2012] --AND
      --olotamm_2 = [amkolotamm_2012] AND
      --olosyys_2 = [amkolosyys_2012]  
      )
      ,'ylamkopisk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2012] AND
      opiskjarj_2 = [ylamkopiskjarj_2012] AND
      kmaak_2 = [ylamkkmaak_2012] --AND
      --olotamm_2 = [ylamkolotamm_2012] AND
      --olosyys_2 = [ylamkolosyys_2012]  
      )
      ,'alkkopisk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2012] AND
      opiskjarj_2 = [alkkopiskjarj_2012] AND
      kmaak_2 = [alkkkmaak_2012] --AND
      --olotamm_2 = [alkkolotamm_2012] AND
      --olosyys_2 = [alkkolosyys_2012]  
      )
      ,'ylkkopisk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2012] AND
      opiskjarj_2 = [ylkkopiskjarj_2012] AND
      kmaak_2 = [ylkkkmaak_2012] --AND
      --olotamm_2 = [ylkkolotamm_2012] AND
      --olosyys_2 = [ylkkolosyys_2012]  
      )
      ,'tkopisk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2012] AND
      opiskjarj_2 = [tkopiskjarj_2012] AND
      kmaak_2 = [tkkmaak_2012] --AND
      --olotamm_2 = [tkolotamm_2012] AND
      --olosyys_2 = [tkolosyys_2012]  
      )
      ,'muutaopisk_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2012] AND
      opiskjarj_2 = [muutaopiskjarj_2012] AND
      kmaak_2 = [muutakmaak_2012] --AND
      --olotamm_2 = [muutaolotamm_2012] AND
      --olosyys_2 = [muutaolosyys_2012]  
      )
      ,'ptoim1r5_2012' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2012]  )
      --amas = [amas_2012]  )
--2013
      ,'amk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2013] AND
      suorlk = [amksuorlk_2013] AND
      tutkmaak = [amktutkkmaak_2013] AND
      tutkjarj = [amktutkjarj_2013] AND
      tutkkoulk = [amktutkkoulk_2013]  )
      ,'ylamk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2013] AND
      suorlk = [ylamksuorlk_2013] AND
      tutkmaak = [ylamktutkkmaak_2013] AND
      tutkjarj = [ylamktutkjarj_2013] AND
      tutkkoulk = [ylamktutkkoulk_2013]  )
      ,'alkk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2013] AND
      suorlk = [alkksuorlk_2013] AND
      tutkmaak = [alkktutkkmaak_2013] AND
      tutkjarj = [alkktutkjarj_2013] AND
      tutkkoulk = [alkktutkkoulk_2013]  )
      ,'ylkk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2013] AND
      suorlk = [ylkksuorlk_2013] AND
      tutkmaak = [ylkktutkkmaak_2013] AND
      tutkjarj = [ylkktutkjarj_2013] AND
      tutkkoulk = [ylkktutkkoulk_2013]  )
      ,'tk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2013] AND
      suorlk = [tksuorlk_2013] AND
      tutkmaak = [tktutkkmaak_2013] AND
      tutkjarj = [tktutkjarj_2013] AND
      tutkkoulk = [tktutkkoulk_2013]  )
      ,'muuta_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2013] AND
      suorlk = [muutasuorlk_2013] AND
      tutkmaak = [muutatutkkmaak_2013] AND
      tutkjarj = [muutatutkjarj_2013] AND
      tutkkoulk = [muutatutkkoulk_2013]  )
      ,'amkopisk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2013] AND
      opiskjarj_2 = [amkopiskjarj_2013] AND
      kmaak_2 = [amkkmaak_2013] --AND
      --olotamm_2 = [amkolotamm_2013] AND
      --olosyys_2 = [amkolosyys_2013]  
      )
      ,'ylamkopisk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2013] AND
      opiskjarj_2 = [ylamkopiskjarj_2013] AND
      kmaak_2 = [ylamkkmaak_2013] --AND
      --olotamm_2 = [ylamkolotamm_2013] AND
      --olosyys_2 = [ylamkolosyys_2013]  
      )
      ,'alkkopisk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2013] AND
      opiskjarj_2 = [alkkopiskjarj_2013] AND
      kmaak_2 = [alkkkmaak_2013] --AND
      --olotamm_2 = [alkkolotamm_2013] AND
      --olosyys_2 = [alkkolosyys_2013]  
      )
      ,'ylkkopisk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2013] AND
      opiskjarj_2 = [ylkkopiskjarj_2013] AND
      kmaak_2 = [ylkkkmaak_2013] --AND
      --olotamm_2 = [ylkkolotamm_2013] AND
      --olosyys_2 = [ylkkolosyys_2013]  
      )
      ,'tkopisk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2013] AND
      opiskjarj_2 = [tkopiskjarj_2013] AND
      kmaak_2 = [tkkmaak_2013] --AND
      --olotamm_2 = [tkolotamm_2013] AND
      --olosyys_2 = [tkolosyys_2013]  
      )
      ,'muutaopisk_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2013] AND
      opiskjarj_2 = [muutaopiskjarj_2013] AND
      kmaak_2 = [muutakmaak_2013] --AND
      --olotamm_2 = [muutaolotamm_2013] AND
      --olosyys_2 = [muutaolosyys_2013]  
      )
      ,'ptoim1r5_2013' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2013]  )
      --amas = [amas_2013]  )

-- 2014

      ,'amk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2014] AND
      suorlk = [amksuorlk_2014] AND
      tutkmaak = [amktutkkmaak_2014] AND
      tutkjarj = [amktutkjarj_2014] AND
      tutkkoulk = [amktutkkoulk_2014]  )
      ,'ylamk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2014] AND
      suorlk = [ylamksuorlk_2014] AND
      tutkmaak = [ylamktutkkmaak_2014] AND
      tutkjarj = [ylamktutkjarj_2014] AND
      tutkkoulk = [ylamktutkkoulk_2014]  )
      ,'alkk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2014] AND
      suorlk = [alkksuorlk_2014] AND
      tutkmaak = [alkktutkkmaak_2014] AND
      tutkjarj = [alkktutkjarj_2014] AND
      tutkkoulk = [alkktutkkoulk_2014]  )
      ,'ylkk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2014] AND
      suorlk = [ylkksuorlk_2014] AND
      tutkmaak = [ylkktutkkmaak_2014] AND
      tutkjarj = [ylkktutkjarj_2014] AND
      tutkkoulk = [ylkktutkkoulk_2014]  )
      ,'tk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2014] AND
      suorlk = [tksuorlk_2014] AND
      tutkmaak = [tktutkkmaak_2014] AND
      tutkjarj = [tktutkjarj_2014] AND
      tutkkoulk = [tktutkkoulk_2014]  )
      ,'muuta_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2014] AND
      suorlk = [muutasuorlk_2014] AND
      tutkmaak = [muutatutkkmaak_2014] AND
      tutkjarj = [muutatutkjarj_2014] AND
      tutkkoulk = [muutatutkkoulk_2014]  )
      ,'amkopisk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2014] AND
      opiskjarj_2 = [amkopiskjarj_2014] AND
      kmaak_2 = [amkkmaak_2014] --AND
      --olotamm_2 = [amkolotamm_2014] AND
      --olosyys_2 = [amkolosyys_2014]  
      )
      ,'ylamkopisk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2014] AND
      opiskjarj_2 = [ylamkopiskjarj_2014] AND
      kmaak_2 = [ylamkkmaak_2014] --AND
      --olotamm_2 = [ylamkolotamm_2014] AND
      --olosyys_2 = [ylamkolosyys_2014]  
      )
      ,'alkkopisk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2014] AND
      opiskjarj_2 = [alkkopiskjarj_2014] AND
      kmaak_2 = [alkkkmaak_2014] --AND
      --olotamm_2 = [alkkolotamm_2014] AND
      --olosyys_2 = [alkkolosyys_2014]  
      )
      ,'ylkkopisk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2014] AND
      opiskjarj_2 = [ylkkopiskjarj_2014] AND
      kmaak_2 = [ylkkkmaak_2014] --AND
      --olotamm_2 = [ylkkolotamm_2014] AND
      --olosyys_2 = [ylkkolosyys_2014]  
      )
      ,'tkopisk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2014] AND
      opiskjarj_2 = [tkopiskjarj_2014] AND
      kmaak_2 = [tkkmaak_2014] --AND
      --olotamm_2 = [tkolotamm_2014] AND
      --olosyys_2 = [tkolosyys_2014]  
      )
      ,'muutaopisk_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2014] AND
      opiskjarj_2 = [muutaopiskjarj_2014] AND
      kmaak_2 = [muutakmaak_2014] --AND
      --olotamm_2 = [muutaolotamm_2014] AND
      --olosyys_2 = [muutaolosyys_2014]  
      )
      ,'ptoim1r5_2014' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2014]  )
      --amas = [amas_2014]  )

-- 2015

      ,'amk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2015] AND
      suorlk = [amksuorlk_2015] AND
      tutkmaak = [amktutkkmaak_2015] AND
      tutkjarj = [amktutkjarj_2015] AND
      tutkkoulk = [amktutkkoulk_2015]  )
      ,'ylamk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2015] AND
      suorlk = [ylamksuorlk_2015] AND
      tutkmaak = [ylamktutkkmaak_2015] AND
      tutkjarj = [ylamktutkjarj_2015] AND
      tutkkoulk = [ylamktutkkoulk_2015]  )
      ,'alkk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2015] AND
      suorlk = [alkksuorlk_2015] AND
      tutkmaak = [alkktutkkmaak_2015] AND
      tutkjarj = [alkktutkjarj_2015] AND
      tutkkoulk = [alkktutkkoulk_2015]  )
      ,'ylkk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2015] AND
      suorlk = [ylkksuorlk_2015] AND
      tutkmaak = [ylkktutkkmaak_2015] AND
      tutkjarj = [ylkktutkjarj_2015] AND
      tutkkoulk = [ylkktutkkoulk_2015]  )
      ,'tk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2015] AND
      suorlk = [tksuorlk_2015] AND
      tutkmaak = [tktutkkmaak_2015] AND
      tutkjarj = [tktutkjarj_2015] AND
      tutkkoulk = [tktutkkoulk_2015]  )
      ,'muuta_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2015] AND
      suorlk = [muutasuorlk_2015] AND
      tutkmaak = [muutatutkkmaak_2015] AND
      tutkjarj = [muutatutkjarj_2015] AND
      tutkkoulk = [muutatutkkoulk_2015]  )
      ,'amkopisk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2015] AND
      opiskjarj_2 = [amkopiskjarj_2015] AND
      kmaak_2 = [amkkmaak_2015] --AND
      --olotamm_2 = [amkolotamm_2015] AND
      --olosyys_2 = [amkolosyys_2015]  
      )
      ,'ylamkopisk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2015] AND
      opiskjarj_2 = [ylamkopiskjarj_2015] AND
      kmaak_2 = [ylamkkmaak_2015] --AND
      --olotamm_2 = [ylamkolotamm_2015] AND
      --olosyys_2 = [ylamkolosyys_2015]  
      )
      ,'alkkopisk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2015] AND
      opiskjarj_2 = [alkkopiskjarj_2015] AND
      kmaak_2 = [alkkkmaak_2015] --AND
      --olotamm_2 = [alkkolotamm_2015] AND
      --olosyys_2 = [alkkolosyys_2015]  
      )
      ,'ylkkopisk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2015] AND
      opiskjarj_2 = [ylkkopiskjarj_2015] AND
      kmaak_2 = [ylkkkmaak_2015] --AND
      --olotamm_2 = [ylkkolotamm_2015] AND
      --olosyys_2 = [ylkkolosyys_2015]  
      )
      ,'tkopisk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2015] AND
      opiskjarj_2 = [tkopiskjarj_2015] AND
      kmaak_2 = [tkkmaak_2015] --AND
      --olotamm_2 = [tkolotamm_2015] AND
      --olosyys_2 = [tkolosyys_2015]  
      )
      ,'muutaopisk_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2015] AND
      opiskjarj_2 = [muutaopiskjarj_2015] AND
      kmaak_2 = [muutakmaak_2015] --AND
      --olotamm_2 = [muutaolotamm_2015] AND
      --olosyys_2 = [muutaolosyys_2015]  
      )
      ,'ptoim1r5_2015' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2015]  )
      --amas = [amas_2015]  )

-- 2016

      ,'amk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2016] AND
      suorlk = [amksuorlk_2016] AND
      tutkmaak = [amktutkkmaak_2016] AND
      tutkjarj = [amktutkjarj_2016] AND
      tutkkoulk = [amktutkkoulk_2016]  )
      ,'ylamk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2016] AND
      suorlk = [ylamksuorlk_2016] AND
      tutkmaak = [ylamktutkkmaak_2016] AND
      tutkjarj = [ylamktutkjarj_2016] AND
      tutkkoulk = [ylamktutkkoulk_2016]  )
      ,'alkk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2016] AND
      suorlk = [alkksuorlk_2016] AND
      tutkmaak = [alkktutkkmaak_2016] AND
      tutkjarj = [alkktutkjarj_2016] AND
      tutkkoulk = [alkktutkkoulk_2016]  )
      ,'ylkk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2016] AND
      suorlk = [ylkksuorlk_2016] AND
      tutkmaak = [ylkktutkkmaak_2016] AND
      tutkjarj = [ylkktutkjarj_2016] AND
      tutkkoulk = [ylkktutkkoulk_2016]  )
      ,'tk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2016] AND
      suorlk = [tksuorlk_2016] AND
      tutkmaak = [tktutkkmaak_2016] AND
      tutkjarj = [tktutkjarj_2016] AND
      tutkkoulk = [tktutkkoulk_2016]  )
      ,'muuta_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2016] AND
      suorlk = [muutasuorlk_2016] AND
      tutkmaak = [muutatutkkmaak_2016] AND
      tutkjarj = [muutatutkjarj_2016] AND
      tutkkoulk = [muutatutkkoulk_2016]  )
      ,'amkopisk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2016] AND
      opiskjarj_2 = [amkopiskjarj_2016] AND
      kmaak_2 = [amkkmaak_2016] --AND
      --olotamm_2 = [amkolotamm_2016] AND
      --olosyys_2 = [amkolosyys_2016]  
      )
      ,'ylamkopisk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2016] AND
      opiskjarj_2 = [ylamkopiskjarj_2016] AND
      kmaak_2 = [ylamkkmaak_2016] --AND
      --olotamm_2 = [ylamkolotamm_2016] AND
      --olosyys_2 = [ylamkolosyys_2016]  
      )
      ,'alkkopisk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2016] AND
      opiskjarj_2 = [alkkopiskjarj_2016] AND
      kmaak_2 = [alkkkmaak_2016] --AND
      --olotamm_2 = [alkkolotamm_2016] AND
      --olosyys_2 = [alkkolosyys_2016]  
      )
      ,'ylkkopisk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2016] AND
      opiskjarj_2 = [ylkkopiskjarj_2016] AND
      kmaak_2 = [ylkkkmaak_2016] --AND
      --olotamm_2 = [ylkkolotamm_2016] AND
      --olosyys_2 = [ylkkolosyys_2016]  
      )
      ,'tkopisk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2016] AND
      opiskjarj_2 = [tkopiskjarj_2016] AND
      kmaak_2 = [tkkmaak_2016] --AND
      --olotamm_2 = [tkolotamm_2016] AND
      --olosyys_2 = [tkolosyys_2016]  
      )
      ,'muutaopisk_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2016] AND
      opiskjarj_2 = [muutaopiskjarj_2016] AND
      kmaak_2 = [muutakmaak_2016] --AND
      --olotamm_2 = [muutaolotamm_2016] AND
      --olosyys_2 = [muutaolosyys_2016]  
      )
      ,'ptoim1r5_2016' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2016]  )
      --amas = [amas_2016]  )

-- 2017

      ,'amk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2017] AND
      suorlk = [amksuorlk_2017] AND
      tutkmaak = [amktutkkmaak_2017] AND
      tutkjarj = [amktutkjarj_2017] AND
      tutkkoulk = [amktutkkoulk_2017]  )
      ,'ylamk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2017] AND
      suorlk = [ylamksuorlk_2017] AND
      tutkmaak = [ylamktutkkmaak_2017] AND
      tutkjarj = [ylamktutkjarj_2017] AND
      tutkkoulk = [ylamktutkkoulk_2017]  )
      ,'alkk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2017] AND
      suorlk = [alkksuorlk_2017] AND
      tutkmaak = [alkktutkkmaak_2017] AND
      tutkjarj = [alkktutkjarj_2017] AND
      tutkkoulk = [alkktutkkoulk_2017]  )
      ,'ylkk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2017] AND
      suorlk = [ylkksuorlk_2017] AND
      tutkmaak = [ylkktutkkmaak_2017] AND
      tutkjarj = [ylkktutkjarj_2017] AND
      tutkkoulk = [ylkktutkkoulk_2017]  )
      ,'tk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2017] AND
      suorlk = [tksuorlk_2017] AND
      tutkmaak = [tktutkkmaak_2017] AND
      tutkjarj = [tktutkjarj_2017] AND
      tutkkoulk = [tktutkkoulk_2017]  )
      ,'muuta_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2017] AND
      suorlk = [muutasuorlk_2017] AND
      tutkmaak = [muutatutkkmaak_2017] AND
      tutkjarj = [muutatutkjarj_2017] AND
      tutkkoulk = [muutatutkkoulk_2017]  )
      ,'amkopisk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2017] AND
      opiskjarj_2 = [amkopiskjarj_2017] AND
      kmaak_2 = [amkkmaak_2017] --AND
      --olotamm_2 = [amkolotamm_2017] AND
      --olosyys_2 = [amkolosyys_2017]  
      )
      ,'ylamkopisk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2017] AND
      opiskjarj_2 = [ylamkopiskjarj_2017] AND
      kmaak_2 = [ylamkkmaak_2017] --AND
      --olotamm_2 = [ylamkolotamm_2017] AND
      --olosyys_2 = [ylamkolosyys_2017]  
      )
      ,'alkkopisk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2017] AND
      opiskjarj_2 = [alkkopiskjarj_2017] AND
      kmaak_2 = [alkkkmaak_2017] --AND
      --olotamm_2 = [alkkolotamm_2017] AND
      --olosyys_2 = [alkkolosyys_2017]  
      )
      ,'ylkkopisk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2017] AND
      opiskjarj_2 = [ylkkopiskjarj_2017] AND
      kmaak_2 = [ylkkkmaak_2017] --AND
      --olotamm_2 = [ylkkolotamm_2017] AND
      --olosyys_2 = [ylkkolosyys_2017]  
      )
      ,'tkopisk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2017] AND
      opiskjarj_2 = [tkopiskjarj_2017] AND
      kmaak_2 = [tkkmaak_2017] --AND
      --olotamm_2 = [tkolotamm_2017] AND
      --olosyys_2 = [tkolosyys_2017]  
      )
      ,'muutaopisk_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2017] AND
      opiskjarj_2 = [muutaopiskjarj_2017] AND
      kmaak_2 = [muutakmaak_2017] --AND
      --olotamm_2 = [muutaolotamm_2017] AND
      --olosyys_2 = [muutaolosyys_2017]  
      )
      ,'ptoim1r5_2017' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2017]  )
      --amas = [amas_2017]  )

-- 2018

      ,'amk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2018] AND
      suorlk = [amksuorlk_2018] AND
      tutkmaak = [amktutkkmaak_2018] AND
      tutkjarj = [amktutkjarj_2018] AND
      tutkkoulk = [amktutkkoulk_2018]  )
      ,'ylamk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2018] AND
      suorlk = [ylamksuorlk_2018] AND
      tutkmaak = [ylamktutkkmaak_2018] AND
      tutkjarj = [ylamktutkjarj_2018] AND
      tutkkoulk = [ylamktutkkoulk_2018]  )
      ,'alkk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2018] AND
      suorlk = [alkksuorlk_2018] AND
      tutkmaak = [alkktutkkmaak_2018] AND
      tutkjarj = [alkktutkjarj_2018] AND
      tutkkoulk = [alkktutkkoulk_2018]  )
      ,'ylkk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2018] AND
      suorlk = [ylkksuorlk_2018] AND
      tutkmaak = [ylkktutkkmaak_2018] AND
      tutkjarj = [ylkktutkjarj_2018] AND
      tutkkoulk = [ylkktutkkoulk_2018]  )
      ,'tk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2018] AND
      suorlk = [tksuorlk_2018] AND
      tutkmaak = [tktutkkmaak_2018] AND
      tutkjarj = [tktutkjarj_2018] AND
      tutkkoulk = [tktutkkoulk_2018]  )
      ,'muuta_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2018] AND
      suorlk = [muutasuorlk_2018] AND
      tutkmaak = [muutatutkkmaak_2018] AND
      tutkjarj = [muutatutkjarj_2018] AND
      tutkkoulk = [muutatutkkoulk_2018]  )
      ,'amkopisk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2018] AND
      opiskjarj_2 = [amkopiskjarj_2018] AND
      kmaak_2 = [amkkmaak_2018] --AND
      --olotamm_2 = [amkolotamm_2018] AND
      --olosyys_2 = [amkolosyys_2018]  
      )
      ,'ylamkopisk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2018] AND
      opiskjarj_2 = [ylamkopiskjarj_2018] AND
      kmaak_2 = [ylamkkmaak_2018] --AND
      --olotamm_2 = [ylamkolotamm_2018] AND
      --olosyys_2 = [ylamkolosyys_2018]  
      )
      ,'alkkopisk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2018] AND
      opiskjarj_2 = [alkkopiskjarj_2018] AND
      kmaak_2 = [alkkkmaak_2018] --AND
      --olotamm_2 = [alkkolotamm_2018] AND
      --olosyys_2 = [alkkolosyys_2018]  
      )
      ,'ylkkopisk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2018] AND
      opiskjarj_2 = [ylkkopiskjarj_2018] AND
      kmaak_2 = [ylkkkmaak_2018] --AND
      --olotamm_2 = [ylkkolotamm_2018] AND
      --olosyys_2 = [ylkkolosyys_2018]  
      )
      ,'tkopisk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2018] AND
      opiskjarj_2 = [tkopiskjarj_2018] AND
      kmaak_2 = [tkkmaak_2018] --AND
      --olotamm_2 = [tkolotamm_2018] AND
      --olosyys_2 = [tkolosyys_2018]  
      )
      ,'muutaopisk_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2018] AND
      opiskjarj_2 = [muutaopiskjarj_2018] AND
      kmaak_2 = [muutakmaak_2018] --AND
      --olotamm_2 = [muutaolotamm_2018] AND
      --olosyys_2 = [muutaolosyys_2018]  
      )
      ,'ptoim1r5_2018' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2018]  )
      --amas = [amas_2018]  )

-- 2019

      ,'amk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2019] AND
      suorlk = [amksuorlk_2019] AND
      tutkmaak = [amktutkkmaak_2019] AND
      tutkjarj = [amktutkjarj_2019] AND
      tutkkoulk = [amktutkkoulk_2019]  )
      ,'ylamk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2019] AND
      suorlk = [ylamksuorlk_2019] AND
      tutkmaak = [ylamktutkkmaak_2019] AND
      tutkjarj = [ylamktutkjarj_2019] AND
      tutkkoulk = [ylamktutkkoulk_2019]  )
      ,'alkk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2019] AND
      suorlk = [alkksuorlk_2019] AND
      tutkmaak = [alkktutkkmaak_2019] AND
      tutkjarj = [alkktutkjarj_2019] AND
      tutkkoulk = [alkktutkkoulk_2019]  )
      ,'ylkk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2019] AND
      suorlk = [ylkksuorlk_2019] AND
      tutkmaak = [ylkktutkkmaak_2019] AND
      tutkjarj = [ylkktutkjarj_2019] AND
      tutkkoulk = [ylkktutkkoulk_2019]  )
      ,'tk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2019] AND
      suorlk = [tksuorlk_2019] AND
      tutkmaak = [tktutkkmaak_2019] AND
      tutkjarj = [tktutkjarj_2019] AND
      tutkkoulk = [tktutkkoulk_2019]  )
      ,'muuta_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2019] AND
      suorlk = [muutasuorlk_2019] AND
      tutkmaak = [muutatutkkmaak_2019] AND
      tutkjarj = [muutatutkjarj_2019] AND
      tutkkoulk = [muutatutkkoulk_2019]  )
      ,'amkopisk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2019] AND
      opiskjarj_2 = [amkopiskjarj_2019] AND
      kmaak_2 = [amkkmaak_2019] --AND
      --olotamm_2 = [amkolotamm_2019] AND
      --olosyys_2 = [amkolosyys_2019]  
      )
      ,'ylamkopisk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2019] AND
      opiskjarj_2 = [ylamkopiskjarj_2019] AND
      kmaak_2 = [ylamkkmaak_2019] --AND
      --olotamm_2 = [ylamkolotamm_2019] AND
      --olosyys_2 = [ylamkolosyys_2019]  
      )
      ,'alkkopisk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2019] AND
      opiskjarj_2 = [alkkopiskjarj_2019] AND
      kmaak_2 = [alkkkmaak_2019] --AND
      --olotamm_2 = [alkkolotamm_2019] AND
      --olosyys_2 = [alkkolosyys_2019]  
      )
      ,'ylkkopisk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2019] AND
      opiskjarj_2 = [ylkkopiskjarj_2019] AND
      kmaak_2 = [ylkkkmaak_2019] --AND
      --olotamm_2 = [ylkkolotamm_2019] AND
      --olosyys_2 = [ylkkolosyys_2019]  
      )
      ,'tkopisk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2019] AND
      opiskjarj_2 = [tkopiskjarj_2019] AND
      kmaak_2 = [tkkmaak_2019] --AND
      --olotamm_2 = [tkolotamm_2019] AND
      --olosyys_2 = [tkolosyys_2019]  
      )
      ,'muutaopisk_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2019] AND
      opiskjarj_2 = [muutaopiskjarj_2019] AND
      kmaak_2 = [muutakmaak_2019] --AND
      --olotamm_2 = [muutaolotamm_2019] AND
      --olosyys_2 = [muutaolosyys_2019]  
      )
      ,'ptoim1r5_2019' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2019]  )
      --amas = [amas_2019]  )

-- 2020

      ,'amk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2020] AND
      suorlk = [amksuorlk_2020] AND
      tutkmaak = [amktutkkmaak_2020] AND
      tutkjarj = [amktutkjarj_2020] AND
      tutkkoulk = [amktutkkoulk_2020]  )
      ,'ylamk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2020] AND
      suorlk = [ylamksuorlk_2020] AND
      tutkmaak = [ylamktutkkmaak_2020] AND
      tutkjarj = [ylamktutkjarj_2020] AND
      tutkkoulk = [ylamktutkkoulk_2020]  )
      ,'alkk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2020] AND
      suorlk = [alkksuorlk_2020] AND
      tutkmaak = [alkktutkkmaak_2020] AND
      tutkjarj = [alkktutkjarj_2020] AND
      tutkkoulk = [alkktutkkoulk_2020]  )
      ,'ylkk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2020] AND
      suorlk = [ylkksuorlk_2020] AND
      tutkmaak = [ylkktutkkmaak_2020] AND
      tutkjarj = [ylkktutkjarj_2020] AND
      tutkkoulk = [ylkktutkkoulk_2020]  )
      ,'tk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2020] AND
      suorlk = [tksuorlk_2020] AND
      tutkmaak = [tktutkkmaak_2020] AND
      tutkjarj = [tktutkjarj_2020] AND
      tutkkoulk = [tktutkkoulk_2020]  )
      ,'muuta_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2020] AND
      suorlk = [muutasuorlk_2020] AND
      tutkmaak = [muutatutkkmaak_2020] AND
      tutkjarj = [muutatutkjarj_2020] AND
      tutkkoulk = [muutatutkkoulk_2020]  )
      ,'amkopisk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2020] AND
      opiskjarj_2 = [amkopiskjarj_2020] AND
      kmaak_2 = [amkkmaak_2020] --AND
      --olotamm_2 = [amkolotamm_2020] AND
      --olosyys_2 = [amkolosyys_2020]  
      )
      ,'ylamkopisk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2020] AND
      opiskjarj_2 = [ylamkopiskjarj_2020] AND
      kmaak_2 = [ylamkkmaak_2020] --AND
      --olotamm_2 = [ylamkolotamm_2020] AND
      --olosyys_2 = [ylamkolosyys_2020]  
      )
      ,'alkkopisk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2020] AND
      opiskjarj_2 = [alkkopiskjarj_2020] AND
      kmaak_2 = [alkkkmaak_2020] --AND
      --olotamm_2 = [alkkolotamm_2020] AND
      --olosyys_2 = [alkkolosyys_2020]  
      )
      ,'ylkkopisk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2020] AND
      opiskjarj_2 = [ylkkopiskjarj_2020] AND
      kmaak_2 = [ylkkkmaak_2020] --AND
      --olotamm_2 = [ylkkolotamm_2020] AND
      --olosyys_2 = [ylkkolosyys_2020]  
      )
      ,'tkopisk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2020] AND
      opiskjarj_2 = [tkopiskjarj_2020] AND
      kmaak_2 = [tkkmaak_2020] --AND
      --olotamm_2 = [tkolotamm_2020] AND
      --olosyys_2 = [tkolosyys_2020]  
      )
      ,'muutaopisk_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2020] AND
      opiskjarj_2 = [muutaopiskjarj_2020] AND
      kmaak_2 = [muutakmaak_2020] --AND
      --olotamm_2 = [muutaolotamm_2020] AND
      --olosyys_2 = [muutaolosyys_2020]  
      )
      ,'ptoim1r5_2020' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2020]  )
      --amas = [amas_2020]  )

-- 2021

      ,'amk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2021] AND
      suorlk = [amksuorlk_2021] AND
      tutkmaak = [amktutkkmaak_2021] AND
      tutkjarj = [amktutkjarj_2021] AND
      tutkkoulk = [amktutkkoulk_2021]  )
      ,'ylamk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2021] AND
      suorlk = [ylamksuorlk_2021] AND
      tutkmaak = [ylamktutkkmaak_2021] AND
      tutkjarj = [ylamktutkjarj_2021] AND
      tutkkoulk = [ylamktutkkoulk_2021]  )
      ,'alkk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2021] AND
      suorlk = [alkksuorlk_2021] AND
      tutkmaak = [alkktutkkmaak_2021] AND
      tutkjarj = [alkktutkjarj_2021] AND
      tutkkoulk = [alkktutkkoulk_2021]  )
      ,'ylkk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2021] AND
      suorlk = [ylkksuorlk_2021] AND
      tutkmaak = [ylkktutkkmaak_2021] AND
      tutkjarj = [ylkktutkjarj_2021] AND
      tutkkoulk = [ylkktutkkoulk_2021]  )
      ,'tk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2021] AND
      suorlk = [tksuorlk_2021] AND
      tutkmaak = [tktutkkmaak_2021] AND
      tutkjarj = [tktutkjarj_2021] AND
      tutkkoulk = [tktutkkoulk_2021]  )
      ,'muuta_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2021] AND
      suorlk = [muutasuorlk_2021] AND
      tutkmaak = [muutatutkkmaak_2021] AND
      tutkjarj = [muutatutkjarj_2021] AND
      tutkkoulk = [muutatutkkoulk_2021]  )
      ,'amkopisk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2021] AND
      opiskjarj_2 = [amkopiskjarj_2021] AND
      kmaak_2 = [amkkmaak_2021] --AND
      --olotamm_2 = [amkolotamm_2021] AND
      --olosyys_2 = [amkolosyys_2021]  
      )
      ,'ylamkopisk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2021] AND
      opiskjarj_2 = [ylamkopiskjarj_2021] AND
      kmaak_2 = [ylamkkmaak_2021] --AND
      --olotamm_2 = [ylamkolotamm_2021] AND
      --olosyys_2 = [ylamkolosyys_2021]  
      )
      ,'alkkopisk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2021] AND
      opiskjarj_2 = [alkkopiskjarj_2021] AND
      kmaak_2 = [alkkkmaak_2021] --AND
      --olotamm_2 = [alkkolotamm_2021] AND
      --olosyys_2 = [alkkolosyys_2021]  
      )
      ,'ylkkopisk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2021] AND
      opiskjarj_2 = [ylkkopiskjarj_2021] AND
      kmaak_2 = [ylkkkmaak_2021] --AND
      --olotamm_2 = [ylkkolotamm_2021] AND
      --olosyys_2 = [ylkkolosyys_2021]  
      )
      ,'tkopisk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2021] AND
      opiskjarj_2 = [tkopiskjarj_2021] AND
      kmaak_2 = [tkkmaak_2021] --AND
      --olotamm_2 = [tkolotamm_2021] AND
      --olosyys_2 = [tkolosyys_2021]  
      )
      ,'muutaopisk_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2021] AND
      opiskjarj_2 = [muutaopiskjarj_2021] AND
      kmaak_2 = [muutakmaak_2021] --AND
      --olotamm_2 = [muutaolotamm_2021] AND
      --olosyys_2 = [muutaolosyys_2021]  
      )
      ,'ptoim1r5_2021' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2021]  )
      --amas = [amas_2021]  )

-- 2022

      ,'amk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2022] AND
      suorlk = [amksuorlk_2022] AND
      tutkmaak = [amktutkkmaak_2022] AND
      tutkjarj = [amktutkjarj_2022] AND
      tutkkoulk = [amktutkkoulk_2022]  )
      ,'ylamk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2022] AND
      suorlk = [ylamksuorlk_2022] AND
      tutkmaak = [ylamktutkkmaak_2022] AND
      tutkjarj = [ylamktutkjarj_2022] AND
      tutkkoulk = [ylamktutkkoulk_2022]  )
      ,'alkk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2022] AND
      suorlk = [alkksuorlk_2022] AND
      tutkmaak = [alkktutkkmaak_2022] AND
      tutkjarj = [alkktutkjarj_2022] AND
      tutkkoulk = [alkktutkkoulk_2022]  )
      ,'ylkk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2022] AND
      suorlk = [ylkksuorlk_2022] AND
      tutkmaak = [ylkktutkkmaak_2022] AND
      tutkjarj = [ylkktutkjarj_2022] AND
      tutkkoulk = [ylkktutkkoulk_2022]  )
      ,'tk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2022] AND
      suorlk = [tksuorlk_2022] AND
      tutkmaak = [tktutkkmaak_2022] AND
      tutkjarj = [tktutkjarj_2022] AND
      tutkkoulk = [tktutkkoulk_2022]  )
      ,'muuta_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2022] AND
      suorlk = [muutasuorlk_2022] AND
      tutkmaak = [muutatutkkmaak_2022] AND
      tutkjarj = [muutatutkjarj_2022] AND
      tutkkoulk = [muutatutkkoulk_2022]  )
      ,'amkopisk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2022] AND
      opiskjarj_2 = [amkopiskjarj_2022] AND
      kmaak_2 = [amkkmaak_2022] --AND
      --olotamm_2 = [amkolotamm_2022] AND
      --olosyys_2 = [amkolosyys_2022]  
      )
      ,'ylamkopisk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2022] AND
      opiskjarj_2 = [ylamkopiskjarj_2022] AND
      kmaak_2 = [ylamkkmaak_2022] --AND
      --olotamm_2 = [ylamkolotamm_2022] AND
      --olosyys_2 = [ylamkolosyys_2022]  
      )
      ,'alkkopisk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2022] AND
      opiskjarj_2 = [alkkopiskjarj_2022] AND
      kmaak_2 = [alkkkmaak_2022] --AND
      --olotamm_2 = [alkkolotamm_2022] AND
      --olosyys_2 = [alkkolosyys_2022]  
      )
      ,'ylkkopisk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2022] AND
      opiskjarj_2 = [ylkkopiskjarj_2022] AND
      kmaak_2 = [ylkkkmaak_2022] --AND
      --olotamm_2 = [ylkkolotamm_2022] AND
      --olosyys_2 = [ylkkolosyys_2022]  
      )
      ,'tkopisk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2022] AND
      opiskjarj_2 = [tkopiskjarj_2022] AND
      kmaak_2 = [tkkmaak_2022] --AND
      --olotamm_2 = [tkolotamm_2022] AND
      --olosyys_2 = [tkolosyys_2022]  
      )
      ,'muutaopisk_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2022] AND
      opiskjarj_2 = [muutaopiskjarj_2022] AND
      kmaak_2 = [muutakmaak_2022] --AND
      --olotamm_2 = [muutaolotamm_2022] AND
      --olosyys_2 = [muutaolosyys_2022]  
      )
      ,'ptoim1r5_2022' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2022]  )
      --amas = [amas_2022]  )

-- 2023

      ,'amk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [amksuorv_2023] AND
      suorlk = [amksuorlk_2023] AND
      tutkmaak = [amktutkkmaak_2023] AND
      tutkjarj = [amktutkjarj_2023] AND
      tutkkoulk = [amktutkkoulk_2023]  )
      ,'ylamk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylamksuorv_2023] AND
      suorlk = [ylamksuorlk_2023] AND
      tutkmaak = [ylamktutkkmaak_2023] AND
      tutkjarj = [ylamktutkjarj_2023] AND
      tutkkoulk = [ylamktutkkoulk_2023]  )
      ,'alkk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [alkksuorv_2023] AND
      suorlk = [alkksuorlk_2023] AND
      tutkmaak = [alkktutkkmaak_2023] AND
      tutkjarj = [alkktutkjarj_2023] AND
      tutkkoulk = [alkktutkkoulk_2023]  )
      ,'ylkk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [ylkksuorv_2023] AND
      suorlk = [ylkksuorlk_2023] AND
      tutkmaak = [ylkktutkkmaak_2023] AND
      tutkjarj = [ylkktutkjarj_2023] AND
      tutkkoulk = [ylkktutkkoulk_2023]  )
      ,'tk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [tksuorv_2023] AND
      suorlk = [tksuorlk_2023] AND
      tutkmaak = [tktutkkmaak_2023] AND
      tutkjarj = [tktutkjarj_2023] AND
      tutkkoulk = [tktutkkoulk_2023]  )
      ,'muuta_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where  
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      suorv = [muutasuorv_2023] AND
      suorlk = [muutasuorlk_2023] AND
      tutkmaak = [muutatutkkmaak_2023] AND
      tutkjarj = [muutatutkjarj_2023] AND
      tutkkoulk = [muutatutkkoulk_2023]  )
      ,'amkopisk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [amkopiskkoulk_2023] AND
      opiskjarj_2 = [amkopiskjarj_2023] AND
      kmaak_2 = [amkkmaak_2023] --AND
      --olotamm_2 = [amkolotamm_2023] AND
      --olosyys_2 = [amkolosyys_2023]  
      )
      ,'ylamkopisk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylamkopiskkoulk_2023] AND
      opiskjarj_2 = [ylamkopiskjarj_2023] AND
      kmaak_2 = [ylamkkmaak_2023] --AND
      --olotamm_2 = [ylamkolotamm_2023] AND
      --olosyys_2 = [ylamkolosyys_2023]  
      )
      ,'alkkopisk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [alkkopiskkoulk_2023] AND
      opiskjarj_2 = [alkkopiskjarj_2023] AND
      kmaak_2 = [alkkkmaak_2023] --AND
      --olotamm_2 = [alkkolotamm_2023] AND
      --olosyys_2 = [alkkolosyys_2023]  
      )
      ,'ylkkopisk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [ylkkopiskkoulk_2023] AND
      opiskjarj_2 = [ylkkopiskjarj_2023] AND
      kmaak_2 = [ylkkkmaak_2023] --AND
      --olotamm_2 = [ylkkolotamm_2023] AND
      --olosyys_2 = [ylkkolosyys_2023]  
      )
      ,'tkopisk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [tkopiskkoulk_2023] AND
      opiskjarj_2 = [tkopiskjarj_2023] AND
      kmaak_2 = [tkkmaak_2023] --AND
      --olotamm_2 = [tkolotamm_2023] AND
      --olosyys_2 = [tkolosyys_2023]  
      )
      ,'muutaopisk_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
	  [_aloittaneiden_lapaisy_avaimet].tilv = f.tilv AND
	  [_aloittaneiden_lapaisy_avaimet].lahde = f.lahde AND
      opiskkoulk_2 = [muutaopiskkoulk_2023] AND
      opiskjarj_2 = [muutaopiskjarj_2023] AND
      kmaak_2 = [muutakmaak_2023] --AND
      --olotamm_2 = [muutaolotamm_2023] AND
      --olosyys_2 = [muutaolosyys_2023]  
      )
      ,'ptoim1r5_2023' = (select id from [_aloittaneiden_lapaisy_avaimet] where    
      ptoim1r5 = [ptoim1r5_2023]  )
      --amas = [amas_2023]  )

	  	  
--UUSI VUOSI
--Lisää uuden vuoden kentät tähän yläpuolelle. Käytä pohjana edellisen vuoden kenttiä. Poista myös vanhin vuosi alusta, koska sekin putoaa pois TK-aineistosta.

  FROM VipunenTK_DW.dbo.[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila_1] f
  INNER JOIN VipunenTK_DW.dbo.[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila_2] f2 on f2.rivinro = f.rivinro




GO


