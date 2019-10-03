USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_K3_12_Perusk_paattaneet_amm_tutk_suorittaneet]    Script Date: 13.4.2018 11:15:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--Aineistoon tulee vuosittain uusi setti muuttujia, jotka pitää lisätä kaikkiin alla oleviin selecteihin. Vanhoissa aineistoissa uudet muuttujat saa tyhjän arvon
--Lisää uusi vuosi myös vipunentk_sa proseduureihin





ALTER VIEW [dbo].[v_K3_12_Perusk_paattaneet_amm_tutk_suorittaneet] AS
SELECT [tilv]
      ,[tilv_date]
      ,(case when [tutkryh] is NULL then '' else [tutkryh] end ) as [tutkryh]
      ,(case when [suorv] is NULL then '' else [suorv] end ) as [suorv]
	  ,(case when [suorlk] is NULL then '' else [suorlk] end ) as [suorlk]
	  ,(case when [sp] is NULL then '' else [sp] end ) as [sp]
      ,(case when [syntv] is NULL then '' else [syntv] end ) as [syntv]
	  ,(case when [aikielir1] is NULL then '' else [aikielir1] end ) as [aikielir1]
      ,(case when [tutkaskun] is NULL then '' else [tutkaskun] end ) as [tutkaskun]
       ,(case when [kansalr1] is NULL then '' else [kansalr1] end ) as [kansalr1]
    ,(case when [pohjmaa] is NULL then '' else [pohjmaa] end ) as [pohjmaa]
      ,(case when [eumaa] is NULL then '' else [eumaa] end ) as [eumaa]
        ,(case when [etamaa] is NULL then '' else [etamaa] end ) as [etamaa]
       ,(case when [tunn] is NULL then '' else [tunn] end ) as [tunn]
       ,(case when [jarj] is NULL then '' else [jarj] end ) as [jarj]
      ,(case when [kkielir1] is NULL then '' else [kkielir1] end ) as [kkielir1]
       ,(case when [tutklaja] is NULL then '' else [tutklaja] end ) as [tutklaja]
      ,(case when [tutktav] is NULL then '' else [tutktav] end ) as [tutktav]
      ,(case when [aikoul] is NULL then '' else [aikoul] end ) as [aikoul]
       ,(case when [tutkmaak] is NULL then '' else [tutkmaak] end ) as [tutkmaak]
	    ,(case when [luopiskkoulk2008] is NULL then '' else [luopiskkoulk2008] end ) as [luopiskkoulk2008]
		 ,(case when [luopisktunn2008] is NULL then '' else [luopisktunn2008] end ) as [luopisktunn2008]
		  ,(case when [luopiskjarj2008] is NULL then '' else [luopiskjarj2008] end ) as [luopiskjarj2008]
		   ,(case when [luopiskmaak2008] is NULL then '' else [luopiskmaak2008] end ) as [luopiskmaak2008]
      ,(case when [ammopiskkoulk2008] is NULL then '' else [ammopiskkoulk2008] end ) as [ammopiskkoulk2008]
		 ,(case when [ammopisktunn2008] is NULL then '' else [ammopisktunn2008] end ) as [ammopisktunn2008]
		  ,(case when [ammopiskjarj2008] is NULL then '' else [ammopiskjarj2008] end ) as [ammopiskjarj2008]
		   ,(case when [ammopiskmaak2008] is NULL then '' else [ammopiskmaak2008] end ) as [ammopiskmaak2008]
		   ,(case when [amkopiskkoulk2008] is NULL then '' else [amkopiskkoulk2008] end ) as [amkopiskkoulk2008]
		 ,(case when [amkopisktunn2008] is NULL then '' else [amkopisktunn2008] end ) as [amkopisktunn2008]
		  ,(case when [amkopiskjarj2008] is NULL then '' else [amkopiskjarj2008] end ) as [amkopiskjarj2008]
		   ,(case when [amkopiskmaak2008] is NULL then '' else [amkopiskmaak2008] end ) as [amkopiskmaak2008]
       ,(case when [yoopiskkoulk2008] is NULL then '' else [yoopiskkoulk2008] end ) as [yoopiskkoulk2008]
		 ,(case when [yoopisktunn2008] is NULL then '' else [yoopisktunn2008] end ) as [yoopisktunn2008]
		  ,(case when [yoopiskjarj2008] is NULL then '' else [yoopiskjarj2008] end ) as [yoopiskjarj2008]
		   ,(case when [yoopiskmaak2008] is NULL then '' else [yoopiskmaak2008] end ) as [yoopiskmaak2008]
     
   ,(case when [monihaku2008] is NULL then '' else [monihaku2008] end ) as [monihaku2008]
		  ,(case when [ptoim1r4_2008] is NULL then '' else [ptoim1r4_2008] end ) as [ptoim1r4_2008]
		   ,(case when [amas_2008] is NULL then '' else [amas_2008] end ) as [amas_2008]
    
     
        ,(case when [luopiskkoulk2009] is NULL then '' else [luopiskkoulk2009] end ) as [luopiskkoulk2009]
		 ,(case when [luopisktunn2009] is NULL then '' else [luopisktunn2009] end ) as [luopisktunn2009]
		  ,(case when [luopiskjarj2009] is NULL then '' else [luopiskjarj2009] end ) as [luopiskjarj2009]
		   ,(case when [luopiskmaak2009] is NULL then '' else [luopiskmaak2009] end ) as [luopiskmaak2009]
      ,(case when [ammopiskkoulk2009] is NULL then '' else [ammopiskkoulk2009] end ) as [ammopiskkoulk2009]
		 ,(case when [ammopisktunn2009] is NULL then '' else [ammopisktunn2009] end ) as [ammopisktunn2009]
		  ,(case when [ammopiskjarj2009] is NULL then '' else [ammopiskjarj2009] end ) as [ammopiskjarj2009]
		   ,(case when [ammopiskmaak2009] is NULL then '' else [ammopiskmaak2009] end ) as [ammopiskmaak2009]
		   ,(case when [amkopiskkoulk2009] is NULL then '' else [amkopiskkoulk2009] end ) as [amkopiskkoulk2009]
		 ,(case when [amkopisktunn2009] is NULL then '' else [amkopisktunn2009] end ) as [amkopisktunn2009]
		  ,(case when [amkopiskjarj2009] is NULL then '' else [amkopiskjarj2009] end ) as [amkopiskjarj2009]
		   ,(case when [amkopiskmaak2009] is NULL then '' else [amkopiskmaak2009] end ) as [amkopiskmaak2009]
       ,(case when [yoopiskkoulk2009] is NULL then '' else [yoopiskkoulk2009] end ) as [yoopiskkoulk2009]
		 ,(case when [yoopisktunn2009] is NULL then '' else [yoopisktunn2009] end ) as [yoopisktunn2009]
		  ,(case when [yoopiskjarj2009] is NULL then '' else [yoopiskjarj2009] end ) as [yoopiskjarj2009]
		   ,(case when [yoopiskmaak2009] is NULL then '' else [yoopiskmaak2009] end ) as [yoopiskmaak2009]
     
   ,(case when [monihaku2009] is NULL then '' else [monihaku2009] end ) as [monihaku2009]
		  ,(case when [ptoim1r4_2009] is NULL then '' else [ptoim1r4_2009] end ) as [ptoim1r4_2009]
		   ,(case when [amas_2009] is NULL then '' else [amas_2009] end ) as [amas_2009]
  ,(case when [luopiskkoulk2010] is NULL then '' else [luopiskkoulk2010] end ) as [luopiskkoulk2010]
		 ,(case when [luopisktunn2010] is NULL then '' else [luopisktunn2010] end ) as [luopisktunn2010]
		  ,(case when [luopiskjarj2010] is NULL then '' else [luopiskjarj2010] end ) as [luopiskjarj2010]
		   ,(case when [luopiskmaak2010] is NULL then '' else [luopiskmaak2010] end ) as [luopiskmaak2010]
      ,(case when [ammopiskkoulk2010] is NULL then '' else [ammopiskkoulk2010] end ) as [ammopiskkoulk2010]
		 ,(case when [ammopisktunn2010] is NULL then '' else [ammopisktunn2010] end ) as [ammopisktunn2010]
		  ,(case when [ammopiskjarj2010] is NULL then '' else [ammopiskjarj2010] end ) as [ammopiskjarj2010]
		   ,(case when [ammopiskmaak2010] is NULL then '' else [ammopiskmaak2010] end ) as [ammopiskmaak2010]
		   ,(case when [amkopiskkoulk2010] is NULL then '' else [amkopiskkoulk2010] end ) as [amkopiskkoulk2010]
		 ,(case when [amkopisktunn2010] is NULL then '' else [amkopisktunn2010] end ) as [amkopisktunn2010]
		  ,(case when [amkopiskjarj2010] is NULL then '' else [amkopiskjarj2010] end ) as [amkopiskjarj2010]
		   ,(case when [amkopiskmaak2010] is NULL then '' else [amkopiskmaak2010] end ) as [amkopiskmaak2010]
       ,(case when [yoopiskkoulk2010] is NULL then '' else [yoopiskkoulk2010] end ) as [yoopiskkoulk2010]
		 ,(case when [yoopisktunn2010] is NULL then '' else [yoopisktunn2010] end ) as [yoopisktunn2010]
		  ,(case when [yoopiskjarj2010] is NULL then '' else [yoopiskjarj2010] end ) as [yoopiskjarj2010]
		   ,(case when [yoopiskmaak2010] is NULL then '' else [yoopiskmaak2010] end ) as [yoopiskmaak2010]
     
   ,(case when [monihaku2010] is NULL then '' else [monihaku2010] end ) as [monihaku2010]
		  ,(case when [ptoim1r4_2010] is NULL then '' else [ptoim1r4_2010] end ) as [ptoim1r4_2010]
		   ,(case when [amas_2010] is NULL then '' else [amas_2010] end ) as [amas_2010]
       ,(case when [luopiskkoulk2011] is NULL then '' else [luopiskkoulk2011] end ) as [luopiskkoulk2011]
		 ,(case when [luopisktunn2011] is NULL then '' else [luopisktunn2011] end ) as [luopisktunn2011]
		  ,(case when [luopiskjarj2011] is NULL then '' else [luopiskjarj2011] end ) as [luopiskjarj2011]
		   ,(case when [luopiskmaak2011] is NULL then '' else [luopiskmaak2011] end ) as [luopiskmaak2011]
      ,(case when [ammopiskkoulk2011] is NULL then '' else [ammopiskkoulk2011] end ) as [ammopiskkoulk2011]
		 ,(case when [ammopisktunn2011] is NULL then '' else [ammopisktunn2011] end ) as [ammopisktunn2011]
		  ,(case when [ammopiskjarj2011] is NULL then '' else [ammopiskjarj2011] end ) as [ammopiskjarj2011]
		   ,(case when [ammopiskmaak2011] is NULL then '' else [ammopiskmaak2011] end ) as [ammopiskmaak2011]
		   ,(case when [amkopiskkoulk2011] is NULL then '' else [amkopiskkoulk2011] end ) as [amkopiskkoulk2011]
		 ,(case when [amkopisktunn2011] is NULL then '' else [amkopisktunn2011] end ) as [amkopisktunn2011]
		  ,(case when [amkopiskjarj2011] is NULL then '' else [amkopiskjarj2011] end ) as [amkopiskjarj2011]
		   ,(case when [amkopiskmaak2011] is NULL then '' else [amkopiskmaak2011] end ) as [amkopiskmaak2011]
       ,(case when [yoopiskkoulk2011] is NULL then '' else [yoopiskkoulk2011] end ) as [yoopiskkoulk2011]
		 ,(case when [yoopisktunn2011] is NULL then '' else [yoopisktunn2011] end ) as [yoopisktunn2011]
		  ,(case when [yoopiskjarj2011] is NULL then '' else [yoopiskjarj2011] end ) as [yoopiskjarj2011]
		   ,(case when [yoopiskmaak2011] is NULL then '' else [yoopiskmaak2011] end ) as [yoopiskmaak2011]
     
   ,(case when [monihaku2011] is NULL then '' else [monihaku2011] end ) as [monihaku2011]
		  ,(case when [ptoim1r4_2011] is NULL then '' else [ptoim1r4_2011] end ) as [ptoim1r4_2011]
		   ,(case when [amas_2011] is NULL then '' else [amas_2011] end ) as [amas_2011]
      
        ,(case when [luopiskkoulk2012] is NULL then '' else [luopiskkoulk2012] end ) as [luopiskkoulk2012]
		 ,(case when [luopisktunn2012] is NULL then '' else [luopisktunn2012] end ) as [luopisktunn2012]
		  ,(case when [luopiskjarj2012] is NULL then '' else [luopiskjarj2012] end ) as [luopiskjarj2012]
		   ,(case when [luopiskmaak2012] is NULL then '' else [luopiskmaak2012] end ) as [luopiskmaak2012]
      ,(case when [ammopiskkoulk2012] is NULL then '' else [ammopiskkoulk2012] end ) as [ammopiskkoulk2012]
		 ,(case when [ammopisktunn2012] is NULL then '' else [ammopisktunn2012] end ) as [ammopisktunn2012]
		  ,(case when [ammopiskjarj2012] is NULL then '' else [ammopiskjarj2012] end ) as [ammopiskjarj2012]
		   ,(case when [ammopiskmaak2012] is NULL then '' else [ammopiskmaak2012] end ) as [ammopiskmaak2012]
		   ,(case when [amkopiskkoulk2012] is NULL then '' else [amkopiskkoulk2012] end ) as [amkopiskkoulk2012]
		 ,(case when [amkopisktunn2012] is NULL then '' else [amkopisktunn2012] end ) as [amkopisktunn2012]
		  ,(case when [amkopiskjarj2012] is NULL then '' else [amkopiskjarj2012] end ) as [amkopiskjarj2012]
		   ,(case when [amkopiskmaak2012] is NULL then '' else [amkopiskmaak2012] end ) as [amkopiskmaak2012]
       ,(case when [yoopiskkoulk2012] is NULL then '' else [yoopiskkoulk2012] end ) as [yoopiskkoulk2012]
		 ,(case when [yoopisktunn2012] is NULL then '' else [yoopisktunn2012] end ) as [yoopisktunn2012]
		  ,(case when [yoopiskjarj2012] is NULL then '' else [yoopiskjarj2012] end ) as [yoopiskjarj2012]
		   ,(case when [yoopiskmaak2012] is NULL then '' else [yoopiskmaak2012] end ) as [yoopiskmaak2012]
     
   ,(case when [monihaku2012] is NULL then '' else [monihaku2012] end ) as [monihaku2012]
		  ,(case when [ptoim1r4_2012] is NULL then '' else [ptoim1r4_2012] end ) as [ptoim1r4_2012]
		   ,(case when [amas_2012] is NULL then '' else [amas_2012] end ) as [amas_2012]
	   ,(case when [luopiskkoulk2013] is NULL then '' else [luopiskkoulk2013] end ) as [luopiskkoulk2013]
		 ,(case when [luopisktunn2013] is NULL then '' else [luopisktunn2013] end ) as [luopisktunn2013]
		  ,(case when [luopiskjarj2013] is NULL then '' else [luopiskjarj2013] end ) as [luopiskjarj2013]
		   ,(case when [luopiskmaak2013] is NULL then '' else [luopiskmaak2013] end ) as [luopiskmaak2013]
      ,(case when [ammopiskkoulk2013] is NULL then '' else [ammopiskkoulk2013] end ) as [ammopiskkoulk2013]
		 ,(case when [ammopisktunn2013] is NULL then '' else [ammopisktunn2013] end ) as [ammopisktunn2013]
		  ,(case when [ammopiskjarj2013] is NULL then '' else [ammopiskjarj2013] end ) as [ammopiskjarj2013]
		   ,(case when [ammopiskmaak2013] is NULL then '' else [ammopiskmaak2013] end ) as [ammopiskmaak2013]
		   ,(case when [amkopiskkoulk2013] is NULL then '' else [amkopiskkoulk2013] end ) as [amkopiskkoulk2013]
		 ,(case when [amkopisktunn2013] is NULL then '' else [amkopisktunn2013] end ) as [amkopisktunn2013]
		  ,(case when [amkopiskjarj2013] is NULL then '' else [amkopiskjarj2013] end ) as [amkopiskjarj2013]
		   ,(case when [amkopiskmaak2013] is NULL then '' else [amkopiskmaak2013] end ) as [amkopiskmaak2013]
       ,(case when [yoopiskkoulk2013] is NULL then '' else [yoopiskkoulk2013] end ) as [yoopiskkoulk2013]
		 ,(case when [yoopisktunn2013] is NULL then '' else [yoopisktunn2013] end ) as [yoopisktunn2013]
		  ,(case when [yoopiskjarj2013] is NULL then '' else [yoopiskjarj2013] end ) as [yoopiskjarj2013]
		   ,(case when [yoopiskmaak2013] is NULL then '' else [yoopiskmaak2013] end ) as [yoopiskmaak2013]
     
   ,(case when [monihaku2013] is NULL then '' else [monihaku2013] end ) as [monihaku2013]
		  ,(case when [ptoim1r4_2013] is NULL then '' else [ptoim1r4_2013] end ) as [ptoim1r4_2013]
		   ,(case when [amas_2013] is NULL then '' else [amas_2013] end ) as [amas_2013]
		   	   ,(case when [luopiskkoulk2014] is NULL then '' else [luopiskkoulk2014] end ) as [luopiskkoulk2014]
		 ,(case when [luopisktunn2014] is NULL then '' else [luopisktunn2014] end ) as [luopisktunn2014]
		  ,(case when [luopiskjarj2014] is NULL then '' else [luopiskjarj2014] end ) as [luopiskjarj2014]
		   ,(case when [luopiskmaak2014] is NULL then '' else [luopiskmaak2014] end ) as [luopiskmaak2014]
      ,(case when [ammopiskkoulk2014] is NULL then '' else [ammopiskkoulk2014] end ) as [ammopiskkoulk2014]
		 ,(case when [ammopisktunn2014] is NULL then '' else [ammopisktunn2014] end ) as [ammopisktunn2014]
		  ,(case when [ammopiskjarj2014] is NULL then '' else [ammopiskjarj2014] end ) as [ammopiskjarj2014]
		   ,(case when [ammopiskmaak2014] is NULL then '' else [ammopiskmaak2014] end ) as [ammopiskmaak2014]
		   ,(case when [amkopiskkoulk2014] is NULL then '' else [amkopiskkoulk2014] end ) as [amkopiskkoulk2014]
		 ,(case when [amkopisktunn2014] is NULL then '' else [amkopisktunn2014] end ) as [amkopisktunn2014]
		  ,(case when [amkopiskjarj2014] is NULL then '' else [amkopiskjarj2014] end ) as [amkopiskjarj2014]
		   ,(case when [amkopiskmaak2014] is NULL then '' else [amkopiskmaak2014] end ) as [amkopiskmaak2014]
       ,(case when [yoopiskkoulk2014] is NULL then '' else [yoopiskkoulk2014] end ) as [yoopiskkoulk2014]
		 ,(case when [yoopisktunn2014] is NULL then '' else [yoopisktunn2014] end ) as [yoopisktunn2014]
		  ,(case when [yoopiskjarj2014] is NULL then '' else [yoopiskjarj2014] end ) as [yoopiskjarj2014]
		   ,(case when [yoopiskmaak2014] is NULL then '' else [yoopiskmaak2014] end ) as [yoopiskmaak2014]
   ,(case when [monihaku2014] is NULL then '' else [monihaku2014] end ) as [monihaku2014]
		  ,(case when [ptoim1r4_2014] is NULL then '' else [ptoim1r4_2014] end ) as [ptoim1r4_2014]
		   ,(case when [amas_2014] is NULL then '' else [amas_2014] end ) as [amas_2014]


	  	   ,(case when [luopiskkoulk2015] is NULL then '' else [luopiskkoulk2015] end ) as [luopiskkoulk2015]
		 ,(case when [luopisktunn2015] is NULL then '' else [luopisktunn2015] end ) as [luopisktunn2015]
		  ,(case when [luopiskjarj2015] is NULL then '' else [luopiskjarj2015] end ) as [luopiskjarj2015]
		   ,(case when [luopiskmaak2015] is NULL then '' else [luopiskmaak2015] end ) as [luopiskmaak2015]
      ,(case when [ammopiskkoulk2015] is NULL then '' else [ammopiskkoulk2015] end ) as [ammopiskkoulk2015]
		 ,(case when [ammopisktunn2015] is NULL then '' else [ammopisktunn2015] end ) as [ammopisktunn2015]
		  ,(case when [ammopiskjarj2015] is NULL then '' else [ammopiskjarj2015] end ) as [ammopiskjarj2015]
		   ,(case when [ammopiskmaak2015] is NULL then '' else [ammopiskmaak2015] end ) as [ammopiskmaak2015]
		   ,(case when [amkopiskkoulk2015] is NULL then '' else [amkopiskkoulk2015] end ) as [amkopiskkoulk2015]
		 ,(case when [amkopisktunn2015] is NULL then '' else [amkopisktunn2015] end ) as [amkopisktunn2015]
		  ,(case when [amkopiskjarj2015] is NULL then '' else [amkopiskjarj2015] end ) as [amkopiskjarj2015]
		   ,(case when [amkopiskmaak2015] is NULL then '' else [amkopiskmaak2015] end ) as [amkopiskmaak2015]
       ,(case when [yoopiskkoulk2015] is NULL then '' else [yoopiskkoulk2015] end ) as [yoopiskkoulk2015]
		 ,(case when [yoopisktunn2015] is NULL then '' else [yoopisktunn2015] end ) as [yoopisktunn2015]
		  ,(case when [yoopiskjarj2015] is NULL then '' else [yoopiskjarj2015] end ) as [yoopiskjarj2015]
		   ,(case when [yoopiskmaak2015] is NULL then '' else [yoopiskmaak2015] end ) as [yoopiskmaak2015]
   ,(case when [monihaku2015] is NULL then '' else [monihaku2015] end ) as [monihaku2015]
		  ,(case when [ptoim1r4_2015] is NULL then '' else [ptoim1r4_2015] end ) as [ptoim1r4_2015]
		   ,(case when [amas_2015] is NULL then '' else [amas_2015] end ) as [amas_2015]


	  	   ,(case when [luopiskkoulk2016] is NULL then '' else [luopiskkoulk2016] end ) as [luopiskkoulk2016]
		 ,(case when [luopisktunn2016] is NULL then '' else [luopisktunn2016] end ) as [luopisktunn2016]
		  ,(case when [luopiskjarj2016] is NULL then '' else [luopiskjarj2016] end ) as [luopiskjarj2016]
		   ,(case when [luopiskmaak2016] is NULL then '' else [luopiskmaak2016] end ) as [luopiskmaak2016]
      ,(case when [ammopiskkoulk2016] is NULL then '' else [ammopiskkoulk2016] end ) as [ammopiskkoulk2016]
		 ,(case when [ammopisktunn2016] is NULL then '' else [ammopisktunn2016] end ) as [ammopisktunn2016]
		  ,(case when [ammopiskjarj2016] is NULL then '' else [ammopiskjarj2016] end ) as [ammopiskjarj2016]
		   ,(case when [ammopiskmaak2016] is NULL then '' else [ammopiskmaak2016] end ) as [ammopiskmaak2016]
		   ,(case when [amkopiskkoulk2016] is NULL then '' else [amkopiskkoulk2016] end ) as [amkopiskkoulk2016]
		 ,(case when [amkopisktunn2016] is NULL then '' else [amkopisktunn2016] end ) as [amkopisktunn2016]
		  ,(case when [amkopiskjarj2016] is NULL then '' else [amkopiskjarj2016] end ) as [amkopiskjarj2016]
		   ,(case when [amkopiskmaak2016] is NULL then '' else [amkopiskmaak2016] end ) as [amkopiskmaak2016]
       ,(case when [yoopiskkoulk2016] is NULL then '' else [yoopiskkoulk2016] end ) as [yoopiskkoulk2016]
		 ,(case when [yoopisktunn2016] is NULL then '' else [yoopisktunn2016] end ) as [yoopisktunn2016]
		  ,(case when [yoopiskjarj2016] is NULL then '' else [yoopiskjarj2016] end ) as [yoopiskjarj2016]
		   ,(case when [yoopiskmaak2016] is NULL then '' else [yoopiskmaak2016] end ) as [yoopiskmaak2016]
   ,(case when [monihaku2016] is NULL then '' else [monihaku2016] end ) as [monihaku2016]
		  ,(case when [ptoim1r4_2016] is NULL then '' else [ptoim1r4_2016] end ) as [ptoim1r4_2016]
		   ,(case when [amas_2016] is NULL then '' else [amas_2016] end ) as [amas_2016]


      ,[lkm]
	  ,(case when [pohjkoul] is NULL then '' else [pohjkoul] end ) as [pohjkoul]
      ,[tietolahde]
      ,[rivinumero]
