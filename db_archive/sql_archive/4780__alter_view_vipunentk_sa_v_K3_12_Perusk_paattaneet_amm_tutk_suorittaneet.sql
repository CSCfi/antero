USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_K3_12_Perusk_paattaneet_amm_tutk_suorittaneet]    Script Date: 19.8.2021 0:09:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/* LUE TÄMÄ!!!
1. KOPIOI KOLME ALINTA SELECTIÄ JA MUUTA NIIHIN SUURIMMASTA VUODESTA ALKAEN "vvvv -> vvvv+1" SEKÄ "sopv_vv -> sopv_vv+1" 
2. KORVAA MUOKATULLA PÄTKÄLLÄ KAKSI ALINTA SELECTIÄ
*/

ALTER VIEW [dbo].[v_K3_12_Perusk_paattaneet_amm_tutk_suorittaneet] AS

SELECT [tilv]
      ,[tilv_date]
      ,(case when [tutkryh] is NULL then '' else [tutkryh] end ) as [tutkryh]
      ,(case when [suorv] is NULL then '' else [suorv] end ) as [suorv]
	  ,(case when [suorlk] is NULL then '' else [suorlk] end ) as [suorlk]
	  ,(case when [sp] is NULL then '' else [sp] end ) as [sp]
      ,(case when [syntv]='19XX' or [syntv] is NULL then '' else [syntv] end ) as [syntv]
	  ,(case when [aikielir1] is NULL then '' else [aikielir1] end ) as [aikielir1]
      ,(case 
			when [tutkaskun]='427' then '' 
			when [tutkaskun]='946' and (tilv= '2009' or tilv='2010') then '945'
			when [tutkaskun]='198' then ''
			when [tutkaskun]='999' then ''
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
			when [luopisktunn_1] = '00000' then '' 
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
			when [amkopisktunn_1] = '00000' then ''
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
			when [yoopisktunn_1] = '00000' then ''
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
      ,(case when [luopiskkoulk_2] is NULL then '' else [luopiskkoulk_2] end ) as [luopiskkoulk_2]
	  ,(case 
			when [luopisktunn_2] = 'BBBBB' then ''
			when [luopisktunn_2] = '99999' then ''
			when [luopisktunn_2] = '00000' then ''
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
			when [amkopisktunn_2] = '00000' then ''
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
			when [yoopisktunn_2] = '00000' then ''
			when [yoopisktunn_2] is NULL then '' else [yoopisktunn_2] end ) as [yoopisktunn_2]
	  ,(case when [yoopiskjarj_2] is NULL then '' else [yoopiskjarj_2] end ) as [yoopiskjarj_2]
	  ,(case 
			when [yoopiskmaak_2] = '99' then ''
			when [yoopiskmaak_2] is NULL then '' 
			else [yoopiskmaak_2] 
		end) as [yoopiskmaak_2]
      ,coalesce(nullif([monihaku_2], ''), '90') as [monihaku_2]
	  ,(case when [ptoim1r4_2] is NULL then '' else [ptoim1r4_2] end ) as [ptoim1r4_2]
	  ,(case when [amas_2] is NULL then '' else [amas_2] end ) as [amas_2]
      ,[lkm]
	  ,(case when [pohjkoul] is NULL then '' else [pohjkoul] end ) as [pohjkoul]
      ,[tietolahde]
      ,[rivinumero]
FROM (

--1v sijoittuminen
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,  
luopiskkoulk_2008 as luopiskkoulk_1,
luopisktunn_2008 AS luopisktunn_1,
luopiskjarj_2008 as luopiskjarj_1, 
luopiskmaak_2008 AS luopiskmaak_1, 
ammopiskkoulk_2008 as ammopiskkoulk_1, 
ammopisktunn_2008 AS ammopisktunn_1,
ammopiskjarj_2008 as ammopiskjarj_1, 
ammopiskmaak_2008 as ammopiskmaak_1, 
amkopiskkoulk_2008 as amkopiskkoulk_1, 
amkopisktunn_2008 AS amkopisktunn_1,
amkopiskjarj_2008 as amkopiskjarj_1,
amkopiskmaak_2008 AS amkopiskmaak_1, 
yoopiskkoulk_2008 as yoopiskkoulk_1, 
yoopisktunn_2008 AS yoopisktunn_1,
yoopiskjarj_2008 as yoopiskjarj_1,
yoopiskmaak_2008 AS yoopiskmaak_1,
monihaku_2008 as monihaku_1, 
ptoim1r4_2008 as ptoim1r4_1, 
amas_2008 as amas_1,  
luopiskkoulk_2009 as luopiskkoulk_2,
luopisktunn_2009 AS luopisktunn_2,
luopiskjarj_2009 as luopiskjarj_2, 
luopiskmaak_2009 AS luopiskmaak_2, 
ammopiskkoulk_2009 as ammopiskkoulk_2, 
ammopisktunn_2009 AS ammopisktunn_2,
ammopiskjarj_2009 as ammopiskjarj_2, 
ammopiskmaak_2009 as ammopiskmaak_2, 
amkopiskkoulk_2009 as amkopiskkoulk_2, 
amkopisktunn_2009 AS amkopisktunn_2,
amkopiskjarj_2009 as amkopiskjarj_2,
amkopiskmaak_2009 AS amkopiskmaak_2, 
yoopiskkoulk_2009 as yoopiskkoulk_2, 
yoopisktunn_2009 AS yoopisktunn_2,
yoopiskjarj_2009 as yoopiskjarj_2,
yoopiskmaak_2009 AS yoopiskmaak_2,
monihaku_2009 as monihaku_2, 
ptoim1r4_2009 as ptoim1r4_2, 
amas_2009 as amas_2, 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_11',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_11]
where suorv = '2008' and (suorlk = '1' or suorlk= '2')
 
UNION ALL

--1v sijoittuminen 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,  
luopiskkoulk_2009 as luopiskkoulk_1,
luopisktunn_2009 AS luopisktunn_1,
luopiskjarj_2009 as luopiskjarj_1, 
luopiskmaak_2009 AS luopiskmaak_1, 
ammopiskkoulk_2009 as ammopiskkoulk__1, 
ammopisktunn_2009 AS ammopisktunn_1,
ammopiskjarj_2009 as ammopiskjarj_1, 
ammopiskmaak_2009 as ammopiskmaak_1, 
amkopiskkoulk_2009 as amkopiskkoulk_1, 
amkopisktunn_2009 AS amkopisktunn_1,
amkopiskjarj_2009 as amkopiskjarj_1,
amkopiskmaak_2009 AS amkopiskmaak_1, 
yoopiskkoulk_2009 as yoopiskkoulk_1, 
yoopisktunn_2009 AS yoopisktunn_1,
yoopiskjarj_2009 as yoopiskjarj_1,
yoopiskmaak_2009 AS yoopiskmaak_1,
monihaku_2009 as monihaku_1, 
ptoim1r4_2009 as ptoim1r4_1, 
amas_2009 as amas_1,  
luopiskkoulk_2010 as luopiskkoulk_2,
luopisktunn_2010 AS luopisktunn_2,
luopiskjarj_2010 as luopiskjarj_2, 
luopiskmaak_2010 AS luopiskmaak_2, 
ammopiskkoulk_2010 as ammopiskkoulk_2, 
ammopisktunn_2010 AS ammopisktunn_2,
ammopiskjarj_2010 as ammopiskjarj_2, 
ammopiskmaak_2010 as ammopiskmaak_2, 
amkopiskkoulk_2010 as amkopiskkoulk_2, 
amkopisktunn_2010 AS amkopisktunn_2,
amkopiskjarj_2010 as amkopiskjarj_2,
amkopiskmaak_2010 AS amkopiskmaak_2, 
yoopiskkoulk_2010 as yoopiskkoulk_2, 
yoopisktunn_2010 AS yoopisktunn_2,
yoopiskjarj_2010 as yoopiskjarj_2,
yoopiskmaak_2010 AS yoopiskmaak_2,
monihaku_2010 as monihaku_2, 
ptoim1r4_2010 as ptoim1r4_2, 
amas_2010 as amas_2, 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_12',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_12]
where suorv = '2009' and (suorlk = '1' or suorlk= '2')

UNION ALL

--1v sijoittuminen 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,  
luopiskkoulk_2010 as luopiskkoulk_1,
luopisktunn_2010 AS luopisktunn_1,
luopiskjarj_2010 as luopiskjarj_1, 
luopiskmaak_2010 AS luopiskmaak_1, 
ammopiskkoulk_2010 as ammopiskkoulk__1, 
ammopisktunn_2010 AS ammopisktunn_1,
ammopiskjarj_2010 as ammopiskjarj_1, 
ammopiskmaak_2010 as ammopiskmaak_1, 
amkopiskkoulk_2010 as amkopiskkoulk_1, 
amkopisktunn_2010 AS amkopisktunn_1,
amkopiskjarj_2010 as amkopiskjarj_1,
amkopiskmaak_2010 AS amkopiskmaak_1, 
yoopiskkoulk_2010 as yoopiskkoulk_1, 
yoopisktunn_2010 AS yoopisktunn_1,
yoopiskjarj_2010 as yoopiskjarj_1,
yoopiskmaak_2010 AS yoopiskmaak_1,
monihaku_2010 as monihaku_1, 
ptoim1r4_2010 as ptoim1r4_1, 
amas_2010 as amas_1,  
luopiskkoulk_2011 as luopiskkoulk_2,
luopisktunn_2011 AS luopisktunn_2,
luopiskjarj_2011 as luopiskjarj_2, 
luopiskmaak_2011 AS luopiskmaak_2, 
ammopiskkoulk_2011 as ammopiskkoulk_2, 
ammopisktunn_2011 AS ammopisktunn_2,
ammopiskjarj_2011 as ammopiskjarj_2, 
ammopiskmaak_2011 as ammopiskmaak_2, 
amkopiskkoulk_2011 as amkopiskkoulk_2, 
amkopisktunn_2011 AS amkopisktunn_2,
amkopiskjarj_2011 as amkopiskjarj_2,
amkopiskmaak_2011 AS amkopiskmaak_2, 
yoopiskkoulk_2011 as yoopiskkoulk_2, 
yoopisktunn_2011 AS yoopisktunn_2,
yoopiskjarj_2011 as yoopiskjarj_2,
yoopiskmaak_2011 AS yoopiskmaak_2,
monihaku_2011 as monihaku_2, 
ptoim1r4_2011 as ptoim1r4_2, 
amas_2011 as amas_2, 
lkm, 
pohjkoul,
tietolahde ='K3_12_sopv_13',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_13]
where suorv = '2010' and (suorlk = '1' or suorlk= '2')

UNION ALL

--1v sijoittuminen 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,  
luopiskkoulk_2011 as luopiskkoulk_1,
luopisktunn_2011 AS luopisktunn_1,
luopiskjarj_2011 as luopiskjarj_1, 
luopiskmaak_2011 AS luopiskmaak_1, 
ammopiskkoulk_2011 as ammopiskkoulk__1, 
ammopisktunn_2011 AS ammopisktunn_1,
ammopiskjarj_2011 as ammopiskjarj_1, 
ammopiskmaak_2011 as ammopiskmaak_1, 
amkopiskkoulk_2011 as amkopiskkoulk_1, 
amkopisktunn_2011 AS amkopisktunn_1,
amkopiskjarj_2011 as amkopiskjarj_1,
amkopiskmaak_2011 AS amkopiskmaak_1, 
yoopiskkoulk_2011 as yoopiskkoulk_1, 
yoopisktunn_2011 AS yoopisktunn_1,
yoopiskjarj_2011 as yoopiskjarj_1,
yoopiskmaak_2011 AS yoopiskmaak_1,
monihaku_2011 as monihaku_1, 
ptoim1r4_2011 as ptoim1r4_1, 
amas_2011 as amas_1,  
luopiskkoulk_2012 as luopiskkoulk_2,
luopisktunn_2012 AS luopisktunn_2,
luopiskjarj_2012 as luopiskjarj_2, 
luopiskmaak_2012 AS luopiskmaak_2, 
ammopiskkoulk_2012 as ammopiskkoulk_2, 
ammopisktunn_2012 AS ammopisktunn_2,
ammopiskjarj_2012 as ammopiskjarj_2, 
ammopiskmaak_2012 as ammopiskmaak_2, 
amkopiskkoulk_2012 as amkopiskkoulk_2, 
amkopisktunn_2012 AS amkopisktunn_2,
amkopiskjarj_2012 as amkopiskjarj_2,
amkopiskmaak_2012 AS amkopiskmaak_2, 
yoopiskkoulk_2012 as yoopiskkoulk_2, 
yoopisktunn_2012 AS yoopisktunn_2,
yoopiskjarj_2012 as yoopiskjarj_2,
yoopiskmaak_2012 AS yoopiskmaak_2,
monihaku_2012 as monihaku_2, 
ptoim1r4_2012 as ptoim1r4_2, 
amas_2012 as amas_2, 
lkm, 
pohjkoul,
tietolahde ='K3_12_sopv_14',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_14]
where suorv = '2011' and (suorlk = '1' or suorlk= '2')

