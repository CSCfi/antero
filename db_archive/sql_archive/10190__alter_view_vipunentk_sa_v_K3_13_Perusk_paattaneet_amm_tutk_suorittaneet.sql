USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_K3_13_Perusk_paattaneet_amm_tutk_suorittaneet]    Script Date: 10.10.2024 12:14:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_K3_13_Perusk_paattaneet_amm_tutk_suorittaneet] as
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
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2004] as luopiskkoulk_1
      ,[luopisktunn_2004] as luopisktunn_1
      ,[luopiskjarj_2004] as luopiskjarj_1
      ,[luopiskmaak_2004] as luopiskmaak_1
      ,[ammopiskkoulk_2004] as ammopiskkoulk_1
      ,[ammopisktunn_2004] as ammopisktunn_1
      ,[ammopiskjarj_2004] as ammopiskjarj_1
      ,[ammopiskmaak_2004] as ammopiskmaak_1
      ,[amkopiskkoulk_2004] as amkopiskkoulk_1
      ,[amkopisktunn_2004] as amkopisktunn_1
      ,[amkopiskjarj_2004] as amkopiskjarj_1
      ,[amkopiskmaak_2004] as amkopiskmaak_1
      ,[yoopiskkoulk_2004] as yoopiskkoulk_1
      ,[yoopisktunn_2004] as yoopisktunn_1
      ,[yoopiskjarj_2004] as yoopiskjarj_1
      ,[yoopiskmaak_2004] as yoopiskmaak_1
      ,[monihaku_2004] as monihaku_1
      ,[ptoim1r4_2004] as [ptoim1r4_1]
      ,[amas_2004] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2005] as luopiskkoulk_2
      ,[luopisktunn_2005] as luopisktunn_2
      ,[luopiskjarj_2005] as luopiskjarj_2
      ,[luopiskmaak_2005] as luopiskmaak_2
      ,[ammopiskkoulk_2005] as ammopiskkoulk_2
      ,[ammopisktunn_2005] as ammopisktunn_2
      ,[ammopiskjarj_2005] as ammopiskjarj_2
      ,[ammopiskmaak_2005] as ammopiskmaak_2
      ,[amkopiskkoulk_2005] as amkopiskkoulk_2
      ,[amkopisktunn_2005] as amkopisktunn_2
      ,[amkopiskjarj_2005] as amkopiskjarj_2
      ,[amkopiskmaak_2005] as amkopiskmaak_2
      ,[yoopiskkoulk_2005] as yoopiskkoulk_2
      ,[yoopisktunn_2005] as yoopisktunn_2
      ,[yoopiskjarj_2005] as yoopiskjarj_2
      ,[yoopiskmaak_2005] as yoopiskmaak_2
      ,[monihaku_2005] as monihaku_2
      ,[ptoim1r4_2005] as ptoim1r4_2
      ,[amas_2005] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2006] as luopiskkoulk_3
      ,[luopisktunn_2006] as luopisktunn_3
      ,[luopiskjarj_2006] as luopiskjarj_3
      ,[luopiskmaak_2006] as luopiskmaak_3
      ,[ammopiskkoulk_2006] as ammopiskkoulk_3    
      ,[ammopisktunn_2006] as ammopisktunn_3
	  ,[ammopiskjarj_2006] as ammopiskjarj_3
      ,[ammopiskmaak_2006] as ammopiskmaak_3
      ,[amkopiskkoulk_2006] as amkopiskkoulk_3
      ,[amkopisktunn_2006] as amkopisktunn_3
      ,[amkopiskjarj_2006] as amkopiskjarj_3
      ,[amkopiskmaak_2006] as amkopiskmaak_3
      ,[yoopiskkoulk_2006] as yoopiskkoulk_3
      ,[yoopisktunn_2006] as yoopisktunn_3
      ,[yoopiskjarj_2006] as yoopiskjarj_3
      ,[yoopiskmaak_2006] as yoopiskmaak_3
      ,[monihaku_2006] as monihaku_3
      ,[ptoim1r4_2006] as ptoim1r4_3
      ,[amas_2006] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2007] as luopiskkoulk_4
      ,[luopisktunn_2007] as luopisktunn_4
      ,[luopiskjarj_2007] as luopiskjarj_4
      ,[luopiskmaak_2007] as luopiskmaak_4
      ,[ammopiskkoulk_2007] as ammopiskkoulk_4
      ,[ammopisktunn_2007] as ammopisktunn_4
      ,[ammopiskjarj_2007] as ammopiskjarj_4
      ,[ammopiskmaak_2007] as ammopiskmaak_4
      ,[amkopiskkoulk_2007] as amkopiskkoulk_4
      ,[amkopisktunn_2007] as amkopisktunn_4
      ,[amkopiskjarj_2007] as amkopiskjarj_4
      ,[amkopiskmaak_2007] as amkopiskmaak_4
      ,[yoopiskkoulk_2007] as yoopiskkoulk_4
      ,[yoopisktunn_2007] as yoopisktunn_4
      ,[yoopiskjarj_2007] as yoopiskjarj_4
      ,[yoopiskmaak_2007] as yoopiskmaak_4
      ,[monihaku_2007] as monihaku_4
      ,[ptoim1r4_2007] as ptoim1r4_4
      ,[amas_2007] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2008] as luopiskkoulk_5
      ,[luopisktunn_2008] as luopisktunn_5
      ,[luopiskjarj_2008] as luopiskjarj_5
      ,[luopiskmaak_2008] as luopiskmaak_5
      ,[ammopiskkoulk_2008] as ammopiskkoulk_5
      ,[ammopisktunn_2008] as ammopisktunn_5
      ,[ammopiskjarj_2008] as ammopiskjarj_5
      ,[ammopiskmaak_2008] as ammopiskmaak_5
      ,[amkopiskkoulk_2008] as amkopiskkoulk_5
      ,[amkopisktunn_2008] as amkopisktunn_5
      ,[amkopiskjarj_2008] as amkopiskjarj_5
      ,[amkopiskmaak_2008] as amkopiskmaak_5
      ,[yoopiskkoulk_2008] as yoopiskkoulk_5
      ,[yoopisktunn_2008] as yoopisktunn_5
      ,[yoopiskjarj_2008] as yoopiskjarj_5
      ,[yoopiskmaak_2008] as yoopiskmaak_5
      ,[monihaku_2008] as monihaku_5
      ,[ptoim1r4_2008] as ptoim1r4_5
      ,[amas_2008] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2009] as luopiskkoulk_6
      ,[luopisktunn_2009] as luopisktunn_6
      ,[luopiskjarj_2009] as luopiskjarj_6
      ,[luopiskmaak_2009] as luopiskmaak_6
      ,[ammopiskkoulk_2009] as ammopiskkoulk_6
      ,[ammopisktunn_2009] as ammopisktunn_6
      ,[ammopiskjarj_2009] as ammopiskjarj_6
      ,[ammopiskmaak_2009] as ammopiskmaak_6
      ,[amkopiskkoulk_2009] as amkopiskkoulk_6
      ,[amkopisktunn_2009] as amkopisktunn_6
      ,[amkopiskjarj_2009] as amkopiskjarj_6
      ,[amkopiskmaak_2009] as amkopiskmaak_6
      ,[yoopiskkoulk_2009] as yoopiskkoulk_6
      ,[yoopisktunn_2009] as yoopisktunn_6
      ,[yoopiskjarj_2009] as yoopiskjarj_6
      ,[yoopiskmaak_2009] as yoopiskmaak_6
      ,[monihaku_2009] as monihaku_6
      ,[ptoim1r4_2009] as ptoim1r4_6
      ,[amas_2009] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_11]

UNION ALL

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
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2005] as luopiskkoulk_1
      ,[luopisktunn_2005] as luopisktunn_1
      ,[luopiskjarj_2005] as luopiskjarj_1
      ,[luopiskmaak_2005] as luopiskmaak_1
      ,[ammopiskkoulk_2005] as ammopiskkoulk_1
      ,[ammopisktunn_2005] as ammopisktunn_1
      ,[ammopiskjarj_2005] as ammopiskjarj_1
      ,[ammopiskmaak_2005] as ammopiskmaak_1
      ,[amkopiskkoulk_2005] as amkopiskkoulk_1
      ,[amkopisktunn_2005] as amkopisktunn_1
      ,[amkopiskjarj_2005] as amkopiskjarj_1
      ,[amkopiskmaak_2005] as amkopiskmaak_1
      ,[yoopiskkoulk_2005] as yoopiskkoulk_1
      ,[yoopisktunn_2005] as yoopisktunn_1
      ,[yoopiskjarj_2005] as yoopiskjarj_1
      ,[yoopiskmaak_2005] as yoopiskmaak_1
      ,[monihaku_2005] as monihaku_1
      ,[ptoim1r4_2005] as [ptoim1r4_1]
      ,[amas_2005] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2006] as luopiskkoulk_2
      ,[luopisktunn_2006] as luopisktunn_2
      ,[luopiskjarj_2006] as luopiskjarj_2
      ,[luopiskmaak_2006] as luopiskmaak_2
      ,[ammopiskkoulk_2006] as ammopiskkoulk_2
      ,[ammopisktunn_2006] as ammopisktunn_2
      ,[ammopiskjarj_2006] as ammopiskjarj_2
      ,[ammopiskmaak_2006] as ammopiskmaak_2
      ,[amkopiskkoulk_2006] as amkopiskkoulk_2
      ,[amkopisktunn_2006] as amkopisktunn_2
      ,[amkopiskjarj_2006] as amkopiskjarj_2
      ,[amkopiskmaak_2006] as amkopiskmaak_2
      ,[yoopiskkoulk_2006] as yoopiskkoulk_2
      ,[yoopisktunn_2006] as yoopisktunn_2
      ,[yoopiskjarj_2006] as yoopiskjarj_2
      ,[yoopiskmaak_2006] as yoopiskmaak_2
      ,[monihaku_2006] as monihaku_2
      ,[ptoim1r4_2006] as ptoim1r4_2
      ,[amas_2006] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2007] as luopiskkoulk_3
      ,[luopisktunn_2007] as luopisktunn_3
      ,[luopiskjarj_2007] as luopiskjarj_3
      ,[luopiskmaak_2007] as luopiskmaak_3
      ,[ammopiskkoulk_2007] as ammopiskkoulk_3    
      ,[ammopisktunn_2007] as ammopisktunn_3
	  ,[ammopiskjarj_2007] as ammopiskjarj_3
      ,[ammopiskmaak_2007] as ammopiskmaak_3
      ,[amkopiskkoulk_2007] as amkopiskkoulk_3
      ,[amkopisktunn_2007] as amkopisktunn_3
      ,[amkopiskjarj_2007] as amkopiskjarj_3
      ,[amkopiskmaak_2007] as amkopiskmaak_3
      ,[yoopiskkoulk_2007] as yoopiskkoulk_3
      ,[yoopisktunn_2007] as yoopisktunn_3
      ,[yoopiskjarj_2007] as yoopiskjarj_3
      ,[yoopiskmaak_2007] as yoopiskmaak_3
      ,[monihaku_2007] as monihaku_3
      ,[ptoim1r4_2007] as ptoim1r4_3
      ,[amas_2007] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2008] as luopiskkoulk_4
      ,[luopisktunn_2008] as luopisktunn_4
      ,[luopiskjarj_2008] as luopiskjarj_4
      ,[luopiskmaak_2008] as luopiskmaak_4
      ,[ammopiskkoulk_2008] as ammopiskkoulk_4
      ,[ammopisktunn_2008] as ammopisktunn_4
      ,[ammopiskjarj_2008] as ammopiskjarj_4
      ,[ammopiskmaak_2008] as ammopiskmaak_4
      ,[amkopiskkoulk_2008] as amkopiskkoulk_4
      ,[amkopisktunn_2008] as amkopisktunn_4
      ,[amkopiskjarj_2008] as amkopiskjarj_4
      ,[amkopiskmaak_2008] as amkopiskmaak_4
      ,[yoopiskkoulk_2008] as yoopiskkoulk_4
      ,[yoopisktunn_2008] as yoopisktunn_4
      ,[yoopiskjarj_2008] as yoopiskjarj_4
      ,[yoopiskmaak_2008] as yoopiskmaak_4
      ,[monihaku_2008] as monihaku_4
      ,[ptoim1r4_2008] as ptoim1r4_4
      ,[amas_2008] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2009] as luopiskkoulk_5
      ,[luopisktunn_2009] as luopisktunn_5
      ,[luopiskjarj_2009] as luopiskjarj_5
      ,[luopiskmaak_2009] as luopiskmaak_5
      ,[ammopiskkoulk_2009] as ammopiskkoulk_5
      ,[ammopisktunn_2009] as ammopisktunn_5
      ,[ammopiskjarj_2009] as ammopiskjarj_5
      ,[ammopiskmaak_2009] as ammopiskmaak_5
      ,[amkopiskkoulk_2009] as amkopiskkoulk_5
      ,[amkopisktunn_2009] as amkopisktunn_5
      ,[amkopiskjarj_2009] as amkopiskjarj_5
      ,[amkopiskmaak_2009] as amkopiskmaak_5
      ,[yoopiskkoulk_2009] as yoopiskkoulk_5
      ,[yoopisktunn_2009] as yoopisktunn_5
      ,[yoopiskjarj_2009] as yoopiskjarj_5
      ,[yoopiskmaak_2009] as yoopiskmaak_5
      ,[monihaku_2009] as monihaku_5
      ,[ptoim1r4_2009] as ptoim1r4_5
      ,[amas_2009] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2010] as luopiskkoulk_6
      ,[luopisktunn_2010] as luopisktunn_6
      ,[luopiskjarj_2010] as luopiskjarj_6
      ,[luopiskmaak_2010] as luopiskmaak_6
      ,[ammopiskkoulk_2010] as ammopiskkoulk_6
      ,[ammopisktunn_2010] as ammopisktunn_6
      ,[ammopiskjarj_2010] as ammopiskjarj_6
      ,[ammopiskmaak_2010] as ammopiskmaak_6
      ,[amkopiskkoulk_2010] as amkopiskkoulk_6
      ,[amkopisktunn_2010] as amkopisktunn_6
      ,[amkopiskjarj_2010] as amkopiskjarj_6
      ,[amkopiskmaak_2010] as amkopiskmaak_6
      ,[yoopiskkoulk_2010] as yoopiskkoulk_6
      ,[yoopisktunn_2010] as yoopisktunn_6
      ,[yoopiskjarj_2010] as yoopiskjarj_6
      ,[yoopiskmaak_2010] as yoopiskmaak_6
      ,[monihaku_2010] as monihaku_6
      ,[ptoim1r4_2010] as ptoim1r4_6
      ,[amas_2010] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_12]

