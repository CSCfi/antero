USE ANTERO
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   PROCEDURE [dbo].[BulkInsertFromCSV_new]
    @FilePath NVARCHAR(1000),        -- sisään luettavan tiedoston koko polku
    @DataBase NVARCHAR(255),         -- kohdetietokanta
    @Schema NVARCHAR(255),           -- kohdeskeema
    @TableName NVARCHAR(255),        -- kohdetaulu
    @ErrorPath NVARCHAR(255),        -- bulk insert virhetiedoston kansiopolku esim. E:\csv-data\in\koski\errors\
    @Separator NVARCHAR(10) = N'0x1f' -- erotin esim. '|~'
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE
        @SQL NVARCHAR(MAX),
        @ErrorFile NVARCHAR(MAX),
        @Date NVARCHAR(20),
        @rowCountBefore INT,
        @rowCountAfter INT,
        @beforeTimestamp DATETIME,
        @afterTimestamp DATETIME,
        @FullTableName NVARCHAR(500),
		@FullTableName_string NVARCHAR(500),
        @TrackingTable NVARCHAR(500);

    -- Täydellinen taulun nimi ja seurannan taulun nimi
    SET @FullTableName = QUOTENAME(@DataBase) + '.' + QUOTENAME(@Schema) + '.' + QUOTENAME(@TableName);
	SET @FullTableName_string = @DataBase + '.' + @Schema+ '.' + @TableName;
    SET @TrackingTable = QUOTENAME(@DataBase) + '.dbo._bulk_insert_tracking';

    ----------------------------------------------------------------
    -- STEP 1: Rivilukumäärä ennen latausta
    ----------------------------------------------------------------
    SET @SQL = N'SELECT @rowCountBeforeOUT = COUNT(*), @beforeTimestampOUT = GETDATE() FROM ' + @FullTableName;

    EXEC sp_executesql
        @SQL,
        N'@rowCountBeforeOUT INT OUTPUT, @beforeTimestampOUT DATETIME OUTPUT',
        @rowCountBeforeOUT = @rowCountBefore OUTPUT,
        @beforeTimestampOUT = @beforeTimestamp OUTPUT;

    IF @rowCountBefore IS NULL
    BEGIN
        THROW 50004, 'Error: Failed to retrieve @rowCountBefore from dynamic SQL.', 1;
    END;

    ----------------------------------------------------------------
    -- STEP 2: Poista vanha seurantatieto
    ----------------------------------------------------------------
    SET @SQL = N'DELETE FROM ' + @TrackingTable + N' WHERE table_name = '''+ @FullTableName +''';';
	print (@SQL)
	EXEC sp_executesql @SQL
    ----------------------------------------------------------------
    -- STEP 3: Lisää seurantarivi ennen latausta
    ----------------------------------------------------------------
   SET @SQL = N'INSERT INTO ' + @TrackingTable + N' (table_name, rows_before, before_timestamp)
            VALUES (@tbl, @rowsBefore, @tsBefore);';

	EXEC sp_executesql @SQL,
    N'@tbl NVARCHAR(500), @rowsBefore INT, @tsBefore DATETIME',
    @tbl = @FullTableName,
    @rowsBefore = @rowCountBefore,
    @tsBefore = @beforeTimestamp;

    ----------------------------------------------------------------
    -- STEP 4: BULK INSERT -lataus
    ----------------------------------------------------------------
    SET @Date = FORMAT(GETDATE(), 'yyyyMMdd_HHmm');
    SET @ErrorFile = @ErrorPath + @TableName + '_' + @Date + '.csv';

    SET @SQL = N'
    BEGIN TRY
        TRUNCATE TABLE ' + @FullTableName + N';
        BULK INSERT ' + @FullTableName + N'
        FROM ''' + @FilePath + N'''
        WITH (
            CODEPAGE = ''65001'',
            ROWTERMINATOR = ''\n'',
            FIELDTERMINATOR = ''' + @Separator + N''',
            FIRSTROW = 2,
            BATCHSIZE = 10000,
            MAXERRORS = 25,
            ERRORFILE = ''' + @ErrorFile + N'''
        );
    END TRY
    BEGIN CATCH
        RAISERROR(''RaiseError'', 16, 1);
    END CATCH;
    ';
    EXEC sp_executesql @SQL;

    ----------------------------------------------------------------
    -- STEP 5: Rivilukumäärä latauksen jälkeen
    ----------------------------------------------------------------
    SET @SQL = N'SELECT @rowCountAfterOUT = COUNT(*), @afterTimestampOUT = GETDATE() FROM ' + @FullTableName;

    EXEC sp_executesql
        @SQL,
        N'@rowCountAfterOUT INT OUTPUT, @afterTimestampOUT DATETIME OUTPUT',
        @rowCountAfterOUT = @rowCountAfter OUTPUT,
        @afterTimestampOUT = @afterTimestamp OUTPUT;

    ----------------------------------------------------------------
    -- STEP 6: Päivitä seurantataulu
    ----------------------------------------------------------------
    SET @SQL = N'UPDATE ' + @TrackingTable + N'
                SET rows_after = @rowsAfter,
                    after_timestamp = @tsAfter
                WHERE table_name = @tbl;';
    EXEC sp_executesql
        @SQL,
        N'@rowsAfter INT, @tsAfter DATETIME, @tbl NVARCHAR(500)',
        @rowsAfter=@rowCountAfter, @tsAfter=@afterTimestamp, @tbl=@FullTableName;

    ----------------------------------------------------------------
    -- TARKISTUKSET
    ----------------------------------------------------------------
    IF COALESCE(@rowCountAfter, 0) = 0
    BEGIN
        THROW 50001, 'Error: TAULU ON TYHJA! ', 1;
    END;

    IF COALESCE(@rowCountAfter, 0) < (CAST(COALESCE(@rowCountBefore, 0) AS FLOAT) * 0.99)
    BEGIN
        THROW 50002, 'Error: TAULUN RIVIMAARA ON HUOLESTUTTAVASTI VAHENTYNYT! ', 1;
    END;
END;
GO