UNION ALL

--1v sijoittuminen
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,  
luopiskkoulk_2012 as luopiskkoulk_1,
luopisktunn_2012 AS luopisktunn_1,
luopiskjarj_2012 as luopiskjarj_1, 
luopiskmaak_2012 AS luopiskmaak_1, 
ammopiskkoulk_2012 as ammopiskkoulk__1, 
ammopisktunn_2012 AS ammopisktunn_1,
ammopiskjarj_2012 as ammopiskjarj_1, 
ammopiskmaak_2012 as ammopiskmaak_1, 
amkopiskkoulk_2012 as amkopiskkoulk_1, 
amkopisktunn_2012 AS amkopisktunn_1,
amkopiskjarj_2012 as amkopiskjarj_1,
amkopiskmaak_2012 AS amkopiskmaak_1, 
yoopiskkoulk_2012 as yoopiskkoulk_1, 
yoopisktunn_2012 AS yoopisktunn_1,
yoopiskjarj_2012 as yoopiskjarj_1,
yoopiskmaak_2012 AS yoopiskmaak_1,
monihaku_2012 as monihaku_1, 
ptoim1r4_2012 as ptoim1r4_1, 
amas_2012 as amas_1,  
luopiskkoulk_2013 as luopiskkoulk_2,
luopisktunn_2013 AS luopisktunn_2,
luopiskjarj_2013 as luopiskjarj_2, 
luopiskmaak_2013 AS luopiskmaak_2, 
ammopiskkoulk_2013 as ammopiskkoulk_2, 
ammopisktunn_2013 AS ammopisktunn_2,
ammopiskjarj_2013 as ammopiskjarj_2, 
ammopiskmaak_2013 as ammopiskmaak_2, 
amkopiskkoulk_2013 as amkopiskkoulk_2, 
amkopisktunn_2013 AS amkopisktunn_2,
amkopiskjarj_2013 as amkopiskjarj_2,
amkopiskmaak_2013 AS amkopiskmaak_2, 
yoopiskkoulk_2013 as yoopiskkoulk_2, 
yoopisktunn_2013 AS yoopisktunn_2,
yoopiskjarj_2013 as yoopiskjarj_2,
yoopiskmaak_2013 AS yoopiskmaak_2,
monihaku_2013 as monihaku_2, 
ptoim1r4_2013 as ptoim1r4_2, 
amas_2013 as amas_2, 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_15',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_15]
where suorv = '2012' and (suorlk = '1' or suorlk= '2')

