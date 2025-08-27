USE Koski_SA
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[BulkInsertFromCSV]
    @FilePath NVARCHAR(MAX),
    @TableName NVARCHAR(MAX)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    DECLARE @ErrorFile NVARCHAR(MAX)
    DECLARE @Date NVARCHAR(20)

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
            PRINT ERROR_MESSAGE();
        END CATCH;
    ';

    -- Execute the dynamic SQL statement
    EXEC sp_executesql @SQL, N'@FilePath NVARCHAR(MAX)', @FilePath = @FilePath;
END