FROM (
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
(CASE WHEN [syntv]='19XX' THEN '' ELSE [syntv] END) as syntv,
aikielir1,
-- tutkaskun 427 tuntemattomaksi Tilastokeskuksen luvalla, avoimet ongelmat sivulla 25.3.2014 tieto tullut tähän
(CASE WHEN [tutkaskun]='427' THEN '' 
      WHEN [tutkaskun]= '946' and (tilv= '2009' or tilv='2010') then '945'
      WHEN [tutkaskun]= '198' THEN ''
	  WHEN [tutkaskun]='999' THEN ''
ELSE [tutkaskun] END) as tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
(CASE WHEN [tunn] = 'BBBBB' THEN ''
      WHEN [tunn] = '99999' THEN ''
      WHEN [tunn] = '00000' THEN '' 
      when [tunn] = '90009' AND [tilv] = '2009' THEN ''
      when [tunn] = '90015' AND [tilv] = '2009' THEN ''
      when [tunn] = '90010' AND [tilv] = '2009' THEN ''
      when [tunn] = '90018' AND [tilv] = '2009' THEN ''
      when [tunn] = '90008' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2011' THEN ''
      when [tunn] = '90018' AND [tilv] = '2011' THEN ''
      when [tunn] = '90006' AND [tilv] = '2009' THEN ''
      when [tunn] = '90006' AND [tilv] = '2010' THEN ''
      when [tunn] = '90006' AND [tilv] = '2011' THEN ''
      when [tunn] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [tunn] END) AS tunn,
jarj,
kkielir1,
tutklaja,
tutktav, 
aikoul, 
(CASE WHEN [tutkmaak] = '99' THEN '' ELSE [tutkmaak] END) AS tutkmaak, 
luopiskkoulk_2008 AS luopiskkoulk2008, 
(CASE WHEN [luopisktunn_2008] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2008] = '99999' THEN ''
      WHEN [luopisktunn_2008] = '00000' THEN '' 

      ELSE [luopisktunn_2008] END) AS luopisktunn2008,
luopiskjarj_2008 AS luopiskjarj2008,
(CASE WHEN [luopiskmaak_2008] = '99' THEN '' ELSE [luopiskmaak_2008] END) AS luopiskmaak2008,
ammopiskkoulk_2008 AS ammopiskkoulk2008, 
(CASE WHEN [ammopisktunn_2008] = 'BBBBB' THEN ''
      WHEN [ammopisktunn_2008] = '99999' THEN ''
      WHEN [ammopisktunn_2008] = '00000' THEN ''
      when [ammopisktunn_2008]  = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2008]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2008]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2008] = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2008] = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2008]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2008]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2008]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2008]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2008]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2008]  = '90006' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2008] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2008] END) AS ammopisktunn2008,
ammopiskjarj_2008 AS ammopiskjarj2008, 
(CASE WHEN [ammopiskmaak_2008] = '99' THEN '' ELSE [ammopiskmaak_2008] END) AS ammopiskmaak2008, 
amkopiskkoulk_2008 AS amkopiskkoulk2008, 
(CASE WHEN [amkopisktunn_2008] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2008] = '99999' THEN '' 
       WHEN [amkopisktunn_2008] = '00000' THEN '' ELSE [amkopisktunn_2008]  END) AS amkopisktunn2008,
amkopiskjarj_2008 AS amkopiskjarj2008, 
(CASE WHEN [amkopiskmaak_2008] = '99' THEN '' ELSE [amkopiskmaak_2008]END) AS amkopiskmaak2008,
yoopiskkoulk_2008 AS yoopiskkoulk2008,
(CASE WHEN [yoopisktunn_2008] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2008] = '99999' THEN ''
       WHEN [yoopisktunn_2008] = '00000' THEN ''  ELSE [yoopisktunn_2008]  END) AS yoopisktunn2008,
yoopiskjarj_2008 AS yoopiskjarj2008, 
(CASE WHEN [yoopiskmaak_2008] = '99' THEN '' ELSE [yoopiskmaak_2008] END) AS yoopiskmaak2008,
monihaku_2008 AS monihaku2008, 
ptoim1r4_2008, 
amas_2008, 
luopiskkoulk_2009 AS luopiskkoulk2009, 
(CASE WHEN [luopisktunn_2009] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2009] = '99999' THEN ''
      WHEN [luopisktunn_2009] = '00000' THEN '' 
      ELSE [luopisktunn_2009] END) AS luopisktunn2009,
luopiskjarj_2009 AS luopiskjarj2009,
(CASE WHEN [luopiskmaak_2009] = '99' THEN '' ELSE [luopiskmaak_2009] END) AS luopiskmaak2009,
ammopiskkoulk_2009 AS ammopiskkoulk2009, 
(CASE WHEN [ammopisktunn_2009] = 'BBBBB' THEN ''
      WHEN [ammopisktunn_2009] = '99999' THEN ''
      WHEN [ammopisktunn_2009] = '00000' THEN '' 
      when [ammopisktunn_2009] = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009] = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2009]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2009]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2009]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2009]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2009] = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2009] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2009] END) AS ammopisktunn2009,