UNION ALL

--1v sijoittuminen
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,  
luopiskkoulk_2013 as luopiskkoulk_1,
luopisktunn_2013 AS luopisktunn_1,
luopiskjarj_2013 as luopiskjarj_1, 
luopiskmaak_2013 AS luopiskmaak_1, 
ammopiskkoulk_2013 as ammopiskkoulk__1, 
ammopisktunn_2013 AS ammopisktunn_1,
ammopiskjarj_2013 as ammopiskjarj_1, 
ammopiskmaak_2013 as ammopiskmaak_1, 
amkopiskkoulk_2013 as amkopiskkoulk_1, 
amkopisktunn_2013 AS amkopisktunn_1,
amkopiskjarj_2013 as amkopiskjarj_1,
amkopiskmaak_2013 AS amkopiskmaak_1, 
yoopiskkoulk_2013 as yoopiskkoulk_1, 
yoopisktunn_2013 AS yoopisktunn_1,
yoopiskjarj_2013 as yoopiskjarj_1,
yoopiskmaak_2013 AS yoopiskmaak_1,
monihaku_2013 as monihaku_1, 
ptoim1r4_2013 as ptoim1r4_1, 
amas_2013 as amas_1,  
luopiskkoulk_2014 as luopiskkoulk_2,
luopisktunn_2014 AS luopisktunn_2,
luopiskjarj_2014 as luopiskjarj_2, 
luopiskmaak_2014 AS luopiskmaak_2, 
ammopiskkoulk_2014 as ammopiskkoulk_2, 
ammopisktunn_2014 AS ammopisktunn_2,
ammopiskjarj_2014 as ammopiskjarj_2, 
ammopiskmaak_2014 as ammopiskmaak_2, 
amkopiskkoulk_2014 as amkopiskkoulk_2, 
amkopisktunn_2014 AS amkopisktunn_2,
amkopiskjarj_2014 as amkopiskjarj_2,
amkopiskmaak_2014 AS amkopiskmaak_2, 
yoopiskkoulk_2014 as yoopiskkoulk_2, 
yoopisktunn_2014 AS yoopisktunn_2,
yoopiskjarj_2014 as yoopiskjarj_2,
yoopiskmaak_2014 AS yoopiskmaak_2,
monihaku_2014 as monihaku_2, 
ptoim1r4_2014 as ptoim1r4_2, 
amas_2014 as amas_2, 
lkm, 
pohjkoul,
tietolahde ='K3_12_sopv_16',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_16] 
where suorv = '2013' and (suorlk = '1' or suorlk= '2')