UNION ALL

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
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2006] as luopiskkoulk_1
      ,[luopisktunn_2006] as luopisktunn_1
      ,[luopiskjarj_2006] as luopiskjarj_1
      ,[luopiskmaak_2006] as luopiskmaak_1
      ,[ammopiskkoulk_2006] as ammopiskkoulk_1
      ,[ammopisktunn_2006] as ammopisktunn_1
      ,[ammopiskjarj_2006] as ammopiskjarj_1
      ,[ammopiskmaak_2006] as ammopiskmaak_1
      ,[amkopiskkoulk_2006] as amkopiskkoulk_1
      ,[amkopisktunn_2006] as amkopisktunn_1
      ,[amkopiskjarj_2006] as amkopiskjarj_1
      ,[amkopiskmaak_2006] as amkopiskmaak_1
      ,[yoopiskkoulk_2006] as yoopiskkoulk_1
      ,[yoopisktunn_2006] as yoopisktunn_1
      ,[yoopiskjarj_2006] as yoopiskjarj_1
      ,[yoopiskmaak_2006] as yoopiskmaak_1
      ,[monihaku_2006] as monihaku_1
      ,[ptoim1r4_2006] as [ptoim1r4_1]
      ,[amas_2006] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2007] as luopiskkoulk_2
      ,[luopisktunn_2007] as luopisktunn_2
      ,[luopiskjarj_2007] as luopiskjarj_2
      ,[luopiskmaak_2007] as luopiskmaak_2
      ,[ammopiskkoulk_2007] as ammopiskkoulk_2
      ,[ammopisktunn_2007] as ammopisktunn_2
      ,[ammopiskjarj_2007] as ammopiskjarj_2
      ,[ammopiskmaak_2007] as ammopiskmaak_2
      ,[amkopiskkoulk_2007] as amkopiskkoulk_2
      ,[amkopisktunn_2007] as amkopisktunn_2
      ,[amkopiskjarj_2007] as amkopiskjarj_2
      ,[amkopiskmaak_2007] as amkopiskmaak_2
      ,[yoopiskkoulk_2007] as yoopiskkoulk_2
      ,[yoopisktunn_2007] as yoopisktunn_2
      ,[yoopiskjarj_2007] as yoopiskjarj_2
      ,[yoopiskmaak_2007] as yoopiskmaak_2
      ,[monihaku_2007] as monihaku_2
      ,[ptoim1r4_2007] as ptoim1r4_2
      ,[amas_2007] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2008] as luopiskkoulk_3
      ,[luopisktunn_2008] as luopisktunn_3
      ,[luopiskjarj_2008] as luopiskjarj_3
      ,[luopiskmaak_2008] as luopiskmaak_3
      ,[ammopiskkoulk_2008] as ammopiskkoulk_3    
      ,[ammopisktunn_2008] as ammopisktunn_3
	  ,[ammopiskjarj_2008] as ammopiskjarj_3
      ,[ammopiskmaak_2008] as ammopiskmaak_3
      ,[amkopiskkoulk_2008] as amkopiskkoulk_3
      ,[amkopisktunn_2008] as amkopisktunn_3
      ,[amkopiskjarj_2008] as amkopiskjarj_3
      ,[amkopiskmaak_2008] as amkopiskmaak_3
      ,[yoopiskkoulk_2008] as yoopiskkoulk_3
      ,[yoopisktunn_2008] as yoopisktunn_3
      ,[yoopiskjarj_2008] as yoopiskjarj_3
      ,[yoopiskmaak_2008] as yoopiskmaak_3
      ,[monihaku_2008] as monihaku_3
      ,[ptoim1r4_2008] as ptoim1r4_3
      ,[amas_2008] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2009] as luopiskkoulk_4
      ,[luopisktunn_2009] as luopisktunn_4
      ,[luopiskjarj_2009] as luopiskjarj_4
      ,[luopiskmaak_2009] as luopiskmaak_4
      ,[ammopiskkoulk_2009] as ammopiskkoulk_4
      ,[ammopisktunn_2009] as ammopisktunn_4
      ,[ammopiskjarj_2009] as ammopiskjarj_4
      ,[ammopiskmaak_2009] as ammopiskmaak_4
      ,[amkopiskkoulk_2009] as amkopiskkoulk_4
      ,[amkopisktunn_2009] as amkopisktunn_4
      ,[amkopiskjarj_2009] as amkopiskjarj_4
      ,[amkopiskmaak_2009] as amkopiskmaak_4
      ,[yoopiskkoulk_2009] as yoopiskkoulk_4
      ,[yoopisktunn_2009] as yoopisktunn_4
      ,[yoopiskjarj_2009] as yoopiskjarj_4
      ,[yoopiskmaak_2009] as yoopiskmaak_4
      ,[monihaku_2009] as monihaku_4
      ,[ptoim1r4_2009] as ptoim1r4_4
      ,[amas_2009] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2010] as luopiskkoulk_5
      ,[luopisktunn_2010] as luopisktunn_5
      ,[luopiskjarj_2010] as luopiskjarj_5
      ,[luopiskmaak_2010] as luopiskmaak_5
      ,[ammopiskkoulk_2010] as ammopiskkoulk_5
      ,[ammopisktunn_2010] as ammopisktunn_5
      ,[ammopiskjarj_2010] as ammopiskjarj_5
      ,[ammopiskmaak_2010] as ammopiskmaak_5
      ,[amkopiskkoulk_2010] as amkopiskkoulk_5
      ,[amkopisktunn_2010] as amkopisktunn_5
      ,[amkopiskjarj_2010] as amkopiskjarj_5
      ,[amkopiskmaak_2010] as amkopiskmaak_5
      ,[yoopiskkoulk_2010] as yoopiskkoulk_5
      ,[yoopisktunn_2010] as yoopisktunn_5
      ,[yoopiskjarj_2010] as yoopiskjarj_5
      ,[yoopiskmaak_2010] as yoopiskmaak_5
      ,[monihaku_2010] as monihaku_5
      ,[ptoim1r4_2010] as ptoim1r4_5
      ,[amas_2010] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2011] as luopiskkoulk_6
      ,[luopisktunn_2011] as luopisktunn_6
      ,[luopiskjarj_2011] as luopiskjarj_6
      ,[luopiskmaak_2011] as luopiskmaak_6
      ,[ammopiskkoulk_2011] as ammopiskkoulk_6
      ,[ammopisktunn_2011] as ammopisktunn_6
      ,[ammopiskjarj_2011] as ammopiskjarj_6
      ,[ammopiskmaak_2011] as ammopiskmaak_6
      ,[amkopiskkoulk_2011] as amkopiskkoulk_6
      ,[amkopisktunn_2011] as amkopisktunn_6
      ,[amkopiskjarj_2011] as amkopiskjarj_6
      ,[amkopiskmaak_2011] as amkopiskmaak_6
      ,[yoopiskkoulk_2011] as yoopiskkoulk_6
      ,[yoopisktunn_2011] as yoopisktunn_6
      ,[yoopiskjarj_2011] as yoopiskjarj_6
      ,[yoopiskmaak_2011] as yoopiskmaak_6
      ,[monihaku_2011] as monihaku_6
      ,[ptoim1r4_2011] as ptoim1r4_6
      ,[amas_2011] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_13]

