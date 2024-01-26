USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki]    Script Date: 19.10.2023 12:36:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki] AS

TRUNCATE TABLE [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki]

--TK-pohjakoulutustiedot temp-tauluun
DECLARE @SQLQuery as nvarchar(max)
DECLARE @SQLQuery_start as nvarchar(max)
DECLARE @db as nvarchar(30)
DECLARE @schema as nvarchar(3)
DECLARE @year as int
DECLARE @table as nvarchar(50)

SET @db = 'TK_H9098_CSC'
SET @schema = 'dbo'
SET @year = 19
SET @table = 'TK_K1_12c_sopv_' + cast(@year as char(2))

WHILE EXISTS (SELECT * FROM TK_H9098_CSC.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = @schema AND TABLE_NAME = @table)

BEGIN
    IF OBJECT_ID('tempdb..##pohjakoul_temp') IS NULL
	BEGIN
		SET @SQLQuery_start = 
			'
			SELECT  
				tilv
				,jarj
				,jarjnim
				,ikar20 = ' + 
					case 
						when @year < 21 then 'null'
						when @year = 21 then '[ika21]'
						when @year > 21 then '[ikar20]'
					end 
				+ '
				,ei_pohjakoul_pt_kr1
				,ei_pohjakoul_pt_kr2
				,ei_pohjakoul_pt_kr3
				,ei_pohjakoul_pt_kr4
				,ei_pohjakoul_pt_kr5
				,ei_pohjakoul_at_eat_kr1
				,ei_pohjakoul_at_eat_kr2
				,ei_pohjakoul_at_eat_kr3
				,ei_pohjakoul_at_eat_kr4
				,ei_pohjakoul_at_eat_kr5
				,pohjakoul_pt_kr1
				,pohjakoul_pt_kr2
				,pohjakoul_pt_kr3
				,pohjakoul_pt_kr4
				,pohjakoul_pt_kr5
				,pohjakoul_at_eat_kr1
				,pohjakoul_at_eat_kr2
				,pohjakoul_at_eat_kr3
				,pohjakoul_at_eat_kr4
				,pohjakoul_at_eat_kr5 				
			INTO ##pohjakoul_temp FROM 
			'
	END
	ELSE BEGIN
		SET @SQLQuery_start = 
			'
			INSERT INTO ##pohjakoul_temp 
			SELECT  
				tilv
				,jarj
				,jarjnim
				,ikar20 = ' + 
					case 
						when @year < 21 then 'null'
						when @year = 21 then '[ika21]'
						when @year > 21 then '[ikar20]'
					end 
				+ '
				,ei_pohjakoul_pt_kr1
				,ei_pohjakoul_pt_kr2
				,ei_pohjakoul_pt_kr3
				,ei_pohjakoul_pt_kr4
				,ei_pohjakoul_pt_kr5
				,ei_pohjakoul_at_eat_kr1
				,ei_pohjakoul_at_eat_kr2
				,ei_pohjakoul_at_eat_kr3
				,ei_pohjakoul_at_eat_kr4
				,ei_pohjakoul_at_eat_kr5
				,pohjakoul_pt_kr1
				,pohjakoul_pt_kr2
				,pohjakoul_pt_kr3
				,pohjakoul_pt_kr4
				,pohjakoul_pt_kr5
				,pohjakoul_at_eat_kr1
				,pohjakoul_at_eat_kr2
				,pohjakoul_at_eat_kr3
				,pohjakoul_at_eat_kr4
				,pohjakoul_at_eat_kr5 
			FROM 
			'
	END
	SET @SQLQuery = @SQLQuery_start + @db + '.' + @schema + '.' + @Table 
	
	EXECUTE sp_executesql @SQLQuery

	SET @year += 1
	SET @table = 'TK_K1_12c_sopv_' + cast(@year as char(2))
END

INSERT INTO [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki] (
	   [vuosi]
      ,[ytunnus]
      ,[koulutuksen_jarjestaja]
	  ,[ikar20]
      ,[ei_pohjakoul_pt_kr1]
      ,[ei_pohjakoul_pt_kr2]
      ,[ei_pohjakoul_pt_kr3]
      ,[ei_pohjakoul_pt_kr4]
      ,[ei_pohjakoul_pt_kr5]
      ,[ei_pohjakoul_at_eat_kr1]
      ,[ei_pohjakoul_at_eat_kr2]
      ,[ei_pohjakoul_at_eat_kr3]
      ,[ei_pohjakoul_at_eat_kr4]
      ,[ei_pohjakoul_at_eat_kr5]
      ,[pohjakoul_pt_kr1]
      ,[pohjakoul_pt_kr2]
      ,[pohjakoul_pt_kr3]
      ,[pohjakoul_pt_kr4]
      ,[pohjakoul_pt_kr5]
      ,[pohjakoul_at_eat_kr1]
      ,[pohjakoul_at_eat_kr2]
      ,[pohjakoul_at_eat_kr3]
      ,[pohjakoul_at_eat_kr4]
      ,[pohjakoul_at_eat_kr5]
	  ,source
)

SELECT 
	 [vuosi] = tilv
      ,[ytunnus] = jarj
      ,[koulutuksen_jarjestaja] = jarjnim
	  ,[ikar20]
      ,coalesce([ei_pohjakoul_pt_kr1], 0)
      ,coalesce([ei_pohjakoul_pt_kr2], 0)
      ,coalesce([ei_pohjakoul_pt_kr3], 0)
      ,coalesce([ei_pohjakoul_pt_kr4], 0)
      ,coalesce([ei_pohjakoul_pt_kr5], 0)
      ,coalesce([ei_pohjakoul_at_eat_kr1], 0)
      ,coalesce([ei_pohjakoul_at_eat_kr2], 0)
      ,coalesce([ei_pohjakoul_at_eat_kr3], 0)
      ,coalesce([ei_pohjakoul_at_eat_kr4], 0)
      ,coalesce([ei_pohjakoul_at_eat_kr5], 0)
      ,coalesce([pohjakoul_pt_kr1], 0)
      ,coalesce([pohjakoul_pt_kr2], 0)
      ,coalesce([pohjakoul_pt_kr3], 0)
      ,coalesce([pohjakoul_pt_kr4], 0)
      ,coalesce([pohjakoul_pt_kr5], 0)
      ,coalesce([pohjakoul_at_eat_kr1], 0)
      ,coalesce([pohjakoul_at_eat_kr2], 0)
      ,coalesce([pohjakoul_at_eat_kr3], 0)
      ,coalesce([pohjakoul_at_eat_kr4], 0)
      ,coalesce([pohjakoul_at_eat_kr5], 0)
	,'p_lataa_sa_amos_tutkinnot_pohjakoulutus_kaikki'
FROM ##pohjakoul_temp 

DROP TABLE IF EXISTS ##pohjakoul_temp

GO