UNION ALL

--1v sijoittuminen 
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,  
luopiskkoulk_2014 as luopiskkoulk_1,
luopisktunn_2014 AS luopisktunn_1,
luopiskjarj_2014 as luopiskjarj_1, 
luopiskmaak_2014 AS luopiskmaak_1, 
ammopiskkoulk_2014 as ammopiskkoulk__1, 
ammopisktunn_2014 AS ammopisktunn_1,
ammopiskjarj_2014 as ammopiskjarj_1, 
ammopiskmaak_2014 as ammopiskmaak_1, 
amkopiskkoulk_2014 as amkopiskkoulk_1, 
amkopisktunn_2014 AS amkopisktunn_1,
amkopiskjarj_2014 as amkopiskjarj_1,
amkopiskmaak_2014 AS amkopiskmaak_1, 
yoopiskkoulk_2014 as yoopiskkoulk_1, 
yoopisktunn_2014 AS yoopisktunn_1,
yoopiskjarj_2014 as yoopiskjarj_1,
yoopiskmaak_2014 AS yoopiskmaak_1,
monihaku_2014 as monihaku_1, 
ptoim1r4_2014 as ptoim1r4_1, 
amas_2014 as amas_1,  
luopiskkoulk_2015 as luopiskkoulk_2,
luopisktunn_2015 AS luopisktunn_2,
luopiskjarj_2015 as luopiskjarj_2, 
luopiskmaak_2015 AS luopiskmaak_2, 
ammopiskkoulk_2015 as ammopiskkoulk_2, 
ammopisktunn_2015 AS ammopisktunn_2,
ammopiskjarj_2015 as ammopiskjarj_2, 
ammopiskmaak_2015 as ammopiskmaak_2, 
amkopiskkoulk_2015 as amkopiskkoulk_2, 
amkopisktunn_2015 AS amkopisktunn_2,
amkopiskjarj_2015 as amkopiskjarj_2,
amkopiskmaak_2015 AS amkopiskmaak_2, 
yoopiskkoulk_2015 as yoopiskkoulk_2, 
yoopisktunn_2015 AS yoopisktunn_2,
yoopiskjarj_2015 as yoopiskjarj_2,
yoopiskmaak_2015 AS yoopiskmaak_2,
monihaku_2015 as monihaku_2, 
ptoim1r4_2015 as ptoim1r4_2, 
amas_2015 as amas_2, 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_17',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_17] 
where suorv = '2014' and (suorlk = '1' or suorlk= '2')