UNION ALL

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
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2007] as luopiskkoulk_1
      ,[luopisktunn_2007] as luopisktunn_1
      ,[luopiskjarj_2007] as luopiskjarj_1
      ,[luopiskmaak_2007] as luopiskmaak_1
      ,[ammopiskkoulk_2007] as ammopiskkoulk_1
      ,[ammopisktunn_2007] as ammopisktunn_1
      ,[ammopiskjarj_2007] as ammopiskjarj_1
      ,[ammopiskmaak_2007] as ammopiskmaak_1
      ,[amkopiskkoulk_2007] as amkopiskkoulk_1
      ,[amkopisktunn_2007] as amkopisktunn_1
      ,[amkopiskjarj_2007] as amkopiskjarj_1
      ,[amkopiskmaak_2007] as amkopiskmaak_1
      ,[yoopiskkoulk_2007] as yoopiskkoulk_1
      ,[yoopisktunn_2007] as yoopisktunn_1
      ,[yoopiskjarj_2007] as yoopiskjarj_1
      ,[yoopiskmaak_2007] as yoopiskmaak_1
      ,[monihaku_2007] as monihaku_1
      ,[ptoim1r4_2007] as [ptoim1r4_1]
      ,[amas_2007] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2008] as luopiskkoulk_2
      ,[luopisktunn_2008] as luopisktunn_2
      ,[luopiskjarj_2008] as luopiskjarj_2
      ,[luopiskmaak_2008] as luopiskmaak_2
      ,[ammopiskkoulk_2008] as ammopiskkoulk_2
      ,[ammopisktunn_2008] as ammopisktunn_2
      ,[ammopiskjarj_2008] as ammopiskjarj_2
      ,[ammopiskmaak_2008] as ammopiskmaak_2
      ,[amkopiskkoulk_2008] as amkopiskkoulk_2
      ,[amkopisktunn_2008] as amkopisktunn_2
      ,[amkopiskjarj_2008] as amkopiskjarj_2
      ,[amkopiskmaak_2008] as amkopiskmaak_2
      ,[yoopiskkoulk_2008] as yoopiskkoulk_2
      ,[yoopisktunn_2008] as yoopisktunn_2
      ,[yoopiskjarj_2008] as yoopiskjarj_2
      ,[yoopiskmaak_2008] as yoopiskmaak_2
      ,[monihaku_2008] as monihaku_2
      ,[ptoim1r4_2008] as ptoim1r4_2
      ,[amas_2008] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2009] as luopiskkoulk_3
      ,[luopisktunn_2009] as luopisktunn_3
      ,[luopiskjarj_2009] as luopiskjarj_3
      ,[luopiskmaak_2009] as luopiskmaak_3
      ,[ammopiskkoulk_2009] as ammopiskkoulk_3    
      ,[ammopisktunn_2009] as ammopisktunn_3
	  ,[ammopiskjarj_2009] as ammopiskjarj_3
      ,[ammopiskmaak_2009] as ammopiskmaak_3
      ,[amkopiskkoulk_2009] as amkopiskkoulk_3
      ,[amkopisktunn_2009] as amkopisktunn_3
      ,[amkopiskjarj_2009] as amkopiskjarj_3
      ,[amkopiskmaak_2009] as amkopiskmaak_3
      ,[yoopiskkoulk_2009] as yoopiskkoulk_3
      ,[yoopisktunn_2009] as yoopisktunn_3
      ,[yoopiskjarj_2009] as yoopiskjarj_3
      ,[yoopiskmaak_2009] as yoopiskmaak_3
      ,[monihaku_2009] as monihaku_3
      ,[ptoim1r4_2009] as ptoim1r4_3
      ,[amas_2009] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2010] as luopiskkoulk_4
      ,[luopisktunn_2010] as luopisktunn_4
      ,[luopiskjarj_2010] as luopiskjarj_4
      ,[luopiskmaak_2010] as luopiskmaak_4
      ,[ammopiskkoulk_2010] as ammopiskkoulk_4
      ,[ammopisktunn_2010] as ammopisktunn_4
      ,[ammopiskjarj_2010] as ammopiskjarj_4
      ,[ammopiskmaak_2010] as ammopiskmaak_4
      ,[amkopiskkoulk_2010] as amkopiskkoulk_4
      ,[amkopisktunn_2010] as amkopisktunn_4
      ,[amkopiskjarj_2010] as amkopiskjarj_4
      ,[amkopiskmaak_2010] as amkopiskmaak_4
      ,[yoopiskkoulk_2010] as yoopiskkoulk_4
      ,[yoopisktunn_2010] as yoopisktunn_4
      ,[yoopiskjarj_2010] as yoopiskjarj_4
      ,[yoopiskmaak_2010] as yoopiskmaak_4
      ,[monihaku_2010] as monihaku_4
      ,[ptoim1r4_2010] as ptoim1r4_4
      ,[amas_2010] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2011] as luopiskkoulk_5
      ,[luopisktunn_2011] as luopisktunn_5
      ,[luopiskjarj_2011] as luopiskjarj_5
      ,[luopiskmaak_2011] as luopiskmaak_5
      ,[ammopiskkoulk_2011] as ammopiskkoulk_5
      ,[ammopisktunn_2011] as ammopisktunn_5
      ,[ammopiskjarj_2011] as ammopiskjarj_5
      ,[ammopiskmaak_2011] as ammopiskmaak_5
      ,[amkopiskkoulk_2011] as amkopiskkoulk_5
      ,[amkopisktunn_2011] as amkopisktunn_5
      ,[amkopiskjarj_2011] as amkopiskjarj_5
      ,[amkopiskmaak_2011] as amkopiskmaak_5
      ,[yoopiskkoulk_2011] as yoopiskkoulk_5
      ,[yoopisktunn_2011] as yoopisktunn_5
      ,[yoopiskjarj_2011] as yoopiskjarj_5
      ,[yoopiskmaak_2011] as yoopiskmaak_5
      ,[monihaku_2011] as monihaku_5
      ,[ptoim1r4_2011] as ptoim1r4_5
      ,[amas_2011] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2012] as luopiskkoulk_6
      ,[luopisktunn_2012] as luopisktunn_6
      ,[luopiskjarj_2012] as luopiskjarj_6
      ,[luopiskmaak_2012] as luopiskmaak_6
      ,[ammopiskkoulk_2012] as ammopiskkoulk_6
      ,[ammopisktunn_2012] as ammopisktunn_6
      ,[ammopiskjarj_2012] as ammopiskjarj_6
      ,[ammopiskmaak_2012] as ammopiskmaak_6
      ,[amkopiskkoulk_2012] as amkopiskkoulk_6
      ,[amkopisktunn_2012] as amkopisktunn_6
      ,[amkopiskjarj_2012] as amkopiskjarj_6
      ,[amkopiskmaak_2012] as amkopiskmaak_6
      ,[yoopiskkoulk_2012] as yoopiskkoulk_6
      ,[yoopisktunn_2012] as yoopisktunn_6
      ,[yoopiskjarj_2012] as yoopiskjarj_6
      ,[yoopiskmaak_2012] as yoopiskmaak_6
      ,[monihaku_2012] as monihaku_6
      ,[ptoim1r4_2012] as ptoim1r4_6
      ,[amas_2012] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_14]

UNION ALL

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
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2008] as luopiskkoulk_1
      ,[luopisktunn_2008] as luopisktunn_1
      ,[luopiskjarj_2008] as luopiskjarj_1
      ,[luopiskmaak_2008] as luopiskmaak_1
      ,[ammopiskkoulk_2008] as ammopiskkoulk_1
      ,[ammopisktunn_2008] as ammopisktunn_1
      ,[ammopiskjarj_2008] as ammopiskjarj_1
      ,[ammopiskmaak_2008] as ammopiskmaak_1
      ,[amkopiskkoulk_2008] as amkopiskkoulk_1
      ,[amkopisktunn_2008] as amkopisktunn_1
      ,[amkopiskjarj_2008] as amkopiskjarj_1
      ,[amkopiskmaak_2008] as amkopiskmaak_1
      ,[yoopiskkoulk_2008] as yoopiskkoulk_1
      ,[yoopisktunn_2008] as yoopisktunn_1
      ,[yoopiskjarj_2008] as yoopiskjarj_1
      ,[yoopiskmaak_2008] as yoopiskmaak_1
      ,[monihaku_2008] as monihaku_1
      ,[ptoim1r4_2008] as [ptoim1r4_1]
      ,[amas_2008] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2009] as luopiskkoulk_2
      ,[luopisktunn_2009] as luopisktunn_2
      ,[luopiskjarj_2009] as luopiskjarj_2
      ,[luopiskmaak_2009] as luopiskmaak_2
      ,[ammopiskkoulk_2009] as ammopiskkoulk_2
      ,[ammopisktunn_2009] as ammopisktunn_2
      ,[ammopiskjarj_2009] as ammopiskjarj_2
      ,[ammopiskmaak_2009] as ammopiskmaak_2
      ,[amkopiskkoulk_2009] as amkopiskkoulk_2
      ,[amkopisktunn_2009] as amkopisktunn_2
      ,[amkopiskjarj_2009] as amkopiskjarj_2
      ,[amkopiskmaak_2009] as amkopiskmaak_2
      ,[yoopiskkoulk_2009] as yoopiskkoulk_2
      ,[yoopisktunn_2009] as yoopisktunn_2
      ,[yoopiskjarj_2009] as yoopiskjarj_2
      ,[yoopiskmaak_2009] as yoopiskmaak_2
      ,[monihaku_2009] as monihaku_2
      ,[ptoim1r4_2009] as ptoim1r4_2
      ,[amas_2009] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2010] as luopiskkoulk_3
      ,[luopisktunn_2010] as luopisktunn_3
      ,[luopiskjarj_2010] as luopiskjarj_3
      ,[luopiskmaak_2010] as luopiskmaak_3
      ,[ammopiskkoulk_2010] as ammopiskkoulk_3    
      ,[ammopisktunn_2010] as ammopisktunn_3
	  ,[ammopiskjarj_2010] as ammopiskjarj_3
      ,[ammopiskmaak_2010] as ammopiskmaak_3
      ,[amkopiskkoulk_2010] as amkopiskkoulk_3
      ,[amkopisktunn_2010] as amkopisktunn_3
      ,[amkopiskjarj_2010] as amkopiskjarj_3
      ,[amkopiskmaak_2010] as amkopiskmaak_3
      ,[yoopiskkoulk_2010] as yoopiskkoulk_3
      ,[yoopisktunn_2010] as yoopisktunn_3
      ,[yoopiskjarj_2010] as yoopiskjarj_3
      ,[yoopiskmaak_2010] as yoopiskmaak_3
      ,[monihaku_2010] as monihaku_3
      ,[ptoim1r4_2010] as ptoim1r4_3
      ,[amas_2010] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2011] as luopiskkoulk_4
      ,[luopisktunn_2011] as luopisktunn_4
      ,[luopiskjarj_2011] as luopiskjarj_4
      ,[luopiskmaak_2011] as luopiskmaak_4
      ,[ammopiskkoulk_2011] as ammopiskkoulk_4
      ,[ammopisktunn_2011] as ammopisktunn_4
      ,[ammopiskjarj_2011] as ammopiskjarj_4
      ,[ammopiskmaak_2011] as ammopiskmaak_4
      ,[amkopiskkoulk_2011] as amkopiskkoulk_4
      ,[amkopisktunn_2011] as amkopisktunn_4
      ,[amkopiskjarj_2011] as amkopiskjarj_4
      ,[amkopiskmaak_2011] as amkopiskmaak_4
      ,[yoopiskkoulk_2011] as yoopiskkoulk_4
      ,[yoopisktunn_2011] as yoopisktunn_4
      ,[yoopiskjarj_2011] as yoopiskjarj_4
      ,[yoopiskmaak_2011] as yoopiskmaak_4
      ,[monihaku_2011] as monihaku_4
      ,[ptoim1r4_2011] as ptoim1r4_4
      ,[amas_2011] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2012] as luopiskkoulk_5
      ,[luopisktunn_2012] as luopisktunn_5
      ,[luopiskjarj_2012] as luopiskjarj_5
      ,[luopiskmaak_2012] as luopiskmaak_5
      ,[ammopiskkoulk_2012] as ammopiskkoulk_5
      ,[ammopisktunn_2012] as ammopisktunn_5
      ,[ammopiskjarj_2012] as ammopiskjarj_5
      ,[ammopiskmaak_2012] as ammopiskmaak_5
      ,[amkopiskkoulk_2012] as amkopiskkoulk_5
      ,[amkopisktunn_2012] as amkopisktunn_5
      ,[amkopiskjarj_2012] as amkopiskjarj_5
      ,[amkopiskmaak_2012] as amkopiskmaak_5
      ,[yoopiskkoulk_2012] as yoopiskkoulk_5
      ,[yoopisktunn_2012] as yoopisktunn_5
      ,[yoopiskjarj_2012] as yoopiskjarj_5
      ,[yoopiskmaak_2012] as yoopiskmaak_5
      ,[monihaku_2012] as monihaku_5
      ,[ptoim1r4_2012] as ptoim1r4_5
      ,[amas_2012] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2013] as luopiskkoulk_6
      ,[luopisktunn_2013] as luopisktunn_6
      ,[luopiskjarj_2013] as luopiskjarj_6
      ,[luopiskmaak_2013] as luopiskmaak_6
      ,[ammopiskkoulk_2013] as ammopiskkoulk_6
      ,[ammopisktunn_2013] as ammopisktunn_6
      ,[ammopiskjarj_2013] as ammopiskjarj_6
      ,[ammopiskmaak_2013] as ammopiskmaak_6
      ,[amkopiskkoulk_2013] as amkopiskkoulk_6
      ,[amkopisktunn_2013] as amkopisktunn_6
      ,[amkopiskjarj_2013] as amkopiskjarj_6
      ,[amkopiskmaak_2013] as amkopiskmaak_6
      ,[yoopiskkoulk_2013] as yoopiskkoulk_6
      ,[yoopisktunn_2013] as yoopisktunn_6
      ,[yoopiskjarj_2013] as yoopiskjarj_6
      ,[yoopiskmaak_2013] as yoopiskmaak_6
      ,[monihaku_2013] as monihaku_6
      ,[ptoim1r4_2013] as ptoim1r4_6
      ,[amas_2013] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_15]

