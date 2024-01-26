USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_views]    Script Date: 30.11.2023 7:59:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_views] AS

declare @sql nvarchar(max)

declare @Tietokanta nvarchar(300);

declare databases_ cursor for SELECT DISTINCT name FROM sys.databases WHERE name not in ('master', 'tempdb', 'model', 'msdb', 'testi', 'Suorat', 'SSISDB', 'AdminDB', 'Olli_Bibliometriikka', 'VirtaSiirto')


open databases_;
fetch next from databases_ into  @Tietokanta

TRUNCATE TABLE [ANTERO].[dbo].[views]

WHILE @@FETCH_STATUS = 0

BEGIN

SET @sql =	'declare @Nakyma nvarchar(300) ' +
			'declare views_ cursor for SELECT DISTINCT v.name FROM ' + @Tietokanta + '.sys.views v ' +
			'open views_ ' +
			'fetch next from views_ into  @Nakyma ' +
			'WHILE @@FETCH_STATUS = 0 ' +
			'BEGIN ' +
			'BEGIN TRY ' +
			'INSERT INTO [ANTERO].[dbo].[views] ' +
			'SELECT ' + 
			'[database] = ' + '''' + @Tietokanta + '''' + ', ' +
			'[schema] = s.name, ' +
			'[view]   = v.name, ' +
			'coalesce(r.referenced_database_name, ' + '''' + @Tietokanta + '''' + '), ' +
			'r.referenced_schema_name, ' +
			'r.referenced_entity_name, ' +
			'[column] = r.referenced_minor_name, ' +
			'loadtime= getdate(), ' +
			'[source] = ' + '''' + 'ETL: p_lataa_views' + '''' + ', ' +
			'[username] = USER_NAME() ' +
			'FROM ' + @Tietokanta + '.sys.views v ' +
			'INNER JOIN ' + @Tietokanta + '.sys.schemas s ON v.[schema_id] = s.[schema_id] ' +
			'CROSS APPLY ' + @Tietokanta + '.sys.dm_sql_referenced_entities(QUOTENAME(s.name) + N' + '''' + '.' + '''' + '+ QUOTENAME(v.name), N' + '''' + 'OBJECT' + '''' + ') r ' +
			'WHERE v.name = @Nakyma and r.referenced_minor_name is not null and r.referenced_schema_name is not null ' +
			'END TRY  ' +
			'BEGIN CATCH ' +
			'END CATCH ' +
			'fetch next from views_ into  @Nakyma ' +
			'END ' +
			'close views_ ' +
			'deallocate views_ '

EXEC (@sql)

fetch next from databases_ into  @Tietokanta
END
close databases_;
deallocate databases_;

GO

USE [ANTERO]