UNION ALL

--1v sijoittuminen
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,  
luopiskkoulk_2015 as luopiskkoulk_1,
luopisktunn_2015 AS luopisktunn_1,
luopiskjarj_2015 as luopiskjarj_1, 
luopiskmaak_2015 AS luopiskmaak_1, 
ammopiskkoulk_2015 as ammopiskkoulk__1, 
ammopisktunn_2015 AS ammopisktunn_1,
ammopiskjarj_2015 as ammopiskjarj_1, 
ammopiskmaak_2015 as ammopiskmaak_1, 
amkopiskkoulk_2015 as amkopiskkoulk_1, 
amkopisktunn_2015 AS amkopisktunn_1,
amkopiskjarj_2015 as amkopiskjarj_1,
amkopiskmaak_2015 AS amkopiskmaak_1, 
yoopiskkoulk_2015 as yoopiskkoulk_1, 
yoopisktunn_2015 AS yoopisktunn_1,
yoopiskjarj_2015 as yoopiskjarj_1,
yoopiskmaak_2015 AS yoopiskmaak_1,
monihaku_2015 as monihaku_1, 
ptoim1r4_2015 as ptoim1r4_1, 
amas_2015 as amas_1,  
luopiskkoulk_2016 as luopiskkoulk_2,
luopisktunn_2016 AS luopisktunn_2,
luopiskjarj_2016 as luopiskjarj_2, 
luopiskmaak_2016 AS luopiskmaak_2, 
ammopiskkoulk_2016 as ammopiskkoulk_2, 
ammopisktunn_2016 AS ammopisktunn_2,
ammopiskjarj_2016 as ammopiskjarj_2, 
ammopiskmaak_2016 as ammopiskmaak_2, 
amkopiskkoulk_2016 as amkopiskkoulk_2, 
amkopisktunn_2016 AS amkopisktunn_2,
amkopiskjarj_2016 as amkopiskjarj_2,
amkopiskmaak_2016 AS amkopiskmaak_2, 
yoopiskkoulk_2016 as yoopiskkoulk_2, 
yoopisktunn_2016 AS yoopisktunn_2,
yoopiskjarj_2016 as yoopiskjarj_2,
yoopiskmaak_2016 AS yoopiskmaak_2,
monihaku_2016 as monihaku_2, 
ptoim1r4_2016 as ptoim1r4_2, 
amas_2016 as amas_2, 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_18',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_18] 
WHERE suorv = '2015 ' and (suorlk = '1' or suorlk= '2')