UNION ALL

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
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2009] as luopiskkoulk_1
      ,[luopisktunn_2009] as luopisktunn_1
      ,[luopiskjarj_2009] as luopiskjarj_1
      ,[luopiskmaak_2009] as luopiskmaak_1
      ,[ammopiskkoulk_2009] as ammopiskkoulk_1
      ,[ammopisktunn_2009] as ammopisktunn_1
      ,[ammopiskjarj_2009] as ammopiskjarj_1
      ,[ammopiskmaak_2009] as ammopiskmaak_1
      ,[amkopiskkoulk_2009] as amkopiskkoulk_1
      ,[amkopisktunn_2009] as amkopisktunn_1
      ,[amkopiskjarj_2009] as amkopiskjarj_1
      ,[amkopiskmaak_2009] as amkopiskmaak_1
      ,[yoopiskkoulk_2009] as yoopiskkoulk_1
      ,[yoopisktunn_2009] as yoopisktunn_1
      ,[yoopiskjarj_2009] as yoopiskjarj_1
      ,[yoopiskmaak_2009] as yoopiskmaak_1
      ,[monihaku_2009] as monihaku_1
      ,[ptoim1r4_2009] as [ptoim1r4_1]
      ,[amas_2009] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2010] as luopiskkoulk_2
      ,[luopisktunn_2010] as luopisktunn_2
      ,[luopiskjarj_2010] as luopiskjarj_2
      ,[luopiskmaak_2010] as luopiskmaak_2
      ,[ammopiskkoulk_2010] as ammopiskkoulk_2
      ,[ammopisktunn_2010] as ammopisktunn_2
      ,[ammopiskjarj_2010] as ammopiskjarj_2
      ,[ammopiskmaak_2010] as ammopiskmaak_2
      ,[amkopiskkoulk_2010] as amkopiskkoulk_2
      ,[amkopisktunn_2010] as amkopisktunn_2
      ,[amkopiskjarj_2010] as amkopiskjarj_2
      ,[amkopiskmaak_2010] as amkopiskmaak_2
      ,[yoopiskkoulk_2010] as yoopiskkoulk_2
      ,[yoopisktunn_2010] as yoopisktunn_2
      ,[yoopiskjarj_2010] as yoopiskjarj_2
      ,[yoopiskmaak_2010] as yoopiskmaak_2
      ,[monihaku_2010] as monihaku_2
      ,[ptoim1r4_2010] as ptoim1r4_2
      ,[amas_2010] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2011] as luopiskkoulk_3
      ,[luopisktunn_2011] as luopisktunn_3
      ,[luopiskjarj_2011] as luopiskjarj_3
      ,[luopiskmaak_2011] as luopiskmaak_3
      ,[ammopiskkoulk_2011] as ammopiskkoulk_3    
      ,[ammopisktunn_2011] as ammopisktunn_3
	  ,[ammopiskjarj_2011] as ammopiskjarj_3
      ,[ammopiskmaak_2011] as ammopiskmaak_3
      ,[amkopiskkoulk_2011] as amkopiskkoulk_3
      ,[amkopisktunn_2011] as amkopisktunn_3
      ,[amkopiskjarj_2011] as amkopiskjarj_3
      ,[amkopiskmaak_2011] as amkopiskmaak_3
      ,[yoopiskkoulk_2011] as yoopiskkoulk_3
      ,[yoopisktunn_2011] as yoopisktunn_3
      ,[yoopiskjarj_2011] as yoopiskjarj_3
      ,[yoopiskmaak_2011] as yoopiskmaak_3
      ,[monihaku_2011] as monihaku_3
      ,[ptoim1r4_2011] as ptoim1r4_3
      ,[amas_2011] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2012] as luopiskkoulk_4
      ,[luopisktunn_2012] as luopisktunn_4
      ,[luopiskjarj_2012] as luopiskjarj_4
      ,[luopiskmaak_2012] as luopiskmaak_4
      ,[ammopiskkoulk_2012] as ammopiskkoulk_4
      ,[ammopisktunn_2012] as ammopisktunn_4
      ,[ammopiskjarj_2012] as ammopiskjarj_4
      ,[ammopiskmaak_2012] as ammopiskmaak_4
      ,[amkopiskkoulk_2012] as amkopiskkoulk_4
      ,[amkopisktunn_2012] as amkopisktunn_4
      ,[amkopiskjarj_2012] as amkopiskjarj_4
      ,[amkopiskmaak_2012] as amkopiskmaak_4
      ,[yoopiskkoulk_2012] as yoopiskkoulk_4
      ,[yoopisktunn_2012] as yoopisktunn_4
      ,[yoopiskjarj_2012] as yoopiskjarj_4
      ,[yoopiskmaak_2012] as yoopiskmaak_4
      ,[monihaku_2012] as monihaku_4
      ,[ptoim1r4_2012] as ptoim1r4_4
      ,[amas_2012] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2013] as luopiskkoulk_5
      ,[luopisktunn_2013] as luopisktunn_5
      ,[luopiskjarj_2013] as luopiskjarj_5
      ,[luopiskmaak_2013] as luopiskmaak_5
      ,[ammopiskkoulk_2013] as ammopiskkoulk_5
      ,[ammopisktunn_2013] as ammopisktunn_5
      ,[ammopiskjarj_2013] as ammopiskjarj_5
      ,[ammopiskmaak_2013] as ammopiskmaak_5
      ,[amkopiskkoulk_2013] as amkopiskkoulk_5
      ,[amkopisktunn_2013] as amkopisktunn_5
      ,[amkopiskjarj_2013] as amkopiskjarj_5
      ,[amkopiskmaak_2013] as amkopiskmaak_5
      ,[yoopiskkoulk_2013] as yoopiskkoulk_5
      ,[yoopisktunn_2013] as yoopisktunn_5
      ,[yoopiskjarj_2013] as yoopiskjarj_5
      ,[yoopiskmaak_2013] as yoopiskmaak_5
      ,[monihaku_2013] as monihaku_5
      ,[ptoim1r4_2013] as ptoim1r4_5
      ,[amas_2013] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2014] as luopiskkoulk_6
      ,[luopisktunn_2014] as luopisktunn_6
      ,[luopiskjarj_2014] as luopiskjarj_6
      ,[luopiskmaak_2014] as luopiskmaak_6
      ,[ammopiskkoulk_2014] as ammopiskkoulk_6
      ,[ammopisktunn_2014] as ammopisktunn_6
      ,[ammopiskjarj_2014] as ammopiskjarj_6
      ,[ammopiskmaak_2014] as ammopiskmaak_6
      ,[amkopiskkoulk_2014] as amkopiskkoulk_6
      ,[amkopisktunn_2014] as amkopisktunn_6
      ,[amkopiskjarj_2014] as amkopiskjarj_6
      ,[amkopiskmaak_2014] as amkopiskmaak_6
      ,[yoopiskkoulk_2014] as yoopiskkoulk_6
      ,[yoopisktunn_2014] as yoopisktunn_6
      ,[yoopiskjarj_2014] as yoopiskjarj_6
      ,[yoopiskmaak_2014] as yoopiskmaak_6
      ,[monihaku_2014] as monihaku_6
      ,[ptoim1r4_2014] as ptoim1r4_6
      ,[amas_2014] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_16]

UNION ALL

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
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2010] as luopiskkoulk_1
      ,[luopisktunn_2010] as luopisktunn_1
      ,[luopiskjarj_2010] as luopiskjarj_1
      ,[luopiskmaak_2010] as luopiskmaak_1
      ,[ammopiskkoulk_2010] as ammopiskkoulk_1
      ,[ammopisktunn_2010] as ammopisktunn_1
      ,[ammopiskjarj_2010] as ammopiskjarj_1
      ,[ammopiskmaak_2010] as ammopiskmaak_1
      ,[amkopiskkoulk_2010] as amkopiskkoulk_1
      ,[amkopisktunn_2010] as amkopisktunn_1
      ,[amkopiskjarj_2010] as amkopiskjarj_1
      ,[amkopiskmaak_2010] as amkopiskmaak_1
      ,[yoopiskkoulk_2010] as yoopiskkoulk_1
      ,[yoopisktunn_2010] as yoopisktunn_1
      ,[yoopiskjarj_2010] as yoopiskjarj_1
      ,[yoopiskmaak_2010] as yoopiskmaak_1
      ,[monihaku_2010] as monihaku_1
      ,[ptoim1r4_2010] as [ptoim1r4_1]
      ,[amas_2010] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2011] as luopiskkoulk_2
      ,[luopisktunn_2011] as luopisktunn_2
      ,[luopiskjarj_2011] as luopiskjarj_2
      ,[luopiskmaak_2011] as luopiskmaak_2
      ,[ammopiskkoulk_2011] as ammopiskkoulk_2
      ,[ammopisktunn_2011] as ammopisktunn_2
      ,[ammopiskjarj_2011] as ammopiskjarj_2
      ,[ammopiskmaak_2011] as ammopiskmaak_2
      ,[amkopiskkoulk_2011] as amkopiskkoulk_2
      ,[amkopisktunn_2011] as amkopisktunn_2
      ,[amkopiskjarj_2011] as amkopiskjarj_2
      ,[amkopiskmaak_2011] as amkopiskmaak_2
      ,[yoopiskkoulk_2011] as yoopiskkoulk_2
      ,[yoopisktunn_2011] as yoopisktunn_2
      ,[yoopiskjarj_2011] as yoopiskjarj_2
      ,[yoopiskmaak_2011] as yoopiskmaak_2
      ,[monihaku_2011] as monihaku_2
      ,[ptoim1r4_2011] as ptoim1r4_2
      ,[amas_2011] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2012] as luopiskkoulk_3
      ,[luopisktunn_2012] as luopisktunn_3
      ,[luopiskjarj_2012] as luopiskjarj_3
      ,[luopiskmaak_2012] as luopiskmaak_3
      ,[ammopiskkoulk_2012] as ammopiskkoulk_3    
      ,[ammopisktunn_2012] as ammopisktunn_3
	  ,[ammopiskjarj_2012] as ammopiskjarj_3
      ,[ammopiskmaak_2012] as ammopiskmaak_3
      ,[amkopiskkoulk_2012] as amkopiskkoulk_3
      ,[amkopisktunn_2012] as amkopisktunn_3
      ,[amkopiskjarj_2012] as amkopiskjarj_3
      ,[amkopiskmaak_2012] as amkopiskmaak_3
      ,[yoopiskkoulk_2012] as yoopiskkoulk_3
      ,[yoopisktunn_2012] as yoopisktunn_3
      ,[yoopiskjarj_2012] as yoopiskjarj_3
      ,[yoopiskmaak_2012] as yoopiskmaak_3
      ,[monihaku_2012] as monihaku_3
      ,[ptoim1r4_2012] as ptoim1r4_3
      ,[amas_2012] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2013] as luopiskkoulk_4
      ,[luopisktunn_2013] as luopisktunn_4
      ,[luopiskjarj_2013] as luopiskjarj_4
      ,[luopiskmaak_2013] as luopiskmaak_4
      ,[ammopiskkoulk_2013] as ammopiskkoulk_4
      ,[ammopisktunn_2013] as ammopisktunn_4
      ,[ammopiskjarj_2013] as ammopiskjarj_4
      ,[ammopiskmaak_2013] as ammopiskmaak_4
      ,[amkopiskkoulk_2013] as amkopiskkoulk_4
      ,[amkopisktunn_2013] as amkopisktunn_4
      ,[amkopiskjarj_2013] as amkopiskjarj_4
      ,[amkopiskmaak_2013] as amkopiskmaak_4
      ,[yoopiskkoulk_2013] as yoopiskkoulk_4
      ,[yoopisktunn_2013] as yoopisktunn_4
      ,[yoopiskjarj_2013] as yoopiskjarj_4
      ,[yoopiskmaak_2013] as yoopiskmaak_4
      ,[monihaku_2013] as monihaku_4
      ,[ptoim1r4_2013] as ptoim1r4_4
      ,[amas_2013] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2014] as luopiskkoulk_5
      ,[luopisktunn_2014] as luopisktunn_5
      ,[luopiskjarj_2014] as luopiskjarj_5
      ,[luopiskmaak_2014] as luopiskmaak_5
      ,[ammopiskkoulk_2014] as ammopiskkoulk_5
      ,[ammopisktunn_2014] as ammopisktunn_5
      ,[ammopiskjarj_2014] as ammopiskjarj_5
      ,[ammopiskmaak_2014] as ammopiskmaak_5
      ,[amkopiskkoulk_2014] as amkopiskkoulk_5
      ,[amkopisktunn_2014] as amkopisktunn_5
      ,[amkopiskjarj_2014] as amkopiskjarj_5
      ,[amkopiskmaak_2014] as amkopiskmaak_5
      ,[yoopiskkoulk_2014] as yoopiskkoulk_5
      ,[yoopisktunn_2014] as yoopisktunn_5
      ,[yoopiskjarj_2014] as yoopiskjarj_5
      ,[yoopiskmaak_2014] as yoopiskmaak_5
      ,[monihaku_2014] as monihaku_5
      ,[ptoim1r4_2014] as ptoim1r4_5
      ,[amas_2014] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2015] as luopiskkoulk_6
      ,[luopisktunn_2015] as luopisktunn_6
      ,[luopiskjarj_2015] as luopiskjarj_6
      ,[luopiskmaak_2015] as luopiskmaak_6
      ,[ammopiskkoulk_2015] as ammopiskkoulk_6
      ,[ammopisktunn_2015] as ammopisktunn_6
      ,[ammopiskjarj_2015] as ammopiskjarj_6
      ,[ammopiskmaak_2015] as ammopiskmaak_6
      ,[amkopiskkoulk_2015] as amkopiskkoulk_6
      ,[amkopisktunn_2015] as amkopisktunn_6
      ,[amkopiskjarj_2015] as amkopiskjarj_6
      ,[amkopiskmaak_2015] as amkopiskmaak_6
      ,[yoopiskkoulk_2015] as yoopiskkoulk_6
      ,[yoopisktunn_2015] as yoopisktunn_6
      ,[yoopiskjarj_2015] as yoopiskjarj_6
      ,[yoopiskmaak_2015] as yoopiskmaak_6
      ,[monihaku_2015] as monihaku_6
      ,[ptoim1r4_2015] as ptoim1r4_6
      ,[amas_2015] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_17]

