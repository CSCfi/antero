USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_procedures]    Script Date: 27.7.2022 8:21:02 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_procedures]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_procedures]    Script Date: 27.7.2022 8:21:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_procedures] AS


declare @sql nvarchar(max)

declare @Tietokanta nvarchar(300);

declare databases_ cursor for SELECT DISTINCT referenced_database_name FROM ANTERO.dbo.[views] UNION SELECT 'VipunenTK_DW'

open databases_;
fetch next from databases_ into  @Tietokanta

TRUNCATE TABLE [ANTERO].[dbo].[procedures]

WHILE @@FETCH_STATUS = 0

BEGIN

SET @sql = 'declare @Proseduuri nvarchar(300) ' +
		   'declare @Skeema int ' +
		   'declare procedures_ cursor for SELECT DISTINCT name, schema_id FROM ' + @Tietokanta + '.sys.procedures ' +
		   'open procedures_ ' +
		   'fetch next from procedures_ into  @Proseduuri, @Skeema ' +
		   'WHILE @@FETCH_STATUS = 0 ' +
		   'BEGIN ' +
		   'BEGIN TRY '+ 
		   'INSERT INTO [ANTERO].[dbo].[procedures] ' +
		   'SELECT DISTINCT' +
		   '''' + @Tietokanta + '''' + ' as [database], ' +
		   '(SELECT TOP 1 s.name FROM ' + @Tietokanta + '.sys.schemas s WHERE s.schema_id = @Skeema) as [schema], ' +
		   '@Proseduuri as [procedure], ' +
		   'coalesce(r.referenced_database_name, ' + '''' + @Tietokanta + '''' + '), ' +
		   'case when left(r.referenced_entity_name,1) = ' + '''' + 'd' + '''' + ' and ' + '''' + @Tietokanta + '''' + ' = ' + '''' + 'ANTERO' + '''' + ' then ' + '''' + 'dw' + '''' + ' else r.referenced_schema_name end, ' +
		   'r.referenced_entity_name, ' +
		   'r.referenced_minor_name as [column], ' +
		   'loadtime = getdate(), ' +
		   '[source] = ' + '''' + 'ETL: p_lataa_procedures' + '''' + ', ' +
		   '[username] = USER_NAME() ' +
		   'FROM ' + @Tietokanta + '.sys.dm_sql_referenced_entities ((SELECT concat(concat((SELECT TOP 1 s.name FROM ' + @Tietokanta + '.sys.schemas s WHERE s.schema_id = @Skeema), ' + '''' + '.' + '''' + '), @Proseduuri)),' + '''' + 'OBJECT' + '''' + ') r WHERE r.referenced_minor_name is not null ' + 
		   'END TRY ' +
		   'BEGIN CATCH ' +
		   'END CATCH ' +
		   'fetch next from procedures_ into  @Proseduuri, @Skeema ' +
		   'END ' +
	       'close procedures_ ' +
		   'deallocate procedures_ '

EXEC (@sql)

fetch next from databases_ into  @Tietokanta
END
close databases_;
deallocate databases_;

GO

USE [ANTERO]