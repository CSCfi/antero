USE [ANTERO]
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE Name = N'refresh'
      AND Object_ID = Object_ID(N'dbo.sharepoint_reports_tabular')
)
BEGIN
    ALTER TABLE dbo.sharepoint_reports_tabular
    ADD refresh INT DEFAULT 1;
END

GO