ammopiskjarj_2009 as ammopiskjarj2009, 
(CASE WHEN [ammopiskmaak_2009] = '99' THEN '' ELSE [ammopiskmaak_2009] END) AS ammopiskmaak2009, 
amkopiskkoulk_2009 AS amkopiskkoulk2009, 
(CASE WHEN [amkopisktunn_2009] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2009] = '99999' THEN '' 
      WHEN [amkopisktunn_2009] = '00000' THEN ''ELSE [amkopisktunn_2009]  END) AS amkopisktunn2009,
amkopiskjarj_2009 AS amkopiskjarj2009, 
(CASE WHEN [amkopiskmaak_2009] = '99' THEN '' ELSE [amkopiskmaak_2009]END) AS amkopiskmaak2009,
yoopiskkoulk_2009 AS yoopiskkoulk2009,
(CASE WHEN [yoopisktunn_2009] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2009] = '99999' THEN ''
      WHEN [yoopisktunn_2009] = '00000' THEN '' ELSE [yoopisktunn_2009]  END) AS yoopisktunn2009,
yoopiskjarj_2009 AS yoopiskjarj2009, 
(CASE WHEN [yoopiskmaak_2009] = '99' THEN '' ELSE [yoopiskmaak_2009] END) AS yoopiskmaak2009,
monihaku_2009 as monihaku2009, 
ptoim1r4_2009, 
amas_2009, 
 luopiskkoulk2010 = '',
luopisktunn2010 = '',
luopiskjarj2010 = '', 
luopiskmaak2010 = '', 
ammopiskkoulk2010 = '', 
ammopisktunn2010 = '',
ammopiskjarj2010 = '', 
ammopiskmaak2010 = '', 
amkopiskkoulk2010 = '', 
amkopisktunn2010 = '',
amkopiskjarj2010 = '',
amkopiskmaak2010 = '', 
yoopiskkoulk2010 = '', 
yoopisktunn2010 = '',
yoopiskjarj2010 = '', 
yoopiskmaak2010 = '', 
monihaku2010 = '',
ptoim1r4_2010 = '', 
amas_2010 = '',
 luopiskkoulk2011 = '',
luopisktunn2011 = '',
luopiskjarj2011 = '', 
luopiskmaak2011 = '', 
ammopiskkoulk2011 = '', 
ammopisktunn2011 = '',
ammopiskjarj2011 = '', 
ammopiskmaak2011 = '', 
amkopiskkoulk2011 = '', 
amkopisktunn2011 = '',
amkopiskjarj2011 = '',
amkopiskmaak2011 = '', 
yoopiskkoulk2011 = '', 
yoopisktunn2011 = '',
yoopiskjarj2011 = '', 
yoopiskmaak2011 = '', 
monihaku2011 = '',
ptoim1r4_2011 = '', 
amas_2011 = '',
luopiskkoulk2012 = '',
luopisktunn2012 = '',
luopiskjarj2012 = '', 
luopiskmaak2012 = '', 
ammopiskkoulk2012 = '', 
ammopisktunn2012 = '',
ammopiskjarj2012 = '', 
ammopiskmaak2012 = '', 
amkopiskkoulk2012 = '', 
amkopisktunn2012 = '',
amkopiskjarj2012 = '',
amkopiskmaak2012 = '', 
yoopiskkoulk2012 = '', 
yoopisktunn2012 = '',
yoopiskjarj2012 = '', 
yoopiskmaak2012 = '', 
monihaku2012 = '',
ptoim1r4_2012 = '', 
amas_2012 = '',
luopiskkoulk2013 = '',
luopisktunn2013 = '',
luopiskjarj2013 = '', 
luopiskmaak2013 = '', 
ammopiskkoulk2013 = '', 
ammopisktunn2013 = '',
ammopiskjarj2013 = '', 
ammopiskmaak2013 = '', 
amkopiskkoulk2013 = '', 
amkopisktunn2013 = '',
amkopiskjarj2013 = '',
amkopiskmaak2013 = '', 
yoopiskkoulk2013 = '', 
yoopisktunn2013 = '',
yoopiskjarj2013 = '', 
yoopiskmaak2013 = '', 
monihaku2013 = '',
ptoim1r4_2013 = '', 
amas_2013 = '',
luopiskkoulk2014 = '',
luopisktunn2014 = '',
luopiskjarj2014 = '', 
luopiskmaak2014 = '', 
ammopiskkoulk2014 = '', 
ammopisktunn2014= '',
ammopiskjarj2014 = '', 
ammopiskmaak2014 = '', 
amkopiskkoulk2014 = '', 
amkopisktunn2014 = '', 
amkopiskjarj2014 = '',
amkopiskmaak2014 = '', 
yoopiskkoulk2014 = '', 
yoopisktunn2014 = '' ,
yoopiskjarj2014 = '',
yoopiskmaak2014 = '',
monihaku2014 = '', 
ptoim1r4_2014 = '', 
amas_2014 = '',
luopiskkoulk2015 = '',
luopisktunn2015 = '',
luopiskjarj2015 = '', 
luopiskmaak2015 = '', 
ammopiskkoulk2015 = '', 
ammopisktunn2015 = '',
ammopiskjarj2015 = '', 
ammopiskmaak2015 = '', 
amkopiskkoulk2015 = '', 
amkopisktunn2015 = '',
amkopiskjarj2015 = '',
amkopiskmaak2015 = '', 
yoopiskkoulk2015 = '', 
yoopisktunn2015 = '',
yoopiskjarj2015 = '', 
yoopiskmaak2015 = '', 
monihaku2015 = '',
ptoim1r4_2015 = '', 
amas_2015 = '',
luopiskkoulk2016 = '',
luopisktunn2016 = '',
luopiskjarj2016 = '', 
luopiskmaak2016 = '', 
ammopiskkoulk2016 = '', 
ammopisktunn2016 = '',
ammopiskjarj2016 = '', 
ammopiskmaak2016 = '', 
amkopiskkoulk2016 = '', 
amkopisktunn2016 = '',
amkopiskjarj2016 = '',
amkopiskmaak2016 = '', 
yoopiskkoulk2016 = '', 
yoopisktunn2016 = '',
yoopiskjarj2016 = '', 
yoopiskmaak2016 = '', 
monihaku2016 = '',
ptoim1r4_2016 = '', 
amas_2016 = '',
lkm, 
pohjkoul,
 [tietolahde]='K3_12_sopv_11',
 [rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_11]
 where suorv = '2008' and (suorlk = '1' or suorlk= '2')
 
 UNION ALL
 
 SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
(CASE WHEN [syntv]='19XX' THEN '' ELSE [syntv] END) as syntv,
aikielir1,
(CASE WHEN [tutkaskun]='427' THEN ''
 WHEN [tutkaskun]= '946' and (tilv= '2009' or tilv='2010') then '945'
      WHEN [tutkaskun]= '198' THEN ''
	  WHEN [tutkaskun]='999' THEN '' ELSE [tutkaskun] END) as tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
(CASE WHEN [tunn] = 'BBBBB' THEN ''
      WHEN [tunn] = '99999' THEN ''
      WHEN [tunn] = '00000' THEN '' 
      when [tunn] = '90009' AND [tilv] = '2009' THEN ''
      when [tunn] = '90015' AND [tilv] = '2009' THEN ''
      when [tunn] = '90010' AND [tilv] = '2009' THEN ''
      when [tunn] = '90018' AND [tilv] = '2009' THEN ''
      when [tunn] = '90008' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2011' THEN ''
      when [tunn] = '90018' AND [tilv] = '2011' THEN ''
      when [tunn] = '90006' AND [tilv] = '2009' THEN ''
      when [tunn] = '90006' AND [tilv] = '2010' THEN ''
      when [tunn] = '90006' AND [tilv] = '2011' THEN ''
        when [tunn] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [tunn] END) AS tunn,
jarj,
kkielir1,
tutklaja,
tutktav, 
aikoul, 
(CASE WHEN [tutkmaak] = '99' THEN '' ELSE [tutkmaak] END) as tutkmaak,  
luopiskkoulk2008 = '', 
luopisktunn2008 = '',
luopiskjarj2008= '',
luopiskmaak2008= '',
ammopiskkoulk2008= '', 
ammopisktunn2008= '',
ammopiskjarj2008 = '',
ammopiskmaak2008= '', 
amkopiskkoulk2008= '', 
amkopisktunn2008= '',
amkopiskjarj2008= '', 
amkopiskmaak2008= '',
yoopiskkoulk2008= '',
yoopisktunn2008= '',
yoopiskjarj2008= '', 
yoopiskmaak2008= '',
monihaku2008= '', 
ptoim1r4_2008= '', 
amas_2008= '', 
luopiskkoulk_2009 AS luopiskkoulk2009,
(CASE WHEN [luopisktunn_2009] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2009] = '99999' THEN ''
      WHEN [luopisktunn_2009] = '00000' THEN ''
      ELSE [luopisktunn_2009] END) AS luopisktunn2009,
luopiskjarj_2009 AS luopiskjarj2009, 
(CASE WHEN [luopiskmaak_2009] = '99' THEN ''ELSE [luopiskmaak_2009] END) AS luopiskmaak2009, 
ammopiskkoulk_2009 AS ammopiskkoulk2009, 
(CASE WHEN [ammopisktunn_2009] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2009] = '99999' THEN ''
      WHEN [ammopisktunn_2009] = '00000' THEN '' 
      when [ammopisktunn_2009]  = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2009]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2009]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2009]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2009]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2009]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2009] = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2009] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2009] END)AS ammopisktunn2009,
ammopiskjarj_2009 AS ammopiskjarj2009, 
(CASE WHEN [ammopiskmaak_2009] = '99' THEN ''ELSE [ammopiskmaak_2009] END) as ammopiskmaak2009, 
amkopiskkoulk_2009 AS amkopiskkoulk2009, 
(CASE WHEN [amkopisktunn_2009] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2009] = '99999' THEN ''
      WHEN [amkopisktunn_2009] = '00000' THEN '' ELSE [amkopisktunn_2009] END) AS amkopisktunn2009,
amkopiskjarj_2009 AS amkopiskjarj2009,
(CASE WHEN [amkopiskmaak_2009] = '99' THEN '' ELSE [amkopiskmaak_2009] END) AS amkopiskmaak2009, 
yoopiskkoulk_2009 AS yoopiskkoulk2009, 
(CASE WHEN [yoopisktunn_2009] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2009] = '99999' THEN ''
      WHEN [yoopisktunn_2009] = '00000' THEN '' ELSE [yoopisktunn_2009] END) AS yoopisktunn2009,
yoopiskjarj_2009 AS yoopiskjarj2009,
(CASE WHEN [yoopiskmaak_2009] = '99' THEN '' ELSE [yoopiskmaak_2009] END) AS yoopiskmaak2009,
monihaku_2009 AS monihaku2009, 
ptoim1r4_2009, 
amas_2009, 
luopiskkoulk_2010 AS luopiskkoulk2010,
(CASE WHEN [luopisktunn_2010] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2010] = '99999' THEN ''
      WHEN [luopisktunn_2010] = '00000' THEN ''
      ELSE [luopisktunn_2010] END) AS luopisktunn2010,
luopiskjarj_2010 AS luopiskjarj2010, 
(CASE WHEN [luopiskmaak_2010] = '99' THEN ''ELSE [luopiskmaak_2010] END) AS luopiskmaak2010, 
ammopiskkoulk_2010 AS ammopiskkoulk2010, 
(CASE WHEN [ammopisktunn_2010] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2010] = '99999' THEN ''
      WHEN [ammopisktunn_2010] = '00000' THEN '' 
      when [ammopisktunn_2010]  = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2010]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2010]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2010]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2010]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2010] = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2010] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2010] END)AS ammopisktunn2010,
ammopiskjarj_2010 AS ammopiskjarj2010, 
(CASE WHEN [ammopiskmaak_2010] = '99' THEN ''ELSE [ammopiskmaak_2010] END) as ammopiskmaak2010, 
amkopiskkoulk_2010 AS amkopiskkoulk2010, 
(CASE WHEN [amkopisktunn_2010] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2010] = '99999' THEN ''
      WHEN [amkopisktunn_2010] = '00000' THEN '' ELSE [amkopisktunn_2010] END) AS amkopisktunn2010,
amkopiskjarj_2010 AS amkopiskjarj2010,
(CASE WHEN [amkopiskmaak_2010] = '99' THEN '' ELSE [amkopiskmaak_2010] END) AS amkopiskmaak2010, 
yoopiskkoulk_2010 AS yoopiskkoulk2010, 
(CASE WHEN [yoopisktunn_2010] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2010] = '99999' THEN ''
      WHEN [yoopisktunn_2010] = '00000' THEN '' ELSE [yoopisktunn_2010] END) AS yoopisktunn2010,
yoopiskjarj_2010 AS yoopiskjarj2010,
(CASE WHEN [yoopiskmaak_2010] = '99' THEN '' ELSE [yoopiskmaak_2010] END) AS yoopiskmaak2010,
monihaku_2010 AS monihaku2010,
ptoim1r4_2010, 
amas_2010,
 luopiskkoulk2011 = '',