UNION ALL

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
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2011] as luopiskkoulk_1
      ,[luopisktunn_2011] as luopisktunn_1
      ,[luopiskjarj_2011] as luopiskjarj_1
      ,[luopiskmaak_2011] as luopiskmaak_1
      ,[ammopiskkoulk_2011] as ammopiskkoulk_1
      ,[ammopisktunn_2011] as ammopisktunn_1
      ,[ammopiskjarj_2011] as ammopiskjarj_1
      ,[ammopiskmaak_2011] as ammopiskmaak_1
      ,[amkopiskkoulk_2011] as amkopiskkoulk_1
      ,[amkopisktunn_2011] as amkopisktunn_1
      ,[amkopiskjarj_2011] as amkopiskjarj_1
      ,[amkopiskmaak_2011] as amkopiskmaak_1
      ,[yoopiskkoulk_2011] as yoopiskkoulk_1
      ,[yoopisktunn_2011] as yoopisktunn_1
      ,[yoopiskjarj_2011] as yoopiskjarj_1
      ,[yoopiskmaak_2011] as yoopiskmaak_1
      ,[monihaku_2011] as monihaku_1
      ,[ptoim1r4_2011] as [ptoim1r4_1]
      ,[amas_2011] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2012] as luopiskkoulk_2
      ,[luopisktunn_2012] as luopisktunn_2
      ,[luopiskjarj_2012] as luopiskjarj_2
      ,[luopiskmaak_2012] as luopiskmaak_2
      ,[ammopiskkoulk_2012] as ammopiskkoulk_2
      ,[ammopisktunn_2012] as ammopisktunn_2
      ,[ammopiskjarj_2012] as ammopiskjarj_2
      ,[ammopiskmaak_2012] as ammopiskmaak_2
      ,[amkopiskkoulk_2012] as amkopiskkoulk_2
      ,[amkopisktunn_2012] as amkopisktunn_2
      ,[amkopiskjarj_2012] as amkopiskjarj_2
      ,[amkopiskmaak_2012] as amkopiskmaak_2
      ,[yoopiskkoulk_2012] as yoopiskkoulk_2
      ,[yoopisktunn_2012] as yoopisktunn_2
      ,[yoopiskjarj_2012] as yoopiskjarj_2
      ,[yoopiskmaak_2012] as yoopiskmaak_2
      ,[monihaku_2012] as monihaku_2
      ,[ptoim1r4_2012] as ptoim1r4_2
      ,[amas_2012] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2013] as luopiskkoulk_3
      ,[luopisktunn_2013] as luopisktunn_3
      ,[luopiskjarj_2013] as luopiskjarj_3
      ,[luopiskmaak_2013] as luopiskmaak_3
      ,[ammopiskkoulk_2013] as ammopiskkoulk_3    
      ,[ammopisktunn_2013] as ammopisktunn_3
	  ,[ammopiskjarj_2013] as ammopiskjarj_3
      ,[ammopiskmaak_2013] as ammopiskmaak_3
      ,[amkopiskkoulk_2013] as amkopiskkoulk_3
      ,[amkopisktunn_2013] as amkopisktunn_3
      ,[amkopiskjarj_2013] as amkopiskjarj_3
      ,[amkopiskmaak_2013] as amkopiskmaak_3
      ,[yoopiskkoulk_2013] as yoopiskkoulk_3
      ,[yoopisktunn_2013] as yoopisktunn_3
      ,[yoopiskjarj_2013] as yoopiskjarj_3
      ,[yoopiskmaak_2013] as yoopiskmaak_3
      ,[monihaku_2013] as monihaku_3
      ,[ptoim1r4_2013] as ptoim1r4_3
      ,[amas_2013] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2014] as luopiskkoulk_4
      ,[luopisktunn_2014] as luopisktunn_4
      ,[luopiskjarj_2014] as luopiskjarj_4
      ,[luopiskmaak_2014] as luopiskmaak_4
      ,[ammopiskkoulk_2014] as ammopiskkoulk_4
      ,[ammopisktunn_2014] as ammopisktunn_4
      ,[ammopiskjarj_2014] as ammopiskjarj_4
      ,[ammopiskmaak_2014] as ammopiskmaak_4
      ,[amkopiskkoulk_2014] as amkopiskkoulk_4
      ,[amkopisktunn_2014] as amkopisktunn_4
      ,[amkopiskjarj_2014] as amkopiskjarj_4
      ,[amkopiskmaak_2014] as amkopiskmaak_4
      ,[yoopiskkoulk_2014] as yoopiskkoulk_4
      ,[yoopisktunn_2014] as yoopisktunn_4
      ,[yoopiskjarj_2014] as yoopiskjarj_4
      ,[yoopiskmaak_2014] as yoopiskmaak_4
      ,[monihaku_2014] as monihaku_4
      ,[ptoim1r4_2014] as ptoim1r4_4
      ,[amas_2014] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2015] as luopiskkoulk_5
      ,[luopisktunn_2015] as luopisktunn_5
      ,[luopiskjarj_2015] as luopiskjarj_5
      ,[luopiskmaak_2015] as luopiskmaak_5
      ,[ammopiskkoulk_2015] as ammopiskkoulk_5
      ,[ammopisktunn_2015] as ammopisktunn_5
      ,[ammopiskjarj_2015] as ammopiskjarj_5
      ,[ammopiskmaak_2015] as ammopiskmaak_5
      ,[amkopiskkoulk_2015] as amkopiskkoulk_5
      ,[amkopisktunn_2015] as amkopisktunn_5
      ,[amkopiskjarj_2015] as amkopiskjarj_5
      ,[amkopiskmaak_2015] as amkopiskmaak_5
      ,[yoopiskkoulk_2015] as yoopiskkoulk_5
      ,[yoopisktunn_2015] as yoopisktunn_5
      ,[yoopiskjarj_2015] as yoopiskjarj_5
      ,[yoopiskmaak_2015] as yoopiskmaak_5
      ,[monihaku_2015] as monihaku_5
      ,[ptoim1r4_2015] as ptoim1r4_5
      ,[amas_2015] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2016] as luopiskkoulk_6
      ,[luopisktunn_2016] as luopisktunn_6
      ,[luopiskjarj_2016] as luopiskjarj_6
      ,[luopiskmaak_2016] as luopiskmaak_6
      ,[ammopiskkoulk_2016] as ammopiskkoulk_6
      ,[ammopisktunn_2016] as ammopisktunn_6
      ,[ammopiskjarj_2016] as ammopiskjarj_6
      ,[ammopiskmaak_2016] as ammopiskmaak_6
      ,[amkopiskkoulk_2016] as amkopiskkoulk_6
      ,[amkopisktunn_2016] as amkopisktunn_6
      ,[amkopiskjarj_2016] as amkopiskjarj_6
      ,[amkopiskmaak_2016] as amkopiskmaak_6
      ,[yoopiskkoulk_2016] as yoopiskkoulk_6
      ,[yoopisktunn_2016] as yoopisktunn_6
      ,[yoopiskjarj_2016] as yoopiskjarj_6
      ,[yoopiskmaak_2016] as yoopiskmaak_6
      ,[monihaku_2016] as monihaku_6
      ,[ptoim1r4_2016] as ptoim1r4_6
      ,[amas_2016] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_18]