UNION ALL

--1v sijoittuminen
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav,
aikoul,
tutkmaak,  
luopiskkoulk_2016 as luopiskkoulk_1,
luopisktunn_2016 AS luopisktunn_1,
luopiskjarj_2016 as luopiskjarj_1, 
luopiskmaak_2016 AS luopiskmaak_1, 
ammopiskkoulk_2016 as ammopiskkoulk__1, 
ammopisktunn_2016 AS ammopisktunn_1,
ammopiskjarj_2016 as ammopiskjarj_1, 
ammopiskmaak_2016 as ammopiskmaak_1, 
amkopiskkoulk_2016 as amkopiskkoulk_1, 
amkopisktunn_2016 AS amkopisktunn_1,
amkopiskjarj_2016 as amkopiskjarj_1,
amkopiskmaak_2016 AS amkopiskmaak_1, 
yoopiskkoulk_2016 as yoopiskkoulk_1, 
yoopisktunn_2016 AS yoopisktunn_1,
yoopiskjarj_2016 as yoopiskjarj_1,
yoopiskmaak_2016 AS yoopiskmaak_1,
monihaku_2016 as monihaku_1, 
ptoim1r4_2016 as ptoim1r4_1, 
amas_2016 as amas_1,  
luopiskkoulk_2017 as luopiskkoulk_2,
luopisktunn_2017 AS luopisktunn_2,
luopiskjarj_2017 as luopiskjarj_2, 
luopiskmaak_2017 AS luopiskmaak_2, 
ammopiskkoulk_2017 as ammopiskkoulk_2, 
ammopisktunn_2017 AS ammopisktunn_2,
ammopiskjarj_2017 as ammopiskjarj_2, 
ammopiskmaak_2017 as ammopiskmaak_2, 
amkopiskkoulk_2017 as amkopiskkoulk_2, 
amkopisktunn_2017 AS amkopisktunn_2,
amkopiskjarj_2017 as amkopiskjarj_2,
amkopiskmaak_2017 AS amkopiskmaak_2, 
yoopiskkoulk_2017 as yoopiskkoulk_2, 
yoopisktunn_2017 AS yoopisktunn_2,
yoopiskjarj_2017 as yoopiskjarj_2,
yoopiskmaak_2017 AS yoopiskmaak_2,
monihaku_2017 as monihaku_2, 
ptoim1r4_2017 as ptoim1r4_2, 
amas_2017 as amas_2, 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_19',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_19] 
WHERE suorv = '2016 ' and (suorlk = '1' or suorlk= '2')

UNION ALL