luopisktunn2011 = '',
luopiskjarj2011 = '', 
luopiskmaak2011 = '', 
ammopiskkoulk2011 = '', 
ammopisktunn2011 = '',
ammopiskjarj2011 = '', 
ammopiskmaak2011 = '', 
amkopiskkoulk2011 = '', 
amkopisktunn2011 = '',
amkopiskjarj2011 = '',
amkopiskmaak2011 = '', 
yoopiskkoulk2011 = '', 
yoopisktunn2011 = '',
yoopiskjarj2011 = '', 
yoopiskmaak2011 = '', 
monihaku2011 = '',
ptoim1r4_2011 = '', 
amas_2011 = '',
luopiskkoulk2012 = '',
luopisktunn2012 = '',
luopiskjarj2012 = '', 
luopiskmaak2012 = '', 
ammopiskkoulk2012 = '', 
ammopisktunn2012 = '',
ammopiskjarj2012 = '', 
ammopiskmaak2012 = '', 
amkopiskkoulk2012 = '', 
amkopisktunn2012 = '',
amkopiskjarj2012 = '',
amkopiskmaak2012 = '', 
yoopiskkoulk2012 = '', 
yoopisktunn2012 = '',
yoopiskjarj2012 = '', 
yoopiskmaak2012 = '', 
monihaku2012 = '',
ptoim1r4_2012 = '', 
amas_2012 = '',
luopiskkoulk2013 = '',
luopisktunn2013 = '',
luopiskjarj2013 = '', 
luopiskmaak2013 = '', 
ammopiskkoulk2013 = '', 
ammopisktunn2013 = '',
ammopiskjarj2013 = '', 
ammopiskmaak2013 = '', 
amkopiskkoulk2013 = '', 
amkopisktunn2013 = '',
amkopiskjarj2013 = '',
amkopiskmaak2013 = '', 
yoopiskkoulk2013 = '', 
yoopisktunn2013 = '',
yoopiskjarj2013 = '', 
yoopiskmaak2013 = '', 
monihaku2013 = '',
ptoim1r4_2013 = '', 
amas_2013 = '',
luopiskkoulk2014 = '',
luopisktunn2014 = '',
luopiskjarj2014 = '', 
luopiskmaak2014 = '', 
ammopiskkoulk2014 = '', 
ammopisktunn2014= '',
ammopiskjarj2014 = '', 
ammopiskmaak2014 = '', 
amkopiskkoulk2014 = '', 
amkopisktunn2014 = '', 
amkopiskjarj2014 = '',
amkopiskmaak2014 = '', 
yoopiskkoulk2014 = '', 
yoopisktunn2014 = '' ,
yoopiskjarj2014 = '',
yoopiskmaak2014 = '',
monihaku2014 = '', 
ptoim1r4_2014 = '', 
amas_2014 = '',
luopiskkoulk2015 = '',
luopisktunn2015 = '',
luopiskjarj2015 = '', 
luopiskmaak2015 = '', 
ammopiskkoulk2015 = '', 
ammopisktunn2015 = '',
ammopiskjarj2015 = '', 
ammopiskmaak2015 = '', 
amkopiskkoulk2015 = '', 
amkopisktunn2015 = '',
amkopiskjarj2015 = '',
amkopiskmaak2015 = '', 
yoopiskkoulk2015 = '', 
yoopisktunn2015 = '',
yoopiskjarj2015 = '', 
yoopiskmaak2015 = '', 
monihaku2015 = '',
ptoim1r4_2015 = '', 
amas_2015 = '',
luopiskkoulk2016 = '',
luopisktunn2016 = '',
luopiskjarj2016 = '', 
luopiskmaak2016 = '', 
ammopiskkoulk2016 = '', 
ammopisktunn2016 = '',
ammopiskjarj2016 = '', 
ammopiskmaak2016 = '', 
amkopiskkoulk2016 = '', 
amkopisktunn2016 = '',
amkopiskjarj2016 = '',
amkopiskmaak2016 = '', 
yoopiskkoulk2016 = '', 
yoopisktunn2016 = '',
yoopiskjarj2016 = '', 
yoopiskmaak2016 = '', 
monihaku2016 = '',
ptoim1r4_2016 = '', 
amas_2016 = '',
lkm, 
pohjkoul, 
 [tietolahde]='K3_12_sopv_12',
 [rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_12]
   where suorv = '2009' and (suorlk = '1' or suorlk= '2')
UNION ALL
 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
(CASE WHEN [syntv]='19XX' THEN '' ELSE [syntv] END) as syntv,
aikielir1,
(CASE WHEN [tutkaskun]='427' THEN ''
 WHEN [tutkaskun]= '946' and (tilv= '2009' or tilv='2010') then '945'
      WHEN [tutkaskun]= '198' THEN ''
	  WHEN [tutkaskun]='999' THEN '' ELSE [tutkaskun] END) as tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
(CASE WHEN [tunn] = 'BBBBB' THEN ''
      WHEN [tunn] = '99999' THEN ''
      WHEN [tunn] = '00000' THEN '' 
      when [tunn] = '90009' AND [tilv] = '2009' THEN ''
      when [tunn] = '90015' AND [tilv] = '2009' THEN ''
      when [tunn] = '90010' AND [tilv] = '2009' THEN ''
      when [tunn] = '90018' AND [tilv] = '2009' THEN ''
      when [tunn] = '90008' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2011' THEN ''
      when [tunn] = '90018' AND [tilv] = '2011' THEN ''
      when [tunn] = '90006' AND [tilv] = '2009' THEN ''
      when [tunn] = '90006' AND [tilv] = '2010' THEN ''
      when [tunn] = '90006' AND [tilv] = '2011' THEN ''
        when [tunn] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [tunn] END) AS tunn,
jarj,
kkielir1,
tutklaja,
tutktav, 
aikoul, 
(CASE WHEN [tutkmaak] = '99' THEN '' ELSE [tutkmaak] END) as tutkmaak, 
luopiskkoulk2008 = '', 
luopisktunn2008 = '',
luopiskjarj2008= '',
luopiskmaak2008= '',
ammopiskkoulk2008= '', 
ammopisktunn2008= '',
ammopiskjarj2008 = '',
ammopiskmaak2008= '', 
amkopiskkoulk2008= '', 
amkopisktunn2008= '',
amkopiskjarj2008= '', 
amkopiskmaak2008= '',
yoopiskkoulk2008= '',
yoopisktunn2008= '',
yoopiskjarj2008= '', 
yoopiskmaak2008= '',
monihaku2008= '', 
ptoim1r4_2008= '', 
amas_2008= '', 
luopiskkoulk2009 = '', 
luopisktunn2009 = '',
luopiskjarj2009= '',
luopiskmaak2009= '',
ammopiskkoulk2009= '', 
ammopisktunn2009= '',
ammopiskjarj2009 = '',
ammopiskmaak2009= '', 
amkopiskkoulk2009= '', 
amkopisktunn2009= '',
amkopiskjarj2009= '', 
amkopiskmaak2009= '',
yoopiskkoulk2009= '',
yoopisktunn2009= '',
yoopiskjarj2009= '', 
yoopiskmaak2009= '',
monihaku2009= '', 
ptoim1r4_2009= '', 
amas_2009= '',  
luopiskkoulk_2010 AS luopiskkoulk2010,
(CASE WHEN [luopisktunn_2010] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2010] = '99999' THEN '' 
      WHEN [luopisktunn_2010] = '00000' THEN ''
      ELSE [luopisktunn_2010] END) AS luopisktunn2010,
luopiskjarj_2010 AS luopisjarj2010, 
(CASE WHEN [luopiskmaak_2010] = '99' THEN ''ELSE [luopiskmaak_2010] END) AS luopiskmaak2010, 
ammopiskkoulk_2010 AS ammopiskkoulk2010, 
(CASE WHEN [ammopisktunn_2010] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2010] = '99999' THEN '' 
      WHEN [ammopisktunn_2010] = '00000' THEN ''
      when [ammopisktunn_2010]  = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2010]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2010]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2010]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2010]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2010]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2010]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2010] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2010] END)AS ammopisktunn2010,
ammopiskjarj_2010 AS ammopiskjarj2010, 
(CASE WHEN [ammopiskmaak_2010] = '99' THEN ''ELSE [ammopiskmaak_2010] END) as ammopiskmaak2010, 
amkopiskkoulk_2010 AS amkopiskkoulk2010, 
(CASE WHEN [amkopisktunn_2010] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2010] = '99999' THEN ''
      WHEN [amkopisktunn_2010] = '00000' THEN '' ELSE [amkopisktunn_2010] END) AS amkopisktunn2010,
amkopiskjarj_2010 AS amkopiskjarj2010,
(CASE WHEN [amkopiskmaak_2010] = '99' THEN '' ELSE [amkopiskmaak_2010] END) AS amkopiskmaak2010, 
yoopiskkoulk_2010 AS yoopiskkoulk2010, 
(CASE WHEN [yoopisktunn_2010] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2010] = '99999' THEN ''
      WHEN [yoopisktunn_2010] = '00000' THEN '' ELSE [yoopisktunn_2010] END) AS yoopisktunn2010,
yoopiskjarj_2010 AS yoopiskjarj2010,
(CASE WHEN [yoopiskmaak_2010] = '99' THEN '' ELSE [yoopiskmaak_2010] END) AS yoopiskmaak2010,
monihaku_2010 AS monihaku2010, 
ptoim1r4_2010, 
amas_2010, 
luopiskkoulk_2011 AS luopiskkoul2011,
(CASE WHEN [luopisktunn_2011] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2011] = '99999' THEN ''
      WHEN [luopisktunn_2011] = '00000' THEN ''
      ELSE [luopisktunn_2011] END) AS luopisktunn2011,
luopiskjarj_2011 AS luopiskjarj2011, 
(CASE WHEN [luopiskmaak_2011] = '99' THEN ''ELSE [luopiskmaak_2011] END) AS luopiskmaak2011, 
ammopiskkoulk_2011 AS ammopiskkoulk2011, 
(CASE WHEN [ammopisktunn_2011] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2011] = '99' THEN ''
      WHEN [ammopisktunn_2011] = '00000' THEN ''
      when [ammopisktunn_2011]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2011]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2011]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2011]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2011]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2011]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2011] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2011] END)AS ammopisktunn2011,
ammopiskjarj_2011 AS ammopiskjarj2011, 
(CASE WHEN [ammopiskmaak_2011] = '99' THEN ''ELSE [ammopiskmaak_2011] END) as ammopiskmaak2011, 
amkopiskkoulk_2011 AS amkopiskkoulk2011, 
(CASE WHEN [amkopisktunn_2011] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2011] = '99999' THEN '' 
      WHEN [amkopisktunn_2011] = '00000' THEN ''ELSE [amkopisktunn_2011] END) AS amkopisktunn2011,
amkopiskjarj_2011 AS amkopiskjarj2011,
(CASE WHEN [amkopiskmaak_2011] = '99' THEN '' ELSE [amkopiskmaak_2011] END) AS amkopiskmaak2011, 
yoopiskkoulk_2011 AS yoopiskkoulk2011, 
(CASE WHEN [yoopisktunn_2011] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2011] = '99999' THEN ''
      WHEN [yoopisktunn_2011] = '00000' THEN '' ELSE [yoopisktunn_2011] END) AS yoopisktunn2011,
yoopiskjarj_2011 AS yoopiskjarj2011,
(CASE WHEN [yoopiskmaak_2011] = '99' THEN '' ELSE [yoopiskmaak_2011] END) AS yoopiskmaak2011,
monihaku_2011 AS monihaku2011,
ptoim1r4_2011, 
amas_2011, 
luopiskkoulk2012 = '',
luopisktunn2012 = '',
luopiskjarj2012 = '', 
luopiskmaak2012 = '', 
ammopiskkoulk2012 = '', 
ammopisktunn2012 = '',
ammopiskjarj2012 = '', 
ammopiskmaak2012 = '', 
amkopiskkoulk2012 = '', 
amkopisktunn2012 = '',
amkopiskjarj2012 = '',
amkopiskmaak2012 = '', 
yoopiskkoulk2012 = '', 
yoopisktunn2012 = '',
yoopiskjarj2012 = '', 
yoopiskmaak2012 = '', 
monihaku2012 = '',
ptoim1r4_2012 = '', 
amas_2012 = '',
luopiskkoulk2013 = '',
luopisktunn2013 = '',
luopiskjarj2013 = '', 
luopiskmaak2013 = '', 
ammopiskkoulk2013 = '', 
ammopisktunn2013 = '',
ammopiskjarj2013 = '', 
ammopiskmaak2013 = '', 
amkopiskkoulk2013 = '', 
amkopisktunn2013 = '',
amkopiskjarj2013 = '',
amkopiskmaak2013 = '', 
yoopiskkoulk2013 = '', 
yoopisktunn2013 = '',
yoopiskjarj2013 = '', 
yoopiskmaak2013 = '', 
monihaku2013 = '',
ptoim1r4_2013 = '', 
amas_2013 = '',
luopiskkoulk2014 = '',
luopisktunn2014 = '',
luopiskjarj2014 = '', 
luopiskmaak2014 = '', 
ammopiskkoulk2014 = '', 
ammopisktunn2014= '',
ammopiskjarj2014 = '', 
ammopiskmaak2014 = '', 
amkopiskkoulk2014 = '', 
amkopisktunn2014 = '', 
amkopiskjarj2014 = '',
amkopiskmaak2014 = '', 
yoopiskkoulk2014 = '', 
yoopisktunn2014 = '' ,
yoopiskjarj2014 = '',
yoopiskmaak2014 = '',
monihaku2014 = '', 
ptoim1r4_2014 = '', 
amas_2014 = '',
luopiskkoulk2015 = '',
luopisktunn2015 = '',
luopiskjarj2015 = '', 
luopiskmaak2015 = '', 
ammopiskkoulk2015 = '', 
ammopisktunn2015 = '',
ammopiskjarj2015 = '', 
ammopiskmaak2015 = '', 
amkopiskkoulk2015 = '', 
amkopisktunn2015 = '',
amkopiskjarj2015 = '',
amkopiskmaak2015 = '', 
yoopiskkoulk2015 = '', 
yoopisktunn2015 = '',
yoopiskjarj2015 = '', 
yoopiskmaak2015 = '', 
monihaku2015 = '',
ptoim1r4_2015 = '', 
amas_2015 = '',
luopiskkoulk2016 = '',
luopisktunn2016 = '',
luopiskjarj2016 = '', 
luopiskmaak2016 = '', 
ammopiskkoulk2016 = '', 
ammopisktunn2016 = '',
ammopiskjarj2016 = '', 
ammopiskmaak2016 = '', 
amkopiskkoulk2016 = '', 
amkopisktunn2016 = '',
amkopiskjarj2016 = '',
amkopiskmaak2016 = '', 
yoopiskkoulk2016 = '', 
yoopisktunn2016 = '',
yoopiskjarj2016 = '', 
yoopiskmaak2016 = '', 
monihaku2016 = '',
ptoim1r4_2016 = '', 
amas_2016 = '',
lkm, 
pohjkoul,
 [tietolahde]='K3_12_sopv_13',
 [rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_13]
where suorv = '2010' and (suorlk = '1' or suorlk= '2')

UNION ALL
 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
(CASE WHEN [syntv]='19XX' THEN '' ELSE [syntv] END) as syntv,
aikielir1,
(CASE WHEN [tutkaskun]='427' THEN ''
 WHEN [tutkaskun]= '946' and (tilv= '2009' or tilv='2010') then '945'
      WHEN [tutkaskun]= '198' THEN ''
	  WHEN [tutkaskun]='999' THEN '' ELSE [tutkaskun] END) as tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
(CASE WHEN [tunn] = 'BBBBB' THEN ''
      WHEN [tunn] = '99999' THEN ''
      WHEN [tunn] = '00000' THEN '' 
      when [tunn] = '90009' AND [tilv] = '2009' THEN ''
      when [tunn] = '90015' AND [tilv] = '2009' THEN ''
      when [tunn] = '90010' AND [tilv] = '2009' THEN ''
      when [tunn] = '90018' AND [tilv] = '2009' THEN ''
      when [tunn] = '90008' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2011' THEN ''
      when [tunn] = '90018' AND [tilv] = '2011' THEN ''
      when [tunn] = '90006' AND [tilv] = '2009' THEN ''
      when [tunn] = '90006' AND [tilv] = '2010' THEN ''
      when [tunn] = '90006' AND [tilv] = '2011' THEN ''
        when [tunn] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [tunn] END) AS tunn,