UNION ALL

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
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak] 

      ,[luopiskkoulk_2012] as luopiskkoulk_1
      ,[luopisktunn_2012] as luopisktunn_1
      ,[luopiskjarj_2012] as luopiskjarj_1
      ,[luopiskmaak_2012] as luopiskmaak_1
      ,[ammopiskkoulk_2012] as ammopiskkoulk_1
      ,[ammopisktunn_2012] as ammopisktunn_1
      ,[ammopiskjarj_2012] as ammopiskjarj_1
      ,[ammopiskmaak_2012] as ammopiskmaak_1
      ,[amkopiskkoulk_2012] as amkopiskkoulk_1
      ,[amkopisktunn_2012] as amkopisktunn_1
      ,[amkopiskjarj_2012] as amkopiskjarj_1
      ,[amkopiskmaak_2012] as amkopiskmaak_1
      ,[yoopiskkoulk_2012] as yoopiskkoulk_1
      ,[yoopisktunn_2012] as yoopisktunn_1
      ,[yoopiskjarj_2012] as yoopiskjarj_1
      ,[yoopiskmaak_2012] as yoopiskmaak_1
      ,[monihaku_2012] as monihaku_1
      ,[ptoim1r4_2012] as [ptoim1r4_1]
      ,[amas_2012] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2013] as luopiskkoulk_2
      ,[luopisktunn_2013] as luopisktunn_2
      ,[luopiskjarj_2013] as luopiskjarj_2
      ,[luopiskmaak_2013] as luopiskmaak_2
      ,[ammopiskkoulk_2013] as ammopiskkoulk_2
      ,[ammopisktunn_2013] as ammopisktunn_2
      ,[ammopiskjarj_2013] as ammopiskjarj_2
      ,[ammopiskmaak_2013] as ammopiskmaak_2
      ,[amkopiskkoulk_2013] as amkopiskkoulk_2
      ,[amkopisktunn_2013] as amkopisktunn_2
      ,[amkopiskjarj_2013] as amkopiskjarj_2
      ,[amkopiskmaak_2013] as amkopiskmaak_2
      ,[yoopiskkoulk_2013] as yoopiskkoulk_2
      ,[yoopisktunn_2013] as yoopisktunn_2
      ,[yoopiskjarj_2013] as yoopiskjarj_2
      ,[yoopiskmaak_2013] as yoopiskmaak_2
      ,[monihaku_2013] as monihaku_2
      ,[ptoim1r4_2013] as ptoim1r4_2
      ,[amas_2013] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2014] as luopiskkoulk_3
      ,[luopisktunn_2014] as luopisktunn_3
      ,[luopiskjarj_2014] as luopiskjarj_3
      ,[luopiskmaak_2014] as luopiskmaak_3
      ,[ammopiskkoulk_2014] as ammopiskkoulk_3    
      ,[ammopisktunn_2014] as ammopisktunn_3
	  ,[ammopiskjarj_2014] as ammopiskjarj_3
      ,[ammopiskmaak_2014] as ammopiskmaak_3
      ,[amkopiskkoulk_2014] as amkopiskkoulk_3
      ,[amkopisktunn_2014] as amkopisktunn_3
      ,[amkopiskjarj_2014] as amkopiskjarj_3
      ,[amkopiskmaak_2014] as amkopiskmaak_3
      ,[yoopiskkoulk_2014] as yoopiskkoulk_3
      ,[yoopisktunn_2014] as yoopisktunn_3
      ,[yoopiskjarj_2014] as yoopiskjarj_3
      ,[yoopiskmaak_2014] as yoopiskmaak_3
      ,[monihaku_2014] as monihaku_3
      ,[ptoim1r4_2014] as ptoim1r4_3
      ,[amas_2014] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2015] as luopiskkoulk_4
      ,[luopisktunn_2015] as luopisktunn_4
      ,[luopiskjarj_2015] as luopiskjarj_4
      ,[luopiskmaak_2015] as luopiskmaak_4
      ,[ammopiskkoulk_2015] as ammopiskkoulk_4
      ,[ammopisktunn_2015] as ammopisktunn_4
      ,[ammopiskjarj_2015] as ammopiskjarj_4
      ,[ammopiskmaak_2015] as ammopiskmaak_4
      ,[amkopiskkoulk_2015] as amkopiskkoulk_4
      ,[amkopisktunn_2015] as amkopisktunn_4
      ,[amkopiskjarj_2015] as amkopiskjarj_4
      ,[amkopiskmaak_2015] as amkopiskmaak_4
      ,[yoopiskkoulk_2015] as yoopiskkoulk_4
      ,[yoopisktunn_2015] as yoopisktunn_4
      ,[yoopiskjarj_2015] as yoopiskjarj_4
      ,[yoopiskmaak_2015] as yoopiskmaak_4
      ,[monihaku_2015] as monihaku_4
      ,[ptoim1r4_2015] as ptoim1r4_4
      ,[amas_2015] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2016] as luopiskkoulk_5
      ,[luopisktunn_2016] as luopisktunn_5
      ,[luopiskjarj_2016] as luopiskjarj_5
      ,[luopiskmaak_2016] as luopiskmaak_5
      ,[ammopiskkoulk_2016] as ammopiskkoulk_5
      ,[ammopisktunn_2016] as ammopisktunn_5
      ,[ammopiskjarj_2016] as ammopiskjarj_5
      ,[ammopiskmaak_2016] as ammopiskmaak_5
      ,[amkopiskkoulk_2016] as amkopiskkoulk_5
      ,[amkopisktunn_2016] as amkopisktunn_5
      ,[amkopiskjarj_2016] as amkopiskjarj_5
      ,[amkopiskmaak_2016] as amkopiskmaak_5
      ,[yoopiskkoulk_2016] as yoopiskkoulk_5
      ,[yoopisktunn_2016] as yoopisktunn_5
      ,[yoopiskjarj_2016] as yoopiskjarj_5
      ,[yoopiskmaak_2016] as yoopiskmaak_5
      ,[monihaku_2016] as monihaku_5
      ,[ptoim1r4_2016] as ptoim1r4_5
      ,[amas_2016] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2017] as luopiskkoulk_6
      ,[luopisktunn_2017] as luopisktunn_6
      ,[luopiskjarj_2017] as luopiskjarj_6
      ,[luopiskmaak_2017] as luopiskmaak_6
      ,[ammopiskkoulk_2017] as ammopiskkoulk_6
      ,[ammopisktunn_2017] as ammopisktunn_6
      ,[ammopiskjarj_2017] as ammopiskjarj_6
      ,[ammopiskmaak_2017] as ammopiskmaak_6
      ,[amkopiskkoulk_2017] as amkopiskkoulk_6
      ,[amkopisktunn_2017] as amkopisktunn_6
      ,[amkopiskjarj_2017] as amkopiskjarj_6
      ,[amkopiskmaak_2017] as amkopiskmaak_6
      ,[yoopiskkoulk_2017] as yoopiskkoulk_6
      ,[yoopisktunn_2017] as yoopisktunn_6
      ,[yoopiskjarj_2017] as yoopiskjarj_6
      ,[yoopiskmaak_2017] as yoopiskmaak_6
      ,[monihaku_2017] as monihaku_6
      ,[ptoim1r4_2017] as ptoim1r4_6
      ,[amas_2017] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_19]

UNION ALL

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

      ,[luopiskkoulk_2013] as luopiskkoulk_1
      ,[luopisktunn_2013] as luopisktunn_1
      ,[luopiskjarj_2013] as luopiskjarj_1
      ,[luopiskmaak_2013] as luopiskmaak_1
      ,[ammopiskkoulk_2013] as ammopiskkoulk_1
      ,[ammopisktunn_2013] as ammopisktunn_1
      ,[ammopiskjarj_2013] as ammopiskjarj_1
      ,[ammopiskmaak_2013] as ammopiskmaak_1
      ,[amkopiskkoulk_2013] as amkopiskkoulk_1
      ,[amkopisktunn_2013] as amkopisktunn_1
      ,[amkopiskjarj_2013] as amkopiskjarj_1
      ,[amkopiskmaak_2013] as amkopiskmaak_1
      ,[yoopiskkoulk_2013] as yoopiskkoulk_1
      ,[yoopisktunn_2013] as yoopisktunn_1
      ,[yoopiskjarj_2013] as yoopiskjarj_1
      ,[yoopiskmaak_2013] as yoopiskmaak_1
      ,[monihaku_2013] as monihaku_1
      ,[ptoim1r4_2013] as [ptoim1r4_1]
      ,[amas_2013] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2014] as luopiskkoulk_2
      ,[luopisktunn_2014] as luopisktunn_2
      ,[luopiskjarj_2014] as luopiskjarj_2
      ,[luopiskmaak_2014] as luopiskmaak_2
      ,[ammopiskkoulk_2014] as ammopiskkoulk_2
      ,[ammopisktunn_2014] as ammopisktunn_2
      ,[ammopiskjarj_2014] as ammopiskjarj_2
      ,[ammopiskmaak_2014] as ammopiskmaak_2
      ,[amkopiskkoulk_2014] as amkopiskkoulk_2
      ,[amkopisktunn_2014] as amkopisktunn_2
      ,[amkopiskjarj_2014] as amkopiskjarj_2
      ,[amkopiskmaak_2014] as amkopiskmaak_2
      ,[yoopiskkoulk_2014] as yoopiskkoulk_2
      ,[yoopisktunn_2014] as yoopisktunn_2
      ,[yoopiskjarj_2014] as yoopiskjarj_2
      ,[yoopiskmaak_2014] as yoopiskmaak_2
      ,[monihaku_2014] as monihaku_2
      ,[ptoim1r4_2014] as ptoim1r4_2
      ,[amas_2014] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2015] as luopiskkoulk_3
      ,[luopisktunn_2015] as luopisktunn_3
      ,[luopiskjarj_2015] as luopiskjarj_3
      ,[luopiskmaak_2015] as luopiskmaak_3
      ,[ammopiskkoulk_2015] as ammopiskkoulk_3    
      ,[ammopisktunn_2015] as ammopisktunn_3
	  ,[ammopiskjarj_2015] as ammopiskjarj_3
      ,[ammopiskmaak_2015] as ammopiskmaak_3
      ,[amkopiskkoulk_2015] as amkopiskkoulk_3
      ,[amkopisktunn_2015] as amkopisktunn_3
      ,[amkopiskjarj_2015] as amkopiskjarj_3
      ,[amkopiskmaak_2015] as amkopiskmaak_3
      ,[yoopiskkoulk_2015] as yoopiskkoulk_3
      ,[yoopisktunn_2015] as yoopisktunn_3
      ,[yoopiskjarj_2015] as yoopiskjarj_3
      ,[yoopiskmaak_2015] as yoopiskmaak_3
      ,[monihaku_2015] as monihaku_3
      ,[ptoim1r4_2015] as ptoim1r4_3
      ,[amas_2015] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2016] as luopiskkoulk_4
      ,[luopisktunn_2016] as luopisktunn_4
      ,[luopiskjarj_2016] as luopiskjarj_4
      ,[luopiskmaak_2016] as luopiskmaak_4
      ,[ammopiskkoulk_2016] as ammopiskkoulk_4
      ,[ammopisktunn_2016] as ammopisktunn_4
      ,[ammopiskjarj_2016] as ammopiskjarj_4
      ,[ammopiskmaak_2016] as ammopiskmaak_4
      ,[amkopiskkoulk_2016] as amkopiskkoulk_4
      ,[amkopisktunn_2016] as amkopisktunn_4
      ,[amkopiskjarj_2016] as amkopiskjarj_4
      ,[amkopiskmaak_2016] as amkopiskmaak_4
      ,[yoopiskkoulk_2016] as yoopiskkoulk_4
      ,[yoopisktunn_2016] as yoopisktunn_4
      ,[yoopiskjarj_2016] as yoopiskjarj_4
      ,[yoopiskmaak_2016] as yoopiskmaak_4
      ,[monihaku_2016] as monihaku_4
      ,[ptoim1r4_2016] as ptoim1r4_4
      ,[amas_2016] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2017] as luopiskkoulk_5
      ,[luopisktunn_2017] as luopisktunn_5
      ,[luopiskjarj_2017] as luopiskjarj_5
      ,[luopiskmaak_2017] as luopiskmaak_5
      ,[ammopiskkoulk_2017] as ammopiskkoulk_5
      ,[ammopisktunn_2017] as ammopisktunn_5
      ,[ammopiskjarj_2017] as ammopiskjarj_5
      ,[ammopiskmaak_2017] as ammopiskmaak_5
      ,[amkopiskkoulk_2017] as amkopiskkoulk_5
      ,[amkopisktunn_2017] as amkopisktunn_5
      ,[amkopiskjarj_2017] as amkopiskjarj_5
      ,[amkopiskmaak_2017] as amkopiskmaak_5
      ,[yoopiskkoulk_2017] as yoopiskkoulk_5
      ,[yoopisktunn_2017] as yoopisktunn_5
      ,[yoopiskjarj_2017] as yoopiskjarj_5
      ,[yoopiskmaak_2017] as yoopiskmaak_5
      ,[monihaku_2017] as monihaku_5
      ,[ptoim1r4_2017] as ptoim1r4_5
      ,[amas_2017] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2018] as luopiskkoulk_6
      ,[luopisktunn_2018] as luopisktunn_6
      ,[luopiskjarj_2018] as luopiskjarj_6
      ,[luopiskmaak_2018] as luopiskmaak_6
      ,[ammopiskkoulk_2018] as ammopiskkoulk_6
      ,[ammopisktunn_2018] as ammopisktunn_6
      ,[ammopiskjarj_2018] as ammopiskjarj_6
      ,[ammopiskmaak_2018] as ammopiskmaak_6
      ,[amkopiskkoulk_2018] as amkopiskkoulk_6
      ,[amkopisktunn_2018] as amkopisktunn_6
      ,[amkopiskjarj_2018] as amkopiskjarj_6
      ,[amkopiskmaak_2018] as amkopiskmaak_6
      ,[yoopiskkoulk_2018] as yoopiskkoulk_6
      ,[yoopisktunn_2018] as yoopisktunn_6
      ,[yoopiskjarj_2018] as yoopiskjarj_6
      ,[yoopiskmaak_2018] as yoopiskmaak_6
      ,[monihaku_2018] as monihaku_6
      ,[ptoim1r4_2018] as ptoim1r4_6
      ,[amas_2018] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_20]

