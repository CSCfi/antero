USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_K3_13b_Perusk_paattaneet_amm_tutk_suorittaneet]    Script Date: 22.10.2024 9:29:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE OR ALTER VIEW [dbo].[v_K3_13b_Perusk_paattaneet_amm_tutk_suorittaneet] as
SELECT
	   [tilv]
	  ,[tilv_date]
	  ,(case when [tutkryh] is NULL then '' else [tutkryh] end ) as [tutkryh]
      ,(case when [suorv] is NULL then '' else [suorv] end ) as [suorv]
	  ,(case when [suorlk] is NULL then '' else [suorlk] end ) as [suorlk]
	  ,(case when [sp] is NULL then '' else [sp] end ) as [sp]
      ,(case 
			when [syntv] = '19XX' then ''
			when [syntv] is NULL then '' 
			else [syntv] 
		end) as [syntv]
	  ,(case when [aikielir1] is NULL then '' else [aikielir1] end ) as [aikielir1]
      ,(case 
			when [tutkaskun]='427' then ''
			when [tutkaskun]= '946' and (tilv= '2009' or tilv='2010') then '945'
			when [tutkaskun]= '198' then ''
			when [tutkaskun]= '168' then '' 
			when [tutkaskun]= '999' then ''
			when [tutkaskun] is NULL then '' 
			else [tutkaskun] 
		end) as [tutkaskun]
      ,(case when [kansalr1] is NULL then '' else [kansalr1] end ) as [kansalr1]
      ,(case when [pohjmaa] is NULL then '' else [pohjmaa] end ) as [pohjmaa]
      ,(case when [eumaa] is NULL then '' else [eumaa] end ) as [eumaa]
      ,(case when [etamaa] is NULL then '' else [etamaa] end ) as [etamaa]
      ,(case 
			when [tunn] = 'BBBBB' then ''
			when [tunn] = '99999' then ''
			when [tunn] = '00000' then '' 
			when [tunn] = '90009' AND [tilv] = '2009' then ''
			when [tunn] = '90015' AND [tilv] = '2009' then ''
			when [tunn] = '90010' AND [tilv] = '2009' then ''
			when [tunn] = '90018' AND [tilv] = '2009' then ''
			when [tunn] = '90008' AND [tilv] = '2010' then ''
			when [tunn] = '90032' AND [tilv] = '2010' then ''
			when [tunn] = '90032' AND [tilv] = '2011' then ''
			when [tunn] = '90018' AND [tilv] = '2011' then ''
			when [tunn] = '90006' AND [tilv] = '2009' then ''
			when [tunn] = '90006' AND [tilv] = '2010' then ''
			when [tunn] = '90006' AND [tilv] = '2011' then ''
			when [tunn] = '90010' AND [tilv] = '2010' then ''
			when [tunn] = '90010' AND [tilv] = '2011' then ''
			when [tunn] = '90008' AND [tilv] = '2011' then ''
			when [tunn] = '90018' AND [tilv] = '2010' then ''
			when [tunn] = '90018' AND [tilv] = '2011' then ''
			when [tunn] = '90018' AND [tilv] = '2012' then ''
			when [tunn] is NULL then '' 
			else [tunn] 
		end) as [tunn]
      ,(case when [jarj] is NULL then '' else [jarj] end ) as [jarj]
      ,(case when [kkielir1] is NULL then '' else [kkielir1] end ) as [kkielir1]
      ,(case when [tutklaja] is NULL then '' else [tutklaja] end ) as [tutklaja]
      ,(case when [tutktav] is NULL then '' else [tutktav] end ) as [tutktav]
      ,(case when [aikoul] is NULL then '' else [aikoul] end ) as [aikoul]
      ,(case 
			when [tutkmaak] = '99' then ''
			when [tutkmaak] is NULL then '' 
			else [tutkmaak] 
		end) as [tutkmaak]
	  ,(case when [luopiskkoulk_1] is NULL then '' else [luopiskkoulk_1] end ) as [luopiskkoulk_1]
	  ,(case 
			when [luopisktunn_1] = 'BBBBB' then ''
			when [luopisktunn_1] = '99999' then ''
			when [luopisktunn_1] is NULL then '' 
			else [luopisktunn_1] 
		end) as [luopisktunn_1]
	  ,(case when [luopiskjarj_1] is NULL then '' else [luopiskjarj_1] end ) as [luopiskjarj_1]
	  ,(case 
			when [luopiskmaak_1] = '99' then ''
			when [luopiskmaak_1] is NULL then '' 
			else [luopiskmaak_1] 
		end) as [luopiskmaak_1]
	  ,(case
			when [tutkryh] = '3' then '' --Ammatillista tutkintokoodia ei ennen sopv20 rajattu suoritusvuoden opiskelusta pois. / jsyrjala 4.9.2020
			when [ammopiskkoulk_1] is NULL then '' 
			else [ammopiskkoulk_1] 
		end ) as [ammopiskkoulk_1]
	  ,(case 
			when [tutkryh] = '3' then '' --Ammatillista tutkintokoodia ei ennen sopv20 rajattu suoritusvuoden opiskelusta pois. / jsyrjala 4.9.2020
			when [ammopisktunn_1] = 'BBBBB' then ''
			when [ammopisktunn_1] = '99999' then ''
			when [ammopisktunn_1] = '00000' then ''
			when [ammopisktunn_1] = '90009' AND [tilv] = '2009' then ''
			when [ammopisktunn_1] = '90015' AND [tilv] = '2009' then ''
			when [ammopisktunn_1] = '90010' AND [tilv] = '2009' then ''
			when [ammopisktunn_1] = '90018' AND [tilv] = '2009' then ''
			when [ammopisktunn_1] = '90008' AND [tilv] = '2010' then ''
			when [ammopisktunn_1] = '90032' AND [tilv] = '2010' then ''
			when [ammopisktunn_1] = '90032' AND [tilv] = '2011' then ''
			when [ammopisktunn_1] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_1] = '90006' AND [tilv] = '2009' then ''
			when [ammopisktunn_1] = '90006' AND [tilv] = '2010' then ''
			when [ammopisktunn_1] = '90006' AND [tilv] = '2011' then ''
			when [ammopisktunn_1] = '90010' AND [tilv] = '2010' then ''
			when [ammopisktunn_1] = '90010' AND [tilv] = '2011' then ''
			when [ammopisktunn_1] = '90008' AND [tilv] = '2011' then ''
			when [ammopisktunn_1] = '90018' AND [tilv] = '2010' then ''
			when [ammopisktunn_1] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_1] = '90018' AND [tilv] = '2012' then ''
			when [ammopisktunn_1] is NULL then '' 
			else [ammopisktunn_1] 
		end) as [ammopisktunn_1]
	  ,(case 
			when [tutkryh] = '3' then '' --Ammatillista tutkintokoodia ei ennen sopv20 rajattu suoritusvuoden opiskelusta pois. / jsyrjala 4.9.2020
			when [ammopiskjarj_1] is NULL then '' 
			else [ammopiskjarj_1] 
		end ) as [ammopiskjarj_1]
	  ,(case 
			when [tutkryh] = '3' then '' --Ammatillista tutkintokoodia ei ennen sopv20 rajattu suoritusvuoden opiskelusta pois. / jsyrjala 4.9.2020
			when [ammopiskmaak_1] = '99' then ''
			when [ammopiskmaak_1] is NULL then '' 
			else [ammopiskmaak_1] 
		end) as [ammopiskmaak_1]
	  ,(case when [amkopiskkoulk_1] is NULL then '' else [amkopiskkoulk_1] end ) as [amkopiskkoulk_1]
	  ,(case 
			when [amkopisktunn_1] = 'BBBBB' then ''
			when [amkopisktunn_1] = '99999' then ''
			when [amkopisktunn_1] is NULL then '' 
			else [amkopisktunn_1] 
		end) as [amkopisktunn_1]
	  ,(case when [amkopiskjarj_1] is NULL then '' else [amkopiskjarj_1] end ) as [amkopiskjarj_1]
	  ,(case 
			when [amkopiskmaak_1] = '99' then ''
			when [amkopiskmaak_1] is NULL then '' 
			else [amkopiskmaak_1] 
		end) as [amkopiskmaak_1]
      ,(case when [yoopiskkoulk_1] is NULL then '' else [yoopiskkoulk_1] end ) as [yoopiskkoulk_1]
	  ,(case 
			when [yoopisktunn_1] = 'BBBBB' then ''
			when [yoopisktunn_1] = '99999' then ''
			when [yoopisktunn_1] is NULL then '' 
			else [yoopisktunn_1] 
		end) as [yoopisktunn_1]
	  ,(case when [yoopiskjarj_1] is NULL then '' else [yoopiskjarj_1] end ) as [yoopiskjarj_1]
	  ,(case 
			when [yoopiskmaak_1] = '99' then ''
			when [yoopiskmaak_1] is NULL then '' 
			else [yoopiskmaak_1] 
		end) as [yoopiskmaak_1]
      ,coalesce(nullif([monihaku_1], ''), '90') as [monihaku_1]
	  ,(case when [ptoim1r4_1] is NULL then '' else [ptoim1r4_1] end ) as [ptoim1r4_1]
      ,(case when [amas_1] is NULL then '' else [amas_1] end ) as [amas_1]
	  ,(case when [opintotuki_ulkom_1] is NULL then '' else [opintotuki_ulkom_1] end ) as [opintotuki_ulkom_1]

      ,(case when [luopiskkoulk_2] is NULL then '' else [luopiskkoulk_2] end ) as [luopiskkoulk_2]
	  ,(case 
			when [luopisktunn_2] = 'BBBBB' then ''
			when [luopisktunn_2] = '99999' then ''
			when [luopisktunn_2] is NULL then '' 
			else [luopisktunn_2] 
		end) as [luopisktunn_2]
	  ,(case when [luopiskjarj_2] is NULL then '' else [luopiskjarj_2] end ) as [luopiskjarj_2]
      ,(case 
			when [luopiskmaak_2] = '99' then ''
			when [luopiskmaak_2] is NULL then '' 
			else [luopiskmaak_2] 
		end) as [luopiskmaak_2]
	  ,(case when [ammopiskkoulk_2] is NULL then '' else [ammopiskkoulk_2] end ) as [ammopiskkoulk_2]
	  ,(case 
			when [ammopisktunn_2] = 'BBBBB' then ''
			when [ammopisktunn_2] = '99999' then ''
			when [ammopisktunn_2] = '00000' then ''
			when [ammopisktunn_2] = '90009' AND [tilv] = '2009' then ''
			when [ammopisktunn_2] = '90015' AND [tilv] = '2009' then ''
			when [ammopisktunn_2] = '90010' AND [tilv] = '2009' then ''
			when [ammopisktunn_2] = '90018' AND [tilv] = '2009' then ''
			when [ammopisktunn_2] = '90008' AND [tilv] = '2010' then ''
			when [ammopisktunn_2] = '90032' AND [tilv] = '2010' then ''
			when [ammopisktunn_2] = '90032' AND [tilv] = '2011' then ''
			when [ammopisktunn_2] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_2] = '90006' AND [tilv] = '2009' then ''
			when [ammopisktunn_2] = '90006' AND [tilv] = '2010' then ''
			when [ammopisktunn_2] = '90006' AND [tilv] = '2011' then ''
			when [ammopisktunn_2] = '90010' AND [tilv] = '2010' then ''
			when [ammopisktunn_2] = '90010' AND [tilv] = '2011' then ''
			when [ammopisktunn_2] = '90008' AND [tilv] = '2011' then ''
			when [ammopisktunn_2] = '90018' AND [tilv] = '2010' then ''
			when [ammopisktunn_2] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_2] = '90018' AND [tilv] = '2012' then ''
			when [ammopisktunn_2] is NULL then '' 
			else [ammopisktunn_2] 
		end) as [ammopisktunn_2]
	  ,(case when [ammopiskjarj_2] is NULL then '' else [ammopiskjarj_2] end ) as [ammopiskjarj_2]
	  ,(case 
			when [ammopiskmaak_2] = '99' then ''
			when [ammopiskmaak_2] is NULL then '' 
			else [ammopiskmaak_2] 
		end) as [ammopiskmaak_2]
	  ,(case when [amkopiskkoulk_2] is NULL then '' else [amkopiskkoulk_2] end ) as [amkopiskkoulk_2]
	  ,(case 
			when [amkopisktunn_2] = 'BBBBB' then ''
			when [amkopisktunn_2] = '99999' then ''
			when [amkopisktunn_2] is NULL then '' 
			else [amkopisktunn_2] 
		end) as [amkopisktunn_2]
	  ,(case when [amkopiskjarj_2] is NULL then '' else [amkopiskjarj_2] end ) as [amkopiskjarj_2]
	  ,(case 
			when [amkopiskmaak_2] = '99' then ''
			when [amkopiskmaak_2] is NULL then '' 
			else [amkopiskmaak_2] 
		end) as [amkopiskmaak_2]
      ,(case when [yoopiskkoulk_2] is NULL then '' else [yoopiskkoulk_2] end ) as [yoopiskkoulk_2]
	  ,(case 
			when [yoopisktunn_2] = 'BBBBB' then ''
			when [yoopisktunn_2] = '99999' then ''
			when [yoopisktunn_2] is NULL then '' 
			else [yoopisktunn_2] 
		end) as [yoopisktunn_2]
	  ,(case when [yoopiskjarj_2] is NULL then '' else [yoopiskjarj_2] end ) as [yoopiskjarj_2]
	  ,(case 
			when [yoopiskmaak_2] = '99' then ''
			when [yoopiskmaak_2] is NULL then '' 
			else [yoopiskmaak_2] 
		end) as [yoopiskmaak_2]
      ,coalesce(nullif([monihaku_2], ''), '90') as [monihaku_2]
	  ,(case when [ptoim1r4_2] is NULL then '' else [ptoim1r4_2] end ) as [ptoim1r4_2]
      ,(case when [amas_2] is NULL then '' else [amas_2] end ) as [amas_2]
	  ,(case when [opintotuki_ulkom_2] is NULL then '' else [opintotuki_ulkom_2] end ) as [opintotuki_ulkom_2]

      ,(case when [luopiskkoulk_3] is NULL then '' else [luopiskkoulk_3] end ) as [luopiskkoulk_3]
	  ,(case 
			when [luopisktunn_3] = 'BBBBB' then ''
			when [luopisktunn_3] = '99999' then ''
			when [luopisktunn_3] is NULL then '' 
			else [luopisktunn_3] 
		end) as [luopisktunn_3]
	  ,(case when [luopiskjarj_3] is NULL then '' else [luopiskjarj_3] end ) as [luopiskjarj_3]
	  ,(case 
			when [luopiskmaak_3] = '99' then ''
			when [luopiskmaak_3] is NULL then '' 
			else [luopiskmaak_3] 
		end) as [luopiskmaak_3]
	  ,(case when [ammopiskkoulk_3] is NULL then '' else [ammopiskkoulk_3] end ) as [ammopiskkoulk_3]
	  ,(case 
			when [ammopisktunn_3] = 'BBBBB' then ''
			when [ammopisktunn_3] = '99999' then ''
			when [ammopisktunn_3] = '00000' then ''
			when [ammopisktunn_3] = '90009' AND [tilv] = '2009' then ''
			when [ammopisktunn_3] = '90015' AND [tilv] = '2009' then ''
			when [ammopisktunn_3] = '90010' AND [tilv] = '2009' then ''
			when [ammopisktunn_3] = '90018' AND [tilv] = '2009' then ''
			when [ammopisktunn_3] = '90008' AND [tilv] = '2010' then ''
			when [ammopisktunn_3] = '90032' AND [tilv] = '2010' then ''
			when [ammopisktunn_3] = '90032' AND [tilv] = '2011' then ''
			when [ammopisktunn_3] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_3] = '90006' AND [tilv] = '2009' then ''
			when [ammopisktunn_3] = '90006' AND [tilv] = '2010' then ''
			when [ammopisktunn_3] = '90006' AND [tilv] = '2011' then ''
			when [ammopisktunn_3] = '90010' AND [tilv] = '2010' then ''
			when [ammopisktunn_3] = '90010' AND [tilv] = '2011' then ''
			when [ammopisktunn_3] = '90008' AND [tilv] = '2011' then ''
			when [ammopisktunn_3] = '90018' AND [tilv] = '2010' then ''
			when [ammopisktunn_3] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_3] = '90018' AND [tilv] = '2012' then ''
			when [ammopisktunn_3] is NULL then '' 
			else [ammopisktunn_3] 
		end) as [ammopisktunn_3]
	  ,(case when [ammopiskjarj_3] is NULL then '' else [ammopiskjarj_3] end ) as [ammopiskjarj_3]
	  ,(case 
			when [ammopiskmaak_3] = '99' then ''
			when [ammopiskmaak_3] is NULL then '' 
			else [ammopiskmaak_3] 
		end) as [ammopiskmaak_3]
	  ,(case when [amkopiskkoulk_3] is NULL then '' else [amkopiskkoulk_3] end ) as [amkopiskkoulk_3]
	  ,(case 
			when [amkopisktunn_3] = 'BBBBB' then ''
			when [amkopisktunn_3] = '99999' then ''
			when [amkopisktunn_3] is NULL then '' 
			else [amkopisktunn_3] 
		end) as [amkopisktunn_3]
	  ,(case when [amkopiskjarj_3] is NULL then '' else [amkopiskjarj_3] end ) as [amkopiskjarj_3]
	  ,(case 
			when [amkopiskmaak_3] = '99' then ''
			when [amkopiskmaak_3] is NULL then '' 
			else [amkopiskmaak_3] 
		end) as [amkopiskmaak_3]
      ,(case when [yoopiskkoulk_3] is NULL then '' else [yoopiskkoulk_3] end ) as [yoopiskkoulk_3]
	  ,(case 
			when [yoopisktunn_3] = 'BBBBB' then ''
			when [yoopisktunn_3] = '99999' then ''
			when [yoopisktunn_3] is NULL then '' 
			else [yoopisktunn_3] 
		end) as [yoopisktunn_3]
	  ,(case when [yoopiskjarj_3] is NULL then '' else [yoopiskjarj_3] end ) as [yoopiskjarj_3]
	  ,(case 
			when [yoopiskmaak_3] = '99' then ''
			when [yoopiskmaak_3] is NULL then '' 
			else [yoopiskmaak_3] 
		end) as [yoopiskmaak_3]
      ,coalesce(nullif([monihaku_3], ''), '90') as [monihaku_3]
	  ,(case when [ptoim1r4_3] is NULL then '' else [ptoim1r4_3] end ) as [ptoim1r4_3]
      ,(case when [amas_3] is NULL then '' else [amas_3] end ) as [amas_3]
	  ,(case when [opintotuki_ulkom_3] is NULL then '' else [opintotuki_ulkom_3] end ) as [opintotuki_ulkom_3]

      ,(case when [luopiskkoulk_4] is NULL then '' else [luopiskkoulk_4] end ) as [luopiskkoulk_4]
	  ,(case 
			when [luopisktunn_4] = 'BBBBB' then ''
			when [luopisktunn_4] = '99999' then ''
			when [luopisktunn_4] is NULL then '' 
			else [luopisktunn_4] 
		end) as [luopisktunn_4]
	  ,(case when [luopiskjarj_4] is NULL then '' else [luopiskjarj_4] end ) as [luopiskjarj_4]
	  ,(case 
			when [luopiskmaak_4] = '99' then ''
			when [luopiskmaak_4] is NULL then '' 
			else [luopiskmaak_4] 
		end) as [luopiskmaak_4]
	  ,(case when [ammopiskkoulk_4] is NULL then '' else [ammopiskkoulk_4] end ) as [ammopiskkoulk_4]
	  ,(case 
			when [ammopisktunn_4] = 'BBBBB' then ''
			when [ammopisktunn_4] = '99999' then ''
			when [ammopisktunn_4] = '00000' then ''
			when [ammopisktunn_4] = '90009' AND [tilv] = '2009' then ''
			when [ammopisktunn_4] = '90015' AND [tilv] = '2009' then ''
			when [ammopisktunn_4] = '90010' AND [tilv] = '2009' then ''
			when [ammopisktunn_4] = '90018' AND [tilv] = '2009' then ''
			when [ammopisktunn_4] = '90008' AND [tilv] = '2010' then ''
			when [ammopisktunn_4] = '90032' AND [tilv] = '2010' then ''
			when [ammopisktunn_4] = '90032' AND [tilv] = '2011' then ''
			when [ammopisktunn_4] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_4] = '90006' AND [tilv] = '2009' then ''
			when [ammopisktunn_4] = '90006' AND [tilv] = '2010' then ''
			when [ammopisktunn_4] = '90006' AND [tilv] = '2011' then ''
			when [ammopisktunn_4] = '90010' AND [tilv] = '2010' then ''
			when [ammopisktunn_4] = '90010' AND [tilv] = '2011' then ''
			when [ammopisktunn_4] = '90008' AND [tilv] = '2011' then ''
			when [ammopisktunn_4] = '90018' AND [tilv] = '2010' then ''
			when [ammopisktunn_4] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_4] = '90018' AND [tilv] = '2012' then ''
			when [ammopisktunn_4] is NULL then '' 
			else [ammopisktunn_4] 
		end) as [ammopisktunn_4]
      ,(case when [ammopiskjarj_4] is NULL then '' else [ammopiskjarj_4] end ) as [ammopiskjarj_4]
	  ,(case 
			when [ammopiskmaak_4] = '99' then ''
			when [ammopiskmaak_4] is NULL then '' 
			else [ammopiskmaak_4] 
		end) as [ammopiskmaak_4]
	  ,(case when [amkopiskkoulk_4] is NULL then '' else [amkopiskkoulk_4] end ) as [amkopiskkoulk_4]
	  ,(case 
			when [amkopisktunn_4] = 'BBBBB' then ''
			when [amkopisktunn_4] = '99999' then ''
			when [amkopisktunn_4] is NULL then '' 
			else [amkopisktunn_4] 
		end) as [amkopisktunn_4]
	  ,(case when [amkopiskjarj_4] is NULL then '' else [amkopiskjarj_4] end ) as [amkopiskjarj_4]
	  ,(case 
			when [amkopiskmaak_4] = '99' then ''
			when [amkopiskmaak_4] is NULL then '' 
			else [amkopiskmaak_4] 
		end) as [amkopiskmaak_4]
      ,(case when [yoopiskkoulk_4] is NULL then '' else [yoopiskkoulk_4] end ) as [yoopiskkoulk_4]
	  ,(case 
			when [yoopisktunn_4] = 'BBBBB' then ''
			when [yoopisktunn_4] = '99999' then ''
			when [yoopisktunn_4] is NULL then '' 
			else [yoopisktunn_4] 
		end) as [yoopisktunn_4]
      ,(case when [yoopiskjarj_4] is NULL then '' else [yoopiskjarj_4] end ) as [yoopiskjarj_4]
	  ,(case 
			when [yoopiskmaak_4] = '99' then ''
			when [yoopiskmaak_4] is NULL then '' 
			else [yoopiskmaak_4] 
		end) as [yoopiskmaak_4]
      ,coalesce(nullif([monihaku_4], ''), '90') as [monihaku_4]
	  ,(case when [ptoim1r4_4] is NULL then '' else [ptoim1r4_4] end ) as [ptoim1r4_4]
      ,(case when [amas_4] is NULL then '' else [amas_4] end ) as [amas_4]
	  ,(case when [opintotuki_ulkom_4] is NULL then '' else [opintotuki_ulkom_4] end ) as [opintotuki_ulkom_4]

      ,(case when [luopiskkoulk_5] is NULL then '' else [luopiskkoulk_5] end ) as [luopiskkoulk_5]
	  ,(case 
			when [luopisktunn_5] = 'BBBBB' then ''
			when [luopisktunn_5] = '99999' then ''
			when [luopisktunn_5] is NULL then '' 
			else [luopisktunn_5] 
		end) as [luopisktunn_5]
	  ,(case when [luopiskjarj_5] is NULL then '' else [luopiskjarj_5] end ) as [luopiskjarj_5]
	  ,(case 
			when [luopiskmaak_5] = '99' then ''
			when [luopiskmaak_5] is NULL then '' 
			else [luopiskmaak_5] 
		end) as [luopiskmaak_5]
	  ,(case when [ammopiskkoulk_5] is NULL then '' else [ammopiskkoulk_5] end ) as [ammopiskkoulk_5]
	  ,(case 
			when [ammopisktunn_5] = 'BBBBB' then ''
			when [ammopisktunn_5] = '99999' then ''
			when [ammopisktunn_5] = '00000' then ''
			when [ammopisktunn_5] = '90009' AND [tilv] = '2009' then ''
			when [ammopisktunn_5] = '90015' AND [tilv] = '2009' then ''
			when [ammopisktunn_5] = '90010' AND [tilv] = '2009' then ''
			when [ammopisktunn_5] = '90018' AND [tilv] = '2009' then ''
			when [ammopisktunn_5] = '90008' AND [tilv] = '2010' then ''
			when [ammopisktunn_5] = '90032' AND [tilv] = '2010' then ''
			when [ammopisktunn_5] = '90032' AND [tilv] = '2011' then ''
			when [ammopisktunn_5] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_5] = '90006' AND [tilv] = '2009' then ''
			when [ammopisktunn_5] = '90006' AND [tilv] = '2010' then ''
			when [ammopisktunn_5] = '90006' AND [tilv] = '2011' then ''
			when [ammopisktunn_5] = '90010' AND [tilv] = '2010' then ''
			when [ammopisktunn_5] = '90010' AND [tilv] = '2011' then ''
			when [ammopisktunn_5] = '90008' AND [tilv] = '2011' then ''
			when [ammopisktunn_5] = '90018' AND [tilv] = '2010' then ''
			when [ammopisktunn_5] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_5] = '90018' AND [tilv] = '2012' then ''
			when [ammopisktunn_5] is NULL then '' 
			else [ammopisktunn_5] 
		end) as [ammopisktunn_5]
	  ,(case when [ammopiskjarj_5] is NULL then '' else [ammopiskjarj_5] end ) as [ammopiskjarj_5]
	  ,(case 
			when [ammopiskmaak_5] = '99' then ''
			when [ammopiskmaak_5] is NULL then '' 
			else [ammopiskmaak_5] 
		end) as [ammopiskmaak_5]
	  ,(case when [amkopiskkoulk_5] is NULL then '' else [amkopiskkoulk_5] end ) as [amkopiskkoulk_5]
	  ,(case 
			when [amkopisktunn_5] = 'BBBBB' then ''
			when [amkopisktunn_5] = '99999' then ''
			when [amkopisktunn_5] is NULL then '' 
			else [amkopisktunn_5] 
		end) as [amkopisktunn_5]
	  ,(case when [amkopiskjarj_5] is NULL then '' else [amkopiskjarj_5] end ) as [amkopiskjarj_5]
	  ,(case 
			when [amkopiskmaak_5] = '99' then ''
			when [amkopiskmaak_5] is NULL then '' 
			else [amkopiskmaak_5] 
		end) as [amkopiskmaak_5]
      ,(case when [yoopiskkoulk_5] is NULL then '' else [yoopiskkoulk_5] end ) as [yoopiskkoulk_5]
	  ,(case 
			when [yoopisktunn_5] = 'BBBBB' then ''
			when [yoopisktunn_5] = '99999' then ''
			when [yoopisktunn_5] is NULL then '' 
			else [yoopisktunn_5] 
		end) as [yoopisktunn_5]
	  ,(case when [yoopiskjarj_5] is NULL then '' else [yoopiskjarj_5] end ) as [yoopiskjarj_5]
	  ,(case 
			when [yoopiskmaak_5] = '99' then ''
			when [yoopiskmaak_5] is NULL then '' 
			else [yoopiskmaak_5] 
		end) as [yoopiskmaak_5]
      ,coalesce(nullif([monihaku_5], ''), '90') as [monihaku_5]
	  ,(case when [ptoim1r4_5] is NULL then '' else [ptoim1r4_5] end ) as [ptoim1r4_5]
      ,(case when [amas_5] is NULL then '' else [amas_5] end ) as [amas_5]
	  ,(case when [opintotuki_ulkom_5] is NULL then '' else [opintotuki_ulkom_5] end ) as [opintotuki_ulkom_5]

      ,(case when [luopiskkoulk_6] is NULL then '' else [luopiskkoulk_6] end ) as [luopiskkoulk_6]
	  ,(case 
			when [luopisktunn_6] = 'BBBBB' then ''
			when [luopisktunn_6] = '99999' then ''
			when [luopisktunn_6] is NULL then '' else [luopisktunn_6] end ) as [luopisktunn_6]
	  ,(case when [luopiskjarj_6] is NULL then '' else [luopiskjarj_6] end ) as [luopiskjarj_6]
	  ,(case 
			when [luopiskmaak_6] = '99' then ''
			when [luopiskmaak_6] is NULL then '' 
			else [luopiskmaak_6] 
		end) as [luopiskmaak_6]
	  ,(case when [ammopiskkoulk_6] is NULL then '' else [ammopiskkoulk_6] end ) as [ammopiskkoulk_6]
	  ,(case 
			when [ammopisktunn_6] = 'BBBBB' then ''
			when [ammopisktunn_6] = '99999' then ''
			when [ammopisktunn_6] = '00000' then ''
			when [ammopisktunn_6] = '90009' AND [tilv] = '2009' then ''
			when [ammopisktunn_6] = '90015' AND [tilv] = '2009' then ''
			when [ammopisktunn_6] = '90010' AND [tilv] = '2009' then ''
			when [ammopisktunn_6] = '90018' AND [tilv] = '2009' then ''
			when [ammopisktunn_6] = '90008' AND [tilv] = '2010' then ''
			when [ammopisktunn_6] = '90032' AND [tilv] = '2010' then ''
			when [ammopisktunn_6] = '90032' AND [tilv] = '2011' then ''
			when [ammopisktunn_6] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_6] = '90006' AND [tilv] = '2009' then ''
			when [ammopisktunn_6] = '90006' AND [tilv] = '2010' then ''
			when [ammopisktunn_6] = '90006' AND [tilv] = '2011' then ''
			when [ammopisktunn_6] = '90010' AND [tilv] = '2010' then ''
			when [ammopisktunn_6] = '90010' AND [tilv] = '2011' then ''
			when [ammopisktunn_6] = '90008' AND [tilv] = '2011' then ''
			when [ammopisktunn_6] = '90018' AND [tilv] = '2010' then ''
			when [ammopisktunn_6] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_6] = '90018' AND [tilv] = '2012' then ''
			when [ammopisktunn_6] is NULL then '' 
			else [ammopisktunn_6] 
		end) as [ammopisktunn_6]
	  ,(case when [ammopiskjarj_6] is NULL then '' else [ammopiskjarj_6] end ) as [ammopiskjarj_6]
	  ,(case 
			when [ammopiskmaak_6] = '99' then ''
			when [ammopiskmaak_6] is NULL then '' 
			else [ammopiskmaak_6] 
		end) as [ammopiskmaak_6]
	  ,(case when [amkopiskkoulk_6] is NULL then '' else [amkopiskkoulk_6] end ) as [amkopiskkoulk_6]
	  ,(case 
			when [amkopisktunn_6] = 'BBBBB' then ''
			when [amkopisktunn_6] = '99999' then ''
			when [amkopisktunn_6] is NULL then '' 
			else [amkopisktunn_6] 
		end) as [amkopisktunn_6]
	  ,(case when [amkopiskjarj_6] is NULL then '' else [amkopiskjarj_6] end ) as [amkopiskjarj_6]
	  ,(case 
			when [amkopiskmaak_6] = '99' then ''
			when [amkopiskmaak_6] is NULL then '' 
			else [amkopiskmaak_6] 
		end) as [amkopiskmaak_6]
      ,(case when [yoopiskkoulk_6] is NULL then '' else [yoopiskkoulk_6] end ) as [yoopiskkoulk_6]
	  ,(case 
			when [yoopisktunn_6] = 'BBBBB' then ''
			when [yoopisktunn_6] = '99999' then ''
			when [yoopisktunn_6] is NULL then '' 
			else [yoopisktunn_6] 
		end) as [yoopisktunn_6]
	  ,(case when [yoopiskjarj_6] is NULL then '' else [yoopiskjarj_6] end ) as [yoopiskjarj_6]
	  ,(case 
			when [yoopiskmaak_6] = '99' then ''
			when [yoopiskmaak_6] is NULL then '' 
			else [yoopiskmaak_6] 
		end) as [yoopiskmaak_6]
      ,coalesce(nullif([monihaku_6], ''), '90') as [monihaku_6]
	  ,(case when [ptoim1r4_6] is NULL then '' else [ptoim1r4_6] end ) as [ptoim1r4_6]
      ,(case when [amas_6] is NULL then '' else [amas_6] end ) as [amas_6]
	  ,(case when [opintotuki_ulkom_6] is NULL then '' else [opintotuki_ulkom_6] end ) as [opintotuki_ulkom_6]

	  ,(case when [luopiskkoulk_7] is NULL then '' else [luopiskkoulk_7] end ) as [luopiskkoulk_7]
	  ,(case 
			when [luopisktunn_7] = 'BBBBB' then ''
			when [luopisktunn_7] = '99999' then ''
			when [luopisktunn_7] is NULL then '' else [luopisktunn_7] end ) as [luopisktunn_7]
	  ,(case when [luopiskjarj_7] is NULL then '' else [luopiskjarj_7] end ) as [luopiskjarj_7]
	  ,(case 
			when [luopiskmaak_7] = '99' then ''
			when [luopiskmaak_7] is NULL then '' 
			else [luopiskmaak_7] 
		end) as [luopiskmaak_7]
	  ,(case when [ammopiskkoulk_7] is NULL then '' else [ammopiskkoulk_7] end ) as [ammopiskkoulk_7]
	  ,(case 
			when [ammopisktunn_7] = 'BBBBB' then ''
			when [ammopisktunn_7] = '99999' then ''
			when [ammopisktunn_7] = '00000' then ''
			when [ammopisktunn_7] = '90009' AND [tilv] = '2009' then ''
			when [ammopisktunn_7] = '90015' AND [tilv] = '2009' then ''
			when [ammopisktunn_7] = '90010' AND [tilv] = '2009' then ''
			when [ammopisktunn_7] = '90018' AND [tilv] = '2009' then ''
			when [ammopisktunn_7] = '90008' AND [tilv] = '2010' then ''
			when [ammopisktunn_7] = '90032' AND [tilv] = '2010' then ''
			when [ammopisktunn_7] = '90032' AND [tilv] = '2011' then ''
			when [ammopisktunn_7] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_7] = '90006' AND [tilv] = '2009' then ''
			when [ammopisktunn_7] = '90006' AND [tilv] = '2010' then ''
			when [ammopisktunn_7] = '90006' AND [tilv] = '2011' then ''
			when [ammopisktunn_7] = '90010' AND [tilv] = '2010' then ''
			when [ammopisktunn_7] = '90010' AND [tilv] = '2011' then ''
			when [ammopisktunn_7] = '90008' AND [tilv] = '2011' then ''
			when [ammopisktunn_7] = '90018' AND [tilv] = '2010' then ''
			when [ammopisktunn_7] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_7] = '90018' AND [tilv] = '2012' then ''
			when [ammopisktunn_7] is NULL then '' 
			else [ammopisktunn_7] 
		end) as [ammopisktunn_7]
	  ,(case when [ammopiskjarj_7] is NULL then '' else [ammopiskjarj_7] end ) as [ammopiskjarj_7]
	  ,(case 
			when [ammopiskmaak_7] = '99' then ''
			when [ammopiskmaak_7] is NULL then '' 
			else [ammopiskmaak_7] 
		end) as [ammopiskmaak_7]
	  ,(case when [amkopiskkoulk_7] is NULL then '' else [amkopiskkoulk_7] end ) as [amkopiskkoulk_7]
	  ,(case 
			when [amkopisktunn_7] = 'BBBBB' then ''
			when [amkopisktunn_7] = '99999' then ''
			when [amkopisktunn_7] is NULL then '' 
			else [amkopisktunn_7] 
		end) as [amkopisktunn_7]
	  ,(case when [amkopiskjarj_7] is NULL then '' else [amkopiskjarj_7] end ) as [amkopiskjarj_7]
	  ,(case 
			when [amkopiskmaak_7] = '99' then ''
			when [amkopiskmaak_7] is NULL then '' 
			else [amkopiskmaak_7] 
		end) as [amkopiskmaak_7]
      ,(case when [yoopiskkoulk_7] is NULL then '' else [yoopiskkoulk_7] end ) as [yoopiskkoulk_7]
	  ,(case 
			when [yoopisktunn_7] = 'BBBBB' then ''
			when [yoopisktunn_7] = '99999' then ''
			when [yoopisktunn_7] is NULL then '' 
			else [yoopisktunn_7] 
		end) as [yoopisktunn_7]
	  ,(case when [yoopiskjarj_7] is NULL then '' else [yoopiskjarj_7] end ) as [yoopiskjarj_7]
	  ,(case 
			when [yoopiskmaak_7] = '99' then ''
			when [yoopiskmaak_7] is NULL then '' 
			else [yoopiskmaak_7] 
		end) as [yoopiskmaak_7]
      ,coalesce(nullif([monihaku_7], ''), '90') as [monihaku_7]
	  ,(case when [ptoim1r4_7] is NULL then '' else [ptoim1r4_7] end ) as [ptoim1r4_7]
      ,(case when [amas_7] is NULL then '' else [amas_7] end ) as [amas_7]
	  ,(case when [opintotuki_ulkom_7] is NULL then '' else [opintotuki_ulkom_7] end ) as [opintotuki_ulkom_7]

	  ,(case when [luopiskkoulk_8] is NULL then '' else [luopiskkoulk_8] end ) as [luopiskkoulk_8]
	  ,(case 
			when [luopisktunn_8] = 'BBBBB' then ''
			when [luopisktunn_8] = '99999' then ''
			when [luopisktunn_8] is NULL then '' else [luopisktunn_8] end ) as [luopisktunn_8]
	  ,(case when [luopiskjarj_8] is NULL then '' else [luopiskjarj_8] end ) as [luopiskjarj_8]
	  ,(case 
			when [luopiskmaak_8] = '99' then ''
			when [luopiskmaak_8] is NULL then '' 
			else [luopiskmaak_8] 
		end) as [luopiskmaak_8]
	  ,(case when [ammopiskkoulk_8] is NULL then '' else [ammopiskkoulk_8] end ) as [ammopiskkoulk_8]
	  ,(case 
			when [ammopisktunn_8] = 'BBBBB' then ''
			when [ammopisktunn_8] = '99999' then ''
			when [ammopisktunn_8] = '00000' then ''
			when [ammopisktunn_8] = '90009' AND [tilv] = '2009' then ''
			when [ammopisktunn_8] = '90015' AND [tilv] = '2009' then ''
			when [ammopisktunn_8] = '90010' AND [tilv] = '2009' then ''
			when [ammopisktunn_8] = '90018' AND [tilv] = '2009' then ''
			when [ammopisktunn_8] = '90008' AND [tilv] = '2010' then ''
			when [ammopisktunn_8] = '90032' AND [tilv] = '2010' then ''
			when [ammopisktunn_8] = '90032' AND [tilv] = '2011' then ''
			when [ammopisktunn_8] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_8] = '90006' AND [tilv] = '2009' then ''
			when [ammopisktunn_8] = '90006' AND [tilv] = '2010' then ''
			when [ammopisktunn_8] = '90006' AND [tilv] = '2011' then ''
			when [ammopisktunn_8] = '90010' AND [tilv] = '2010' then ''
			when [ammopisktunn_8] = '90010' AND [tilv] = '2011' then ''
			when [ammopisktunn_8] = '90008' AND [tilv] = '2011' then ''
			when [ammopisktunn_8] = '90018' AND [tilv] = '2010' then ''
			when [ammopisktunn_8] = '90018' AND [tilv] = '2011' then ''
			when [ammopisktunn_8] = '90018' AND [tilv] = '2012' then ''
			when [ammopisktunn_8] is NULL then '' 
			else [ammopisktunn_8] 
		end) as [ammopisktunn_8]
	  ,(case when [ammopiskjarj_8] is NULL then '' else [ammopiskjarj_8] end ) as [ammopiskjarj_8]
	  ,(case 
			when [ammopiskmaak_8] = '99' then ''
			when [ammopiskmaak_8] is NULL then '' 
			else [ammopiskmaak_8] 
		end) as [ammopiskmaak_8]
	  ,(case when [amkopiskkoulk_8] is NULL then '' else [amkopiskkoulk_8] end ) as [amkopiskkoulk_8]
	  ,(case 
			when [amkopisktunn_8] = 'BBBBB' then ''
			when [amkopisktunn_8] = '99999' then ''
			when [amkopisktunn_8] is NULL then '' 
			else [amkopisktunn_8] 
		end) as [amkopisktunn_8]
	  ,(case when [amkopiskjarj_8] is NULL then '' else [amkopiskjarj_8] end ) as [amkopiskjarj_8]
	  ,(case 
			when [amkopiskmaak_8] = '99' then ''
			when [amkopiskmaak_8] is NULL then '' 
			else [amkopiskmaak_8] 
		end) as [amkopiskmaak_8]
      ,(case when [yoopiskkoulk_8] is NULL then '' else [yoopiskkoulk_8] end ) as [yoopiskkoulk_8]
	  ,(case 
			when [yoopisktunn_8] = 'BBBBB' then ''
			when [yoopisktunn_8] = '99999' then ''
			when [yoopisktunn_8] is NULL then '' 
			else [yoopisktunn_8] 
		end) as [yoopisktunn_8]
	  ,(case when [yoopiskjarj_8] is NULL then '' else [yoopiskjarj_8] end ) as [yoopiskjarj_8]
	  ,(case 
			when [yoopiskmaak_8] = '99' then ''
			when [yoopiskmaak_8] is NULL then '' 
			else [yoopiskmaak_8] 
		end) as [yoopiskmaak_8]
      ,coalesce(nullif([monihaku_8], ''), '90') as [monihaku_8]
	  ,(case when [ptoim1r4_8] is NULL then '' else [ptoim1r4_8] end ) as [ptoim1r4_8]
      ,(case when [amas_8] is NULL then '' else [amas_8] end ) as [amas_8]
	  ,(case when [opintotuki_ulkom_8] is NULL then '' else [opintotuki_ulkom_8] end ) as [opintotuki_ulkom_8]

	  ,[lkm]
	  ,(case when [pohjkoul] is NULL then '' else [pohjkoul] end ) as [pohjkoul]
	  ,[tietolahde]
	  ,[rivinumero]