jarj,
kkielir1,
tutklaja,
tutktav, 
aikoul, 
(CASE WHEN [tutkmaak] = '99' THEN '' ELSE [tutkmaak] END) as tutkmaak, 
luopiskkoulk2008 = '', 
luopisktunn2008 = '',
luopiskjarj2008= '',
luopiskmaak2008= '',
ammopiskkoulk2008= '', 
ammopisktunn2008= '',
ammopiskjarj2008 = '',
ammopiskmaak2008= '', 
amkopiskkoulk2008= '', 
amkopisktunn2008= '',
amkopiskjarj2008= '', 
amkopiskmaak2008= '',
yoopiskkoulk2008= '',
yoopisktunn2008= '',
yoopiskjarj2008= '', 
yoopiskmaak2008= '',
monihaku2008= '', 
ptoim1r4_2008= '', 
amas_2008= '', 
luopiskkoulk2009 = '', 
luopisktunn2009 = '',
luopiskjarj2009= '',
luopiskmaak2009= '',
ammopiskkoulk2009= '', 
ammopisktunn2009= '',
ammopiskjarj2009 = '',
ammopiskmaak2009= '', 
amkopiskkoulk2009= '', 
amkopisktunn2009= '',
amkopiskjarj2009= '', 
amkopiskmaak2009= '',
yoopiskkoulk2009= '',
yoopisktunn2009= '',
yoopiskjarj2009= '', 
yoopiskmaak2009= '',
monihaku2009= '', 
ptoim1r4_2009= '', 
amas_2009= '',  
luopiskkoulk2010 = '',
luopisktunn2010 = '',
luopiskjarj2010 = '', 
luopiskmaak2010 = '', 
ammopiskkoulk2010 = '', 
ammopisktunn2010 = '',
ammopiskjarj2010 = '', 
ammopiskmaak2010 = '', 
amkopiskkoulk2010 = '', 
amkopisktunn2010 = '', 
amkopiskjarj2010 = '',
amkopiskmaak2010 = '', 
yoopiskkoulk2010 = '', 
yoopisktunn2010 = '' ,
yoopiskjarj2010 = '',
yoopiskmaak2010 = '',
monihaku2010 = '', 
ptoim1r4_2010 = '', 
amas_2010 = '', 
luopiskkoulk_2011,
(CASE WHEN [luopisktunn_2011] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2011] = '99999' THEN ''
      WHEN [luopisktunn_2011] = '00000' THEN ''
      ELSE [luopisktunn_2011] END) AS luopisktunn2011,
luopiskjarj_2011, 
(CASE WHEN [luopiskmaak_2011] = '99' THEN ''ELSE [luopiskmaak_2011] END) AS luopiskmaak2011, 
ammopiskkoulk_2011, 
(CASE WHEN [ammopisktunn_2011] = 'BBBBBB' THEN ''
 WHEN [ammopisktunn_2011] = '99' THEN ''
      WHEN [ammopisktunn_2011] = '00000' THEN ''
      when [ammopisktunn_2011]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2011]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2011]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2011]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2011]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2011]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2011]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2011] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2011] END)AS ammopisktunn_2011,
ammopiskjarj_2011 AS ammopiskjarj2011, 
(CASE WHEN [ammopiskmaak_2011] = '99' THEN ''ELSE [ammopiskmaak_2011] END) as ammopiskmaak2011, 
amkopiskkoulk_2011 AS amkopiskkoulk2011, 
(CASE WHEN [amkopisktunn_2011] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2011] = '99999' THEN '' 
      WHEN [amkopisktunn_2011] = '00000' THEN ''ELSE [amkopisktunn_2011] END) AS amkopisktunn2011,
amkopiskjarj_2011 AS amkopiskjarj2011,
(CASE WHEN [amkopiskmaak_2011] = '99' THEN '' ELSE [amkopiskmaak_2011] END) AS amkopiskmaak2011, 
yoopiskkoulk_2011 AS yoopiskkoulk2011, 
(CASE WHEN [yoopisktunn_2011] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2011] = '99999' THEN ''
      WHEN [yoopisktunn_2011] = '00000' THEN '' ELSE [yoopisktunn_2011] END) AS yoopisktunn2011,
yoopiskjarj_2011 AS yoopiskjarj,
(CASE WHEN [yoopiskmaak_2011] = '99' THEN '' ELSE [yoopiskmaak_2011] END) AS yoopiskmaak2011,
monihaku_2011 as monihaku2011, 
ptoim1r4_2011, 
amas_2011, 
luopiskkoulk_2012 as luopiskkoulk2012,
(CASE WHEN [luopisktunn_2012] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2012] = '99999' THEN ''
      WHEN [luopisktunn_2012] = '00000' THEN ''
      ELSE [luopisktunn_2012] END) AS luopisktunn2012,
luopiskjarj_2012 as luopiskjarj2012, 
(CASE WHEN [luopiskmaak_2012] = '99' THEN ''ELSE [luopiskmaak_2012] END) AS luopiskmaak2012, 
ammopiskkoulk_2012 as ammopiskkoulk2012, 
(CASE WHEN [ammopisktunn_2012] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2012] = '99' THEN ''
      WHEN [ammopisktunn_2012] = '00000' THEN ''
      when [ammopisktunn_2012]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2012]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2012]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2012]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2012]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2012]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2012] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2012] END)AS ammopisktunn2012,
ammopiskjarj_2012 as ammopisjarj2012, 
(CASE WHEN [ammopiskmaak_2012] = '99' THEN ''ELSE [ammopiskmaak_2012] END) as ammopiskmaak2012, 
amkopiskkoulk_2012 as amkopiskkoulk2012, 
(CASE WHEN [amkopisktunn_2012] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2012] = '99999' THEN '' 
      WHEN [amkopisktunn_2012] = '00000' THEN ''ELSE [amkopisktunn_2012] END) AS amkopisktunn2012,
amkopiskjarj_2012 as amkopiskjarj2012,
(CASE WHEN [amkopiskmaak_2012] = '99' THEN '' ELSE [amkopiskmaak_2012] END) AS amkopiskmaak2012, 
yoopiskkoulk_2012 as yoopiskkoulk2012, 
(CASE WHEN [yoopisktunn_2012] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2012] = '99999' THEN ''
      WHEN [yoopisktunn_2012] = '00000' THEN '' ELSE [yoopisktunn_2012] END) AS yoopisktunn2012,
yoopiskjarj_2012 as yoopiskjarj2012,
(CASE WHEN [yoopiskmaak_2012] = '99' THEN '' ELSE [yoopiskmaak_2012] END) AS yoopiskmaak2012,
monihaku_2012 as monihaku2012, 
ptoim1r4_2012, 
amas_2012, 
luopiskkoulk2013 = '',
luopisktunn2013 = '',
luopiskjarj2013 = '', 
luopiskmaak2013 = '', 
ammopiskkoulk2013 = '', 
ammopisktunn2013 = '',
ammopiskjarj2013 = '', 
ammopiskmaak2013 = '', 
amkopiskkoulk2013 = '', 
amkopisktunn2013 = '',
amkopiskjarj2013 = '',
amkopiskmaak2013 = '', 
yoopiskkoulk2013 = '', 
yoopisktunn2013 = '',
yoopiskjarj2013 = '', 
yoopiskmaak2013 = '', 
monihaku2013 = '',
ptoim1r4_2013 = '', 
amas_2013 = '',
luopiskkoulk2014 = '',
luopisktunn2014 = '',
luopiskjarj2014 = '', 
luopiskmaak2014 = '', 
ammopiskkoulk2014 = '', 
ammopisktunn2014= '',
ammopiskjarj2014 = '', 
ammopiskmaak2014 = '', 
amkopiskkoulk2014 = '', 
amkopisktunn2014 = '', 
amkopiskjarj2014 = '',
amkopiskmaak2014 = '', 
yoopiskkoulk2014 = '', 
yoopisktunn2014 = '' ,
yoopiskjarj2014 = '',
yoopiskmaak2014 = '',
monihaku2014 = '', 
ptoim1r4_2014 = '', 
amas_2014 = '',
luopiskkoulk2015 = '',
luopisktunn2015 = '',
luopiskjarj2015 = '', 
luopiskmaak2015 = '', 
ammopiskkoulk2015 = '', 
ammopisktunn2015 = '',
ammopiskjarj2015 = '', 
ammopiskmaak2015 = '', 
amkopiskkoulk2015 = '', 
amkopisktunn2015 = '',
amkopiskjarj2015 = '',
amkopiskmaak2015 = '', 
yoopiskkoulk2015 = '', 
yoopisktunn2015 = '',
yoopiskjarj2015 = '', 
yoopiskmaak2015 = '', 
monihaku2015 = '',
ptoim1r4_2015 = '', 
amas_2015 = '',
luopiskkoulk2016 = '',
luopisktunn2016 = '',
luopiskjarj2016 = '', 
luopiskmaak2016 = '', 
ammopiskkoulk2016 = '', 
ammopisktunn2016 = '',
ammopiskjarj2016 = '', 
ammopiskmaak2016 = '', 
amkopiskkoulk2016 = '', 
amkopisktunn2016 = '',
amkopiskjarj2016 = '',
amkopiskmaak2016 = '', 
yoopiskkoulk2016 = '', 
yoopisktunn2016 = '',
yoopiskjarj2016 = '', 
yoopiskmaak2016 = '', 
monihaku2016 = '',
ptoim1r4_2016 = '', 
amas_2016 = '',
lkm, 
pohjkoul,
 [tietolahde]='K3_12_sopv_14',
 [rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_14]
where suorv = '2011' and (suorlk = '1' or suorlk= '2')

UNION ALL
 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
(CASE WHEN [tutkryh] is NULL THEN '' ELSE [tutkryh] END) as tutkryh,
(CASE WHEN [suorv] is NULL THEN '' ELSE [suorv] END) as suorv,
(CASE WHEN [suorlk] is NULL THEN '' ELSE [suorlk] END) as suorlk,
(CASE WHEN [sp] is NULL THEN '' ELSE [sp] END) as sp,
(CASE WHEN [syntv]='19XX' THEN '' 
 WHEN [syntv] is NULL THEN '' ELSE [syntv] END) as syntv,
aikielir1,
(CASE WHEN [tutkaskun]='427' THEN ''
 WHEN [tutkaskun]= '946' and (tilv= '2009' or tilv='2010') then '945'
      WHEN [tutkaskun]= '198' THEN ''
	  WHEN [tutkaskun]='999' THEN '' ELSE [tutkaskun] END) as tutkaskun,
	  (CASE WHEN [kansalr1] is NULL THEN '' ELSE [kansalr1] END) as kansalr1,
  (CASE WHEN [pohjmaa] is NULL THEN '' ELSE [pohjmaa] END) as pohjmaa,
(CASE WHEN [eumaa] is NULL THEN '' ELSE [eumaa] END) as eumaa,
(CASE WHEN [etamaa] is NULL THEN '' ELSE [etamaa] END) as etamaa,
(CASE WHEN [tunn] = 'BBBBB' THEN ''
      WHEN [tunn] = '99999' THEN ''
      WHEN [tunn] = '00000' THEN '' 
      when [tunn] = '90009' AND [tilv] = '2009' THEN ''
      when [tunn] = '90015' AND [tilv] = '2009' THEN ''
      when [tunn] = '90010' AND [tilv] = '2009' THEN ''
      when [tunn] = '90018' AND [tilv] = '2009' THEN ''
      when [tunn] = '90008' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2011' THEN ''
      when [tunn] = '90018' AND [tilv] = '2011' THEN ''
      when [tunn] = '90006' AND [tilv] = '2009' THEN ''
      when [tunn] = '90006' AND [tilv] = '2010' THEN ''
      when [tunn] = '90006' AND [tilv] = '2011' THEN ''
        when [tunn] = '90018' AND [tilv] = '2012' THEN ''
		when [tunn] is NULL then ''
      ELSE [tunn] END) AS tunn,
(case when jarj= '' then '' 
       when jarj is NULL then '' else jarj end ),
kkielir1,
 (case when tutklaja= '' then '' 
       when tutklaja is NULL then '' else tutklaja end ),
 (case when tutktav= '' then '' 
       when tutktav is NULL then '' else tutktav end ),
(case when aikoul= '' then '' 
       when aikoul is NULL then '' else aikoul end ),
(CASE WHEN [tutkmaak] = '99' THEN '' ELSE [tutkmaak] END) as tutkmaak,  
luopiskkoulk2008 = '', 
luopisktunn2008 = '',
luopiskjarj2008= '',
luopiskmaak2008= '',
ammopiskkoulk2008= '', 
ammopisktunn2008= '',
ammopiskjarj2008 = '',
ammopiskmaak2008= '', 
amkopiskkoulk2008= '', 
amkopisktunn2008= '',
amkopiskjarj2008= '', 
amkopiskmaak2008= '',
yoopiskkoulk2008= '',
yoopisktunn2008= '',
yoopiskjarj2008= '', 
yoopiskmaak2008= '',
monihaku2008= '', 
ptoim1r4_2008= '', 
amas_2008= '', 
luopiskkoulk2009 = '', 
luopisktunn2009 = '',
luopiskjarj2009= '',
luopiskmaak2009= '',
ammopiskkoulk2009= '', 
ammopisktunn2009= '',
ammopiskjarj2009 = '',
ammopiskmaak2009= '', 
amkopiskkoulk2009= '', 
amkopisktunn2009= '',
amkopiskjarj2009= '', 
amkopiskmaak2009= '',
yoopiskkoulk2009= '',
yoopisktunn2009= '',
yoopiskjarj2009= '', 
yoopiskmaak2009= '',
monihaku2009= '', 
ptoim1r4_2009= '', 
amas_2009= '',  
luopiskkoulk2010 = '',
luopisktunn2010 = '',
luopiskjarj2010 = '', 
luopiskmaak2010 = '', 
ammopiskkoulk2010 = '', 
ammopisktunn2010 = '',
ammopiskjarj2010 = '', 
ammopiskmaak2010 = '', 
amkopiskkoulk2010 = '', 
amkopisktunn2010 = '', 
amkopiskjarj2010 = '',
amkopiskmaak2010 = '', 
yoopiskkoulk2010 = '', 
yoopisktunn2010 = '' ,
yoopiskjarj2010 = '',
yoopiskmaak2010 = '',
monihaku2010 = '', 
ptoim1r4_2010 = '', 
amas_2010 = '', 
luopiskkoulk2011 = '',
luopisktunn2011 = '',
luopiskjarj2011 = '', 
luopiskmaak2011 = '', 
ammopiskkoulk2011 = '', 
ammopisktunn2011= '',
ammopiskjarj2011 = '', 
ammopiskmaak2011 = '', 
amkopiskkoulk2011 = '', 
amkopisktunn2011 = '', 
amkopiskjarj2011 = '',
amkopiskmaak2011 = '', 
yoopiskkoulk2011 = '', 
yoopisktunn2011 = '' ,
yoopiskjarj2011 = '',
yoopiskmaak2011 = '',
monihaku2011 = '', 
ptoim1r4_2011 = '', 
amas_2011 = '', 
luopiskkoulk_2012,
(CASE WHEN [luopisktunn_2012] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2012] = '99999' THEN ''
      WHEN [luopisktunn_2012] = '00000' THEN ''
      ELSE [luopisktunn_2012] END) AS luopisktunn2012,