--1v sijoittuminen
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav = NULL,
aikoul,
tutkmaak,  
luopiskkoulk_2017 as luopiskkoulk_1,
luopisktunn_2017 AS luopisktunn_1,
luopiskjarj_2017 as luopiskjarj_1, 
luopiskmaak_2017 AS luopiskmaak_1, 
ammopiskkoulk_2017 as ammopiskkoulk__1, 
ammopisktunn_2017 AS ammopisktunn_1,
ammopiskjarj_2017 as ammopiskjarj_1, 
ammopiskmaak_2017 as ammopiskmaak_1, 
amkopiskkoulk_2017 as amkopiskkoulk_1, 
amkopisktunn_2017 AS amkopisktunn_1,
amkopiskjarj_2017 as amkopiskjarj_1,
amkopiskmaak_2017 AS amkopiskmaak_1, 
yoopiskkoulk_2017 as yoopiskkoulk_1, 
yoopisktunn_2017 AS yoopisktunn_1,
yoopiskjarj_2017 as yoopiskjarj_1,
yoopiskmaak_2017 AS yoopiskmaak_1,
monihaku_2017 as monihaku_1, 
ptoim1r4_2017 as ptoim1r4_1, 
amas_2017 as amas_1,  
luopiskkoulk_2018 as luopiskkoulk_2,
luopisktunn_2018 AS luopisktunn_2,
luopiskjarj_2018 as luopiskjarj_2, 
luopiskmaak_2018 AS luopiskmaak_2, 
ammopiskkoulk_2018 as ammopiskkoulk_2, 
ammopisktunn_2018 AS ammopisktunn_2,
ammopiskjarj_2018 as ammopiskjarj_2, 
ammopiskmaak_2018 as ammopiskmaak_2, 
amkopiskkoulk_2018 as amkopiskkoulk_2, 
amkopisktunn_2018 AS amkopisktunn_2,
amkopiskjarj_2018 as amkopiskjarj_2,
amkopiskmaak_2018 AS amkopiskmaak_2, 
yoopiskkoulk_2018 as yoopiskkoulk_2, 
yoopisktunn_2018 AS yoopisktunn_2,
yoopiskjarj_2018 as yoopiskjarj_2,
yoopiskmaak_2018 AS yoopiskmaak_2,
monihaku_2018 as monihaku_2, 
ptoim1r4_2018 as ptoim1r4_2, 
amas_2018 as amas_2, 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_20',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_20] 
WHERE suorv = '2017 ' and (suorlk = '1' or suorlk= '2')

UNION ALL

--1v sijoittuminen
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav = NULL,
aikoul,
tutkmaak,  
luopiskkoulk_2018 as luopiskkoulk_1,
luopisktunn_2018 AS luopisktunn_1,
luopiskjarj_2018 as luopiskjarj_1, 
luopiskmaak_2018 AS luopiskmaak_1, 
ammopiskkoulk_2018 as ammopiskkoulk__1, 
ammopisktunn_2018 AS ammopisktunn_1,
ammopiskjarj_2018 as ammopiskjarj_1, 
ammopiskmaak_2018 as ammopiskmaak_1, 
amkopiskkoulk_2018 as amkopiskkoulk_1, 
amkopisktunn_2018 AS amkopisktunn_1,
amkopiskjarj_2018 as amkopiskjarj_1,
amkopiskmaak_2018 AS amkopiskmaak_1, 
yoopiskkoulk_2018 as yoopiskkoulk_1, 
yoopisktunn_2018 AS yoopisktunn_1,
yoopiskjarj_2018 as yoopiskjarj_1,
yoopiskmaak_2018 AS yoopiskmaak_1,
monihaku_2018 as monihaku_1, 
ptoim1r4_2018 as ptoim1r4_1, 
amas_2018 as amas_1,  
luopiskkoulk_2019 as luopiskkoulk_2,
luopisktunn_2019 AS luopisktunn_2,
luopiskjarj_2019 as luopiskjarj_2, 
luopiskmaak_2019 AS luopiskmaak_2, 
ammopiskkoulk_2019 as ammopiskkoulk_2, 
ammopisktunn_2019 AS ammopisktunn_2,
ammopiskjarj_2019 as ammopiskjarj_2, 
ammopiskmaak_2019 as ammopiskmaak_2, 
amkopiskkoulk_2019 as amkopiskkoulk_2, 
amkopisktunn_2019 AS amkopisktunn_2,
amkopiskjarj_2019 as amkopiskjarj_2,
amkopiskmaak_2019 AS amkopiskmaak_2, 
yoopiskkoulk_2019 as yoopiskkoulk_2, 
yoopisktunn_2019 AS yoopisktunn_2,
yoopiskjarj_2019 as yoopiskjarj_2,
yoopiskmaak_2019 AS yoopiskmaak_2,
monihaku_2019 as monihaku_2, 
ptoim1r4_2019 as ptoim1r4_2, 
amas_2019 as amas_2, 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_21',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_21] 
WHERE suorv = '2018 ' and (suorlk = '1' or suorlk= '2')

UNION ALL