FROM (

SELECT
       [tilv]
      ,cast(tilv + '0101' as date) as tilv_date
      ,[tutkryh]
      ,[suorv]
      ,[suorlk]
      ,[sp]
      ,[syntv]
      ,[aikielir1]
      ,[tutkaskun]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[tunn] 
      ,[jarj]
      ,[kkielir1]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2015] as luopiskkoulk_1
      ,[luopisktunn_2015] as luopisktunn_1
      ,[luopiskjarj_2015] as luopiskjarj_1
      ,[luopiskmaak_2015] as luopiskmaak_1
      ,[ammopiskkoulk_2015] as ammopiskkoulk_1
      ,[ammopisktunn_2015] as ammopisktunn_1
      ,[ammopiskjarj_2015] as ammopiskjarj_1
      ,[ammopiskmaak_2015] as ammopiskmaak_1
      ,[amkopiskkoulk_2015] as amkopiskkoulk_1
      ,[amkopisktunn_2015] as amkopisktunn_1
      ,[amkopiskjarj_2015] as amkopiskjarj_1
      ,[amkopiskmaak_2015] as amkopiskmaak_1
      ,[yoopiskkoulk_2015] as yoopiskkoulk_1
      ,[yoopisktunn_2015] as yoopisktunn_1
      ,[yoopiskjarj_2015] as yoopiskjarj_1
      ,[yoopiskmaak_2015] as yoopiskmaak_1
	  ,[opintotuki_ulkom_2015] as opintotuki_ulkom_1
      ,[monihaku_2015] as monihaku_1
      ,[ptoim1r4_2015] as [ptoim1r4_1]
      ,[amas_2015] as [amas_1]

      ,[luopiskkoulk_2016] as luopiskkoulk_2
      ,[luopisktunn_2016] as luopisktunn_2
      ,[luopiskjarj_2016] as luopiskjarj_2
      ,[luopiskmaak_2016] as luopiskmaak_2
      ,[ammopiskkoulk_2016] as ammopiskkoulk_2
      ,[ammopisktunn_2016] as ammopisktunn_2
      ,[ammopiskjarj_2016] as ammopiskjarj_2
      ,[ammopiskmaak_2016] as ammopiskmaak_2
      ,[amkopiskkoulk_2016] as amkopiskkoulk_2
      ,[amkopisktunn_2016] as amkopisktunn_2
      ,[amkopiskjarj_2016] as amkopiskjarj_2
      ,[amkopiskmaak_2016] as amkopiskmaak_2
      ,[yoopiskkoulk_2016] as yoopiskkoulk_2
      ,[yoopisktunn_2016] as yoopisktunn_2
      ,[yoopiskjarj_2016] as yoopiskjarj_2
      ,[yoopiskmaak_2016] as yoopiskmaak_2
	  ,[opintotuki_ulkom_2016] as opintotuki_ulkom_2
      ,[monihaku_2016] as monihaku_2
      ,[ptoim1r4_2016] as ptoim1r4_2
      ,[amas_2016] as amas_2

      ,[luopiskkoulk_2017] as luopiskkoulk_3
      ,[luopisktunn_2017] as luopisktunn_3
      ,[luopiskjarj_2017] as luopiskjarj_3
      ,[luopiskmaak_2017] as luopiskmaak_3
      ,[ammopiskkoulk_2017] as ammopiskkoulk_3    
      ,[ammopisktunn_2017] as ammopisktunn_3
	  ,[ammopiskjarj_2017] as ammopiskjarj_3
      ,[ammopiskmaak_2017] as ammopiskmaak_3
      ,[amkopiskkoulk_2017] as amkopiskkoulk_3
      ,[amkopisktunn_2017] as amkopisktunn_3
      ,[amkopiskjarj_2017] as amkopiskjarj_3
      ,[amkopiskmaak_2017] as amkopiskmaak_3
      ,[yoopiskkoulk_2017] as yoopiskkoulk_3
      ,[yoopisktunn_2017] as yoopisktunn_3
      ,[yoopiskjarj_2017] as yoopiskjarj_3
      ,[yoopiskmaak_2017] as yoopiskmaak_3
	  ,[opintotuki_ulkom_2017] as opintotuki_ulkom_3
      ,[monihaku_2017] as monihaku_3
      ,[ptoim1r4_2017] as ptoim1r4_3
      ,[amas_2017] as amas_3

      ,[luopiskkoulk_2018] as luopiskkoulk_4
      ,[luopisktunn_2018] as luopisktunn_4
      ,[luopiskjarj_2018] as luopiskjarj_4
      ,[luopiskmaak_2018] as luopiskmaak_4
      ,[ammopiskkoulk_2018] as ammopiskkoulk_4
      ,[ammopisktunn_2018] as ammopisktunn_4
      ,[ammopiskjarj_2018] as ammopiskjarj_4
      ,[ammopiskmaak_2018] as ammopiskmaak_4
      ,[amkopiskkoulk_2018] as amkopiskkoulk_4
      ,[amkopisktunn_2018] as amkopisktunn_4
      ,[amkopiskjarj_2018] as amkopiskjarj_4
      ,[amkopiskmaak_2018] as amkopiskmaak_4
      ,[yoopiskkoulk_2018] as yoopiskkoulk_4
      ,[yoopisktunn_2018] as yoopisktunn_4
      ,[yoopiskjarj_2018] as yoopiskjarj_4
      ,[yoopiskmaak_2018] as yoopiskmaak_4
	  ,[opintotuki_ulkom_2018] as opintotuki_ulkom_4
      ,[monihaku_2018] as monihaku_4
      ,[ptoim1r4_2018] as ptoim1r4_4
      ,[amas_2018] as amas_4

      ,[luopiskkoulk_2019] as luopiskkoulk_5
      ,[luopisktunn_2019] as luopisktunn_5
      ,[luopiskjarj_2019] as luopiskjarj_5
      ,[luopiskmaak_2019] as luopiskmaak_5
      ,[ammopiskkoulk_2019] as ammopiskkoulk_5
      ,[ammopisktunn_2019] as ammopisktunn_5
      ,[ammopiskjarj_2019] as ammopiskjarj_5
      ,[ammopiskmaak_2019] as ammopiskmaak_5
      ,[amkopiskkoulk_2019] as amkopiskkoulk_5
      ,[amkopisktunn_2019] as amkopisktunn_5
      ,[amkopiskjarj_2019] as amkopiskjarj_5
      ,[amkopiskmaak_2019] as amkopiskmaak_5
      ,[yoopiskkoulk_2019] as yoopiskkoulk_5
      ,[yoopisktunn_2019] as yoopisktunn_5
      ,[yoopiskjarj_2019] as yoopiskjarj_5
      ,[yoopiskmaak_2019] as yoopiskmaak_5
	  ,[opintotuki_ulkom_2019] as opintotuki_ulkom_5
      ,[monihaku_2019] as monihaku_5
      ,[ptoim1r4_2019] as ptoim1r4_5
      ,[amas_2019] as amas_5

      ,[luopiskkoulk_2020] as luopiskkoulk_6
      ,[luopisktunn_2020] as luopisktunn_6
      ,[luopiskjarj_2020] as luopiskjarj_6
      ,[luopiskmaak_2020] as luopiskmaak_6
      ,[ammopiskkoulk_2020] as ammopiskkoulk_6
      ,[ammopisktunn_2020] as ammopisktunn_6
      ,[ammopiskjarj_2020] as ammopiskjarj_6
      ,[ammopiskmaak_2020] as ammopiskmaak_6
      ,[amkopiskkoulk_2020] as amkopiskkoulk_6
      ,[amkopisktunn_2020] as amkopisktunn_6
      ,[amkopiskjarj_2020] as amkopiskjarj_6
      ,[amkopiskmaak_2020] as amkopiskmaak_6
      ,[yoopiskkoulk_2020] as yoopiskkoulk_6
      ,[yoopisktunn_2020] as yoopisktunn_6
      ,[yoopiskjarj_2020] as yoopiskjarj_6
      ,[yoopiskmaak_2020] as yoopiskmaak_6
	  ,[opintotuki_ulkom_2020] as opintotuki_ulkom_6
      ,[monihaku_2020] as monihaku_6
      ,[ptoim1r4_2020] as ptoim1r4_6
      ,[amas_2020] as amas_6

	  ,[luopiskkoulk_2021] as luopiskkoulk_7
      ,[luopisktunn_2021] as luopisktunn_7
      ,[luopiskjarj_2021] as luopiskjarj_7
      ,[luopiskmaak_2021] as luopiskmaak_7
      ,[ammopiskkoulk_2021] as ammopiskkoulk_7
      ,[ammopisktunn_2021] as ammopisktunn_7
      ,[ammopiskjarj_2021] as ammopiskjarj_7
      ,[ammopiskmaak_2021] as ammopiskmaak_7
      ,[amkopiskkoulk_2021] as amkopiskkoulk_7
      ,[amkopisktunn_2021] as amkopisktunn_7
      ,[amkopiskjarj_2021] as amkopiskjarj_7
      ,[amkopiskmaak_2021] as amkopiskmaak_7
      ,[yoopiskkoulk_2021] as yoopiskkoulk_7
      ,[yoopisktunn_2021] as yoopisktunn_7
      ,[yoopiskjarj_2021] as yoopiskjarj_7
      ,[yoopiskmaak_2021] as yoopiskmaak_7
	  ,[opintotuki_ulkom_2021] as opintotuki_ulkom_7
      ,[monihaku_2021] as monihaku_7
      ,[ptoim1r4_2021] as ptoim1r4_7
      ,[amas_2021] as amas_7

	  ,[luopiskkoulk_2022] as luopiskkoulk_8
      ,[luopisktunn_2022] as luopisktunn_8
      ,[luopiskjarj_2022] as luopiskjarj_8
      ,[luopiskmaak_2022] as luopiskmaak_8
      ,[ammopiskkoulk_2022] as ammopiskkoulk_8
      ,[ammopisktunn_2022] as ammopisktunn_8
      ,[ammopiskjarj_2022] as ammopiskjarj_8
      ,[ammopiskmaak_2022] as ammopiskmaak_8
      ,[amkopiskkoulk_2022] as amkopiskkoulk_8
      ,[amkopisktunn_2022] as amkopisktunn_8
      ,[amkopiskjarj_2022] as amkopiskjarj_8
      ,[amkopiskmaak_2022] as amkopiskmaak_8
      ,[yoopiskkoulk_2022] as yoopiskkoulk_8
      ,[yoopisktunn_2022] as yoopisktunn_8
      ,[yoopiskjarj_2022] as yoopiskjarj_8
      ,[yoopiskmaak_2022] as yoopiskmaak_8
	  ,[opintotuki_ulkom_2022] as opintotuki_ulkom_8
      ,[monihaku_2022] as monihaku_8
      ,[ptoim1r4_2022] as ptoim1r4_8
      ,[amas_2022] as amas_8

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13b_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13b_sopv_24]


--lisää kopio ja korvaa siihen tietolahde, tauluviite sekä vuodet suurimmasta alkaen +1v

) Aineistot

GO


