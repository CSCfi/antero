USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_views]    Script Date: 27.7.2022 14:38:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_views] AS

declare @Nakyma nvarchar(300);

declare views_ cursor for SELECT DISTINCT v.name FROM sys.views v

open views_;
fetch next from views_ into  @Nakyma

TRUNCATE TABLE [ANTERO].[dbo].[views]

WHILE @@FETCH_STATUS = 0

	BEGIN

		BEGIN TRY
			INSERT INTO [ANTERO].[dbo].[views]
			SELECT 
			  [database] = DB_NAME(),
			  [schema] = s.name, 
			  [view]   = v.name, 
			  coalesce(r.referenced_database_name, DB_NAME()),
			  r.referenced_schema_name,
			  r.referenced_entity_name,
			  [column] = r.referenced_minor_name,
			  loadtime= getdate(),
			  [source] = 'ETL: p_lataa_views',
			  [username] = USER_NAME()
			FROM sys.views v
			INNER JOIN sys.schemas s ON v.[schema_id] = s.[schema_id]
			CROSS APPLY sys.dm_sql_referenced_entities(QUOTENAME(s.name) + N'.' + QUOTENAME(v.name), N'OBJECT') r
			WHERE v.name = @Nakyma and r.referenced_minor_name is not null and r.referenced_schema_name is not null
		END TRY 
		BEGIN CATCH
		END CATCH
		fetch next from views_ into  @Nakyma
	END
	close views_;
	deallocate views_;

declare views_ cursor for SELECT DISTINCT v.name FROM VipunenTK.sys.views v

open views_;
fetch next from views_ into  @Nakyma

WHILE @@FETCH_STATUS = 0

	BEGIN

		BEGIN TRY
			INSERT INTO [ANTERO].[dbo].[views]
			SELECT 
			  [database] = 'VipunenTK',
			  [schema] = s.name, 
			  [view]   = v.name, 
			  coalesce(r.referenced_database_name, 'VipunenTK'),
			  r.referenced_schema_name,
			  r.referenced_entity_name,
			  [column] = r.referenced_minor_name,
			  loadtime= getdate(),
			  [source] = 'ETL: p_lataa_views',
			  [username] = USER_NAME()
			FROM VipunenTK.sys.views v
			INNER JOIN VipunenTK.sys.schemas s ON v.[schema_id] = s.[schema_id]
			CROSS APPLY VipunenTK.sys.dm_sql_referenced_entities(QUOTENAME(s.name) + N'.' + QUOTENAME(v.name), N'OBJECT') r
			WHERE v.name = @Nakyma and r.referenced_minor_name is not null and r.referenced_schema_name is not null
		END TRY 
		BEGIN CATCH
		END CATCH
		fetch next from views_ into  @Nakyma
	END
	close views_;
	deallocate views_;

declare views_ cursor for SELECT DISTINCT v.name FROM Bibliometriikka.sys.views v

open views_;
fetch next from views_ into  @Nakyma

WHILE @@FETCH_STATUS = 0

	BEGIN

		BEGIN TRY
			INSERT INTO [ANTERO].[dbo].[views]
			SELECT 
			  [database] = 'Bibliometriikka',
			  [schema] = s.name, 
			  [view]   = v.name, 
			  coalesce(r.referenced_database_name, 'Bibliometriikka'),
			  r.referenced_schema_name,
			  r.referenced_entity_name,
			  [column] = r.referenced_minor_name,
			  loadtime= getdate(),
			  [source] = 'ETL: p_lataa_views',
			  [username] = USER_NAME()
			FROM Bibliometriikka.sys.views v
			INNER JOIN Bibliometriikka.sys.schemas s ON v.[schema_id] = s.[schema_id]
			CROSS APPLY Bibliometriikka.sys.dm_sql_referenced_entities(QUOTENAME(s.name) + N'.' + QUOTENAME(v.name), N'OBJECT') r
			WHERE v.name = @Nakyma and r.referenced_minor_name is not null and r.referenced_schema_name is not null
		END TRY 
		BEGIN CATCH
		END CATCH
		fetch next from views_ into  @Nakyma
	END
	close views_;
	deallocate views_;




GO