luopiskjarj_2012, 
(CASE WHEN [luopiskmaak_2012] = '99' THEN ''ELSE [luopiskmaak_2012] END) AS luopiskmaak2012, 
ammopiskkoulk_2012, 
(CASE WHEN [ammopisktunn_2012] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2012] = '99' THEN ''
      WHEN [ammopisktunn_2012] = '00000' THEN ''
      when [ammopisktunn_2012]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2012]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2012]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2012]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2012]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2012]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2012]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2012] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2012] END)AS ammopisktunn2012,
ammopiskjarj_2012, 
(CASE WHEN [ammopiskmaak_2012] = '99' THEN ''ELSE [ammopiskmaak_2012] END) as ammopiskmaak2012, 
amkopiskkoulk_2012, 
(CASE WHEN [amkopisktunn_2012] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2012] = '99999' THEN '' 
      WHEN [amkopisktunn_2012] = '00000' THEN ''ELSE [amkopisktunn_2012] END) AS amkopisktunn2012,
amkopiskjarj_2012,
(CASE WHEN [amkopiskmaak_2012] = '99' THEN '' ELSE [amkopiskmaak_2012] END) AS amkopiskmaak2012, 
yoopiskkoulk_2012, 
(CASE WHEN [yoopisktunn_2012] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2012] = '99999' THEN ''
      WHEN [yoopisktunn_2012] = '00000' THEN '' ELSE [yoopisktunn_2012] END) AS yoopisktunn2012,
yoopiskjarj_2012,
(CASE WHEN [yoopiskmaak_2012] = '99' THEN '' ELSE [yoopiskmaak_2012] END) AS yoopiskmaak2012,
(CASE WHEN [monihaku_2012] is NULL THEN '' ELSE [monihaku_2012] END) as monihaku2012, 
(CASE WHEN [ptoim1r4_2012] is NULL THEN '' ELSE [ptoim1r4_2012] END) as ptoim1r4_2012, 
(CASE WHEN [amas_2012] is NULL THEN '' ELSE [amas_2012] END) as amas_2012,  
luopiskkoulk_2013,
(CASE WHEN [luopisktunn_2013] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2013] = '99999' THEN ''
      WHEN [luopisktunn_2013] = '00000' THEN ''
      ELSE [luopisktunn_2013] END) AS luopisktunn2013,
luopiskjarj_2013, 
(CASE WHEN [luopiskmaak_2013] = '99' THEN ''ELSE [luopiskmaak_2013] END) AS luopiskmaak2013, 
ammopiskkoulk_2013, 
(CASE WHEN [ammopisktunn_2013] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2013] = '99' THEN ''
      WHEN [ammopisktunn_2013] = '00000' THEN ''
      when [ammopisktunn_2013]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2013]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2013]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2013]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2013]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2013]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2013] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2013] END)AS ammopisktunn2013,
ammopiskjarj_2013, 
(CASE WHEN [ammopiskmaak_2013] = '99' THEN ''ELSE [ammopiskmaak_2013] END) as ammopiskmaak2013, 
amkopiskkoulk_2013, 
(CASE WHEN [amkopisktunn_2013] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2013] = '99999' THEN '' 
      WHEN [amkopisktunn_2013] = '00000' THEN ''ELSE [amkopisktunn_2013] END) AS amkopisktunn2013,
amkopiskjarj_2013,
(CASE WHEN [amkopiskmaak_2013] = '99' THEN '' ELSE [amkopiskmaak_2013] END) AS amkopiskmaak2013, 
yoopiskkoulk_2013, 
(CASE WHEN [yoopisktunn_2013] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2013] = '99999' THEN ''
      WHEN [yoopisktunn_2013] = '00000' THEN '' ELSE [yoopisktunn_2013] END) AS yoopisktunn2013,
yoopiskjarj_2013,
(CASE WHEN [yoopiskmaak_2013] = '99' THEN '' ELSE [yoopiskmaak_2013] END) AS yoopiskmaak2013,
(CASE WHEN [monihaku_2013] is NULL THEN '' ELSE [monihaku_2013] END) as monihaku2013, 
(CASE WHEN [ptoim1r4_2013] is NULL THEN '' ELSE [ptoim1r4_2013] END) as ptoim1r4_2013, 
(CASE WHEN [amas_2013] is NULL THEN '' ELSE [amas_2013] END) as amas_2013,
luopiskkoulk2014 = '',
luopisktunn2014 = '',
luopiskjarj2014 = '', 
luopiskmaak2014 = '', 
ammopiskkoulk2014 = '', 
ammopisktunn2014= '',
ammopiskjarj2014 = '', 
ammopiskmaak2014 = '', 
amkopiskkoulk2014 = '', 
amkopisktunn2014 = '', 
amkopiskjarj2014 = '',
amkopiskmaak2014 = '', 
yoopiskkoulk2014 = '', 
yoopisktunn2014 = '' ,
yoopiskjarj2014 = '',
yoopiskmaak2014 = '',
monihaku2014 = '', 
ptoim1r4_2014 = '', 
amas_2014 = '',
luopiskkoulk2015 = '',
luopisktunn2015 = '',
luopiskjarj2015 = '', 
luopiskmaak2015 = '', 
ammopiskkoulk2015 = '', 
ammopisktunn2015 = '',
ammopiskjarj2015 = '', 
ammopiskmaak2015 = '', 
amkopiskkoulk2015 = '', 
amkopisktunn2015 = '',
amkopiskjarj2015 = '',
amkopiskmaak2015 = '', 
yoopiskkoulk2015 = '', 
yoopisktunn2015 = '',
yoopiskjarj2015 = '', 
yoopiskmaak2015 = '', 
monihaku2015 = '',
ptoim1r4_2015 = '', 
amas_2015 = '',  
luopiskkoulk2016 = '',
luopisktunn2016 = '',
luopiskjarj2016 = '', 
luopiskmaak2016 = '', 
ammopiskkoulk2016 = '', 
ammopisktunn2016 = '',
ammopiskjarj2016 = '', 
ammopiskmaak2016 = '', 
amkopiskkoulk2016 = '', 
amkopisktunn2016 = '',
amkopiskjarj2016 = '',
amkopiskmaak2016 = '', 
yoopiskkoulk2016 = '', 
yoopisktunn2016 = '',
yoopiskjarj2016 = '', 
yoopiskmaak2016 = '', 
monihaku2016 = '',
ptoim1r4_2016 = '', 
amas_2016 = '',
lkm, 
pohjkoul,
 [tietolahde]='K3_12_sopv_15',
 [rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_15]
where suorv = '2012' and (suorlk = '1' or suorlk= '2')

UNION ALL
 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
(CASE WHEN [tutkryh] is NULL THEN '' ELSE [tutkryh] END) as tutkryh,
(CASE WHEN [suorv] is NULL THEN '' ELSE [suorv] END) as suorv,
(CASE WHEN [suorlk] is NULL THEN '' ELSE [suorlk] END) as suorlk,
(CASE WHEN [sp] is NULL THEN '' ELSE [sp] END) as sp,
(CASE WHEN [syntv]='19XX' THEN '' 
 WHEN [syntv] is NULL THEN '' ELSE [syntv] END) as syntv,
aikielir1,
(CASE WHEN [tutkaskun]='427' THEN ''
 WHEN [tutkaskun]= '946' and (tilv= '2009' or tilv='2010') then '945'
      WHEN [tutkaskun]= '198' THEN ''
	  WHEN [tutkaskun]='999' THEN '' ELSE [tutkaskun] END) as tutkaskun,
	  (CASE WHEN [kansalr1] is NULL THEN '' ELSE [kansalr1] END) as kansalr1,
  (CASE WHEN [pohjmaa] is NULL THEN '' ELSE [pohjmaa] END) as pohjmaa,
(CASE WHEN [eumaa] is NULL THEN '' ELSE [eumaa] END) as eumaa,
(CASE WHEN [etamaa] is NULL THEN '' ELSE [etamaa] END) as etamaa,
(CASE WHEN [tunn] = 'BBBBB' THEN ''
      WHEN [tunn] = '99999' THEN ''
      WHEN [tunn] = '00000' THEN '' 
      when [tunn] = '90009' AND [tilv] = '2009' THEN ''
      when [tunn] = '90015' AND [tilv] = '2009' THEN ''
      when [tunn] = '90010' AND [tilv] = '2009' THEN ''
      when [tunn] = '90018' AND [tilv] = '2009' THEN ''
      when [tunn] = '90008' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2011' THEN ''
      when [tunn] = '90018' AND [tilv] = '2011' THEN ''
      when [tunn] = '90006' AND [tilv] = '2009' THEN ''
      when [tunn] = '90006' AND [tilv] = '2010' THEN ''
      when [tunn] = '90006' AND [tilv] = '2011' THEN ''
        when [tunn] = '90018' AND [tilv] = '2012' THEN ''
		when [tunn] is NULL then ''
      ELSE [tunn] END) AS tunn,
(case when jarj= '' then '' 
       when jarj is NULL then '' else jarj end ),
kkielir1,
 (case when tutklaja= '' then '' 
       when tutklaja is NULL then '' else tutklaja end ),
 (case when tutktav= '' then '' 
       when tutktav is NULL then '' else tutktav end ),
(case when aikoul= '' then '' 
       when aikoul is NULL then '' else aikoul end ),
(CASE WHEN [tutkmaak] = '99' THEN '' ELSE [tutkmaak] END) as tutkmaak,  
luopiskkoulk2008 = '', 
luopisktunn2008 = '',
luopiskjarj2008= '',
luopiskmaak2008= '',
ammopiskkoulk2008= '', 
ammopisktunn2008= '',
ammopiskjarj2008 = '',
ammopiskmaak2008= '', 
amkopiskkoulk2008= '', 
amkopisktunn2008= '',
amkopiskjarj2008= '', 
amkopiskmaak2008= '',
yoopiskkoulk2008= '',
yoopisktunn2008= '',
yoopiskjarj2008= '', 
yoopiskmaak2008= '',
monihaku2008= '', 
ptoim1r4_2008= '', 
amas_2008= '', 
luopiskkoulk2009 = '', 
luopisktunn2009 = '',
luopiskjarj2009= '',
luopiskmaak2009= '',
ammopiskkoulk2009= '', 
ammopisktunn2009= '',
ammopiskjarj2009 = '',
ammopiskmaak2009= '', 
amkopiskkoulk2009= '', 
amkopisktunn2009= '',
amkopiskjarj2009= '', 
amkopiskmaak2009= '',
yoopiskkoulk2009= '',
yoopisktunn2009= '',
yoopiskjarj2009= '', 
yoopiskmaak2009= '',
monihaku2009= '', 
ptoim1r4_2009= '', 
amas_2009= '',  
luopiskkoulk2010 = '',
luopisktunn2010 = '',
luopiskjarj2010 = '', 
luopiskmaak2010 = '', 
ammopiskkoulk2010 = '', 
ammopisktunn2010 = '',
ammopiskjarj2010 = '', 
ammopiskmaak2010 = '', 
amkopiskkoulk2010 = '', 
amkopisktunn2010 = '', 
amkopiskjarj2010 = '',
amkopiskmaak2010 = '', 
yoopiskkoulk2010 = '', 
yoopisktunn2010 = '' ,
yoopiskjarj2010 = '',
yoopiskmaak2010 = '',
monihaku2010 = '', 
ptoim1r4_2010 = '', 
amas_2010 = '', 
luopiskkoulk2011 = '',
luopisktunn2011 = '',
luopiskjarj2011 = '', 
luopiskmaak2011 = '', 
ammopiskkoulk2011 = '', 
ammopisktunn2011= '',
ammopiskjarj2011 = '', 
ammopiskmaak2011 = '', 
amkopiskkoulk2011 = '', 
amkopisktunn2011 = '', 
amkopiskjarj2011 = '',
amkopiskmaak2011 = '', 
yoopiskkoulk2011 = '', 
yoopisktunn2011 = '' ,
yoopiskjarj2011 = '',
yoopiskmaak2011 = '',
monihaku2011 = '', 
ptoim1r4_2011 = '', 
amas_2011 = '', 
luopiskkoulk2012 = '',
luopisktunn2012 = '',
luopiskjarj2012 = '', 
luopiskmaak2012 = '', 
ammopiskkoulk2012 = '', 
ammopisktunn2012= '',
ammopiskjarj2012 = '', 
ammopiskmaak2012 = '', 
amkopiskkoulk2012 = '', 
amkopisktunn2012 = '', 
amkopiskjarj2012 = '',
amkopiskmaak2012 = '', 
yoopiskkoulk2012 = '', 
yoopisktunn2012 = '' ,
yoopiskjarj2012 = '',
yoopiskmaak2012 = '',
monihaku2012 = '', 
ptoim1r4_2012 = '', 
amas_2012 = '', 
luopiskkoulk_2013,
(CASE WHEN [luopisktunn_2013] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2013] = '99999' THEN ''
      WHEN [luopisktunn_2013] = '00000' THEN ''
      ELSE [luopisktunn_2013] END) AS luopisktunn2013,
luopiskjarj_2013, 
(CASE WHEN [luopiskmaak_2013] = '99' THEN ''ELSE [luopiskmaak_2013] END) AS luopiskmaak2013, 
ammopiskkoulk_2013, 
(CASE WHEN [ammopisktunn_2013] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2013] = '99' THEN ''
      WHEN [ammopisktunn_2013] = '00000' THEN ''
      when [ammopisktunn_2013]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2013]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2013]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2013]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2013]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2013]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2013]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2013] = '90018' AND [tilv] = '2013' THEN ''
      ELSE [ammopisktunn_2013] END)AS ammopisktunn2013,
ammopiskjarj_2013, 
(CASE WHEN [ammopiskmaak_2013] = '99' THEN ''ELSE [ammopiskmaak_2013] END) as ammopiskmaak2013, 
amkopiskkoulk_2013, 
(CASE WHEN [amkopisktunn_2013] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2013] = '99999' THEN '' 
      WHEN [amkopisktunn_2013] = '00000' THEN ''ELSE [amkopisktunn_2013] END) AS amkopisktunn2013,
amkopiskjarj_2013,
(CASE WHEN [amkopiskmaak_2013] = '99' THEN '' ELSE [amkopiskmaak_2013] END) AS amkopiskmaak2013, 
yoopiskkoulk_2013, 
(CASE WHEN [yoopisktunn_2013] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2013] = '99999' THEN ''
      WHEN [yoopisktunn_2013] = '00000' THEN '' ELSE [yoopisktunn_2013] END) AS yoopisktunn2013,
yoopiskjarj_2013,
(CASE WHEN [yoopiskmaak_2013] = '99' THEN '' ELSE [yoopiskmaak_2013] END) AS yoopiskmaak2013,
(CASE WHEN [monihaku_2013] is NULL THEN '' ELSE [monihaku_2013] END) as monihaku2013, 
(CASE WHEN [ptoim1r4_2013] is NULL THEN '' ELSE [ptoim1r4_2013] END) as ptoim1r4_2013, 
(CASE WHEN [amas_2013] is NULL THEN '' ELSE [amas_2013] END) as amas_2013,  
luopiskkoulk_2014,
(CASE WHEN [luopisktunn_2014] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2014] = '99999' THEN ''
      WHEN [luopisktunn_2014] = '00000' THEN ''
      ELSE [luopisktunn_2014] END) AS luopisktunn2014,