--välitön sijoittuminen
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav = NULL,
aikoul,
tutkmaak,  
luopiskkoulk_2019 as luopiskkoulk_1,
luopisktunn_2019 AS luopisktunn_1,
luopiskjarj_2019 as luopiskjarj_1, 
luopiskmaak_2019 AS luopiskmaak_1, 
ammopiskkoulk_2019 as ammopiskkoulk__1, 
ammopisktunn_2019 AS ammopisktunn_1,
ammopiskjarj_2019 as ammopiskjarj_1, 
ammopiskmaak_2019 as ammopiskmaak_1, 
amkopiskkoulk_2019 as amkopiskkoulk_1, 
amkopisktunn_2019 AS amkopisktunn_1,
amkopiskjarj_2019 as amkopiskjarj_1,
amkopiskmaak_2019 AS amkopiskmaak_1, 
yoopiskkoulk_2019 as yoopiskkoulk_1, 
yoopisktunn_2019 AS yoopisktunn_1,
yoopiskjarj_2019 as yoopiskjarj_1,
yoopiskmaak_2019 AS yoopiskmaak_1,
monihaku_2019 as monihaku_1, 
ptoim1r4_2019 as ptoim1r4_1, 
amas_2019 as amas_1,  
luopiskkoulk_2 = '',
luopisktunn_2 = '',
luopiskjarj_2 = '', 
luopiskmaak_2 = '', 
ammopiskkoulk_2 = '', 
ammopisktunn_2 = '',
ammopiskjarj_2 = '', 
ammopiskmaak_2 = '', 
amkopiskkoulk_2 = '', 
amkopisktunn_2 = '',
amkopiskjarj_2 = '',
amkopiskmaak_2 = '', 
yoopiskkoulk_2 = '', 
yoopisktunn_2 = '',
yoopiskjarj_2 = '',
yoopiskmaak_2 = '',
monihaku_2 = '', 
ptoim1r4_2 = '', 
amas_2 = '', 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_21',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_21] 
where suorv = '2019' and suorlk = '1'

UNION ALL

--ellei aineisto ole vielä saapunut, tuorein välittömän sijoittumisen tieto haetaan edellisestä aineistosta
SELECT
tilv, 
CAST(tilv + '0101' AS date) AS tilv_date,
tutkryh,
suorv,
suorlk,
sp,
syntv,
aikielir1,
tutkaskun,
kansalr1,
pohjmaa,
eumaa,
etamaa,
tunn,
jarj,
kkielir1,
tutklaja,
tutktav = NULL,
aikoul,
tutkmaak,  
luopiskkoulk_2018 as luopiskkoulk_1,
luopisktunn_2018 AS luopisktunn_1,
luopiskjarj_2018 as luopiskjarj_1, 
luopiskmaak_2018 AS luopiskmaak_1, 
ammopiskkoulk_2018 as ammopiskkoulk__1, 
ammopisktunn_2018 AS ammopisktunn_1,
ammopiskjarj_2018 as ammopiskjarj_1, 
ammopiskmaak_2018 as ammopiskmaak_1, 
amkopiskkoulk_2018 as amkopiskkoulk_1, 
amkopisktunn_2018 AS amkopisktunn_1,
amkopiskjarj_2018 as amkopiskjarj_1,
amkopiskmaak_2018 AS amkopiskmaak_1, 
yoopiskkoulk_2018 as yoopiskkoulk_1, 
yoopisktunn_2018 AS yoopisktunn_1,
yoopiskjarj_2018 as yoopiskjarj_1,
yoopiskmaak_2018 AS yoopiskmaak_1,
monihaku_2018 as monihaku_1, 
ptoim1r4_2018 as ptoim1r4_1, 
amas_2018 as amas_1,  
luopiskkoulk_2 = '',
luopisktunn_2 = '',
luopiskjarj_2 = '', 
luopiskmaak_2 = '', 
ammopiskkoulk_2 = '', 
ammopisktunn_2 = '',
ammopiskjarj_2 = '', 
ammopiskmaak_2 = '', 
amkopiskkoulk_2 = '', 
amkopisktunn_2 = '',
amkopiskjarj_2 = '',
amkopiskmaak_2 = '', 
yoopiskkoulk_2 = '', 
yoopisktunn_2 = '',
yoopiskjarj_2 = '',
yoopiskmaak_2 = '',
monihaku_2 = '', 
ptoim1r4_2 = '', 
amas_2 = '', 
lkm, 
pohjkoul,
tietolahde='K3_12_sopv_20',
rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_12_sopv_20] 
where 
suorv = (CASE 
			WHEN NOT EXISTS (SELECT TOP 1 1 
								FROM TK_H9098_CSC.sys.tables t 
								INNER JOIN TK_H9098_CSC.sys.partitions p on t.object_id = p.object_id 
								WHERE t.name = 'TK_K3_12_sopv_21' and p.rows > 0) 
			THEN '2018'
		 END)
and suorlk = '1'


) Aineistot

GO

