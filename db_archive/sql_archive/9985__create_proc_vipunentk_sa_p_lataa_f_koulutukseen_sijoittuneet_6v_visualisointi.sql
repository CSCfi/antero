USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_koulutukseen_sijoittuneet_6v_visualisointi]    Script Date: 13.8.2024 15:08:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER PROCEDURE [dbo].[p_lataa_f_koulutukseen_sijoittuneet_6v_visualisointi] AS

DECLARE @i int 
DECLARE @sql1 nvarchar(max)
DECLARE @sql2 nvarchar(max)
DECLARE @sql3 nvarchar(max)

SET @i = 0

TRUNCATE TABLE VipunenTK_DW.dbo.sa_K3_13_Perusk_paattaneet_visualisointi

WHILE @i < 6
BEGIN

	SET @sql1 =
		'INSERT INTO VipunenTK_DW.dbo.sa_K3_13_Perusk_paattaneet_visualisointi
		SELECT
			tilv,
			CASE
				WHEN ' + CAST(@i as nvarchar) + ' = 0 THEN ''0_0''
				WHEN yoopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''1_' + CAST(@i - 1 as nvarchar) + '''
				WHEN amkopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''2_' + CAST(@i - 1 as nvarchar) + '''
				WHEN luopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''3_' + CAST(@i - 1 as nvarchar) + '''
				WHEN ammopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''4_' + CAST(@i - 1 as nvarchar) + '''
				ELSE ''5_' + CAST(@i - 1 as nvarchar) + '''
			END as lahde,
			CASE 
				WHEN yoopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''1_' + CAST(@i as nvarchar) + '''
				WHEN amkopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''2_' + CAST(@i as nvarchar) + '''
				WHEN luopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''3_' + CAST(@i as nvarchar) + '''
				WHEN ammopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''4_' + CAST(@i as nvarchar) + '''
				ELSE ''5_' + CAST(@i as nvarchar) + '''
			END as kohde,
			CASE 
				WHEN yoopiskkoulk_1 <> '''' THEN 1
				WHEN amkopiskkoulk_1 <> '''' THEN 2
				WHEN luopiskkoulk_1 <> '''' THEN 3
				WHEN ammopiskkoulk_1 <> '''' THEN 4
				ELSE 5
			END as tilanne_0,
			CASE 
				WHEN yoopiskkoulk_2 <> '''' THEN 1
				WHEN amkopiskkoulk_2 <> '''' THEN 2
				WHEN luopiskkoulk_2 <> '''' THEN 3
				WHEN ammopiskkoulk_2 <> '''' THEN 4
				ELSE 5
			END as tilanne_1,
			CASE 
				WHEN yoopiskkoulk_3 <> '''' THEN 1
				WHEN amkopiskkoulk_3 <> '''' THEN 2
				WHEN luopiskkoulk_3 <> '''' THEN 3
				WHEN ammopiskkoulk_3 <> '''' THEN 4
				ELSE 5
			END as tilanne_2,
			CASE 
				WHEN yoopiskkoulk_4 <> '''' THEN 1
				WHEN amkopiskkoulk_4 <> '''' THEN 2
				WHEN luopiskkoulk_4 <> '''' THEN 3
				WHEN ammopiskkoulk_4 <> '''' THEN 4
				ELSE 5
			END as tilanne_3,
			CASE 
				WHEN yoopiskkoulk_5 <> '''' THEN 1
				WHEN amkopiskkoulk_5 <> '''' THEN 2
				WHEN luopiskkoulk_5 <> '''' THEN 3
				WHEN ammopiskkoulk_5 <> '''' THEN 4
				ELSE 5
			END as tilanne_4,
			CASE 
				WHEN yoopiskkoulk_6 <> '''' THEN 1
				WHEN amkopiskkoulk_6 <> '''' THEN 2
				WHEN luopiskkoulk_6 <> '''' THEN 3
				WHEN ammopiskkoulk_6 <> '''' THEN 4
				ELSE 5
			END as tilanne_5,
			lkm,
			sp,
			tutkaskun,
			6 as jaksot
		FROM [VipunenTK_SA].[dbo].[v_K3_13_Perusk_paattaneet_amm_tutk_suorittaneet]
		WHERE tutkryh = 1'
		
		EXEC (@sql1)

		IF @i < 4 or @i = 5

		BEGIN

			SET @sql2 =
				'INSERT INTO VipunenTK_DW.dbo.sa_K3_13_Perusk_paattaneet_visualisointi
				SELECT
					tilv,
					CASE
						WHEN ' + CAST(@i as nvarchar) + ' = 0 THEN ''0_0''
						WHEN yoopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 5 THEN @i - 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''1_' + CAST(CASE WHEN @i = 5 THEN @i - 2 ELSE @i - 1 END as nvarchar) + '''
						WHEN amkopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 5 THEN @i - 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''2_' + CAST(CASE WHEN @i = 5 THEN @i - 2 ELSE @i - 1 END as nvarchar) + '''
						WHEN luopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 5 THEN @i - 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''3_' + CAST(CASE WHEN @i = 5 THEN @i - 2 ELSE @i - 1 END as nvarchar) + '''
						WHEN ammopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 5 THEN @i - 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''4_' + CAST(CASE WHEN @i = 5 THEN @i - 2 ELSE @i - 1 END as nvarchar) + '''
						ELSE ''5_' + CAST(CASE WHEN @i = 5 THEN @i - 2 ELSE @i - 1 END as nvarchar) + '''
					END as lahde,
					CASE 
						WHEN yoopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''1_' + CAST(@i as nvarchar) + '''
						WHEN amkopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''2_' + CAST(@i as nvarchar) + '''
						WHEN luopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''3_' + CAST(@i as nvarchar) + '''
						WHEN ammopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''4_' + CAST(@i as nvarchar) + '''
						ELSE ''5_' + CAST(@i as nvarchar) + '''
					END as kohde,
					CASE 
						WHEN yoopiskkoulk_1 <> '''' THEN 1
						WHEN amkopiskkoulk_1 <> '''' THEN 2
						WHEN luopiskkoulk_1 <> '''' THEN 3
						WHEN ammopiskkoulk_1 <> '''' THEN 4
						ELSE 5
					END as tilanne_0,
					CASE 
						WHEN yoopiskkoulk_2 <> '''' THEN 1
						WHEN amkopiskkoulk_2 <> '''' THEN 2
						WHEN luopiskkoulk_2 <> '''' THEN 3
						WHEN ammopiskkoulk_2 <> '''' THEN 4
						ELSE 5
					END as tilanne_1,
					CASE 
						WHEN yoopiskkoulk_3 <> '''' THEN 1
						WHEN amkopiskkoulk_3 <> '''' THEN 2
						WHEN luopiskkoulk_3 <> '''' THEN 3
						WHEN ammopiskkoulk_3 <> '''' THEN 4
						ELSE 5
					END as tilanne_2,
					CASE 
						WHEN yoopiskkoulk_4 <> '''' THEN 1
						WHEN amkopiskkoulk_4 <> '''' THEN 2
						WHEN luopiskkoulk_4 <> '''' THEN 3
						WHEN ammopiskkoulk_4 <> '''' THEN 4
						ELSE 5
					END as tilanne_3,
					CASE 
						WHEN yoopiskkoulk_5 <> '''' THEN 1
						WHEN amkopiskkoulk_5 <> '''' THEN 2
						WHEN luopiskkoulk_5 <> '''' THEN 3
						WHEN ammopiskkoulk_5 <> '''' THEN 4
						ELSE 5
					END as tilanne_4,
					CASE 
						WHEN yoopiskkoulk_6 <> '''' THEN 1
						WHEN amkopiskkoulk_6 <> '''' THEN 2
						WHEN luopiskkoulk_6 <> '''' THEN 3
						WHEN ammopiskkoulk_6 <> '''' THEN 4
						ELSE 5
					END as tilanne_5,
					lkm,
					sp,
					tutkaskun,
					5 as jaksot
				FROM [VipunenTK_SA].[dbo].[v_K3_13_Perusk_paattaneet_amm_tutk_suorittaneet]
				WHERE tutkryh = 1'

			EXEC (@sql2)

		END

		IF @i < 3 or @i = 5

		BEGIN

			SET @sql3 =
				'INSERT INTO VipunenTK_DW.dbo.sa_K3_13_Perusk_paattaneet_visualisointi
				SELECT
					tilv,
					CASE
						WHEN ' + CAST(@i as nvarchar) + ' = 0 THEN ''0_0''
						WHEN yoopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 5 THEN @i - 2 ELSE @i END as nvarchar) + ' <> '''' THEN ''1_' + CAST(CASE WHEN @i = 5 THEN @i - 3 ELSE @i - 1 END as nvarchar) + '''
						WHEN amkopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 5 THEN @i - 2 ELSE @i END as nvarchar) + ' <> '''' THEN ''2_' + CAST(CASE WHEN @i = 5 THEN @i - 3 ELSE @i - 1 END as nvarchar) + '''
						WHEN luopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 5 THEN @i - 2 ELSE @i END as nvarchar) + ' <> '''' THEN ''3_' + CAST(CASE WHEN @i = 5 THEN @i - 3 ELSE @i - 1 END as nvarchar) + '''
						WHEN ammopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 5 THEN @i - 2 ELSE @i END as nvarchar) + ' <> '''' THEN ''4_' + CAST(CASE WHEN @i = 5 THEN @i - 3 ELSE @i - 1 END as nvarchar) + '''
						ELSE ''5_' + CAST(CASE WHEN @i = 5 THEN @i - 3 ELSE @i - 1 END as nvarchar) + '''
					END as lahde,
					CASE 
						WHEN yoopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''1_' + CAST(@i as nvarchar) + '''
						WHEN amkopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''2_' + CAST(@i as nvarchar) + '''
						WHEN luopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''3_' + CAST(@i as nvarchar) + '''
						WHEN ammopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''4_' + CAST(@i as nvarchar) + '''
						ELSE ''5_' + CAST(@i as nvarchar) + '''
					END as kohde,
					CASE 
						WHEN yoopiskkoulk_1 <> '''' THEN 1
						WHEN amkopiskkoulk_1 <> '''' THEN 2
						WHEN luopiskkoulk_1 <> '''' THEN 3
						WHEN ammopiskkoulk_1 <> '''' THEN 4
						ELSE 5
					END as tilanne_0,
					CASE 
						WHEN yoopiskkoulk_2 <> '''' THEN 1
						WHEN amkopiskkoulk_2 <> '''' THEN 2
						WHEN luopiskkoulk_2 <> '''' THEN 3
						WHEN ammopiskkoulk_2 <> '''' THEN 4
						ELSE 5
					END as tilanne_1,
					CASE 
						WHEN yoopiskkoulk_3 <> '''' THEN 1
						WHEN amkopiskkoulk_3 <> '''' THEN 2
						WHEN luopiskkoulk_3 <> '''' THEN 3
						WHEN ammopiskkoulk_3 <> '''' THEN 4
						ELSE 5
					END as tilanne_2,
					CASE 
						WHEN yoopiskkoulk_4 <> '''' THEN 1
						WHEN amkopiskkoulk_4 <> '''' THEN 2
						WHEN luopiskkoulk_4 <> '''' THEN 3
						WHEN ammopiskkoulk_4 <> '''' THEN 4
						ELSE 5
					END as tilanne_3,
					CASE 
						WHEN yoopiskkoulk_5 <> '''' THEN 1
						WHEN amkopiskkoulk_5 <> '''' THEN 2
						WHEN luopiskkoulk_5 <> '''' THEN 3
						WHEN ammopiskkoulk_5 <> '''' THEN 4
						ELSE 5
					END as tilanne_4,
					CASE 
						WHEN yoopiskkoulk_6 <> '''' THEN 1
						WHEN amkopiskkoulk_6 <> '''' THEN 2
						WHEN luopiskkoulk_6 <> '''' THEN 3
						WHEN ammopiskkoulk_6 <> '''' THEN 4
						ELSE 5
					END as tilanne_5,
					lkm,
					sp,
					tutkaskun,
					4 as jaksot
				FROM [VipunenTK_SA].[dbo].[v_K3_13_Perusk_paattaneet_amm_tutk_suorittaneet]
				WHERE tutkryh = 1'

			EXEC (@sql3)

		END

	SET @i = @i + 1

END

GO