luopiskjarj_2014, 
(CASE WHEN [luopiskmaak_2014] = '99' THEN ''ELSE [luopiskmaak_2014] END) AS luopiskmaak2014, 
ammopiskkoulk_2014, 
(CASE WHEN [ammopisktunn_2014] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2014] = '99' THEN ''
      WHEN [ammopisktunn_2014] = '00000' THEN ''
      when [ammopisktunn_2014]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2014]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2014]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2014]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2014]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2014]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2014] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2014] END)AS ammopisktunn2014,
ammopiskjarj_2014, 
(CASE WHEN [ammopiskmaak_2014] = '99' THEN ''ELSE [ammopiskmaak_2014] END) as ammopiskmaak2014, 
amkopiskkoulk_2014, 
(CASE WHEN [amkopisktunn_2014] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2014] = '99999' THEN '' 
      WHEN [amkopisktunn_2014] = '00000' THEN ''ELSE [amkopisktunn_2014] END) AS amkopisktunn2014,
amkopiskjarj_2014,
(CASE WHEN [amkopiskmaak_2014] = '99' THEN '' ELSE [amkopiskmaak_2014] END) AS amkopiskmaak2014, 
yoopiskkoulk_2014, 
(CASE WHEN [yoopisktunn_2014] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2014] = '99999' THEN ''
      WHEN [yoopisktunn_2014] = '00000' THEN '' ELSE [yoopisktunn_2014] END) AS yoopisktunn2014,
yoopiskjarj_2014,
(CASE WHEN [yoopiskmaak_2014] = '99' THEN '' ELSE [yoopiskmaak_2014] END) AS yoopiskmaak2014,
(CASE WHEN [monihaku_2014] is NULL THEN '' ELSE [monihaku_2014] END) as monihaku2014, 
(CASE WHEN [ptoim1r4_2014] is NULL THEN '' ELSE [ptoim1r4_2014] END) as ptoim1r4_2014, 
(CASE WHEN [amas_2014] is NULL THEN '' ELSE [amas_2014] END) as amas_2014, 
luopiskkoulk2015 = '',
luopisktunn2015 = '',
luopiskjarj2015 = '', 
luopiskmaak2015 = '', 
ammopiskkoulk2015 = '', 
ammopisktunn2015 = '',
ammopiskjarj2015 = '', 
ammopiskmaak2015 = '', 
amkopiskkoulk2015 = '', 
amkopisktunn2015 = '',
amkopiskjarj2015 = '',
amkopiskmaak2015 = '', 
yoopiskkoulk2015 = '', 
yoopisktunn2015 = '',
yoopiskjarj2015 = '', 
yoopiskmaak2015 = '', 
monihaku2015 = '',
ptoim1r4_2015 = '', 
amas_2015 = '',
luopiskkoulk2016 = '',
luopisktunn2016 = '',
luopiskjarj2016 = '', 
luopiskmaak2016 = '', 
ammopiskkoulk2016 = '', 
ammopisktunn2016 = '',
ammopiskjarj2016 = '', 
ammopiskmaak2016 = '', 
amkopiskkoulk2016 = '', 
amkopisktunn2016 = '',
amkopiskjarj2016 = '',
amkopiskmaak2016 = '', 
yoopiskkoulk2016 = '', 
yoopisktunn2016 = '',
yoopiskjarj2016 = '', 
yoopiskmaak2016 = '', 
monihaku2016 = '',
ptoim1r4_2016 = '', 
amas_2016 = '',
lkm, 
pohjkoul,
 [tietolahde]='K3_12_sopv_16',
 [rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_16] 
where suorv = '2013' and (suorlk = '1' or suorlk= '2')

UNION ALL
 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
(CASE WHEN [tutkryh] is NULL THEN '' ELSE [tutkryh] END) as tutkryh,
(CASE WHEN [suorv] is NULL THEN '' ELSE [suorv] END) as suorv,
(CASE WHEN [suorlk] is NULL THEN '' ELSE [suorlk] END) as suorlk,
(CASE WHEN [sp] is NULL THEN '' ELSE [sp] END) as sp,
(CASE WHEN [syntv]='19XX' THEN '' 
 WHEN [syntv] is NULL THEN '' ELSE [syntv] END) as syntv,
aikielir1,
(CASE WHEN [tutkaskun]='427' THEN ''
 WHEN [tutkaskun]= '946' and (tilv= '2009' or tilv='2010') then '945'
      WHEN [tutkaskun]= '198' THEN ''
	  WHEN [tutkaskun]='999' THEN '' ELSE [tutkaskun] END) as tutkaskun,
	  (CASE WHEN [kansalr1] is NULL THEN '' ELSE [kansalr1] END) as kansalr1,
  (CASE WHEN [pohjmaa] is NULL THEN '' ELSE [pohjmaa] END) as pohjmaa,
(CASE WHEN [eumaa] is NULL THEN '' ELSE [eumaa] END) as eumaa,
(CASE WHEN [etamaa] is NULL THEN '' ELSE [etamaa] END) as etamaa,
(CASE WHEN [tunn] = 'BBBBB' THEN ''
      WHEN [tunn] = '99999' THEN ''
      WHEN [tunn] = '00000' THEN '' 
      when [tunn] = '90009' AND [tilv] = '2009' THEN ''
      when [tunn] = '90015' AND [tilv] = '2009' THEN ''
      when [tunn] = '90010' AND [tilv] = '2009' THEN ''
      when [tunn] = '90018' AND [tilv] = '2009' THEN ''
      when [tunn] = '90008' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2011' THEN ''
      when [tunn] = '90018' AND [tilv] = '2011' THEN ''
      when [tunn] = '90006' AND [tilv] = '2009' THEN ''
      when [tunn] = '90006' AND [tilv] = '2010' THEN ''
      when [tunn] = '90006' AND [tilv] = '2011' THEN ''
        when [tunn] = '90018' AND [tilv] = '2012' THEN ''
		when [tunn] is NULL then ''
      ELSE [tunn] END) AS tunn,
(case when jarj= '' then '' 
       when jarj is NULL then '' else jarj end ),
kkielir1,
 (case when tutklaja= '' then '' 
       when tutklaja is NULL then '' else tutklaja end ),
 (case when tutktav= '' then '' 
       when tutktav is NULL then '' else tutktav end ),
(case when aikoul= '' then '' 
       when aikoul is NULL then '' else aikoul end ),
(CASE WHEN [tutkmaak] = '99' THEN '' ELSE [tutkmaak] END) as tutkmaak,  
luopiskkoulk2008 = '', 
luopisktunn2008 = '',
luopiskjarj2008= '',
luopiskmaak2008= '',
ammopiskkoulk2008= '', 
ammopisktunn2008= '',
ammopiskjarj2008 = '',
ammopiskmaak2008= '', 
amkopiskkoulk2008= '', 
amkopisktunn2008= '',
amkopiskjarj2008= '', 
amkopiskmaak2008= '',
yoopiskkoulk2008= '',
yoopisktunn2008= '',
yoopiskjarj2008= '', 
yoopiskmaak2008= '',
monihaku2008= '', 
ptoim1r4_2008= '', 
amas_2008= '', 
luopiskkoulk2009 = '', 
luopisktunn2009 = '',
luopiskjarj2009= '',
luopiskmaak2009= '',
ammopiskkoulk2009= '', 
ammopisktunn2009= '',
ammopiskjarj2009 = '',
ammopiskmaak2009= '', 
amkopiskkoulk2009= '', 
amkopisktunn2009= '',
amkopiskjarj2009= '', 
amkopiskmaak2009= '',
yoopiskkoulk2009= '',
yoopisktunn2009= '',
yoopiskjarj2009= '', 
yoopiskmaak2009= '',
monihaku2009= '', 
ptoim1r4_2009= '', 
amas_2009= '',  
luopiskkoulk2010 = '',
luopisktunn2010 = '',
luopiskjarj2010 = '', 
luopiskmaak2010 = '', 
ammopiskkoulk2010 = '', 
ammopisktunn2010 = '',
ammopiskjarj2010 = '', 
ammopiskmaak2010 = '', 
amkopiskkoulk2010 = '', 
amkopisktunn2010 = '', 
amkopiskjarj2010 = '',
amkopiskmaak2010 = '', 
yoopiskkoulk2010 = '', 
yoopisktunn2010 = '' ,
yoopiskjarj2010 = '',
yoopiskmaak2010 = '',
monihaku2010 = '', 
ptoim1r4_2010 = '', 
amas_2010 = '', 
luopiskkoulk2011 = '',
luopisktunn2011 = '',
luopiskjarj2011 = '', 
luopiskmaak2011 = '', 
ammopiskkoulk2011 = '', 
ammopisktunn2011= '',
ammopiskjarj2011 = '', 
ammopiskmaak2011 = '', 
amkopiskkoulk2011 = '', 
amkopisktunn2011 = '', 
amkopiskjarj2011 = '',
amkopiskmaak2011 = '', 
yoopiskkoulk2011 = '', 
yoopisktunn2011 = '' ,
yoopiskjarj2011 = '',
yoopiskmaak2011 = '',
monihaku2011 = '', 
ptoim1r4_2011 = '', 
amas_2011 = '', 
luopiskkoulk2012 = '',
luopisktunn2012 = '',
luopiskjarj2012 = '', 
luopiskmaak2012 = '', 
ammopiskkoulk2012 = '', 
ammopisktunn2012= '',
ammopiskjarj2012 = '', 
ammopiskmaak2012 = '', 
amkopiskkoulk2012 = '', 
amkopisktunn2012 = '', 
amkopiskjarj2012 = '',
amkopiskmaak2012 = '', 
yoopiskkoulk2012 = '', 
yoopisktunn2012 = '' ,
yoopiskjarj2012 = '',
yoopiskmaak2012 = '',
monihaku2012 = '', 
ptoim1r4_2012 = '', 
amas_2012 = '', 
luopiskkoulk2013 = '',
luopisktunn2013 = '',
luopiskjarj2013 = '', 
luopiskmaak2013 = '', 
ammopiskkoulk2013 = '', 
ammopisktunn2013 = '',
ammopiskjarj2013 = '', 
ammopiskmaak2013 = '', 
amkopiskkoulk2013 = '', 
amkopisktunn2013 = '',
amkopiskjarj2013 = '',
amkopiskmaak2013 = '', 
yoopiskkoulk2013 = '', 
yoopisktunn2013 = '',
yoopiskjarj2013 = '', 
yoopiskmaak2013 = '', 
monihaku2013 = '',
ptoim1r4_2013 = '', 
amas_2013 = '',
luopiskkoulk_2014,
(CASE WHEN [luopisktunn_2014] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2014] = '99999' THEN ''
      WHEN [luopisktunn_2014] = '00000' THEN ''
      ELSE [luopisktunn_2014] END) AS luopisktunn2014,
luopiskjarj_2014, 
(CASE WHEN [luopiskmaak_2014] = '99' THEN ''ELSE [luopiskmaak_2014] END) AS luopiskmaak2014, 
ammopiskkoulk_2014, 
(CASE WHEN [ammopisktunn_2014] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2014] = '99' THEN ''
      WHEN [ammopisktunn_2014] = '00000' THEN ''
      when [ammopisktunn_2014]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2014]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2014]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2014]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2014]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2014]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2014]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2014] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2014] END)AS ammopisktunn2014,
ammopiskjarj_2014, 
(CASE WHEN [ammopiskmaak_2014] = '99' THEN ''ELSE [ammopiskmaak_2014] END) as ammopiskmaak2014, 
amkopiskkoulk_2014, 
(CASE WHEN [amkopisktunn_2014] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2014] = '99999' THEN '' 
      WHEN [amkopisktunn_2014] = '00000' THEN ''ELSE [amkopisktunn_2014] END) AS amkopisktunn2014,
amkopiskjarj_2014,
(CASE WHEN [amkopiskmaak_2014] = '99' THEN '' ELSE [amkopiskmaak_2014] END) AS amkopiskmaak2014, 
yoopiskkoulk_2014, 
(CASE WHEN [yoopisktunn_2014] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2014] = '99999' THEN ''
      WHEN [yoopisktunn_2014] = '00000' THEN '' ELSE [yoopisktunn_2014] END) AS yoopisktunn2014,
yoopiskjarj_2014,
(CASE WHEN [yoopiskmaak_2014] = '99' THEN '' ELSE [yoopiskmaak_2014] END) AS yoopiskmaak2014,
(CASE WHEN [monihaku_2014] is NULL THEN '' ELSE [monihaku_2014] END) as monihaku2014, 
(CASE WHEN [ptoim1r4_2014] is NULL THEN '' ELSE [ptoim1r4_2014] END) as ptoim1r4_2014, 
(CASE WHEN [amas_2014] is NULL THEN '' ELSE [amas_2014] END) as amas_2014,  
luopiskkoulk_2015,
(CASE WHEN [luopisktunn_2015] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2015] = '99999' THEN ''
      WHEN [luopisktunn_2015] = '00000' THEN ''
      ELSE [luopisktunn_2015] END) AS luopisktunn2015,
luopiskjarj_2015, 
(CASE WHEN [luopiskmaak_2015] = '99' THEN ''ELSE [luopiskmaak_2015] END) AS luopiskmaak2015, 
ammopiskkoulk_2015, 
(CASE WHEN [ammopisktunn_2015] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2015] = '99' THEN ''
      WHEN [ammopisktunn_2015] = '00000' THEN ''
      when [ammopisktunn_2015]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2015]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2015]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2015]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2015]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2015]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2015] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2015] END)AS ammopisktunn2015,
ammopiskjarj_2015, 
(CASE WHEN [ammopiskmaak_2015] = '99' THEN ''ELSE [ammopiskmaak_2015] END) as ammopiskmaak2015, 
amkopiskkoulk_2015, 
(CASE WHEN [amkopisktunn_2015] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2015] = '99999' THEN '' 
      WHEN [amkopisktunn_2015] = '00000' THEN ''ELSE [amkopisktunn_2015] END) AS amkopisktunn2015,
amkopiskjarj_2015,
(CASE WHEN [amkopiskmaak_2015] = '99' THEN '' ELSE [amkopiskmaak_2015] END) AS amkopiskmaak2015, 
yoopiskkoulk_2015, 
(CASE WHEN [yoopisktunn_2015] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2015] = '99999' THEN ''
      WHEN [yoopisktunn_2015] = '00000' THEN '' ELSE [yoopisktunn_2015] END) AS yoopisktunn2015,