UNION ALL

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

      ,[luopiskkoulk_2014] as luopiskkoulk_1
      ,[luopisktunn_2014] as luopisktunn_1
      ,[luopiskjarj_2014] as luopiskjarj_1
      ,[luopiskmaak_2014] as luopiskmaak_1
      ,[ammopiskkoulk_2014] as ammopiskkoulk_1
      ,[ammopisktunn_2014] as ammopisktunn_1
      ,[ammopiskjarj_2014] as ammopiskjarj_1
      ,[ammopiskmaak_2014] as ammopiskmaak_1
      ,[amkopiskkoulk_2014] as amkopiskkoulk_1
      ,[amkopisktunn_2014] as amkopisktunn_1
      ,[amkopiskjarj_2014] as amkopiskjarj_1
      ,[amkopiskmaak_2014] as amkopiskmaak_1
      ,[yoopiskkoulk_2014] as yoopiskkoulk_1
      ,[yoopisktunn_2014] as yoopisktunn_1
      ,[yoopiskjarj_2014] as yoopiskjarj_1
      ,[yoopiskmaak_2014] as yoopiskmaak_1
      ,[monihaku_2014] as monihaku_1
      ,[ptoim1r4_2014] as [ptoim1r4_1]
      ,[amas_2014] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2015] as luopiskkoulk_2
      ,[luopisktunn_2015] as luopisktunn_2
      ,[luopiskjarj_2015] as luopiskjarj_2
      ,[luopiskmaak_2015] as luopiskmaak_2
      ,[ammopiskkoulk_2015] as ammopiskkoulk_2
      ,[ammopisktunn_2015] as ammopisktunn_2
      ,[ammopiskjarj_2015] as ammopiskjarj_2
      ,[ammopiskmaak_2015] as ammopiskmaak_2
      ,[amkopiskkoulk_2015] as amkopiskkoulk_2
      ,[amkopisktunn_2015] as amkopisktunn_2
      ,[amkopiskjarj_2015] as amkopiskjarj_2
      ,[amkopiskmaak_2015] as amkopiskmaak_2
      ,[yoopiskkoulk_2015] as yoopiskkoulk_2
      ,[yoopisktunn_2015] as yoopisktunn_2
      ,[yoopiskjarj_2015] as yoopiskjarj_2
      ,[yoopiskmaak_2015] as yoopiskmaak_2
      ,[monihaku_2015] as monihaku_2
      ,[ptoim1r4_2015] as ptoim1r4_2
      ,[amas_2015] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2016] as luopiskkoulk_3
      ,[luopisktunn_2016] as luopisktunn_3
      ,[luopiskjarj_2016] as luopiskjarj_3
      ,[luopiskmaak_2016] as luopiskmaak_3
      ,[ammopiskkoulk_2016] as ammopiskkoulk_3    
      ,[ammopisktunn_2016] as ammopisktunn_3
	  ,[ammopiskjarj_2016] as ammopiskjarj_3
      ,[ammopiskmaak_2016] as ammopiskmaak_3
      ,[amkopiskkoulk_2016] as amkopiskkoulk_3
      ,[amkopisktunn_2016] as amkopisktunn_3
      ,[amkopiskjarj_2016] as amkopiskjarj_3
      ,[amkopiskmaak_2016] as amkopiskmaak_3
      ,[yoopiskkoulk_2016] as yoopiskkoulk_3
      ,[yoopisktunn_2016] as yoopisktunn_3
      ,[yoopiskjarj_2016] as yoopiskjarj_3
      ,[yoopiskmaak_2016] as yoopiskmaak_3
      ,[monihaku_2016] as monihaku_3
      ,[ptoim1r4_2016] as ptoim1r4_3
      ,[amas_2016] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2017] as luopiskkoulk_4
      ,[luopisktunn_2017] as luopisktunn_4
      ,[luopiskjarj_2017] as luopiskjarj_4
      ,[luopiskmaak_2017] as luopiskmaak_4
      ,[ammopiskkoulk_2017] as ammopiskkoulk_4
      ,[ammopisktunn_2017] as ammopisktunn_4
      ,[ammopiskjarj_2017] as ammopiskjarj_4
      ,[ammopiskmaak_2017] as ammopiskmaak_4
      ,[amkopiskkoulk_2017] as amkopiskkoulk_4
      ,[amkopisktunn_2017] as amkopisktunn_4
      ,[amkopiskjarj_2017] as amkopiskjarj_4
      ,[amkopiskmaak_2017] as amkopiskmaak_4
      ,[yoopiskkoulk_2017] as yoopiskkoulk_4
      ,[yoopisktunn_2017] as yoopisktunn_4
      ,[yoopiskjarj_2017] as yoopiskjarj_4
      ,[yoopiskmaak_2017] as yoopiskmaak_4
      ,[monihaku_2017] as monihaku_4
      ,[ptoim1r4_2017] as ptoim1r4_4
      ,[amas_2017] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2018] as luopiskkoulk_5
      ,[luopisktunn_2018] as luopisktunn_5
      ,[luopiskjarj_2018] as luopiskjarj_5
      ,[luopiskmaak_2018] as luopiskmaak_5
      ,[ammopiskkoulk_2018] as ammopiskkoulk_5
      ,[ammopisktunn_2018] as ammopisktunn_5
      ,[ammopiskjarj_2018] as ammopiskjarj_5
      ,[ammopiskmaak_2018] as ammopiskmaak_5
      ,[amkopiskkoulk_2018] as amkopiskkoulk_5
      ,[amkopisktunn_2018] as amkopisktunn_5
      ,[amkopiskjarj_2018] as amkopiskjarj_5
      ,[amkopiskmaak_2018] as amkopiskmaak_5
      ,[yoopiskkoulk_2018] as yoopiskkoulk_5
      ,[yoopisktunn_2018] as yoopisktunn_5
      ,[yoopiskjarj_2018] as yoopiskjarj_5
      ,[yoopiskmaak_2018] as yoopiskmaak_5
      ,[monihaku_2018] as monihaku_5
      ,[ptoim1r4_2018] as ptoim1r4_5
      ,[amas_2018] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2019] as luopiskkoulk_6
      ,[luopisktunn_2019] as luopisktunn_6
      ,[luopiskjarj_2019] as luopiskjarj_6
      ,[luopiskmaak_2019] as luopiskmaak_6
      ,[ammopiskkoulk_2019] as ammopiskkoulk_6
      ,[ammopisktunn_2019] as ammopisktunn_6
      ,[ammopiskjarj_2019] as ammopiskjarj_6
      ,[ammopiskmaak_2019] as ammopiskmaak_6
      ,[amkopiskkoulk_2019] as amkopiskkoulk_6
      ,[amkopisktunn_2019] as amkopisktunn_6
      ,[amkopiskjarj_2019] as amkopiskjarj_6
      ,[amkopiskmaak_2019] as amkopiskmaak_6
      ,[yoopiskkoulk_2019] as yoopiskkoulk_6
      ,[yoopisktunn_2019] as yoopisktunn_6
      ,[yoopiskjarj_2019] as yoopiskjarj_6
      ,[yoopiskmaak_2019] as yoopiskmaak_6
      ,[monihaku_2019] as monihaku_6
      ,[ptoim1r4_2019] as ptoim1r4_6
      ,[amas_2019] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_21]

UNION ALL

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
      ,[monihaku_2015] as monihaku_1
      ,[ptoim1r4_2015] as [ptoim1r4_1]
      ,[amas_2015] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

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
      ,[monihaku_2016] as monihaku_2
      ,[ptoim1r4_2016] as ptoim1r4_2
      ,[amas_2016] as amas_2
	  ,[opintotuki_ulkom_2] = null

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
      ,[monihaku_2017] as monihaku_3
      ,[ptoim1r4_2017] as ptoim1r4_3
      ,[amas_2017] as amas_3
	  ,[opintotuki_ulkom_3] = null

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
      ,[monihaku_2018] as monihaku_4
      ,[ptoim1r4_2018] as ptoim1r4_4
      ,[amas_2018] as amas_4
	  ,[opintotuki_ulkom_4] = null

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
      ,[monihaku_2019] as monihaku_5
      ,[ptoim1r4_2019] as ptoim1r4_5
      ,[amas_2019] as amas_5
	  ,[opintotuki_ulkom_5] = null

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
      ,[monihaku_2020] as monihaku_6
      ,[ptoim1r4_2020] as ptoim1r4_6
      ,[amas_2020] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_22]

UNION ALL

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

      ,[luopiskkoulk_2016] as luopiskkoulk_1
      ,[luopisktunn_2016] as luopisktunn_1
      ,[luopiskjarj_2016] as luopiskjarj_1
      ,[luopiskmaak_2016] as luopiskmaak_1
      ,[ammopiskkoulk_2016] as ammopiskkoulk_1
      ,[ammopisktunn_2016] as ammopisktunn_1
      ,[ammopiskjarj_2016] as ammopiskjarj_1
      ,[ammopiskmaak_2016] as ammopiskmaak_1
      ,[amkopiskkoulk_2016] as amkopiskkoulk_1
      ,[amkopisktunn_2016] as amkopisktunn_1
      ,[amkopiskjarj_2016] as amkopiskjarj_1
      ,[amkopiskmaak_2016] as amkopiskmaak_1
      ,[yoopiskkoulk_2016] as yoopiskkoulk_1
      ,[yoopisktunn_2016] as yoopisktunn_1
      ,[yoopiskjarj_2016] as yoopiskjarj_1
      ,[yoopiskmaak_2016] as yoopiskmaak_1
      ,[monihaku_2016] as monihaku_1
      ,[ptoim1r4_2016] as [ptoim1r4_1]
      ,[amas_2016] as [amas_1]
	  ,[opintotuki_ulkom_1] = null

      ,[luopiskkoulk_2017] as luopiskkoulk_2
      ,[luopisktunn_2017] as luopisktunn_2
      ,[luopiskjarj_2017] as luopiskjarj_2
      ,[luopiskmaak_2017] as luopiskmaak_2
      ,[ammopiskkoulk_2017] as ammopiskkoulk_2
      ,[ammopisktunn_2017] as ammopisktunn_2
      ,[ammopiskjarj_2017] as ammopiskjarj_2
      ,[ammopiskmaak_2017] as ammopiskmaak_2
      ,[amkopiskkoulk_2017] as amkopiskkoulk_2
      ,[amkopisktunn_2017] as amkopisktunn_2
      ,[amkopiskjarj_2017] as amkopiskjarj_2
      ,[amkopiskmaak_2017] as amkopiskmaak_2
      ,[yoopiskkoulk_2017] as yoopiskkoulk_2
      ,[yoopisktunn_2017] as yoopisktunn_2
      ,[yoopiskjarj_2017] as yoopiskjarj_2
      ,[yoopiskmaak_2017] as yoopiskmaak_2
      ,[monihaku_2017] as monihaku_2
      ,[ptoim1r4_2017] as ptoim1r4_2
      ,[amas_2017] as amas_2
	  ,[opintotuki_ulkom_2] = null

      ,[luopiskkoulk_2018] as luopiskkoulk_3
      ,[luopisktunn_2018] as luopisktunn_3
      ,[luopiskjarj_2018] as luopiskjarj_3
      ,[luopiskmaak_2018] as luopiskmaak_3
      ,[ammopiskkoulk_2018] as ammopiskkoulk_3    
      ,[ammopisktunn_2018] as ammopisktunn_3
	  ,[ammopiskjarj_2018] as ammopiskjarj_3
      ,[ammopiskmaak_2018] as ammopiskmaak_3
      ,[amkopiskkoulk_2018] as amkopiskkoulk_3
      ,[amkopisktunn_2018] as amkopisktunn_3
      ,[amkopiskjarj_2018] as amkopiskjarj_3
      ,[amkopiskmaak_2018] as amkopiskmaak_3
      ,[yoopiskkoulk_2018] as yoopiskkoulk_3
      ,[yoopisktunn_2018] as yoopisktunn_3
      ,[yoopiskjarj_2018] as yoopiskjarj_3
      ,[yoopiskmaak_2018] as yoopiskmaak_3
      ,[monihaku_2018] as monihaku_3
      ,[ptoim1r4_2018] as ptoim1r4_3
      ,[amas_2018] as amas_3
	  ,[opintotuki_ulkom_3] = null

      ,[luopiskkoulk_2019] as luopiskkoulk_4
      ,[luopisktunn_2019] as luopisktunn_4
      ,[luopiskjarj_2019] as luopiskjarj_4
      ,[luopiskmaak_2019] as luopiskmaak_4
      ,[ammopiskkoulk_2019] as ammopiskkoulk_4
      ,[ammopisktunn_2019] as ammopisktunn_4
      ,[ammopiskjarj_2019] as ammopiskjarj_4
      ,[ammopiskmaak_2019] as ammopiskmaak_4
      ,[amkopiskkoulk_2019] as amkopiskkoulk_4
      ,[amkopisktunn_2019] as amkopisktunn_4
      ,[amkopiskjarj_2019] as amkopiskjarj_4
      ,[amkopiskmaak_2019] as amkopiskmaak_4
      ,[yoopiskkoulk_2019] as yoopiskkoulk_4
      ,[yoopisktunn_2019] as yoopisktunn_4
      ,[yoopiskjarj_2019] as yoopiskjarj_4
      ,[yoopiskmaak_2019] as yoopiskmaak_4
      ,[monihaku_2019] as monihaku_4
      ,[ptoim1r4_2019] as ptoim1r4_4
      ,[amas_2019] as amas_4
	  ,[opintotuki_ulkom_4] = null

      ,[luopiskkoulk_2020] as luopiskkoulk_5
      ,[luopisktunn_2020] as luopisktunn_5
      ,[luopiskjarj_2020] as luopiskjarj_5
      ,[luopiskmaak_2020] as luopiskmaak_5
      ,[ammopiskkoulk_2020] as ammopiskkoulk_5
      ,[ammopisktunn_2020] as ammopisktunn_5
      ,[ammopiskjarj_2020] as ammopiskjarj_5
      ,[ammopiskmaak_2020] as ammopiskmaak_5
      ,[amkopiskkoulk_2020] as amkopiskkoulk_5
      ,[amkopisktunn_2020] as amkopisktunn_5
      ,[amkopiskjarj_2020] as amkopiskjarj_5
      ,[amkopiskmaak_2020] as amkopiskmaak_5
      ,[yoopiskkoulk_2020] as yoopiskkoulk_5
      ,[yoopisktunn_2020] as yoopisktunn_5
      ,[yoopiskjarj_2020] as yoopiskjarj_5
      ,[yoopiskmaak_2020] as yoopiskmaak_5
      ,[monihaku_2020] as monihaku_5
      ,[ptoim1r4_2020] as ptoim1r4_5
      ,[amas_2020] as amas_5
	  ,[opintotuki_ulkom_5] = null

      ,[luopiskkoulk_2021] as luopiskkoulk_6
      ,[luopisktunn_2021] as luopisktunn_6
      ,[luopiskjarj_2021] as luopiskjarj_6
      ,[luopiskmaak_2021] as luopiskmaak_6
      ,[ammopiskkoulk_2021] as ammopiskkoulk_6
      ,[ammopisktunn_2021] as ammopisktunn_6
      ,[ammopiskjarj_2021] as ammopiskjarj_6
      ,[ammopiskmaak_2021] as ammopiskmaak_6
      ,[amkopiskkoulk_2021] as amkopiskkoulk_6
      ,[amkopisktunn_2021] as amkopisktunn_6
      ,[amkopiskjarj_2021] as amkopiskjarj_6
      ,[amkopiskmaak_2021] as amkopiskmaak_6
      ,[yoopiskkoulk_2021] as yoopiskkoulk_6
      ,[yoopisktunn_2021] as yoopisktunn_6
      ,[yoopiskjarj_2021] as yoopiskjarj_6
      ,[yoopiskmaak_2021] as yoopiskmaak_6
      ,[monihaku_2021] as monihaku_6
      ,[ptoim1r4_2021] as ptoim1r4_6
      ,[amas_2021] as amas_6
	  ,[opintotuki_ulkom_6] = null

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_23]

