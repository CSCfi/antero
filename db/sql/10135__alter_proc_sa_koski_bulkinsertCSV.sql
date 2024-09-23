USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER    PROCEDURE [dbo].[BulkInsertFromCSV]
    @FilePath NVARCHAR(MAX),
    @TableName NVARCHAR(MAX)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    DECLARE @ErrorFile NVARCHAR(MAX)
    DECLARE @Date NVARCHAR(20)
	-- For error handling
	DECLARE @rowCountBefore INT;
	DECLARE @rowCountAfter INT;
	DECLARE @beforeTimestamp DATETIME;
	DECLARE @afterTimestamp DATETIME;

	-- Step 1: Capture the row count and timestamp before the bulk insert
	SET @sql = N'SELECT @rowCountBeforeOUT = COUNT(*), @beforeTimestampOUT = GETDATE() FROM [sa].' + QUOTENAME(@tableName);

	EXEC sp_executesql @sql,
		N'@rowCountBeforeOUT INT OUTPUT, @beforeTimestampOUT DATETIME OUTPUT',
		@rowCountBeforeOUT = @rowCountBefore OUTPUT,
		@beforeTimestampOUT = @beforeTimestamp OUTPUT;

	-- Step 2: Delete the existing row for this table in the _bulk_insert_tracking table (if exists)
	DELETE FROM _bulk_insert_tracking
	WHERE table_name =  @tableName;

	-- Step 3: Insert a new row in the _bulk_insert_tracking table with the data before the bulk insert
	INSERT INTO _bulk_insert_tracking (table_name, rows_before, before_timestamp)
	VALUES (@tableName, @rowCountBefore, @beforeTimestamp);

	-- Step 4: Perform the bulk insert operation
    -- Get current date and time in YYYYMMDD_HHMM format
    SET @Date = FORMAT(GETDATE(), 'yyyyMMdd_HHmm')

    -- Construct the error file path
    SET @ErrorFile = 'E:\csv-data\in\koski\errors\' + @TableName + '_' + @Date + '.csv'

    -- Construct the BULK INSERT statement
    SET @SQL = N'
        BEGIN TRY
            TRUNCATE TABLE [sa].' + QUOTENAME(@TableName) + ';
            BULK INSERT [sa].' + QUOTENAME(@TableName) + N'
            FROM ''' + @FilePath + N'''
            WITH (
                CODEPAGE = ''65001'',
                ROWTERMINATOR = ''\n'',
                FIELDTERMINATOR = ''0x1f'',
                FIRSTROW = 2,
                BATCHSIZE = 10000,
                MAXERRORS = 25,
                ERRORFILE = ''' + @ErrorFile + N'''
            );
        END TRY
        BEGIN CATCH
            -- Handle errors as needed
			RAISERROR(''RaiseError'', 16, 1);
        END CATCH;
    ';

    -- Execute the dynamic SQL statement
    EXEC sp_executesql @SQL, N'@FilePath NVARCHAR(MAX)', @FilePath = @FilePath;

	-- Step 5: Capture the row count and timestamp after the bulk insert using dynamic SQL
	SET @sql = N'SELECT @rowCountAfterOUT = COUNT(*), @afterTimestampOUT = GETDATE() FROM [sa].' + QUOTENAME(@tableName);

	EXEC sp_executesql @sql,
		N'@rowCountAfterOUT INT OUTPUT, @afterTimestampOUT DATETIME OUTPUT',
		@rowCountAfterOUT = @rowCountAfter OUTPUT,
		@afterTimestampOUT = @afterTimestamp OUTPUT;

	-- Step 6: Update the _bulk_insert_tracking table with the data after the bulk insert
	UPDATE _bulk_insert_tracking
	SET rows_after = @rowCountAfter,
		after_timestamp = @afterTimestamp
	WHERE table_name = @tableName;

	-- Check 1: If @rowCountAfter is 0, raise an error
	IF @rowCountAfter = 0
	BEGIN
		THROW 50001, 'Error: TAULU ON TYHJA! ', 1;
	END;

	-- Check 2: If @rowCountAfter is 10% smaller than @rowCountBefore, raise an error
	IF @rowCountAfter < (@rowCountBefore * 0.9)
	BEGIN
		THROW 50002, 'Error: TAULUN RIVIMAARA ON HUOLESTUTTAVASTI VAHENTYNYT! ', 1;
	END;
END