yoopiskjarj_2015,
(CASE WHEN [yoopiskmaak_2015] = '99' THEN '' ELSE [yoopiskmaak_2015] END) AS yoopiskmaak2015,
(CASE WHEN [monihaku_2015] is NULL THEN '' ELSE [monihaku_2015] END) as monihaku2015, 
(CASE WHEN [ptoim1r4_2015] is NULL THEN '' ELSE [ptoim1r4_2015] END) as ptoim1r4_2015, 
(CASE WHEN [amas_2015] is NULL THEN '' ELSE [amas_2015] END) as amas_2015, 
luopiskkoulk2016 = '',
luopisktunn2016 = '',
luopiskjarj2016 = '', 
luopiskmaak2016 = '', 
ammopiskkoulk2016 = '', 
ammopisktunn2016 = '',
ammopiskjarj2016 = '', 
ammopiskmaak2016 = '', 
amkopiskkoulk2016 = '', 
amkopisktunn2016 = '',
amkopiskjarj2016 = '',
amkopiskmaak2016 = '', 
yoopiskkoulk2016 = '', 
yoopisktunn2016 = '',
yoopiskjarj2016 = '', 
yoopiskmaak2016 = '', 
monihaku2016 = '',
ptoim1r4_2016 = '', 
amas_2016 = '',
lkm, 
pohjkoul,
 [tietolahde]='K3_12_sopv_17',
 [rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_17] 
where 
(
suorv = '2014 '
or suorv = (case WHEN NOT EXISTS (SELECT TOP 1 1 FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_18]) THEN  '2015' ELSE '2014' END)
)
and (suorlk = '1' or suorlk= '2')

UNION ALL
 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
(CASE WHEN [tutkryh] is NULL THEN '' ELSE [tutkryh] END) as tutkryh,
(CASE WHEN [suorv] is NULL THEN '' ELSE [suorv] END) as suorv,
(CASE WHEN [suorlk] is NULL THEN '' ELSE [suorlk] END) as suorlk,
(CASE WHEN [sp] is NULL THEN '' ELSE [sp] END) as sp,
(CASE WHEN [syntv]='19XX' THEN '' 
 WHEN [syntv] is NULL THEN '' ELSE [syntv] END) as syntv,
aikielir1,
(CASE WHEN [tutkaskun]='427' THEN ''
 WHEN [tutkaskun]= '946' and (tilv= '2009' or tilv='2010') then '945'
      WHEN [tutkaskun]= '198' THEN ''
	  WHEN [tutkaskun]='999' THEN '' ELSE [tutkaskun] END) as tutkaskun,
	  (CASE WHEN [kansalr1] is NULL THEN '' ELSE [kansalr1] END) as kansalr1,
  (CASE WHEN [pohjmaa] is NULL THEN '' ELSE [pohjmaa] END) as pohjmaa,
(CASE WHEN [eumaa] is NULL THEN '' ELSE [eumaa] END) as eumaa,
(CASE WHEN [etamaa] is NULL THEN '' ELSE [etamaa] END) as etamaa,
(CASE WHEN [tunn] = 'BBBBB' THEN ''
      WHEN [tunn] = '99999' THEN ''
      WHEN [tunn] = '00000' THEN '' 
      when [tunn] = '90009' AND [tilv] = '2009' THEN ''
      when [tunn] = '90015' AND [tilv] = '2009' THEN ''
      when [tunn] = '90010' AND [tilv] = '2009' THEN ''
      when [tunn] = '90018' AND [tilv] = '2009' THEN ''
      when [tunn] = '90008' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2010' THEN ''
      when [tunn] = '90032' AND [tilv] = '2011' THEN ''
      when [tunn] = '90018' AND [tilv] = '2011' THEN ''
      when [tunn] = '90006' AND [tilv] = '2009' THEN ''
      when [tunn] = '90006' AND [tilv] = '2010' THEN ''
      when [tunn] = '90006' AND [tilv] = '2011' THEN ''
        when [tunn] = '90018' AND [tilv] = '2012' THEN ''
		when [tunn] is NULL then ''
      ELSE [tunn] END) AS tunn,
(case when jarj= '' then '' 
       when jarj is NULL then '' else jarj end ),
kkielir1,
 (case when tutklaja= '' then '' 
       when tutklaja is NULL then '' else tutklaja end ),
 (case when tutktav= '' then '' 
       when tutktav is NULL then '' else tutktav end ),
(case when aikoul= '' then '' 
       when aikoul is NULL then '' else aikoul end ),
(CASE WHEN [tutkmaak] = '99' THEN '' ELSE [tutkmaak] END) as tutkmaak,  
luopiskkoulk2008 = '', 
luopisktunn2008 = '',
luopiskjarj2008= '',
luopiskmaak2008= '',
ammopiskkoulk2008= '', 
ammopisktunn2008= '',
ammopiskjarj2008 = '',
ammopiskmaak2008= '', 
amkopiskkoulk2008= '', 
amkopisktunn2008= '',
amkopiskjarj2008= '', 
amkopiskmaak2008= '',
yoopiskkoulk2008= '',
yoopisktunn2008= '',
yoopiskjarj2008= '', 
yoopiskmaak2008= '',
monihaku2008= '', 
ptoim1r4_2008= '', 
amas_2008= '', 
luopiskkoulk2009 = '', 
luopisktunn2009 = '',
luopiskjarj2009= '',
luopiskmaak2009= '',
ammopiskkoulk2009= '', 
ammopisktunn2009= '',
ammopiskjarj2009 = '',
ammopiskmaak2009= '', 
amkopiskkoulk2009= '', 
amkopisktunn2009= '',
amkopiskjarj2009= '', 
amkopiskmaak2009= '',
yoopiskkoulk2009= '',
yoopisktunn2009= '',
yoopiskjarj2009= '', 
yoopiskmaak2009= '',
monihaku2009= '', 
ptoim1r4_2009= '', 
amas_2009= '',  
luopiskkoulk2010 = '',
luopisktunn2010 = '',
luopiskjarj2010 = '', 
luopiskmaak2010 = '', 
ammopiskkoulk2010 = '', 
ammopisktunn2010 = '',
ammopiskjarj2010 = '', 
ammopiskmaak2010 = '', 
amkopiskkoulk2010 = '', 
amkopisktunn2010 = '', 
amkopiskjarj2010 = '',
amkopiskmaak2010 = '', 
yoopiskkoulk2010 = '', 
yoopisktunn2010 = '' ,
yoopiskjarj2010 = '',
yoopiskmaak2010 = '',
monihaku2010 = '', 
ptoim1r4_2010 = '', 
amas_2010 = '', 
luopiskkoulk2011 = '',
luopisktunn2011 = '',
luopiskjarj2011 = '', 
luopiskmaak2011 = '', 
ammopiskkoulk2011 = '', 
ammopisktunn2011= '',
ammopiskjarj2011 = '', 
ammopiskmaak2011 = '', 
amkopiskkoulk2011 = '', 
amkopisktunn2011 = '', 
amkopiskjarj2011 = '',
amkopiskmaak2011 = '', 
yoopiskkoulk2011 = '', 
yoopisktunn2011 = '' ,
yoopiskjarj2011 = '',
yoopiskmaak2011 = '',
monihaku2011 = '', 
ptoim1r4_2011 = '', 
amas_2011 = '', 
luopiskkoulk2012 = '',
luopisktunn2012 = '',
luopiskjarj2012 = '', 
luopiskmaak2012 = '', 
ammopiskkoulk2012 = '', 
ammopisktunn2012= '',
ammopiskjarj2012 = '', 
ammopiskmaak2012 = '', 
amkopiskkoulk2012 = '', 
amkopisktunn2012 = '', 
amkopiskjarj2012 = '',
amkopiskmaak2012 = '', 
yoopiskkoulk2012 = '', 
yoopisktunn2012 = '' ,
yoopiskjarj2012 = '',
yoopiskmaak2012 = '',
monihaku2012 = '', 
ptoim1r4_2012 = '', 
amas_2012 = '', 
luopiskkoulk2013 = '',
luopisktunn2013 = '',
luopiskjarj2013 = '', 
luopiskmaak2013 = '', 
ammopiskkoulk2013 = '', 
ammopisktunn2013 = '',
ammopiskjarj2013 = '', 
ammopiskmaak2013 = '', 
amkopiskkoulk2013 = '', 
amkopisktunn2013 = '',
amkopiskjarj2013 = '',
amkopiskmaak2013 = '', 
yoopiskkoulk2013 = '', 
yoopisktunn2013 = '',
yoopiskjarj2013 = '', 
yoopiskmaak2013 = '', 
monihaku2013 = '',
ptoim1r4_2013 = '', 
amas_2013 = '',
luopiskkoulk2014 = '',
luopisktunn2014 = '',
luopiskjarj2014 = '', 
luopiskmaak2014 = '', 
ammopiskkoulk2014 = '', 
ammopisktunn2014 = '',
ammopiskjarj2014 = '', 
ammopiskmaak2014 = '', 
amkopiskkoulk2014 = '', 
amkopisktunn2014 = '',
amkopiskjarj2014 = '',
amkopiskmaak2014 = '', 
yoopiskkoulk2014 = '', 
yoopisktunn2014 = '',
yoopiskjarj2014 = '', 
yoopiskmaak2014 = '', 
monihaku2014 = '',
ptoim1r4_2014 = '', 
amas_2014 = '',
luopiskkoulk_2015,
(CASE WHEN [luopisktunn_2015] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2015] = '99999' THEN ''
      WHEN [luopisktunn_2015] = '00000' THEN ''
      ELSE [luopisktunn_2015] END) AS luopisktunn2015,
luopiskjarj_2015, 
(CASE WHEN [luopiskmaak_2015] = '99' THEN ''ELSE [luopiskmaak_2015] END) AS luopiskmaak2015, 
ammopiskkoulk_2015, 
(CASE WHEN [ammopisktunn_2015] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2015] = '99' THEN ''
      WHEN [ammopisktunn_2015] = '00000' THEN ''
      when [ammopisktunn_2015]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2015]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2015]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2015]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2015]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2015]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2015]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2015] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2015] END)AS ammopisktunn2015,
ammopiskjarj_2015, 
(CASE WHEN [ammopiskmaak_2015] = '99' THEN ''ELSE [ammopiskmaak_2015] END) as ammopiskmaak2015, 
amkopiskkoulk_2015, 
(CASE WHEN [amkopisktunn_2015] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2015] = '99999' THEN '' 
      WHEN [amkopisktunn_2015] = '00000' THEN ''ELSE [amkopisktunn_2015] END) AS amkopisktunn2015,
amkopiskjarj_2015,
(CASE WHEN [amkopiskmaak_2015] = '99' THEN '' ELSE [amkopiskmaak_2015] END) AS amkopiskmaak2015, 
yoopiskkoulk_2015, 
(CASE WHEN [yoopisktunn_2015] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2015] = '99999' THEN ''
      WHEN [yoopisktunn_2015] = '00000' THEN '' ELSE [yoopisktunn_2015] END) AS yoopisktunn2015,
yoopiskjarj_2015,
(CASE WHEN [yoopiskmaak_2015] = '99' THEN '' ELSE [yoopiskmaak_2015] END) AS yoopiskmaak2015,
(CASE WHEN [monihaku_2015] is NULL THEN '' ELSE [monihaku_2015] END) as monihaku2015, 
(CASE WHEN [ptoim1r4_2015] is NULL THEN '' ELSE [ptoim1r4_2015] END) as ptoim1r4_2015, 
(CASE WHEN [amas_2015] is NULL THEN '' ELSE [amas_2015] END) as amas_2015,  
luopiskkoulk_2016,
(CASE WHEN [luopisktunn_2016] = 'BBBBB' THEN ''
      WHEN [luopisktunn_2016] = '99999' THEN ''
      WHEN [luopisktunn_2016] = '00000' THEN ''
      ELSE [luopisktunn_2016] END) AS luopisktunn2016,
luopiskjarj_2016, 
(CASE WHEN [luopiskmaak_2016] = '99' THEN ''ELSE [luopiskmaak_2016] END) AS luopiskmaak2016, 
ammopiskkoulk_2016, 
(CASE WHEN [ammopisktunn_2016] = 'BBBBBB' THEN ''
      WHEN [ammopisktunn_2016] = '99' THEN ''
      WHEN [ammopisktunn_2016] = '00000' THEN ''
      when [ammopisktunn_2016]   = '90009' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2016]  = '90015' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2016]  = '90010' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2016]  = '90018' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2016]  = '90008' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2016]  = '90032' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2016]  = '90032' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2016]  = '90018' AND [tilv] = '2011' THEN ''
      when [ammopisktunn_2016]  = '90006' AND [tilv] = '2009' THEN ''
      when [ammopisktunn_2016]  = '90006' AND [tilv] = '2010' THEN ''
      when [ammopisktunn_2016]  = '90006' AND [tilv] = '2011' THEN ''
        when [ammopisktunn_2016] = '90018' AND [tilv] = '2012' THEN ''
      ELSE [ammopisktunn_2016] END)AS ammopisktunn2016,
ammopiskjarj_2016, 
(CASE WHEN [ammopiskmaak_2016] = '99' THEN ''ELSE [ammopiskmaak_2016] END) as ammopiskmaak2016, 
amkopiskkoulk_2016, 
(CASE WHEN [amkopisktunn_2016] = 'BBBBB' THEN ''
      WHEN [amkopisktunn_2016] = '99999' THEN '' 
      WHEN [amkopisktunn_2016] = '00000' THEN ''ELSE [amkopisktunn_2016] END) AS amkopisktunn2016,
amkopiskjarj_2016,
(CASE WHEN [amkopiskmaak_2016] = '99' THEN '' ELSE [amkopiskmaak_2016] END) AS amkopiskmaak2016, 
yoopiskkoulk_2016, 
(CASE WHEN [yoopisktunn_2016] = 'BBBBB' THEN ''
      WHEN [yoopisktunn_2016] = '99999' THEN ''
      WHEN [yoopisktunn_2016] = '00000' THEN '' ELSE [yoopisktunn_2016] END) AS yoopisktunn2016,
yoopiskjarj_2016,
(CASE WHEN [yoopiskmaak_2016] = '99' THEN '' ELSE [yoopiskmaak_2016] END) AS yoopiskmaak2016,
(CASE WHEN [monihaku_2016] is NULL THEN '' ELSE [monihaku_2016] END) as monihaku2016, 
(CASE WHEN [ptoim1r4_2016] is NULL THEN '' ELSE [ptoim1r4_2016] END) as ptoim1r4_2016, 
(CASE WHEN [amas_2016] is NULL THEN '' ELSE [amas_2016] END) as amas_2016, 
lkm, 
pohjkoul,
 [tietolahde]='K3_12_sopv_18',
 [rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_18] 
/* TÄMÄ EHTO PITÄÄ OTTAA MUKAAN SITTEN KUN TÄHÄN NÄKYMÄÄN LISÄTÄÄN -19 AINEISTO JA LISÄTÄ VASTAAVA EHTO MYÖS UUDELLE AINEISTOLLE
WHERE
(
suorv = '2015 '
or suorv = (case WHEN NOT EXISTS (SELECT TOP 1 1 FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_19]) THEN  '2016' ELSE '2015' END)
)
and (suorlk = '1' or suorlk= '2')
*/

 ) Aineistot


 
GO


USE [ANTERO]