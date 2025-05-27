USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[BulkInsertFromCSV]    Script Date: 12.5.2025 14.04.42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[BulkInsertFromCSV]
    @FilePath NVARCHAR(MAX),
    @TableName NVARCHAR(MAX)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    DECLARE @ErrorFile NVARCHAR(MAX)
    DECLARE @Date NVARCHAR(20)
    DECLARE @rowCountBefore INT;
    DECLARE @rowCountAfter INT;
    DECLARE @beforeTimestamp DATETIME;
    DECLARE @afterTimestamp DATETIME;

    -- Step 1: Capture row count and timestamp BEFORE bulk insert
    SET @SQL = N'SELECT @rowCountBeforeOUT = COUNT(*), @beforeTimestampOUT = GETDATE() FROM [sa].' + QUOTENAME(@TableName);

    EXEC sp_executesql @SQL,
        N'@rowCountBeforeOUT INT OUTPUT, @beforeTimestampOUT DATETIME OUTPUT',
        @rowCountBeforeOUT = @rowCountBefore OUTPUT,
        @beforeTimestampOUT = @beforeTimestamp OUTPUT;

    -- Validate rowCountBefore retrieval
    IF @rowCountBefore IS NULL
    BEGIN
        THROW 50004, 'Error: Failed to retrieve @rowCountBefore from dynamic SQL.', 1;
    END;

    -- Step 2: Remove existing tracking row
    DELETE FROM _bulk_insert_tracking
    WHERE table_name = @TableName;

    -- Step 3: Insert tracking row (before insert)
    INSERT INTO _bulk_insert_tracking (table_name, rows_before, before_timestamp)
    VALUES (@TableName, @rowCountBefore, @beforeTimestamp);

    -- Step 4: Perform the bulk insert
    SET @Date = FORMAT(GETDATE(), 'yyyyMMdd_HHmm')
    SET @ErrorFile = 'E:\csv-data\in\errors\' + @TableName + '_' + @Date + '.csv'

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
            RAISERROR(''RaiseError'', 16, 1);
        END CATCH;'
    ;

    EXEC sp_executesql @SQL, N'@FilePath NVARCHAR(MAX)', @FilePath = @FilePath;

    -- Step 5: Capture row count and timestamp AFTER bulk insert
    SET @SQL = N'SELECT @rowCountAfterOUT = COUNT(*), @afterTimestampOUT = GETDATE() FROM [sa].' + QUOTENAME(@TableName);

    EXEC sp_executesql @SQL,
        N'@rowCountAfterOUT INT OUTPUT, @afterTimestampOUT DATETIME OUTPUT',
        @rowCountAfterOUT = @rowCountAfter OUTPUT,
        @afterTimestampOUT = @afterTimestamp OUTPUT;

    -- Step 6: Update tracking with post-insert info
    UPDATE _bulk_insert_tracking
    SET rows_after = @rowCountAfter,
        after_timestamp = @afterTimestamp
    WHERE table_name = @TableName;

    -- Check 1: Table is empty or failed insert
    IF COALESCE(@rowCountAfter, 0) = 0
    BEGIN
        THROW 50001, 'Error: TAULU ON TYHJA! ', 1;
    END;

    -- Check 2: rowCountBefore retrieval failed (covered above)

    -- Check 3: Sudden drop in row count (more than 10%)
    IF COALESCE(@rowCountAfter, 0) < (CAST(COALESCE(@rowCountBefore, 0) AS FLOAT) * 0.9)
    BEGIN
        THROW 50002, 'Error: TAULUN RIVIMAARA ON HUOLESTUTTAVASTI VAHENTYNYT! ', 1;
    END;
END
