USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_koulutukseen_sijoittuneet_8v_visualisointi_lahde_kohde]    Script Date: 25.10.2024 13:23:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















CREATE OR ALTER   PROCEDURE [dbo].[p_lataa_f_koulutukseen_sijoittuneet_8v_visualisointi_lahde_kohde] AS

DECLARE @i int 
DECLARE @sql1 nvarchar(max)
DECLARE @sql2 nvarchar(max)
DECLARE @sql3 nvarchar(max)

SET @i = 0

TRUNCATE TABLE VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_lopullinen

WHILE @i < 8
BEGIN

	SET @sql1 =
		'INSERT INTO VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_lopullinen
		SELECT
			tilv,
			CASE
				WHEN ' + CAST(@i as nvarchar) + ' = 0 THEN ''0_0''
				WHEN yoopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''1_' + CAST(@i - 1 as nvarchar) + '''
				WHEN amkopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''2_' + CAST(@i - 1 as nvarchar) + '''
				WHEN luopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''3_' + CAST(@i - 1 as nvarchar) + '''
				WHEN ammopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 ELSE @i END as nvarchar) + ' <> '''' THEN ''4_' + CAST(@i - 1 as nvarchar) + '''
				WHEN tilanne_' + CAST(CASE WHEN @i = 0 THEN 0 ELSE @i - 1 END as nvarchar) + ' = ''5'' THEN ''5_' + CAST(@i - 1 as nvarchar) + '''
				ELSE ''6_' + CAST(@i - 1 as nvarchar) + '''
			END as lahde,
			CASE 
				WHEN yoopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''1_' + CAST(@i as nvarchar) + '''
				WHEN amkopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''2_' + CAST(@i as nvarchar) + '''
				WHEN luopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''3_' + CAST(@i as nvarchar) + '''
				WHEN ammopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''4_' + CAST(@i as nvarchar) + '''
				WHEN tilanne_' + CAST(@i as nvarchar) + ' = ''5'' THEN ''5_' + CAST(@i as nvarchar) + '''
				ELSE ''6_' + CAST(@i as nvarchar) + '''
			END as kohde,
			tilanne_0,
			tilanne_1,
			tilanne_2,
			tilanne_3,
			tilanne_4,
			tilanne_5,
			tilanne_6,
			tilanne_7,
			lkm,
			sp,
			tutkaskun,
			8 as jaksot
		FROM VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_tilanne'
		
		EXEC (@sql1)

		IF @i < 4 or @i = 7

		BEGIN

			SET @sql2 =
				'INSERT INTO VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_lopullinen
				SELECT
					tilv,
					CASE
						WHEN ' + CAST(@i as nvarchar) + ' = 0 THEN ''0_0''
						WHEN yoopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 7 THEN 4 ELSE @i END as nvarchar) + ' <> '''' THEN ''1_' + CAST(CASE WHEN @i = 7 THEN 3 ELSE @i - 1 END as nvarchar) + '''
						WHEN amkopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 7 THEN 4 ELSE @i END as nvarchar) + ' <> '''' THEN ''2_' + CAST(CASE WHEN @i = 7 THEN 3 ELSE @i - 1 END as nvarchar) + '''
						WHEN luopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 7 THEN 4 ELSE @i END as nvarchar) + ' <> '''' THEN ''3_' + CAST(CASE WHEN @i = 7 THEN 3 ELSE @i - 1 END as nvarchar) + '''
						WHEN ammopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 7 THEN 4 ELSE @i END as nvarchar) + ' <> '''' THEN ''4_' + CAST(CASE WHEN @i = 7 THEN 3 ELSE @i - 1 END as nvarchar) + '''
						WHEN tilanne_' + CAST(CASE WHEN @i = 7 THEN 3 WHEN @i = 0 THEN 0 ELSE @i - 1 END as nvarchar) + ' = ''5'' THEN ''5_' + CAST(CASE WHEN @i = 7 THEN 3 ELSE @i - 1 END as nvarchar) + '''
						ELSE ''6_' + CAST(CASE WHEN @i = 7 THEN 3 ELSE @i - 1 END as nvarchar) + '''
					END as lahde,
					CASE 
						WHEN yoopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''1_' + CAST(@i as nvarchar) + '''
						WHEN amkopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''2_' + CAST(@i as nvarchar) + '''
						WHEN luopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''3_' + CAST(@i as nvarchar) + '''
						WHEN ammopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''4_' + CAST(@i as nvarchar) + '''
						WHEN tilanne_' + CAST(@i as nvarchar) + ' = ''5'' THEN ''5_' + CAST(@i as nvarchar) + '''
						ELSE ''6_' + CAST(@i as nvarchar) + '''
					END as kohde,
					tilanne_0,
					tilanne_1,
					tilanne_2,
					tilanne_3,
					tilanne_4,
					tilanne_5,
					tilanne_6,
					tilanne_7,
					lkm,
					sp,
					tutkaskun,
					5 as jaksot
				FROM VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_tilanne'

			EXEC (@sql2)

		END

		IF @i < 3 or @i = 7

		BEGIN

			SET @sql3 =
				'INSERT INTO VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_lopullinen
				SELECT
					tilv,
					CASE
						WHEN ' + CAST(@i as nvarchar) + ' = 0 THEN ''0_0''
						WHEN yoopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 7 THEN 3 ELSE @i END as nvarchar) + ' <> '''' THEN ''1_' + CAST(CASE WHEN @i = 7 THEN 2 ELSE @i - 1 END as nvarchar) + '''
						WHEN amkopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 7 THEN 3 ELSE @i END as nvarchar) + ' <> '''' THEN ''2_' + CAST(CASE WHEN @i = 7 THEN 2 ELSE @i - 1 END as nvarchar) + '''
						WHEN luopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 7 THEN 3 ELSE @i END as nvarchar) + ' <> '''' THEN ''3_' + CAST(CASE WHEN @i = 7 THEN 2 ELSE @i - 1 END as nvarchar) + '''
						WHEN ammopiskkoulk_' + CAST(CASE WHEN @i = 0 THEN @i + 1 WHEN @i = 7 THEN 3 ELSE @i END as nvarchar) + ' <> '''' THEN ''4_' + CAST(CASE WHEN @i = 7 THEN 2 ELSE @i - 1 END as nvarchar) + '''
						WHEN tilanne_' + CAST(CASE WHEN @i = 7 THEN 2 WHEN @i = 0 THEN 0 ELSE @i - 1 END as nvarchar) + ' = ''5'' THEN ''5_' + CAST(CASE WHEN @i = 7 THEN 2 ELSE @i - 1 END as nvarchar) + '''
						ELSE ''6_' + CAST(CASE WHEN @i = 7 THEN 2 ELSE @i - 1 END as nvarchar) + '''
					END as lahde,
					CASE 
						WHEN yoopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''1_' + CAST(@i as nvarchar) + '''
						WHEN amkopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''2_' + CAST(@i as nvarchar) + '''
						WHEN luopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''3_' + CAST(@i as nvarchar) + '''
						WHEN ammopiskkoulk_' + CAST(@i + 1 as nvarchar) + ' <> '''' THEN ''4_' + CAST(@i as nvarchar) + '''
						WHEN tilanne_' + CAST(@i as nvarchar) + ' = ''5'' THEN ''5_' + CAST(@i as nvarchar) + '''
						ELSE ''6_' + CAST(@i as nvarchar) + '''
					END as kohde,
					tilanne_0,
					tilanne_1,
					tilanne_2,
					tilanne_3,
					tilanne_4,
					tilanne_5,
					tilanne_6,
					tilanne_7,
					lkm,
					sp,
					tutkaskun,
					4 as jaksot
				FROM VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_tilanne'

			EXEC (@sql3)

		END

	SET @i = @i + 1

END

GO