UNION ALL

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

      ,[luopiskkoulk_2017] as luopiskkoulk_1
      ,[luopisktunn_2017] as luopisktunn_1
      ,[luopiskjarj_2017] as luopiskjarj_1
      ,[luopiskmaak_2017] as luopiskmaak_1
      ,[ammopiskkoulk_2017] as ammopiskkoulk_1
      ,[ammopisktunn_2017] as ammopisktunn_1
      ,[ammopiskjarj_2017] as ammopiskjarj_1
      ,[ammopiskmaak_2017] as ammopiskmaak_1
      ,[amkopiskkoulk_2017] as amkopiskkoulk_1
      ,[amkopisktunn_2017] as amkopisktunn_1
      ,[amkopiskjarj_2017] as amkopiskjarj_1
      ,[amkopiskmaak_2017] as amkopiskmaak_1
      ,[yoopiskkoulk_2017] as yoopiskkoulk_1
      ,[yoopisktunn_2017] as yoopisktunn_1
      ,[yoopiskjarj_2017] as yoopiskjarj_1
      ,[yoopiskmaak_2017] as yoopiskmaak_1
      ,[monihaku_2017] as monihaku_1
      ,[ptoim1r4_2017] as ptoim1r4_1
      ,[amas_2017] as amas_1
	  ,[opintotuki_ulkom_2017] as [opintotuki_ulkom_1]

      ,[luopiskkoulk_2018] as luopiskkoulk_2
      ,[luopisktunn_2018] as luopisktunn_2
      ,[luopiskjarj_2018] as luopiskjarj_2
      ,[luopiskmaak_2018] as luopiskmaak_2
      ,[ammopiskkoulk_2018] as ammopiskkoulk_2    
      ,[ammopisktunn_2018] as ammopisktunn_2
	  ,[ammopiskjarj_2018] as ammopiskjarj_2
      ,[ammopiskmaak_2018] as ammopiskmaak_2
      ,[amkopiskkoulk_2018] as amkopiskkoulk_2
      ,[amkopisktunn_2018] as amkopisktunn_2
      ,[amkopiskjarj_2018] as amkopiskjarj_2
      ,[amkopiskmaak_2018] as amkopiskmaak_2
      ,[yoopiskkoulk_2018] as yoopiskkoulk_2
      ,[yoopisktunn_2018] as yoopisktunn_2
      ,[yoopiskjarj_2018] as yoopiskjarj_2
      ,[yoopiskmaak_2018] as yoopiskmaak_2
      ,[monihaku_2018] as monihaku_2
      ,[ptoim1r4_2018] as ptoim1r4_2
      ,[amas_2018] as amas_2
	  ,[opintotuki_ulkom_2018] as [opintotuki_ulkom_2]

      ,[luopiskkoulk_2019] as luopiskkoulk_3
      ,[luopisktunn_2019] as luopisktunn_3
      ,[luopiskjarj_2019] as luopiskjarj_3
      ,[luopiskmaak_2019] as luopiskmaak_3
      ,[ammopiskkoulk_2019] as ammopiskkoulk_3
      ,[ammopisktunn_2019] as ammopisktunn_3
      ,[ammopiskjarj_2019] as ammopiskjarj_3
      ,[ammopiskmaak_2019] as ammopiskmaak_3
      ,[amkopiskkoulk_2019] as amkopiskkoulk_3
      ,[amkopisktunn_2019] as amkopisktunn_3
      ,[amkopiskjarj_2019] as amkopiskjarj_3
      ,[amkopiskmaak_2019] as amkopiskmaak_3
      ,[yoopiskkoulk_2019] as yoopiskkoulk_3
      ,[yoopisktunn_2019] as yoopisktunn_3
      ,[yoopiskjarj_2019] as yoopiskjarj_3
      ,[yoopiskmaak_2019] as yoopiskmaak_3
      ,[monihaku_2019] as monihaku_3
      ,[ptoim1r4_2019] as ptoim1r4_3
      ,[amas_2019] as amas_3
	  ,[opintotuki_ulkom_2019] as [opintotuki_ulkom_3]

      ,[luopiskkoulk_2020] as luopiskkoulk_4
      ,[luopisktunn_2020] as luopisktunn_4
      ,[luopiskjarj_2020] as luopiskjarj_4
      ,[luopiskmaak_2020] as luopiskmaak_4
      ,[ammopiskkoulk_2020] as ammopiskkoulk_4
      ,[ammopisktunn_2020] as ammopisktunn_4
      ,[ammopiskjarj_2020] as ammopiskjarj_4
      ,[ammopiskmaak_2020] as ammopiskmaak_4
      ,[amkopiskkoulk_2020] as amkopiskkoulk_4
      ,[amkopisktunn_2020] as amkopisktunn_4
      ,[amkopiskjarj_2020] as amkopiskjarj_4
      ,[amkopiskmaak_2020] as amkopiskmaak_4
      ,[yoopiskkoulk_2020] as yoopiskkoulk_4
      ,[yoopisktunn_2020] as yoopisktunn_4
      ,[yoopiskjarj_2020] as yoopiskjarj_4
      ,[yoopiskmaak_2020] as yoopiskmaak_4
      ,[monihaku_2020] as monihaku_4
      ,[ptoim1r4_2020] as ptoim1r4_4
      ,[amas_2020] as amas_4
	  ,[opintotuki_ulkom_2020] as [opintotuki_ulkom_4]

      ,[luopiskkoulk_2021] as luopiskkoulk_5
      ,[luopisktunn_2021] as luopisktunn_5
      ,[luopiskjarj_2021] as luopiskjarj_5
      ,[luopiskmaak_2021] as luopiskmaak_5
      ,[ammopiskkoulk_2021] as ammopiskkoulk_5
      ,[ammopisktunn_2021] as ammopisktunn_5
      ,[ammopiskjarj_2021] as ammopiskjarj_5
      ,[ammopiskmaak_2021] as ammopiskmaak_5
      ,[amkopiskkoulk_2021] as amkopiskkoulk_5
      ,[amkopisktunn_2021] as amkopisktunn_5
      ,[amkopiskjarj_2021] as amkopiskjarj_5
      ,[amkopiskmaak_2021] as amkopiskmaak_5
      ,[yoopiskkoulk_2021] as yoopiskkoulk_5
      ,[yoopisktunn_2021] as yoopisktunn_5
      ,[yoopiskjarj_2021] as yoopiskjarj_5
      ,[yoopiskmaak_2021] as yoopiskmaak_5
      ,[monihaku_2021] as monihaku_5
      ,[ptoim1r4_2021] as ptoim1r4_5
      ,[amas_2021] as amas_5
	  ,[opintotuki_ulkom_2021] as [opintotuki_ulkom_5]

	  ,[luopiskkoulk_2022] as luopiskkoulk_6
      ,[luopisktunn_2022] as luopisktunn_6
      ,[luopiskjarj_2022] as luopiskjarj_6
      ,[luopiskmaak_2022] as luopiskmaak_6
      ,[ammopiskkoulk_2022] as ammopiskkoulk_6
      ,[ammopisktunn_2022] as ammopisktunn_6
      ,[ammopiskjarj_2022] as ammopiskjarj_6
      ,[ammopiskmaak_2022] as ammopiskmaak_6
      ,[amkopiskkoulk_2022] as amkopiskkoulk_6
      ,[amkopisktunn_2022] as amkopisktunn_6
      ,[amkopiskjarj_2022] as amkopiskjarj_6
      ,[amkopiskmaak_2022] as amkopiskmaak_6
      ,[yoopiskkoulk_2022] as yoopiskkoulk_6
      ,[yoopisktunn_2022] as yoopisktunn_6
      ,[yoopiskjarj_2022] as yoopiskjarj_6
      ,[yoopiskmaak_2022] as yoopiskmaak_6
      ,[monihaku_2022] as monihaku_6
      ,[ptoim1r4_2022] as ptoim1r4_6
      ,[amas_2022] as amas_6
	  ,[opintotuki_ulkom_2022] as [opintotuki_ulkom_6]

	  ,[lkm]
	  ,[pohjkoul]
      ,[tietolahde]='K3_13_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_13_sopv_24]

--lisää kopio ja korvaa siihen tietolahde, tauluviite sekä vuodet suurimmasta alkaen +1v

) Aineistot

GO


