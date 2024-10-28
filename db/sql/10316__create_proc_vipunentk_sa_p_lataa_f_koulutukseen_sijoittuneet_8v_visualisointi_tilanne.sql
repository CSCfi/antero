USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_koulutukseen_sijoittuneet_8v_visualisointi_tilanne]    Script Date: 25.10.2024 13:22:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














CREATE OR ALTER  PROCEDURE [dbo].[p_lataa_f_koulutukseen_sijoittuneet_8v_visualisointi_tilanne] AS

DECLARE @sql nvarchar(max)

TRUNCATE TABLE VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_tilanne

SET @sql =
		'INSERT INTO VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_tilanne
		SELECT
			tilv,
			tutkaskun,
			sp,
			CASE 
				WHEN yoopiskkoulk_1 <> '''' THEN 1
				WHEN amkopiskkoulk_1 <> '''' THEN 2
				WHEN luopiskkoulk_1 <> '''' THEN 3
				WHEN ammopiskkoulk_1 <> '''' THEN 4
				ELSE 6
			END as tilanne_0,
			CASE 
				WHEN yoopiskkoulk_2 <> '''' THEN 1
				WHEN amkopiskkoulk_2 <> '''' THEN 2
				WHEN luopiskkoulk_2 <> '''' THEN 3
				WHEN ammopiskkoulk_2 <> '''' THEN 4
				WHEN yoopiskkoulk_1 <> '''' OR amkopiskkoulk_1 <> '''' THEN 5 
				ELSE 6
			END as tilanne_1,
			CASE 
				WHEN yoopiskkoulk_3 <> '''' THEN 1
				WHEN amkopiskkoulk_3 <> '''' THEN 2
				WHEN luopiskkoulk_3 <> '''' THEN 3
				WHEN ammopiskkoulk_3 <> '''' THEN 4
				WHEN yoopiskkoulk_1 <> '''' OR amkopiskkoulk_1 <> '''' OR
				     yoopiskkoulk_2 <> '''' OR amkopiskkoulk_2 <> '''' THEN 5 
				ELSE 6
			END as tilanne_2,
			CASE 
				WHEN yoopiskkoulk_4 <> '''' THEN 1
				WHEN amkopiskkoulk_4 <> '''' THEN 2
				WHEN luopiskkoulk_4 <> '''' THEN 3
				WHEN ammopiskkoulk_4 <> '''' THEN 4
				WHEN yoopiskkoulk_1 <> '''' OR amkopiskkoulk_1 <> '''' OR
				     yoopiskkoulk_2 <> '''' OR amkopiskkoulk_2 <> '''' OR
					 yoopiskkoulk_3 <> '''' OR amkopiskkoulk_3 <> '''' THEN 5
				ELSE 6
			END as tilanne_3,
			CASE 
				WHEN yoopiskkoulk_5 <> '''' THEN 1
				WHEN amkopiskkoulk_5 <> '''' THEN 2
				WHEN luopiskkoulk_5 <> '''' THEN 3
				WHEN ammopiskkoulk_5 <> '''' THEN 4
				WHEN yoopiskkoulk_1 <> '''' OR amkopiskkoulk_1 <> '''' OR
				     yoopiskkoulk_2 <> '''' OR amkopiskkoulk_2 <> '''' OR
					 yoopiskkoulk_3 <> '''' OR amkopiskkoulk_3 <> '''' OR
					 yoopiskkoulk_4 <> '''' OR amkopiskkoulk_4 <> '''' THEN 5
				ELSE 6
			END as tilanne_4,
			CASE 
				WHEN yoopiskkoulk_6 <> '''' THEN 1
				WHEN amkopiskkoulk_6 <> '''' THEN 2
				WHEN luopiskkoulk_6 <> '''' THEN 3
				WHEN ammopiskkoulk_6 <> '''' THEN 4
				WHEN yoopiskkoulk_1 <> '''' OR amkopiskkoulk_1 <> '''' OR
				     yoopiskkoulk_2 <> '''' OR amkopiskkoulk_2 <> '''' OR
					 yoopiskkoulk_3 <> '''' OR amkopiskkoulk_3 <> '''' OR
					 yoopiskkoulk_4 <> '''' OR amkopiskkoulk_4 <> '''' OR
					 yoopiskkoulk_5 <> '''' OR amkopiskkoulk_5 <> '''' THEN 5
				ELSE 6
			END as tilanne_5,
			CASE 
				WHEN yoopiskkoulk_7 <> '''' THEN 1
				WHEN amkopiskkoulk_7 <> '''' THEN 2
				WHEN luopiskkoulk_7 <> '''' THEN 3
				WHEN ammopiskkoulk_7 <> '''' THEN 4
				WHEN yoopiskkoulk_1 <> '''' OR amkopiskkoulk_1 <> '''' OR
				     yoopiskkoulk_2 <> '''' OR amkopiskkoulk_2 <> '''' OR
					 yoopiskkoulk_3 <> '''' OR amkopiskkoulk_3 <> '''' OR
					 yoopiskkoulk_4 <> '''' OR amkopiskkoulk_4 <> '''' OR
					 yoopiskkoulk_5 <> '''' OR amkopiskkoulk_5 <> '''' OR 
					 yoopiskkoulk_6 <> '''' OR amkopiskkoulk_6 <> '''' THEN 5
				ELSE 6
			END as tilanne_6,
			CASE 
				WHEN yoopiskkoulk_8 <> '''' THEN 1
				WHEN amkopiskkoulk_8 <> '''' THEN 2
				WHEN luopiskkoulk_8 <> '''' THEN 3
				WHEN ammopiskkoulk_8 <> '''' THEN 4
				WHEN yoopiskkoulk_1 <> '''' OR amkopiskkoulk_1 <> '''' OR
				     yoopiskkoulk_2 <> '''' OR amkopiskkoulk_2 <> '''' OR
					 yoopiskkoulk_3 <> '''' OR amkopiskkoulk_3 <> '''' OR
					 yoopiskkoulk_4 <> '''' OR amkopiskkoulk_4 <> '''' OR
					 yoopiskkoulk_5 <> '''' OR amkopiskkoulk_5 <> '''' OR 
					 yoopiskkoulk_6 <> '''' OR amkopiskkoulk_6 <> '''' OR
					 yoopiskkoulk_7 <> '''' OR amkopiskkoulk_7 <> '''' THEN 5
				ELSE 6
			END as tilanne_7,
			[luopiskkoulk_1],
	        [ammopiskkoulk_1],
	        [amkopiskkoulk_1],
	        [yoopiskkoulk_1],
	        [luopiskkoulk_2],
	        [ammopiskkoulk_2],
	        [amkopiskkoulk_2],
	        [yoopiskkoulk_2],
	        [luopiskkoulk_3],
	        [ammopiskkoulk_3],
	        [amkopiskkoulk_3],
	        [yoopiskkoulk_3],
	        [luopiskkoulk_4],
	        [ammopiskkoulk_4],
	        [amkopiskkoulk_4],
	        [yoopiskkoulk_4],
	        [luopiskkoulk_5],
	        [ammopiskkoulk_5],
	        [amkopiskkoulk_5],
	        [yoopiskkoulk_5],
	        [luopiskkoulk_6],
	        [ammopiskkoulk_6],
	        [amkopiskkoulk_6],
	        [yoopiskkoulk_6],
	        [luopiskkoulk_7],
	        [ammopiskkoulk_7],
	        [amkopiskkoulk_7],
	        [yoopiskkoulk_7],
	        [luopiskkoulk_8],
	        [ammopiskkoulk_8],
	        [amkopiskkoulk_8],
	        [yoopiskkoulk_8],
			lkm
		FROM [VipunenTK_SA].[dbo].[v_K3_13b_Perusk_paattaneet_amm_tutk_suorittaneet]
		WHERE tutkryh = 1'
		
		EXEC (@sql)

GO


